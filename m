Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B94D9917;
	Tue, 21 Jul 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646936; cv=none; b=f0PBs8ImSqxq5PGCZVKsdUa5SiJDhlsHezGjBkfeUCaOeagV2/dC26I/93IoDEuDSSW15UIIJBFaxnETxwLLNZAe7ALEuqWpEe282CS3eA7yVYygggbwQ6v9ANV3KxaBAQoF+WU7SFAFTq5q3zEEJhjaP+ov6SuagJZ17WO7Q2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646936; c=relaxed/simple;
	bh=Hasvze30jososRFzbjqNmH2jMj7kKk3wRulieAc4wKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ahGzBRLPFeUc57NlD1zRuEdMfG7YDB7mHLNECLwc8/mhE1tRNJoQSc0Mz6t5Vm8rt38DFw76Et3iqgryJyX/e2GxfsPKluAwuBlIozbmkABIvsxbe6gX07EcYnkJ3LVlF9xK0zdSLKbNDHt1z9J47N98ffOY5RP88ItTy2jUdIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZTyEBTh5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZTyEBTh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784646933;
	bh=Hasvze30jososRFzbjqNmH2jMj7kKk3wRulieAc4wKc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZTyEBTh5xlPUidppa/l6GSJcE26ze9eHv3vOsJhKnFR0AnEC7YX1vaSSuIfxkaYaH
	 Ep8HRFZ0vtztRp/Ps49b4CO6ythnMswEi7kXd5S2a23GCnq/uPwkmOJSCzn1FIsMqV
	 otlXDwbbfd0YczTyTpMPS/2ppc8jc82gXbBNXevgxnnD1TfzZOx/jtoh+eEIlwRCQ3
	 QIpyfLnTE3EXCCx+tERdc8fonhnSI80/V6Y38/QbbSjXCj6dIOSfZqItVWq3k24oWZ
	 wWeYR+KO0bZ8U2+gR4HU4oXLRoMkGIM54rNf1k/oOq1VG/ZtZ25ABvCONCQm6BVsKc
	 1pZ1p4yglPWig==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CBF417E0564;
	Tue, 21 Jul 2026 17:15:32 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	deborah.brouwer@collabora.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 0/2] drm/tyr: add Job IRQ handling and GPU event wait support
Date: Tue, 21 Jul 2026 17:14:21 +0200
Message-Id: <20260721151423.444175-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series follows up to [1], which adds support for firmware loading
and MCU booting to the Tyr driver. The changes included here were
originally introduced in v4[2], then dropped to reduce the scope of the
series, and have been adjusted to work with the HRT (Higher-Ranked
Lifetime Types) driver architecture recently introduced.

The first commit adds a new Wait type, wrapping a CondVar and a Mutex,
for sleeping until a condition is met or a timeout expires. This can be
used to wait for GPU-driven events.

The second commit adds a threaded IRQ wrapper for the firmware Job
interrupts, used to signal events from the global CSF (GLB) and Command
Stream Group (CSG) interfaces.

These changes will be later used to wait for global CSF interface
readiness after firmware boot, as part of the CSF firmware interfaces
support that will be submitted as a separate series.

This series is based on drm-rust-next and depends on:
- [PATCH v7 0/7] drm/tyr: firmware loading and MCU boot support[1]
- [PATCH v2] rust: irq: make Registration compatible with lifetime-bound drivers[2]

[1] https://lore.kernel.org/rust-for-linux/20260713-fw-boot-b4-v7-0-afd8dc1494dd@collabora.com/#t
[2] https://lore.kernel.org/rust-for-linux/20260719153631.559341-1-dakr@kernel.org/

Deborah Brouwer (1):
  drm/tyr: add Wait type for GPU events

Laura Nao (1):
  drm/tyr: add Job IRQ handling

 drivers/gpu/drm/tyr/driver.rs |  75 ++++++++++++++++++++
 drivers/gpu/drm/tyr/fw.rs     |   4 ++
 drivers/gpu/drm/tyr/fw/irq.rs | 104 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs    |   1 +
 drivers/gpu/drm/tyr/wait.rs   | 126 ++++++++++++++++++++++++++++++++++
 5 files changed, 310 insertions(+)
 create mode 100644 drivers/gpu/drm/tyr/fw/irq.rs
 create mode 100644 drivers/gpu/drm/tyr/wait.rs

-- 
2.39.5

