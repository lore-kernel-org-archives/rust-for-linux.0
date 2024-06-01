Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B9B64B
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 04:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717216646; cv=none; b=b63nllNanCPVLQ1pNBPRhlzz7i/9ZU4qtml+JZmmCc6QVzI7Rj167A3vEAgKH55EldDwP6M1Q9X+0PPJl+2eq049MOwPMAvdsLp25FjBEtbdGsTGji2C4b2fWlwx+mWzZtGCZ1Xkbg7/swDzUHz/MuBR/5ML4Jjj9pDz0QPGrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717216646; c=relaxed/simple;
	bh=qCbN8A51MJPrOtd1NK2CJAxcT1PE0TLyCeT46kqbD6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MC2dqRZXhHXak5hTXPwt1RlhrYb7uvhKv3laUQ+vpDfG+eTXyq7BzU03uiLvCOD2qoq7Bmu7yREyimZX2bxFPkmkLFfMnxDZxTBq566VWjMwtosrUOxP4J/ViQSImtHnehislmlmbUdq1eNwwStGFYxWbVVta9k8tD3oCAMYK3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNKJJc3a; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNKJJc3a"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2bfae86f1ffso309405a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 21:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717216643; x=1717821443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNb7PXv3YjULHNm4p9+8kaG9DtPF4iw/ILuLLLrPg2I=;
        b=jNKJJc3an+wsZnZU+qrdjhKGG+B+10kgmM8MThEtTRSQEWP9Y5MUmCU/K4L0mBGVbE
         feykg/clFIyVWAc/e6tE/SMGuk435trIFWZLhu31x94VVEDRyGJYEfdQyDTuwg7ueqF9
         wGj4N+c677OrbUu802EFgQ8yIWXz1BeJE6Fk//ZqjYVo7xyRGA7CwzL9dsIv325GESmp
         FZyjWfe7MSWHIN9/X0qLuCynqgyYRKyMmtc7jqKYf5hS0kFngxC47rqey9A9KebSy/Fd
         v4HvWtoQRr6+qNnbvdPgUHCcvnBzm0G/IjAaD59Och5Yo4vL50HfGV7GYljXMgAhV5Rw
         iX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717216643; x=1717821443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNb7PXv3YjULHNm4p9+8kaG9DtPF4iw/ILuLLLrPg2I=;
        b=B0Tvrx+cWr/zh2MYmWwLnamc8zIMY7hxXkPJrRYRStSJko6FsL8tPmk53laCSdkDsb
         603RZJqg8tFN7LUYhF7dhJ7tzeZwxsRSYUh+p6ckNr3o8GfIz5aeM7TMi8e0xcUymnWP
         PHgVBY18+u4byP0btf6p92Jym61fV6T8fuxh5Gv2pv+AAj2tEjqIGTyc/QIuksUmDLhU
         uN8/7G39NBgtDxnvNW4el4qT3tNjKiv+fse9E9xtTaQWUFNJ2R5OUrelvACn0bbKio1G
         NjrwEf0pSdu6WBkNc68CyA9pqG4n0JsyGPIV1A52GIp6/y1ReMK9MGuNpQ9uPOkp2Bdk
         Vjsg==
X-Gm-Message-State: AOJu0YyxLqs1Al2ZNvPhUdl+xuayVJE9bYpwyEQ4dd21Iw+48k2ztY91
	U5LCazSrgcftG3mUVzek12Qk4zoRTPq0r5P7TsXNjTh5S3223lgOXfTajDFo
X-Google-Smtp-Source: AGHT+IHxRxaxGrYPHzoorrzkxlsJUh6PkRmZ3RNnz3QSrJ2Dh9KZNMNQG7z97LrBnzh1XCIs6hacxw==
X-Received: by 2002:a05:6a20:324e:b0:1af:acda:979d with SMTP id adf61e73a8af0-1b26f0f19a3mr3142512637.1.1717216643441;
        Fri, 31 May 2024 21:37:23 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e212sm4013086a91.16.2024.05.31.21.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 21:37:23 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	benno.lossin@proton.me,
	tmgross@umich.edu
Subject: [RFC PATCH v2 2/2] rust: net::phy support for C45 genphy helpers
Date: Sat,  1 Jun 2024 13:35:35 +0900
Message-Id: <20240601043535.53545-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240601043535.53545-1-fujita.tomonori@gmail.com>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for genphy_c45_* helper functions. Instead of adding
genphy_c45_ methods, this unifies the API for genphy functions with
trait.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/net/phy.rs | 49 +++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 286fd5a7ec91..aabd714ae3f6 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -248,16 +248,8 @@ pub fn genphy_suspend(&mut self) -> Result {
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
+    pub fn genphy_read_status<G: reg::GenPhyOps>(&mut self) -> Result<u16> {
+        G::read_status(self)
     }
 
     /// Updates the link status.
@@ -446,6 +438,43 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
             })
         }
     }
+
+    /// PHY helper functions.
+    ///
+    /// This trait is used to implement some helper functions executed either
+    /// via C22 or C45 registers.
+    pub trait GenPhyOps {
+        /// Checks the link status and updates current link state.
+        fn read_status(dev: &mut Device) -> Result<u16>;
+    }
+
+    impl GenPhyOps for C22 {
+        fn read_status(dev: &mut Device) -> Result<u16> {
+            let phydev = dev.0.get();
+            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+            // So it's just an FFI call.
+            let ret = unsafe { bindings::genphy_read_status(phydev) };
+            if ret < 0 {
+                Err(Error::from_errno(ret))
+            } else {
+                Ok(ret as u16)
+            }
+        }
+    }
+
+    impl GenPhyOps for C45 {
+        fn read_status(dev: &mut Device) -> Result<u16> {
+            let phydev = dev.0.get();
+            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+            // So it's just an FFI call.
+            let ret = unsafe { bindings::genphy_c45_read_status(phydev) };
+            if ret < 0 {
+                Err(Error::from_errno(ret))
+            } else {
+                Ok(ret as u16)
+            }
+        }
+    }
 }
 
 /// Defines certain other features this PHY supports (like interrupts).
-- 
2.34.1

