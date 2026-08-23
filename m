Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B05366048
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787482274; cv=none; b=rD2CJDpKu1QSG0yfPtal8UzUuqkWNylSTtBVtURhCE62NI30qmv65abbGps06+aP//PxtpLi0gn2vl/QkIU9NNRBQtC6FgJ/dlWMmp5CpbEQKqVU4sX5KqkVbgzgEXNr3BdqhJqhHtSsF99g4FTfNXckE+90PHLEl8+7vOXWo9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787482274; c=relaxed/simple;
	bh=+sDav60/7pt8/HE2JYkGOPK4IzU3WO2QSuIFtXJRTL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHZAK4LF3nDkGMxQjsVwSLNq51KJmmStlcSRR40X1QLFJRgFl5WrTrKSFB6320e3MgXjh6P7G67KS35VnpJGomTAkJkSfYdQuPqwxieak11PfNFB/WeP6KmuT1O5GkHZpsQ1yyW4h3E5SiBQVNoxSRdGBHsakaSb/3eQeGyRlW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=ESEovgHG; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="ESEovgHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787482261; x=1787741461;
	bh=Hur3ADIaCcusTzxbTebC/Ylg9Grzu5lROGSsmsYOWzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ESEovgHGVHLijgbnL8oti06E/PO9OGSetFj3QMVIW7khpByMuL8p70O1dMRg4Q0Ls
	 kvFlw49DLC8xVA6rt+CmNYqnkv0A/XeKidWYIjv2uQblVLTbOSYT15hcjikSlxuT3c
	 kUfYBmfWeK0+UqBPnsvSJ0cWkznNWxoc2t7ODbjdbTQ2cMHNMMY3L0ia9R8wiJ18So
	 Ek1nEgEWugDcAEwfw/bCVxmu9mczizYCXqigwy29+FIvUHgvoV5uC8QGMdPw/1Ww+J
	 VycWmnKceXnGQxNkqdCSsCaNqF1rxyUYmwdKFueFHN7QNspcPm+ZbsRjgXX6FNGZ99
	 vCghstrT2Ap/Q==
X-Pm-Submission-Id: 4hSW6n54NPz1DDX4
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 1/2] drm/tyr: move reset work to platform driver data
Date: Sun, 23 Aug 2026 13:50:07 +0300
Message-ID: <20260823-tyr-gpu-unplug-b4-v1-1-e99c07d4c785@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev>
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Move ResetHandle out of DRM registration data and store it as the first
field of platform driver data. This makes platform teardown drain queued
or running reset work before dropping the DRM registration and the
resources it owns.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/driver.rs | 172 ++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index c326192f8af2..92ed0de0b4e4 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -51,8 +51,13 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrPlatformDriverData<'bound> {
-    _device: ARef<TyrDrmDevice>,
+    // `ResetHandle::drop()` drains queued/running works and this must happen
+    // before clocks/regulators are dropped. So keep this field before them to
+    // ensure the correct drop order.
+    #[pin]
+    _reset: reset::ResetHandle<'bound>,
     _reg: drm::Registration<'bound, TyrDrmDriver>,
+    _device: ARef<TyrDrmDevice>,
 }
 
 /// Resources kept alive by the DRM registration.
@@ -61,12 +66,6 @@ pub(crate) struct TyrDrmRegistrationData<'bound> {
     /// Parent platform device.
     pub(crate) pdev: &'bound platform::Device<Bound>,
 
-    // `ResetHandle::drop()` drains queued/running works and this must happen
-    // before clocks/regulators are dropped. So keep this field before them to
-    // ensure the correct drop order.
-    #[pin]
-    pub(crate) reset: reset::ResetHandle<'bound>,
-
     /// Firmware sections.
     pub(crate) fw: Arc<Firmware<'bound>>,
 
@@ -101,82 +100,89 @@ fn probe<'bound>(
         pdev: &'bound platform::Device<Core<'_>>,
         _info: Option<&'bound Self::IdInfo>,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
-        let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
-        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
-        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
-
-        core_clk.prepare_enable()?;
-        stacks_clk.prepare_enable()?;
-        coregroup_clk.prepare_enable()?;
-
-        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
-        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
-
-        let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
-
-        let hw = Arc::pin_init(
-            reset::HwGate::new(request.iomap_sized::<SZ_2M>()?),
-            GFP_KERNEL,
-        )?;
-
-        reset::run_reset(pdev.as_ref(), &hw)?;
-
-        let gpu_info = {
-            let hw_guard = hw.access();
-            let gpu_info = GpuInfo::new(hw_guard.iomem());
-            gpu_info.log(pdev.as_ref());
-            gpu_info
-        };
-
-        let pa_bits = MMU_FEATURES::from_raw(gpu_info.mmu_features)
-            .pa_bits()
-            .get();
-        // SAFETY: No concurrent DMA allocations or mappings can be made because
-        // the device is still being probed and therefore isn't being used by
-        // other threads of execution.
-        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(pa_bits)?)? };
-
-        let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, Ok(()))?;
-
-        let mmu = Mmu::new(hw.clone(), &gpu_info)?;
-
-        let firmware = Firmware::new(pdev, hw.clone(), &unreg_dev, mmu.as_arc_borrow(), &gpu_info)?;
-
-        firmware.boot()?;
-        firmware.enable_global_interface(&gpu_info, &core_clk)?;
-
-        let reg_data = try_pin_init!(TyrDrmRegistrationData {
-                pdev,
-                // SAFETY: `ResetHandle` is stored in registration data created with `new_with_lt`
-                // and is dropped before the borrowed device and MMIO references expire.
-                reset <- unsafe { reset::ResetHandle::new(pdev, hw.clone())? },
-                fw: firmware,
-                clks <- new_mutex!(Clocks {
-                    core: core_clk,
-                    stacks: stacks_clk,
-                    coregroup: coregroup_clk,
-                }),
-                regulators <- new_mutex!(Regulators {
-                    _mali: mali_regulator,
-                    _sram: sram_regulator,
-                }),
-                gpu_info,
-        });
-
-        // SAFETY: `reg` is stored in the platform driver data and is not leaked or
-        // forgotten, so it is dropped before the `'bound` registration data can become
-        // invalid.
-        let reg = unsafe { drm::Registration::new_with_lt(pdev.as_ref(), unreg_dev, reg_data, 0)? };
-
-        let driver = TyrPlatformDriverData {
-            _device: reg.device().into(),
-            _reg: reg,
-        };
-
-        // We need this to be dev_info!() because dev_dbg!() does not work at
-        // all in Rust for now, and we need to see whether probe succeeded.
-        dev_info!(pdev, "Tyr initialized correctly.\n");
-        Ok(driver)
+        pin_init::pin_init_scope(move || {
+            let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
+            let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
+            let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
+
+            core_clk.prepare_enable()?;
+            stacks_clk.prepare_enable()?;
+            coregroup_clk.prepare_enable()?;
+
+            let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
+            let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
+
+            let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
+
+            let hw = Arc::pin_init(
+                reset::HwGate::new(request.iomap_sized::<SZ_2M>()?),
+                GFP_KERNEL,
+            )?;
+
+            reset::run_reset(pdev.as_ref(), &hw)?;
+
+            let gpu_info = {
+                let hw_guard = hw.access();
+                let gpu_info = GpuInfo::new(hw_guard.iomem());
+                gpu_info.log(pdev.as_ref());
+                gpu_info
+            };
+
+            let pa_bits = MMU_FEATURES::from_raw(gpu_info.mmu_features)
+                .pa_bits()
+                .get();
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(pa_bits)?)? };
+
+            let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, Ok(()))?;
+
+            let mmu = Mmu::new(hw.clone(), &gpu_info)?;
+
+            let firmware =
+                Firmware::new(pdev, hw.clone(), &unreg_dev, mmu.as_arc_borrow(), &gpu_info)?;
+
+            firmware.boot()?;
+            firmware.enable_global_interface(&gpu_info, &core_clk)?;
+
+            let reg_data = try_pin_init!(TyrDrmRegistrationData {
+                    pdev,
+                    fw: firmware,
+                    clks <- new_mutex!(Clocks {
+                        core: core_clk,
+                        stacks: stacks_clk,
+                        coregroup: coregroup_clk,
+                    }),
+                    regulators <- new_mutex!(Regulators {
+                        _mali: mali_regulator,
+                        _sram: sram_regulator,
+                    }),
+                    gpu_info,
+            });
+
+            // SAFETY: `reg` is stored in the platform driver data and is not leaked or
+            // forgotten, so it is dropped before the `'bound` registration data can become
+            // invalid.
+            let reg =
+                unsafe { drm::Registration::new_with_lt(pdev.as_ref(), unreg_dev, reg_data, 0)? };
+            let device = reg.device().into();
+
+            let driver = try_pin_init!(TyrPlatformDriverData {
+                // SAFETY: `ResetHandle` is stored in platform driver data and is
+                // dropped before the borrowed device and MMIO references expire.
+                _reset <- unsafe { reset::ResetHandle::new(pdev, hw)? },
+                _reg: reg,
+                _device: device,
+                _: {
+                    // We need this to be dev_info!() because dev_dbg!() does not work at
+                    // all in Rust for now, and we need to see whether probe succeeded.
+                    dev_info!(pdev, "Tyr initialized correctly.\n");
+                },
+            });
+
+            Ok(driver)
+        })
     }
 }
 

-- 
2.51.2
