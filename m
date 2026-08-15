Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A13DBD49
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786789536; cv=none; b=thqKWI4yRYkAW7OG4J7YsOEMYTwgIxgzMb62KYA7eivSZCgVhHqZm7iDM6WPk+TAF9tVfLehHerW+A6wjsUmPhtB3EzHw42WzuN9j19w7QLnv719jLrv//oIDmKAFeZLsAVXJCmwbEf7BMhS5XP6p4NuAknAba45FZGbSqhp9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786789536; c=relaxed/simple;
	bh=BXlJTNnDdtupgendzMDeJcW0MLXdjsgW+ZGjDig7Qx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OQbat5ueW7m6iaCWU7ILmKLduUzhgRZN0VZ/2pWhv+TYknraWXUP+NoQFzSJ2mBukMZqmwsgXXlbJFScTQClve4oGiZ4vOzBPpiMaNZ7ZYiluAoELninC14U+9cg0ePYsWoaqvkt8i33gtwoq0xYE5ceA3j9npL6R4sEZ4LwM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=XBpg2vXM; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="XBpg2vXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786789522; x=1787048722;
	bh=Ch3h5EXUnpKlpxmhyEmT2bdi9jXmVtmNTyU/FIKOMuE=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XBpg2vXMOkMk9BKwc0VI2UIwLaNiZjPjrLbhw5OkOufGWJytdHV4PS5CLmHxICo1r
	 PIBNOxRojSlq0n8e/fRv3UsbRcO8lVsTOQq1hYMtoDDmLi2UhNFRJr2bQViYYWZPcP
	 19xX3yPDOkKHDgQ7r0p3ziPDCa0xcfF7udG6EDTpLkWhhoj8XN00uHRKoIpCTRL23H
	 8xRMnr1v1jpUziDKQW5+78Et/a3oGVnzP9xu5nZy8DEoDcm5ixHMTdgFyBsY/sXGh2
	 7BXxpgkaQJN/qKT4TwzkUTxQKZdxxiieaDeO5f7uNhZ5qU/oHSKn0/97JsxakNm6fp
	 AhMkP909i3Kuw==
X-Pm-Submission-Id: 4hMZws3GSKz2SchM
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v4 0/4] drm/tyr: GPU reset infrastructure
Date: Sat, 15 Aug 2026 13:23:56 +0300
Message-ID: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
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

Based on 'commit 53441a9cae3c ("drm/tyr: program CSF global interface")'
from tyr-for-upstream with the following patch series on the ML:
  - rust: workqueue: add cancel_sync support [1]
  - rust: add SRCU abstraction [2]
  - rust: workqueue: add ScopedQueue for lifetime bound items [3]
  - Creation of workqueues in Rust [4]

TODOs:
  - On reset failure, we don't do anything for now. We should unplug
	  the GPU (that's what Panthor does) but we don't have the infrastructure
    for that yet [5].
  - In schedule(), similar to panthor_device_schedule_reset(), we should
  	have a PM check but similar to the note above, we don't have the
    infrastructure for that yet.

Changes since v4:
  - Moved iomem behind the HwGate.
  - Renamed the guard names in hw_gate (after the iomem patch, I realized
    the old names were confusing).

Changes since v3:
  - Dropped Resettable, ActiveHwState, pre/post-reset hooks and typestate.
  - Removed ResetState::Enqueueing and teardown spinning.
  - Replaced fail-fast try_access() and epoch tracking with a blocking
    hardware-access gate.
  - Used b4 for the prerequisites.

Changes since v2:
  - Replaced Work::disable_sync with Work::cancel_sync.
  - Used type state pattern for reset stages.
  - Using ScopedQueue with device lifetime instead of a static workqueue.
  - Removed SRCU patch from this series.

Changes since v1:
  - Removed OrderedQueue and using Alice's workqueue implementation [1]
    instead.
  - Added Resettable trait with pre_reset and post_reset hooks to be
    implemented by reset-managed hardwares.
  - Added SRCU abstraction and used it to synchronize the reset work and
    hardware access.

v1: https://lore.kernel.org/rust-for-linux/20260313091646.16938-1-work@onurozkan.dev
v2: https://lore.kernel.org/rust-for-linux/20260416171728.205141-1-work@onurozkan.dev
v3: https://lore.kernel.org/all/20260708114358.957305-1-work@onurozkan.dev
v4: https://lore.kernel.org/all/20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev

Link: https://lore.kernel.org/all/20260617131731.145337-1-work@onurozkan.dev [1]
Link: https://lore.kernel.org/all/20260613065348.96750-1-work@onurozkan.dev [2]
Link: https://lore.kernel.org/all/20260617144645.253444-1-work@onurozkan.dev [3]
Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com [4]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/29#note_3391826 [5]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
Onur Özkan (4):
      rust: workqueue: impl Send and Sync for OwnedQueue
      drm/tyr: clear stale IRQ state before soft reset
      drm/tyr: add GPU reset infrastructure
      drm/tyr: put iomem behind the hardware gate

 drivers/gpu/drm/tyr/driver.rs            |  61 +++-----
 drivers/gpu/drm/tyr/fw.rs                |  16 +-
 drivers/gpu/drm/tyr/mmu.rs               |   9 +-
 drivers/gpu/drm/tyr/mmu/address_space.rs |  49 +++---
 drivers/gpu/drm/tyr/reset.rs             | 252 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs     | 102 +++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   1 +
 rust/kernel/workqueue/mod.rs             |   8 +
 8 files changed, 421 insertions(+), 77 deletions(-)
---
base-commit: 53441a9cae3c4be552fa8aefa6e61b0f1bceb8a5
change-id: 20260813-tyr-reset-impl-93e951f996b4
prerequisite-message-id: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: 0bf6ae4abcef7090d0e48921d6ec627a59dc6a7a
prerequisite-patch-id: f2bd17b7ba9f4626ddec56fec8e108872ddc6af1
prerequisite-message-id: <20260617144645.253444-1-work@onurozkan.dev>
prerequisite-patch-id: 5b966d09cfd455dd09fb0911d174b123efa02a16
prerequisite-message-id: <20260613065348.96750-1-work@onurozkan.dev>
prerequisite-patch-id: 9e1efee190d212ba1b01cd0acb5a4357e0b4da42
prerequisite-patch-id: 26aba035f4d1e212fa6ea7078095febefff5c5ba
prerequisite-patch-id: ffa25d5aadec4c04589af2bdd59a9c022f0fc9b0
prerequisite-patch-id: c2e05a4ac9d665d331952b291a622df6be673e41
prerequisite-patch-id: c14a4bd8a68b045356d61f7fa94690bd037ad08b
prerequisite-message-id: <20260617131731.145337-1-work@onurozkan.dev>
prerequisite-patch-id: b40e7a218c4e0467933e83c45b09eb78c7ebace2

