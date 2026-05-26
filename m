Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D441B340;
	Tue, 26 May 2026 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820764; cv=none; b=jjgBU61yv76Ah8vjSySOSU3aAgN4bNYerg6e+SXc/H3qUwp5WRtg7IlgajOcPK4vyd6LpxrytCPUoI2y1g46UXr/047DNzBk+9yKsMnNhZPqOuzPrtc2rZcDe2oomUMMk0Uq3SDrbV09iUgihL7CLbDGu0i1Y1QCuU5pp4Cndoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820764; c=relaxed/simple;
	bh=eKpcFFCz8AEyFkOL4tjabqd6EKmHdZ/39RohcFkt3nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qq4A98uBXtll8nIWtTz8CgWm283gvkuMp31ximIF3Nhe9UEywHFp4hzOg185y3kpTDyPFavxcu9xUa3+5yc900dkK1T+qSc23ZfW0iWblstOdfH9w4o2HEJArTEDbKyvjj6FU9hQhOkOV1x1u/AsDFeLG4jAx4l17WR+kAvWtBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cia3p14+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cia3p14+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238DC1F000E9;
	Tue, 26 May 2026 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820759;
	bh=4mjeMms1+mF103piHZP9toutrr6UOWv96bYcO8DEGMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cia3p14+yXEpeaGlsLNDDY/gUl08iYqHF47Laen8V+FAA1EmQSlg6b4UWWLDkmhsJ
	 a1mz1oEwe0t9aXwbyTHREOG/fv4IhhZae6fcxeiX60/u3TEjhY11H+t5IfVunp2bTe
	 19fbEVyU0Qzc/56/41rlQkdm6kbs0RaSSmtVg4MtymzpZxBUkhQyCE9CG0vqbbA7iE
	 3+QueazOBSSMdFwJdOPq6PLRio99eXXYkJucjaVaJIAjexTk3IIbn7wBoGf9UkS88A
	 Lu1QlGFBHpQDR4jU0vXbRQz+fdmlTtCku+2TEcfW7+bOgCsNtKfV5Bx9IJFC+ESX2K
	 h7Yl2Of/SJRkA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 14:39:09 -0400
Subject: [PATCH v2 3/5] rust: binder: enable `clippy::ref_as_ptr` lint
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-binder-strict-provenance-v2-3-a41d89c29bc5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4934; i=tamird@kernel.org;
 h=from:subject:message-id; bh=eKpcFFCz8AEyFkOL4tjabqd6EKmHdZ/39RohcFkt3nQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiLy78jHLp+TOf+4nVxNyFp1Z/aOV1XBdxeMJ2OWmLH
 69Efkh865jIwiDGxWAppsiSKHpob3rq7T2yme+Ow8xhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6BjrGDFycAjDVN9oYGV5e8RJaP6+05Lxpru6Rz5t83dg2y4YcqXxpa7Vx0b43q5sZ/gpvWG6
 wu/RzwjzNhszpbJNnl8T+nOTWWn/r3u2+nwce32YEAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:

> Using `as` casts may result in silently changing mutability or type.

While this does not eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize. It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint in the Binder Rust driver -- no functional
change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/defs.rs             | 4 +++-
 drivers/android/binder/node.rs             | 3 ++-
 drivers/android/binder/page_range.rs       | 4 ++--
 drivers/android/binder/rust_binder_main.rs | 2 +-
 drivers/android/binder/trace.rs            | 4 +++-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index 354c32c39e83..e697c2c13e29 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -4,6 +4,8 @@
 
 use core::mem::MaybeUninit;
 use core::ops::{Deref, DerefMut};
+use core::ptr;
+
 use kernel::{
     transmute::{AsBytes, FromBytes},
     uapi::{self, *},
@@ -165,7 +167,7 @@ impl BinderTransactionDataSecctx {
     pub(crate) fn tr_data(&mut self) -> &mut BinderTransactionData {
         // SAFETY: Transparent wrapper is safe to transmute.
         unsafe {
-            &mut *((&mut self.transaction_data as *mut uapi::binder_transaction_data)
+            &mut *(ptr::from_mut::<uapi::binder_transaction_data>(&mut self.transaction_data)
                 .cast::<BinderTransactionData>())
         }
     }
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index d710940c3c8f..3d96738dee66 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -21,6 +21,7 @@
 };
 
 use core::mem;
+use core::ptr;
 
 mod wrapper;
 pub(crate) use self::wrapper::CritIncrWrapper;
@@ -321,7 +322,7 @@ pub(crate) unsafe fn remove_node_info(
     /// An id that is unique across all binder nodes on the system. Used as the key in the
     /// `by_node` map.
     pub(crate) fn global_id(&self) -> usize {
-        (self as *const Node).addr()
+        ptr::from_ref(self).addr()
     }
 
     pub(crate) fn get_id(&self) -> (u64, u64) {
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 927b0802e80d..719fa0175e0b 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -312,7 +312,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
 
         // SAFETY: This just initializes the pages array.
         unsafe {
-            let self_ptr = self as *const ShrinkablePageRange;
+            let self_ptr = ptr::from_ref(self);
             for i in 0..num_pages {
                 let info = pages.as_mut_ptr().add(i);
                 (&raw mut (*info).range).write(self_ptr);
@@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
         unsafe {
             self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
                 // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
-                let obj_ptr = (obj as *const T).cast::<u8>().add(obj_offset);
+                let obj_ptr = ptr::from_ref(obj).cast::<u8>().add(obj_offset);
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
index 5539672d7285..06aabb3cc2f1 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -4,6 +4,8 @@
 
 use crate::transaction::Transaction;
 
+use core::ptr;
+
 use kernel::bindings::{rust_binder_transaction, task_struct};
 use kernel::error::Result;
 use kernel::ffi::{c_int, c_uint, c_ulong};
@@ -26,7 +28,7 @@
 
 #[inline]
 fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
-    t as *const Transaction as rust_binder_transaction
+    ptr::from_ref(t).cast_mut().cast()
 }
 
 #[inline]

-- 
2.54.0

