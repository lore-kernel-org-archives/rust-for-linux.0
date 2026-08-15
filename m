Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15763DDDC0;
	Sat, 15 Aug 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786789540; cv=none; b=q1peLCYmcQQctv59tz3EXtpzGrxWt4fcEqBdIww7j0nao0/NyUvh/82o4pY77kW6Ohl2bHEdtbBgbJdnFYbqHjEDPEA8FQa80ZdaMP6HuvjupSzMQODLg8KNaoYiu8G6ap2pbfTlYUILq3mu0JfoAhZo8Xr1XpW5Jgj7baprYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786789540; c=relaxed/simple;
	bh=KLMHjdeOZqPVCAsOuVuCXyRkdDrSv8YL7ZS+nZzLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyFtcgs9BdABOfATJMqOgepDROJf3dJEdBf4eat6Dhw/LxMR4uXesypsCyxvkRYBqoKr/O6nDKMbQZ+QnFeQ/XMc9EE5/ugZIyxqMvCXJUHc9Fq3LyR2ark20j5q80Vu8SOCuvSt5zvs+PTeq8CjVOqcGfCd0Xkc1nTmegtzR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=vPhRndMy; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="vPhRndMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786789528; x=1787048728;
	bh=hMJu3QgsZs8TCdcBeB9Zz/yumkYg03H4j+Dga41n/50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vPhRndMy9KD2r5MHARQytGEK15dboU97MzGNv8jlwXblN+D8bloHu9zGj1s2r2b2x
	 Y89J259p5Nlo2qybKhGlCeOBez6XMZlI8rchECoUkQXQ6Y6/hbn+K0fq3nnwj00Baz
	 LOgvOV0WbYIISXoJBsGRJAiiQTLvAIkotKgxooRC47SFWlmcoibLTVP1lyNodOCREE
	 Qw4nr2BW6pBj0/rFtxXrXbcmCIN/BEzXCRDKDE2dQX/gkhq92x8VgM/bsaTNRGD8jM
	 ZFJxgJAj2tm/o28Ip61j0/wwTaC6pRKFIDDcg3+vxh/DtIme9ZBN6/3lN0k1DIFth6
	 R/l7PYaVuqJfQ==
X-Pm-Submission-Id: 4hMZx044trz2SchM
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
Subject: [PATCH v4 2/4] drm/tyr: clear stale IRQ state before soft reset
Date: Sat, 15 Aug 2026 13:23:58 +0300
Message-ID: <20260815-tyr-reset-impl-v4-2-578df9a5e576@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev>
References: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev>
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
2.51.2
