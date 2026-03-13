Received: from forward205a.mail.yandex.net (forward205a.mail.yandex.net [178.154.239.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3802388E40;
	Fri, 13 Mar 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393875; cv=none; b=MXOYVmDot6dKF1QEapbLxbeJZVF/UbYIapfgaI9d1DNjNWTj+JPSLZfbhNUjTFmz5hANrqnf1N1TR0LKyDf+NmmGmvPeNcKqYdwq6sJ28b299y0DP0W3dtLnwYRMCBPIcGNmxBXm4WGtXY4wix7KyL9az+/7IR1I57TCqw3vFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393875; c=relaxed/simple;
	bh=ndwdqa6bd2iLxTHW2zZ8bxP3iHLI/h99PAJbL9mQdAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/ozOTrpnOCuNGUa3SiScjQ2YT1MSgcQAm5WeMkU8EiSGj9q6Uhpc5VN5XIrGykufdc/wsO9kKfD3GIREPS63xog06Y8IqZA8AuW86UGioIfLEfBOa7zvHowmtE7i00bF0esQL8zVFQteqUvvlScPJAW0Hn47274i50BINnJ4LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=mu1V+iMp; arc=none smtp.client-ip=178.154.239.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mu1V+iMp"
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
	by forward205a.mail.yandex.net (Yandex) with ESMTPS id 288A6CBF89;
	Fri, 13 Mar 2026 12:17:57 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:571a:0:640:23e3:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id A936B80CCD;
	Fri, 13 Mar 2026 12:17:48 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3HEusrTGkmI0-kVMePrg5;
	Fri, 13 Mar 2026 12:17:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1773393468;
	bh=8Epwrrsq7LNYAHxJtynlSWzfRvuMl+7kFlXFQuGSZEk=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=mu1V+iMp1Xlzhfek9S3EnnAnGcQ053OJM6Y8J21ZaB4/uqXpVs0Wku53axPXjVrOt
	 DsRyi303B52/nHGUO6eStJibo+60fyRz4ElzlHRokiAooXE68nnhYUCqFJ1rFaWwGo
	 nvBn7CiH/bMvzMKwQ99Ts39LnzCA89TtAO0Pp2uo=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v1 RESEND 1/4] drm/tyr: clear reset IRQ before soft reset
Date: Fri, 13 Mar 2026 12:16:41 +0300
Message-ID: <20260313091646.16938-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260313091646.16938-1-work@onurozkan.dev>
References: <20260313091646.16938-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clear RESET_COMPLETED before writing GPU_CMD_SOFT_RESET.

This is also used in
drivers/gpu/drm/panfrost/panfrost_gpu.c::panfrost_gpu_soft_reset
and avoids seeing old reset-complete status from a previous reset.

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/driver.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 69eff2a9e116..f7951804e4e0 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -91,6 +91,8 @@ unsafe impl Send for TyrDrmDeviceData {}
 unsafe impl Sync for TyrDrmDeviceData {}
 
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
+    // Clear any stale reset-complete IRQ state before issuing a new soft reset.
+    regs::GPU_IRQ_CLEAR.write(dev, iomem, regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED)?;
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 
     poll::read_poll_timeout(
-- 
2.51.2
