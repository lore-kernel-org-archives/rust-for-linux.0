Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB50546F486
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762525; cv=none; b=giGsKLQ+rqDVLuKt+59Uu/5ETCOYtRgJuhROBEPZD7a1cYAWye/oUQIDN7BgKsjTgp1W+hh7Mebw2DoqKwD5gLSE1AmxVI7fmw8zAE1IHJzsm8wsn88L85oD+lUZ7yXdODOkVdiSLRYbj2X0kRtsCMwJBHusIWHKrIWf2VAKHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762525; c=relaxed/simple;
	bh=GRh+ADm59DlQaArvAetjOKX+4NgwRUV/PdzCMvPtp1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvrZd9HqIFNmHLsigwpBRs+sg5fxU2FoAYKnURXixZ++zTBHbesITsQLFDd2SEq7o9INONnVp95fy4rd1bc9qDW7RWGAof3D77PjITO/Txf0oQBZ8YYSJN6gBqzfPLFOqQJNC8rUp4seymR+WhuD6j582o5Poj6xZ8wt74Ajbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=WBJCX7eA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="WBJCX7eA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so555305e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762484; x=1788367284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64TYoztfjTxz6bZJgz8b/VUNCXdb2tzD8EdoWyK7qS4=;
        b=WBJCX7eAAePY+eZapTgVaP2/NcUE8/pA8Y1B7pl+Z9Hgoh+ai14AWliO0hNzL3QUVm
         cyExmL4elYyL2xIRPUhGR34/ckbWEq4i6PkWf4LixWwxneug2XGPx4ZWGDeBxINNxz6t
         NQotb2o3Noxf8XwuIpRGIE3bUm4VU62BfpVpOeNMHBCMNyDifW4MM1XjLcuxqv6fh7wd
         HRi9RvwCRykLAf1egczIWRc1SY59NZ/c1CUbKJ/LfREmD5RBYoQYc/q32XUx4fDtgSqc
         povBkIsKCVUdR16PfuqMdxfuwH/hB8tjyQWq1ohRXXyWnPZ2q+kOaEeJ3A2EnNf8mfQ/
         HxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762484; x=1788367284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=64TYoztfjTxz6bZJgz8b/VUNCXdb2tzD8EdoWyK7qS4=;
        b=AxljY98YyzEmam304zp9gc1xE/NWutzXdzeA9rl3d3jZIgpJoXeRZJ8m0VIjmpRUka
         CEn8ImyeOeqc3U87BwLV6Y6tQwaJ38WxRBEFv2pegito5rus6M44mIO164EksSP3cktY
         ARJFzr02eNdmU8uHgTQnVjAM/nHVn60AsjCH6wzMXi0VbBAoFFKKylAKEcY3Y+hEm9B+
         1MaqwyGro24kBn0L7t51HR7hrWCjVlcBaXawlrb1t5yjT2tsOJS/EMrqJLLSTuXsYDvE
         FUoSHw+JPDaNEGVe+hcP/JhcA04Tx3sI4S+3oauEY/RVD3ktp+U39Mi7oYwntOPdKzR7
         3b+A==
X-Forwarded-Encrypted: i=1; AHgh+RqdhzWPTVVWGo6+0dboJq84tlj+BnJWHPOGiO7W6wYgtWx1NzWZrj/X6g3SqkuzlQsMRbJbPR2FrUJpG8B0BA==@vger.kernel.org
X-Gm-Message-State: AFuF++mCdvuOurt8rpUzzTie7AGS7QrtGbaLJ57dseKEZFnaabq7zY29
	4y7Xzre84ubwRysYsGdm3d9xwbHRiW6O69wt4p/6G5+caXwOLvjlGOrMfqUocvcn+A==
X-Gm-Gg: AR+sD10gPYfw6XC72DJRbShjePf6peEiEeVG8pLKYl/YKjyBdYqYNZVEc7tNgSWWwCd
	UezWUWPz76u9nuif5mDhmsth0yJLocW7b2OiVRSEssRu8Bf732Mv3mtunh1Sjv0BSZqUWNTpgoX
	64zBUZ1rMuJgHnJW5sHrXYDKDmfQSNtlkA7t+pPC5Oec0CahftgiQ0i62aqKMvdbf9pNkbMIVD+
	wWw96IFQBYRh17ukctQXOKSVsm+YGXmwQkez3U4pZXBjuz4fb//IDmMbXDNhHQtTU8JkwIu4KPm
	BriLpHXNZmL/OsrVn2VnyaCjQoCtGqkbKKwSkY/sx8GuYTEbXelbIE/BF3hW3sYdxz6UnDGaObt
	UJ7nkqqv9/YvaJqH9rfi5U9zdnURaGDw9LapF/6zN/c2VqT/G4bwsXkqFwgzQYaBLG/9+qtdmDb
	5Ucc+c2a9OaaHBP3arhlMJ7HqB1pmoBjWgPHIkqVi/0M5svufgsLHGoWcIPe56XCzGz3mr6fjPk
	ZipYJebQt/hjXCXqzo3YkXDwD6TGP11suQvY3IFjV2kX9E=
X-Received: by 2002:a05:600c:3e8e:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b0dfd7d2cmr5041365e9.7.1787762484634;
        Wed, 26 Aug 2026 09:41:24 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:41:22 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 12/13] drm/vino: allow the driver to be built
Date: Wed, 26 Aug 2026 17:37:37 +0100
Message-ID: <20260826163913.7052-13-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163913.7052-1-mike@fireburn.co.uk>
References: <20260826163913.7052-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Kconfig entry, the Makefile rule and the MAINTAINERS record, so the
preceding commits become a module.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 MAINTAINERS                   |  6 +++++
 drivers/gpu/drm/Kconfig       |  1 +
 drivers/gpu/drm/Makefile      |  1 +
 drivers/gpu/drm/vino/Kconfig  | 42 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vino/Makefile |  2 ++
 5 files changed, 52 insertions(+)
 create mode 100644 drivers/gpu/drm/vino/Kconfig
 create mode 100644 drivers/gpu/drm/vino/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b548bba6525..79ccf112fabd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8537,6 +8537,12 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/udl/
 
+DRM DRIVER FOR VINO DISPLAYLINK DL3 DEVICES
+M:	Mike Lothian <mike@fireburn.co.uk>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/vino/
+
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Louis Chauvet <louis.chauvet@bootlin.com>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 323422861e8f..ac73fc425c59 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -358,6 +358,7 @@ source "drivers/gpu/drm/vboxvideo/Kconfig"
 source "drivers/gpu/drm/vc4/Kconfig"
 source "drivers/gpu/drm/verisilicon/Kconfig"
 source "drivers/gpu/drm/vgem/Kconfig"
+source "drivers/gpu/drm/vino/Kconfig"
 source "drivers/gpu/drm/virtio/Kconfig"
 source "drivers/gpu/drm/vkms/Kconfig"
 source "drivers/gpu/drm/vmwgfx/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e635fcffd379..29ab96f6e8de 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -185,6 +185,7 @@ obj-$(CONFIG_DRM_VC4)  += vc4/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
+obj-$(CONFIG_DRM_VINO)	+= vino/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
 # nova-drm is built from drivers/gpu/Makefile together with nova-core.
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
diff --git a/drivers/gpu/drm/vino/Kconfig b/drivers/gpu/drm/vino/Kconfig
new file mode 100644
index 000000000000..fcc761b4654b
--- /dev/null
+++ b/drivers/gpu/drm/vino/Kconfig
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+config DRM_VINO
+	tristate "DisplayLink DL3 (Vino) open driver"
+	depends on USB
+	depends on DRM
+	depends on RUST
+	# RUST_DRM_GEM_SHMEM_HELPER depends on MMU; inherit that dependency here so the
+	# select below cannot generate an unmet-direct-dependency warning on nommu.
+	depends on MMU
+	select DRM_KMS_HELPER
+	select RUST_DRM_GEM_SHMEM_HELPER
+	select CRYPTO_RSA
+	select RUST_CRYPTO_AKCIPHER
+	select RUST_CRYPTO_LIB_AES
+	select RUST_CRYPTO_LIB_SHA256
+	select FW_LOADER
+	select RUST_FW_LOADER_ABSTRACTIONS
+	select FW_UPLOAD
+	help
+	  Open in-kernel Rust driver for DisplayLink DL3 docks: the DL-3x00
+	  port replicators, the Dell Universal Dock D6000 and other DL-6xxx
+	  docks, and the DL-7400 quad-display docks. A dock is matched on its
+	  USB function rather than on a product id, and identified from the
+	  vendor descriptor it carries.
+
+	  It binds the dock over USB, runs the HDCP 2.2 control plane, mode-set
+	  and the Vino codec, and registers a DRM/KMS sink that scans out to the
+	  dock's video endpoints.
+
+	  To compile this as a module, choose M here: the module is called vino.
+
+	  If unsure, say N.
+
+config DRM_VINO_KUNIT_TEST
+	bool "KUnit tests for the Vino driver"
+	depends on DRM_VINO && KUNIT
+	help
+	  Build Vino's protocol, crypto and codec unit tests into the driver.
+	  The tests run when the driver is loaded, so this option is intended
+	  for driver development and test kernels rather than normal use.
+
+	  If in doubt, say N.
diff --git a/drivers/gpu/drm/vino/Makefile b/drivers/gpu/drm/vino/Makefile
new file mode 100644
index 000000000000..6e39668040f3
--- /dev/null
+++ b/drivers/gpu/drm/vino/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DRM_VINO) += vino.o
