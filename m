Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0CF3A7F58
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951771; cv=none; b=RUyIddA87X5AnOQGdT+swWdu2FEnIBGnvvyDFZu1YfXi4Y8n12ab/oXcZBL3nfSJRg784ZW3pMoopE1Q7bCwgavvSBkq0On3dlvxsofXdB9muSITX/9PQcYFusLpl3wBagiMuapZ6c/vK+Gg2wC1ebTBR9Sr+iQ+5FO/Cp81O9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951771; c=relaxed/simple;
	bh=N68rztWaSPFT7EWLTVeEBYTiTamnBZR2Ck1uIkEXnO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THHbLxBoWox6/CsF1T2y83UmHI++/yrVSjYJdop3lY/rbzEAV3nyhEb+34cw2X70jDhiDcnk+i/Ym4MvH3GT7g9tKtpDikgBI6y4Md57bCcg7BWoQwg00fwpzg/khjg1C5sEKDRC5XHVkE7DXyb2KLyw2fJUVhsrpq3eSwYtL5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+DBacZZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+DBacZZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65f71ed7c6cso1054455a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 08:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771951769; x=1772556569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4JY4FtMQMrcvknA0R7jnHnULTW5UTmi+8FwqfvcNko=;
        b=I+DBacZZ659GtZSjo2xTWDrwOTf1zgFxvaQ6ubfHzKAM/VSbfn6MoCfIntTfFznzdA
         lTy0bS4i+lripc7iq4gXX8+gDf1g5lufp1UUTgEmdxHn5XJ9OgkwEtAxHqWSHXCEGZkK
         RqmPWuk95auLnFKUIb3b8MH5c6Wdk+du5u3pLkkh1RKrRh776bJP+vPcF60xKpmvUl4+
         EFDQPk49ciz07tVChVDznzGH7XlK7VTT9hPqP/xzxVsc9srYEjcExEX1NpLwff0VkR9O
         XhKLxt0Xei0DJnls32zxOw+/ts7/KdJNTFB/7V98kQRYRU0z7XNmltZWll7WSgoICZ49
         f0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951769; x=1772556569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4JY4FtMQMrcvknA0R7jnHnULTW5UTmi+8FwqfvcNko=;
        b=D+Hg0rLilhfYpSr1q4C50+z6Q3kA3S2egNDj+dT3WcUG6/Q4sNmv0/xg1thzt1Rc3/
         IXVuaR5oLSX8A/D0cD4py5w3JyXRKI3iHy3hFLz4+MQ5sL80lJT8o8d5jmFo23ldHwoa
         636qBkckt3oHP71FoliYBk2zEXQdY2szDN/FoMVJcVS89C0lzFEUgrccEfkpt+qREN+X
         fhdwXVjAEb7XHmata7o+Y6pruCVuhvJicEObamewsYDI2V++G0bTMponF0TuD2e38Hk7
         H++3cNNEELKolH/u9VZNfVKc6YXtOtJ0Xsh+fue2PVMZiQVM+kdiY5mFUEXl+NgBYUMv
         hibQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFSdzxgFx05V9JqFhvgY/42ZCWt1wdDsG48hqmGXkT5YNUwiTOmysg8BGohP6szmbl6OkxZOGh4YSNMCJheg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbkx1m4KkC3ji5Yr/8HL0wwr5sUElnkpIorLvdfl5tvUWW9HqL
	tt+Bx+SnzdcdkB8WPnsBH2BLEkQNkQJpXhJw3CNs+fmtc4obc20A4llF
X-Gm-Gg: ATEYQzwlumm1Nc0TiGF2nDlMms5cdhfvTd/uzyIESG+vy7BSQ7q9S0NFMXdyjY/bnqZ
	6WCDgOrIJTgCwmeDnut71N6DFtQem1sKWg0sc4fYHMeB+bakcd6TGmvGwE7lXFHE4iOVJVXyJg9
	eZP0GgCHmRFcQa+MOYpuXPDc/GztLROkhw5nxtEMXVQQsTkT2d+Y0O/IuCmCc7MgqI2BpuQnDrf
	8rpdlWVO9oUrgLAyuPRXTy34IulPiMwNla6FVCo48BCm+JdasR07eZ6lSl3PzC8yIQpu2bj748o
	gWs3qsyXI9hK/M/K9uQZqZvWLsdkP+pZc6UZ9Rjm3i4YjvcTzlfPyK7vlLNHCShyeF4SwNKTMX9
	GyOew6nrETJBLNj++AQag0TbrLMxH5CkL2CXbLoEdW6faTe243X41vtWMF0ZRrOu3mBUfTtHypE
	INBePFYql6XiLFfuPWj0Nd/5hoomehA43yblfq1ufxkNsiZTmSGDN1kacaVnqWgD5d69I/OzWnd
	tnyMbTBJWLsUuaXGXBNci6MTddzcqDavVH6Kdu2xBG1wkexASOr5wxeCwNhZk1pD9tt
X-Received: by 2002:a05:6402:24da:b0:65b:fa9f:fce4 with SMTP id 4fb4d7f45d1cf-65ea4f1d6demr5539931a12.27.1771951768246;
        Tue, 24 Feb 2026 08:49:28 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (30.49.91.34.bc.googleusercontent.com. [34.91.49.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a077asm3771023a12.4.2026.02.24.08.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:49:27 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH net-next v3 1/2] rust: net: phy: add speed() getter to Device
Date: Tue, 24 Feb 2026 16:49:25 +0000
Message-ID: <20260224164926.1760-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224164926.1760-1-iprintercanon@gmail.com>
References: <20260224043211.1747-1-iprintercanon@gmail.com>
 <20260224164926.1760-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a speed() getter to phy::Device that reads the current link speed
from the phy_device struct. This is needed by PHY drivers that must
detect speed changes in their read_status callback.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 3ca99db5cccf..3812f8fd3e49 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -158,6 +158,14 @@ pub fn is_autoneg_completed(&self) -> bool {
         bit_field.get(15, 1) == AUTONEG_COMPLETED
     }
 
+    /// Gets the current link speed.
+    pub fn speed(&self) -> i32 {
+        let phydev = self.0.get();
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        unsafe { (*phydev).speed }
+    }
+
     /// Sets the speed of the PHY.
     pub fn set_speed(&mut self, speed: u32) {
         let phydev = self.0.get();
-- 
2.43.0

