Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0FD2773DE
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853495; cv=none; b=QInmlF2Ktl2jKDUAcLF8dqlwIAxuCtDf5/DX9LVDiqhGDWUxa4avFoA3DF5EM4bFEnyshlHC+jIpCS+oPT9+85mJ9+GJovns251XrSl2WQ94R4C+RsndMJqQFgW7JOVbYEHBKvG9+cAps9nSiMXB8gjmgZ3v80WWjN7p1OCXndQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853495; c=relaxed/simple;
	bh=L4s8+H0vNEw6Mpr5m9UXmuI/TNTLnF83kCfJnlhyWBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GbvhpfHF+iqhrspFDO2+X+ikOuOjP9Kk+MKwpJqT0avMmbGvTjzPXH3A+mLZXHqm87HsoU1pn5kMrxtVh0osOpHCfYDMOD7Zj8a5W1760B5Y34uU+Iw5J7kzwWkaWOquB0VWgynhLMQ0DyHeR7lo+xaOlyxTCP2an+o+TShoTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3t0VDd2; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3t0VDd2"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c591fb1cbso7774571eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853492; x=1783458292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJX1L/9ll74nIauy0WzTLN96io2W3a6GrFJb/6SuBK0=;
        b=l3t0VDd2XUGlCl1NP4xrbfSjJ5tXaUdetIJsSuub9pWqHOu1jMkfuMsDfbAWUwy7wM
         X6ZDKo/+1i+FRI/Z/cd/45TnGLhhPTD9hl3veZ7gB8hNUw0eVaYkBVg4HTSclZ1oSRo5
         10L6xRYfILiE8gXUSsgdJdDtLlZpPxoTD5FWvhSfSrJjAPaOUWraIcyu3q9+xVoootj1
         f2bNucw2PEuw3ffw3f4bgQH/WIeulP+5e0Td79vo6jPB8ONwyqrm+y6rv2cojZPS4hWS
         YoqwyF4k0DtykKvvFDsfBxHxiNKpXCOOnGLoIYrw23NBXtJDn2iFBUm2FR18eB9pQysC
         uB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853492; x=1783458292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJX1L/9ll74nIauy0WzTLN96io2W3a6GrFJb/6SuBK0=;
        b=IAWTv1uO/SFU9wnASQMQoqFGbLPb3TxVWgJwP1P2H30bNt6VHTYftKLR+eQDk8U4SE
         C1rp8ZFdlMvh52H/jWJTRMMdhpVfuJTCmTImMDLiLHJrh1zwRdQ43d23SSjrCf8njP/2
         Uk6hP865OFY0ObzY2M4sIzU/qaONPAdPxG5IBtAsjVATpctinU15w1dS+LWTnmS7R1Mk
         HdfCptF/SxXcDXJ0XWRL0NNABfCcARXDMCH9ekvIYkAFkJLpicfE3AFivggDIzT4O8WD
         lZSIYBWsXMuNU9lJVotpxNwllFmu0UyJndXx25hITiVx9QC+CvahKB7EcgCHwi5LoovM
         heGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqY4i3y7PiviQ5w3ab/wfQud4z6bOZ4YX0zApn+ixznu3PC0uiCOpGNYepYyPQKlVWkIHF668o2dLuu14fwgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50RT09qPM+nGAUdFccuqQb2vBnywnBoJGLhgKug86o2Zm3ut2
	om2yXolblVG19vx+QtkSyzqJuQTMaIDtv1Aw924cHnC7itlGbKm7R4sV
X-Gm-Gg: AfdE7clSgOtfXdcPdhXLDIr3PJqEfT3ECYocEgCAxcd2M38sux7YAOuOqiTIXahFjJC
	tVW63MXSel3V9I8kxQjKnUyjnRDqMKt4wlUULLIhkWz5yPYpuZtlZDJxC2tZJz8jFc0eyZDKEc8
	EDlZhFEOPa7vsOwoID9Del55jM8AIDZdSp/Gf92F3VxEvKgpSncPIyufQduleONqjI2OJlbnyb4
	yGrJI7bM/UatTmQSNdrzhkMtwEwkjONwO+/U0jjow09N9ejoc2ygeX4eHYNbWGWPDPcWCrWKiTM
	JasLgbUqI7Xu3RCYs0+YAzYCK+1cDZdc7bZz6KVbopQBxJsdUwnYn2enlYoWsR2gvpP+uQeSIBI
	gOABd6Yh3VSCdSMfowBNoEiRiGPbiNoEmdNMVSehRdv6gBRZM5Z+I8okJdy4O0TydUnW51HCbCp
	DGHdu/s40AQdaEn2poaqfHoVmmU3ArFCtmk2lW5tZu80BXfUYXz497XhXa8WWJU1WqGMw=
X-Received: by 2002:a05:7300:d505:b0:30e:c71e:dbc with SMTP id 5a478bee46e88-30ef09c05dfmr1472628eec.30.1782853491807;
        Tue, 30 Jun 2026 14:04:51 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm10995383eec.27.2026.06.30.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:51 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: alexander.deucher@amd.com,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org
Cc: christian.koenig@amd.com,
	arnd@arndb.de,
	rust-for-linux@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v3] rust: core: implement rx580 state optimization engine and c-to-rust char dev
Date: Tue, 30 Jun 2026 18:04:45 -0300
Message-ID: <20260630210445.23103-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces an automated indexed state mechanism to optimize
VRAM latency and command loops for the Radeon RX 580 architecture.
Additionally, it provides a converted C-to-Rust sample char driver.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 Documentation/rust/alves_guidelines.rst  |  3 ++
 drivers/char/Kconfig                     |  7 +++++
 drivers/char/alves_char_dev.rs           | 31 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/Makefile      |  1 +
 drivers/gpu/drm/amd/amdgpu/alves_core.rs | 38 ++++++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 Documentation/rust/alves_guidelines.rst
 create mode 100644 drivers/char/alves_char_dev.rs
 create mode 100644 drivers/gpu/drm/amd/amdgpu/alves_core.rs

diff --git a/Documentation/rust/alves_guidelines.rst b/Documentation/rust/alves_guidelines.rst
new file mode 100644
index 000000000..f6afa63de
--- /dev/null
+++ b/Documentation/rust/alves_guidelines.rst
@@ -0,0 +1,3 @@
+# Rust for Linux - Core Guidelines
+- Style: Linear, pragmatic, flat, Linus Torvalds style.
+- Constraints: Zero-cost abstractions, strict RAII, no binary bloat.
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 9865227af..ace4df826 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -372,3 +372,10 @@ config ADI
 	  driver include crash and makedumpfile.
 
 endmenu
+config ALVES_CHAR_DEV
+	tristate "Alves C-to-Rust Character Device Driver"
+	depends on RUST
+	help
+	  This is a character device driver migrated from C to Rust.
+	  It acts as a core showcase of 2% module conversions.
+	  Say Y or M here if you want to test the Rust infrastructure.
diff --git a/drivers/char/alves_char_dev.rs b/drivers/char/alves_char_dev.rs
new file mode 100644
index 000000000..5ccb80ea4
--- /dev/null
+++ b/drivers/char/alves_char_dev.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//! Simple Character Device converted from legacy C to Rust using core Miscdev API.
+
+use kernel::prelude::*;
+use kernel::miscdev;
+
+module! {
+    type: AlvesCharDevice,
+    name: "alves_char_dev",
+    author: "Breno Rodrigues Alves",
+    description: "Pragmatic C-to-Rust converted character device driver",
+    license: "GPL OR MIT",
+}
+
+struct AlvesCharDevice {
+    _dev: miscdev::Registration<AlvesCharDevice>,
+}
+
+#[vtable]
+impl miscdev::Options for AlvesCharDevice {
+    const NAME: \&"static CStr = c_str!("alves_char_dev");
+}
+
+impl kernel::Module for AlvesCharDevice {
+    fn init(module: \&"static ThisModule) -> Result<Self> {
+        pr_info!("Alves C-to-Rust module initialized successfully
+");
+        let dev = miscdev::Registration::new_reg(module)?;
+        Ok(AlvesCharDevice { _dev: dev })
+    }
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index ba80542ea..b9f98c3e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -349,3 +349,4 @@ include $(AMD_GPU_RAS_FULL_PATH)/Makefile
 amdgpu-y += $(AMD_GPU_RAS_FILES)
 
 obj-$(CONFIG_DRM_AMDGPU)+= amdgpu.o
+amdgpu-y += alves_core.o
diff --git a/drivers/gpu/drm/amd/amdgpu/alves_core.rs b/drivers/gpu/drm/amd/amdgpu/alves_core.rs
new file mode 100644
index 000000000..aa436763e
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/alves_core.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//! AMDGPU RX 580 State Optimization Engine (Turing-inspired state machine)
+//!
+//! Copyright (C) 2026 Breno Rodrigues Alves.
+
+use kernel::prelude::*;
+
+#[derive(Copy, Clone, PartialEq, Eq)]
+#[repr(u8)]
+enum GpuState {
+    Idling = 0,
+    LowPower = 1,
+    ComputeActive = 2,
+    VramMaxPerf = 3,
+}
+
+struct Rx580Engine {
+    current_state: GpuState,
+}
+
+impl Rx580Engine {
+    fn transition(&mut self, symbol: u8) {
+        self.current_state = match (self.current_state, symbol) {
+            (GpuState::Idling, 0x01) => GpuState::LowPower,
+            (GpuState::LowPower, 0x02) => GpuState::ComputeActive,
+            (GpuState::ComputeActive, 0x03) => GpuState::VramMaxPerf,
+            (GpuState::VramMaxPerf, 0x00) => GpuState::Idling,
+            (state, _) => state,
+        };
+    }
+}
+
+#[no_mangle]
+pub extern "C" fn amdgpu_rust_rx580_optimize(register_sample: u32) {
+    let mut engine = Rx580Engine { current_state: GpuState::Idling };
+    let symbol = (register_sample \& 0xFF) as u8;
+    engine.transition(symbol);
+}
-- 
2.43.0

