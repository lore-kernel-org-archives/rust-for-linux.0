Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337036D4E0
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270290; cv=pass; b=q6+c23pA0LaS5578vnvqyqmf1/mCF1KAPMqSZKWigtlFBwyGNSmzKzL5+fJOUGRHn9RAFqNP6dSVEno1l84r/hm7E8Z95r/J/iZQJMYcvm92peSPFlkvz0PcgifC3jau+tFMH4wyvl+EJzxaWn+oydREkGMgUpqicGVLeSEEDtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270290; c=relaxed/simple;
	bh=z3rmK+Tri6YDD4C2TSCRbypDHH0uWN6eL3KzcjsG8po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iNOJlm/6yEXw2F9cA/M6BG6+yCGEam65+FJaUf1FPvR5RWYq6fnjRlbT6KbWaEu7ANZUq7wPiVSTzywsQLe1nw4smIpgjq75gC/vKzdHsammMxySK+Pmydqi0dcx/b6p5JHzUfSmO1so7og+0VGHDR6ovV6KdJ/WfUr/TTey7FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=ZSklmOHg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="ZSklmOHg"
ARC-Seal: i=1; a=rsa-sha256; t=1773270264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eRyUu54qCLa+h98tNXW7uJVgmnEYgqeNyrybQ/QcGukILM4Z70RzRbEijujuJYXODloSaZt4jjk4mjvljGzCneEyNlcxbsXkppyXDWHQCxTq9ZeDiYOXZwyFDyR2SCTl7gS9Q5an/HQq9gMeH8WDlWyWTJYM/h5C3cAl/R/2Jt4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wbj/vUuubjkTwZ1s+U/xf1asRmAUCKpgh4SoFzbZXOE=; 
	b=AYLfJon5aIvAfklWUQABox9uT/v3dShVfMZ/c7rf3f4dxw6AXOWLEDKOYiOZ0VxwgAkLh9ax3VejjnH8QR2C5q4Hs75DwjFk99P8qk0EEe7Snhg7x7M61ngOT4WlYOKPcNdnz3PhGrCuqv4QBLMRIe45sTyGLr0jO+hGDpKPVok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270264;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=wbj/vUuubjkTwZ1s+U/xf1asRmAUCKpgh4SoFzbZXOE=;
	b=ZSklmOHgjQkkroIF8mshPIMd9jWgBET986yeSSc/HHkMQaatGSgWFTtgCniTPmxW
	ZpMunv2Zff7gDtA4ZmrC8zkJ2ZSzos16oCkunv3pT0S+mgbxSVlfQwbqnTW3kUomulQ
	AJnamjjTSicyxibBp3yX+0UqrB+dc3791enya+aE=
Received: by mx.zohomail.com with SMTPS id 17732702616444.146161533229929;
	Wed, 11 Mar 2026 16:04:21 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 0/5] drm/tyr: Use register! macro
Date: Wed, 11 Mar 2026 16:03:57 -0700
Message-Id: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN30sWkC/x3MMQ6DMAwAwK8gz1hKUlKVfgUxhOCmHoDKBlQU8
 Xcixlsug5IwKbyrDEI7Ky9zgasriN8wJ0Iei8EZ9zQPa3FocD0ENyUUSqwrCU4hyoK7wzjGV2u
 9N40PUIqf0If/d9/153kBwJT9/24AAAA=
X-Change-ID: 20260311-b4-tyr-use-register-macro-v2-cdc89155045a
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.2

This series changes the Tyr driver to use the kernel's register! macro
for hardware register access, replacing manual bit manipulation and custom
register structures with a more type-safe and maintainable approach.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
This series depends on:
[PATCH v8 00/10] rust: add `register!` macro
https://lore.kernel.org/rust-for-linux/20260310-register-v8-0-424f80dd43bc@nvidia.com/

Changes in v2:
- Rebase on v8 of register! macro series;
- Add documentation;
- Remove manual functions to get address bits;
- Revise gpu_info() to use macro;
- Revise l2_power_on() to use macro;
- Set interconnect coherency protocol with macro;
- Separate commits for each register page;
- Replace HI/LO pairs with 64bit registers
- Order registers by address;
- Remove doorbell clear field from GPU_IRQ_CLEAR;
- GPU command is redesigned to accommodate multiple layouts;
- MMU register bits corrected;
- Use UPPERCASE for register names;
- Move the consts to impl block for registers;

---
Daniel Almeida (1):
      drm/tyr: Use register! macro for GPU_CONTROL

Deborah Brouwer (4):
      drm/tyr: Set interconnect coherency during probe
      drm/tyr: Use register! macro for JOB_CONTROL
      drm/tyr: Use register! macro for MMU_CONTROL
      drm/tyr: Remove custom register struct

 drivers/gpu/drm/tyr/driver.rs |  32 +-
 drivers/gpu/drm/tyr/gpu.rs    | 213 +++++-------
 drivers/gpu/drm/tyr/regs.rs   | 785 ++++++++++++++++++++++++++++++++++++------
 3 files changed, 792 insertions(+), 238 deletions(-)
---
base-commit: 91c02cfa16427b078c8a74f2b96123b579fdb07f
change-id: 20260311-b4-tyr-use-register-macro-v2-cdc89155045a

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

