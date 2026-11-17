Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911797;
	b=euf4OQVSuj8apEh9Pgk+uY0dXfVsN4k79WKsTCw58xsZ12c7swrK+AAtKOYIiKYNLBMH
	 euYOVoCtmShbipLyBlpjE09jT/pL3G+XsiD6p9DU8RepxejWs58psWgRj6qFSJfnXD/LD
	 04pn09t32sG5wKjKPPuGlRSLhh7ms0ck46EzstfBZQ4Olh2LjkvX5Jd/66ih+Wkkgtnoa
	 +2/PVRGe1z8DCHFCApFitC7xO+K9naw0WqdSdH4s4RoT9xKOXi75sTi29sYVaglaEj/5r
	 pbUSXqqbR/aIMuVEXa7nZsVdpqkRPqxDUQ9KJTuaox0jJ8U+xz43WbA1AZxDa9eeADA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qZNTBoTcS5DBWk9MrSUVIyuui63DwibuwP67YeoekqA=;
	b=wFaYAqKI1AOV/j0um/32/78P5KB0E7MUB1bZ9gEYTA/8Lu8IySNyroyRBYmBaZYKkyRy
	 XYzdG0lBLaqbhPqVJcmNu6QfH0MGcJtKt0DQLzwIpf0y+Ef39ZePHKBysMc6DoO2qA2vm
	 ufogY4wtvCAMtdpPEi9GEPkLTt6lmJY3bWRvvEJm/5v8z8BtqrpakppYnDC8nKwVIC1Bp
	 sTP88ZJrkUl/HM/U3vDsd0RAay+vlsu9BQUBWGyFFUey8OaVFc6byBPnMJMKp5p51JE8G
	 GSxUWIdEBWGkUVOGPlDBZxUifT1o4oKJzflHRicc0fxbrxcLQWEUL9ecl296m2djCbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mMSZTlR/";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA1B606A339
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 10:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA1B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMSZTlR/
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea7987517aso30339345ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 02:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911795; x=1795516595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZNTBoTcS5DBWk9MrSUVIyuui63DwibuwP67YeoekqA=;
        b=mMSZTlR/CC9DhBjsbWp2CdMrIuwQR+QeOA1T2utv9cc8U4/Lss0dk6Qe/qW5DnIPSd
         fNbzVlvQ7ys1Bmg8gMcrphDIZZReZMZ4oXzyRyQctDSX9+51plSTAj0AlximVuQUPOCS
         3JZ0aQlSymrIsJIZr/llhpNEfYP4p5nJKrgw4wGqpsJ5cTVRUALxhlEWKIA77GcD/t6b
         OhYz94YBUB8X9z7UXx+bpxkzo63NOKVUqdl/KG/aGBoDk3vNfaRZH6AJTjCKVPwpKyl5
         jYa7vZ7TY9mlCIEldPNW/e1xEcu87E5xg5hmXdf5fzGqCH8YjShQYUtobirU3A1WzUku
         D18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911795; x=1795516595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZNTBoTcS5DBWk9MrSUVIyuui63DwibuwP67YeoekqA=;
        b=aOPnpD8HrScgiJJjQ6cncV2bevFnX+tJgKVk+st0YYu/CXaGMgsX29dKOC37J2hyXC
         Y1WLyWUGRzEphtaqYSDVMSBoseOe4zngX5AnYFrP1u7fhDAfPc9cUMXpm+EexgGR4K5M
         9qCERmio0XL19hdTV0MNyLHHg+/oELLLPInzB5wyNmPsrwl6ILCPn7s5+6tGAGBoYeAd
         fd77ifcwYMaoIh1vggqWZO0hv32FvVZdhFt3LR3opfLeSX5ThB+fZMBmzFY6zDWSUXaJ
         tNFSrt23XkkVu9VXsx8uviVpD5HHXVLWX56+4hEwu066d49iuODvdsUYVZTadljYBh66
         tJyA==
X-Forwarded-Encrypted: i=1; AL+hErHds+NkE8qxAwyDzJvBBFp5uUug+ZV4GK1TAqzdYvv9w4uNvOqaXXYC7s2glgT0RxiLDRM/CZ6RPVex3gux+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TCIh5gF+5qYHUHFL/jpOHXV+Ha6VCZkUZk+rFhAfVF5VhaEi+
	z5OLRB6xfXOjd2ZiXARIWZA5WMoRP6SoIn43pwCcbyWz4XYeXQTSrf35
X-Gm-Gg: AZFdTZdlJkbLskn1YJTOdgwzHYnxE1ordTgLZnz4eZX4uIQ+hyqZeqhEuwlHIrmq3ZY
	KDyNkDFU+Kk5Atq7DmPUEOEuI8lxlTUL8a5JbAWl32Xpcct+d/hysq2nRdQU4E82WwwGRPGeNiS
	AM/deNPiDjbDQ5bOPoV9aRX9vc/HixSzHqwVn0EUz0Wgd1eWU1t2/W+lvQZOXwECRxY/72CbMDa
	IcPhlZgxWdcVGG51i7BENccPgLp/M93KcgTfAAbrL7SCzVnCArYYr5OkqgcTA9CtQqMDWa5ID59
	lojJTbFciv6gszVZbRH23CjbDpqNr4fkiIJEMN5LG6yGbSUs3+2QcmZlDbRPupJEwK79dXNYvdO
	tDfNAHPwhYgA7motjZg9wkQwxKJW4enwtYB8mrOhoBUfJAXRRUhNMC3CEgHCTz5NYEQ/KsCex5J
	n2WoJ21d7UrN0pLWodt9FZ+t7G1i+L0S+xyCKlWUspAkXPMKdHEvg/R/1q+vucvUh0LtSuzkS3r
	dNOfycBqa9KkPDcz+umbcr1++7wRCJuSdFsFquaPc+OTde+VM3OJvl1fslXBlUKw7aTxkKcXfNV
	Mynb+uYtrxhvdvl8a/EoBrZ2s4JKWgt3Oz+V2iLfu1SvLFvDdjwDJUCe5KzMWEWOqqQVdX5ccPq
	yetObmL6I/m/2JpRohywgqei1P2AxeNK8JONor/sB/LYGTfPeD454tgYfRkmTga/odOPRbmJx8a
	X+Qg==
X-Received: by 2002:a17:902:db09:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ee0dcc3039mr136039595ad.48.1794911794627;
        Tue, 17 Nov 2026 02:36:34 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:34 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:19 +0900
Subject: [PATCH net-next v3 1/3] rust: net: phy: drop unused read_mmd,
 write_mmd and match_phy_device
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-1-4e183a7366a7@gmail.com>
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

No Rust PHY driver implements read_mmd, write_mmd or match_phy_device,
and none has since they were added. They would also get a `Device` that
assumes `phy_device->lock` is held, but read_mmd and write_mmd run under
the MDIO bus lock, and match_phy_device runs without any PHY lock.

Drop them until there is a user.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/kernel/net/phy.rs | 83 --------------------------------------------------
 1 file changed, 83 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index c4e7b1d6c6f4..4604a9c0a511 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -403,58 +403,6 @@ impl<T: Driver> Adapter<T> {
         })
     }
 
-    /// # Safety
-    ///
-    /// `phydev` must be passed by the corresponding callback in `phy_driver`.
-    unsafe extern "C" fn match_phy_device_callback(
-        phydev: *mut bindings::phy_device,
-        _phydrv: *const bindings::phy_driver,
-    ) -> c_int {
-        // SAFETY: This callback is called only in contexts
-        // where we hold `phy_device->lock`, so the accessors on
-        // `Device` are okay to call.
-        let dev = unsafe { Device::from_raw(phydev) };
-        T::match_phy_device(dev).into()
-    }
-
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
@@ -511,11 +459,6 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
         } else {
             None
         },
-        match_phy_device: if T::HAS_MATCH_PHY_DEVICE {
-            Some(Adapter::<T>::match_phy_device_callback)
-        } else {
-            None
-        },
         suspend: if T::HAS_SUSPEND {
             Some(Adapter::<T>::suspend_callback)
         } else {
@@ -536,16 +479,6 @@ pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
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
@@ -588,12 +521,6 @@ fn get_features(_dev: &mut Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
-    /// Returns true if this is a suitable driver for the given phydev.
-    /// If not implemented, matching is based on [`Driver::PHY_DEVICE_ID`].
-    fn match_phy_device(_dev: &Device) -> bool {
-        false
-    }
-
     /// Configures the advertisement and resets auto-negotiation
     /// if auto-negotiation is enabled.
     fn config_aneg(_dev: &mut Device) -> Result {
@@ -615,16 +542,6 @@ fn resume(_dev: &mut Device) -> Result {
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

