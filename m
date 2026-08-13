Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0692140DB47
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617881; cv=none; b=CLWx7HWmwEbXvPE0B1Wym+9mNCBroRs5Z+7bZXC3EWcHxRxWef1ZJ5QsbUE0uR2cXi+wrz1Ws5okenEBrwUD2J253GOCONfuGqNUdFcPWrrV/n3vmuXFE/d5ohGkDAjJkuf+U1kPoG0TvRJyzHujdYjeVkN/X6baJqCxl7uqR/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617881; c=relaxed/simple;
	bh=KLMHjdeOZqPVCAsOuVuCXyRkdDrSv8YL7ZS+nZzLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3Ine+N5NPMTPiLAkJmfbUEJ27h2IxcYB61ItjQ77bPxBWlwV3L+RX3ApHVmrPGLfDOJEUxU1f7ewQ6E/SSe7oHEX8UBTXHmYt7RJaw9/O8NyleORJYNsdd52BbtoFKl8VTI3XMF8mzbsSlUCnzQO0I//mp0Ddrfp5HMsJamxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=CGV1BLjF; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="CGV1BLjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786617876; x=1786877076;
	bh=hMJu3QgsZs8TCdcBeB9Zz/yumkYg03H4j+Dga41n/50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CGV1BLjFZx7Pss46APNH6NKOscnSD6hQlMjrybKVruBgnaIhLYXwA9bSNp2JyOZJP
	 /RPVfSJIb/eP73JNeaHFOq6lANg7gVtW/c3AAynbvBuXh4Ci9CgcZdZ2CHfM2NFu/T
	 x3nGtiAhFBx3wOxl9O4vQVtwssC9MuWxTcjZJoiBJraTT8ux1HXnE+B8cmDwRRtjCr
	 Vk0JM+7dJYqMAJW4jhDLTVaOy3pFWG8W1Wb9BF/s8CcsEs0JHsQDD7LGB1lOtP4/rm
	 txxMp+dDWatwhMg2TwGrRHAntytjVofUlrCP6OkuawgnYsdKuVEGKwin0huq3eb0en
	 kmdtaZFlt0RWg==
X-Pm-Submission-Id: 4hLMS21hdRz2SchP
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
Subject: [PATCH v4 2/3] drm/tyr: clear stale IRQ state before soft reset
Date: Thu, 13 Aug 2026 13:42:05 +0300
Message-ID: <20260813-tyr-reset-impl-v4-2-b36fcd0805b2@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev>
References: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev>
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
