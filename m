Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA634657E7
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708564; cv=none; b=i5Aps1/QZXBOSdNCaRE70izMj+nc+jP+iJrejHDA99ATf0y2dpasfIL8wmsoJ7tfuqqaoju9Y1Zk0vxURIGU2BVCU+8CKUtJpAfBpM6qoIILueSWMeQHQPCjx8HYftJg5hKwMO8j6CCgF7Fgk6H/jJfr1FoEP3GNd+jxYokdgy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708564; c=relaxed/simple;
	bh=gqAtENKoqsguNMa3AdE14MaO9cSMGHCt0HIR5weHfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcd4WRb0ShCEtIiRUAiVtf5bGNs9FxMuIRaQrxcAYakWE7/sxdB4nOardFsB4vxtSpBTjLOFzBHY1l+GRmbbZnQdnW2i7TVP53xJmiDnEdj8fOzx4djtVNl8CtpGAHAz6USZld8Ssh4veDc2frcm3gBHzUQpRrZIadqsTxEi9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=QabgRW/o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="QabgRW/o"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49222fb062bso49387845e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708560; x=1782313360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmpePbxtzwGXfx66Hl40vv7cxeZbUjsiMgIwVm4k9pY=;
        b=QabgRW/o8lgVxD2/D6qBhfQCjLjwpiYqWhXsRnvtsJRPN2YCeq7Bgnr1gJn4fejMA2
         gSMpLsRO8QZWIEC5k9uBHFmS/p4DHwghkZwQqhLoCF2Kn6PkjAX/Pn4SkSDhUc2+CTKD
         tEjQpw2m6Fuq6/TxhProm44b2IByUYudKLOOz6ZWQ62CvzzBRiNEfsfwhc6OwAsA52YP
         qKY9sPsKuslHFCLN8xAZE3HeVQP4A2oBMIIUfAGTr1TwH680INR0HCcF1LStpWDF1g14
         cJMtuxS6bkvPmy/M3yQ6OXf93eXDw66RHmFMJHzohezNSVuHvH1AKlEqty8TniU3KrpC
         GXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708560; x=1782313360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmpePbxtzwGXfx66Hl40vv7cxeZbUjsiMgIwVm4k9pY=;
        b=T5DjZJzHhOVvJ8TdBDnytlC4VGKlvjF9tkpnKKqNugcRFk95bDcWqdMuJR3mE99UiJ
         eG1TIXrZJP3HodmDGIApLVShLKIHZsW8hfD1a/64qM+S23CQzTVM23A1rILNbTbqpDbb
         /9DbEe1w7TirvzUI5Z38vTAckcW8EFDX8NromJ5CTeAu/hQvmKqkHaQEGFHFZkBFQj9D
         5JwXpsSSi0ffQRGcAU3JKkjRtIDBbDwQquCnSzdQQ63RkvNUXJK3hwM3Ap6c9xrRV9tB
         c0MtgDvCHq/qq8yP/NuHWc3TspqLoPqGjxWhsN8RzGjh5F4EtxwECRmYJiU8CUHkmzwL
         F5Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+/wLzTkN6ws8e8QQ2g+n1lyltdxk0aG9DHuCooyr4CwLWv15PPsWAW2NG+8Tq5eDjz9vNlTuJ6Ve1h94MNbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwswN5pUV08fb6CntRFpH/5amZnDFpG8qWz6Fb9DFxG66nW6jxt
	ISPLlguVn+WSNHy+EvS1tKJH2XFsAXrTEa+fODvGnCmbLJRjIWorT/41D9zjccxiOg==
X-Gm-Gg: Acq92OGkV/e+nhMl+mnooBT4HYCam1AsGmvEtnY7N4wd7c6iztfXfr3sG8FLSR7E7bO
	Bo2or79uTCgo1+gv120Hc+a62Gxm9VR9CgYYMxgKpW7Q5pZ1SG9JlKUy2UStqZQzDN8fKINeRQS
	UfY/wdG4iUU8k9GTYAKl6hYFWwjyV4N55DJOWuAKI34+x1RJ63rp1RE5KPwsxv0deJL4ZOnGbez
	4K/aP2Q3zZ5S9sZ6zzcOTiLqEYRHi1nmIxgcpcmf6+X02/dsOlz3DqTXmolyYKZCwWA6P6XTxxZ
	CwQMaioavO05Y0jRjRIQJhxIhxBPOEp9NtLLGKqK6xNJEMoaXgZms29wLSJ+NIqrX66Qi4Fl2dk
	dvrY9e/lsLwKryVQgH+T18zz0zBpng0Wu2vorUmyudSEro5BcnPzVGLRi2nuJw5VkPwJ4eUTRBI
	Dy3y5GAPy3FXUZsosU/SmXCXbq1W4MLP9RLYRfrmjr+5B7rIeCZH+ktt+r
X-Received: by 2002:a05:600c:4e02:b0:490:c2a3:1781 with SMTP id 5b1f17b1804b1-492333f7765mr76370435e9.34.1781708559486;
        Wed, 17 Jun 2026 08:02:39 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm57264311f8f.11.2026.06.17.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:02:38 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/4] rust: drm: add minimal KMS bindings for simple-display-pipe drivers
Date: Wed, 17 Jun 2026 16:02:23 +0100
Message-ID: <20260617150232.2210-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150232.2210-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust DRM abstractions currently cover GEM and the device/driver
registration boilerplate, but expose nothing of the KMS (mode-setting)
API, so a Rust driver cannot bring up a display pipeline without
dropping to C. Add the minimum needed to drive an atomic mode-setting
pipeline built on the drm_simple_display_pipe helper (one CRTC + a
primary plane + encoder), the same path simpledrm/gud/udl use.

Two pieces:

 - bindings_helper.h: pull in the KMS headers (drm_atomic_helper,
   drm_connector, drm_gem_atomic_helper, drm_gem_framebuffer_helper,
   drm_managed, drm_modes, drm_modeset_helper_vtables,
   drm_probe_helper, drm_simple_kms_helper) so bindgen emits the
   drm_simple_display_pipe, drm_connector, drm_display_mode and helper
   bindings a KMS driver calls (drm_simple_display_pipe_init,
   drm_connector_init, drm_helper_probe_single_connector_modes,
   drm_gem_fb_create, drm_cvt_mode and the drm_atomic_helper_* family).

 - drm::driver: add FEAT_MODESET / FEAT_ATOMIC and the matching
   Driver::FEAT_MODESET / Driver::FEAT_ATOMIC associated consts, folded
   into compute_features() exactly like the existing FEAT_RENDER. They
   default to false, so GEM-only drivers are unaffected.

No safe CRTC/plane/connector wrappers are added here; this is the raw
binding surface a driver needs to call the C helpers itself, and is
meant to be superseded by the in-progress safe KMS layer. The raw
drm_device pointer those helpers need is exposed by a separate follow-up
patch ("expose drm::Device::as_raw()") so the escape hatch can be
reviewed on its own.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h |  9 +++++++++
 rust/kernel/drm/device.rs       |  8 ++++++++
 rust/kernel/drm/driver.rs       | 17 +++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 14671e1825bb..877f82b927a0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -32,13 +32,22 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 477cf771fb10..1d3319b713e2 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -165,6 +165,14 @@ const fn compute_features() -> u32 {
             features |= drm::driver::FEAT_RENDER;
         }
 
+        if T::FEAT_MODESET {
+            features |= drm::driver::FEAT_MODESET;
+        }
+
+        if T::FEAT_ATOMIC {
+            features |= drm::driver::FEAT_ATOMIC;
+        }
+
         features
     }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 25f7e233884d..6a79594510fd 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -22,6 +22,10 @@
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
 /// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
 pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
+/// Driver supports mode setting (KMS).
+pub(crate) const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
+/// Driver supports atomic mode setting.
+pub(crate) const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
 
 /// Information data for a DRM Driver.
 pub struct DriverInfo {
@@ -131,6 +135,19 @@ pub trait Driver {
     /// usable from the render node (i.e. marked DRM_RENDER_ALLOW), whereas
     /// userspace processes using the master node can invoke any ioctl.
     const FEAT_RENDER: bool = false;
+
+    /// Sets the `DRIVER_MODESET` feature for this driver.
+    ///
+    /// When enabled, the driver advertises kernel mode-setting (KMS): it owns a
+    /// `drm_mode_config` and drives CRTCs, planes, encoders and connectors. Leave
+    /// `false` for a render-only (GEM) driver.
+    const FEAT_MODESET: bool = false;
+
+    /// Sets the `DRIVER_ATOMIC` feature for this driver.
+    ///
+    /// When enabled, the driver advertises the atomic mode-setting uAPI. It only
+    /// has an effect together with [`Driver::FEAT_MODESET`].
+    const FEAT_ATOMIC: bool = false;
 }
 
 /// The registration type of a `drm::Device`.
-- 
2.54.0

