Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1E470F38;
	Thu,  8 Jan 2026 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876211; cv=none; b=BZarwpsajhDk2XbAfNeW6Dzpccw/53mDa4Rdv3NAggTOpivM4DP+qB/apGgKdVZp0T1p/c8bx1cX0uL6ayILEfGU3O5DxW+RN4K3cGyry783vNMBl7To4eCATv7802KHmHde7NiKl67G219g5zVoQtyw+w9abEx95EO5lO/t7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876211; c=relaxed/simple;
	bh=+dBrUrGPifP5GMLc2qOaxhBTe6W7N4MvXsu86B/bdiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3I18Bc+x/OG1nxNX/jiJVc+rDXibY+0fieNGAIO7BLxuwzVcDwzLU4JSWSmOhGibhFBU0AzQBWUhUxLWmt10oyb2F00D3THvdDFunZ5pQ83uHyg3FupRJ4tmeTXouzBTWlr7RF+M5Ze2cj6No1eXdf4D/78dt/pB/tBk8mV45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eC5Xj5Kl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eC5Xj5Kl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FECFC16AAE;
	Thu,  8 Jan 2026 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767876211;
	bh=+dBrUrGPifP5GMLc2qOaxhBTe6W7N4MvXsu86B/bdiw=;
	h=From:To:Cc:Subject:Date:From;
	b=eC5Xj5KlZ0pObx9ht+ZA1kELBpjhY5XCUMdOhw/v5MUtqfYntYyfGMIVqAQDBc9Zh
	 DxW9talaNVQMC+1pQNmXX7b7pUuDnvwANQCMDIwZ1JaJCRi93WqWsRZ2m/oB+e7939
	 r/XYyAKzo6CLZjQ3a6nvli8RUqlL8GYNw8l8Jtc70PP4PDD5Ajh+MlQA9I/eTuaghc
	 nhzNC3XTrkA5Kj7QIDV6KMJcJbKfuxIsD8eIaJZHrGbj5FBP2JjhRSFw8flc8jIp28
	 LIAXtbY95QbuVXbcM98PwXm372j8Je/3W/QaMcjAD8Zm8NnkbDvCJV/6+gf68mVBeR
	 kHoYbZMKsbFqw==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Oleksandr Babak <alexanderbabak@proton.me>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] rust: pin-init: Implement `InPlaceWrite<T>` for `&'static mut MaybeUninit<T>`
Date: Thu,  8 Jan 2026 13:43:16 +0100
Message-ID: <20260108124318.3142999-1-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Babak <alexanderbabak@proton.me>

This feature allows users to use `&'static mut MaybeUninit<T>` as a
place to initialize the value. It mirrors an existing implemetation
for `Box<MaybeUninit>`, but enables users to use external allocation
mechanisms such as `static_cell` [1].

Signed-off-by: Oleksandr Babak <alexanderbabak@proton.me>
Link: https://crates.io/crates/static_cell [1]
[ Added link to `static_cell` - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
This is the entire pin-init update this cycle. (excluding the syn
patches, which I will send soon)
---
 rust/pin-init/src/lib.rs | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 8dc9dd5ac6fd..ea59c86a9108 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1536,6 +1536,33 @@ pub trait InPlaceWrite<T> {
     fn write_pin_init<E>(self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E>;
 }
 
+impl<T> InPlaceWrite<T> for &'static mut MaybeUninit<T> {
+    type Initialized = &'static mut T;
+
+    fn write_init<E>(self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
+        let slot = self.as_mut_ptr();
+
+        // SAFETY: `slot` is a valid pointer to uninitialized memory.
+        unsafe { init.__init(slot)? };
+
+        // SAFETY: The above call initialized the memory.
+        unsafe { Ok(self.assume_init_mut()) }
+    }
+
+    fn write_pin_init<E>(self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
+        let slot = self.as_mut_ptr();
+
+        // SAFETY: `slot` is a valid pointer to uninitialized memory.
+        //
+        // The `'static` borrow guarantees the data will not be
+        // moved/invalidated until it gets dropped (which is never).
+        unsafe { init.__pinned_init(slot)? };
+
+        // SAFETY: The above call initialized the memory.
+        Ok(Pin::static_mut(unsafe { self.assume_init_mut() }))
+    }
+}
+
 /// Trait facilitating pinned destruction.
 ///
 /// Use [`pinned_drop`] to implement this trait safely:
-- 
2.51.2

