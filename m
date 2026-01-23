Received: from sender4-pp-e105.zoho.com (sender4-pp-e105.zoho.com [136.143.188.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2D1B4224
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769190777; cv=pass; b=jUEIH/IBbB5TLRybkQh8ZPSsiM1XDtPPp5W86C041KxiTa/iL0TbIxgxlGotFJznoZ+sF8QAZohC3MxKqPunTg+tF8qhnMPCCjv19JW1c6wDzXXZII5qFc9xhwE145mFgQclCvMM0ENGi+9pdGgn3ZZG244whKilZRhIzKYm8O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769190777; c=relaxed/simple;
	bh=3ivUiC3eosjLWadImA/Ld3z6tCkOlQ/NiLq+N3Lnz/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezSUIC3Qga7GhWA0TUwX93VCkokXdUL85hH0xZh621D0RBasGtmh3R5Up5eHdUhvjB+UQ6pqYc23ZKBFY2l7DWU8CvN186ItvFONZ6rw72M6w7PnmmJw31bOFzFkdT+2Q78b27GWIvnokRZAerm0EamZHH03wsBRQgpGjxW4UT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=dVBEOuRE; arc=pass smtp.client-ip=136.143.188.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dVBEOuRE"
ARC-Seal: i=1; a=rsa-sha256; t=1769190766; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UrqnfEKzdmvIw5PDlOQny41sgrcUTU+rakZD/ryxhminOeunKOoNuf1KdSxVdYjHCdjSBHnge5xk5QohHUOLbdCF0UoaicjoW+J3XxS8OYiiqSz6e3ZvQdUAejx/8LcGNzlUIGisgNf+AldI2zosBV5Afc3AT2Z45M4AHRTYQJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769190766; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vo9gvhzzc7pVzSzFGU32xyEpNyrSjhM5A0YA5N/eeLg=; 
	b=jsbgK+QR5h/IRHA1cnOExJoV84NDhv0ly8qKXZlfRti/zsKgIZn55ZfXEPYzn26aN0As2O7OtVZgsE7G6GrK/4iNQERF5pJXjjT/sPicnI2usP8jfa+kaYsT1dVXpWhNM3SwrQe2U3WQ7ahHsM7oPpgOfSsE/2XT3gSIMb3nLp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769190766;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vo9gvhzzc7pVzSzFGU32xyEpNyrSjhM5A0YA5N/eeLg=;
	b=dVBEOuRE5cbBSbfbT7Rg/5i2RtAv8IxbAQgE5dlSPcdoQ8g9lF47zLir2tX4jbDr
	yGnP9w3iHQ/TlSrO2sK25izTb0Gd6ewvV5s8+79jRdRRbvlgnLKFS3e07M9MO4be1Cc
	49EVSpyiBY6kv2PfTDiuTPYTL6CxTzEwmOE+hpMI=
Received: by mx.zohomail.com with SMTPS id 1769190764326682.6739991113686;
	Fri, 23 Jan 2026 09:52:44 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	broonie@kernel.org,
	dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	gary@garyguo.net,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] drm/tyr: suppress unread field warnings
Date: Fri, 23 Jan 2026 09:52:35 -0800
Message-ID: <20260123175235.209092-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the rust compiler warns that certain fields in the TyrDriver are
'never read'. The fields are needed, but they are not read directly, they
are only written into an 'impl PinInit' that is returned by probe.

When warnings are compiled as errors, these warnings prevent Tyr from
building.

Suppress the warnings by adding underscores to the problematic variables.
This allows Tyr to build again.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Added better explanation to commit message
- Used underscores instead of lint attribute
- Link to v1: https://lore.kernel.org/rust-for-linux/20260122003746.405370-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/driver.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2a45d0288825..568cb89aaed8 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -34,7 +34,7 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrDriver {
-    device: ARef<TyrDevice>,
+    _device: ARef<TyrDevice>,
 }
 
 #[pin_data(PinnedDrop)]
@@ -127,8 +127,8 @@ fn probe(
                     coregroup: coregroup_clk,
                 }),
                 regulators <- new_mutex!(Regulators {
-                    mali: mali_regulator,
-                    sram: sram_regulator,
+                    _mali: mali_regulator,
+                    _sram: sram_regulator,
                 }),
                 gpu_info,
         });
@@ -136,7 +136,7 @@ fn probe(
         let tdev: ARef<TyrDevice> = drm::Device::new(pdev.as_ref(), data)?;
         drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
 
-        let driver = TyrDriver { device: tdev };
+        let driver = TyrDriver { _device: tdev };
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
@@ -193,6 +193,6 @@ struct Clocks {
 
 #[pin_data]
 struct Regulators {
-    mali: Regulator<regulator::Enabled>,
-    sram: Regulator<regulator::Enabled>,
+    _mali: Regulator<regulator::Enabled>,
+    _sram: Regulator<regulator::Enabled>,
 }
-- 
2.52.0

