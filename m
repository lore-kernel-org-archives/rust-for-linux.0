Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658733;
	b=2Xe0Jy0EjJc5qWam7bba8BhVEh+WTpbJYS6a2u5yz7cFLGYizC08rDfCBtUWbHnrgU3b
	 H9KayWhWrhp8TTPi2bQuKxCvrGNr/+T9Tx8YKEhLOOIOO0p3/r3CKmxGDrAWYI2Ax9mtL
	 t+kLH4tA6Iy+w22EABEF/r8Se0VTPSC2r0xnMsUBz3vtBwDS3X2Xs+6rHwpUkP/DMZGzV
	 1jfDfLVkFr1OXp7sJ9mjAv8eIPO4MzLGHknDdqJkGZxQx1Q5uHzJcOTDsxYOs59KZyjFo
	 wQ+jYzvuqd58oKuKHptKLAFS4Djkqs8CuwDiNxri/wyMZjfcLOR5x27CyOZpLasIAeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
	b=askHvBci7G6cQPKfklcFuZDt2uRQBxQgteTeVdPf1Fgn2pVFEuT7ysotn1059L6aTYw2
	 ztgP+3PVXX7zdxLOmKXFaXDixYm7OYihElKnhuZUevM4GzxBp+SQB+FQIbJNax9NGNkYw
	 thldm10s7E2PbDRip946ptDaD4EThN86gS38EhYel0z1qe7h+du5nUzSVLcqDWfzPwbDL
	 ZHotRuYgNdhQ7nvqMxJTqWus6Cf3NnU8HB5A2kahZOjiA6/ZJwfMKQty0+NmLEKahOdoj
	 mTjgmZ0Zd4pfcV8frhXh3o8Q8ABpRPJxjDnwawbzva+VNEv3VgoaFrs5C5/WBmZa4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZY3b4uOS;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B738606A331
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B738606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZY3b4uOS
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b6b22be970so598128b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658732; x=1795263532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=ZY3b4uOSYvGz9nNcu1qwN/od2PeKMgIh+NV0BB2dFBwYawl8/E5HP46kuhu8OzpoPD
         o/5jQDYpkp2mxVM95AHfxs8uc2QGWKy05b2DAXCNarRN1SsRPD9z1ptc94kdKlxh5XI4
         KUgJtwKI1ilBrkGWXepRoHRQpMmHxTCkbygrkELMU8ZDF1VnrmV+6qV3z8Rb/XgGnODa
         wxKK9O3jUFhzq6l4+U2DLkwqtzPmfY0KR2y1wCZMr9g2FwcWMAKTHBauFzb340w24Ath
         p5zMobbDqGzUNnBKxRshLt5wR1xDK6rL8oYgFeRnatqTwLxmkWR5fo37gKm9IToyf5Vm
         EF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658732; x=1795263532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=RDJvqht6KJWe22jS1C6NXaSK0l8+jCk+OPEFTSzTap/hG9sEAU6rPz+pAtbk/XI142
         2dFVbbTCON3CYiIsbFglsIc4r52oFWKPYff7lWAQFxRie/u6dedJnUhP4zLVQM+Sc8YB
         NDvCVTHg58dXTyAjOkk16P7l7J0BjDhV/HmtWMpmVvpvnYDpmAs9TprP+q35xn1gJtJs
         mM73d5KqQyJsB5cWLrIf5swjNzDlu+jDUyOaj1ArToZBDdGH5ylhdCCOv+Q7mmPMnL4L
         8/GW4pVkb9nYqjeTaEHGgjvefrXD1w+AmoQUgtvugEhUwgY9oC7hA0RFEK5wfaflYM7K
         ABMQ==
X-Forwarded-Encrypted: i=1; AL+hErELg8jYZ+Ecy8a2cgjuxFs55OnM+oJSArtFZLvl2z2epZxIJ7yUIIogxZlxbpMLAsYEnyQH7ibXbyzwSRbvtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rd9MCjLQ5yK5WwWwnx1gT3dG0RxMdiRv83MIrGOmrvphB83lK
	NYS1v63lpQV3fjwoGjoEeNIFcr31qe1N9tJe9ng1334EZ+oriBvZHZjp
X-Gm-Gg: AYBFou2e6l6rJo9vJqo8qNbTyfBcsWcR0ATouH7hhBTKuxNyjXoWbCLrL4VfC3YeONt
	g7cEKLO/IePJafBnhPCJzK/IYPdEaEEPR0ZJXrLuFYyDmIGetAXJD/WPF3bhVLfqwEHM7PDjfjB
	8V6dRA9U4qKnJXjLrcDvDEiSsfWAdVpcX5AbJzJ9085rU35FlPMkVF5dsGXZuUQSF7KpW1Lad+B
	j3Jhx0ZtjugB/AyyrAfuUUtZKUJnTXrxqWKV+//1Ee+kMUuhlB67b60yhzY19Ofwgiz0n1c/0bV
	ZSRSHyNCH3zT2a9q3iYXeUM/TWLNtOPIg2hu7INsBW+09M/cYvxZiGUId5EuxkBh9c/durV+ObI
	9Lwei34e+4R7iZVmLw8GqrqSbeNsA9iAI56YfSkvM+gMyScfh/Nfo+su+RP23pCfTxMPKlkpnu4
	klQZqz8I1Mo0mVxbxr/j6RqVMNWLHPvTtwOnKwGhSCAqEffjJjLswlILkwx739rkb+TDvPjliOE
	LyP/jDR1Ri9hf8uDHmCzIdT+gG7o80z81vC9fQBSan76p1OJ6IX7tTbTeP/CUJL+F5jtjUDpQMp
	MgabZZd4XaJH0BVyCMwjkKoI3T7od8h75hCkA/kFOivrk2KqnB8ZG0SV7VFQQy/jKomRvDcl0jf
	ZjnCKHoOV3T7Oir7jyIf4P+he7c13GhzhMonrL16VFeNpyrfuH5FM8IkdO9ZTvIcbx8VDegAvgj
	4FPQ==
X-Received: by 2002:a05:6a21:4d17:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-3f9a6b6e4b9mr771041637.26.1794658732403;
        Sat, 14 Nov 2026 04:18:52 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcca19sm2094389b3a.4.2026.11.14.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:18:52 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 14 Nov 2026 21:18:23 +0900
Subject: [PATCH net-next v2 1/3] rust: net: phy: drop read_mmd and
 write_mmd from Driver
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
Message-Id: <20261114-exp-phy-rs-maybelocked-v2-1-19a4dd658b6b@gmail.com>
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

The read_mmd and write_mmd callbacks hand the driver a `&mut Device`
whose SAFETY comment says PHYLIB holds `phy_device->lock`. It does not
have to: __phy_read_mmd() and __phy_write_mmd() call them with the MDIO
bus lock held but not necessarily `phy_device->lock`, e.g. from
phy_read_mmd() in a hwmon read. The register accessors on `Device` take
the bus lock again, so using them there would deadlock.

No Rust driver implements these callbacks, and none has since they were
added with the abstraction. Drop them until there is a user and a way to
express the MDIO bus lock context.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs | 58 --------------------------------------------------
 1 file changed, 58 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index c4e7b1d6c6f4..7ca3f2329e6a 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -417,44 +417,6 @@ impl<T: Driver> Adapter<T> {
         T::match_phy_device(dev).into()
     }
 
-    /// # Safety
-    ///
-    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
-    unsafe extern "C" fn read_mmd_callback(
-        phydev: *mut bindings::phy_device,
-        devnum: i32,
-        regnum: u16,
-    ) -> i32 {
-        from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
-            // CAST: the C side verifies devnum < 32.
-            let ret = T::read_mmd(dev, devnum as u8, regnum)?;
-            Ok(ret.into())
-        })
-    }
-
-    /// # Safety
-    ///
-    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
-    unsafe extern "C" fn write_mmd_callback(
-        phydev: *mut bindings::phy_device,
-        devnum: i32,
-        regnum: u16,
-        val: u16,
-    ) -> i32 {
-        from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw(phydev) };
-            T::write_mmd(dev, devnum as u8, regnum, val)?;
-            Ok(0)
-        })
-    }
-
     /// # Safety
     ///
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
@@ -536,16 +498,6 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         } else {
             None
         },
-        read_mmd: if T::HAS_READ_MMD {
-            Some(Adapter::<T>::read_mmd_callback)
-        } else {
-            None
-        },
-        write_mmd: if T::HAS_WRITE_MMD {
-            Some(Adapter::<T>::write_mmd_callback)
-        } else {
-            None
-        },
         link_change_notify: if T::HAS_LINK_CHANGE_NOTIFY {
             Some(Adapter::<T>::link_change_notify_callback)
         } else {
@@ -615,16 +567,6 @@ fn resume(_dev: &mut Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
-    /// Overrides the default MMD read function for reading a MMD register.
-    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
-
-    /// Overrides the default MMD write function for writing a MMD register.
-    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
-
     /// Callback for notification of link change.
     fn link_change_notify(_dev: &mut Device) {}
 }

-- 
2.54.0

