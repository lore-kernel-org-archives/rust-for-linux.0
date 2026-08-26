Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32246AA80
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762177; cv=none; b=FHna+aXQY1z54HkscCDC7GOBQxXdY261qYjsjjGf9G7XORf47v4NZP/P/2FRbl3tPrRpWRKmhNEuy6Sm14HICCOVo7bkt3Pto25dWoyclvbtF1NVZt+vvEeWoziGTqfHiMLPVvm88DmWiLVOONbvol40YRcD/3sxZKNpBtFUf0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762177; c=relaxed/simple;
	bh=DIRCM2vMm7i3ZVyuxGIELlK0tOle5gnrlFzbg0DGhDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbYTf6fVI8U9YFGh18Ds4DAYzWlhidnGNt4S+yp1kea2K7fwLF2NZ33Kt7TkL3hq1cA+8TLH0zfl40tJQwfHPKtXYcacdvw2Ao1DnBdcrkWLulbPwXQ1HvbPzT8mlP55I/foVCSQmnJJL9sji6jD4YQuFuHt+6yvl0EAxk/XKU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=tAijGIgG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="tAijGIgG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so525085e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762168; x=1788366968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etS7dDlMuCWd3+VoKkG/reluEY3jsEXWbjkOvSEBEgk=;
        b=tAijGIgGPna1S2V++eRqVnXVqXsqTZiy1phKGaiHqJ9ATXWQF36C5UM5v8of+W1exS
         qwUJ17ynNl63COp9VjHOWSWddLrMosXOXa7+WPczqGnx6czdT8/9+ayf9H/mSCc7ww0q
         Np0ddMeWTJnvJu+H7ssdgSMCVwae9NtA0N+ZCOfK9gq7E/bW+0Bf7GnM2oSwkpcVjj02
         XJ++i4VmPxxHXdpvJQ3+JM70ZeVep/lGC22mpsYqDn0V/+dV2ZWGSalodj/E7LI9/Yv0
         o+5SPVyijDReXI64xznQlMqTsqy+advhv1gY2eZwvzLxPbxA5Km6O5KzFSe9hc6f67Cs
         ZMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762168; x=1788366968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=etS7dDlMuCWd3+VoKkG/reluEY3jsEXWbjkOvSEBEgk=;
        b=EBGcydbvl3Le7QD8B0mK+fNQNj8s3oq0S16WgyZSPEm9XBUPZ8LbvSDO+ar4TXmHZN
         rR/Rwc1jNDf2kUz4nh37rh3glQ5Zv+bM82vsTdaA6UWP6W89E0f+OqYDPOqV5HXh8QbH
         P3nudabyG6b96b5JulwATSciYiMt3iBuaSouBL18PtnsgBriCmjpdT2DwpazdbZC1fzO
         3wWbglqtd0VD7uf2cLNpBNuw7A3/ne8uPduv4PiTbal/igdCtd0HHH++clnFx9gGR2Rs
         0WmjiWrYdmj4x3tDhZs72+N7ALKgpTPfAYeMLQzu4wuse0EPVwX5nTDlTtAeg+IhjcPs
         QN4w==
X-Forwarded-Encrypted: i=1; AHgh+RrUXui9jK1u4tUNqJBODIq/M0M4Op6PZvVN2Be44ZLqsys4NljmAQPTMckZ6aQ7KaN1gBmwMiQ1yCI49aR9JA==@vger.kernel.org
X-Gm-Message-State: AFuF++ktZ3rMVvIqdM5cNNX/eofgjp/923oe1POCdqTQx+sQSXehNGq1
	qeuosTeJW3P5Fx8Bl0MH4S2OCBwMl72zZLH+2W0A0GTCAxU/wXA55bcewE5ATchASg==
X-Gm-Gg: AR+sD13HEiuSL+Eqzl16VcBSrCrlat5Lezm6z/zZqFuIqAxWZnksE5amkUfoji8znQp
	F9ZXHQvrvSjJADNlBNbJ8qbKc+Y6+bs39BSK8/8jGG3/nHhVH5Vwv0dtrWAtD6z+KvmNVeldbjl
	uD/T24nnsaOQNmroEpOYU4dk7CTv4Yp+haFHWpWBBQELgb1thFdB1ZAgI+QDFuNdEMzwyohKtRP
	se4kwnPf7k2KJwKPy6DWS82I7ZpySYncDhd3jNZmEc4rKhMxVbaJS7F/8+w2nKdqP7dweeiTJAD
	U5Z9z/31MYxo+RiX4/qWxK97XYf618cXwSYyfIMcBNaEELeDFWFEXHMPgHZPGG+CUEetgCpzUjJ
	GmsGsmFiyqEOoLX/4NlqT0vJlw2RJmgTp1sQK9+7q38idBfKTQ/FR8Io6EAp9G9wkCwDOn3YA3n
	PNkwonSVWk576s6/kSfZ1Exar59dkjgJmJhhS24niN/+NqDs/85Id9uBPf8/zFjW5kSleHit/Wm
	kXUJjAJYyDsqQlNyi7VV8pkoN0aDGbrYUkDgMsbFuZ4Fzg=
X-Received: by 2002:a05:600c:3151:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-49b0deb14d0mr4919895e9.3.1787762168128;
        Wed, 26 Aug 2026 09:36:08 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:06 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/23] rust: drm: pin the owner while DRM files remain open
Date: Wed, 26 Aug 2026 17:31:46 +0100
Message-ID: <20260826163359.4998-16-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give each Rust DRM device its own driver and file-operations tables
so file_operations::owner can identify the module that owns the
implementation. Open DRM file descriptors then hold the same module
reference that C DRM drivers receive through DEFINE_DRM_GEM_*_FOPS().

Pass the owning module to UnregisteredDevice::new() and use the
built-in null module for the shmem KUnit device.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/device.rs    | 46 ++++++++++++++++++++++++++++++++++--
 rust/kernel/drm/gem/shmem.rs |  8 ++++++-
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index bc2cdcd2b695..efbec3f42bda 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -208,9 +208,14 @@ const fn compute_features() -> u32 {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
+    ///
+    /// `module` must be the module that owns the driver implementation, i.e. `&THIS_MODULE`. It is
+    /// stamped into this device's `file_operations::owner` so that an open `/dev/dri/cardN` file
+    /// descriptor pins the module, exactly as `DEFINE_DRM_GEM_*_FOPS()` does in C.
     pub fn new(
         dev: &T::ParentDevice<device::Bound>,
         data: impl PinInit<T::Data, Error>,
+        module: &'static ThisModule,
     ) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
@@ -253,8 +258,37 @@ pub fn new(
             unsafe { bindings::drm_dev_put(drm_dev) };
         })?;
 
-        // SAFETY: `drm_dev` is still private to this function.
-        unsafe { (*drm_dev).driver = const { &Self::VTABLE } };
+        // Give this device its own `file_operations`/`drm_driver` pair so that the owning module
+        // can be stamped into the fops. `fops->owner` is what makes `fops_get()` in
+        // `drm_stub_open()` take a module reference for every open DRM file: without it nothing
+        // pins the module, and unloading the driver while a compositor still has
+        // `/dev/dri/cardN` in a poll set frees the `file_operations` out from under
+        // `do_sys_poll()`, which then faults on `f_op->poll`.
+        //
+        // SAFETY: `raw_drm` is a valid pointer to `Self`, still private to this function, and
+        // both fields are plain data that need no drop.
+        let raw_fops = unsafe { Opaque::cast_into(ptr::addr_of!((*raw_drm.as_ptr()).fops)) };
+        // SAFETY: `raw_fops` is valid, aligned and points at uninitialized memory we own.
+        unsafe {
+            raw_fops.write(bindings::file_operations {
+                owner: module.as_ptr(),
+                ..Self::GEM_FOPS
+            })
+        };
+
+        // SAFETY: as above, for the per-device `drm_driver` copy.
+        let raw_vtable = unsafe { Opaque::cast_into(ptr::addr_of!((*raw_drm.as_ptr()).vtable)) };
+        // SAFETY: `raw_vtable` is valid, aligned and points at uninitialized memory we own.
+        unsafe {
+            raw_vtable.write(bindings::drm_driver {
+                fops: raw_fops,
+                ..Self::VTABLE
+            })
+        };
+
+        // SAFETY: `drm_dev` is still private to this function; `raw_vtable` lives inside the DRM
+        // device allocation and so outlives every use of `drm_device::driver`.
+        unsafe { (*drm_dev).driver = raw_vtable };
 
         // SAFETY: `raw_drm` is valid; no concurrent access before registration.
         unsafe { (*raw_drm.as_ptr()).registration_data = UnsafeCell::new(NonNull::dangling()) };
@@ -277,12 +311,20 @@ pub fn new(
 ///
 /// * `self.dev` is a valid instance of a `struct device`.
 /// * The data layout of `Self` remains the same across all implementations of `C`.
+/// * `self.vtable` and `self.fops` are initialized before the device is registered and are never
+///   mutated afterwards; `self.dev.driver` points at `self.vtable`, whose `fops` points at
+///   `self.fops`.
 /// * Any invariants for `C` also apply.
 #[repr(C)]
 pub struct Device<T: drm::Driver, C: DeviceContext = Normal> {
     dev: Opaque<bindings::drm_device>,
     data: T::Data,
     pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
+    /// Per-device copy of the driver vtable, so that `fops` below can be referenced from it.
+    vtable: Opaque<bindings::drm_driver>,
+    /// Per-device copy of the DRM file operations, carrying the owning module in `owner` so that
+    /// an open DRM file descriptor pins the module.
+    fops: Opaque<bindings::file_operations>,
     _ctx: PhantomData<C>,
 }
 
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 86797ab39ffd..8751000c92bb 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -642,12 +642,18 @@ impl drm::Driver for KunitDriver {
         const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor] = &[];
     }
 
+    // These tests only ever build into the kernel image, so there is no module to pin. A null
+    // `file_operations::owner` is exactly what a built-in driver uses.
+    //
+    // SAFETY: `NULL` is the correct `THIS_MODULE` for built-in code.
+    static KUNIT_MODULE: ThisModule = unsafe { ThisModule::from_ptr(ptr::null_mut()) };
+
     fn create_drm_dev() -> Result<(faux::Registration, UnregisteredDevice<KunitDriver>)> {
         // Create a faux DRM device so we can test gem object creation.
         let data = try_pin_init!(KunitData {});
         let reg = faux::Registration::new(c"Kunit", None)?;
         let fdev = reg.as_ref();
-        let drm = UnregisteredDevice::new(fdev, data)?;
+        let drm = UnregisteredDevice::new(fdev, data, &KUNIT_MODULE)?;
 
         Ok((reg, drm))
     }
