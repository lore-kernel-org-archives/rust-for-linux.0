Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BA2C21E6
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254831; cv=none; b=uj8Y5AmFVBOMOaxL3zzblAZdjCLYI+Aijy3eYByCsTP/238Z5j60ar3Vd9ocg2kP3Tmi+dbVj77Ke2qgGaIjqb7meKV3tQZEMN7sAiK+DbTYdnhGvxrs8r2JS28TGMF1knWewCIJtd9ZocSmIr4hOjbRhLJeTr7AloMWE+ieQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254831; c=relaxed/simple;
	bh=qf6a23PTN6BJbtTf8XRrDB2SB4SFxvK4SN0a7l+wXvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAFKFr+dSrH/n6SXE6IdBAQq64N4vBn33U5tvNg1xStris36O/+xLDfnGYBiIrSabhw2VFl8P0lxQOwSubD3e0Ez2uX89Gx2vk5o1VAjUMV5ffQZB8Yyh1IjPNoVtpjKqCHR4qAf+eURWl38txnHG8CAi52G6900s3kRbDvTmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bK9qWcDe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bK9qWcDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761254829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fgB8Z93TRo4WCd3p++Pa+dxvLDuIIdiTgas1fg3xpX4=;
	b=bK9qWcDeYCXK76eSt2tLHmCyrSumasS70ZvXPaoE0n6SwUDsbfBShD5WrP35sc3LWcYvQL
	yYyHwsgEcvqFVY5IbvNxei/UrCzYKQIixbIDwRwUel46TnY5ZSZdlgKR79QpLjHYEy9jd6
	nzejRL2HGvODnDQYFBvaN+Ikr8fRHBI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-DM6r9jKOOTedqlgtO7uMLQ-1; Thu,
 23 Oct 2025 17:27:05 -0400
X-MC-Unique: DM6r9jKOOTedqlgtO7uMLQ-1
X-Mimecast-MFC-AGG-ID: DM6r9jKOOTedqlgtO7uMLQ_1761254823
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28A701956046;
	Thu, 23 Oct 2025 21:27:03 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.64.235])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC7A730002DB;
	Thu, 23 Oct 2025 21:26:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH v5 8/8] rust: drm/gem: Add vmap functions to shmem bindings
Date: Thu, 23 Oct 2025 17:22:10 -0400
Message-ID: <20251023212540.1141999-9-lyude@redhat.com>
In-Reply-To: <20251023212540.1141999-1-lyude@redhat.com>
References: <20251023212540.1141999-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

One of the more obvious use cases for gem shmem objects is the ability to
create mappings into their contents, specifically iosys mappings. Now that
we've added iosys_map rust bindings to the kernel, let's hook these up in
gem shmem.

Similar to how we handle SGTables, we make sure there's two different types
of mappings: owned mappings (kernel::drm::gem::shmem::VMap) and borrowed
mappings (kernel::drm::gem::shmem::VMapRef).

One last note: we change the #[expect(unused)] for RawIoSysMap::from_raw()
to an #[allow(unused)]. Normally we would simply remove the lint assertion,
however - since shmem is conditionally built, we need allow to avoid
hitting warnings in certain kernel configurations.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 160 ++++++++++++++++++++++++++++++++++-
 rust/kernel/iosys_map.rs     |   2 +-
 2 files changed, 160 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 21ccb6c1824be..62a2c12b9fe2a 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -13,15 +13,18 @@
     container_of,
     drm::{device, driver, gem, private::Sealed},
     error::{from_err_ptr, to_result},
+    iosys_map::*,
     prelude::*,
     scatterlist,
+    transmute::*,
     types::{ARef, Opaque},
 };
 use core::{
+    mem::{self, MaybeUninit},
     ops::{Deref, DerefMut},
     ptr::NonNull,
 };
-use gem::{BaseObjectPrivate, DriverObject, IntoGEMObject};
+use gem::{BaseObject, BaseObjectPrivate, DriverObject, IntoGEMObject};
 
 /// A struct for controlling the creation of shmem-backed GEM objects.
 ///
@@ -192,6 +195,72 @@ pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
             _owner: self.into(),
         })
     }
+
+    /// Attempt to create a [`RawIoSysMap`] from the gem object.
+    fn raw_vmap<U: AsBytes + FromBytes>(&self) -> Result<RawIoSysMap<U>> {
+        build_assert!(
+            mem::size_of::<U>() > 0,
+            "It doesn't make sense for the mapping type to be a ZST"
+        );
+
+        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
+
+        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservation lock held
+        to_result(unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(self.raw_dma_resv(), core::ptr::null_mut());
+            let ret = bindings::drm_gem_shmem_vmap_locked(self.as_shmem(), map.as_mut_ptr());
+            bindings::dma_resv_unlock(self.raw_dma_resv());
+            ret
+        })?;
+
+        // SAFETY: if drm_gem_shmem_vmap did not fail, map is initialized now
+        Ok(unsafe { RawIoSysMap::from_raw(map.assume_init()) })
+    }
+
+    /// Unmap a [`RawIoSysMap`] from the gem object.
+    ///
+    /// # Safety
+    ///
+    /// - The caller promises that `map` came from a prior call to [`Self::raw_vmap`] on this gem
+    ///   object.
+    /// - The caller promises that the memory pointed to by `map` will no longer be accesed through
+    ///   this instance.
+    unsafe fn raw_vunmap<U: AsBytes + FromBytes>(&self, map: &mut RawIoSysMap<U>) {
+        let resv = self.raw_dma_resv();
+
+        // SAFETY:
+        // - This function is safe to call with the DMA reservation lock held
+        // - Our `ARef` is proof that the underlying gem object here is initialized and thus safe to
+        //   dereference.
+        unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(resv, core::ptr::null_mut());
+            bindings::drm_gem_shmem_vunmap_locked(self.as_shmem(), map.as_raw_mut());
+            bindings::dma_resv_unlock(resv);
+        }
+    }
+
+    /// Creates and returns a virtual kernel memory mapping for this object.
+    pub fn vmap<U: AsBytes + FromBytes>(&self) -> Result<VMapRef<'_, T, U>> {
+        let map = self.raw_vmap()?;
+
+        Ok(VMapRef {
+            // SAFETY:
+            // - The size of the vmap is the same as the size of the gem
+            // - The vmap will remain alive until this object is dropped.
+            map: unsafe { IoSysMapRef::new(map, self.size()) },
+            owner: self,
+        })
+    }
+
+    /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
+    pub fn owned_vmap<U: AsBytes + FromBytes>(&self) -> Result<VMap<T, U>> {
+        Ok(VMap {
+            map: self.raw_vmap()?,
+            owner: self.into(),
+        })
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -243,6 +312,95 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
     };
 }
 
+/// A borrowed reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+pub struct VMapRef<'a, D: DriverObject, T: AsBytes + FromBytes> {
+    map: IoSysMapRef<'a, T>,
+    owner: &'a Object<D>,
+}
+
+impl<'a, D: DriverObject, T: AsBytes + FromBytes> Clone for VMapRef<'a, D, T> {
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, T: AsBytes + FromBytes> Deref for VMapRef<'a, D, T> {
+    type Target = IoSysMapRef<'a, T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.map
+    }
+}
+
+impl<'a, D: DriverObject, T: AsBytes + FromBytes> DerefMut for VMapRef<'a, D, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.map
+    }
+}
+
+impl<'a, D: DriverObject, T: AsBytes + FromBytes> Drop for VMapRef<'a, D, T> {
+    fn drop(&mut self) {
+        // SAFETY: Our existence is proof that this map was previously created using self.owner.
+        unsafe { self.owner.raw_vunmap(&mut self.map) };
+    }
+}
+
+/// An owned reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+///
+/// # Invariants
+///
+/// - The memory pointed to by `map` is at least as large as `T`.
+/// - The memory pointed to by `map` remains valid at least until this object is dropped.
+pub struct VMap<D: DriverObject, T: AsBytes + FromBytes> {
+    map: RawIoSysMap<T>,
+    owner: ARef<Object<D>>,
+}
+
+impl<D: DriverObject, T: AsBytes + FromBytes> Clone for VMap<D, T> {
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.owned_vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, T: AsBytes + FromBytes> From<VMapRef<'a, D, T>> for VMap<D, T> {
+    fn from(value: VMapRef<'a, D, T>) -> Self {
+        let this = Self {
+            map: value.map.clone(),
+            owner: value.owner.into(),
+        };
+
+        mem::forget(value);
+        this
+    }
+}
+
+impl<D: DriverObject, T: AsBytes + FromBytes> VMap<D, T> {
+    /// Return a reference to the iosys map for this `VMap`.
+    pub fn get(&self) -> IoSysMapRef<'_, T> {
+        // SAFETY: The size of the iosys_map is equivalent to the size of the gem object.
+        unsafe { IoSysMapRef::new(self.map.clone(), self.owner.size()) }
+    }
+
+    /// Borrows a reference to the object that owns this virtual mapping.
+    pub fn owner(&self) -> &Object<D> {
+        &self.owner
+    }
+}
+
+impl<D: DriverObject, T: AsBytes + FromBytes> Drop for VMap<D, T> {
+    fn drop(&mut self) {
+        // SAFETY: Our existence is proof that this map was previously created using self.owner
+        unsafe { self.owner.raw_vunmap(&mut self.map) };
+    }
+}
+
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<D: DriverObject, T: AsBytes + FromBytes> Send for VMap<D, T> {}
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<D: DriverObject, T: AsBytes + FromBytes> Sync for VMap<D, T> {}
+
 /// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
 ///
 /// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
index 4da0ab57cf35c..e7540139ada01 100644
--- a/rust/kernel/iosys_map.rs
+++ b/rust/kernel/iosys_map.rs
@@ -32,7 +32,7 @@
 
 impl<T: AsBytes + FromBytes> RawIoSysMap<T> {
     /// Convert from a raw `bindings::iosys_map`.
-    #[expect(unused)]
+    #[allow(unused)]
     #[inline]
     pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
         Self(val, PhantomData)
-- 
2.51.0

