Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6BF2232B
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Jun 2024 23:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717370293; cv=none; b=p2nZJHQtWotsOU1gAOVgwCY9OZbXOWV2ZKshN7cdeJBIRND/qepyH2/NDyQ3ucOW0dMN05biQIU67jwthyl8d6XtBaYj/QRF9UPt8c+oQwn9T9UI4kmEnOX3wQaZvuWRNBmLa7BMeVGtbPiM21J480fAHIYRh82yRkzJdpIWkP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717370293; c=relaxed/simple;
	bh=Pi1oWJBKSWMf3r+V7YTvE2wooCrELr8dEKqfi7w3xts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B+NOwz1WtT5Ft3Y13p+gf7DC+YeIdS4i+akzLy/6qKGV1RAoZbx3+KLcO5DHtzLpq+Ltf8WW8LxYE9nKPluHYTHXcvyJeF3LDNXt5WrmTZeI6TtUhBU4iM10rEA/Oh5oc/1SJYZ6SSaSZVlpXxW0nZIO8xq58mrD7OIdTYRQqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W70PQ9jq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W70PQ9jq"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70255195be3so42332b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Jun 2024 16:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717370291; x=1717975091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/3B8mah44CNmSad5fpH6xBCXTLN+Fafp09uMz/S1l4=;
        b=W70PQ9jqz9UffzLzpp0JVOATi6uE8JAriFtJ76Doo2zipFsIWhfF2dCDU8qHN28mCI
         6wzScSCTyA4S/3Xv06bQo83BJ4gL3F6iaI25oVCEuKg1QMBPoVNxi7yWsWk8LDIzXCjc
         J25PeundRlxI+7oSnQUIEKlPLGA4PBLAZk4keUoOd5LZKj62TmKcCS4ZJcN7OC8D5X2Z
         ETDCwL2oAx+sFHpg3uBLVEYVYeY1rG5DiDZ9SdJOR3B88DcaLoZjhFutU+88xrW4+mCz
         TCxBj0P0EENq62OGHseyoyIgdLT2qh7dC0Nnt7wDTlV5Idw9jOR69/MP8K3hizxDjmwM
         xjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717370291; x=1717975091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/3B8mah44CNmSad5fpH6xBCXTLN+Fafp09uMz/S1l4=;
        b=X9pEqoCWdLMrj0pO6M+xX84Bq0b3xDnSp4px+Xyts13DbmK2+0nekorYNA/rKqZdu3
         8kf1U5MgSo55L/PI+j4nzMMVd7WkmQtB+rsuDmM3+bL+HH4IT/z9xdyhcmggpMSrZO4K
         ZN9FiaDIVqXoFLB7Z4CdgH+qIUI3Z5/13v5XlJvBQ60L13yCYWT8wmTZzFVROqWyBqB/
         LbhZnPQWoPL8Df+AllKoA37zmklcbeIT4ubENY6QWxbt5eTKfHQXL7+dAwTvttaktPny
         d71WkSJosJPDkPRIv8+LjjfnLDmBAKewf2Sp8S1/SizUD/Vb8sXmJwWn+2cqFtdjKvJq
         Urlw==
X-Gm-Message-State: AOJu0YwBgFRMt6PJAudf99OkAxWtuU+A99Kra04MTWn1qtX9B9U+SH3I
	i50s9RYClW0Yx6HGH/LrFYvN82CM0hqc/sDjZdVJxAuioUnTG6++AKKVtw==
X-Google-Smtp-Source: AGHT+IHVQTuoeJS8SCC6rmHpTXjo7LhZ7lImjeBODY/qDG2cTAiNWt9rtfLs/0c/svd7okr2KlO6xA==
X-Received: by 2002:a05:6a00:8a0e:b0:702:2c1d:c5e4 with SMTP id d2e1a72fcca58-702478c7466mr7782310b3a.3.1717370291165;
        Sun, 02 Jun 2024 16:18:11 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b300ddsm4416444b3a.191.2024.06.02.16.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 16:18:10 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	benno.lossin@proton.me,
	tmgross@umich.edu
Subject: [PATCH v3 2/2] rust: net::phy unified genphy_read_status function for C22 and C45 registers
Date: Mon,  3 Jun 2024 08:17:49 +0900
Message-Id: <20240602231749.57111-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240602231749.57111-1-fujita.tomonori@gmail.com>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add unified genphy_read_status function for C22 and C45
registers. Instead of having genphy_c22 and genphy_c45 methods, this
unifies genphy_read_status functions for C22 and C45.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/net/phy.rs     | 12 ++----------
 rust/kernel/net/phy/reg.rs | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 9b4c4d24b231..ff16d44c7bb0 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -249,16 +249,8 @@ pub fn genphy_suspend(&mut self) -> Result {
     }
 
     /// Checks the link status and updates current link state.
-    pub fn genphy_read_status(&mut self) -> Result<u16> {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
-        let ret = unsafe { bindings::genphy_read_status(phydev) };
-        if ret < 0 {
-            Err(Error::from_errno(ret))
-        } else {
-            Ok(ret as u16)
-        }
+    pub fn genphy_read_status<R: reg::Register>(&mut self) -> Result<u16> {
+        R::read_status(self)
     }
 
     /// Updates the link status.
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
index 53a83e69b200..7628eb09e902 100644
--- a/rust/kernel/net/phy/reg.rs
+++ b/rust/kernel/net/phy/reg.rs
@@ -22,6 +22,9 @@ pub trait Register {
 
     /// Writes a PHY register.
     fn write(&self, dev: &mut Device, val: u16) -> Result;
+
+    /// Checks the link status and updates current link state.
+    fn read_status(dev: &mut Device) -> Result<u16>;
 }
 
 /// C22 registers.
@@ -96,6 +99,18 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
             bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into(), val)
         })
     }
+
+    fn read_status(dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        let ret = unsafe { bindings::genphy_read_status(phydev) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
 }
 
 /// MDIO manageable devices.
@@ -171,4 +186,16 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
             bindings::phy_write_mmd(phydev, self.devad.0.into(), self.regnum.into(), val)
         })
     }
+
+    fn read_status(dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        let ret = unsafe { bindings::genphy_c45_read_status(phydev) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
 }
-- 
2.34.1

