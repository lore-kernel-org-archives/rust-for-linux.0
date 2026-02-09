Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B2E37BE78;
	Mon,  9 Feb 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647988; cv=none; b=B7OnlfKHujulMtLw6mDpE51Z+HVNkT/M6iVK7A6wXheNVfRSUyf4tKeVwIkVGwoBo0iIHFvLCc7ZjaM5Pge38PhNsSQ4HfrKO2fidna0ywUOXKUWUV9309unqWidfFtoXvlQogSBeUHvOml4p1G1eifh7lH1FJ6dIC7v1dEWLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647988; c=relaxed/simple;
	bh=SUnEj4f1l9mHuLlzJWz0dNzh+/snH5Ql51wel6NI7LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVryf4lUm8agEcCnraR/5VVtubHu+mT/vvbxY/4uY+3RZN3MVct8JWxBi7MHPKmh77sVVBrqRiU5vSjpq6rU2PW3J04TS68N/WP/ZPn4kmMR5nrUzi49CoiGTYhLKnWnpix8Z1v5NBK5YMEPHmrWNW0ZdEdJZtUeDLfxZIkz190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNMvntLz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNMvntLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A21C19422;
	Mon,  9 Feb 2026 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647987;
	bh=SUnEj4f1l9mHuLlzJWz0dNzh+/snH5Ql51wel6NI7LE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GNMvntLzZ2YxBuqe49g3RUNZCw6QPe0fv8HqUkyAajaigNKTo50KAkjyYvbdCbgPC
	 Ow0bOv8NCQOrPKJUiXzlg6w+tFmXrHx9MGDCtGalADkaZk3jX5QpGXqxlfnCSpfWLq
	 u43MgZRFVnV3M2AcH5AbrYFFU4wPIoo7VlGwR0LjITIk5J4+zlAkAmuQxsxz9bhsyO
	 wKyvORoVhnS6q5TAy+J3W3DF1FrVPTD09nceFC0kTYUien2RPzfa1BXJ0PqNighoeG
	 6DjJJcGVCtqV7xiKpKEf85eE/qzvawVTXt/AP3bFdMSysLgGEYtt7iUGGkQxlAtd56
	 kLDDvwXNSJUQg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:11 +0100
Subject: [PATCH v3 06/12] rust: xarray: simplify `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-6-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
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
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFaKdOChhRuevCXo/AyFuqJpjt9pI2F9DYSY
 GB02zlFWYqJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxWgAKCRDhuBo+eShj
 dzDZD/92MQDGevDXbOVb/99y5TakQLCirDQL22LaLohFi7zXhh3Sk30nKFNQWW2EI02c/GE3R1V
 Z6EDG5Vp5Me0WyCQecPlnATdKXOdn2r34nc0rhIO20n1Jn89B4QAUB++YtWLTwT4vESv4B6r6qU
 Ms+5lXL2uAdKHD2EZc9F+I89JzMRJ6CGdhn48XsdHTXufxLGo2gmtKGVE0hTfGRAW8nyhlBbt3l
 dgZSoEmEOZFV5EwStKxhoNh4K1DZ3xGgjbJK+BPVBNRTU+BEC3z4T5lQOOglFuegkiu2BIBwQ3O
 5w/MQWZlBbYrrcQd/CGdSLmTmhOoZouxKvyJc/OK9OOuXmacPuaZZjAdPL48sVDBeEF2FimAU1l
 NUpA0UKfsNRTWFRlGTvl6keLMEPRDA0UHNZhwntuZI7efvLcWDFAwgikoNsZPeW69NV5Ug7a8W8
 YIWjGbfYE1GwF5Ewsl56Fxjo9NaEP8X2EbDEtNcEvpLmXSfE2NOKwsr4EiwIoSBbUqUi5fyQtRg
 FDQJmqz7iGKIkYEh3ufL0aB/XjVrf9Mi1xhn8pbYlT2YqScSYAZTHQnLlsc3b79IMc4M+xn9qrF
 UK9jaydcY0Z2kUTpBMERJPQew4QWcfB9ZmFK+KcyMk5RfEE3CQ1BcrZHUhYqK0ZgClNrm64x0Vp
 L6BjmJfPZxCL7uQ==
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


