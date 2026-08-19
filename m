Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258F7248F4B
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165214; cv=none; b=i01imd1RgiUHuc77tvrhJk7c7FlzbbVUMqqNDKbG8KupAVoSPD720dcP1TUKA7O8NerFkVXW5hhT3djBPndU5yfz4V8WKCXcZy0JR+mgipmvvEmIT7oNAQ5sIOJ6TcQwCzeNOdhIhEn5jU5uYJfxJ7uFw3P+K1ZKLGhdfK5uy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165214; c=relaxed/simple;
	bh=KLMHjdeOZqPVCAsOuVuCXyRkdDrSv8YL7ZS+nZzLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxKEL4C2GxDgzrBUNQ5tfEbSO1PRIEeaB7gI1roohSEvOVjwOjiarNSs91NNO0yURvttQZaSbFyfr4enGM6pzfgF4BFau1oHPGTIz4WODOpugaD2PkPKROhCP3reEZLMrZxuCcmorEkJUWkoM8NKwH0xxvqRO7KXCgSncYtGL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=NMe7e2UW; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="NMe7e2UW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787165208; x=1787424408;
	bh=hMJu3QgsZs8TCdcBeB9Zz/yumkYg03H4j+Dga41n/50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NMe7e2UWqM+nAb+bPKyYr16+vNBTbmmSDyG7lGu4Df5V4j89vLuLchuZ7O/Gdjun2
	 vlNU0zHB3oB20JW7Bd3vdg/j31x5A5K/v/iAGhgqKd4rwfr2HOJdEDiS/edAvlvDH3
	 Aurog0mhjDnaj/iEgH7UKMB9HTKaRKKeOZDTItFCAefjKfme/kH2xhMYSyFm0WxwcX
	 rnzpxx5o0VeCvk+bp+5VeL2eUC2k83a07M0GqZTfVcRhmPvxEUqP8KJRDTynJmicEi
	 y5qPShEP6jVeOPEHpY/vIQOP+zqndidqgQRXg/isWrA+1VkNjSEp27MOzUIla/Rn/l
	 qkTWNqX7zA0Ag==
X-Pm-Submission-Id: 4hQFsf32xKz1DDLh
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
Subject: [PATCH v6 1/3] drm/tyr: clear stale IRQ state before soft reset
Date: Wed, 19 Aug 2026 21:45:39 +0300
Message-ID: <20260819-tyr-reset-impl-v6-1-7b4e1e041fe5@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
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
