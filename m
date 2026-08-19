Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E53191CA
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165213; cv=none; b=WshNfKnoXHdPs4D/lJtIk0t54yajKhL0kKDe1IB7y0eARYSvriuTrZIWiYbcv28NWY/6+gSsExtWZxkt6OlDNiU/CVPoZbxZhIUIpybbqtXCqr11+LeyE5eYrCgvf8mVBkgUaQvg8rOqmZU49xZ7uboX/lX5xssEoJK3irv9kiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165213; c=relaxed/simple;
	bh=lqS66zZQa7BN2FFtjvnO0NUx9o7uFkJGZPTMpOP+p0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ekj/XD7eqtRqG7G8TWtgf2C2klbMxGPbEsjoeB6bMnB4ot9irJTaTe7/JeW8cTvqsjIydNG4JvYDeYu0cIEw2l6Yht2qcspI5493FjGlCPXtffPC5VP2URh3VcgLWve1q6H5NBWG5kOsJoBCLBGx/jen64ZgeHU/VDdMwFuPTYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=bo62kqXa; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="bo62kqXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787165206; x=1787424406;
	bh=CZyq4+sjUzGKI8A2ogOec7/Sr2Kg8h1cVESqQ7/8ALQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bo62kqXas7WuNIqfSMi55USfWLxTps0d5Qkb/Si0xo5mTk1rgrsbqdprSAveh1QQO
	 ejtT4eBEoXLrlXNO1XT+OtXyi2HVEtz14qpKzEqk30kMpiTqDHJXZMgH/dNItpGrV5
	 aIMBw+jZmSkHIGutM64hsTd9XlVqoXkUaIiQw2/uALV/yh9M+Ck1A/AQoYuakb1fyr
	 Prayo92Xp0ESxAQPgYdz8OozozXPriBTuiJPmuoJ+QNMXQw0HzZsSRyIdsujEtPnBl
	 PheMQimAoJSWi0uxqPU2t+bHwV63OVY8d2DzXtsR3CZNGNf+RN4PT1NW/uRNDYLZ5B
	 UF8k8fisRUTJQ==
X-Pm-Submission-Id: 4hQFsc09TPz1DDLj
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
Subject: [PATCH v6 0/3] drm/tyr: GPU reset infrastructure
Date: Wed, 19 Aug 2026 21:45:38 +0300
Message-ID: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
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
  - rust: add SRCU abstraction [1]
  - rust: workqueue: add cancel_sync support [2]

TODOs:
  - On reset failure, we don't do anything for now. We should unplug
    the GPU.
  - In schedule(), similar to panthor_device_schedule_reset(), we should
    have a PM check but similar to the note above, we don't have the
	infrastructure for that yet.

Changes since v5:
  - Use ScopedWork instead of a separately allocated Controller and its
    open-coded cancellation.
  - Rename reset-internal lifetimes.
  - use dev_dbg!() instead of dev_info!().
  - Use Danilo's workqueue series [2] which already includes OwnedQueue
    Send + Sync, ScopedQueue and ScopedWork.

Link: https://lore.kernel.org/all/20260613065348.96750-1-work@onurozkan.dev [1]
Link: https://lore.kernel.org/all/20260807165252.3849875-1-dakr@kernel.org [2]
Link: https://lore.kernel.org/all/20260708114358.957305-1-work@onurozkan.dev
Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
Onur Özkan (3):
      drm/tyr: clear stale IRQ state before soft reset
      drm/tyr: add GPU reset infrastructure
      drm/tyr: put iomem behind the hardware gate

 drivers/gpu/drm/tyr/driver.rs            |  65 ++++-----
 drivers/gpu/drm/tyr/fw.rs                |  16 +-
 drivers/gpu/drm/tyr/mmu.rs               |   9 +-
 drivers/gpu/drm/tyr/mmu/address_space.rs |  49 +++----
 drivers/gpu/drm/tyr/reset.rs             | 242 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs     | 102 +++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   1 +
 7 files changed, 406 insertions(+), 78 deletions(-)
---
base-commit: 53441a9cae3c4be552fa8aefa6e61b0f1bceb8a5
change-id: 20260813-tyr-reset-impl-93e951f996b4
prerequisite-message-id: <20260807165252.3849875-1-dakr@kernel.org>
prerequisite-patch-id: 4275f7d6e3cf96d61221d47f2398ebfb896db0c7
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: 0bf6ae4abcef7090d0e48921d6ec627a59dc6a7a
prerequisite-patch-id: 8dc24064e858240a6bb5411a261a987a7eae3fad
prerequisite-patch-id: eefbd4a72ed6da0083e20811882738cc3b05604f
prerequisite-patch-id: 7502236d334b13c547a8b47f0be9bf7171b5ca6b
prerequisite-message-id: <20260613065348.96750-1-work@onurozkan.dev>
prerequisite-patch-id: 9e1efee190d212ba1b01cd0acb5a4357e0b4da42
prerequisite-patch-id: 26aba035f4d1e212fa6ea7078095febefff5c5ba
prerequisite-patch-id: ffa25d5aadec4c04589af2bdd59a9c022f0fc9b0
prerequisite-patch-id: c2e05a4ac9d665d331952b291a622df6be673e41
prerequisite-patch-id: c14a4bd8a68b045356d61f7fa94690bd037ad08b

-- 
