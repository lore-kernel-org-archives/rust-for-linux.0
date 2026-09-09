Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F2F52FE4F
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950708; cv=none; b=urpD7aeWiBPzQOUDk2A8lKoo9LteQ6Aun5g03jIRAOwsYG9t2wTwTKMgDFLWgqYPMU/DRc/jSzkMBHdUI41CGUdSMqoCYH4yPz74Su2+FuL7/7KDnaznVdOUrFNkyfQCXGzOPdbXjfh7Kem/ciMsSx3bw8dsygjdm/KxmJwP5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950708; c=relaxed/simple;
	bh=pfB+KZaSY3RlPTkNlGMroxzDczth/bgr6J+oW40CVc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaE7a6p+kGP0Mf/ZXEf1CeZhFlHuFeI4bJixXGyf2h3FSkGb9jFpUAuzCuoohrqYtxcdSieMB75PtP2XI4MhPu4iPR3FujVX5QCbiqW9v3TZzbDi0Mk7irjzFW7PtTa3UIvzRZXt0Ouokdf1kTr3ilQESCOooE6paF5oMxTP2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=WMUBIphe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s5ydCYOV; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="WMUBIphe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s5ydCYOV"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 76266EC0136;
	Wed,  9 Sep 2026 06:45:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 06:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1788950705; x=1789037105; bh=bHEC0peSc9+H+sGiKBsXc
	ulIJxlU/Upn+UBvvoo4Jf0=; b=WMUBIpheIUbWvjFHIPFBAcZabOCxyywo4wsUs
	htOKxAFW/wdOw/E1Q/dCZdGiJGSu9aNSVtck53psQBm1ye4zYCkabYqJ1W0uoH7z
	hPIQiQZi4lvpndamuP5JsQieMnQfko9r0/5Q4QNqVUdQ7WpRzRHocihqIBwyhKB8
	Q0DKxzfuOuLDQveogdaaI4Qp71ZhyoXVd538Td0g6u+5oMkgzj2UY2LP+lv0VHL/
	7Kqukwn2owBKhvacY6tJmZYhBKoOx7LuDQMMvCC6d0vq77Vx4+/tZMe1Uzd2If/K
	+eXViIAUv7rii9UT7NkKpuiXFiaudFAcbfl4Y1hfyOIh3erAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788950705; x=1789037105; bh=bHEC0peSc9+H+sGiKBsXculIJxlU/Upn+UB
	vvoo4Jf0=; b=s5ydCYOVIj3c1f9KcJIV57KglPKBy05rgx1hAq08oVBt1R3r8ee
	zc7a4vJ1Erv7nSLPk9L9d4Ysb0GcyKWumhHOqKYgMqv5iRV5LRiF4uJ83GFDX+Hr
	uPLHMpyGUhSn1GwMPdzjkbDPRt4RX5I9eF7XRpSsct0xxybf+YjwmRLpwXgF5BVM
	6OtfcQItWA6K2joFh+4yT9sIQam9CpqFm5rUZbuBbwW8bogRY2sABaOsBiiSn19j
	i7qFeIRSK9nrG6E+oFaOlTP/LDxzHFir5exT5B2rQrdIhaa0OawGx9Cc3iNM8/uG
	nPs4QkFAO+6uAuHGTeomaj1m8azBslZFqzw==
X-ME-Sender: <xms:sTihaspQRjsz-ag1wXeSgpjqgw4yb6yEdiFUXvXegYAnDnKMFpbPyQ>
    <xme:sTihahIgRO_8NIfbfWqjLDfwqCW_B2XvMZZBn8xIlNV3IlqOGz8R57Jkw4LLInsCB
    o7wTKOnB1DqF8ZxyYfOF1tDEQVLEGkpGELBOAUcU4DhngckhB0N4Ls>
X-ME-Received: <xmr:sTihaoDvZbe5IJe8DbwV7UXonw3Ez9kqFuBwGtuf2zBJfEo2wkD0yMAvhxr5uLhHLc5Rl0c57lVvkB-seyI>
X-ME-Proxy-Cause: dmFkZTEeSEUAov8nfa5Lj2/pSs9RUxanqVsOmKxl7GNz8D29g29DfEiDTkS+w2j+NqVB4X
    nTpUstNbXh6Fgyw8DXdnWI2ToM2aeMz04qYUCs819f5+mchhoWbt3YbpTKnKYY95ZAt/7F
    Uv3xOrQfKUpsg8NuJirM05eZ1wZqYadndf3tqkT0ccL3CQeBrOE8z3kvbc1hRTKZXE12+Q
    h5ymT9oiwU3f2NcDiv92wWs/c2zGBfc/WyIweFTQe2y0ovZhbFqsYej8TszMDG0tDEWhh9
    4BvWIAmAxhu5a+VeIVVmsXMb+lCUW6/r3ObG6x9jToSW5J5aIIw+CRN56gsv33nNGWyVBO
    +17XW272jusPqejtQ4pCMjDT+NyIUjcDWDTt0gRr3r92+Xat50w8W8guzvn5lh6FAQbARE
    +vH1HdbpMSj4dle6e9Fd7YxFQ3V5RyUWM+zzCnmHB4cB99usZ9rtV8+4Sodc2lr3guQQ30
    dZnHEmMkb/tEHHh5669zJ5J87bq5nONmJl40g4265SLXyZYKHsN7/v3Xbi5qeWMm8tG3/q
    zI144ifsIBsDIyGhZMJUIAcAmT4xyHQTpo19xjZiOqMD7LczHxXLmJvKZEDk2SEGNewpWP
    8jfIFEJQtWtuwIHr3wF692k6+gbfecOhAoVSeswNkMH8D9+Lm09OyC3zAmJA
X-ME-Proxy: <xmx:sTihaj5F-kbqf6h0vynUa_QzoDt5fOgz0vs79Tri8Xj3iovD7bBMYA>
    <xmx:sTihakFt7HvwpesuxpnFq-yULjmPK0IEZ7tqgdAZC1dPjCcb92N82Q>
    <xmx:sTihauRo93-3fhuOeRD_IcusrwYNMjvgtZcei9-d1mJmBu_TE2WVDA>
    <xmx:sTihaueGcQ3PcxDXj2ML5QU8b_D-FVNbk2o2MBKh06bpE8znZpR2Xw>
    <xmx:sTihagC59BOP6BG2Ow-76iHiRuf890_xMlsDw5a1d0-yYwle07xXloK_>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:45:01 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org,
	tj@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	jiangshanlai@gmail.com,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] MAINTAINERS: add the Rust workqueue abstractions to WORKQUEUE
Date: Wed,  9 Sep 2026 19:43:13 +0900
Message-ID: <20260909104313.2453991-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

rust/kernel/workqueue.rs and rust/helpers/workqueue.c hold the Rust
abstractions for the C workqueue API, but they are not listed in the
WORKQUEUE entry. Add them so that changes to the Rust side are also sent
to the workqueue maintainer.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..a8b0c70d16bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29484,6 +29484,8 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/helpers/workqueue.c
+F:	rust/kernel/workqueue.rs
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.43.0

