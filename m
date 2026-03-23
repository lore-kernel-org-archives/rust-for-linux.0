Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FEE39A7FB
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297193; cv=none; b=uQaGDLsPLcYeww/wusIR3Ui4nWb6JOn3/L2JnNzgLHjs7aE/vUh+wM6PIZ8d4Q3EyBtfYBpehzADi31XtPG2TjGJrLVLvSGt+FpMPrmIuaeJu6/I9xtrea7Bf38B44+9zFned0rHGUG68w7KuqUleCzYZwoaMrohukUCX/MnZ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297193; c=relaxed/simple;
	bh=jaVCjToO+gpl0Xhk9wiD6+mjNpwl6V+EE9cW4gICpe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OR+en+ArAeSl37M2E6nY9jrrcid6ineVjkdvkPF2QVd7DZjxfjd0n3VCtgiGdz4i0F2ysW5un9Zn080HIoOalEhGS04faF0nQOPEgjG0tIc19qHhzXo+J/t6+mLHlkTplwuMqgYM5ZfI3yzBeRj5GwjmTK5JC/G7Yo1iTnXpR9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi9AWFBS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi9AWFBS"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso32041151fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297190; x=1774901990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKcR9KDseDj3TeztQh/9bADUvUV+mYPWEL56B3A2aDE=;
        b=fi9AWFBSX8xA2HTD7SW1FLe3Ua4YhEFQixpl2S1+0vHJnNqLTVWVDLQ/TI8X1JsD29
         QD4evJFeOOUsjsv0yHS0rGy1sn9fUxhZjFMs8IivJiqeYkXemAO3oL42KoouoBa7rz/7
         10qmxLb8bL9ftQeVLS9Aop+k5AU31wLDwg85g48TYYr2u51O3yxuccTlbuVv99M80CnZ
         ZZ+9ULW1V/1yPbQgXRRGlKBgRd1iSwtRvk8LQsrsI1Pu8bLK9GPr6WDGIfOsbkx6fY/P
         hWibIpkCawphjYzRNNcKB2iu1TMtCjGMCgUbw5LbjSdHGnLV9hOEG5yGSLcGyA8guWrh
         q/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297190; x=1774901990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tKcR9KDseDj3TeztQh/9bADUvUV+mYPWEL56B3A2aDE=;
        b=lEJltlnSmbV8kDv9n119sxzfVBKLX9O7CKviJKieDeIk3JBxwpTG8JmPRGrzzRokB3
         WmRHXW3ypHlhJ6XiJW+OtQ+OHd/6DR9PO06a86JMKBfxyeWX1i7j7Lo24O02+5F+elsR
         C1v1ZzdGhuEIDb0gdgs/XjTjBUoOcCFnw2yCTvb7uXD7Y/MHpr8KBawqUQKjINzdMTpN
         +jD5MCFs1lEUfdpyx7PPEjVaG6dYmgGZf3JyDK3S9+PfMnJqk1jBggjn1LLnZM3NzC5X
         sgPIv3pIcp/s1qPT1G6s38hz8yF9V44ILgTiQR55ORHXBQkOlKaMtCA2sBtqQhNrWZmH
         /1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVfx7Q3msa3BSx2P8ambYgzdgc5OFI3wxsUOs1cetPx/RGyZ+07lGCCSkHcxlbSzrTrdrDlV7rZNKndOZ7BDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46ct54LO5jUEGonxhhYpLOss5E/VvvL6tH9gJEb92Ajad/Sh+
	/t16zmTfTZa4bIAdNhACpLIp+IfsPokS692p9UnDQTnYeHyRY/SD+349
X-Gm-Gg: ATEYQzyQfsER0pLjRR3ga7epmxocStIhgStuGSFY91Oq2AsRQ/YSp/73ek+YZJ375f+
	WxzJCqV9pCLomFMqpcx7p0Wlgkg889LPm+jbRYqj96hnyJKvZkpsPNs/T6I58IEvZhmD6tqm0AY
	vLATd/HYiU4OSdh1yMxWa1JtQie0Z3vkfpiVRMsEKdD/DucbVER0Dio7w1OV33ZFGtDYwCP9z6n
	IrT4SFl5keVfifmjhy/Gsq2Vhw+YeY+yHsEmAQdHWZIwBPDPb3squ7gGk0M94c7xsoU7DhjpeVO
	oLdnUJKJhVFIpSimFdCTtQAtTnPIOdeSM/maaJKNP8Ciicmg/dsgEyXJsvIG9uShsHgIEI8bOxG
	9N4o22RbUtfeBYzBzhd+f8D1Q9PAZ45LZhutYX9isH/65216RZV8CsdRNSCUx+4Z7Zwd2EzjZy1
	R25sEQDL+WOntLLVsLTgJd7rNLS4Q2YT8knEM87vlpLL3qpBaWa5L8qfI7TFKv5E0oETlnY0kid
	aQZdz+hOHQU6WeBfA==
X-Received: by 2002:a05:6512:234c:b0:5a1:3485:1c29 with SMTP id 2adb3069b0e04-5a285ae2a00mr3763339e87.6.1774297190199;
        Mon, 23 Mar 2026 13:19:50 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm2720623e87.42.2026.03.23.13.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:19:49 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH 3/4] rust: phy: add config_init, read_page, and write_page callbacks
Date: Mon, 23 Mar 2026 23:19:24 +0300
Message-ID: <20260323201925.8405-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323201925.8405-1-iprintercanon@gmail.com>
References: <20260323201925.8405-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add three new driver callbacks to the PHY abstraction:

  - config_init: Called to initialize the PHY after a reset. This is
    needed by nearly all real-world PHY drivers to configure
    vendor-specific registers (RGMII delays, LED settings, etc.).
    config_init was previously proposed in an RFC for the Rockchip PHY
    driver but not merged at that time. This re-introduces it in a
    form consistent with the existing vtable infrastructure.

  - read_page / write_page: Required by page-based PHY chips (Realtek,
    Marvell) for the kernel's paged register access infrastructure.
    When these callbacks are registered, phy_read_paged(),
    phy_write_paged(), and phy_modify_paged() use them to switch
    register pages. Both must be implemented together.

Each callback follows the established Adapter<T> pattern with
unsafe extern "C" fn bridging to the Rust Driver trait method, and
conditional registration in create_phy_driver() via HAS_* flags
generated by the #[vtable] macro.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 83 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 43d1ee360268b..8fb34d34fe7de 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -390,6 +390,51 @@ struct Adapter<T: Driver> {
 }
 
 impl<T: Driver> Adapter<T> {
+    /// # Safety
+    ///
+    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    unsafe extern "C" fn config_init_callback(phydev: *mut bindings::phy_device) -> c_int {
+        from_result(|| {
+            // SAFETY: The C core calls config_init with the PHY mutex held
+            // (from phy_init_hw), so the accessors on `Device` are okay to call.
+            let dev = unsafe { Device::from_raw(phydev) };
+            T::config_init(dev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    unsafe extern "C" fn read_page_callback(phydev: *mut bindings::phy_device) -> c_int {
+        from_result(|| {
+            // SAFETY: This callback is called only in contexts
+            // where we hold `phy_device->lock`, so the accessors on
+            // `Device` are okay to call.
+            let dev = unsafe { Device::from_raw(phydev) };
+            let page = T::read_page(dev)?;
+            Ok(page.into())
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    unsafe extern "C" fn write_page_callback(
+        phydev: *mut bindings::phy_device,
+        page: c_int,
+    ) -> c_int {
+        from_result(|| {
+            // SAFETY: This callback is called only in contexts
+            // where we hold `phy_device->lock`, so the accessors on
+            // `Device` are okay to call.
+            let dev = unsafe { Device::from_raw(phydev) };
+            let page = u16::try_from(page).map_err(|_| code::EINVAL)?;
+            T::write_page(dev, page)?;
+            Ok(0)
+        })
+    }
+
     /// # Safety
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
@@ -582,6 +627,11 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         flags: T::FLAGS,
         phy_id: T::PHY_DEVICE_ID.id(),
         phy_id_mask: T::PHY_DEVICE_ID.mask_as_int(),
+        config_init: if T::HAS_CONFIG_INIT {
+            Some(Adapter::<T>::config_init_callback)
+        } else {
+            None
+        },
         soft_reset: if T::HAS_SOFT_RESET {
             Some(Adapter::<T>::soft_reset_callback)
         } else {
@@ -632,6 +682,16 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         } else {
             None
         },
+        read_page: if T::HAS_READ_PAGE {
+            Some(Adapter::<T>::read_page_callback)
+        } else {
+            None
+        },
+        write_page: if T::HAS_WRITE_PAGE {
+            Some(Adapter::<T>::write_page_callback)
+        } else {
+            None
+        },
         link_change_notify: if T::HAS_LINK_CHANGE_NOTIFY {
             Some(Adapter::<T>::link_change_notify_callback)
         } else {
@@ -659,6 +719,11 @@ pub trait Driver {
     /// The default id and mask are zero.
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_custom_mask(0, 0);
 
+    /// Called to initialize the PHY, including after a reset.
+    fn config_init(_dev: &mut Device) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Issues a PHY software reset.
     fn soft_reset(_dev: &mut Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
@@ -711,6 +776,24 @@ fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
+    /// Returns the current PHY register page number.
+    ///
+    /// Must be implemented together with [`Driver::write_page`]. The kernel's
+    /// paged register access infrastructure requires both callbacks to be
+    /// present.
+    fn read_page(_dev: &mut Device) -> Result<u16> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Sets the current PHY register page number.
+    ///
+    /// Must be implemented together with [`Driver::read_page`]. The kernel's
+    /// paged register access infrastructure requires both callbacks to be
+    /// present.
+    fn write_page(_dev: &mut Device, _page: u16) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Callback for notification of link change.
     fn link_change_notify(_dev: &mut Device) {}
 }
-- 
2.43.0

