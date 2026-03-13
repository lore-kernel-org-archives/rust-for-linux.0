Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E20367F35;
	Fri, 13 Mar 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393836; cv=none; b=Ohrkq1QVqVkeDaWPZf2EuFewW5rTgHrYWS98b6riZRQ8aqntf7lAn9c3BTuJp1r5W7UARJsr+0gG6zu/W6VLPcQprIvWyxfp28/gPRMf3kdKau9BzkkNsjA6j7ne83cJq4Ca0xKgGBcF4YdzZORAjj5g5HYEsrMZB/8dJLfxN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393836; c=relaxed/simple;
	bh=+15ims84K5g3R2Z2rbG1X2cJcaI0dwHi2GLAXO5GT94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uR9UtVL/z5q0zpZnkNVNfp1cxghxTq7lHGFTdi4NC5JE+qe99kHqU+fpoUBTlRbtBu0XYZzmMcRLJ2bqT70GfhvzCI95YSlEFUEPVyBy7aobT6Wngod+VST6Hcm8Sg6OuIg6UiR9mebMnGIdKr8E+zIEDh7PNTfg7fmjjkgzeqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=qrCWNn48; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="qrCWNn48"
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward201a.mail.yandex.net (Yandex) with ESMTPS id B84EF89F43;
	Fri, 13 Mar 2026 12:17:54 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:571a:0:640:23e3:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id BA6AC80E9A;
	Fri, 13 Mar 2026 12:17:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3HEusrTGkmI0-9zP4Lv6M;
	Fri, 13 Mar 2026 12:17:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1773393466;
	bh=zw4BW7xq9n36BgD6MB8AZl3w8nnFPfRvDfzjrTAcMTw=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=qrCWNn48F/vf+k8Ltav4UisfBQXf/aJ0aJ54nfPMfO3JKTNtOoxVEmOG3YftN8DFk
	 s7rgfNKxMR1HizlJDv/GumR4B00d5taBgR4juYkMe7IHM8O6GKu0RyuAtuXd0R6YrZ
	 44oZXVlfw3TczEpU1AnGGH74E+3jM1xZ2QxT3Bfg=
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 RESEND 0/4] drm/tyr: implement GPU reset API
Date: Fri, 13 Mar 2026 12:16:40 +0300
Message-ID: <20260313091646.16938-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds GPU reset handling support for Tyr in a new module
drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset
controller internals and exposes a ResetHandle API to the driver.

The reset module owns reset state, queueing and execution ordering
through OrderedQueue and handles duplicate/concurrent reset requests
with a pending flag.

Apart from the reset module, the first 3 patches:

- Fixes a potential reset-complete stale state bug by clearing completed
  state before doing soft reset.
- Adds Work::disable_sync() (wrapper of bindings::disable_work_sync).
- Adds OrderedQueue support.

Runtime tested on hardware by Deborah Brouwer (see [1]) and myself.

[1]: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/63#note_3364131

Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
---

Onur Özkan (4):
  drm/tyr: clear reset IRQ before soft reset
  rust: add Work::disable_sync
  rust: add ordered workqueue wrapper
  drm/tyr: add GPU reset handling

 drivers/gpu/drm/tyr/driver.rs |  38 +++----
 drivers/gpu/drm/tyr/reset.rs  | 180 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs    |   1 +
 rust/helpers/workqueue.c      |   6 ++
 rust/kernel/workqueue.rs      |  62 ++++++++++++
 5 files changed, 260 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/reset.rs


base-commit: 0ccc0dac94bf2f5c6eb3e9e7f1014cd9dddf009f
-- 
2.51.2

