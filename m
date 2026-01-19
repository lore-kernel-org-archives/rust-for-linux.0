Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE0B2F12CF;
	Mon, 19 Jan 2026 23:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768865735; cv=none; b=uvIP7BlCWXMNrKA0opoNykE50MIxVKIYtClSBI5hOZIu/PcmQOgx7xG2zaWrapr2JATG7LVYRIt9/Hd1yPe2QOdRXRentsLIGev3YPVPawCFUHCxuUbbd2V4CefRMfsZkszhT+nsXPWR7XDXNU8s3QGRBFTm9uu6uwTtGik6UtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768865735; c=relaxed/simple;
	bh=EIDY6ukxUEx2jxZ91hlUz1UpHM1wcNP5YSPiCVbXIpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtBsIlwMN4+9OHMM/QYqh/jpjyLCMZYDIFZbf3uAQbTPs7LGQHufi9mfQRpD6e8DUYrC8quVVsg48+s2B2AlCVFn025Dvq2qLfb+pvZHHMli4hnWtfgoqtDqrFk6rTI5cJCaxcLAgYbk699KypMrJmWMDEw+zEylimWFw2CGcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WPACwENQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WPACwENQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768865725;
	bh=EIDY6ukxUEx2jxZ91hlUz1UpHM1wcNP5YSPiCVbXIpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WPACwENQrJn3WLax62DYRlEEkSjznVzkFa+CO+Ru2XXDU6nrutxv/Yt5Sj2st5FGn
	 rux1XlNr1livVuP8LOlq1VaiME27uNcZ4nUtu2b4CYbWYzmZZOEwjZ/NZ2Ay6NSgdd
	 HsBn0VxB1GIndrkL4p82PoH6twHWDt40xwtuObIR+0JZxKYBtOCWh+SAEozhJ+sBu0
	 LdRgKH8C0ozAy8htp3w0ysE9EaEHqinZQTLVYGKnqUf/rqLMJsF1URqJHSWRZMLAzB
	 KLcV+xHLEEdLjsv/WbjXMw8fSnTDwc98R3Lmi8JJK5eZk2o2LWhVrekfFNrKkFOWmX
	 sef/a4LfZrfhA==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BA6B17E0FFA;
	Tue, 20 Jan 2026 00:35:22 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 19 Jan 2026 20:34:47 -0300
Subject: [PATCH 2/2] rust: drm: add FeatureRender
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-render-v1-2-8326e4d5cb44@collabora.com>
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
In-Reply-To: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.14.3

Add a feature for drivers willing to expose render nodes to userspace. This
comes with an added safety requirement in the DriverFeatures trait. This,
in turn, exposes /dev/dri/renderDXX nodes that can be used by userspace to
control the device.

This is then enabled in the Tyr driver, while it's left as NoRender for
Nova for the time being.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/nova/driver.rs |  4 +++-
 drivers/gpu/drm/tyr/driver.rs  | 12 +++++++++---
 rust/kernel/drm/device.rs      | 10 +++++++++-
 rust/kernel/drm/driver.rs      | 37 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 247a05f7b3a7..4de1e4cfdc5d 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -73,4 +73,6 @@ impl drm::Driver for NovaDriver {
 // SAFETY: This trait requires implementers to observe the safety requirements
 // of each enabled feature. There are no features enabled, so this is safe by
 // definition.
-unsafe impl drm::driver::DriverFeatures for NovaDriver {}
+unsafe impl drm::driver::DriverFeatures for NovaDriver {
+    type Render = drm::driver::NoRender;
+}
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index ec2aa30515a1..c12ad8467605 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -192,9 +192,15 @@ impl drm::Driver for TyrDriver {
 }
 
 // SAFETY: This trait requires implementers to observe the safety requirements
-// of each enabled feature. There are no features enabled, so this is safe by
-// definition.
-unsafe impl drm::driver::DriverFeatures for TyrDriver {}
+// of each enabled feature.
+//
+// For `FeatureRender`: we do not call modesetting APIs in our ioctls, and we do
+// not use any APIs requiring a DRM master. Furthermore, it is not possible for
+// a client to interfere in another client by design. This is enforced by the
+// `VM` layer and, at a lower level, by the system's IOMMU.
+unsafe impl drm::driver::DriverFeatures for TyrDriver {
+    type Render = drm::driver::RenderSupported;
+}
 
 #[pin_data]
 struct Clocks {
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index cfc2f34e8cc2..b2c2e6c195af 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -62,7 +62,15 @@ pub struct Device<T: drm::Driver> {
 
 impl<T: drm::Driver> Device<T> {
     const fn compute_features() -> u32 {
-        drm::driver::FEAT_GEM
+        use crate::drm::driver::FeatureRender;
+
+        let mut features = drm::driver::FEAT_GEM;
+
+        if T::Render::ENABLED {
+            features |= drm::driver::FEAT_RENDER;
+        }
+
+        features
     }
 
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index fdfd083ba2b6..331a998e47e4 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -15,6 +15,9 @@
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
 
+/// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
+pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
+
 /// Information data for a DRM Driver.
 pub struct DriverInfo {
     /// Driver major version.
@@ -182,4 +185,36 @@ fn drop(&mut self) {
 ///
 /// Drivers implementing this trait must ensure they comply with the safety
 /// requirements of each supported feature.
-pub unsafe trait DriverFeatures {}
+///
+/// - For drivers implementing `FeatureRender`:
+///
+/// The render-accessible subset of the driver's functionality must not allow
+/// clients to interfere with each other or require master privileges. In other
+/// words, any ioctl declared with [`drm::RENDER_ALLOW`] must not call any
+/// KMS/modesetting APIs or require `DRM_MASTER`.
+pub unsafe trait DriverFeatures {
+    /// Feature for render nodes.
+    type Render: FeatureRender;
+}
+
+/// Controls whether render nodes are supported via `Self::ENABLED`.
+pub trait FeatureRender: drm::private::Sealed {
+    /// Whether render nodes are enabled.
+    const ENABLED: bool;
+}
+
+/// A marker type indicating that the driver supports render nodes.
+pub struct RenderSupported;
+
+/// A marker type indicating that the driver does not support render nodes.
+pub struct NoRender;
+
+impl drm::private::Sealed for RenderSupported {}
+impl FeatureRender for RenderSupported {
+    const ENABLED: bool = true;
+}
+
+impl drm::private::Sealed for NoRender {}
+impl FeatureRender for NoRender {
+    const ENABLED: bool = false;
+}

-- 
2.52.0

