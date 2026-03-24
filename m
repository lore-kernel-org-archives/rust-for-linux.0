Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7C3890FD
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367595; cv=none; b=flcREYmUM/K0KhinqsKWXCdXLv6xGipr8ivR4OZwowMmNpgra3R10nruu7tdo/b4jmHXJladJJMKwD1Nwdo+STh/5Uu0zHCVy5xnhiORHQMye799b4khKJlzbNYx33rZYBFYlYdONg+BkaqyxyXDiCVH1guOY8c2ObIQp74VkpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367595; c=relaxed/simple;
	bh=xuyvMe+SNux1ePFfxCnCrN815+h8uo0A3psb5ed0ZhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2w6wUURerv652iI2rtE1dZSQZp8p3S3twrMgy1g48eMUOaHvLUFrp/TljD1hWYU+4AvPlmtt64PgHqLARgr3o8rfHmZoRhmTSx5XMK+TZTCOHXc1QTh9GqiVLr15BffBv1za8cYAwo+Yeo0hfwhAiViyZqRS6v2IheNaEXjfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgqIIKtO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgqIIKtO"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38bf85e4810so11398861fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367592; x=1774972392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjErHIsHseJ35cde2HIfuRIn9XssCsZP9IFfHWdKmU0=;
        b=lgqIIKtONKiG8Z7mfawOiVJLrtvJcn+TitGDZTalEW9ydhPmkz23MpJBoiSx1vJg69
         kj3uyV04ScvdNKu27k+7ZzT+eeDBjMtSUrpJlsmJ2E3cbAngyEnQkX4WhIOaluNKhJ1P
         xl3DJcadNs6/4fYpusun1fNBzLi84PPYlVA+Q7IT92+zu73XQH7VxKjw/VtXUE9bMuZI
         ontr1aUXAnSBbo6oFqZteB4zP9aE22ga10zNsgTDnWboKLde3TydWlav/yFRKkhwMOr8
         Gu9H3ff1lG9HdgjrcbfPbSZv2GY1SxFohAyFpGPQ6eU7Km1XeP4lh3iLmv3h8NJyMCDU
         NlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367592; x=1774972392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjErHIsHseJ35cde2HIfuRIn9XssCsZP9IFfHWdKmU0=;
        b=T+iBL6YKNZMoQOT6Puv9WFbPpBQ7IlFdsCfkub76ZLQKuwrr+7dIVQRklr9VMllQPT
         PGqhudcxmw4eZDNpFT+hJMQt6/GKYOJl58b2NrVI5BLnbFwo3c02rq8LUpFhCJuwKWkl
         fRwsAKgQauCZKfIbXX9aOCB5PBS+fvtite8X2YkQgPi5DKTP8hNmVoj06tLfvuI97eTL
         Gyj2M7oK4Ui+J1sNFTlQDJ5cu2vHqelBpCjFQ5NAPQiFaZLLyihBV0CyrxO+za5qdtLO
         QL87aowZJUGrnbdtJkkX+05FPruLyn8EQQWCKRhVdZxiY5jRQ3qza03cyDdr+vBxyyTa
         5b+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKG0DEv5RtkkkOZSEDvzxXLRlmg1yElZ/OB0lSwyjSCD6F5q6HUxDXTgzkgf7n1Gq9E1xVdrUnS5rt0MBbTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/PeAXFiS3HrRcEmUd53bu6dANLH+1kg8Ybt8QgRqC8Z8iVZQ
	HwLv1pj/gOwOlUpbLIAD6sZHo9+0CpKuxWfVADkapTH0W1gXFnMG7+K7
X-Gm-Gg: ATEYQzwdptLw580M+ICi1p3fQC6Kmu0k+UQ8431Ja0xbntyFLsWCYhSSCXGF6fsDNsA
	abj8VjHXeIwWAQf0mWFa9QPbOaM7MRVkOfdHYVdzHlpuJfOvMRpmWI+okSv9N8O3KnY5GMnrNW7
	pY7i7iqx/xD1gzda0bxbHyz99NNnvrBa/ZgJypiWOv2pvPIjdsRVHRd4JsmQCv865NURph9I5Af
	Hvg1GqqFyRhOFtv13+5Ja3wKIOLJZDeqQW8xE6gEDZTzQcEz3rTHQp9FNwuhwnYBNFup2ZkzoqL
	GYqx9Q9ezcezIyWVIZkahytFhS+Ey/RUQm3hVk7Ny3gy613Z0Bod1EC/90dh+LKBygXRACxI/5f
	K2no8lKc0n/wnlxaEuxXJf93VGo3DwW7cwMnAk+6PYfBXAKhWPx/WeXVllDAb0SPBz2OoB7jgkC
	pNoyktQjuX9GCjHBqgnsuXT7Tg5cBSOe/BDeryCmjpcM14XotMeSuIWMVOY6r6bwqjz0ZOlH+da
	ANJlFVeQ0X19utfBw==
X-Received: by 2002:a05:651c:234c:20b0:385:d6b2:f4cc with SMTP id 38308e7fff4ca-38bf96cfbe1mr40001761fa.19.1774367591926;
        Tue, 24 Mar 2026 08:53:11 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm32567841fa.32.2026.03.24.08.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:53:11 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH net-next v2 2/5] rust: phy: add paged register access and bit manipulation helpers
Date: Tue, 24 Mar 2026 18:52:46 +0300
Message-ID: <20260324155249.15098-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324155249.15098-1-iprintercanon@gmail.com>
References: <20260324155249.15098-1-iprintercanon@gmail.com>
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
 rust/kernel/net/phy.rs | 45 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 646b2a78a2710..142f7101723c8 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -202,8 +202,7 @@ pub fn duplex(&self) -> DuplexMode {
 
     /// Gets the PHY interface mode as a raw `phy_interface_t` value.
     ///
-    /// Common values include `bindings::phy_interface_t_PHY_INTERFACE_MODE_RGMII`,
-    /// `bindings::phy_interface_t_PHY_INTERFACE_MODE_SGMII`, etc.
+    /// Values are `bindings::phy_interface_t_PHY_INTERFACE_MODE_*` constants.
     /// A typed Rust enum is planned for future work.
     pub fn interface(&self) -> u32 {
         let phydev = self.0.get();
@@ -241,6 +240,48 @@ pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
         to_result(ret).map(|()| ret as u16)
     }
 
+    /// Writes a paged register.
+    pub fn write_paged(&mut self, page: u16, regnum: u16, val: u16) -> Result {
+        let phydev = self.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        let ret = unsafe { bindings::phy_write_paged(phydev, page.into(), regnum.into(), val) };
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

