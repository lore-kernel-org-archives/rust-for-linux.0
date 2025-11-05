Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CDAA41
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349517; cv=none; b=potRVEEBJxNArkL2dN0dirYWTHyD4g0Zeh3hI4fvYxgIbITSkoYRGkG7NhAfT9HxJAVD6+rh9D9Ird6bcgYoooyCnMrNVpJVhGjHqqynqco1pudJ00plpLVFrwems5XqRFjJAUxrJJHkjntcOquKKt6Y/q7Osl/YyswHrUThJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349517; c=relaxed/simple;
	bh=MP3cL1oYebmC+ikDcuXun/rbIUAB+b6coo4qpDEgtAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p4Otkbf8+2hnAN88Paq4LNIPPtwWE9F+kMT9RJDTgGrTtQygXUuMOvYDyjQhBMg1PMVvqSkOhfdIYQBUxOQTYDdX1J1Je9LWUxfjEpScJ24lc5F82sQ3ORCRzB9Hpg2ZA4MtkWjhGU4B0hO3UAsnPNi7uk+4mRe0MslcRyRIN9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKOzkVFR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKOzkVFR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso3199177b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 05:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349515; x=1762954315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9q7NmFAvFvN7/b+XYPKzCuzMXs5E1SZ+dhFSeIfp7eA=;
        b=ZKOzkVFRQferQLJYfz8FK7HIiOFsLQT+TiB/ghnk2mkOtNzSqpBUyHvXqQ10cajnWS
         qJ2JnlbTV/4cG/yZaUxP0cfU6i7rxg8M+V6cYUL4R1w4GlH2d3XjD7XndNAUm8poJx2f
         2Rgg6qM4JHgNggQfAf1s6n5tpdK6amjrJhNjvsxlXtCF42hMTN/nDRpxyNwD3+iFOI8Y
         lyHOUt0md0KHUuSpwNp39fG4SDS6BpOAHUhyfOhn46dNJ5ZLvOmSLdHIYjkX+ef2jgN9
         lfkRHOgOEh+Qj1I2AQVz/N5vQw0tjUSF/MUdLEcBOiSaiI+eWYAvAZj/nWzq97Mz1qUV
         qZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349515; x=1762954315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9q7NmFAvFvN7/b+XYPKzCuzMXs5E1SZ+dhFSeIfp7eA=;
        b=bbl46gB38V25QOSvZ8x3G2iLt+7FR185jfkTxGgurpSq6+eYwwoZim0e1moxsdVGiy
         OYUCd62QQmooaIGNcUO82WamTQEwtkJAwkuspW70GE1+AiCN7h2qZzG9Co5bc8bVl41K
         WceQ3mCEMKasZSNWrVa3+6I8B7ybgoyak6E/3NU+azr2MCLHfCFJv0bQIszmC+/Zhu6y
         NHTaiqYjIxeI///dVODKdxm0YacqrhvsicWuW6Ofw4mfgBOA1mrjfg9O4xdcYBju4kS1
         +Edjimpt59RWwef83LMFsrBqewasGO2j+VTNCQF+jNUGHNa0xnOuKlwnhZGVWFQpik+E
         N1tw==
X-Forwarded-Encrypted: i=1; AJvYcCWIhHzuSthHSrpQPllIjN+7B2245WWKE/i2u2qWE9znut4sIew1jys5A6BaCUhMSkSi/SqF1JnPDX4/BFMj/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxewFe7+xpmagVirIbMZAaXc6JezsaKQthsyJpDfik26XlJmgNp
	ktfT7F5MMi+XaPpxZLTmh+5vBwm5eWIja7poVOBs+JU+ra588Ulf0SbG
X-Gm-Gg: ASbGnctpXZ1A78uqSy/gteRODD7TMIMG55YJaT7a2Q0PDeiSdKvIT7qKGNQlX/O23GE
	5Dh5oaCDWi3cTRUwKJ4ogEZTMsKUT7iYgOaEH7z2xW0mgIOXjEOOJXQnCxvlvImStsCUI7EYh7N
	z2zsDmOtfdU/+9iNUUEeErASHIuji+ebtO7D8+bl3t7vROpy5BxwXooGaXQKZBBBw+b3BXYcdAV
	Lp+yPb9i0sUYz2SZvFVKsHcg80RXdEB4BRV8MNt1bUs4Isifv0b4dyPPIs9ivlXvqQUp4FyWcyu
	8+LXP768R4uaTM1jWmXWj4M1A4ve5g3JEY71B21lvqjaMFqfwerLJ8JY5ymGGhiiHS+26Zn5hbY
	F4HlZjsNyVgi/Lrc7i66AeueDJp5Zhe+jStQ2Uypo90DGdjGyqQqoFDm+EuOdI+1QIhSp8/Pfxw
	27nByC5ZXE3Z9Gx+hqOIVzS+1g8O5FtTL3bOndW/fyE57JXj2S
X-Google-Smtp-Source: AGHT+IEOr6yEZt6Lg0Vg3/B7D14110LC9/cBO37o4H78DD0sx6yTnN4rQct43XksS1O46eS9oX2C9w==
X-Received: by 2002:a05:6a00:2e91:b0:7ad:de47:f685 with SMTP id d2e1a72fcca58-7ae1e6c6a14mr4949434b3a.17.1762349515131;
        Wed, 05 Nov 2025 05:31:55 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd382ad96sm6419447b3a.22.2025.11.05.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 05:31:54 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH net-next v1] net: phy: qt2025: Wait until PHY becomes ready
Date: Wed,  5 Nov 2025 22:31:26 +0900
Message-ID: <20251105133126.3221948-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wait until a PHY becomes ready in the probe callback by
using read_poll_timeout function.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---

drivers/net/phy/qt2025.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 0b9400dcb4c1..aaaead6512a0 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -12,6 +12,7 @@
 use kernel::c_str;
 use kernel::error::code;
 use kernel::firmware::Firmware;
+use kernel::io::poll::read_poll_timeout;
 use kernel::net::phy::{
     self,
     reg::{Mmd, C45},
@@ -19,6 +20,7 @@
 };
 use kernel::prelude::*;
 use kernel::sizes::{SZ_16K, SZ_8K};
+use kernel::time::Delta;
 
 kernel::module_phy_driver! {
     drivers: [PhyQT2025],
@@ -93,7 +95,13 @@ fn probe(dev: &mut phy::Device) -> Result<()> {
         // The micro-controller will start running from SRAM.
         dev.write(C45::new(Mmd::PCS, 0xe854), 0x0040)?;
 
-        // TODO: sleep here until the hw becomes ready.
+        read_poll_timeout(
+            || dev.read(C45::new(Mmd::PCS, 0xd7fd)),
+            |val| *val != 0x00 && *val != 0x10,
+            Delta::from_millis(50),
+            Delta::from_secs(3),
+        )?;
+
         Ok(())
     }
 

base-commit: 89aec171d9d1ab168e43fcf9754b82e4c0aef9b9
-- 
2.43.0

