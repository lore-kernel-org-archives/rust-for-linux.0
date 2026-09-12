Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA042BC39;
	Sat, 12 Sep 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209636; cv=none; b=RIGfC8HzK+Bxyu3MSdQTNcCSYc2CsGfjJ/KtQQ8C/4SweBZP5MF+tvSwNoI4kvhb5a+oKLyZ13CsRIPUKbDduikmn02wvOnccQ5Ixy9fXq6b4ozIhQrdrQWY71H3421IkrdV9WQQJ2Iz8x46OBSU4EF5eNXl3R4K3odgbQsP6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209636; c=relaxed/simple;
	bh=0IUKkIxWfHtK24r262lTJP16+nFRTvm7yNxUZxJ5lKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4wxYHjU2uHT83wtAJGWtHZ/9ztoyddt6D9a7EcNO7l+OV02Th8sxMYBvxzCuFHtksbKJusKgVPD+Srcs/8arb3R1zxRRv40H3Xm6d9dY/WMEg8TA+D+oXOnYLyiUokx5R38Y1/41Ht2eD0L2Z/Mf8n66AQkCmCWUhjnNMVgcPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=GgUogUBy; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="GgUogUBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1789209615; x=1789468815;
	bh=JdeH9lY2NP8nPLfQyL5sTp8NMpMGmAuuAgYyRqq+6Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GgUogUByZs9n6r3+ddN59Tf6fp/mzD5B/HGDUxHENwHZR08xoONDQbzGweJ6lRTkz
	 8oqBk5CdNFGvZ7QqaZkbSfaFANLdzQYTeixE0YVdA5lQEkCaroFSTKC8k1BoWL2hQt
	 LGUCZjufFDjWa4ddK+IaD0Z156LRnF3IHg8kp+T5BtenZwj/JZx+dwfbZlmppAzJ6B
	 ikwAGmS0m9txHetV8FsBVDigHCeaBpY8n5Bp4wOHWgDlGTtTS12wlSMm07YBu4Enfy
	 phBgV4DOie5sRxYC6OdcYiTVaudNeY16KFA9cOlDq0s7Hd0jjDaNA+OHZMOoqz8I0Z
	 JBtFSCOgiunfA==
X-Pm-Submission-Id: 4hhnx930Hbz1DFFV
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v7 1/3] drm/tyr: clear stale IRQ state before soft reset
Date: Sat, 12 Sep 2026 13:39:54 +0300
Message-ID: <20260912-tyr-reset-impl-v7-1-077ce72084eb@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev>
References: <20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Previous reset may leave the reset completed IRQ set which can make the
poll return too early.

Clear the IRQ first so the driver waits for the current reset to
complete.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
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
2.54.0
