Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85729318EF4
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776359861; cv=none; b=R1GnrFTFwCq5kbu/mURceniJ7dylL8qM+mJMwXo9r9QutS2dEg5TlIDm4uJTU1unyPmOe8d2QxqQpukWFvr409IWLVS/16SWCIBybfSAAj4MMHlycmKVqMqytaHOdlEvo3VHMCWUlFh5RwzosOxmuT9TMCN7knVbIdRJXid+z88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776359861; c=relaxed/simple;
	bh=YRCnh9ZsesLpoDNk7NI8hmU4mFNFJx1N1NJox7FdP9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=trESQHTdNNi1IRrRYY1bUSxbduSF7ClJHl5f7/akN8HswVanmBZcr+9tK2atgJM9jlKbGgcrXV5ubqeg1yhYHX0CbyV4mEyVJPWu1abTRWe0+JKD/HCWH78DdUwzeym1v0IxbjDdL739CSanddZKGbBXKOHPlVN7PwN+EVMQkMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KaMHu02J; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KaMHu02J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776359851; x=1776619051;
	bh=7ZAUdCEyZ8HLp1qraJ9mxIpsgR5FMuWZgcA1P+EIAnA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KaMHu02J4q/C3ZY4Arv1tEAW3VBUGfPESDWJ3poeBh1WNqqYdZoypJz8Xrf92PgCz
	 55cd5iJpUavyH+9TA2BHO9zvHwQ4vOiT11uGH6MhfVc2K6isP/Iy9UpPcS/z64cr8G
	 pIw2GwyBHzc4F9im/GVMcQL8PNR4pCJ/xdhB8HNqT4w+sxpNOwGdBisWXN7MyZGGPy
	 +8Irp41qLLHS+NE57ZInt3R9ZCxnrG2gpcgF0fhOjLWGBLe8kqFWCDIq0eJq6VsdNU
	 CaQdwsx6zNcgmDL7BwHnioMnykPIvq3fHT7Ko/xkHij9kjqXh1IPZCP7cqH46gdOoh
	 12Be/Rkxui78Q==
X-Pm-Submission-Id: 4fxPpL1d7Hz1DDrM
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/4] drm/tyr: implement GPU reset API
Date: Thu, 16 Apr 2026 20:17:26 +0300
Message-ID: <20260416171728.205141-1-work@onurozkan.dev>
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

This series is based on Alice's "Creation of workqueues in Rust" [1]
series.

Changes since v1:
  - Removed OrderedQueue and using Alice's workqueue implementation [1] instead.
  - Added Resettable trait with pre_reset and post_reset hooks to be implemented by
    reset-managed hardwares.
  - Added SRCU abstraction and used it to synchronize the reset work and hardware access.

3 important points:
  - There is no hardware using this API yet.
  - On post_reset() failure, we don't do anything for now. We should unplug the GPU (that's
    what Panthor does) but we don't have the infrastructure for that yet (see [2]).
  - In schedule(), similar to panthor_device_schedule_reset(), we should have a PM check
    but similar to the note above, we don't have the infrastructure for that yet.

Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com/ [1]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/29#note_3391826 [2]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28

Onur Özkan (4):
  rust: add SRCU abstraction
  MAINTAINERS: add Rust SRCU files to SRCU entry
  rust: add Work::disable_sync
  drm/tyr: add reset management API

 MAINTAINERS                          |   3 +
 drivers/gpu/drm/tyr/driver.rs        |  40 +---
 drivers/gpu/drm/tyr/reset.rs         | 293 +++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs | 155 ++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs           |   1 +
 rust/helpers/helpers.c               |   1 +
 rust/helpers/srcu.c                  |  18 ++
 rust/kernel/sync.rs                  |   2 +
 rust/kernel/sync/srcu.rs             | 109 ++++++++++
 rust/kernel/workqueue/mod.rs         |  15 ++
 10 files changed, 607 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/reset.rs
 create mode 100644 drivers/gpu/drm/tyr/reset/hw_gate.rs
 create mode 100644 rust/helpers/srcu.c
 create mode 100644 rust/kernel/sync/srcu.rs

-- 
2.51.2

