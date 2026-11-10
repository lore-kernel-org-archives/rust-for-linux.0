Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308447;
	b=j4LP197MDnR+yE48W83PXaeoaXkwrulmoxL99UUg9Qe1tWHdl4HJvWHkruaynrZypBly
	 RDgVBiJQL+HAvYM6BIkZpbwEgumCbbZKo7e53eSRBQKw877XODQQcppg+9Ck5dcolCGgQ
	 zLSoQImhWr1uP8zjZcWZKRm0ODta2Em6xk/xuIbj0eQj/BZ2bAFVfO1pm6ASI5c2orxNG
	 ++8pkYkfXgS+1+yH1AiG7Ag2mWB9vj5J/L8egxeEpgIEqqOX5Ty/Ti5KFE8TkEIZ1/AZw
	 O1J32M6KFy9iiyyJZt0H7r52OY0ZzfnMIkyWIrASZtJ+zjh4fhGi07fdNPz9H2k9p2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fPdgLUzTPKaf72Xzj2/8R2CtPSClSe+LTdvvp+Kez2s=;
	b=AFj7LchM8nQoz3eCSPunQ7OLmfAQ1eU9uE5n/UCXQdsNbIOfqbKHKffejKJJt0cBpG95
	 FRq8JhwjDTisds56TpuElHhUXpmKtpPErRedp+o84RUxWex2NQjuk9HOGYSpBscgpTai2
	 2JJHfZIZHj6+IDE+AWDlxLfHHslJ/TdsY/mMv9XWQ0APyE2CfdTUuYyiAyYtBRrbIoGQR
	 PQ9f7aXWwPWrqelnuNKnnw/RCxY13eeJjbuwLrom4Vpyrl7tROpqKsnXR1lowMfbc8Et0
	 GQW5xoyZbISIuEzsMOrN+jdjCr1Oa4+dyi8N/2qAgP5aiXoCWFFrIB8ZXAhwWmjjZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiAtexfG;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA9360A6F48
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 11:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA9360A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiAtexfG
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so952460b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 03:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308446; x=1794913246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPdgLUzTPKaf72Xzj2/8R2CtPSClSe+LTdvvp+Kez2s=;
        b=JiAtexfG+LSXXlHyupJkip3vO0bcHCRQOgD8X+CXyqk+j0bdwvdTOV9/41d9UEy0vn
         7e+6WQl9lRP1NK2Jn6E2FZbSThYDdoSi15EYuhTGTJ81DjRIE0mH+fgXbahhAScC4E30
         9oHF5WpuLeZGtVEHGVim21NkLyEq6Rn2KWbIE+NCeIjpdvXaTgoUBTW4yeULZnRJ5Ou6
         dxwD/7K7pfeB5umW/K4OzYDjmBdpnSB13YELIn1xvUP5vjT0fIvogZryVQf41tKUhw3H
         U0l25UgmjCIKNcOyogFF9EIv5QmEME9dnCuQs64zDkBGcYFOvVXiozOg4ETcgAr6bUIx
         ZQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308446; x=1794913246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPdgLUzTPKaf72Xzj2/8R2CtPSClSe+LTdvvp+Kez2s=;
        b=zlBcZdRby2s7kczYN9EZTYVcIaVnu5y8No0UbK8Pjr6kGOLJnl4hurKq33grM9Vqap
         68gEynVFKqWx5ZZanb/lNfOh5WiFagUpGLEpFBEEK0eJ0bZczHYiu80td6Tmtn2snlXd
         zfvXXDUoztUKJ7QMKJAHRa5kErMmh8psY846XE3VNkFM9mq9Mm02LhIHKqDexQtIMkM3
         sIB70WPBuCchArMf+FfRkNbYer27WI6JPxs/KxW2VPeDWSCuzLWI6Im2ZGFz4lkbzP+K
         1WJA0SyH+R7hHfpTqPmYqi9Eav+M+WYlSSiIoUg+Nr+MNxJCKdpwDvk2d2m/qVrXyZO7
         Ju3g==
X-Forwarded-Encrypted: i=1; AL+hErH4gXMdt2k4h9yenQLXd6Cpss970qX4RvJ/b/hQ/0BRcwJsEJUjZkx2de4W4K5l9L6FJpOwmi/uH1DQgax6sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6H8yzrJH8wz4w9qMTwqhS3Pd+mwcaHCNx7m48tNzPh3Rk3RV7
	eqbsZsc6p1Q1+jKxAmPu2QKPm9Dkyhucmu3fHNd9Qn2dalJn8PdHjeyf
X-Gm-Gg: AYBFou3y/ONzXr91AF/WjzShv4DO/oW/RFxNgd+ae8uq+dNb1HssDG+hJimx0QoEc7F
	ZOdjNTmSu0wFlnPI70YL4+KYM1pYSCyl/Adqlz7+/YT6rtPWet5rmXSHaLSMQNWHDNUJiswBvxJ
	NiEfLo00o8nBXMa6+wBaVbb0tMVTbOqPxTWHaeklbnQd6fXOHO74aHgVh57GO2HTysnHCgAdcAC
	MZ5viym32MPaGjBxeC2ADzpsptxSDukkNA+6JTWbWOORUgYQEi8kpGKAOBi/Iw/x57ujC8u4Bw3
	CTrHkZ2QWCqZ2+KZRJGpgbAONW7ZO3nF6KkTLFqbraT/k2nVv/ZjGFerAWSLEkubBDRUJKzuVmQ
	yH9efJ/Zvy7odVVDRyGK1URyRlmjBKifewTuHIaPCeJY092I+oX65NmrTQXmyMDcEjcp5F5YXyt
	U8/am3sC58btTjVy9lxffYRD4fDBokuGMgpfsTUjCAG5pFSk84FX/i/MbW1FRqpBKnVnAlY2wBL
	osL2QvMRToArIoGcM2nKGUPfZ2j63QkXqp8zGDO4UpISvgG/UQmQOcF28bI6ASLKHLd5E07mDdH
	r9/0nbPuqofMpWVeIX3U5JeJvTqc6DFLdui5a696H45etlLFe9pXrE6u6vn4AQgap2WfrGAbdzk
	0yA4T1ZDfq2aSYsWNO/NOlfwInmmCk0DIJbU2IrNzzqXLJVRmoSRWNMIpq6SQg4lNFentduthGp
	xUk10=
X-Received: by 2002:a05:6a00:1898:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-8ba867aaed4mr2447821b3a.24.1794308442995;
        Tue, 10 Nov 2026 03:00:42 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de768fsm740596b3a.6.2026.11.10.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:00:42 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 10 Nov 2026 19:59:27 +0900
Subject: [PATCH net-next 2/2] rust: net: phy: pass a MaybeLocked device to
 soft_reset and match_phy_device
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-exp-phy-rs-maybelocked-v1-2-3023cc9055e9@gmail.com>
References: <20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com>
In-Reply-To: <20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

The SAFETY comments of `soft_reset_callback` and
`match_phy_device_callback` state that PHYLIB holds `phy_device->lock`
when it calls them. It does on some paths but not on others:
phy_init_hw() calls `soft_reset` both with and without the lock (e.g.
from phy_attach_direct() and phy_mii_ioctl()), and phy_bus_match() calls
`match_phy_device` without it.

Hand both callbacks a `&Device<MaybeLocked>` so that the type matches
what PHYLIB provides, and correct the SAFETY comments. Update
ax88796b_rust, the only Rust implementation, to the new signature; it
only does register writes and genphy_soft_reset(), so its behaviour does
not change.

This was found while auditing SAFETY comments of Rust abstractions
against their C callers, and confirmed with Clang's context analysis:
annotating the two `phy_driver` slots with `__must_hold(&phydev->lock)`
flags exactly the lock-less paths above. It was not triggered at runtime.

Built with AX88796B_RUST_PHY=y and CLIPPY=1; a `soft_reset` that calls
`start_aneg()` or `set_speed()` no longer compiles. Not tested on
hardware.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs |  8 ++++----
 rust/kernel/net/phy.rs           | 44 ++++++++++++++++++++++++++++------------
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..bde801df305c 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -30,7 +30,7 @@
 // BMCR_RESET bit and poll for the reset bit to be cleared.
 // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
 // such as used on the Individual Computers' X-Surf 100 Zorro card.
-fn asix_soft_reset(dev: &mut phy::Device) -> Result {
+fn asix_soft_reset(dev: &phy::Device<phy::MaybeLocked>) -> Result {
     dev.write(C22::BMCR, 0)?;
     dev.genphy_soft_reset()
 }
@@ -85,7 +85,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 
@@ -115,7 +115,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
@@ -127,7 +127,7 @@ impl Driver for PhyAX88796B {
     const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 60c58bbc12d6..c2dfc58dbe55 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -72,10 +72,10 @@ pub trait PhyContext: private::Sealed {}
 /// other access to the `phy_device` made under `phy_device->lock`.
 pub struct Locked;
 
-/// The [`Device`] context of callbacks that PHYLIB calls both with and without
-/// `phy_device->lock` held.
+/// The [`Device`] context of [`Driver::soft_reset`] and [`Driver::match_phy_device`].
 ///
-/// A callback in this context must not take `phy_device->lock`.
+/// PHYLIB calls these callbacks both with and without `phy_device->lock` held. A callback in this
+/// context must not take `phy_device->lock`.
 ///
 /// # Invariants
 ///
@@ -322,6 +322,22 @@ pub fn genphy_soft_reset(&self) -> Result {
     }
 }
 
+impl Device<MaybeLocked> {
+    /// Creates a new [`Device`] reference in the [`MaybeLocked`] context from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`, the pointer must point at a valid `phy_device` whose
+    /// `mdio.dev` is valid.
+    unsafe fn from_raw_maybe_locked<'a>(ptr: *mut bindings::phy_device) -> &'a Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: The pointer is valid for `'a`. A shared reference does not assert exclusive
+        // access, and `Opaque` permits concurrent mutation by the C side.
+        unsafe { &*ptr }
+    }
+}
+
 impl core::ops::Deref for Device<Locked> {
     type Target = Device<MaybeLocked>;
 
@@ -370,10 +386,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phydev` is valid for the callback. `phy_init_hw()` calls `soft_reset` both
+            // with and without `phy_device->lock`, which is the `MaybeLocked` context.
+            let dev = unsafe { Device::from_raw_maybe_locked(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
         })
@@ -471,10 +486,9 @@ impl<T: Driver> Adapter<T> {
         phydev: *mut bindings::phy_device,
         _phydrv: *const bindings::phy_driver,
     ) -> c_int {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
-        let dev = unsafe { Device::from_raw(phydev) };
+        // SAFETY: `phydev` is valid for the callback. `phy_bus_match()` holds no PHY lock, which
+        // is the `MaybeLocked` context.
+        let dev = unsafe { Device::from_raw_maybe_locked(phydev) };
         T::match_phy_device(dev).into()
     }
 
@@ -635,7 +649,9 @@ pub trait Driver {
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_custom_mask(0, 0);
 
     /// Issues a PHY software reset.
-    fn soft_reset(_dev: &mut Device) -> Result {
+    ///
+    /// Called in the [`MaybeLocked`] context.
+    fn soft_reset(_dev: &Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -651,7 +667,9 @@ fn get_features(_dev: &mut Device) -> Result {
 
     /// Returns true if this is a suitable driver for the given phydev.
     /// If not implemented, matching is based on [`Driver::PHY_DEVICE_ID`].
-    fn match_phy_device(_dev: &Device) -> bool {
+    ///
+    /// Called in the [`MaybeLocked`] context.
+    fn match_phy_device(_dev: &Device<MaybeLocked>) -> bool {
         false
     }
 

-- 
2.54.0

