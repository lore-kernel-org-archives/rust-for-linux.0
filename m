Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148EB367F3B
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 20:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297192; cv=none; b=sSgIw1Aaxs3KqKQwBYGnrpHNQUdKx831V3aCjTpQAn0Y+9Ko+yduCsXGpEpnMDcO+2wf3WCiF6/jW9p1Vbk+UjMtalj2kNOoS+S08tcWaOqv8u8szZBL42JEA1/YzpCzCTi4Ld9WkJgU4LW8UGO0ybdeOMtMnnkPlPZFPfPOvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297192; c=relaxed/simple;
	bh=B/iMACF8boppVlhKT3EV3WhxAci2tfI24r1XLay4l54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLJFoNCW/gRAUsjQayAJiWtXLzOXOBVCtD55MR4rw+A5wNWADm9YXtkXbPGMAjSHAg4O9ZxiNHVLHjONXOgsDNTtiqTUT79wvEpEx44N5oMorJ0oFW81JbSXnQICbo2wkMQtXcrtHnR/W78UL3o5KPJratwkcc0iwc0n9mOSezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+eoYf9A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+eoYf9A"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1307438ddso3366530e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297189; x=1774901989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1xlgAKziwDGy7HCoeKtXi6eXYVXotOIcpLXVMuXXLU=;
        b=Z+eoYf9AyINynE2liAc2JHbHyI5tbF01/6V/3WC7b4juBS/QB42VkYnDasQC5kZsGx
         TbFizs1+0ckRAGZ2Wg86t9SwFHzkE5FoLS2TIOoy290MyZpQaTgz8bQBhfXff8on3HXq
         yUQbCAYjRzo0N9bVLwCoCJn0ZHn9gTe4DOlZpUtR9bkJj83YKN/FJ5ZcOdyzb9qr3VoG
         XJvbiRTcpOXT2XPlzCHepFJF9k9t3gfiqtodtUV5iNCmHm9k0bNtCTj1ZTB7IlUOzcDm
         XtRbgJcecO9YUKK6eSff7HN1pE4mOxf2j6/sYrhJ8H77+6MCducHRqb1rBU2LuMqwES+
         R9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297189; x=1774901989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1xlgAKziwDGy7HCoeKtXi6eXYVXotOIcpLXVMuXXLU=;
        b=sNrKs+rT7DMrMwnc0rtzkV6NlQ3pJJWQq0Q9MhBMA40KVVv0yq+i/BIooi4xq8/B8U
         MPA24PWbbqs0paF9SVsiS6IgCItbXUpEQsXwrpj+hsho8xV7IgaHjsyZpaICIAhnSs78
         +YYrveufgRSd9x21tAaY/b2jMOKuxAlLOWAQ/BvuaepVIy6rvEVpXmLsqs12b8homxi/
         /NBmDaOWVXisnxqsmGu4xmpS6eOlCwHIENi071DMd1gOLxDbgSuf+9AwsxA2g22OlRZv
         ivNggw8d3Z7bBmRiXFB36Ddd8L/PsICaQH55bR3afrDhNVbvP7VxFOQk4mVUM84FR0JI
         eTiw==
X-Forwarded-Encrypted: i=1; AJvYcCVkRUKYtcg07IENiimLqwRNsvC7zejVWvo22TbgbqSZ/89qEKE3eC0vMJJNK82zdAiUCbv0gyX919RfG+L1KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeaswo6dJz7IREi7wgt2FUrzsaOguCguuJPP1x5mX9TrFsez1X
	Ar5Ovipq1Kf2GyrcU/A/zJkPEaFcAY1efBuGX3ixw4KYNj4QudSnWZdX
X-Gm-Gg: ATEYQzx7ADWZvRnf013HhJONnluuqXFhpJKfq5Z/8cF4O3oORC7S3jpWszZLWbLLdmG
	yn0VEpj+2Ks5eav13LNYbzNu7m9Jb7OjOaKeHMoPN/6EIqHOns8T+VfFeZdQVnrQJGhSG91XErb
	rM0PxFz9wZtvRrewDGN3kAmQG6gMHTVJEt7H97257jzFGUY25G8pZRq72/AjtfwtqlBc9YYjTZf
	jIeDQjTePN0O5DuCLeKYjk5yZ41eOdF/hFpR/mjZSVtTocSnFGqUsMAQeWIlbTfJSc97rhMlj2m
	um2Mwtbm8/xqIcrSZ0UXrJ0wj5rJj/YVinaiO77kCMFD2tFVKp0XlzSuZiXM+SFFLVngjL5Q8cf
	RXFlbbWd2WLdaEJoSqKOfSWqBSy6f48GfiDUOHfHZLPF01si9ZsB9B9d/+UaC+PZ36RP5a3Jp+2
	rgGDsQk/c26+fc7HzcKB1OAioAXmWJumtHPUiOTVjf6d45GqGMrenfUgwyaRwxGC1p51we6xjca
	vPXC8nM5yWPXrsDbQ==
X-Received: by 2002:a05:6512:39d2:b0:5a1:2e0c:86de with SMTP id 2adb3069b0e04-5a285b523d7mr5516711e87.32.1774297189065;
        Mon, 23 Mar 2026 13:19:49 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm2720623e87.42.2026.03.23.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:19:48 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH 2/4] rust: phy: add paged register access and bit manipulation helpers
Date: Mon, 23 Mar 2026 23:19:23 +0300
Message-ID: <20260323201925.8405-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323201925.8405-1-iprintercanon@gmail.com>
References: <20260323201925.8405-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device methods for register manipulation beyond simple read/write:

  - write_paged(): Writes a register on a specific page, completing
    the paged access surface (read_paged already existed upstream).
    Wraps phy_write_paged().

  - modify() / modify_paged(): Atomic read-modify-write operations
    that clear bits in mask and set bits in set. Wraps phy_modify()
    and phy_modify_paged(). These return Result (not the old register
    value) since the C functions return 0 on success.

  - set_bits() / clear_bits(): Convenience wrappers around modify()
    for the common case of setting or clearing specific bits.

These helpers are heavily used by real-world PHY drivers for
configuring vendor-specific registers without races.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 646b2a78a2710..43d1ee360268b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -241,6 +241,49 @@ pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
         to_result(ret).map(|()| ret as u16)
     }
 
+    /// Writes a paged register.
+    pub fn write_paged(&mut self, page: u16, regnum: u16, val: u16) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        let ret =
+            unsafe { bindings::phy_write_paged(phydev, page.into(), regnum.into(), val) };
+
+        to_result(ret)
+    }
+
+    /// Performs a read-modify-write on a PHY register.
+    ///
+    /// Clears the bits set in `mask` and sets the bits in `set`.
+    pub fn modify(&mut self, regnum: u16, mask: u16, set: u16) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        to_result(unsafe { bindings::phy_modify(phydev, regnum.into(), mask, set) })
+    }
+
+    /// Performs a read-modify-write on a paged PHY register.
+    ///
+    /// Selects the page, performs the modify, and restores the original page.
+    pub fn modify_paged(&mut self, page: u16, regnum: u16, mask: u16, set: u16) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        to_result(unsafe {
+            bindings::phy_modify_paged(phydev, page.into(), regnum.into(), mask, set)
+        })
+    }
+
+    /// Sets bits in a PHY register.
+    pub fn set_bits(&mut self, regnum: u16, val: u16) -> Result {
+        self.modify(regnum, 0, val)
+    }
+
+    /// Clears bits in a PHY register.
+    pub fn clear_bits(&mut self, regnum: u16, val: u16) -> Result {
+        self.modify(regnum, val, 0)
+    }
+
     /// Resolves the advertisements into PHY settings.
     pub fn resolve_aneg_linkmode(&mut self) {
         let phydev = self.0.get();
-- 
2.43.0

