Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE152E2F0E;
	Wed,  3 Dec 2025 22:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800861; cv=none; b=hMYNIsBtJ+heJmlW9XQmLmAbJsiN1ZOmqDYXqhW5sba4nMEe4EUC+pna57MZvyCI5W2zgZZX6v9hCXHSmetUkEgYR91eObsoyEPsxmBy5GaFp6eZGVoYorypIkTh3l6ug6bkbImwPKrNTJZghKk+IqWARStL/Xfpe9cBAfGUQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800861; c=relaxed/simple;
	bh=Vhypvds1yvFWGBDtAQE1W2d/uxGhxuDAxur/sfhCxJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVa+j+C+CB+3uHg55ThuWM7GrxW29FwTmKM+e/yDDyRotHdvQJxFmdtIRoFfPXbhwn9NuEXTsX7BCv0p78Z5+fN+xHhiD+1gwDCzqETKK+3A+hZmE1cVVJF9WfgpLw53dImXoZLIXTQPlzoULRonTTMIL5INToO+Xvd25INVS88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+rkN+5+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+rkN+5+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AF4C4CEF5;
	Wed,  3 Dec 2025 22:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800860;
	bh=Vhypvds1yvFWGBDtAQE1W2d/uxGhxuDAxur/sfhCxJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g+rkN+5+9Zj6Kklsa6v2qJZZw0diJ7Zi5Lr0vTPz66NIVh/1kbZMCt9TGbtwZDO6S
	 hH5a6DeHSHbcvAUzL8ty25q8YWyN+4M3F7JZsrb0uo88ooah2JymnvMMLyU9Bpwjkn
	 L8K7h3wfYtlRzAPmg7PhOyPaHR0RGC+ypPc/dvpH1hImXS7i/E3O1h6CPKCTt0EWhM
	 hiY3zmugsm8a2F8ttmeKjYvHDiGufc6dxzxb54nSZME5tHy6ObSv6uy01KJ7OYcJ/i
	 3v1PgERI3rmUeJY2hda9N4jrmci/HFbcyxZ44v4/RXG6p5uJ9hQBKVT1RQZw4Kl9xc
	 m3lA/yjl9Ty0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:36 +0100
Subject: [PATCH 06/10] rust: xarray: simplify `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Vhypvds1yvFWGBDtAQE1W2d/uxGhxuDAxur/sfhCxJw=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkvXrKRMLN78CDUJHyCaRMTTddgQYNbRMGd0
 KZXNmMzjLGJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5LwAKCRDhuBo+eShj
 d7w7EACPMTAQjYEq5yx49FDr0w4PU7trnOWIUvIYXb7K3otLjk3ln3v4WsZfd8ORz74k9/sIf/Q
 Vi3PMpSn3mp9fNYAgH4P0CtPz9I6lyOEvVX6rHZS9ciiMkzNEJ4A7HrG+Mmcm+NC79+V7nH5f96
 nI0xHyKuqf+HW9auDVUUud1AEfxzpI3KLgjF8uuxvB/Wm/PmqMz+BYrAOkLs53OXMMP7nsPhwLu
 huJoRPH3NCmE2jOLwuT3ZaMf3mRsLvIivYGP5Mn7eumia58Hny6ll753ERNjXwC8zAcWfGrnn6Y
 98CjoWZa8wdq32rMci2Yk/QUGiWL7Uga3TjaHcvkPiS/eS7HQPHgBtG3Ao6k/u/Nu25/HOkAVw+
 GR1+F3D2LxBhEJo4IFT6sfQGQhjVqRq6wofY4CgcPWWU5dWcNRsCJyMI50yOL2YctbO+q2c8gPb
 yLvBHxmMJRgkQZXxY1AzRewGt4EoVfTmjrXf7iexgpxdKOVvxZvb+pphDT5pQHVuQSyr3LyBtgF
 HomR8budjqf5aqDUL5YmP5aOEiTpVbQUG9jTykRsApPfmtbz8MRELf1Eeb49dGamYm04V+W1TqH
 ONFbHO5P5FyPlbvIFd1gqwVNG40wo3csre23XabZmZGZkyP80kY0puFvKQ8NYm/Kw7ArP8fqyNF
 w/sODRxQDmRKrtQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Simplify the implementation by removing the closure-based API from
`Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 0f69a523b72bf..ca97134ba2bd0 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -211,16 +211,12 @@ fn from(value: StoreError<T>) -> Self {
 }
 
 impl<'a, T: ForeignOwnable> Guard<'a, T> {
-    fn load<F, U>(&self, index: usize, f: F) -> Option<U>
-    where
-        F: FnOnce(NonNull<c_void>) -> U,
-    {
+    fn load(&self, index: usize) -> Option<NonNull<c_void>> {
         let mut state = XArrayState::new(self, index);
         // SAFETY: `state.state` is always valid by the type invariant of
         // `XArrayState`.
         let ptr = unsafe { bindings::xas_load(&raw mut state.state) };
-        let ptr = NonNull::new(ptr.cast())?;
-        Some(f(ptr))
+        NonNull::new(ptr)
     }
 
     /// Checks if the XArray contains an element at the specified index.
@@ -246,18 +242,17 @@ pub fn contains_index(&self, index: usize) -> bool {
 
     /// Provides a reference to the element at the given index.
     pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
-        self.load(index, |ptr| {
-            // SAFETY: `ptr` came from `T::into_foreign`.
-            unsafe { T::borrow(ptr.as_ptr()) }
-        })
+        let ptr = self.load(index)?;
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        Some(unsafe { T::borrow(ptr.as_ptr()) })
     }
 
     /// Provides a mutable reference to the element at the given index.
     pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
-        self.load(index, |ptr| {
-            // SAFETY: `ptr` came from `T::into_foreign`.
-            unsafe { T::borrow_mut(ptr.as_ptr()) }
-        })
+        let ptr = self.load(index)?;
+
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
     }
 
     /// Removes and returns the element at the given index.

-- 
2.51.2


