Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6E3DE43D
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297195; cv=none; b=okrzb/XK5H2MWtDSubTPXj/67aGzm5jg8ZbWzX/tajCfNVhB1HcaCJvs4Rev2iXSJ8DHJShDHkws+YYwOR2w/9JrSDw/Z5tMA0wPqeuvUuWZQ+/FHRJunZPf9EW1PwAmVQo0sFjgfq9Ne1ipwH5+hEBIDhbhgAGVYkOEwpHfg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297195; c=relaxed/simple;
	bh=f/J5EMg+Drp9b+uB5wBZSB8iuerBEt2mi5AD+iiCZVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxKVEerEcDL0dWJyq2gs0UgL3v6n7BuoMvnuOMWmwxqmrGp5qZe+6cttPZDQpbK7r6ug9bbiQACv2mAqCy2XXZyJbksakq73xrwk3rDReH8XdjThZeDWOVJ+MxAXnAWSyIbjG9knTu5NrJdCgInVIi1rAx+GyoGrUVTdJd7gEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Og8Da343; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Og8Da343"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so3659421e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297192; x=1774901992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODa9V1ONAe27El6MccwX/8dOupDp0vcPfwidEacJlc0=;
        b=Og8Da3433VH0wr1RKvpm93m+VhrsxDMlTVyQQUa9BZafaeu6t9+aKoKAB/QGMxJonV
         9VshCDGwWznbyZjM24MGyiGlVDChFYYixB1n5Vt6/b7nsJ4oP8vL1f2GSVZvm/3+VHbk
         KP3iSdT4peANAB6Gn7+qEV/kcroyDV3ZA6ktkiBcGha+PBlh/A9LJA/X9+DrJMtPYNdS
         /f56pNsyUqgBYAefhQTRTBkCWCPESqUcSfN5RvUWqMWkRhI/Ky1vqb0jxQn0I0snhUfr
         D1cVRmh4wkMp4Oy0at5RhWDpUWA/i/Wm5WRjueHA+kB55RlbBb1pnPtT3VqoANI/EqkM
         h5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297192; x=1774901992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODa9V1ONAe27El6MccwX/8dOupDp0vcPfwidEacJlc0=;
        b=brgDVyr+fKQg4tEt0Psgz9Ay1nCsG63Xt7TdY5vJmwWe2rGhfdN/HSzCubC8g63Vte
         DxXJTbC5u46ugqQcUUCOEfijI/Gqq7ClNLEPPSEp/rnQtF/BoCfyGjeaYnwh3iiNPNcM
         CN8BalsSvBBmrU+r2NAw+j4wYUNsHuMRTZc2VvqVg0BFgnK47l1FAA4P9x8IhMgiB3tR
         273HzoFzUe+CaBcw9J9NGWsug+4wJ+aLLHpMhQrJjGOOYqMHkR9p3udGm06wyRR1Norc
         qe663ohDSv/ODCZoWnbTtXMs0Q0kbcp63AOUpGEq6cSjLwUUVshvvo90av4vmA12QHHz
         EwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX/3qOQguITAkfQYg/6S5N8wX3+wFTzw+e6dYhjlqMQGQQRazARKVcTT+McRDJX4YWmIEaLD0ASMnTlJW7VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDoWBYFFf1sfWyQ0IRgIEM92ys6NpZbPsYtFrs2nKWkuWUzGeA
	cxgitc0Svm+nLFoUt7mF7Vp6xyE/thPor7ENz7siXf3e9lIdk0oI0tcx
X-Gm-Gg: ATEYQzx7SUbfNfMPzyhxfVs5P5H6I5X7kXV0r4UiG78Y7yhXZue7pTAiA6xB9uj8SlC
	SUE5jUdWHZfgukV6rr0Ppn7bNBdKmsmKA7YhHNzYPh/kd7t7PxsfFFZ8QSc0bddG+HmvjKSge3o
	ZyZfs7VPUI8xuNIq1ZsidbK+gloJ4bFbNAZYRJcXdCIf/RQjpQlbU9CEHuTcE99z0bEC08ujUPz
	UzsLau+lqNB1IvLOKZz+gnWc60beI/3/WwxW1Lw8S3moY8MGaLu91O9fT8z2KWzVnrhmLk1YfEb
	XhbFTXWj4EXO2CGVtUnxfFl2yZsj5gPROmHNDvXQHNuEmUkfoIL+HTkRK/xlZwVmNHUrtgLzcFh
	uHvRtspOQ8pkhS41jjbrfqUxhUXoUSCXUDSEuro+mwvdV9WAQjt2ch4Vd6aV5kdKTtgX4z6oYQ3
	uRGnaFdSmnNde9PHXBTFVmuTb2ssB/4QPxQn5lWWMqaCQD/1VwuAPQr3bRAE/U/3iAbbPaNAf/m
	7DWaPZ8OJ+WV8IkJA==
X-Received: by 2002:a05:6512:12d5:b0:5a2:7ddd:ec16 with SMTP id 2adb3069b0e04-5a285b83c49mr4242012e87.40.1774297191526;
        Mon, 23 Mar 2026 13:19:51 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm2720623e87.42.2026.03.23.13.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:19:50 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH 4/4] rust: phy: add interrupt support
Date: Mon, 23 Mar 2026 23:19:25 +0300
Message-ID: <20260323201925.8405-4-iprintercanon@gmail.com>
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
 rust/kernel/net/phy.rs | 79 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8fb34d34fe7de..3a75d3a90333e 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -6,7 +6,7 @@
 //!
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
-use crate::{device_id::RawDeviceId, error::*, prelude::*, types::Opaque};
+use crate::{device_id::RawDeviceId, error::*, irq::IrqReturn, prelude::*, types::Opaque};
 use core::{marker::PhantomData, ptr::addr_of_mut};
 
 pub mod reg;
@@ -360,6 +360,29 @@ pub fn genphy_read_abilities(&mut self) -> Result {
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
@@ -509,6 +532,35 @@ impl<T: Driver> Adapter<T> {
     /// # Safety
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    /// # Safety
+    ///
+    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
+    unsafe extern "C" fn config_intr_callback(
+        phydev: *mut bindings::phy_device,
+    ) -> c_int {
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
@@ -662,6 +714,16 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
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
@@ -745,6 +807,21 @@ fn match_phy_device(_dev: &Device) -> bool {
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

