Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274485187FB;
	Wed, 23 Sep 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170904; cv=none; b=N7I+FLmlxMMO+wmU07s+n947bdk5+NL4alteFn3rjWO2T8v3mCtPUV2qW04DjIePmWCXZ3u7aVdUVEKxLH3Df5D3ASfjJl5uOD76H5FhAPHPn5ReyYG2BRkZ/jjmmPsMIhez/489UYFP7U6MHn8VGin6XXazZItKJ9VtGvdNarI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170904; c=relaxed/simple;
	bh=G1spfjpgWviRSTlbP6VXZuP6fam2iEYyv5RZg84jlzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GqDIjjhZMC1pzoHFvlBS2NRh5DqjD6O9jGbTtSEeLzPlDctA6XTEPOm+wGLc7nt5yTM8aTeA2GYAk0afJS1n1TfAJbX94tkR/utVgY6VAImu99o5tdhmc7ry/b7zvTb+2XeAMv3+8c6qduXDQunaMzSKJs7xeIypCqs3UWjB5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9L97RHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9L97RHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4651F000FF;
	Wed, 23 Sep 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170901;
	bh=R1111ZceQdFQzUTUi6fV0m1rrG+DBNgBo4SqYrilYmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=I9L97RHscVvDKTG/nr6/k8z2HkKgbxcIKkT5Vbx8rbIdSBWZOs7mtLxrFTooPDbEw
	 tj+n4JTFQW0kGVnlrLhdJ8YNtsIiphjZnmyzgtMe6bEf8Jvrwz7ShH2HWkU7Cy9QDF
	 lqGNIJqP9pmBC58/rLpXB0atRXXd90pvuS0YGkQq4/CPSxdUy7qE0YH41O42P+XehC
	 Dbwkfsg8nt7ExTtA4kBgtEwJtMXUjCB27nxmql0GND0NhadqUWOaa2QSwihqpCtzQ5
	 f05Tu8ofycq91q5AmhVY6A4R2vnZhh+iA1cGX7qHO4P/m6REkb+FAyGXB5ByuLomU4
	 qSgzVAryRRVgg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yilin Chen <1479826151@qq.com>, ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yilin
 Chen <1479826151@qq.com>
Subject: Re: [PATCH v2] rust: configfs: require thread-safe callback data
In-Reply-To: <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com>
References: <87v788t7xh.fsf@kernel.org>
 <aC94ccT3un1EKctso2G_kliI1gc8wSausWGU_X9r-V4YAhGjsYXsQCgdJxkzK8r17dZZlWTNqshNIMN3xs1LBw==@protonmail.internalid>
 <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com>
Date: Wed, 23 Sep 2026 15:41:30 +0200
Message-ID: <87ik3w2igl.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Yilin Chen" <1479826151@qq.com> writes:

> The Rust configfs abstractions do not fully constrain callback data for
> cross-thread use. Add the missing `Send` and `Sync` requirements.
>
> Specifically, make the following changes:
>
> 1. Require `Data: Send` when implementing `Send` for `Subsystem<Data>`,
>    since the subsystem stores its data by value.
> 2. Make `GroupOperations` a `Sync` supertrait because `make_group` and
>    `drop_item` receive `&self` from foreign threads. Require `Child: Send`
>    because configfs may release child groups on an arbitrary thread.
> 3. Require `AttributeOperations::Data: Sync` because its callbacks receive
>    `&Data` from foreign threads.
> 4. Update the safety comments in FFI callbacks that call `get_group_data`
>    to cite these bounds as justification for sharing the returned
>    references with the callback thread.
> 5. Remove redundant `Child: 'static` bounds from `GroupOperationsVTable`
>    and `new_with_child_ctor`.
>

I would add the diff below and update the commit message. OK with you?

Best regards,
Andreas Hindborg




diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 0534b5054fc8..ec295ab965da 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -250,6 +250,13 @@ pub struct Group<Data> {
     data: Data,
 }
 
+// SAFETY: We do not provide any operations on `Group`.
+unsafe impl<Data> Sync for Group<Data> {}
+
+// SAFETY: Ownership of `Group` can safely be transferred to other threads if
+// its data can be transferred as well.
+unsafe impl<Data: Send> Send for Group<Data> {}
+
 impl<Data> Group<Data> {
     /// Create an initializer for a new group.
     ///
@@ -326,6 +333,9 @@ unsafe fn get_group_data<'a, Parent>(this: *mut bindings::config_group) -> &'a P
 impl<Parent, Child> GroupOperationsVTable<Parent, Child>
 where
     Parent: GroupOperations<Child = Child>,
+    // We transfer `Arc<Group<Data>>` across a thread boundary in `make_group`
+    // and `drop_item`.
+    Arc<Group<Child>>: Send,
 {
     /// # Safety
     ///
@@ -405,7 +415,9 @@ impl<Parent, Child> GroupOperationsVTable<Parent, Child>
 
         if Parent::HAS_DROP_ITEM {
             // SAFETY: We called `into_raw` to produce `r_child_group_ptr` in
-            // `make_group`.
+            // `make_group`. This function may be executing on a different
+            // thread than `into_raw`. As `Arc<Group<Child>>: Send` this
+            // ownership transfer is safe.
             let arc: Arc<Group<Child>> = unsafe { Arc::from_raw(r_child_group_ptr.cast_mut()) };
 
             Parent::drop_item(parent_data, arc.as_arc_borrow());
@@ -436,6 +448,8 @@ const fn vtable_ptr() -> *const bindings::configfs_group_operations {
 impl<Data> ItemOperationsVTable<Group<Data>, Data>
 where
     Data: 'static,
+    // We transfer `Arc<Group<Data>>` across a thread boundary in `release`.
+    Arc<Group<Data>>: Send,
 {
     /// # Safety
     ///
@@ -452,8 +466,9 @@ impl<Data> ItemOperationsVTable<Group<Data>, Data>
         // embedded within a `Group<Data>`.
         let r_group_ptr = unsafe { Group::<Data>::container_of(c_group_ptr) };
 
-        // SAFETY: We called `into_raw` on `r_group_ptr` in
-        // `make_group`.
+        // SAFETY: We called `into_raw` on `r_group_ptr` in `make_group`. This
+        // function may be running on a different thread than the thread that
+        // called `into_raw`. As `Arc<Group<Data>>: Send`, this is safe.
         let pin_self: Arc<Group<Data>> = unsafe { Arc::from_raw(r_group_ptr.cast_mut()) };
         drop(pin_self);
     }
@@ -755,6 +770,8 @@ pub const fn new_with_child_ctor<const N: usize, Child>(
             ) -> Self
             where
                 Data: GroupOperations<Child = Child>,
+                Arc<Group<Child>>: Send,
+                Arc<Group<Data>>: Send,
             {
                 Self {
                     item_type: Opaque::new(bindings::config_item_type {
@@ -772,7 +789,10 @@ pub const fn new_with_child_ctor<const N: usize, Child>(
             pub const fn new<const N: usize>(
                 owner: &'static ThisModule,
                 attributes: &'static AttributeList<N, Data>,
-            ) -> Self {
+            ) -> Self
+            where
+                Arc<Group<Data>>: Send,
+            {
                 Self {
                     item_type: Opaque::new(bindings::config_item_type {
                         ct_owner: owner.as_ptr(),
-- 
2.51.2


