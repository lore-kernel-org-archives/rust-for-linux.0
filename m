Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702136;
	b=I7w0654O4BnUWhdG9y8z6iSsdxJEJTql9bWViT4gJXoLGkfi4+a85saSAUAE+Ho2naEM
	 iyNWKWnvzkVfx9gtbsViRH9XgitzDIuHYB/3jOP0it1jwIiKTONS9Q4x3sfZMe6KyVyrt
	 qw1svP7UD/E+a9N2MZRGgP2ik4KWF5GDyFWgePSQSOsR2BBvNe9qsoG/jON1mNpPN3Zql
	 ql3jqN/XVgUr/MGCKhDfTdsHLbclgwLlBHciJzBhnXze4JJE4QULba7tdx6Ci4AUEyqSw
	 H8qQoER7zRy7x3pMvgZ3bF+t/c82xohjeXASO5pdFu/xGeiaHobBSl+S4E8qlmf1M8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GvuH5FgiSMD44pf2TE4TigBof7wb/V2xhFCzupazmmI=;
	b=DLrdOeTIfQ00GX5QsmbmMPirwbfuvvBEhclpNiyPbNXIAAaiB/6skF0bNVrcpRqLPoU6
	 oMWLfpF5sw4sSR//aOnUdwtnRBxBRJlqOiE5BgVOjYAjteE6s8Rbvf8kjXULuo82ILzJt
	 EbMbGdVtDEg0GbQTkVDDsHgX7GSCRuXmcZxjzNYoBOSLTJu4J+JNvuLCK4gba/RRxZ/cc
	 VavN2lkMT69iJMaGgPIB3tY41lhLhdqjSqRBG/ucdn/nIErwODlkkz/NL/LjaZCu6vqYH
	 5n8jXM+GDE4VRBnyWpApxj6dRugANXSUyYnbr9PorkMvPpRyWjT/XG9LzNoXCMVoaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kt4QXCXa;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86388606A323
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 14:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86388606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kt4QXCXa
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f048476ab9so49673105ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702135; x=1796306935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvuH5FgiSMD44pf2TE4TigBof7wb/V2xhFCzupazmmI=;
        b=Kt4QXCXaoiHjMCfvd63z6HImCZzJEjl6YmtgyDWByGjaYKRR75/J7kO8gCu106xmQw
         MryhJ4lM5iT8rZMzCwKMS+6CoVR2068poCS76/ITyOrSXSjj2p/H5Pz9jRRbJFi0p75J
         FMwArQO0r9CqAFcf3ovm2Ja34gBdKrTVZMy77DjfjstdIBGBbsuVUyDU9w/fe6jrmgNe
         ORmHQiDvp7BLHmPY5dmgiomrDyqDS3nor7rRBgfJFD23p72X/LgLcCrMqU6x1rGsJBgd
         Gkib6TRFVnmNXyD47uLt9q2XhsrWK0MJNcaIp4J3kHXEkudtEU7WiHJ1VdkJVFTuk2LL
         KFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702135; x=1796306935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvuH5FgiSMD44pf2TE4TigBof7wb/V2xhFCzupazmmI=;
        b=xyfzKe8+m9QW7lBZUzCd9OwL92yT0TskMAarEj8AvqH4QnDVdnptOmLJziE8jDy9wR
         kz3XQ16UNb+w8VXo6cLz1kLUnHc9jS0rOC43eAO6rL6ZQwfrZYq5UXQ/aAebc8KP1JZE
         w7kUmcJkvJTZUSZOuOsBU2omq6ZVPOqEiz44qPPUlE1ybPNs0Yc5pYxkrTxf8ibeq12j
         7+Qi0pWsNQcXtWZpzXqJw7F/sxHd/djAtOYGXdG8m7IenDEvvJNVTJ7nBKh8DLA2vhr2
         8D2IBUegl9xPw9H5nNOQ9Xphi8pEurhcbcuIDtVuWQ1AIFN8rVSyqjQX7l8TBqpARtbc
         l6fQ==
X-Forwarded-Encrypted: i=1; AL+hErG4LeAk/jo87A6y8aU7v5gVkrYi7g6/W+x1pRX0CAvy/wcPBB/TJJU0M4p5Y1BcjLjznTbQuOns5A2+fyGp+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z89tRXUQcGO2kZcIpP34+aheXtHnjldZLpnLUomQetevWsY6JAf
	ENxeDPsTlzh8fAHyCPmQcemFP72F4tiBSBITadB/7ufM2IbZfZXqKnhQ
X-Gm-Gg: AZFdTZdrh7/T0fY3N4bLCZUpZWf+M8t83aXA06UuZy+jQUa+Q0UQKce4bD49JWphpjK
	K/bSiK56+N1ljPYufXQ43DpEzNQEVGUQlT64Uvrs6yTyC2uSRpyZKm4tds9RuIH4Vryno8tuo6e
	c7KVlGdS25qFV08uJ54ZenwHSAmLE1NmtxrWcGhUAEsx48J8CBjL9fUH9qcB5cxTCv6npe59F2q
	bN620dmm6pucbAEVatAB2So4qv2xfuwgf/UfwCBrx8dkXzRsUnx/woqznB3zbIWa5J5zCo03BYh
	cklRD7O8TL4oA9Iv3RoU940krcnrsPcYZEbdnZ3jT4NCeiYaqP+XOb0vWeHKN4bQ9yBm9T08zxn
	7CL2dZ6nFV6mm9whH7EdyXi8i66RcbRkN0Shs90ofQ/fICzNvbZ60IawuWBgKHmyeIcszwE+GCp
	ECSrhGuff22wh+JMZuejMkCUYrUIGIHYaYgySEcTTFkS0ECbrQDNBgmzw498IuU95qonmY9qfl/
	umlYwVx2nyQMW/wmG9L1zjPBgsAyRDnczjZ1YMLTUZx6xMwc+wxtBiWrxKpqFvWStKLSZsRipac
	LxvDltFow6DOjb9bTHJIcOzETyR3rpSi1Ob8PM2ox0VUYTuvC093Tkr8dN/K5ZivyLHkKRzEeb2
	Dt5hZ43uMrkjfMLefWvmTyy2iRF5EsnDzJ0ZrCaPCmzORthvgWzJLKnzv
X-Received: by 2002:a17:90b:2f8c:b0:3b4:9a2:9a2f with SMTP id 98e67ed59e1d1-3b41c9b1f71mr20464082a91.14.1795702134548;
        Thu, 26 Nov 2026 06:08:54 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12583573a91.3.2026.11.26.06.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:08:54 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Thu, 26 Nov 2026 23:08:32 +0900
Subject: [PATCH net-next v4 1/2] rust: net: phy: take &self in methods that
 do not need phy_device->lock
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
Message-Id: <20261126-exp-phy-rs-maybelocked-v4-1-16f9a10bb579@gmail.com>
References: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
In-Reply-To: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
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

Every callback gets a `&mut Device`, which assumes exclusive access to
the device, but some callbacks run while another path holds
`phy_device->lock`.

Make `&mut Device` mean exclusive access to the state that
`phy_device->lock` protects, so that safe code cannot use that state
without the access. The methods that use it take `&mut self`, including
state(), is_link_up() and the autoneg getters, which read it.

Document when PHYLIB calls the `&mut Device` callbacks without the lock,
with the phy_mii_ioctl() path outside the guarantee, and fix their
SAFETY comments.

phy_id(), read(), write() and genphy_suspend() do not use that state:
the MDIO bus lock serializes register access, and phy_id does not change
after the device is created. They take `&self`, so that the callbacks
that get a `&Device` in the next patch can still use them.

No functional change.

Suggested-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs     | 141 ++++++++++++++++++++++++---------------------
 rust/kernel/net/phy/reg.rs |  12 ++--
 2 files changed, 82 insertions(+), 71 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index c4e7b1d6c6f4..bb2cc6b3c94c 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -57,50 +57,71 @@ pub enum DuplexMode {
 /// A [`Device`] instance is created when a callback in [`Driver`] is executed. A PHY driver
 /// executes [`Driver`]'s methods during the callback.
 ///
+/// A `&mut Device` has exclusive access to the state of the `phy_device` that `phy_device->lock`
+/// protects, such as `state`, `link`, `autoneg`, `autoneg_complete`, `speed` and `duplex`, and the
+/// methods that use that state take `&mut self`. A `&Device` makes no such claim.
+///
+/// PHYLIB calls the callbacks that get a `&mut Device` with `phy_device->lock` held, except:
+///
+/// - [`Driver::probe`] and [`Driver::get_features`], which `phy_probe()` calls without the lock
+///   before the device is attached.
+/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the lock while the state machine
+///   is not running, or from a MAC driver that then ensures exclusive access. `phy_mii_ioctl()`,
+///   which PHYLIB documents as "use at own risk", is outside this guarantee.
+/// - [`Driver::read_status`], when a MAC driver calls `phy_read_status()` directly. The MAC
+///   driver is then responsible for exclusive access.
+///
 /// # Invariants
 ///
-/// - Referencing a `phy_device` using this struct asserts that you are in
-///   a context where all methods defined on this struct are safe to call.
-/// - This struct always has a valid `self.0.mdio.dev`.
+/// - `self.0` is a valid `phy_device`, and `self.0.mdio.dev` is a valid `struct device`.
+/// - For the lifetime of a `&mut Device`, no other thread accesses the state of the `phy_device`
+///   that `phy_device->lock` protects.
 ///
 /// [`struct phy_device`]: srctree/include/linux/phy.h
-// During the calls to most functions in [`Driver`], the C side (`PHYLIB`) holds a lock that is
-// unique for every instance of [`Device`]. `PHYLIB` uses a different serialization technique for
-// [`Driver::resume`] and [`Driver::suspend`]: `PHYLIB` updates `phy_device`'s state with
-// the lock held, thus guaranteeing that [`Driver::resume`] has exclusive access to the instance.
-// [`Driver::resume`] and [`Driver::suspend`] also are called where only one thread can access
-// to the instance.
 #[repr(transparent)]
 pub struct Device(Opaque<bindings::phy_device>);
 
 impl Device {
-    /// Creates a new [`Device`] instance from a raw pointer.
+    /// Creates a new shared [`Device`] reference from a raw pointer.
     ///
     /// # Safety
     ///
     /// For the duration of `'a`,
-    /// - the pointer must point at a valid `phy_device`, and the caller
-    ///   must be in a context where all methods defined on this struct
-    ///   are safe to call.
-    /// - `(*ptr).mdio.dev` must be a valid.
-    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
+    /// - the pointer must point at a valid `phy_device`.
+    /// - `(*ptr).mdio.dev` must be valid.
+    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a Self {
         // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
         let ptr = ptr.cast::<Self>();
-        // SAFETY: by the function requirements the pointer is valid and we have unique access for
-        // the duration of `'a`.
+        // SAFETY: By the function requirements the pointer is valid for `'a`.
+        unsafe { &*ptr }
+    }
+
+    /// Creates a new mutable [`Device`] reference from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`,
+    /// - the pointer must point at a valid `phy_device`.
+    /// - `(*ptr).mdio.dev` must be valid.
+    /// - the caller must have the exclusive access that [`Device`] describes.
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: By the function requirements the pointer is valid for `'a`. `Opaque` permits
+        // other references to the same `phy_device`, e.g. in a concurrent `&Device` callback.
         unsafe { &mut *ptr }
     }
 
     /// Gets the id of the PHY.
     pub fn phy_id(&self) -> u32 {
         let phydev = self.0.get();
-        // SAFETY: The struct invariant ensures that we may access
-        // this field without additional synchronization.
+        // SAFETY: `phydev` is valid by the type invariant of `Self`. `phy_id` is set by
+        // `phy_device_create()` and never written afterwards.
         unsafe { (*phydev).phy_id }
     }
 
     /// Gets the state of PHY state machine states.
-    pub fn state(&self) -> DeviceState {
+    pub fn state(&mut self) -> DeviceState {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that we may access
         // this field without additional synchronization.
@@ -124,7 +145,7 @@ pub fn state(&self) -> DeviceState {
     ///
     /// It returns true if the link is up.
     #[inline]
-    pub fn is_link_up(&self) -> bool {
+    pub fn is_link_up(&mut self) -> bool {
         let phydev = self.0.get().cast_const();
         // SAFETY: By the type invariant of `Device`, `phydev` points to a valid
         // `struct phy_device`, and there is no concurrent write to this field.
@@ -136,7 +157,7 @@ pub fn is_link_up(&self) -> bool {
     ///
     /// It returns true if auto-negotiation is enabled.
     #[inline]
-    pub fn is_autoneg_enabled(&self) -> bool {
+    pub fn is_autoneg_enabled(&mut self) -> bool {
         let phydev = self.0.get().cast_const();
         // SAFETY: By the type invariant of `Device`, `phydev` points to a valid
         // `struct phy_device`, and there is no concurrent write to this field.
@@ -148,7 +169,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
     ///
     /// It returns true if auto-negotiation is completed.
     #[inline]
-    pub fn is_autoneg_completed(&self) -> bool {
+    pub fn is_autoneg_completed(&mut self) -> bool {
         let phydev = self.0.get().cast_const();
         // SAFETY: By the type invariant of `Device`, `phydev` points to a valid
         // `struct phy_device`, and there is no concurrent write to this field.
@@ -178,13 +199,13 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
     }
 
     /// Reads a PHY register.
-    // This function reads a hardware register and updates the stats so takes `&mut self`.
-    pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
+    // The MDIO bus lock serializes the access, so this takes `&self`.
+    pub fn read<R: reg::Register>(&self, reg: R) -> Result<u16> {
         reg.read(self)
     }
 
     /// Writes a PHY register.
-    pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
+    pub fn write<R: reg::Register>(&self, reg: R, val: u16) -> Result {
         reg.write(self, val)
     }
 
@@ -192,7 +213,8 @@ pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
     pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
         let phydev = self.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
+        // `phy_read_paged()` needs `phydev->drv`, which is set in every callback that gets a
+        // `&mut Device`.
         let ret = unsafe { bindings::phy_read_paged(phydev, page.into(), regnum.into()) };
 
         to_result(ret).map(|()| ret as u16)
@@ -239,10 +261,10 @@ pub fn genphy_resume(&mut self) -> Result {
     }
 
     /// Suspends the PHY via `BMCR_PDOWN` bit.
-    pub fn genphy_suspend(&mut self) -> Result {
+    pub fn genphy_suspend(&self) -> Result {
         let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`. The C
+        // function only sets `BMCR_PDOWN`, serialized by the MDIO bus lock.
         to_result(unsafe { bindings::genphy_suspend(phydev) })
     }
 
@@ -309,10 +331,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_init_hw()` calls this with `phy_device->lock` held, or without it while
+            // the state machine is not running or a MAC driver ensures exclusive access. The
+            // `phy_mii_ioctl()` path is outside this guarantee, see `Device`.
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
         })
@@ -323,11 +345,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn probe_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we can exclusively access `phy_device` because
-            // it's not published yet, so the accessors on `Device` are okay
-            // to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_probe()` calls this before the device is attached, when no other PHYLIB
+            // path accesses it.
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::probe(dev)?;
             Ok(0)
         })
@@ -338,10 +358,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn get_features_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_probe()` calls this without `phy_device->lock`, under the same
+            // assumption as `probe`.
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::get_features(dev)?;
             Ok(0)
         })
@@ -355,7 +374,7 @@ impl<T: Driver> Adapter<T> {
             // SAFETY: The C core code ensures that the accessors on
             // `Device` are okay to call even though `phy_device->lock`
             // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -366,10 +385,8 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn resume_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `__phy_resume()` asserts that `phy_device->lock` is held.
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::resume(dev)?;
             Ok(0)
         })
@@ -380,10 +397,8 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn config_aneg_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: PHYLIB holds `phy_device->lock` when it calls this.
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::config_aneg(dev)?;
             Ok(0)
         })
@@ -394,10 +409,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn read_status_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: PHYLIB holds `phy_device->lock` when it calls this, or a MAC driver that
+            // calls `phy_read_status()` directly ensures exclusive access.
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::read_status(dev)?;
             Ok(0)
         })
@@ -410,9 +424,8 @@ impl<T: Driver> Adapter<T> {
         phydev: *mut bindings::phy_device,
         _phydrv: *const bindings::phy_driver,
     ) -> c_int {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
+        // SAFETY: `phy_bus_match()` calls this without any PHY lock, possibly on a device
+        // that is bound to another driver. A `&Device` makes no claim about the lock.
         let dev = unsafe { Device::from_raw(phydev) };
         T::match_phy_device(dev).into()
     }
@@ -429,7 +442,7 @@ impl<T: Driver> Adapter<T> {
             // SAFETY: This callback is called only in contexts
             // where we hold `phy_device->lock`, so the accessors on
             // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             // CAST: the C side verifies devnum < 32.
             let ret = T::read_mmd(dev, devnum as u8, regnum)?;
             Ok(ret.into())
@@ -449,7 +462,7 @@ impl<T: Driver> Adapter<T> {
             // SAFETY: This callback is called only in contexts
             // where we hold `phy_device->lock`, so the accessors on
             // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            let dev = unsafe { Device::from_raw_mut(phydev) };
             T::write_mmd(dev, devnum as u8, regnum, val)?;
             Ok(0)
         })
@@ -459,10 +472,8 @@ impl<T: Driver> Adapter<T> {
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn link_change_notify_callback(phydev: *mut bindings::phy_device) {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
-        let dev = unsafe { Device::from_raw(phydev) };
+        // SAFETY: PHYLIB holds `phy_device->lock` when it calls this.
+        let dev = unsafe { Device::from_raw_mut(phydev) };
         T::link_change_notify(dev);
     }
 }
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
index 80e22c264ea8..f96cc06bfe3a 100644
--- a/rust/kernel/net/phy/reg.rs
+++ b/rust/kernel/net/phy/reg.rs
@@ -44,10 +44,10 @@ pub trait Sealed {}
 /// ```
 pub trait Register: private::Sealed {
     /// Reads a PHY register.
-    fn read(&self, dev: &mut Device) -> Result<u16>;
+    fn read(&self, dev: &Device) -> Result<u16>;
 
     /// Writes a PHY register.
-    fn write(&self, dev: &mut Device, val: u16) -> Result;
+    fn write(&self, dev: &Device, val: u16) -> Result;
 
     /// Checks the link status and updates current link state.
     fn read_status(dev: &mut Device) -> Result<u16>;
@@ -104,7 +104,7 @@ pub const fn vendor_specific<const N: u8>() -> Self {
 impl private::Sealed for C22 {}
 
 impl Register for C22 {
-    fn read(&self, dev: &mut Device) -> Result<u16> {
+    fn read(&self, dev: &Device) -> Result<u16> {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
@@ -116,7 +116,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         Ok(ret as u16)
     }
 
-    fn write(&self, dev: &mut Device, val: u16) -> Result {
+    fn write(&self, dev: &Device, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
@@ -196,7 +196,7 @@ pub fn new(devad: Mmd, regnum: u16) -> Self {
 impl private::Sealed for C45 {}
 
 impl Register for C45 {
-    fn read(&self, dev: &mut Device) -> Result<u16> {
+    fn read(&self, dev: &Device) -> Result<u16> {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.
@@ -206,7 +206,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         Ok(ret as u16)
     }
 
-    fn write(&self, dev: &mut Device, val: u16) -> Result {
+    fn write(&self, dev: &Device, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.

-- 
2.54.0

