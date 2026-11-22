Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795326068;
	b=iOlrJQt/Y5Q/JVU/BMjdHoPXvA5pjTbPmgdgZi2ifa0Bvq0ijGB4za/bV1GiEP42NLsm
	 SDnfzxibRUgqMDZYLQcMB+CeHUmQN6BE4X3SH0hCamgNVroiNs9lqum2iQuGPllBt6Zgj
	 g7zTgbUI4CAgWTosZC3Hlshej43wXBM5xWDY4sl7bcd9Hk7qOAshLHXHNqZowBt8B1Xej
	 O5WL90/xC6NUoIr6F/QOyFz9ScwERZWBR5jE22TwB9jsTsdgo4w6Ws/eZ38d5ZOiFvhlA
	 JexVkuFKWmnXt8l6mdNwJSrM3rh1BeQPwOCee+5BA+Y3V5MH5yk0TBeVpgCffeH6jTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795326068;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:X-Change-ID:
	 Content-Transfer-Encoding;
	bh=KpKNpsKBCC7ODeWhRxzgnBysPsuws4qbswjAYJm1i2c=;
	b=doluTIkfNcQyCZtgma1zDFGE1QPpib6JNn0Sy/677GoAZrLtL+YO+WE2ouYSErbDYaJm
	 JsAmvwnSakYCLiq1OQyFfp3iGwCRNn5wpEanzsbFU5Faan7fTDVxILMEYQ02pqBvxkpMF
	 UfBmsT/oYne6dhZD10BCYsGEz1o2MkLKInMfACahqos+zFfDeCtDw5/BvdIa3VXwMwRZ9
	 ZwujztgNpW9iK/NGkUQN4IKsLRkohDB2tnD2I6HSFxehVrtcKhgTk4+w9g968t6e1ALTQ
	 0SW8qvpUxeLRaPjtEmeb1c2zDvW4Nlx95QtvnyDN2/FXtBE8jGFQy1uHoE2uOpsiTeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=mfpJO7Zo;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420E606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 05:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A420E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=mfpJO7Zo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1795326060; x=1795585260;
	bh=KpKNpsKBCC7ODeWhRxzgnBysPsuws4qbswjAYJm1i2c=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mfpJO7ZoDz6WRiZ3XhQe60vMd3Fz3mdWkY+rBOga6jhKoD29SMZab77R7ypqhkufn
	 X9JtY2nD+xR3kqDaTy9Ml+SqHv00b9fiowSgO9f1u69seSMvrv7mw2+dKPzLxacvRK
	 wQu9uwqJQcqyccbq2aFaXMpnOi5fJLvIbx1YaEDJ8Vwp7OtGjE0JYbJxA+LC5+HcF6
	 e9YrS7CARZDV/x14Po3JGVJqAO0zy73sCEobI6lkqaw/QpfAZkt9LgcG2IU4DcZXLv
	 aC1gyu3Hs/+ZtXF74uWolzqybjtpJ4lkQ8y/DGHpIHYeMvVC2aSSruX9aDnmltIu25
	 IlGeFob9Sivng==
X-Pm-Submission-Id: 4jXHx34gQCz1DDLH
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
	boris.brezillon@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v9 0/2] drm/tyr: GPU reset infrastructure
Date: Sun, 22 Nov 2026 08:40:31 +0300
Message-ID: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260813-tyr-reset-impl-93e951f996b4
Content-Transfer-Encoding: 8bit

Add support for scheduling GPU resets on a dedicated workqueue. Track
the reset state to avoid queueing another reset while one is already
pending or in progress.

Use an SRCU based gate with mutex-protected reader admission to block
hardware accesses while reset work runs and wait for current users
before resetting.

Stop new reset requests during teardown and drain any queued or running
reset work before releasing the device resources.

This is the initial reset infrastructure only. It is not wired to a reset
source yet as those will follow in separate work.

Based on drm-rust-next commit 0694e2390c5b ("rust: drm: remove DRM
device private data").

Changes since v8:
- Use workqueue v4 [1].
- Drop "drm/tyr: clear stale IRQ state before soft reset" (applied on
  drm-rust-next already).
- Minor fixes (Alice's notes on v8).

V8: https://lore.kernel.org/all/20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev/

Link: https://lore.kernel.org/all/20261119-rust-workqueue-v4-0-707c68994940@google.com/ [1]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
Onur Özkan (2):
      drm/tyr: add GPU reset infrastructure
      drm/tyr: put iomem behind the hardware gate

 drivers/gpu/drm/tyr/driver.rs            |  67 ++++-----
 drivers/gpu/drm/tyr/fw.rs                |  16 +-
 drivers/gpu/drm/tyr/mmu.rs               |   6 +-
 drivers/gpu/drm/tyr/mmu/address_space.rs |  87 ++++++-----
 drivers/gpu/drm/tyr/reset.rs             | 243 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs     | 106 ++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   1 +
 7 files changed, 440 insertions(+), 86 deletions(-)
---
base-commit: 0694e2390c5be63aae9d713a173df18d82d3b94b
change-id: 20260813-tyr-reset-impl-93e951f996b4
prerequisite-change-id: 20261118-ordered-wq-cancel-63b02e0feac4:v1
prerequisite-patch-id: 7a1020bc70ad38e61214d85202e04b1db3c95443
prerequisite-patch-id: dbf1c8ccc147075be256faf6a547d9723c347a93
prerequisite-change-id: 20261012-rust-workqueue-658cd0fbe770:v4
prerequisite-patch-id: 2423b22dfde216dce30af3deb7eb7177505f5b96
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: 0bf6ae4abcef7090d0e48921d6ec627a59dc6a7a
prerequisite-patch-id: cba4cd096a4df20f4597e9ea639881213c18a41b
prerequisite-patch-id: 97b26feddfa5b675204c9e8e75f3ad2958ec268a
