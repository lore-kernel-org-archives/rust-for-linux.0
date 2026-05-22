Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB39407575;
	Fri, 22 May 2026 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469994; cv=none; b=o4YWHSF+jeoCuO+8EA8I/xkArUaa57CB4tA/BDB/BFWFOynlhkcu9ohKhiu0Y8g+omLurtdpaLY7o+zNjbUzu0Eg9ZXH+H7koIk00jIIBKQr5xanvm/MRZ7n5EoBjheJHdKOnbl96+XEDKd4XfeWxldIR+y02asRw+lh1Tn+OU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469994; c=relaxed/simple;
	bh=zeqj+9t0L5xdRRSqEE/HLdnKiiFyO9hUXW2GPEDwynw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aw56LSDVSvD91SZEuYzi01X3EA/OE4M4GzS5JC7YH/AyVDylbNk3C/XcUkND2cbQSEQmIYfQArrQ/1VROFgRxzFFxKnoOzIOHS1/jSfogVniAzuXDWroKsnW4BP3DMIhdvAMiMv/UnTcEFEDrxqiv5EbxALgD67ELpSvyBiQm5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEsSQBwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEsSQBwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EF71F000E9;
	Fri, 22 May 2026 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779469993;
	bh=EHxaSfVmkdyCIDw8kkg+n1bEmvVR632xN69mYs8Qnhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FEsSQBwDJsl/Cgpn68SUtJIx0lfHeGR1zXp8+tbaj/l09KRYH9DiJvpsVrbnZxZ+t
	 VrkjkCy8ii/nojsOGzYz8VunBz6dpM/hro7zVqhwIhqaVpJQMWCCIFRY5821qJb9qe
	 KxYOJXsGAcdD/hO11iyKLgRktsCSt67LOBjM5zot6CirXDjcu1Ek8MeK6yfnOZ4giC
	 BLLQkmcaKhEyw+KjXYTcIOX6IorGvzN7bz9w1td8DsLiVdxwMM2V3b+sR99NiEDnrV
	 KYVV40YsgLe1NnHRkpTiqYwFY43rH1VInG3MmcJd+P8pqM2pvVK/a8Haoi2M4YlgKV
	 IlYxvhxOHjRfA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 22 May 2026 19:12:49 +0200
Subject: [PATCH 4/6] rust: binder: enable `clippy::ref_as_ptr` lint
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-binder-strict-provenance-v1-4-3d6e9406e864@kernel.org>
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3682; i=tamird@kernel.org;
 h=from:subject:message-id; bh=zeqj+9t0L5xdRRSqEE/HLdnKiiFyO9hUXW2GPEDwynw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfdNvqWlkrJ7RuOFCaLaZZdUUBpOdXBr/o1wFY3VEf
 YzsLcM7JrIwiHExWIopsiSKHtqbnnp7j2zmu+Mwc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6BjjEDF6cATPWfd4wMayft4L82IfHGz87v6x8/nTfjr+31U2Z3tiTG+uxati2fgYvhn+2l5ft
 PMbIuLvna0rdc49ntM77GvoFswc31E71imGbMYQMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:

> Using `as` casts may result in silently changing mutability or type.

While this does not eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize. It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the changes
and enable the lint in the Binder Rust driver -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/node.rs             | 2 +-
 drivers/android/binder/page_range.rs       | 4 ++--
 drivers/android/binder/rust_binder_main.rs | 2 +-
 drivers/android/binder/trace.rs            | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index d710940c3c8f..a4a3ddda6ac9 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -321,7 +321,7 @@ pub(crate) unsafe fn remove_node_info(
     /// An id that is unique across all binder nodes on the system. Used as the key in the
     /// `by_node` map.
     pub(crate) fn global_id(&self) -> usize {
-        (self as *const Node).addr()
+        core::ptr::from_ref(self).addr()
     }
 
     pub(crate) fn get_id(&self) -> (u64, u64) {
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 927b0802e80d..93e79c08b89a 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -312,7 +312,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
 
         // SAFETY: This just initializes the pages array.
         unsafe {
-            let self_ptr = self as *const ShrinkablePageRange;
+            let self_ptr = core::ptr::from_ref(self);
             for i in 0..num_pages {
                 let info = pages.as_mut_ptr().add(i);
                 (&raw mut (*info).range).write(self_ptr);
@@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
         unsafe {
             self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
-                let obj_ptr = (obj as *const T).cast::<u8>().add(obj_offset);
+                let obj_ptr = core::ptr::from_ref(obj).cast::<u8>().add(obj_offset);
                 // SAFETY: We have a reference to the object, so the pointer is valid.
                 page.write_raw(obj_ptr, offset, to_copy)?;
                 obj_offset += to_copy;
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index fa28697982d3..88da29413e16 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -6,7 +6,7 @@
 
 #![crate_name = "rust_binder"]
 #![recursion_limit = "256"]
-#![allow(clippy::as_underscore, clippy::ref_as_ptr, clippy::cast_lossless)]
+#![allow(clippy::as_underscore, clippy::cast_lossless)]
 
 use kernel::{
     bindings::{self, seq_file},
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index 5539672d7285..b6cae57801fc 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -26,7 +26,7 @@
 
 #[inline]
 fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
-    t as *const Transaction as rust_binder_transaction
+    core::ptr::from_ref(t).cast_mut().cast()
 }
 
 #[inline]

-- 
2.54.0

