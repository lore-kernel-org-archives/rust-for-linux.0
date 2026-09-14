Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4833476CEE;
	Mon, 14 Sep 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394958; cv=none; b=e5QwXTMze2+KG3mVngrtXu38fKeXakktedfQjYrO38NQgeYOljCOjRV3s1ue2k3KrFmFn8e7giXt8KVY4yP1q+XZcymtim+Io7R/La9bCaBzHjaN7UUXVG2kXzRd6fNyBrSjWZ19t7Qs+BPcRHAne+aLEkiM0iW6sAf3Q6QfiOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394958; c=relaxed/simple;
	bh=K1ndBXkauxQF/G+RjfeBt/ibyFSN3MLQ6BS8dr4Qzlo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BvoOVdJjDQ875WnD0vS0UF+IdQ8Yqwyg0V13FWJM4eS3xteS4gf7FX5yEKk91NmRgGy49xyUUybRiTQFf3mb9//9yCZTX0V19J6kVuForAXkkKdnvPcwXGG9RwmOWe0zJe47qz9n9GueWKHlKSO5EbnZhnwr8i8COG3qtHXkg3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PpuF3yUr; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PpuF3yUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789394944; bh=I7JxcpE2pTIIXWVKgV7u98WT4XU0JiKYmscV17HK1Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PpuF3yUrjj7pVUyhZ2KgO/f7vHk1xJ4LiTvWb/m6xn4U3HRwfR/9c8b49Xj0q9l8D
	 ae3UhMGt3cDvXifaiqBSIIUnMt8MNqV3S7OVQMBh0XdynDn1RAaO30f7R9bd1bxzmc
	 zmq7mrTmmIy3z1GgIPpD+BJnQn8oywTyv9A7goKo=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 240B7095; Mon, 14 Sep 2026 22:09:00 +0800
X-QQ-mid: xmsmtpt1789394940tjylahrsf
Message-ID: <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com>
X-QQ-XMAILINFO: OfdIMQeyotv9s/ammIJTK903T6pwg6IQcjfoR0ywfBHLJD4IY3IHopzXgrRe5Q
	 sLvtywtRVXQVN2h9/czCF9ZDrGrkQ4UqM7+iUNw9nTZVF8HsUq1iDdpU/nCAYnpe3gJ5PttCo+Ta
	 gcMZ3DF2AdB+is6cuYQ2KpC9rlcAFMMsKkq1NWrVZsCwfI4NHY/R5POE3bV0QbIpBs5nz0JWmFs/
	 Qp4xDSYy1RRuyuGp632io7XG9nyQ3KXhPQrzWnrp4YCxovJTDNn3rs0nw/CfHXTh0van2VU1bMnl
	 d9FkzRihNiiiDxLEzf9HMigB7QVM3uGQv/YmRL5A4kOLmWS4w7DCDLLc5iy3ZYhHZqjZRLv6YwCo
	 MmE+Hjov5UqdLdA5lYSOLAkrdpelcvY9l+BWBaKtdnsM/yVFjQxOXcqMbfQ/YXZ3Fb4utuHsTh1k
	 GJB5rZy484mK1NEnLfylKJZ9SCDAeGbTNI3V2S2vmXJN6ZLUUKtuNVNqB+1tTeEKGBIEFncubyC6
	 iggQzjhR0S/Azw/rKhWP4cVfml61kQ+KnzMYMiDfmLhybPoBBtLjEKoa+EW71VqwWW/COHhJ+BVh
	 RBnCVgeG/M78cWO86p69uH18F+QEkZxzDre0q+d5D5k1Jq4CeBTLBAbgY8KgPGutXTGL0CsNiPjS
	 Uf9OYdTiGedmjjiwNoctSqhDlsfoxvvJRsCa9RDra9o1GGpGOl9bBWXOBzp22EMTBIcpqeLMt0qF
	 SB6w5Y7TklTFrfdiRG7fgJyE9LpODPi0rzwNKRzDnm//DjiieXw+563GfRvXnrT4mSEWUoQJxBR4
	 jhtxiIsDC2gp2UHa5j7b4x8pCDWUQ58XoI9UTShV2FxEkRIXclxVceyCeZqIm8jRvYjhZjOhsGfW
	 qAdO8ODtYX29p1jWB3rOQTkB5W47xI+tmsCKzu6Dp3pvExw++yNMSuvZp30y//wm6YAyf3JZe1Ho
	 6fIAGRztXtrMYmcEeaOv+wADC6s4/t+U5qGdkUUKBT/IktfDw/7XdLD5iHLVgXavQPV15EarmIUD
	 aXpqZIfoYhvgM1OmGWMa+ho2oyrOZ1u5FGQFMJBURhEIz9NEDEMt71ULpV3Emxo3Yb2N6y84Yt3t
	 76lNRRDP+DIHjKR5lHtjAt6R208yIbtEGT/vv3
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yilin Chen <1479826151@qq.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: configfs: require thread-safe callback data
Date: Mon, 14 Sep 2026 14:09:00 +0000
X-OQ-MSGID: <20260914140900.2456157-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87v788t7xh.fsf@kernel.org>
References: <87v788t7xh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust configfs abstractions do not fully constrain callback data for
cross-thread use. Add the missing `Send` and `Sync` requirements.

Specifically, make the following changes:

1. Require `Data: Send` when implementing `Send` for `Subsystem<Data>`,
   since the subsystem stores its data by value.
2. Make `GroupOperations` a `Sync` supertrait because `make_group` and
   `drop_item` receive `&self` from foreign threads. Require `Child: Send`
   because configfs may release child groups on an arbitrary thread.
3. Require `AttributeOperations::Data: Sync` because its callbacks receive
   `&Data` from foreign threads.
4. Update the safety comments in FFI callbacks that call `get_group_data`
   to cite these bounds as justification for sharing the returned
   references with the callback thread.
5. Remove redundant `Child: 'static` bounds from `GroupOperationsVTable`
   and `new_with_child_ctor`.

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Should.20add.20Data.3A.20Send.2FSync.20bounds.20in.20configfs.3A.3ASubsystem.3F/with/623719979
Assisted-by: Gpt-5.6 Sol
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v2:
- Require attribute data and group operation implementers to be `Sync`.
- Require child data to be `Send` for arbitrary-thread release.
- Document the bounds that make shared references safe in FFI callbacks.
- Remove redundant `Child: 'static` bounds from `GroupOperationsVTable`
  and `new_with_child_ctor`.

 rust/kernel/configfs.rs | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..de9306a5e527 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -135,8 +135,9 @@ pub struct Subsystem<Data> {
 // SAFETY: We do not provide any operations on `Subsystem`.
 unsafe impl<Data> Sync for Subsystem<Data> {}
 
-// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads.
-unsafe impl<Data> Send for Subsystem<Data> {}
+// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads
+// if its data can be transferred as well.
+unsafe impl<Data: Send> Send for Subsystem<Data> {}
 
 impl<Data> Subsystem<Data> {
     /// Create an initializer for a [`Subsystem`].
@@ -325,7 +326,6 @@ unsafe fn get_group_data<'a, Parent>(this: *mut bindings::config_group) -> &'a P
 impl<Parent, Child> GroupOperationsVTable<Parent, Child>
 where
     Parent: GroupOperations<Child = Child>,
-    Child: 'static,
 {
     /// # Safety
     ///
@@ -344,8 +344,9 @@ impl<Parent, Child> GroupOperationsVTable<Parent, Child>
         this: *mut bindings::config_group,
         name: *const kernel::ffi::c_char,
     ) -> *mut bindings::config_group {
-        // SAFETY: By function safety requirements of this function, this call
-        // is safe.
+        // SAFETY: By function safety requirements, `this` points to a configfs
+        // group containing `Parent`. The `GroupOperations` bound guarantees
+        // that `Parent: Sync`, so it is safe to share it with this thread.
         let parent_data = unsafe { get_group_data(this) };
 
         let group_init = match Parent::make_group(
@@ -390,8 +391,9 @@ impl<Parent, Child> GroupOperationsVTable<Parent, Child>
         this: *mut bindings::config_group,
         item: *mut bindings::config_item,
     ) {
-        // SAFETY: By function safety requirements of this function, this call
-        // is safe.
+        // SAFETY: By function safety requirements, `this` points to a configfs
+        // group containing `Parent`. The `GroupOperations` bound guarantees
+        // that `Parent: Sync`, so it is safe to share it with this thread.
         let parent_data = unsafe { get_group_data(this) };
 
         // SAFETY: By function safety requirements, `item` is embedded in a
@@ -483,12 +485,12 @@ const fn vtable_ptr() -> *const bindings::configfs_item_operations {
 ///
 /// Implement this trait on structs that embed a [`Subsystem`] or a [`Group`].
 #[vtable]
-pub trait GroupOperations {
+pub trait GroupOperations: Sync {
     /// The child data object type.
     ///
     /// This group will create subgroups (subdirectories) backed by this kind of
     /// object.
-    type Child: 'static;
+    type Child: 'static + Send;
 
     /// Creates a new subgroup.
     ///
@@ -555,8 +557,10 @@ impl<const ID: u64, O, Data> Attribute<ID, O, Data>
             // `config_group`.
             unsafe { container_of!(item, bindings::config_group, cg_item) };
 
-        // SAFETY: The function safety requirements for this function satisfy
-        // the conditions for this call.
+        // SAFETY: By function safety requirements, `c_group` points to a
+        // configfs group containing `Data`. The `AttributeOperations` bound
+        // guarantees that `Data: Sync`, so it is safe to share it with this
+        // thread.
         let data: &Data = unsafe { get_group_data(c_group) };
 
         // SAFETY: By function safety requirements, `page` is writable for `PAGE_SIZE`.
@@ -589,8 +593,10 @@ impl<const ID: u64, O, Data> Attribute<ID, O, Data>
         // `config_group`.
             unsafe { container_of!(item, bindings::config_group, cg_item) };
 
-        // SAFETY: The function safety requirements for this function satisfy
-        // the conditions for this call.
+        // SAFETY: By function safety requirements, `c_group` points to a
+        // configfs group containing `Data`. The `AttributeOperations` bound
+        // guarantees that `Data: Sync`, so it is safe to share it with this
+        // thread.
         let data: &Data = unsafe { get_group_data(c_group) };
 
         let ret = O::store(
@@ -643,7 +649,7 @@ pub const fn new(name: &'static CStr) -> Self {
 pub trait AttributeOperations<const ID: u64 = 0> {
     /// The type of the object that contains the field that is backing the
     /// attribute for this operation.
-    type Data;
+    type Data: Sync;
 
     /// Renders the value of an attribute.
     ///
@@ -749,7 +755,6 @@ pub const fn new_with_child_ctor<const N: usize, Child>(
             ) -> Self
             where
                 Data: GroupOperations<Child = Child>,
-                Child: 'static,
             {
                 Self {
                     item_type: Opaque::new(bindings::config_item_type {

base-commit: 08df884136f1c1197bab2a27814404fd329d9aac

