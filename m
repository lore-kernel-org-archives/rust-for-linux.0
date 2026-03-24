Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234438BF97
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367598; cv=none; b=gfsMtbeUELSDHPdDp5j7Vm+zi1fVVg2wrXNZnLQg2emINHLWATYwqy5db26vO16BUwkp2dMWuOPjcRss4oJs3K+8FnQwWtAHG75O05d72UXv3iiW2sL1jJmb8nmYtZ9Y+OtYVAB7shsmNyOy8fBGIrR8MCYPa9yCvYtSxpY6Iu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367598; c=relaxed/simple;
	bh=s/Zst4wBhLmcsgXVYdPsfh1h28/XONFIHqVntvLcXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qli/WL1jJejCuv/TKqv/CSFtcWd6CPBbiiWv6/9qIn7m+M4J1FKk4SODdw4ydEboos9IgoUTTP5PKC5nrdBpyuZQqi/K47vXznKArpBBHrimDfxX4u1IbddYxR67lo28KXwxQ1xScdhCCs5rhGdXRnzp7s9IoK8+8v9c5eq/bHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZksvgYk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZksvgYk"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso4247165e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367594; x=1774972394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fE7fH19jkah32wsQKxT2d0uhjibM0XwWJIdR7zEKKmM=;
        b=KZksvgYkcjRujGoz3uonVozHA7/mrh55wJnM2h5vNpdqxlyqW//wPujRikilDWDkUV
         Z++Av4r+3TD8od1zqhdMZfe7a6+oLFBOwJg0GfWgnclTGgahCHvr2nkypAFjpEfzu3xY
         8g2fJV9Lz5iFXLupS5Y29CD/jSZWOGBAK6es4PitD9XQ+89Y5b5c2ZEGvIiwvy1IbpqE
         iVSw1sIp0j4ptZLZoV2u6KFMl/Y1iW9vCBB1+k22rXdhOYWgZCB4oPPtDa/zIqV/75ah
         nOwn+3/P+9ov/FLE13gh9V4rf4ycnUlg92Q61CJhRP9PV7T0EEgfksVU+RcmTxxNSPAa
         LXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367594; x=1774972394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fE7fH19jkah32wsQKxT2d0uhjibM0XwWJIdR7zEKKmM=;
        b=glMheTsO6viZYu4p0Ao/ScqklxXbzXHrud95YlULGE04glVcOJUpfbGF+u3dxGJ+uJ
         5yXYjiT4snyFmguUPqvsMFlWjZAOEKDAyt9/WmW6s/KlbUm+ECPJeGqjR+Ln76s25IKO
         3YBoZp882oWx/8FZYcsbOaTq/eVojPTQ5+I6yqN50RF7kPD+XyxuDzEO8lHZF3SjNhfd
         uUS8q05kSdI7V2FuxtZJcdG/kWQYuivjvg778MKgm1V/7NeUA3mUmNQY2bent9XbVXGp
         lLSQcEiYZZghPmNmVmPMUeB41YfZvzf83pMWx4agC0CH9/JTP5cPIu8kyyxzEJxzI2uJ
         OCQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ46qZDuX9KG21vkgc+TN0B5fZZohKVo7W0DKaykDZtLnzQ8H3k6Fk/M9TMy7eKM3MJc5Wv3Tl9O90AeBubA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcREj2xgzbNHcmzJqasQi06JNSOoxYtyPRRNUqS1KrSs14w+pR
	+oNBrWbnoAVzAHAX5cLU65GacnKZApmK8D022sZNz0gWmJzpYuZ5UfRr
X-Gm-Gg: ATEYQzzHPgLR1JOHgyL2OFiLAznkWGDF1thkM3qJ/3pvs3mrYc5ChXeHRu47LErvzqJ
	EjmtmdBqRLwFWXJMC+hX21mG/rieN4qsxHvXr6bLsb8kbPpPJl3J1vGj6LJ3aE0TorxpEh0qprb
	W2YXp50adiiRTibinUwYxZlopZOrc8rj4vwwHcnUwkNN6WrzX92GZCm1vL44GZgFrju7QwvRSam
	lpqWTSFtvNW6jPbm5DwIaq1VggAtzGuq6HcNd1u6LTOG9F0PIcbsUcI/UrCBm0f0UQLuR6OoPlJ
	P5KZOSDraHVVunkPbgoJozd3JYpY2AUnLNhGgIOcqIXRiCwWWgdw4g6e056ROGCbA4MVxuiFiIh
	y8ZFnv9Hwgvf5w5/LICevNIduwdpdkFNpV8un3DcUZCJox0ylzXCqP0UJKaFtKuJ2QOV0zrmkgP
	7Pua+3IBegdb/QTJjZEZKL6bTPImIP2xLckIU0YQnEbSjNXzcsA9HMcLs69eq9ww1hUjX2G/7Ii
	sIlZUCAvN3cleue6iiiQgMpqvA/
X-Received: by 2002:a05:6512:1092:b0:5a2:8239:431 with SMTP id 2adb3069b0e04-5a29b94729amr20354e87.0.1774367593722;
        Tue, 24 Mar 2026 08:53:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm32567841fa.32.2026.03.24.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:53:13 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH net-next v2 4/5] rust: phy: add interrupt support
Date: Tue, 24 Mar 2026 18:52:48 +0300
Message-ID: <20260324155249.15098-5-iprintercanon@gmail.com>
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

Add interrupt handling support to the Rust PHY abstraction:

New driver callbacks:
  - config_intr: Enables or disables PHY link state change interrupts.
  - handle_interrupt: Called when the PHY's interrupt fires. Returns
    IrqReturn (reused from kernel::irq). Unlike other callbacks that
    use from_result(), this directly returns irqreturn_t matching the
    C callback signature.

New Device methods:
  - trigger_machine(): Schedules a PHY state machine update. Used in
    interrupt handlers after detecting a link change event.
  - phy_error(): Reports a PHY error and transitions the state machine
    to the error state. Produces a WARN_ON. Must be called with
    phy_device->lock held (which is the case inside handle_interrupt).

Both callbacks run with phy_device->lock held (from phy_interrupt()
in the threaded IRQ context), consistent with the existing callback
safety model.

These additions enable Rust PHY drivers to use interrupt-driven link
detection, which is required for production-quality drivers like the
Realtek RTL8211F.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 93 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 9ffece7ee41c7..e8f920620841c 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -6,7 +6,7 @@
 //!
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
-use crate::{device_id::RawDeviceId, error::*, prelude::*, types::Opaque};
+use crate::{device_id::RawDeviceId, error::*, irq::IrqReturn, prelude::*, types::Opaque};
 use core::{marker::PhantomData, ptr::addr_of_mut};
 
 pub mod reg;
@@ -211,6 +211,20 @@ pub fn interface(&self) -> u32 {
         unsafe { (*phydev).interface }
     }
 
+    /// Returns `true` if PHY interrupts are enabled.
+    ///
+    /// This reflects the `phydev->interrupts` field which is set by the PHY
+    /// core before calling [`Driver::config_intr`] to indicate whether
+    /// interrupts should be enabled or disabled.
+    pub fn is_interrupts_enabled(&self) -> bool {
+        // TODO: the code to access the bit field will be replaced with automatically
+        // generated code by bindgen when it becomes possible.
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
+        bit_field.get(18, 1) == 1
+    }
+
     /// Gets the PHY's IRQ number.
     pub fn irq(&self) -> i32 {
         let phydev = self.0.get();
@@ -358,6 +372,29 @@ pub fn genphy_read_abilities(&mut self) -> Result {
         // So it's just an FFI call.
         to_result(unsafe { bindings::genphy_read_abilities(phydev) })
     }
+
+    /// Triggers the PHY state machine to run.
+    ///
+    /// Used in interrupt handlers to schedule a state machine update
+    /// after processing an interrupt event.
+    pub fn trigger_machine(&mut self) {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        unsafe { bindings::phy_trigger_machine(phydev) };
+    }
+
+    /// Reports a PHY error and moves the state machine to the error state.
+    ///
+    /// Used in interrupt handlers when a register read fails. This will
+    /// produce a kernel `WARN_ON`. Must be called with `phy_device->lock`
+    /// held (which is the case inside [`Driver::handle_interrupt`]).
+    pub fn phy_error(&mut self) {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        unsafe { bindings::phy_error(phydev) };
+    }
 }
 
 impl AsRef<kernel::device::Device> for Device {
@@ -393,8 +430,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn config_init_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core calls config_init with the PHY mutex held
-            // (from phy_init_hw), so the accessors on `Device` are okay to call.
+            // SAFETY: This callback is called only in contexts
+            // where we hold `phy_device->lock`, so the accessors on
+            // `Device` are okay to call.
             let dev = unsafe { Device::from_raw(phydev) };
             T::config_init(dev)?;
             Ok(0)
@@ -507,6 +545,30 @@ impl<T: Driver> Adapter<T> {
     /// # Safety
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    unsafe extern "C" fn config_intr_callback(phydev: *mut bindings::phy_device) -> c_int {
+        from_result(|| {
+            // SAFETY: This callback is called only in contexts
+            // where we hold `phy_device->lock`, so the accessors on
+            // `Device` are okay to call.
+            let dev = unsafe { Device::from_raw(phydev) };
+            T::config_intr(dev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    unsafe extern "C" fn handle_interrupt_callback(
+        phydev: *mut bindings::phy_device,
+    ) -> bindings::irqreturn_t {
+        // SAFETY: This callback is called only in contexts
+        // where we hold `phy_device->lock` (from phy_interrupt),
+        // so the accessors on `Device` are okay to call.
+        let dev = unsafe { Device::from_raw(phydev) };
+        T::handle_interrupt(dev) as core::ffi::c_uint
+    }
+
     unsafe extern "C" fn config_aneg_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
             // SAFETY: This callback is called only in contexts
@@ -660,6 +722,16 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         } else {
             None
         },
+        config_intr: if T::HAS_CONFIG_INTR {
+            Some(Adapter::<T>::config_intr_callback)
+        } else {
+            None
+        },
+        handle_interrupt: if T::HAS_HANDLE_INTERRUPT {
+            Some(Adapter::<T>::handle_interrupt_callback)
+        } else {
+            None
+        },
         config_aneg: if T::HAS_CONFIG_ANEG {
             Some(Adapter::<T>::config_aneg_callback)
         } else {
@@ -743,6 +815,21 @@ fn match_phy_device(_dev: &Device) -> bool {
         false
     }
 
+    /// Enables or disables PHY interrupts.
+    fn config_intr(_dev: &mut Device) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Handles a PHY interrupt.
+    ///
+    /// Called when the PHY's interrupt line fires. The driver should read the
+    /// interrupt status register to determine the cause and call
+    /// [`Device::trigger_machine`] to schedule a state machine update.
+    /// Returns [`IrqReturn::Handled`] if the interrupt was from this PHY.
+    fn handle_interrupt(_dev: &mut Device) -> IrqReturn {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Configures the advertisement and resets auto-negotiation
     /// if auto-negotiation is enabled.
     fn config_aneg(_dev: &mut Device) -> Result {
-- 
2.43.0

