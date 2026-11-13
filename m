Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580418;
	b=uxYRKedMxWln2nIB6t/UEwptE9433R1V5n4qsYebwwKWLHxplEyMfRLONhqxH6VgPtUg
	 yOLqr76n6zO+2dOM3tIs0EhykEsIwg1qrSuGKMdubIP0xko7L6RNBnq1ETW0H7tIdGNHK
	 n6iSxoJNz8e5Fx2L4jiCGXtVfKpYXhFQ87HE4Ob3m+4dsBpnI92X4VUVyLlfQl/XynId/
	 gK5v1goi64h+wBl5lCZ7auZdUNuPd0hqnV/Q8fD2dHuI8JKeCB77y8a96rLbXTeBM2EqG
	 R2KuWX9ZLOkWeT9Pvk6C9NTAopRTsheI2lsYI9DFxFmSIp6NBuTAyEMsFmffuqUSLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580418;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:X-Change-ID:
	 Content-Transfer-Encoding;
	bh=u9IuEf6rp7xFv52Negp9qgPJMgK728e5qtDT6H/5DDw=;
	b=eYecR+U6mCOjE+p154v4Twcmyg0OOUfizuxannfec57GxwWt5JYrFDYSE1UQkEUHlbVB
	 lMJ4Knl7M21alrvtySvOQPc7jy+GKkQKOzKgvoUcjSyr4oyi70kp87Ja45YGxNlLwQSHm
	 TGNNy6niEOcgDk1Dwrxt2rfgMRpU4OAUU9ZNUIY5nT1oLZufjzM7XaFJscYosiK26N67f
	 u1ivfJo/29/wpv4mRv12dfiHK9F0ozc6wATU4ZMqM6yRjz83U/E4inzV9cjcKvbAm5JHs
	 xQ6lYwHs0McL1yywfbHVtQwI9lrhvahc9aElq5CIzXmb1P6uwy00PRbH9o7SLD3flBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=cMQuDfCL;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68047606A885
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 14:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68047606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=cMQuDfCL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1794580415; x=1794839615;
	bh=u9IuEf6rp7xFv52Negp9qgPJMgK728e5qtDT6H/5DDw=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cMQuDfCLMPojTaZmy7BIYBjTNVrEZs6+wy7Fr916opB1SsSuURQc9ATDEfrq1+JUj
	 OiUlmn6AqD0hN9NSF82gqR+4MvmvDPh3CC4hrTfDFyymSjBdC2zYONM9GIp91zYX4K
	 mrJLL67h2a5aJXQCYcUwTC07qQ4KXoq8O6/UnqwTkBf3+VzJXktds9G/lm9hRWZvZP
	 bW5/8l8NtcMmfd77seLtPuRnkNnZijsI3k4Kipe8H69dp80t2VJPfeAzc7KbZUeQDO
	 /ZILxsY3JRp7NFwW0gEDq9ATxGAtxavycEB5j6CAzL32COqgnKBzesLSPA4NO6XbgV
	 8Vy5N1RCzhOvg==
X-Pm-Submission-Id: 4jR09l0nhMz1DDXX
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
Subject: [PATCH v8 0/3] drm/tyr: GPU reset infrastructure
Date: Fri, 13 Nov 2026 17:32:25 +0300
Message-ID: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev>
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

This version is based on drm-rust-next commit
cc0e99fad239 ("gpu: nova-core: add support for GPU timer block. (v7)"),
with v3 of "workqueue: OwnedQueue and ScopedWork" [1].

Changes since v7:
  - Rebase against drm-rust-next and workqueue v3.
  - Add a TODO to consider embedding HwGate in platform data.

V7: https://lore.kernel.org/all/20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev/
Link: https://lore.kernel.org/all/20261020-rust-workqueue-v3-0-ea7c74d02068@google.com/ [1]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
Onur Özkan (3):
      drm/tyr: clear stale IRQ state before soft reset
      drm/tyr: add GPU reset infrastructure
      drm/tyr: put iomem behind the hardware gate

 drivers/gpu/drm/tyr/driver.rs            |  63 ++++----
 drivers/gpu/drm/tyr/fw.rs                |  16 +-
 drivers/gpu/drm/tyr/mmu.rs               |   6 +-
 drivers/gpu/drm/tyr/mmu/address_space.rs |  87 ++++++-----
 drivers/gpu/drm/tyr/reset.rs             | 244 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs     | 106 ++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   1 +
 7 files changed, 441 insertions(+), 82 deletions(-)
---
base-commit: cc0e99fad2392ac479e2594b88fd947a2f2d9c33
change-id: 20260813-tyr-reset-impl-93e951f996b4
prerequisite-change-id: 20261012-rust-workqueue-658cd0fbe770:v3
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: 0bf6ae4abcef7090d0e48921d6ec627a59dc6a7a
prerequisite-patch-id: e19d2e11fc6c6fc121d65c8502bfa557e1dfc5ec
prerequisite-patch-id: 89eb57a43e71850c447ea7cb7051fb36066ca329
