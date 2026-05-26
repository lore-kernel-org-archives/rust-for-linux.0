Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F37421A17;
	Tue, 26 May 2026 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820760; cv=none; b=OeGNJGTaGUX/5lIGtlU4LjNh0ZTjxSTLTxZzNVS0Fol+Sffhd5qI4pD2f6ZsQf8dCgZ4hyxh93zi18RB5dnfqTk22IXlHh5pPwszSzI8+Ucf3G96Pp7F8PLgq8nPCS6nE56DQ7Mv/7nAgrDsQ6Xq6jVHjBpiWWaPcSoE/UXlvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820760; c=relaxed/simple;
	bh=uYuX75K78hn7XCGsIeT0S73HSWjlvPu++DoAz4YF2e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8YWX+BE4mgyyrPqs1BwjULU1JBwbFasAekw+lEz7tksSs1U0w9PoWEKfgeAJ7OzKH7wQDhkxpN/lng/6OHK2YHjusccmV6LKZyypEiL3I9ZUx+XCJCOrFYTuvTInqowoyhptEaSGCi9zdrvCU55+TjvIxXKqSY/AF79Ie0i80Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkGjXS+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkGjXS+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606981F00A3F;
	Tue, 26 May 2026 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820757;
	bh=HfphQOKmTvqT1yBrMnbtpb3V6YzN4TXyixD8aCJLnSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TkGjXS+CSSjmhT25/FvkHJhopHWrUmxUC/BtpB5pp4+pKMsKsKQ2p1GJUqNankBAP
	 9gcMXoq52l1sew4eRLyY4jv9Q4CIyeCgSCKWp0RiJq2fxjKqRcBWp3vfFNUPlxwQZ3
	 LOtqunIcc2m3mH6h9GbUVdr9afek7QY00+nhPIqaa7pUmkcneYYCT96EVOzzy+L06X
	 Zi9X0xLO8U/d+njSg+GraP4gHTvxhpLJ5q2k2Z5lhbred4lz7E8VzMvUsIaAIfyaZ8
	 W8MGwM3U02GAnE/paeXoxNM1gjbCSr9mIRVUK962mvL782UmLhSm79n98hyIfPfPaj
	 OrR1Y8nrD0DjA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 14:39:08 -0400
Subject: [PATCH v2 2/5] rust: binder: enable `clippy::ptr_as_ptr` lint
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-binder-strict-provenance-v2-2-a41d89c29bc5@kernel.org>
References: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
In-Reply-To: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3967; i=tamird@kernel.org;
 h=from:subject:message-id; bh=uYuX75K78hn7XCGsIeT0S73HSWjlvPu++DoAz4YF2e8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiLy4ouWZt+CO4i7kyo8PrkxizzvY1mVKpsbdX2oi/P
 vSo+XdHx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKlWaGdkeKXFoF+Qcuw9+4yz7BrJxmJeN5r2cJcl3qxLUo3KmmYow8hwwD2q84r
 kia0xOrZ2fZG+2/XuFDzOrZdcOs10TuBq9j+sAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:

> Though `as` casts between raw pointers are not terrible,
> `pointer::cast` is safer because it cannot accidentally change pointer
> mutability or cast the pointer to other types like `usize`.

Apply the required changes and enable the lint in the Binder Rust driver
-- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr [1]
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/defs.rs             | 4 ++--
 drivers/android/binder/page_range.rs       | 6 +++---
 drivers/android/binder/rust_binder_main.rs | 7 +------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index 33f51b4139c7..354c32c39e83 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -165,8 +165,8 @@ impl BinderTransactionDataSecctx {
     pub(crate) fn tr_data(&mut self) -> &mut BinderTransactionData {
         // SAFETY: Transparent wrapper is safe to transmute.
         unsafe {
-            &mut *(&mut self.transaction_data as *mut uapi::binder_transaction_data
-                as *mut BinderTransactionData)
+            &mut *((&mut self.transaction_data as *mut uapi::binder_transaction_data)
+                .cast::<BinderTransactionData>())
         }
     }
 }
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index e54a90e62402..927b0802e80d 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -571,7 +571,7 @@ pub(crate) unsafe fn read<T: FromBytes>(&self, offset: usize) -> Result<T> {
         unsafe {
             self.iterate(offset, size_of::<T>(), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
-                let obj_ptr = (out.as_mut_ptr() as *mut u8).add(out_offset);
+                let obj_ptr = out.as_mut_ptr().cast::<u8>().add(out_offset);
                 // SAFETY: The pointer points is in-bounds of the `out` variable, so it is valid.
                 page.read_raw(obj_ptr, offset, to_copy)?;
                 out_offset += to_copy;
@@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
         unsafe {
             self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
-                let obj_ptr = (obj as *const T as *const u8).add(obj_offset);
+                let obj_ptr = (obj as *const T).cast::<u8>().add(obj_offset);
                 // SAFETY: We have a reference to the object, so the pointer is valid.
                 page.write_raw(obj_ptr, offset, to_copy)?;
                 obj_offset += to_copy;
@@ -712,7 +712,7 @@ fn drop(self: Pin<&mut Self>) {
 
     {
         // CAST: The `list_head` field is first in `PageInfo`.
-        let info = item as *mut PageInfo;
+        let info = item.cast::<PageInfo>();
         // SAFETY: The `range` field of `PageInfo` is immutable.
         range_ptr = unsafe { (*info).range };
         // SAFETY: The `range` outlives its `PageInfo` values.
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index d487638266e3..fa28697982d3 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -6,12 +6,7 @@
 
 #![crate_name = "rust_binder"]
 #![recursion_limit = "256"]
-#![allow(
-    clippy::as_underscore,
-    clippy::ref_as_ptr,
-    clippy::ptr_as_ptr,
-    clippy::cast_lossless
-)]
+#![allow(clippy::as_underscore, clippy::ref_as_ptr, clippy::cast_lossless)]
 
 use kernel::{
     bindings::{self, seq_file},

-- 
2.54.0

