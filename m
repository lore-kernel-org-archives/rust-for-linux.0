Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D937CD32
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Sep 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209571; cv=none; b=bTuNYGp0e/ngf6CjNgZEdoIP1WvkZYJB0bQX54S5wF7gkDl+BKiarpcF3j+Jk5UdYY4kifOM8WSGA2wwcIAV9GPkhlCK7VALtpCVlSJodWWl0LFCZCHGYyZwn3QhafmHzW3+GS9HIT3XtrpmXaX2nlpujOFbDcuSWa7WQ4ZNdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209571; c=relaxed/simple;
	bh=dEvFralNB3TbE490Ysei/yvIZptOih5GWsRJ7ZwgI+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JH6zGNswNZdG5dhM1Xmsf8UFAN93abh7NXyMa+zYGhog6TqM1aafCgjtNlQJg19DpNSsPtooGW1PymUREvLKixC6PM46fVA/gFI0VowCb13XwudDqyvKkzFmAYF807Zt0mnfki6BEiR0RgVL8rduMHDz8Sr66LUF3zEs80HwEFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=mSHmY8h9; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mSHmY8h9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1789209557; x=1789468757;
	bh=B9i83SiDjSpKwhV2wxvRP5EbKHjuMpjaXeYGQMHf3n4=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mSHmY8h9Li4Ybz4qZEwkn91WDhI0o3R77ylYtanYzjfm8RwYZ0ARK8o5WeS7UQhIu
	 ExI0cKIJU00QvNw7WIWoy0mvSqh5ztdoKrukeQT9x/XdRXIcdH8UtWDu4iH4x3okXB
	 MW9VTyJ9zQBDQQYm/hXmEeoOE/3b73RN0d/McLgSjHL+NlrpiRC4ykOHgBCGv+Edx1
	 OULl0YapjTBldczdunh50LV0Eh5HKg0HCyBGTgtxCsKnh+gkqVaiTIIgnreLCZ6h54
	 ORqbJGLMJ6WoHYgCxhtJJ2xELPhiWX64z/4EcCZmP9hGeIAmTlsKAHE8is78hBjotf
	 AR1sCggaAMHjg==
X-Pm-Submission-Id: 4hhnw23BYPz2SdJY
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
Subject: [PATCH v7 0/3] drm/tyr: GPU reset infrastructure
Date: Sat, 12 Sep 2026 13:38:56 +0300
Message-ID: <20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev>
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

Changes since v6:
  - Acquire the hardware gate once per address-space operation and pass
    the guarded iomem reference to helpers to avoid deadlocks.
  - Clone the gate Arc before acquiring a guard so mutating address-space
    helpers can retain their &mut self receivers as suggested by Daniel.
  - Collect review and test tags.

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
 drivers/gpu/drm/tyr/mmu/address_space.rs |  90 +++++++-----
 drivers/gpu/drm/tyr/reset.rs             | 242 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs     | 106 ++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   1 +
 7 files changed, 436 insertions(+), 93 deletions(-)
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
