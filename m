Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFD6311C1B
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511057; cv=none; b=fJwkPTbX0IrgOCKkIkmxgmAmM+T2eBaHnnl8w2Rzqf6JWx0aRy5L4dKLawnFDyNqho6sp3RbNngMvB/qOJ+QvX6AUwrfqhvemGgfkH+oO2jKXumaqj9xceFdNU1lZlPwHxuoTJau+cTjxel420clK+lwhzMfxMrwCNtJLYsP9TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511057; c=relaxed/simple;
	bh=wbAbJH6WE4g2yBOOneiDXF4YLAkrjBvpImrkA0IC0Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTVrq7gdGBCu4enulJ+LTvoxz3T//Qjh0uSiaRUkfDIwMBEKZEV7TaxPkgS7IO9TEonQ82QqjN3y6ba9altjQT0IZ8JRlZRI+vCMipNy34uxs6pCdEUs9Keojy/bXOPX/CGFcUfUTK6ohvDrwSGFwnrb7puENyBE33U7esDOmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=OQ/WLnaf; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="OQ/WLnaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1783511052; x=1783770252;
	bh=R+XBGiRLdiwS1RFO/ssalJP6t5IuZTdVRDxBQJhq9Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OQ/WLnafXU0S4SLYNkN2pnx0PVum1PJMpeG7BiQX7tpbznArmqNoD5HwktcATFSXm
	 j1JCUC597XVoED6w02JGmWmHWXhylz0u/WNUGgvqL+uMqhiR1ub6E9S88zLob3Ddej
	 ekvMasv/DS8gAewMTuw0rqQy22zvDpKzM9IUrGFIIs7flJWxgNRhRpYeriKTKKD1sa
	 sYGMfGXNL/o3XuUNhXWVaUe/AweWGRx7WW0nHyF4Z/jx9bKLzsiUZ3PZ6hv9ULJugk
	 iad1fjIZ2vUW8LDwfs9PGVHJn4iEvxAy48H+nJwwsEXkSFUNrguaOMN2cL6md0L3U9
	 zlVswULYFTWdg==
X-Pm-Submission-Id: 4gwGTP5ZZvz1DDLF
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v3 2/3] drm/tyr: clear stale IRQ state before soft reset
Date: Wed,  8 Jul 2026 14:43:17 +0300
Message-ID: <20260708114358.957305-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260708114358.957305-1-work@onurozkan.dev>
References: <20260708114358.957305-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previous reset may leave the reset completed IRQ set which can make the
poll return too early.

Clear the IRQ first so the driver waits for the current reset to
complete.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/driver.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index c5063b2be94d..90d6cd988cd2 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -86,6 +86,9 @@ pub(crate) struct TyrDrmRegistrationData<'bound> {
 }
 
 fn issue_soft_reset(dev: &Device, iomem: &IoMem<'_>) -> Result {
+    // Clear any stale reset IRQ state before issuing a new soft reset.
+    iomem.write_reg(GPU_IRQ_CLEAR::zeroed().with_reset_completed(true));
+
     iomem.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
 
     poll::read_poll_timeout(
-- 
2.51.2

