Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F74369D75;
	Sun, 13 Sep 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313751; cv=none; b=f8nsBQcq8Wx6jRAueAD4f52czeHvniYxpmCk0Jg2zmYb1ydoAQCD53hkiEfUvR5My2akZGw3f8cNXkHIleWMT/x/yiuAOknu+7BZo4yVbmK/UxlxXz6IpTad5DmrfHQl5ysf9RUILcLLpx6qmo2VbloZySTVqXhxJR1wSN3+FDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313751; c=relaxed/simple;
	bh=1OboO4uEvOz/a5KE+QeqEmDeWyOpiSB0NhjaWV2SiWc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=HrVuK4R6pAEO/b7otr054WxQAFsFJZmiqaKX2ZzY/kwM0ygomYGmlr0QuQnEchPkeMaxcsOUOUlic+aPIWINbgVDVEJVx2HBsmd8sQdhGoWYgb9bogs++XW9fFyjwPLOxdnxOJhLc/draTsQilt4VT59h1HksztCDRk1odJef7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=M3WH4SH5; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="M3WH4SH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789313737; bh=rOJD5bqY+dsD1LRjOw90rAEvNSHdnLVanZNmnrCmvno=;
	h=From:To:Cc:Subject:Date;
	b=M3WH4SH5x1vdfN3sVfxnGVIPWUCo1gy6s9kIzsrGL+GbpK3eq+3xgIyYoNb04SYTd
	 OTqxVrOLEk214V9vLJHvnGKuOil41AZQenga511YhUpAm8Jycgrp2+nk8K5S4os/Q5
	 dmSmZulOy42aP1OgT90D34Vgt9z3bz20aDHYew0A=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 8968A66D; Sun, 13 Sep 2026 23:34:22 +0800
X-QQ-mid: xmsmtpt1789313662tzfy2dnrs
Message-ID: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com>
X-QQ-XMAILINFO: OBlHcmIAkWj9xmcj01MLmNje1lhHchkpOQ/BOaFD+nSfB/QErkP2YgeMaiNaJf
	 buZp5cE4/PWLnZ8qoYCY3qGyufkexdqVkLv+iUvwFp1AqusGUKXA9gn/lFJHwodSzso4g6s7thhx
	 OX2JkPbPODnhx/qc7pwK9g3Mol45s22aw2Vc1qomDK12vBghdd/CBA0oJfRTKyB/r9oT8FmPAqzV
	 LPg8Nl9GO7YCKcWZRODyf60gXruf/U2pRGQm2uwFy8/WGfLiqkqxrCECL28bRQ6d2UP7u+FmLBKn
	 U3YC+fPk0CNz6mchs06AA4HXC1ngfLDcZB4i/0lTSWhZnJtSFkabRs5xnnCE/Me9MfuwDzX+KQ4o
	 K3gcyvTka9SFsA/62u0wnsXgV7k7TADJim/x7J9Kk7h79rNtfVfltO/NoNhE7UVgLJcp9MwChXH9
	 VdA5pIzM86WDg8aiuEs2vHmaV4NXgy7+VGPf5HdZnxRl2hYl7VSOCSyqzBWTEvJkT4YuFsm21/cd
	 m2hGPHsF5hacGNxj2efPgtXWqs3Adlwl0n2Uv/uExf1RaUQ5bPgeEPHCVBX+LD8MLjZmevZcJy0R
	 pJGo4ZrblKukIMS53yE1b/Rx4Hpa9LE0qzoRcck2QawJv45aoMf4DxCj4Mg2/h61+Zaqdb3dp4pR
	 kfmaXg4+FG2QlWXj+IZokg8hvhOBmXY7UxWplwPrRX9xWa5tG25j2L0AtRRgXbZhcfJZ91KFd3pp
	 W0YSmUKlkCmsanvtAlawyD/DD7t4jLUe6CDDaU6oy+VRmrenCgFt/ZlVJtQXlCEN2A8Ncn2k8Vn3
	 jyTYz0hZjwvyjlzHggPezI61eJ2xALAKybg/epqDBWUVonqQgZ4EE9y5qHuQc1VUJuDOm1U6UAb5
	 5W7DEwFV8zlacwqVG3xeV6a+6vNl9JH9ydSqDv46z9BYiU6BULKAPKng5iBvHb5154/YJ46W5NOm
	 +22bTSGgUDlpua1WVmkS9E5s325LWOwB+UJ3r0j8KYeRIfUVT+elctkfBj4V+n4HtSc2AbEW4Rfp
	 MeMUlrygWueEPBmWxJQe/XdkQXBlmsV49gdByje1gBcUdHOdy5kEDRZim/pG5jck0so0JFbKKMN8
	 AejqmF9DZVSuKUcTs=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yilin Chen <1479826151@qq.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	acourbot@nvidia.com,
	yury.norov@gmail.com,
	ojeda@kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: bitfield: require Zeroable storage for Zeroable impl
Date: Sun, 13 Sep 2026 15:34:17 +0000
X-OQ-MSGID: <20260913153417.1918185-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bitfield! macro implements Zeroable for generated wrapper
types. This assumes the storage type accepts an all-zero bit
pattern. However, the macro accepts any type and does not encode
that requirement.

Add a Zeroable bound to the generated implementation. This prevents
invalid storage types from obtaining an unsound Zeroable implementation.

Fixes: b7b8b4ccdad4 ("rust: extract `bitfield!` macro from `register!`")
Assisted-by: Codex:GPT-5.6 Sol
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/bitfield.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index a0d0894..3dd4dea 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -330,8 +330,12 @@ macro_rules! bitfield {
             }
         }
 
-        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
-        unsafe impl ::pin_init::Zeroable for $name {}
+        // SAFETY:
+        // - `$storage: Zeroable` guarantees that the all-zero bit pattern is valid.
+        // - `$name` is `repr(transparent)` over `$storage`.
+        unsafe impl ::pin_init::Zeroable for $name
+        where $storage: ::pin_init::Zeroable
+        {}
 
         impl ::core::convert::From<$name> for $storage {
             #[inline(always)]
-- 
2.25.1

