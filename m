Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825C2DF12F
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014096; cv=none; b=l1v+j/LZUh7SYXf3U0UIvDHfDFPBbH/e0uYLBY10+uOpu+BFH4h4aIfYy8DxUYq19e8wqdt9AATiyApW5FTeiBkXnSRnSgSOtV0O9vAsHrmmqO3nPQRxeN5wBC800s8DU5ae6DCBXEEQnViU0E24/J/1pcwE4gXufDj57c55/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014096; c=relaxed/simple;
	bh=sVm/VzWYRlIdoOGnFMc4kZShp+aPm0Es1WH9x9pY9us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cZycc2Wv5Cm81PtDKTfNGysPBMJvPPctA2VIinUXRjeY2kN4ctXTKbiDutGfDBACr/14qCl777wkyXb4kPns6lzAztBnovWpqhlAB9nw0j0WBTpfIN6pHqJOaMW9g1ZYqALnMN82ubmFLIsgOGjj362q8tCFOWwllY9QKtc22R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=D+xYB0Ey; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="D+xYB0Ey"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-154e9d2d979so1455294c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1792014094; x=1792618894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfb2eXWa5FVD78V6JsxorvtqimLPEUt9gRIR+Xqt4ZE=;
        b=D+xYB0EyYhb2ifMMHNBercAWmzP3I9W+bAgY75qWDmCFqzJcux/PMyaTG0pQb4d46d
         RWKiDfSsToAJT411B50V461Rk8MKOOeZsWiix7YKzsnbvCa9Rb9Sq9W5FQIvM1M+05E7
         8Kw9UxBI4P6AHkLffr9eMRqLj8GmmBT8UFKOWfKxeWXpEMV62pjr++MbTyvz7HvdOdL3
         lhgOYFQdqYX/VD50CO+m/6+6WL+LaC4UNhaNXfa+33zX2zn0pqCN1KbrEKRYWLF0WmLQ
         TpSoLNARSvKcSLzL4Gpf9slLt4vc28frsFtTFnfsdsknQXF3JeNrTbkqt7x5GEzilnvY
         eFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014094; x=1792618894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfb2eXWa5FVD78V6JsxorvtqimLPEUt9gRIR+Xqt4ZE=;
        b=R/4f+9ntrUhWAb59osvLJx39mPo+Vpx0rcf0hAS4PXMTUwC0q7mv33GWxRQ3E4w++M
         WYotoHQQvtSY1CzHtJCBCJleSOkSxw4PX+qLvSFC1SmXZaLuFPpEiCp6KEEpslkUMmTF
         2nnM6QmA6tRI+mCdcHHKWcTJ80O5DAqDqPXWYaT5oKNOqelW0DNsEbU1xxbAShMDZGrG
         DF8rk2A0K+NgCk9/s73DjuGBiHlklVcuxFUQLVF4fLN6Z3YVUovE2RghCeh6JV7BaHxM
         QcBfNmz2cYFAJN8+i2MDWnbRrSOrM53wThKG/zfjDyhYNKjvOaBXLoPMGGQ7VXH3y3Vu
         qWLA==
X-Forwarded-Encrypted: i=1; AKwUvByR1qMSBYNej/pT6x17ecN92D0zLU8eAzZPQeaXwsxm7TnBYrPXitpXgquEaEpncT5VXZORkD5qwurGGDkpLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJH2c+JI+BjWnldWrEHhG/r7kawhi96+YdarKcmrxOZGmuF5mvH
	o9eK6nbdFjFr55CQD9orPZoGc5B4dzukLGOj26GcMzm7F77dQqjHvy25dz5xluvwclo=
X-Gm-Gg: AYBFou2M4McvyvSo51QtMIhLldtaCorOdWxKpjznJ8JeRv1hXkNDgVbeyg55xQ9Uj6u
	YGDrWqXt8JE/SixnVqQy3Mc6k83XVi5X6za3CaB6DjGslBXGZn1lzhtbeBROM2o5p/OT4aM9PF5
	bXyfhSQCOdTHwJcCVPAwULvPfrq8adGSEPC7LrJv721GZmWDv5h259nNfh05VLODANAdOlur70G
	hgCyq9jiWw69tvO67sDB6UoIjavCtcc5nIk7K5sn1PpQE/obbZxWweNALbfVRsDgHiXOUQOHcNA
	TS0aMDRwenpw5TTiOPcAMs2gDC4qtrAG5E3BR/kaI9Kq406BzQuY44OfJhhb2EkIhyQi/CJn1XZ
	ErqQlTkUq4nqPI5d08PmvB8/65dDQSltAZ7/Oyu9NWlf8r2DeN5/bSJDbtp8TM7ttJ8OAT3OM1k
	P8tMBZ8so7FaIhpGmPRR0erbT+F0F/n8GeBWMQf7sFj1jDyUZKTIZTJWZulwza6KWSZ1JRcf5dF
	bEgSRvZUea+xYKTAZDLSt+mEIG9y1YB93E=
X-Received: by 2002:a05:7023:885:b0:152:97a1:dd36 with SMTP id a92af1059eb24-16a12539614mr22210658c88.10.1792014091902;
        Wed, 14 Oct 2026 14:41:31 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-169a1becb11sm46752536c88.4.2026.10.14.14.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:41:31 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	me@kloenk.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH v2] rust: io: Fix `Region::drop` trying to release nested  resources  from the wrong parent
Date: Wed, 14 Oct 2026 21:41:29 +0000
Message-Id: <090cb71b6e4800936fa172b6c3ebec52b80de28c.1791928238.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Io resource regions can be requested beneath a specified parent
resource.
But `Region::drop` does not consider the parent resource.
It releases regions relative to the global resource root.
For nested regions, it may fail to find and release the child region.
This can lead to resource leaks and leaving the name pointer dangling.

Fix this by storing a reference to the parent resource in `Region`.
This ensures that the parent remains valid for the lifetime of the
child region.
The `Region::drop` implementation is updated to use the parent
resource when releasing the region.

Fixes: 493fc33ec252 ("rust: io: add resource abstraction")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
Changelog:
 - Edit safety comments to document that resources passed
   to IoRequest::new must remain valid through devres release.
 - Document Region's parent invariant and update the
  covariance and Send/Sync safety comments.
 - Link to v1: https://lore.kernel.org/all/a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu/
---
 rust/kernel/io/mem.rs      | 27 ++++++++++++++------
 rust/kernel/io/resource.rs | 51 +++++++++++++++++++++-----------------
 rust/kernel/platform.rs    |  8 +++---
 3 files changed, 51 insertions(+), 35 deletions(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 32a919099dcd..8160a09c9c21 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -27,6 +27,11 @@
 };
 
 /// An IO request for a specific device and resource.
+///
+/// # Invariants
+///
+/// `resource` is valid for `device` through the release of the device's
+/// managed resources.
 pub struct IoRequest<'a> {
     device: &'a Device<Bound>,
     resource: &'a Resource,
@@ -37,8 +42,9 @@ impl<'a> IoRequest<'a> {
     ///
     /// # Safety
     ///
-    /// Callers must ensure that `resource` is valid for `device` during the
-    /// lifetime `'a`.
+    /// Callers must ensure that `resource` is valid for `device` through the
+    /// release of the device's managed resources. Note that the `resource`
+    /// may outlive the [`IoRequest`].
     pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> Self {
         IoRequest { device, resource }
     }
@@ -165,6 +171,8 @@ pub fn iomap_exclusive(self) -> Result<ExclusiveIoMem<'a, 0>> {
 /// # Invariants
 ///
 /// - [`ExclusiveIoMem`] has exclusive access to the underlying [`IoMem`].
+/// - The parent resource held by `_region` remains valid through the release
+///   of the device's managed resources.
 pub struct ExclusiveIoMem<'a, const SIZE: usize> {
     /// The underlying `IoMem` instance.
     iomem: IoMem<'a, SIZE>,
@@ -173,15 +181,16 @@ pub struct ExclusiveIoMem<'a, const SIZE: usize> {
     /// range represented by the underlying `iomem`.
     ///
     /// This field is needed for ownership of the region.
-    _region: Region,
+    _region: Region<'a>,
 }
 
 impl<const SIZE: usize> ForLt for ExclusiveIoMem<'static, SIZE> {
     type Of<'a> = ExclusiveIoMem<'a, SIZE>;
 }
 
-// SAFETY: `ExclusiveIoMem<'a, SIZE>` is covariant over `'a`; it holds an `IoMem<'a, SIZE>`,
-// which holds `&'a Device<Bound>`, which is covariant.
+// SAFETY: `ExclusiveIoMem<'a, SIZE>` is covariant over `'a`: `IoMem<'a, SIZE>` holds
+// `&'a Device<Bound>`, and `Region<'a>` holds `&'a Resource`. Both references
+// are covariant, and the other fields do not depend on `'a`.
 unsafe impl<const SIZE: usize> CovariantForLt for ExclusiveIoMem<'static, SIZE> {}
 
 /// A device-managed exclusive I/O memory region.
@@ -191,7 +200,7 @@ unsafe impl<const SIZE: usize> CovariantForLt for ExclusiveIoMem<'static, SIZE>
 
 impl<'a, const SIZE: usize> ExclusiveIoMem<'a, SIZE> {
     /// Creates a new `ExclusiveIoMem` instance.
-    fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
+    fn ioremap(dev: &'a Device<Bound>, resource: &'a Resource) -> Result<Self> {
         let start = resource.start();
         let size = resource.size();
         let name = resource.name().unwrap_or_default();
@@ -219,8 +228,10 @@ fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
     /// driver data. Access to the I/O memory is revoked automatically when the device is unbound.
     pub fn into_devres(self) -> Result<DevresExclusiveIoMem<SIZE>> {
         let dev = self.iomem.dev;
-        // SAFETY: `ExclusiveIoMem` only holds a device reference and an I/O mapping, both of
-        // which remain valid for the device's full bound scope, not just for `'a`.
+        // SAFETY: `iomem` owns its I/O mapping and refers to the bound device.
+        // `_region.parent` refers to the resource supplied to `IoRequest::new`,
+        // whose safety contract guarantees that it remains valid through devres
+        // release. Thus `self` remains valid for the device's full bound scope.
         unsafe { DevresLt::new(dev, self) }
     }
 }
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 17b0c174cfc5..7d16600913b0 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -25,17 +25,24 @@
 ///
 /// # Invariants
 ///
-/// - `self.0` points to a valid `bindings::resource` that was obtained through
+/// - `resource` points to a valid `bindings::resource` that was obtained through
 ///   `bindings::__request_region`.
-pub struct Region {
+/// - `parent` is the exact resource passed to `bindings::__request_region`
+///   when `resource` was obtained, and remains valid until this region is
+///   released.
+pub struct Region<'a> {
     /// The resource returned when the region was requested.
     resource: NonNull<bindings::resource>,
+    /// Parent supplied to `__request_region`.
+    /// The reference also prevents a parent `Region` from being dropped
+    /// before this child.
+    parent: &'a Resource,
     /// The name that was passed in when the region was requested. We need to
     /// store it for ownership reasons.
     _name: CString,
 }
 
-impl Deref for Region {
+impl Deref for Region<'_> {
     type Target = Resource;
 
     fn deref(&self) -> &Self::Target {
@@ -44,31 +51,28 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl Drop for Region {
+impl Drop for Region<'_> {
     fn drop(&mut self) {
-        let (flags, start, size) = {
+        let (start, size) = {
             let res = &**self;
-            (res.flags(), res.start(), res.size())
+            (res.start(), res.size())
         };
 
-        let release_fn = if flags.contains(Flags::IORESOURCE_MEM) {
-            bindings::release_mem_region
-        } else {
-            bindings::release_region
-        };
-
-        // SAFETY: Safe as per the invariant of `Region`.
-        unsafe { release_fn(start, size) };
+        // SAFETY:
+        // - `parent` is the resource passed to `__request_region`.
+        // - Its lifetime is tied to this `Region`, so it remains valid.
+        // - `start` and `size` identify the region owned by `self`.
+        unsafe { bindings::__release_region(self.parent.0.get(), start, size) };
     }
 }
 
-// SAFETY: `Region` only holds a pointer to a C `struct resource`, which is safe to be used from
-// any thread.
-unsafe impl Send for Region {}
+// SAFETY: The region pointer can be used from any thread. `parent` is a shared
+// reference to `Resource`, which is `Sync`, and `_name` is `Send`.
+unsafe impl Send for Region<'_> {}
 
-// SAFETY: `Region` only holds a pointer to a C `struct resource`, references to which are
-// safe to be used from any thread.
-unsafe impl Sync for Region {}
+// SAFETY: The region pointer can be shared across threads. `parent` is a shared
+// reference to `Resource`, which is `Sync`, and `_name` is `Sync`.
+unsafe impl Sync for Region<'_> {}
 
 /// A resource abstraction.
 ///
@@ -98,13 +102,13 @@ impl Resource {
     /// Exclusive access will be given and the region will be marked as busy.
     /// Further calls to [`Self::request_region`] will return [`None`] if
     /// the region, or a part of it, is already in use.
-    pub fn request_region(
-        &self,
+    pub fn request_region<'a>(
+        &'a self,
         start: PhysAddr,
         size: ResourceSize,
         name: CString,
         flags: Flags,
-    ) -> Option<Region> {
+    ) -> Option<Region<'a>> {
         // SAFETY:
         // - Safe as per the invariant of `Resource`.
         // - `__request_region` will store a reference to the name, but that is
@@ -122,6 +126,7 @@ pub fn request_region(
 
         Some(Region {
             resource: NonNull::new(region)?,
+            parent: self,
             _name: name,
         })
     }
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae1bb..8ba143a53ff6 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -311,16 +311,16 @@ impl Device<Bound> {
     /// Returns an `IoRequest` for the resource at `index`, if any.
     pub fn io_request_by_index(&self, index: u32) -> Option<IoRequest<'_>> {
         self.resource_by_index(index)
-            // SAFETY: `resource` is a valid resource for `&self` during the
-            // lifetime of the `IoRequest`.
+            // SAFETY: `resource` belongs to this platform device. Its resource
+            // array remains stable while bound and outlives devres release.
             .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
     }
 
     /// Returns an `IoRequest` for the resource with a given `name`, if any.
     pub fn io_request_by_name(&self, name: &CStr) -> Option<IoRequest<'_>> {
         self.resource_by_name(name)
-            // SAFETY: `resource` is a valid resource for `&self` during the
-            // lifetime of the `IoRequest`.
+            // SAFETY: `resource` belongs to this platform device. Its resource
+            // array remains stable while bound and outlives devres release.
             .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
     }
 }
-- 
2.34.1

