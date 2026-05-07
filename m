Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92F31F98E;
	Thu,  7 May 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141796; cv=none; b=ZMw7zH5u3Rrm2nZhsQAWhXmNZ0eUjJ3Kkd3y4GdGsBrKRhzjjr562UzPDYJ5+pjTNWQGd62o7vECmBj6NKhmhAN1UF32Hl3aintiMe6s67P7ZMLq4D99E9h8tmJZRnSMpYP/tkopuM8CPFfbSMS2JMCfx0Wfi50hYdIEZIJhirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141796; c=relaxed/simple;
	bh=6xda8oXKX0uojRaffZcs5RTx23KRjIhdpJhs9rxooXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9e6RlePlc9wXYa3ZxVYTqoWhMcPnYHHNcEdgR0qaoOUuWsgXH6/KFHZKRD3eBgrxRkW4w/kQDy+LoUdlXm0ClNxlZUXc81Ln1theEqy2sx5Q1KJCSF3bJXPz1tK7ZDwPVjItq6EAXIR2VAD/6cTpdyprIXwTNsA704FrjfHCqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nOurzHQD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nOurzHQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778141391;
	bh=6xda8oXKX0uojRaffZcs5RTx23KRjIhdpJhs9rxooXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOurzHQDHN1EdMRZsZ7wdzST8791uyGTYaXwX9AUVVB++9ZYedo5bGt8teLH7YS3r
	 Yqq+mKnxO++7iLhrgj47qH++d0hh7w+Wbc20IvBjGtMXTZ2b9vm1FiGkuj0lWvh4m5
	 pugC+U0GuoXsNJTqgIaH4otpGHP8SO/PLLKX6/MEyLaLLT8593BmQ2btkIHgHd6Hd3
	 CZOWvcnVhVd3CPVjYC9pYZaVa2Qe6AgXZ6HGlovVh9usaeIkP/HZshFFGesuxhWAze
	 aczBzfA3PLMtfYxUhtw7h9qGuqBY+kP/x29CU04pmAz8gGiIwcvXb9tdcG7Ye0cGMr
	 X8WOUoAqaoS1Q==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8D3617E0E08;
	Thu,  7 May 2026 10:09:50 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	boris.brezillon@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v3 1/1] rust: drm: add FEAT_RENDER flag for render node support
Date: Thu,  7 May 2026 10:09:14 +0200
Message-Id: <20260507080914.95478-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260507080914.95478-1-laura.nao@collabora.com>
References: <20260507080914.95478-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add FEAT_RENDER bool constant to the Driver trait to control
render node support. When enabled, the driver exposes /dev/dri/renderDXX
render nodes to userspace. The flag defaults to false, drivers can opt
in by setting it to true in their Driver implementation.

This is then enabled in the Tyr driver, while it's left disabled for
Nova for the time being.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs |  1 +
 rust/kernel/drm/device.rs     | 12 +++++++++++-
 rust/kernel/drm/driver.rs     | 12 ++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index e20a5978eed6..f0c2d6e4db3a 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
     type Object = drm::gem::shmem::Object<BoData>;
 
     const INFO: drm::DriverInfo = INFO;
+    const FEAT_RENDER: bool = true;
 
     kernel::declare_drm_ioctls! {
         (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, TyrDrmFileData::dev_query),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index adbafe8db54d..abb51ae98a41 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -80,6 +80,16 @@ pub struct Device<T: drm::Driver> {
 }
 
 impl<T: drm::Driver> Device<T> {
+    const fn compute_features() -> u32 {
+        let mut features = drm::driver::FEAT_GEM;
+
+        if T::FEAT_RENDER {
+            features |= drm::driver::FEAT_RENDER;
+        }
+
+        features
+    }
+
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
@@ -105,7 +115,7 @@ impl<T: drm::Driver> Device<T> {
         name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
         desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
 
-        driver_features: drm::driver::FEAT_GEM,
+        driver_features: Self::compute_features(),
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
         fops: &Self::GEM_FOPS,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 5233bdebc9fc..6886396c8fa7 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -16,6 +16,8 @@
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
+/// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
+pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
 
 /// Information data for a DRM Driver.
 pub struct DriverInfo {
@@ -115,6 +117,16 @@ pub trait Driver {
 
     /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
     const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+
+    /// Sets the `DRIVER_RENDER` feature for this driver.
+    ///
+    /// When enabled, the driver exposes `/dev/dri/renderDXX` render nodes to
+    /// userspace. The render node is an alternate low-priviledge way to access
+    /// the driver, which is enforced on a per-ioctl level. Userspace processes
+    /// that open the render node can only invoke ioctls explicitly listed as
+    /// usable from the render node (i.e. marked DRM_RENDER_ALLOW), whereas
+    /// userspace processes using the master node can invoke any ioctl.
+    const FEAT_RENDER: bool = false;
 }
 
 /// The registration type of a `drm::Device`.
-- 
2.39.5

