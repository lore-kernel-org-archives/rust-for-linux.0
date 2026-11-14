Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658747;
	b=BvkEzNGT/ZwlALa/36LvCNXCzutee7KpEnkXDjgLnuztMXim9KFKvWmPY2K0zp5kBNel
	 33QzjMKTO8W8oRvRlLfpBdSsKnQHOf3IffDwaN2A3+Uj3B1xfHEdSvnQuJf8LRhztrHDc
	 HQ9QBaJhuAE2AfZnzOdG9ZTCqC59VGBnrwgvUxt1Fl8AB8QrtPRk288htRiiZ3Mzo+SVL
	 Nf+0W7Ho/975shgCzHQyHeg8aOX0WwpYP1MzYsq1vmpcc/+Hop6/tARvk8CV+XvFCQN9u
	 72kE5kdcKQeYUWBgtR7kFTa/kE0QiKMhnLjQDSv11Kuj7smFpH1EWbor2F0mweXm6kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
	b=JvZVj+0MTgVZaN3naaFGfpkfyM5qmdpRGSVbaIa/3+Y/hTgyBYaALwLjyAQpn6spsMVs
	 JAzE9Dg9u6fn13PqAvP3gtEQW4ZRh1zTHw8Ru0hVBPspI+X1A0/kSVtk3wd4Tpi21oUxD
	 wCZszR5X5VWItnyGlKbHEyMObcnFposVc/cuQfw8m/JZs18Ab0OnHCDgYYb/8xkU1Yal2
	 eQocXo5J+l3OYiMvbOJMaT/BmBsNSFzWPtwywEK4u6nxlMgEXbnFzmLApRov6bjclYLWR
	 6RbmynvBSc39oqsDTDo9s7FBIIIZ5J6uE+9Kvpgg3C0omQ4aCMCzSzS+h/o4FEfYBWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfAMyMoh;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A812606A335
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A812606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfAMyMoh
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso797684b3a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658746; x=1795263546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=DfAMyMohXe/arlvfBpEO3jQFkGWEHoEWMj+emJl2JFhd082Stg8BljsNPdaxZ7viKf
         LFWvIU9768f4tlulzItmBt7sl7S2vBsI8KI/6Npk9CTu9Vyji+y6kqWRY7srBtt+OaDK
         uivSx7NTvSjkalpZgcDN4Gs9gr5vd4uQUbm82sMWooM26njBFJvNfcySZEyliKQKtTLO
         DDk3i9cvtYd6cA8tn7JQQpLTZ41CexIYfPW4qhM1fqqCtV0KmIU9vNfz6zwC4b8cI2ty
         9RGxRdZNaipxBSFNmEis1ujMxI+XvXN1xCjj/IXxx49vthq0UO7itVtHauZm+kEnVsnN
         WwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658746; x=1795263546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyenbPZNtGuUfwVU+kdmxfuV+o4Dxas+l3oqGSTufiY=;
        b=K3yVPG0fFPAyReaS8LeymewYy6lo/ShRRACCrp7C3cBp3HazwY0FzfTh9ZF8cIoZFM
         vEjDwt1BViqnp1lBMa3aWUe7MeKl4WeF3muKYLs4I1yeOyOUeEz/OR+IG/8CEQi0nieh
         Xkm/IOEKKrx7y/5JUgpX2wOQr7UEkBWh1D8lmV6Y6FLIKEf8aYaLIQ8xM+rlBIMfCg7Z
         VfSMC8u59OUvjmziUiWSBEtaL93LMuB+mxG+xIRXYAv6r2b00PQylSAZxt+qUg63Bc2R
         OoZ8h6RLvz6C332r1MeqP+SuIN/SKdsswuoTTp8Edyx1+jd+0ngpu49g8+YgLDBwRDyI
         iQqg==
X-Forwarded-Encrypted: i=1; AL+hErEOuoti5gfLmhTLLy6CbuOPsyqaT5lC9wg20kmD7bE0iZ22HZ14NJDg2/pJNFNaUOx1I+k++1OoXOgca5ILIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SweUBQbCC/Fsa30FNW5gNHivyUTEsqkL81ND32vD4hcCheW5o
	ieleUFi0t1qxQFO8YD/mFbyeC+bc2fro3/Kp28N8UKCQuTFd9hKs380n
X-Gm-Gg: AYBFou0hrkJ2b8ak8aCodLQQu1ijRUddZBKjhfUi7EFjI+sFFo0weBGqErIlCQmlHIY
	cyem7d6aDoW6KGDgDBMq0DNgsgcMNHU0/3B2zD3egV8V4HHk9KP/7BzwCDy9xexcGPdd/bOpyKT
	TVRTob/kUoxjadRGK7LYZZT84yOWL0DQ/ZKvj/N9HWEZjMpC/gHYdLj4GC9wfM1YOW3UzK8h6uk
	Csc4F4NRXzqDsVJEnT5lWi/J4cHw3C/smkTM67K6AgIc+VoLggtClAClMxg7bH/bbbouAm6097+
	Ba1D0gDUfGNN1mCf9LNi+zfzixwlBYzGMnLCsoknPz20fpSal6ehJeotzlQZC53+G3oPpnvvUwR
	HcULwMEYcTTUmJdD+1R7ChTn7fvZH9tpeeaeuyMuSvqker0CT2cojRvySzh11vqlTJYv0r/RB0g
	91c9LNwOn95jzstAXieZyWnXf0ocLc0lRJNDolEE0RYRHHWQZVyWMJJs7zNuCNTHYOxkK9cN/76
	7OSV5vMnlNOXgqzeyleA5JFmaIHGupMzHaIeZwnIEUP9QiiQPmdF9ujWlLmV4lZlwDBSvlTf3pk
	hhjqaFoRRXYJP4guQ8Xosbarixk6YltqRznCEk0QrXlnYoXrmOFBN+Uqwbg9+OEV3JP18p/GOXf
	so/nCtfATYQCqSYZNn2gzmJ2DFCcGgabYukxmDrkubH8XwqKh8ljt9wFN
X-Received: by 2002:a05:6a00:e18:b0:89e:3742:3e16 with SMTP id d2e1a72fcca58-8beb57c3e8amr4969876b3a.18.1794658746438;
        Sat, 14 Nov 2026 04:19:06 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:19:05 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 14 Nov 2026 21:18:25 +0900
Subject: [PATCH net-next v2 3/3] rust: net: phy: pass a MaybeLocked device
 to soft_reset
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
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-3-19a4dd658b6b@gmail.com>
References: <20261114-exp-phy-rs-maybelocked-v2-0-19a4dd658b6b@gmail.com>
In-Reply-To: <20261114-exp-phy-rs-maybelocked-v2-0-19a4dd658b6b@gmail.com>
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

phy_init_hw() calls `soft_reset` both with and without
`phy_device->lock`, but `soft_reset_callback` hands the driver a
`Locked` device and its SAFETY comment says the lock is held.

Pass a `&mut Device<MaybeLocked>` instead and correct the SAFETY
comment. Update ax88796b_rust, the only implementation.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs | 8 ++++----
 rust/kernel/net/phy.rs           | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..88e6e3c88b44 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -30,7 +30,7 @@
 // BMCR_RESET bit and poll for the reset bit to be cleared.
 // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
 // such as used on the Individual Computers' X-Surf 100 Zorro card.
-fn asix_soft_reset(dev: &mut phy::Device) -> Result {
+fn asix_soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
     dev.write(C22::BMCR, 0)?;
     dev.genphy_soft_reset()
 }
@@ -85,7 +85,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 
@@ -115,7 +115,7 @@ fn resume(dev: &mut phy::Device) -> Result {
         dev.genphy_resume()
     }
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
@@ -127,7 +127,7 @@ impl Driver for PhyAX88796B {
     const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
-    fn soft_reset(dev: &mut phy::Device) -> Result {
+    fn soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         asix_soft_reset(dev)
     }
 }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 105a1b727a08..46602798e8ac 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -358,9 +358,8 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
+            // SAFETY: `phydev` is valid for the callback. `phy_init_hw()` calls `soft_reset` both
+            // with and without `phy_device->lock`, which is the `MaybeLocked` context.
             let dev = unsafe { Device::from_raw(phydev) };
             T::soft_reset(dev)?;
             Ok(0)
@@ -575,7 +574,7 @@ pub trait Driver {
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_custom_mask(0, 0);
 
     /// Issues a PHY software reset.
-    fn soft_reset(_dev: &mut Device) -> Result {
+    fn soft_reset(_dev: &mut Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

