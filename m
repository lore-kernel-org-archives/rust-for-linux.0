Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725289;
	b=H8N4lN6VRDDFqyUsOX0nmmlFeFvbNbVXtgKX1uSPDLpDeNEUsL1NZaxdbb1RjqT6Ea52
	 cw5BvZb68jtXkRURYbC6kWTmTO25e7Kk8Mqke6msae/MbDgOC2xIMIqLsLYCEW1TnIyYI
	 feiavSjE1v8dtxSl+NS3rO28BPwYWijeIJ8EiHLa6tkdhzPY6lq08UJwcX8nDR4TuXLHY
	 ymaPd1CGMa8BVvbjfm5hmizpXp08nXpPwGsGgYbt1fjJxnLsgwD99Elk2av5MwkysFaRr
	 9rzLT+11eveDVQ589RzAP1iOyEQtTi9Xw+AqWoXVZRMpGVD7Gv5zHcnoxYX0bnqDdzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hlklr9HjlYj9YlI7wKU2ZXzvdmAz50MqQ9W4xUO0aG4=;
	b=tNDW/AXC3z9lxRkQ9Bqnk3k/GMa34dGHA5VF+nVZurY4A8Z3eNrfxYYFXNb2fbH4xBi9
	 Ac9xHgZ/VtudOd5jjvrr282VSH9QAljD5fSM06T0k9Wj5KLtQNy9xNpmdAJ9BRb7T42Oe
	 i7skjjZRA0gFYQlihFdStGPszM4VhcojC4is69h4QNZ9RUIYY/O5r1hAKqx3u5QSL6OfW
	 1QC1eKJVFQKoyUj8fd2dZThUdlv0a+tt9Wk2HrVRcnVKhE9Wd9m8XNZYBrrZQhH2H/p31
	 WMxVJekKsaxqocF34kGEVPFwx+grhel+Q7Aj6/NCurZlU/qqEL80L8PvMcEPbJn+bYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9gytPI8;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E4606A332
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Nov 2026 06:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D2E4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9gytPI8
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3131270a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 22:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725288; x=1795330088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hlklr9HjlYj9YlI7wKU2ZXzvdmAz50MqQ9W4xUO0aG4=;
        b=a9gytPI81Y5foG3FbMZfapMHQLFw/iePnUs0Q5D/44GskmTDm6XBcWBdqvsg5LM340
         FcBM7Z2R7P7GRkYRAp4dcDWU9P37xQkU3NgnbzemWocCSc9w8wBaOsYy8pxYobfT4ROk
         y3Hir9CT9bKutG0H+uCM7CydErlvmWjvfIlB96WBoCUYxNFqEl0N2mtVZeQ0jL9Iqj/f
         akRfFOCRWa1ZDffzQNqniOuYO6ooVDvn91GFvNIftsvyjBQu7hghG/JI9o2ShopuPGPN
         AuCQ0xegRRutDrYJx/mAIrTV+5QpJU763oR/U5+kT3Gere4MN+I47Pd3V9f2FGPcp2A4
         m5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725288; x=1795330088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hlklr9HjlYj9YlI7wKU2ZXzvdmAz50MqQ9W4xUO0aG4=;
        b=qO7B6eFjGdoc/ZgsBK3D72gG2Idp1jFKAmJTTHSHzwUV9w/rda6mizyWCIxvES5kiZ
         AdyM+eXXS3hMSJUnbCR8ZWcjBVN+RNoN9UdcptKn9o8aSbRUJ2aic2lAp7hiAFAYrl/n
         Ccfv7BxF8Hy5oxGnTITwWhg83eamXRhmJ7WdY0U3075quLvqoUAwQKA138mHmFHNXvhm
         uyC8leWDkeldME4MuVhg4hYHB85Lnyo88HEKCA5qurAqMUfZUtWZc5+4aJ/rv8apjmmz
         OKMD7WqGTp7zGjOxG+UExOateTEnKtYsxyTi5WiGC6Y1yXUHV8n+48ls2/fC+uG618c6
         fRsg==
X-Forwarded-Encrypted: i=1; AL+hErGn1pPkE9/3/fNECe+LSkFqIw4YnpfNRUCnRaZXcxHfgXy+FvsE0M3sz0SgZ1TduWo8NJRk4Wsh1ZTdTrIicQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fLg4E6GU9vzlL9+fFCdDKj//AsyI+lp45J5DF85TkjrJao4tX
	M/y4gUeOpZ4tQW/FzXRkgGFKQcq/WDJgEJazKsjdFt+mqcUUQf6CaKj2
X-Gm-Gg: AYBFou2Y6E0HW2VK6dnTG6wR7IHOA6NRd9zjjGmiM7a88rXuTsX8kMw7R+fxiOx/Cym
	y067hU3IIEuIFIyI3iOnqbuwQMtg06HBrkhB5tUxKvxucktjmt+NSqHWQigbA+EewRwegT4fJby
	bhHjW1nx80YrjkNYJoiD9Gq1cw4ezRu7B671OGRr16iWDdpKk5OVJ/scHH1v/IZyQI1+uV4kH0r
	H2DTbwt9uINHTav7GJltqxXtOsaNnwZ8CJCQVhKeadvxOEgl4KQHL+r9p5iE2R6kGQYzSXBUbay
	Axpwc+0oBi5H32U2JdBKW6Yn3UT5/T+f/s0fUer1UTbrErVQj4H5XoeaPqsPXCkXR+zzi0MynEj
	feNjRbSA3cUcHh+J4z4vKPOpSkB1P2B84HMJMtP+sU/Nl2W8Otnh3VBt4/j0v/G1JvEil3e/cdt
	LbZOQYNowiPVLwV5ybaVb90c/5gX3hFMiY1rEc+rgyfm9CnQFyAYVKN/YGfnZPHFEdO/Z8lwNxN
	V0ookK/EovEUbQnXDseaEgFEioGQcB2w/JPXoVbehav/zKJOIVrvwWEZeUccC6xoTyqbdOul8Vg
	WbOen5SUByF/JYCqyJvmcCXGQR+ncVh7mrFhnQPIc7Uyfwcc8mLLJH8gWCxXde4y0NXRENSc0RF
	gn5v5gsvBdBcmN6IOCwE0bFzEh+l4ceRo8W5vmNn9gFk7KcjU2dbS+NY9gA==
X-Received: by 2002:a17:90b:4cc9:b0:3b1:82fb:7e03 with SMTP id 98e67ed59e1d1-3b1b09e665emr7066042a91.11.1794725287676;
        Sat, 14 Nov 2026 22:48:07 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:48:07 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sun, 15 Nov 2026 15:47:37 +0900
Subject: [PATCH RESEND net-next v2 2/3] rust: net: phy: make Device generic
 over a lock context
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
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-2-8fa7897a0352@gmail.com>
References: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
In-Reply-To: <20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352@gmail.com>
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

Some PHY driver callbacks run without `phy_device->lock`, but every
callback gets a `Device` whose type says the lock is held.

Make `Device` generic over a lock context, `Locked` (the default) or
`MaybeLocked`, as `device::Device` is over its device context, and move
the methods that do not need the lock to both contexts. Update the
documentation and SAFETY comments to match. The next patch uses
`MaybeLocked`.

No functional change.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs     | 141 ++++++++++++++++++++++++++++++---------------
 rust/kernel/net/phy/reg.rs |  17 +++---
 2 files changed, 105 insertions(+), 53 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 7ca3f2329e6a..105a1b727a08 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -50,6 +50,51 @@ pub enum DuplexMode {
     Unknown,
 }
 
+/// A trait implemented by all contexts a [`Device`] can be used in.
+///
+/// - [`Locked`]: Serialized against every access made under `phy_device->lock`. The default
+///   context of [`Device`].
+/// - [`MaybeLocked`]: `phy_device->lock` may or may not be held.
+pub trait PhyContext: private::Sealed {}
+
+/// The [`Device`] context of every [`Driver`] callback that does not take a
+/// [`Device<MaybeLocked>`].
+///
+/// PHYLIB calls these callbacks in one of three ways:
+///
+/// - With `phy_device->lock` held: every callback not listed below.
+/// - Without the lock, but where PHYLIB ensures by other means that no other path accesses the
+///   instance: [`Driver::probe`] and [`Driver::get_features`], which are called from
+///   `phy_probe()`, and [`Driver::suspend`] and [`Driver::resume`].
+/// - Without the lock, possibly on an unbound device or one bound to another driver:
+///   [`Driver::match_phy_device`], which therefore only gets a shared reference.
+///
+/// # Invariants
+///
+/// For the lifetime of a `&mut Device<Locked>`, no other thread accesses the state of the
+/// `phy_device` that `phy_device->lock` protects.
+pub struct Locked;
+
+/// The [`Device`] context of callbacks that PHYLIB calls both with and without
+/// `phy_device->lock` held.
+///
+/// A callback in this context must not take `phy_device->lock`.
+///
+/// # Invariants
+///
+/// None beyond those of [`Device`].
+pub struct MaybeLocked;
+
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::Locked {}
+    impl Sealed for super::MaybeLocked {}
+}
+
+impl PhyContext for Locked {}
+impl PhyContext for MaybeLocked {}
+
 /// An instance of a PHY device.
 ///
 /// Wraps the kernel's [`struct phy_device`].
@@ -57,6 +102,9 @@ pub enum DuplexMode {
 /// A [`Device`] instance is created when a callback in [`Driver`] is executed. A PHY driver
 /// executes [`Driver`]'s methods during the callback.
 ///
+/// `Ctx` is the [`PhyContext`] of the callback. Methods that rely on the exclusive access that
+/// [`Locked`] describes are implemented for [`Device<Locked>`] only.
+///
 /// # Invariants
 ///
 /// - Referencing a `phy_device` using this struct asserts that you are in
@@ -71,34 +119,9 @@ pub enum DuplexMode {
 // [`Driver::resume`] and [`Driver::suspend`] also are called where only one thread can access
 // to the instance.
 #[repr(transparent)]
-pub struct Device(Opaque<bindings::phy_device>);
+pub struct Device<Ctx: PhyContext = Locked>(Opaque<bindings::phy_device>, PhantomData<Ctx>);
 
 impl Device {
-    /// Creates a new [`Device`] instance from a raw pointer.
-    ///
-    /// # Safety
-    ///
-    /// For the duration of `'a`,
-    /// - the pointer must point at a valid `phy_device`, and the caller
-    ///   must be in a context where all methods defined on this struct
-    ///   are safe to call.
-    /// - `(*ptr).mdio.dev` must be a valid.
-    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
-        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
-        let ptr = ptr.cast::<Self>();
-        // SAFETY: by the function requirements the pointer is valid and we have unique access for
-        // the duration of `'a`.
-        unsafe { &mut *ptr }
-    }
-
-    /// Gets the id of the PHY.
-    pub fn phy_id(&self) -> u32 {
-        let phydev = self.0.get();
-        // SAFETY: The struct invariant ensures that we may access
-        // this field without additional synchronization.
-        unsafe { (*phydev).phy_id }
-    }
-
     /// Gets the state of PHY state machine states.
     pub fn state(&self) -> DeviceState {
         let phydev = self.0.get();
@@ -177,17 +200,6 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
         unsafe { (*phydev).duplex = v as c_int };
     }
 
-    /// Reads a PHY register.
-    // This function reads a hardware register and updates the stats so takes `&mut self`.
-    pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
-        reg.read(self)
-    }
-
-    /// Writes a PHY register.
-    pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
-        reg.write(self, val)
-    }
-
     /// Reads a paged register.
     pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
         let phydev = self.0.get();
@@ -206,14 +218,6 @@ pub fn resolve_aneg_linkmode(&mut self) {
         unsafe { bindings::phy_resolve_aneg_linkmode(phydev) };
     }
 
-    /// Executes software reset the PHY via `BMCR_RESET` bit.
-    pub fn genphy_soft_reset(&mut self) -> Result {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_soft_reset(phydev) })
-    }
-
     /// Initializes the PHY.
     pub fn init_hw(&mut self) -> Result {
         let phydev = self.0.get();
@@ -276,7 +280,52 @@ pub fn genphy_read_abilities(&mut self) -> Result {
     }
 }
 
-impl AsRef<kernel::device::Device> for Device {
+impl<Ctx: PhyContext> Device<Ctx> {
+    /// Creates a new [`Device`] instance from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`,
+    /// - the pointer must point at a valid `phy_device`, and the caller
+    ///   must be in the `Ctx` context, see [`Locked`] and [`MaybeLocked`].
+    /// - `(*ptr).mdio.dev` must be a valid.
+    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::phy_device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: By the function requirements the pointer is valid for `'a`. `Opaque` permits
+        // other `&mut` to the same `phy_device`, e.g. in a concurrent `MaybeLocked` callback.
+        unsafe { &mut *ptr }
+    }
+
+    /// Gets the id of the PHY.
+    pub fn phy_id(&self) -> u32 {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is valid by the type invariant of `Self`. `phy_id` is set by
+        // `phy_device_create()` and never written afterwards.
+        unsafe { (*phydev).phy_id }
+    }
+
+    /// Reads a PHY register.
+    // This function reads a hardware register and updates the stats so takes `&mut self`.
+    pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
+        reg.read(self)
+    }
+
+    /// Writes a PHY register.
+    pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
+        reg.write(self, val)
+    }
+
+    /// Executes software reset the PHY via `BMCR_RESET` bit.
+    pub fn genphy_soft_reset(&mut self) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`. The C
+        // function does not require `phy_device->lock`; PHYLIB itself calls it without the lock.
+        to_result(unsafe { bindings::genphy_soft_reset(phydev) })
+    }
+}
+
+impl<Ctx: PhyContext> AsRef<kernel::device::Device> for Device<Ctx> {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
index 80e22c264ea8..e6892f3b855f 100644
--- a/rust/kernel/net/phy/reg.rs
+++ b/rust/kernel/net/phy/reg.rs
@@ -8,7 +8,10 @@
 //! Ethernet management interface clauses 22 and 45 register namespaces, as
 //! defined in IEEE 802.3.
 
-use super::Device;
+use super::{
+    Device,
+    PhyContext, //
+};
 use crate::{
     build_assert::build_assert,
     error::*,
@@ -44,10 +47,10 @@ pub trait Sealed {}
 /// ```
 pub trait Register: private::Sealed {
     /// Reads a PHY register.
-    fn read(&self, dev: &mut Device) -> Result<u16>;
+    fn read<C: PhyContext>(&self, dev: &mut Device<C>) -> Result<u16>;
 
     /// Writes a PHY register.
-    fn write(&self, dev: &mut Device, val: u16) -> Result;
+    fn write<C: PhyContext>(&self, dev: &mut Device<C>, val: u16) -> Result;
 
     /// Checks the link status and updates current link state.
     fn read_status(dev: &mut Device) -> Result<u16>;
@@ -104,7 +107,7 @@ pub const fn vendor_specific<const N: u8>() -> Self {
 impl private::Sealed for C22 {}
 
 impl Register for C22 {
-    fn read(&self, dev: &mut Device) -> Result<u16> {
+    fn read<C: PhyContext>(&self, dev: &mut Device<C>) -> Result<u16> {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
@@ -116,7 +119,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         Ok(ret as u16)
     }
 
-    fn write(&self, dev: &mut Device, val: u16) -> Result {
+    fn write<C: PhyContext>(&self, dev: &mut Device<C>, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
@@ -196,7 +199,7 @@ pub fn new(devad: Mmd, regnum: u16) -> Self {
 impl private::Sealed for C45 {}
 
 impl Register for C45 {
-    fn read(&self, dev: &mut Device) -> Result<u16> {
+    fn read<C: PhyContext>(&self, dev: &mut Device<C>) -> Result<u16> {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.
@@ -206,7 +209,7 @@ fn read(&self, dev: &mut Device) -> Result<u16> {
         Ok(ret as u16)
     }
 
-    fn write(&self, dev: &mut Device, val: u16) -> Result {
+    fn write<C: PhyContext>(&self, dev: &mut Device<C>, val: u16) -> Result {
         let phydev = dev.0.get();
         // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
         // So it's just an FFI call.

-- 
2.54.0

