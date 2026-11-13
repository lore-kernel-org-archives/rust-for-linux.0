Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580420;
	b=hD1p6KSDABiGBhPxxiRIvKXQTZhehUBPKkn2G9WsK78X/VK5FUyb4JmU00g/F7JWJV3I
	 iK3hL8A0bX0mK23Ugnd7hxeZlwa/YQIzfRD9t372dvkRt5+AOdePvXke9Arr8xOq5M6FU
	 DJjQ/phtxjkLydnN2CmMl65XInjYBm/KSO5yAmsbDwq/cbdfGJSGGZN+U9/gaLfBtgBlV
	 JOncia7r5+ghJFAlbtmPJfxwZ1UlMvdS34byZ5Z+ppqB4qPl6mPKC/i5jcujKZvyRNxH3
	 KVrBG7iEDDKNXB2oIp24mdnGzQY7DmjqsvQGMdcyJWtJ3a8d2ddvXoLBO9Vtjd3OrFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580420;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=axQDKUzAx8Pm0m4ncArYXg4Xi4s26jXTvzsLHd9rKhE=;
	b=BKHwxTQ1Q+nuW2nqbsi7AWAEvbBVKWnV6dVhcMhtCyFJy/OC2Hg3moPtJ69FQziDIZi4
	 1ghz9Z6gEvcajYaxMF0NKPUvDNhXugbh4hDoBvN7QgVpvSTf9SX49WspUerf689+4qfKc
	 78+PjSJM/x67shJ7atDJ44EEi7NLvH8pGMxevHIUMkR41iL8HQuAIE5cueyiK+VyRGwAU
	 Ca+LdDOZEp2+nj9MkXWlE9NNjm29tIakO8iqQxEDa/b2YgzTfOP5sDHjrBnyqCSuHmNyc
	 PHxARSQiRrjxVwPfjjdErviBPbEvnPrifktNNKVcEb16VlCYar2CJBdCUPv+p95UHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=k+4GV8MZ;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730160A2602;
	Fri, 13 Nov 2026 14:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4730160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=k+4GV8MZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1794580418; x=1794839618;
	bh=axQDKUzAx8Pm0m4ncArYXg4Xi4s26jXTvzsLHd9rKhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=k+4GV8MZMnZb6ynN31sjs2G2FzQp7T4pNgf56eZx95l+WPXtsARwLbctIuJEzzvnQ
	 Guv5PPwF8J4LtYzorgK5rVG53dvCcTsMCkxd/IBvXbI/4A0bW7mJGeKiHnq+o/6K+I
	 IBUgufTKl9tRYuIK/9tv7ZhNXA+haClifL0G8UBaFz/uib5smxs6NVF2bsQywMSeyx
	 fEp3rdMCPnViI+YO2ilUcbKwXaCdOQcLFlcvih9u7DlRfLKiZ8yp90yLPN8q0Br8DQ
	 14JQRd75sHi9pWsTf6WhJCkzCPgUf56a9gI70KoulAj/UPW6fo6JbU0ErtZPi2o6Bg
	 j4qwyxjzdiShw==
X-Pm-Submission-Id: 4jR09q0KkPz1DDrS
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
	work@onurozkan.dev,
	boris.brezillon@collabora.com
Subject: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
Date: Fri, 13 Nov 2026 17:32:26 +0300
Message-ID: <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev>
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
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
index c2b99d67369f..5b57bc9a1d3e 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -87,6 +87,9 @@ pub(crate) struct TyrDrmRegistrationData<'drm> {
 }
 
 fn issue_soft_reset(dev: &Device, iomem: &IoMem<'_>) -> Result {
+    // Clear any stale reset IRQ state before issuing a new soft reset.
+    iomem.write_reg(GPU_IRQ_CLEAR::zeroed().with_reset_completed(true));
+
     iomem.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
 
     poll::read_poll_timeout(

-- 
2.51.2
