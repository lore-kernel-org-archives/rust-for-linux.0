Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911809;
	b=DYmuztJOFBwUGL0L+XxGtAvBy3MGKiMjmCL/dGW9yIlHcnoCzjQ44avMxZ9Pt5mXRfoX
	 vRGOP/AzeFUb3kjEiFSLK7QTLJ5yRVrF0lVut08fBrLFoDpU9C9+zt/tmB/YLrgdurxRj
	 shDdF8nOLEw22Fa9+GGe5OGNXUM558pKhXMfZ0VI1WOZ3Li/BvNkHqbNZ2CryNouo93NU
	 jxIf2ZhpZIHqzf/XKzRGKq0WAJQnr2IZRNiPDTyFaTsQnrFHHU4HCGObpjSsFl7aqOGO7
	 qCyn4nd4qQBZ9c3AI32nULuJp3E/qyn3lohriNNZ3equdVRiWzOLjO8q4jj6HX5u3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
	b=Ea7Lef1KQOaSFuUe2XOSPKFrMvNWhcgcUTQk0R0g7R8GJ+hVdTd1AUt/GFDwQ+tHAlO2
	 bnuCnrXfgd3YyTJjWznsOFRN5HLnwrDkijRJmcdf+qBXeINbyYnHaxAXA6giVVYfsI7Bm
	 FTCbz7DyxFDJPEE6qCTb9Mc5evhrsF5EdULVRb+fEok0Dd7YvW3yHO72GT1dlm7fW8n6e
	 dv7u7hUrXLFWHj+jz/8b1k6Jwpe2RFcVP5b/a35XpYGtGXH0Kt46uyMCI3nm3DJyeysQl
	 a4Mt1EtT5r1ElW+tNTwzUSai67YLZ1PcLlRBz1jjBIqNhWRnjbwmOmD/bJ1G91ytD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZAEowsV;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C5606A8A4
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 10:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843C5606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZAEowsV
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2427254a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 02:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911807; x=1795516607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
        b=MZAEowsV2cBeyc8Basz0ndJNuq+fSouAbd4BWxc1P2a6tBAdKC+/WD398AcSntUbCN
         oYah99mX5iPPo2+ewqIVO14ewutqJNlxJAbYoPqfa/SbQguZ0oE1W056QRiz/3nzNT0N
         8ttxUNldHTsX7Gdpsk8StnGAY1bHACwxQmfcRQhQTU8UVizyYWC6Hl+J9RUgO49E5Oqw
         XhVW1q6Xh7qj1/SVGANUWY24hiJfdDymL1hmCjK1tL34QW06J6pqIqNntCYyPYQQet59
         Z0xh8eE4DniVFereFmFly6t+PYWS6Mlo6YGrrWE5dDdwH9bdb2qi63dA7ockSpUwtjgg
         Lu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911807; x=1795516607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FioHEqNJVDi9xtkOHwajsyHvSlfk5pWhTzk2dE+ScPU=;
        b=ONda6tn/1fCz1JQDFpLdvOhJpcyKhKNjnhD9dB8lhVvuNxwcfOcBKCWSkV9Oc1hg/W
         eUr0R2vWjwrOLszS+x+NAWEHG7DrgXgRq9HlfY3oEzO+X6Sdfi6ilXnraYTsOEwsWubQ
         A+qtMR8xiNBqMiSD9i3QqeOb4SFHxEMxidLUvP/UC3lZesX3VJOQPMYSAMtDuLnZtTFY
         F6EvCFnSTA1RUXu7FFH7HRTm0JguGqkxYFf9lE6VyeNuYIK7GK5iG3wG1yqZPXHkt8Jm
         USGJ5h/P10m9AGg/DGYj4SdNnmUz/SX6drsqU2R3Z6e3LFC8SOuqDbk+12VVmiRD1nTG
         VwoA==
X-Forwarded-Encrypted: i=1; AL+hErGDWQEkn5138GMP92zyHNXcho+2fFUuAOKmmy8RaKZ6nTGciKbnQX51MU4gNP3JGDo7USuPqY9VwmejOo9hPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+s+bEkdXAUF0V7yDS00vBI8pJRT+0e2Jhg7TNHOaB5LrXMIuDH
	faAmqrWiBO1iHgd9gqI8x1NRNl89oPmXw4N5Bl6up2M/YuqTbmyRR6V0
X-Gm-Gg: AZFdTZeUW4r7GtvnvD6c/UchXQxz01boQS5NZPOKnNOV7NTsAbL3yP+U4tRN4bBsi5V
	0OQmeE/J/oYx9PWtX202qWjhJtrgV7Rr8SKHh3gceIfOrbYsPqF1wsbrFkZkzeCJ2NZieZ/mTBR
	RfZNH8umUTGHz/7RBsk8KwwfOmYa80GwOeI/ZkZ4hJXausWT3KuB0h/qONyy8tIgPvfqJDYKcsX
	+oEVwdqF78aUlj2jtk5KYAechSf21f5OYswEuJbm01QiW/4nsExbUKSVDcKzfRxZ/eJF4K2+alY
	sw2HMIkKI9GHtm8VeUk6tIaqrHrf3bdPM+lHFR/oqWuZ0aXE/9N7hUxWyYMR+XZG1E0dLHAgGxi
	NYWedmmoPdTyQkM4TkgfY9ecAEpR+GY6N7KZGd/amoU+rDxiHwznnaaLE9PxYILkrEXlr59jXoW
	Mqgk7+aFcAT5hC0PMWE9LC1bhzTySh5DHHOL8yuMQyUW0w+jrxGm4HRDFFywOCfBx9qJjwcqKGx
	givpKf5G39mvWMsA+1Gq+ly1KpQWNOYFpPVXoZAjcdjk7lCXuTlMTDYa8YYCSm9kSD/xcENgK+q
	CjM6WQt9QsjPAomrusXwBkj9V8mh4S/8TRUrrEVDFKJwt5jsgmcbbngcITKu2mMsCafKlJF03UN
	knl8PofSkDHZ6nenDwSRZ0v1LU9TTxIexML9InsYcGQYaizzEV6MqnDiY
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12706368a91.18.1794911806841;
        Tue, 17 Nov 2026 02:36:46 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm13094805ad.4.2026.11.17.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:46 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Tue, 17 Nov 2026 19:36:21 +0900
Subject: [PATCH net-next v3 3/3] rust: net: phy: pass a MaybeLocked device
 to suspend
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
Message-Id: <20261117-exp-phy-rs-maybelocked-v3-3-4e183a7366a7@gmail.com>
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

phy_suspend() calls `suspend` without `phy_device->lock`, also right
after the state machine drops it, so another path may hold the lock
meanwhile. Yet the callback gets a `Locked` device, and can call methods
such as set_speed() that rely on the lock.

Pass a `&mut Device<MaybeLocked>` and correct the SAFETY comment. Update
ax88796b_rust, the only user; it only calls genphy_suspend().

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs | 4 ++--
 rust/kernel/net/phy.rs           | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..498704f1ef9d 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -77,7 +77,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         Ok(0)
     }
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         dev.genphy_suspend()
     }
 
@@ -107,7 +107,7 @@ impl Driver for PhyAX88772C {
     const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
         dev.genphy_suspend()
     }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8cbb4c19dac1..4b7b3ad09059 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -395,10 +395,9 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw(phydev) };
+            // SAFETY: `phy_suspend()` does not take `phy_device->lock`, and `phy_state_machine()`
+            // calls it right after dropping the lock. This is the `MaybeLocked` context.
+            let dev = unsafe { Device::<MaybeLocked>::from_raw(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -572,7 +571,7 @@ fn read_status(_dev: &mut Device) -> Result<u16> {
     }
 
     /// Suspends the hardware, saving state if needed.
-    fn suspend(_dev: &mut Device) -> Result {
+    fn suspend(_dev: &mut Device<MaybeLocked>) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

