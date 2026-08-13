Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2118B402444;
	Thu, 13 Aug 2026 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617880; cv=none; b=OCKXUUwTBj/f/HQvKSRj75+BV7yN3WUPZwsAQ22RQED06Ritq0zU3Nml3ykB/8DgPniQJVTEL1N+L58C6ly9aZqcT1Af7UXOUmW4hb7WjIWiXYpD6BxMWRcqZMu43smXCNCV78d7ixRo/yMzP3fVCw0tEPy3fEYPZTqrF4+lZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617880; c=relaxed/simple;
	bh=ZzdSFT5vfsUpgWJVePLRuolLd4ccVuRF3mPKzZatAn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K0dDQbiuyDnpkLtK/oYbid0z3oRl+BKgFxRmjlaVRV+D+dAxesMfY9K+e8GQ0blq7/h1ffAD5xCWROUm8M1LX7YFI9ZmlmWNhfRYS46UQhy5CYMA5WgyHzksinBFKNmNNSSaoAUftSiI1/i9+CrM9VV/QMl4IXxkRqEmi5psu7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=F8IeOX7u; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="F8IeOX7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786617872; x=1786877072;
	bh=oXnyXBetNsFigV4wWUyWSSxiW9A1MlKldbe+75RedRM=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=F8IeOX7udeF6emtZipnEScdUeBfiIkJLwamdyesk8OytQSedV2lTtYLrzHuU72AfI
	 z5XvZN18MdO6qi6Peq8ZL4N1R2lTNrzsZNrIEq5FVx+5DEabsmJq6fCVPJ1q9DklTN
	 6jP1pAKljSlUi19C0KXWvmomAomoupZ6j6hrJ6evwv+0NRf4keZ8Kp2EhOYEe6cTCn
	 q0Q1z8iwsX0Ebnl3uj5nAdUTg/Gvs/9Cdq7CQnZKQP52ObWCOqB9BE/tJuBQGVAvnq
	 UxAmqcEbXIMuaOVHFVUPUQaVgDzlImgasxw600htl4i1y8FljEsmn53nsDSgXg6lMh
	 taZsQvnBcm6Kw==
X-Pm-Submission-Id: 4hLMRy0K0rz2SchF
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
Subject: [PATCH v4 0/3] drm/tyr: GPU reset infrastructure
Date: Thu, 13 Aug 2026 13:42:03 +0300
Message-ID: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev>
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

Link: https://lore.kernel.org/all/20260617131731.145337-1-work@onurozkan.dev [1]
Link: https://lore.kernel.org/all/20260613065348.96750-1-work@onurozkan.dev [2]
Link: https://lore.kernel.org/all/20260617144645.253444-1-work@onurozkan.dev [3]
Link: https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com [4]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/29#note_3391826 [5]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
Onur Özkan (3):
      rust: workqueue: impl Send and Sync for OwnedQueue
      drm/tyr: clear stale IRQ state before soft reset
      drm/tyr: add GPU reset infrastructure

 drivers/gpu/drm/tyr/driver.rs        |  39 ++----
 drivers/gpu/drm/tyr/reset.rs         | 260 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs |  79 +++++++++++
 drivers/gpu/drm/tyr/tyr.rs           |   1 +
 rust/kernel/workqueue/mod.rs         |   8 ++
 5 files changed, 362 insertions(+), 25 deletions(-)
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

Best regards,
--  
Onur Özkan <work@onurozkan.dev>
