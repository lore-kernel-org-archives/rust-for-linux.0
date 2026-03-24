Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3138A717
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367596; cv=none; b=LswHEhx/OGvGFxWLZYJYUZPWqC6/RYFm7G+Nn86PVpJ6JY+reV23OxJXvN1nN1IfrhgOWYmqf0Cu89Z508BJVX6vcNW6j9aO8TnBJN6Gza8objhU2CqO+pzgpq9vjfbr+LzBRaNkq7TeOvbfQKG+8N4crHYXDSlLN8P0kcYmwJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367596; c=relaxed/simple;
	bh=pabaukliVPTTBtCCbu7GRWF4HPcbxolgmd7lMaXKXsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ1foT6kDm17GWy/RMiRMQwXNWPysvvxfxDB6W/lt93d5BJKl/N2kqw/hYHhANLUAnoT73BjgXH246rmzNgVBTbbXEoJ0e0BuWTD3hx3s9wU1tM7AoSaxijW8F4HdujiDornSz5auexC0wG2nJiChjHNBQrY+6E64atz1sSbxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnmTiim2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnmTiim2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a2e62b893so10976941fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367593; x=1774972393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl/xsq3xgipQKWzjnfnvy5NKeXM0GCll+kZa/2IQSxk=;
        b=CnmTiim2xVF/kbpTidTyewQDOYU++BuvTFvgDnAPyOcSVIwlNhvobt+9xzcpeXHGlr
         oe7ynRzxgC4NCmwk20Ns0+5pNq5FnxsgYApJ0KIcIrFD2QVsUDuPASCrIjK08pGxvABO
         60jDt2mkE99BXxk/J5wHYim8zB1e/1OpdlAogCNWYB139eD9SRrWn5hKy/L0S+hD67KT
         YyEgXhLdeak7pNzAOsPxqQeuoe0Du66jV0tYodocYfJGmvV8WLuNrWRslM31dhhSjU+h
         hA4D+g1YXFnnbdlh3WzU2dLsbZYlC5vcTPLHxEldVc5EKFkp1NkBy1liAC8zWaTWBSLT
         NCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367593; x=1774972393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xl/xsq3xgipQKWzjnfnvy5NKeXM0GCll+kZa/2IQSxk=;
        b=FNrbrIfKkvPvT1fpz2J9Q/U4yhfyk9NrwK498iNDzOrXpJF4ifqv9TjVv/3eshe7gK
         9LMBFygHKQghaFLM6BuMgSSBPWrHW794M52eRgT6rm+bI7QfGScERYun86C2VKT2hKPk
         IGUYGuZK99wD0RMTqRTRvtWtGUyPz3MrAIM4zqnBQ1AdWuYLjrHnhIt5q76rm2P1zU0l
         dkmFMU7+2l7F2pKuz6AJzYDLrIeKjMHKbw4imog88+L+yeZngNVBaZXro22MuYVilpmx
         qKPa3YunJv96b9crh2jmwJsb3PXoL5xrNqxLWGxw3uC7uCOarnTWMua2HXE1e0A+PW6n
         FGDg==
X-Forwarded-Encrypted: i=1; AJvYcCWSHyA4CLH7zwLqTQnHF4F4BJpavX+gxsylwnXPQ8i04t7K8La+q7UbOWXsBx9iRsJaKMnWXqU/bEBriOzTPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhkv1QBBDr+Zz38rjV4OD4ZkAMH/hWcz/nSoVYLDQTZsDBwSqs
	kDQzW1aOSP/zOcNJ17sYNmeXNl+lEsIwrOvLn6LeqZu+YgwpmhhokJ1d
X-Gm-Gg: ATEYQzzD9YtDeoYngbdx0dPBrJNgVxBLwEJCw5v98+RgHDC6ZdfAYxK8EQpHLbNrqUz
	IYEolptDId3PBf4g6BR0vnbpI0rr93JuIr23dcVHK79bvcVP1kO3kEWfP+YLr3NMMC7KSUDr8HC
	d74531HOaBnUmiqDkls0ByHkEWzeVbl/0PE/JZDAks3+7b4lRGfRhqBIL6TeuEXbKKdsQNAJY0i
	zqEnrlv3hSoqci4/Hcz4l/L94tFzqGB7dKiiRVNwDNijia3Q0Q8cHyjeYcSy+5tS7lHtR3kvXkX
	y/1bh69c9THSZhIl0Trcq/BvfxElo0AovSntxQ7RVGtcu+78nSJhNPF4RYlCbPwn/3GeQysx1A1
	cV4zoU6dbyY/cPxCuga6ppHgjO6DXacaLbz4P7Uo+OAkh6HaugGKMX2DGG2sziqXFkfwmIpP0Za
	i2v6TSZsaLlU7O0aeOWFcQ5g0p5hKUW0IXj1vhH8aRu2hVqqNzRb0ppKMnEEshJF7nlxroiXpza
	pDK1XZl2BQbP4N2FA==
X-Received: by 2002:a05:651c:4102:b0:38a:6acb:eb1d with SMTP id 38308e7fff4ca-38bf9640991mr42255771fa.12.1774367592961;
        Tue, 24 Mar 2026 08:53:12 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm32567841fa.32.2026.03.24.08.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:53:12 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH net-next v2 3/5] rust: phy: add config_init, read_page, and write_page callbacks
Date: Tue, 24 Mar 2026 18:52:47 +0300
Message-ID: <20260324155249.15098-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324155249.15098-1-iprintercanon@gmail.com>
References: <20260324155249.15098-1-iprintercanon@gmail.com>
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
index 142f7101723c8..9ffece7ee41c7 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -388,6 +388,51 @@ struct Adapter<T: Driver> {
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
@@ -580,6 +625,11 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
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
@@ -630,6 +680,16 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
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
@@ -657,6 +717,11 @@ pub trait Driver {
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
@@ -709,6 +774,24 @@ fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result
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

