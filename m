Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702142;
	b=WmYt4O/wIHXSM28FExPmMXeKubPdFAjbdKXYEsPQvaNoOVErPO9oZgqKLK6eK1x3zPs+
	 UOhre2Dm9rXCOeOfh7G70VTtZZVDB8UXWA+ZVU6JtU23x3UCk5lQVVAMOHnpmwGEUlHJs
	 5ZIjDSVVgdxH6J1C5qwyP1B2zCoT0JBJAf0n/lCMn5gQBGzTmKkDJFFVkoqQgkH4b4l5e
	 76mmn/kWYm+f8wrH6WnigbjGEAGyD8netnVPMGeUig0wzTWaBCFY/pRyz1Ozvzs0X+4cH
	 P4K7R6tCSKtxlklsaAZlPsACV3vOBQ9l2ZABqeHQz+eTUwCshJgRRFGZtydYu5SdjXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
	b=DrcYWhCUmLWNYw8VpgkxFfSuxRA0cLahsQhIOZy/6CXdJDyvjBqt+gkrUt4V2Lzm27ga
	 teSn9sY1u4NE32g6ddTYrvfoQxAGAXCquiDe8BVx3FdRuQKEzcqBDe03OlwTohxmPva8P
	 M99ZH1MfesR7bL+U1slBFn/47+xeDrxXz0n4w8MOfcoSyIx8P9wIf6XOr33SAOwrn8RdL
	 Oa9+X/RDE/7VAEO79NGEaaR7M0fqHc7WEfGnJQPwprqUmhtUDcmriTbsnXZbuEA8ebm10
	 ISccSSWOA5HJ6zEkpv0ZIIqxnnl47qvIk4w//rqvjJoOUUK+kq9NK4e9ftN4AD7eHuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxII5QHD;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A4606A32C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 14:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58A4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxII5QHD
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso4907533a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702141; x=1796306941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
        b=TxII5QHDK0stzogCWbY6gZRZufXl35OTuDpxw8Ei5/BTICnIyJeVN2pNrofOI0JQ/d
         eXojWIsRKkk+MIoB/gnbwAXUKmFwjLdAZH2IslSvzLOorzJwc3nx2BkxBL9RJgg24SkU
         6pk7zNog4reBcKWBEIhJO2VZmd4kcRb/K+X53r2VDfdtsapON3zyscxse62lpH7G5aLl
         wfcGZg0wbhIXLZ83UA2RRwaZ5cOhbPA4tYQ7/1r9cC7mV5lC6EqAXcqzLgFCHn1RQZ26
         POFN3Y84efXf95FDl8F48Ptlw28oy7XwowN/qgsG5fvGkU4dHco/ScRs6z9ZpQMfTmqP
         BEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702141; x=1796306941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
        b=2Yva+qtnd0NL+jMQlTLF7gCuWtg0r9G61fhDmxSQdQHNGev+Q2KkmQX67g3jmxodv9
         Lf41fKgZbCARfEjuObUXxnT2Jo/VsRjtmWf6QGjAvAjLKRu/pwK41A/Kgo0XZassyvf9
         sgt2xmQxfzxjCB5OsXa2EIAGEWhwRvzw3P7YRuOv5v+0nq4/rIqa7HyNN3LzRX91e9tU
         uo3uZraM1ktrWWyuH+98KSi3JRuFVGTygQOb1WHJBnyuloq1onPtjlntooedHgfOl8Yp
         8wUJDk4ZBhg5AUeAAy0aP8Xz3t7SDlb41m2SKnCaQQdxsj5wyR2ne9LNXNsY1sTuwUKX
         fm/Q==
X-Forwarded-Encrypted: i=1; AL+hErHN6nrFgd4PRtvwWrtLnfxYuPtrsDVWliSETGtf48exovBcUuaIQS6P9f2+bTy6TgN/p/hQoFGQ5v38scDVjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jB0oXtZYG4ciWqga6gbEucNnQthqPsce0KwkO+ang2jrRodeC
	QNcJlaTn11dY+3VwExQw4uydcGtZ5qcIw33lUUlnS3UZQbCRr1Vtj0RP
X-Gm-Gg: AZFdTZdzoJFftZ7wH8d3UOYeThxVPRornhwE5PcgK4+7yQZ9lPgnjIf4CBlXal9poUm
	9XHVYRUm5ALurbu6wTNwvCTsfcu0R63UyFIBC46jCUBmLWMSrdI+LzvBqAyRBClmpaN3rFC/qkc
	O5Lx6P2iOR3SLe1pHNDPqU02MSmbGh/j8iuEuUNvOgOoRF4xCKnBTSHJIabSIlRdMoUpvTpHKfT
	PseNwFT3yfw/dM7pSCCH9cM5fM8wuivmGp2n2d7il3Nq0z5xmnYKFG23QA1Sc1VOs3vo2XneqaJ
	3Y5fGJPoUjkrq9bgIVpMwTA4ibfcioL0rTi3HQYm46nLjACoH/0cKR5fASUiy9r9UrC9hWJ6AT2
	dROYQnSM3HwgvHlQS8iTgxGi1Y9DWz+hfujOhwh1kj0vJcP4wL5iULAvJ0nBGIKpZbRkmyhSy9a
	aMD3csQ5hP0fTGfy2CD3zDdUjt3q2U914EHUR/u4EssSNtDMeJYcjUWUiYHcdXqN9jOP58cKIE2
	DA6vVPQ3DrD+O6aQIlFNJxhgWisk7GGtxkv76eObKvPmpqNeyv4q+ehx5qmya2zCVtSPLb8ICwN
	QF1J/k8UX78BuwSb3HBrtGM2t8qi10Rz5hHivnFGFDP6U2q9xSSDEyCNDyRVxRdzecP/NCH2RPO
	kC8VhzKvJsdTJqwdcJA5dSoxh3zSfs83xCZc2D5KmsQ2TTirNactzWOmo
X-Received: by 2002:a17:90b:4a92:b0:3b3:fd13:683a with SMTP id 98e67ed59e1d1-3b41c995b82mr20643205a91.59.1795702140978;
        Thu, 26 Nov 2026 06:09:00 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12583573a91.3.2026.11.26.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:09:00 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Thu, 26 Nov 2026 23:08:33 +0900
Subject: [PATCH net-next v4 2/2] rust: net: phy: pass &Device to suspend,
 read_mmd and write_mmd
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
Message-Id: <20261126-exp-phy-rs-maybelocked-v4-2-16f9a10bb579@gmail.com>
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

phy_suspend() calls `suspend` without `phy_device->lock`, also right
after the state machine drops it, and __phy_read_mmd() and
__phy_write_mmd() call `read_mmd` and `write_mmd` with the MDIO bus lock
held but not necessarily `phy_device->lock`. Yet these callbacks get a
`&mut Device` and can call methods such as set_speed() that rely on the
lock.

Pass a `&Device` instead, and document that read() and write() deadlock
in `read_mmd` and `write_mmd`. Update ax88796b_rust, the only user of
`suspend`; it only calls genphy_suspend().

Suggested-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs |  4 ++--
 rust/kernel/net/phy.rs           | 36 +++++++++++++++++++++---------------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..890ae79d8561 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -77,7 +77,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         Ok(0)
     }
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &phy::Device) -> Result {
         dev.genphy_suspend()
     }
 
@@ -107,7 +107,7 @@ impl Driver for PhyAX88772C {
     const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &phy::Device) -> Result {
         dev.genphy_suspend()
     }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index bb2cc6b3c94c..d04a651ae62b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -371,10 +371,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. `phy_suspend()` does not
+            // take `phy_device->lock`, and `phy_state_machine()` calls it right after dropping the
+            // lock, so this gets a `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -439,10 +439,10 @@ impl<T: Driver> Adapter<T> {
         regnum: u16,
     ) -> i32 {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. PHYLIB calls this with
+            // the MDIO bus lock held but not necessarily `phy_device->lock`, so this gets a
+            // `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             // CAST: the C side verifies devnum < 32.
             let ret = T::read_mmd(dev, devnum as u8, regnum)?;
             Ok(ret.into())
@@ -459,10 +459,10 @@ impl<T: Driver> Adapter<T> {
         val: u16,
     ) -> i32 {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. PHYLIB calls this with
+            // the MDIO bus lock held but not necessarily `phy_device->lock`, so this gets a
+            // `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             T::write_mmd(dev, devnum as u8, regnum, val)?;
             Ok(0)
         })
@@ -617,7 +617,7 @@ fn read_status(_dev: &mut Device) -> Result<u16> {
     }
 
     /// Suspends the hardware, saving state if needed.
-    fn suspend(_dev: &mut Device) -> Result {
+    fn suspend(_dev: &Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -627,12 +627,18 @@ fn resume(_dev: &mut Device) -> Result {
     }
 
     /// Overrides the default MMD read function for reading a MMD register.
-    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
+    ///
+    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
+    /// [`Device::write`] here deadlocks.
+    fn read_mmd(_dev: &Device, _devnum: u8, _regnum: u16) -> Result<u16> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
     /// Overrides the default MMD write function for writing a MMD register.
-    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
+    ///
+    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
+    /// [`Device::write`] here deadlocks.
+    fn write_mmd(_dev: &Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

