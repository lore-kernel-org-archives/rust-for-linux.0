Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B530DED7;
	Fri,  6 Feb 2026 21:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412306; cv=none; b=dm/P1H64QYNVlz+eVd+xpuno2g9IFGnLZJn6Y+2X52+HOPCbILfedCca8nO08Phmau44mXn0DqgY9lmO0JlOv7rjQqzzeelwfYVLWayIWQ0swXltUVc5Pi5eA/jIzaS9hqpIiXhJPtvAVJnE2iNGgM+eOiXK3Dy8kH5Aum/m9A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412306; c=relaxed/simple;
	bh=SUnEj4f1l9mHuLlzJWz0dNzh+/snH5Ql51wel6NI7LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZJBHizaZXOYEqS0gWijjatcyB+TGirppr2SIjemMQ8lsiI5vO8qS6TpieMyNwXjhASUkC3FzXA3TDy4I4Q5ysab1rWQrQCKUie5OK3xuB+7nkUT5FbqkfJcXUeoZFlv6sAcdPN0spJteKMqy1Tr/KLC8EcY2mgGprCNovpKMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elL/ARi/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elL/ARi/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5747BC19423;
	Fri,  6 Feb 2026 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412305;
	bh=SUnEj4f1l9mHuLlzJWz0dNzh+/snH5Ql51wel6NI7LE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=elL/ARi/Mfy6/8OMFNs8uiRAErlt7a0EsxsJ96Y8ZVMEUAaysUtfZY2sG6o5ng67K
	 3V1pS2IbXdWBX+Eg9MTVdG0W5b6W4i69faAmQKVTOgvL9Q35sjaD7kLroqd8t3ZGgK
	 7QJq4sNIooVcA27haeMPsZPq+ORT5o+xPNqHjLLNDhT9vw5Y9bIVLoTjLovOpDK1fd
	 tp8RupLbxnAVDk/51MnYgE8W5OhZDiOr/VTUHPKQCVbj499SnSe4EH9MsPQwguBqaZ
	 CYRmNLiw8z9HcwnNdxOYYTlRUEYx20j9yssvpQEbaDh/Wo++umBNHfF0x9oCHZ9tZg
	 Ru1hGf12XWPtw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:52 +0100
Subject: [PATCH v2 06/11] rust: xarray: simplify `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-6-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=SUnEj4f1l9mHuLlzJWz0dNzh+/snH5Ql51wel6NI7LE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljmYZEvBGqQzuxdMlWfzFpY+l8tlo4gbcojX
 j4SxFfq6vqJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY5gAKCRDhuBo+eShj
 d/jhEACk9AnNcXcMjo9QkvvewgUgKs55e+8UtqRMLkwtnf1JovlHrP0FgBD3dAp7YpEIT2jfiiZ
 yIINVdEkcxkz6fGc3CigphLMrBcvmc/HMVCD+Tdv/bs48oEJlEzuSWjy192ko7PkXukIr8/YqVU
 L4aNhXo4z0xRfMMzQpxQVWgS4AeUcGMRF8txn16M1hZPOl0+iZuWfuaRqk9lQcYjFReFcMqbana
 w6PaI3C1MfNSbtLKRpBelVfKz8oJeysR/JZy9BlNnOBpA8W/iJzHua8iYh81VsB3/6Rt0XTEfJF
 2r8kUBsUUOeDwfWn4h5vSxFDqvaKDre+Q8zk3vCCTiaT7snf9JpLnuJ+laCwsPkdPQdC0uCgMis
 2wd9F3+rOrcSGbFD2xR/j9HmvZ5PcUKLz9W2cEUwZ/ljm5liiUs5Ef3tjhZ0R+hO10+OJ/3mfKa
 QTorR+MfYJpVUkk2713dvuD/BaKrSzSS1PebsCShqovjUsGt7zwYWBJdXtFbaqsg8V+Pv+Qof26
 jsTwB2Kiy7CbN5xWJaiF+XwU1TM9QmbALEuY+N/3VDU7jR3SmQBgZhFUpHty3554DslLC4TPyGm
 JJFYMn07uAzgxa0Aujy3IvMOZhTwtycNUtGQNu1OUZsAWoUAuYxwX8DcZ6w1uA62vd7ues2FMOD
 upjfZA9Vog25OyA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Simplify the implementation by removing the closure-based API from
`Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index eadddafb180ec..e654bf56dc97c 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -211,12 +211,8 @@ fn from(value: StoreError<T>) -> Self {
 }
 
 impl<'a, T: ForeignOwnable> Guard<'a, T> {
-    fn load<F, U>(&self, index: usize, f: F) -> Option<U>
-    where
-        F: FnOnce(NonNull<c_void>) -> U,
-    {
-        let mut state = XArrayState::new(self, index);
-        Some(f(state.load()?))
+    fn load(&self, index: usize) -> Option<NonNull<c_void>> {
+        XArrayState::new(self, index).load()
     }
 
     /// Checks if the XArray contains an element at the specified index.
@@ -242,18 +238,17 @@ pub fn contains_index(&self, index: usize) -> bool {
 
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


