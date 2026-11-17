Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911802;
	b=kbw55K5Zn8BjYQyLVdkspg4RZv0iXKknnw2ejZ2EenVx+ZnZNWkz+AxwHJjsvqpiSieS
	 MnoNswcMWy7l+cLUki076yysrW3UvnIpfTPDDYFJkthADc6nzae8ru9eHjXRikBS9qOAc
	 GmF+HPxTlKmS+vxAQvRlRWtHfLVHM6JLEYMPkHsqnUQbFTH+9hqBsloNQCDw6bYH2uQVA
	 kYU9vOIpptC3roQ7Y+5e+3hFgQWNqN5Jd2OP6t2Zfme3yGyIl5g22oVjDJdEL92AQme0Z
	 s/T98c0/Lt/18ItRbkL+nFooWjIKHgGVkGXNVaSXI5SxAme+ji4fwMYYibB1o1LpJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ckRpojr4ykb0gO8rk14uGRYSb8zTmNmAb+GlfSm1O1Y=;
	b=GXCE3V7kfw56zgfpObwrSOzhWgKUBp5LJgxQW+0hAV5YLRd154i0Xj/RlTAkj/PywqU+
	 UnJdqZKu2Dr/L9hRx+g+ufHj2t6UePxDQVJAckoSP0sI0JkPL2OuyMhHmDZzgBMHDhKi3
	 MpmTj8FzzRvZrHGJwD8CJD9wtsO4x+Vh9+6T5eB0I6S0+wn0JnIVRoPkmUCuyqKlyOXbA
	 du4x3D8Dz5FbSgHVz3G9fDxH1UWA+EBtesLneFo8GV7k9a81RfDl9pTJwj4OOJD0a4iQj
	 oRZCtnBdQRd//6yZmK8ABvhqoRTiV5HyehIr+2HOIMk2lhFKy2CDE6+S7Tx/jIGnekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2v2UO4R;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8F606A882
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 10:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F8F606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2v2UO4R
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1912241b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911801; x=1795516601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckRpojr4ykb0gO8rk14uGRYSb8zTmNmAb+GlfSm1O1Y=;
        b=i2v2UO4RrCRg6gmuuan8eICLn8sSEn3eL2kMLw3JnsUzDtAah3GUr5i6yugAg+AZ8I
         Xj3sBxwF9MAc9JsjDDB7Sr61sUx0DC2MztLLzdI/8uGCb/iSvyyy5yrdx1PTOpZ5NBG+
         m1Y+wWdfcEb/Yu1hAyF26tEWhEKTWHu32K7LTiu6rjMJQJJvs4zY7L0rv7f50kHX75WI
         bTT/91Vi0cnVP/8geYOCqelEJYn9DQaFZvhCl2XFz+j3uZEy4gGFD7gq9xbu7v3skTeH
         fmDB3mmci2UpeL3ruS5oyvuVOD4vfzZgoVTj/gc447Lcc4Y9qQVgMdHHSFirDU/ZM2Oi
         5AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911801; x=1795516601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckRpojr4ykb0gO8rk14uGRYSb8zTmNmAb+GlfSm1O1Y=;
        b=PugfdDmFImmHlI8ePgieNKI8kAdv0Fwr86lABCUnxtuIUiMl5d8UZer7u/zgivovPk
         w/Xqed/MZBMid7evtc6dbmwl3979kqH71JrbzxJP9xT+Zs2nKMBcczF27xYpX3YlwVSM
         +mZ2AFlXaLNZPl+KFL4JBigGOru126c1wouZV4XgoaBuyUSfZWLCtSzJOV2hiUiOhqxe
         9ttjRy6S8w5/yfSirVt+m9XVy6qNX08W6EOcNTuQBj8WiYwwOYqOSX4wrjogenRuqDDc
         wobv7RzSmbe9T9Jn98/6t/UxaJVbz4NXdtns99CIVh0v4sE+LBK0sUaQAblrev9zJpbn
         EfFQ==
X-Forwarded-Encrypted: i=1; AL+hErEA9AY4CxlgGT26XgVTCDxI9Gqp2QYTw7sPRZTBQ19AwtoxA5PDnG7HvCowEWwrg9RLvFSoBHs2rRs/TneI3w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vVYwr7p07XrLinw2t0B53Pr1VYeRhgwrkeOlLPJmZ9gPkBhj5
	9NWFSf831ZLnM2aYlFH83M8r2q2pScJ11VsGp6QJe3RL4bf+/7d44nzs
X-Gm-Gg: AZFdTZe4/kjpRwBLrQtKjwepb8i2yjxLgdkWfjPRJFE6LTBV/wJ5/Beg3nSP24hhBS1
	sI0/QhkZpeMgg3mVWj5qaZuzMoJZ2L840DlgfN1yrEwrzb+IrCXDgI0oDesHeLgR7PLCN6ERTBH
	xoYbLIBLpJk48/nE1JJ9Slcdu3nukd18K+8G+duOs+ZP3NUBSvNOMTDcOoZbj1T7PfvaBnPeOAr
	3aN8rs7bLiFTSoYN8GfPoim3ppI20j1+lOQdTaIIRnFVdcRC8/zVts8MYz2xB42BJ7w3KpB570o
	tE8Grj9cldTm/MQ9SVMP2E9VQeD2tZwBfdRx9CcY1xcNfhqvGoo3uYkvgd2krbrx/Mj6soJc8al
	+Ph3DDlwxsbGAEebHzTJ9M3J6A2lqcYnypp4m1ZXvnIF2I6sB8crVqlaJzNnNgc4pdQ8OhHF4jx
	miVjryklFAPBzZbN9rNC9qMXYeXz1OjoBqnuLkIkbq3l9kKkPLq4chHIowDhopwWt1i7lum2mex
	uSqb/ESZeJwz6NOdW72sCuIXz7XZSvarBSlo8qRWXdk0foztYyzRAFBcI7K7aQmatEuHLkXKFkC
	RrDhznVEzWLqA/ZGdinJa2u/Joh5ewQuTRR9pKvZ1v1sYTJft15xOOSyT4oEFQ6lEJRsfxVurpY
	yn8Zzr5lIquTYooNwG9Dvv4L+Ol8TXGjdpBL0Ua2HUCW3feITT0a9jBUX
X-Received: by 2002:a17:903:228b:b0:2e9:5eee:e078 with SMTP id d9443c01a7336-2ee0d666816mr121363455ad.3.1794911800778;
        Tue, 17 Nov 2026 02:36:40 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:40 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:20 +0900
Subject: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over a
 lock context
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
In-Reply-To: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
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

Every PHY driver callback gets a `Device` that assumes `phy_device->lock`
is held, but suspend may run while another path holds it.

Make `Device` generic over a lock context, `Locked` (the default) or
`MaybeLocked`, as `device::Device` is, and move the methods that do not
need the lock to both contexts. The next patch moves suspend to
`MaybeLocked`.

Document when the `Locked` callbacks run without the lock, including the
existing phy_mii_ioctl() race, and fix their SAFETY comments.

No functional change.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs     | 207 +++++++++++++++++++++++++++------------------
 rust/kernel/net/phy/reg.rs |  17 ++--
 2 files changed, 133 insertions(+), 91 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 4604a9c0a511..8cbb4c19dac1 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -50,6 +50,55 @@ pub enum DuplexMode {
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
+/// PHYLIB calls these callbacks with `phy_device->lock` held, except:
+///
+/// - [`Driver::probe`] and [`Driver::get_features`], which `phy_probe()` calls without the lock
+///   before the device is attached.
+/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the lock from
+///   `phy_attach_direct()` and `mdio_bus_phy_resume()` while the state machine is not running, and
+///   from MAC drivers that call `phy_init_hw()` directly, which are then responsible for exclusive
+///   access. `phy_mii_ioctl()` also calls it without the lock while the state machine may run,
+///   which is an existing PHYLIB race.
+/// - [`Driver::read_status`], when a MAC driver calls `phy_read_status()` directly. The MAC
+///   driver is then responsible for exclusive access.
+///
+/// # Invariants
+///
+/// For the lifetime of a `&mut Device<Locked>`, no other thread accesses the state of the
+/// `phy_device` that `phy_device->lock` protects.
+pub struct Locked;
+
+/// The [`Device`] context of callbacks that PHYLIB may call without `phy_device->lock` while
+/// another path holds it.
+///
+/// Only methods that do not rely on the lock are available. A callback in this context must not
+/// take `phy_device->lock`.
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
@@ -57,48 +106,19 @@ pub enum DuplexMode {
 /// A [`Device`] instance is created when a callback in [`Driver`] is executed. A PHY driver
 /// executes [`Driver`]'s methods during the callback.
 ///
+/// `Ctx` is the [`PhyContext`] of the callback. Methods that rely on the exclusive access that
+/// [`Locked`] describes are implemented for [`Device<Locked>`] only.
+///
 /// # Invariants
 ///
-/// - Referencing a `phy_device` using this struct asserts that you are in
-///   a context where all methods defined on this struct are safe to call.
-/// - This struct always has a valid `self.0.mdio.dev`.
+/// - `self.0` is a valid `phy_device`, and `self.0.mdio.dev` is a valid `struct device`.
+/// - The invariants of `Ctx` hold for the lifetime of a `&mut Device<Ctx>`.
 ///
 /// [`struct phy_device`]: srctree/include/linux/phy.h
-// During the calls to most functions in [`Driver`], the C side (`PHYLIB`) holds a lock that is
-// unique for every instance of [`Device`]. `PHYLIB` uses a different serialization technique for
-// [`Driver::resume`] and [`Driver::suspend`]: `PHYLIB` updates `phy_device`'s state with
-// the lock held, thus guaranteeing that [`Driver::resume`] has exclusive access to the instance.
-// [`Driver::resume`] and [`Driver::suspend`] also are called where only one thread can access
-// to the instance.
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
@@ -177,17 +197,6 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
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
@@ -238,14 +247,6 @@ pub fn genphy_resume(&mut self) -> Result {
         to_result(unsafe { bindings::genphy_resume(phydev) })
     }
 
-    /// Suspends the PHY via `BMCR_PDOWN` bit.
-    pub fn genphy_suspend(&mut self) -> Result {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
-        to_result(unsafe { bindings::genphy_suspend(phydev) })
-    }
-
     /// Checks the link status and updates current link state.
     pub fn genphy_read_status<R: reg::Register>(&mut self) -> Result<u16> {
         R::read_status(self)
@@ -276,7 +277,52 @@ pub fn genphy_read_abilities(&mut self) -> Result {
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
+    /// Suspends the PHY via `BMCR_PDOWN` bit.
+    pub fn genphy_suspend(&mut self) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`. The C
+        // function only sets `BMCR_PDOWN`, serialized by the MDIO bus lock.
+        to_result(unsafe { bindings::genphy_suspend(phydev) })
+    }
+}
+
+impl<Ctx: PhyContext> AsRef<kernel::device::Device> for Device<Ctx> {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
@@ -309,10 +355,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_init_hw()` calls this with `phy_device->lock` held, or without it while
+            // the state machine is not running or a MAC driver ensures exclusive access.
+            // `phy_mii_ioctl()` is an exception, see `Locked`. This is the `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
         })
@@ -323,11 +369,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn probe_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we can exclusively access `phy_device` because
-            // it's not published yet, so the accessors on `Device` are okay
-            // to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_probe()` calls this before the device is attached, when no other PHYLIB
+            // path accesses it. This is the `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::probe(dev)?;
             Ok(0)
         })
@@ -338,10 +382,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn get_features_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_probe()` calls this without `phy_device->lock`, under the same
+            // assumption as `probe`. This is the `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::get_features(dev)?;
             Ok(0)
         })
@@ -366,10 +409,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn resume_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `__phy_resume()` asserts that `phy_device->lock` is held. This is the
+            // `Locked` context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::resume(dev)?;
             Ok(0)
         })
@@ -380,10 +422,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn config_aneg_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: PHYLIB holds `phy_device->lock` when it calls this. This is the `Locked`
+            // context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::config_aneg(dev)?;
             Ok(0)
         })
@@ -394,10 +435,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn read_status_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: PHYLIB holds `phy_device->lock` when it calls this, or a MAC driver that
+            // calls `phy_read_status()` directly ensures exclusive access. This is the `Locked`
+            // context.
+            let dev = unsafe { Device::<Locked>::from_raw(phydev) };
             T::read_status(dev)?;
             Ok(0)
         })
@@ -407,10 +448,8 @@ impl<T: Driver> Adapter<T> {
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn link_change_notify_callback(phydev: *mut bindings::phy_device) {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
-        let dev = unsafe { Device::from_raw(phydev) };
+        // SAFETY: PHYLIB holds `phy_device->lock` when it calls this. This is the `Locked` context.
+        let dev = unsafe { Device::<Locked>::from_raw(phydev) };
         T::link_change_notify(dev);
     }
 }
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

