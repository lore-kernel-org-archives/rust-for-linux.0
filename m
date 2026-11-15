Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725282;
	b=295vjYIkhCloL2AdIFN+465USmfUMRbXmtdPURwaZsu2lUIhkD9Cxz5+hww1t7U0wRG9
	 FmDa0aJeiwMlIPFCfNmfXRdEAd/B2AuVAoaACGHw59RYzDvm6aOGhvpqRUCg10Y1BO07Y
	 HsKKERWQ7seTzDI2B+WMHkz+bRo1jlHo09HNfudFvqSW1nR5cjkU60ZF1+6WgAfL+Bczj
	 pk9WCdEJtf3wGa1rSsaEwE59cz4QVl3pX47Y7MNv9qlB+G3Bpq80iteFT/LaMFhPcdty1
	 +52OKaBQRoudSCTUwn6HaRvsiNSFk6oa6+chdLmLLQ+IzYQ4DFhS1YgQcKybu3b1kfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
	b=q1wc9eCVk8oD4qkIV8PTT3BJbcKzRtilooQyNx6yn2mkKwUUPUyk0jwPssYQXKCIGir+
	 BhLxh6gEpLHG1pr88tPu/PlIdYay+TXHPgE2PsWsghi2Nuq3G31ESI2OMW+WPZ4zgItod
	 ndqAry5jXsQ0nckCNFjeW6JtG/wGDIAaqwZb8m2gc0WRp6RwQIwaFdR1x9cIAi3HVLHQr
	 V5/pg3F+48YaDf+1GvyWaW9ySTiqzFST/WO86dXDlMmqJ8kkrOuz74Y2/RbVOLiZO0Ta5
	 U1g3EnnIZcDOy5qMWR1asKv/W/DwglquYQuX961kNomOhyyDOgz1xVAAq7QDsrpjIWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3GWvUEM;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF2606A32C
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Nov 2026 06:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BF2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3GWvUEM
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1328801a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 22:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725281; x=1795330081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=B3GWvUEMoHdmiTkYjZmsLjMMR19mRPYxAeCW8d7JxN51JEh4ylSSFq5sOIsnjlI03l
         H4q3ff5MpjrWWGAvc4KDXmsZchRylu75+EZ5vUnexjuXm45OuG0eXe55ymUzmrUKMNfd
         kL5fUAlyDP62rMCFg7JuZcKWC6ru5T2G3TKIEa498hiCE9JPN36nmPgSkOWpFF7Puovz
         O+1bHxr5W+ymyR/BfRLraz+Qvzm14L/3mO9zYWfX2px8gllNtszznoGVB7UDs+spKXGu
         halR+HiKpE5QBwpMBXyCELw6TPde/hOlCp6N5c+0oU9un65Zg4TthGNArwNxmM5984/M
         bALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725281; x=1795330081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aCyDVugFTgDmxcEvIKcJWse+PFQb7Di/86YRfNsvCI=;
        b=WJQxAKOomeVfb2R/FiibuWFyY8B20A9x4m4iU8U+CSSOA+5ymSrxHZgfcH+I/QY7Kl
         p5bodi43oG4pFB+UU7S8wsrfjgF9xjiSK/fFYqwcNYqZXAIsjVFEeqpwKlAMLNdIvanG
         9eV6a0BgtbupMHiN8TOUsTReJuJY2fDoHUdgfEv3SW7eF9z0PNvtQ8R/q6lh17uL07EQ
         DKp85BeyyjTWtAgtmfN/tsfBOYwgahVs5tWX4h/WiGHWJXKYySS4c1Arqi/o+E2yp46i
         xjiu15qn+Dh9nR0z4ZBEzxiWJg3wzSAOuHsmWqtms4XQCvYQ3wsutNdGlov3il3JvkUi
         IGdw==
X-Forwarded-Encrypted: i=1; AL+hErFHTmdQAiwa2N3vHsp/TXG6Qr5GuzSTnzPpn/s+5imPiFEVmwbMxLZebfT9CzSq8PCnqs1Mfp459JCdrgqcTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9sRHbKeDDsLPb9XLNWWxwKHYcHUyUiC2SI0sMvR+foAZgsIyCX
	RjeHRWUupfOgd8oGt0gqD9K1uxPQPA3jzC8HftONC5dER10vAiOnx8Tn
X-Gm-Gg: AYBFou0riJr9qHo75Y//lFYPjUfCyo3sjwC+/+kaUCnfwj72oWJAB+wBQgP+ONaAXBS
	jRzAEDEDg/ZnhIGAiyht9pTcv/q+XdB+MhwgIUglEFFxtiEBgwxxpKyjfE+GrwKj9s6KQUSf+kI
	NjOuWC6Gwcm13nkjaUsmye0eGLW92WJ+qRYlni8i82GnRNuiy3nSAEOjwoPjNjAJOyDrklFLX7D
	SUL1tbSk3WX2PHLEi/Z0SvwPLt+tmOMe4NSeETZT1Jsb0+/Lj41DocdFt8Ze5+P+q93DfgDaCUr
	DaGARXEh91VvuPzRriABUtc4yUNoLssYx4M5eUlVGbOb4Yffdz8xNSFgirX/LHkY5pEjoPK6FJn
	rUv1Xdxk70EHRKdBSBqoq1uJw0yv/o7N8UlEgbWp+jyl76+Qmg8DeFrChimnfa8jvDCdQ0aXOse
	Fa8A7yQoTQKQyKiUkbKymUaw5LUcPAAYPWCYdDXYyjh2LGy0bfAJDs3x+MDXgpdHrBYJ0KDZaSe
	7/QnEmAehe71LSw70Tycqj9norm/Fyfid9SAjWrGCZ4JzesRDRfJuxuEy+atjxsyF+dHPMHgzFb
	NAi9kZLw/wNb5q590DB1UKWlUhG1vB2N4GIGAV+N9X0O75BdTioeAGAQLAcvVLOhdwY8dZj/GVr
	bMNgdzVBSJr/3o1giAgpauor5lJ6HpkRmMq7FuAzjWa0YVFHLeo8psN9x
X-Received: by 2002:a17:90b:2783:b0:3b0:af68:77a with SMTP id 98e67ed59e1d1-3b1b07ef475mr6799366a91.6.1794725280970;
        Sat, 14 Nov 2026 22:48:00 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm16136309a91.13.2026.11.14.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:48:00 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sun, 15 Nov 2026 15:47:36 +0900
Subject: [PATCH RESEND net-next v2 1/3] rust: net: phy: drop read_mmd and
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
Message-Id: <20261115-exp-phy-rs-maybelocked-v2-1-8fa7897a0352@gmail.com>
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

