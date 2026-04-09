Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6878BE9
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757148; cv=pass; b=Maw0ikUrIdF5kFSjeglJkO1HuvpHS6apZsPL2Rv9EaslQ3tZZwb6oodxuQNDRhDECV51mU9u+J5aNZ599l/vnCsVUKmV7Ua8heiBHM96lFleq8vNxF6o2vjbtTf81EoFS6ID9HA+K+5nk50lfgvFvfKLozjFVxBX5qgdiGIAHQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757148; c=relaxed/simple;
	bh=KdxG1iLbwg0HKaGE0texBSoMH/EAOphLCYcxUdCcBPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qxjH2WcNO0VlMTBCyQ2iRqoSMiYNs0ZPj33kASNsZqIkHS0au+DeebPvsWPBfkHEyCA1SE7RarpBMXvy3O8ix0415UWegESZd4YonBNbj9SfuJhQviI7gzay2zWcbBB+iuu83X5ZDvI9+V2kfiNDxVYz3bvB70p9U9IeStYJZxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=aVOjcR2q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="aVOjcR2q"
ARC-Seal: i=1; a=rsa-sha256; t=1775757123; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fl3aWVPzaAhHTFnZD/VfKfC0FTNFM0BhmIHW/tzn6xrt9AidG8qSNCZ8A08r5nxD5tjYD8DDL+9x7uG4uJuahYikTGq/FD3W8/L/F3KzDiISUfOuVv0s0IVFGvWDl7G/wVedVJmhMHr44Zn7H3qmVsGXzjv9urIs8rzec34Eq9s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775757123; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fa4z3SI+tspRUGsZVXwsye+edIsVZI+yLEN4HCu0WDM=; 
	b=lNDF8yWHDq4IWegxrGR+jty2RdPTh1JrrBPhGs/0AvBb2bCfs2aW/qKwb3bB2DSqXBleEcVDwtEK+2uzJ5VrcQtEylnMuAE6Z8ZJChpgv6iwkhtjYZxVxuwfW/7sgIhsLy5oEc5TlnH0+SMG0azHpafGUCMwqM3QJVBevkwilSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775757123;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=fa4z3SI+tspRUGsZVXwsye+edIsVZI+yLEN4HCu0WDM=;
	b=aVOjcR2qlQYHQXASOBLIDmU9bhC2qNOZysWABnKIAc3gwZLTADMkYXk8J3oEQm5I
	b4aADwI+/xyqmhmflcRCYlIfMyu+cxpV010Q8kVYAVw7wjhtA1zTWat52GSViNDH4RL
	fPKI1fibY+bjVJn9lGN+m5OTvtn5bbmUolQN8gdA=
Received: by mx.zohomail.com with SMTPS id 1775757121080757.8719388888437;
	Thu, 9 Apr 2026 10:52:01 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v5 0/6] drm/tyr: Use register! macro
Date: Thu, 09 Apr 2026 10:51:23 -0700
Message-Id: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqEMAwA0KtI1gY6fkpnriIuqk01C3VIVBTx7
 haXb/MuUBImhV92gdDOysucUOcZ9KOfB0IOyVCYwprKfLGrcD0FNyUUGlhXEpx8LwvuNUZX2hg
 +wXnrIBV/ocjH2zftfT+6iu2JbgAAAA==
X-Change-ID: 20260409-b4-tyr-use-register-macro-v5-f836fd1d8a68
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Boqun Feng <boqun@kernel.org>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=KdxG1iLbwg0HKaGE0texBSoMH/EAOphLCYcxUdCcBPM=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJnXnzssDVyS2aD9brJEwN7f69guaeYmXPq67gBH8Tr26
 Onnb6za2VHKwiDGxSArpshy1t6oR7zqvZHu/P/NMHNYmUCGMHBxCsBE5H8xMmyMfTfd2/uR6YX/
 6p6n1Rc8tn3TH9bmcvSOgq30wmMe394w/K97a1932izf3/9+Sb3BomMnX4R//nfmT8IPvZn/7ym
 33ecAAA==
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

This series changes the Tyr driver to use the kernel's register! macro
for hardware register access, replacing manual bit manipulation and custom
register structures with a more type-safe and maintainable approach.

---
Changes in v5:
- All 1-bit glb fields use => bool.
- Convert gpu_info_log to a method of GpuInfo to avoid redundant MMIO reads.
- Fix typo in the field name for SHADER_PWRTRANS_HI.
- Add details to all commit messages.

- Link to v4: https://lore.kernel.org/r/20260402-tyr-use-register-macro-v4-v4-0-96a8d42f8bd1@collabora.com

This series applies on drm-rust-next
tag: drm-rust-next-2026-04-06
base commit: a7a080bb4236

Changes in v4:
 - Add PartialEq to all enums so they can be used in comparisons.
 - Replace u64 registers with u32 LO/HI pairs and helper functions to read them.
 - Combine all MMU register definitions into one patch.
 - Drop [PATCH v3 03/12] drm/tyr: Set interconnect coherency during probe
   to avoid possible leaks/data corruption.
 - Pick up Ab, Rb tags

 - Link to v3: https://lore.kernel.org/r/20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com

Changes in v3:
 - Update write_val() with write_reg() from API change.
 - Replace const values with enums and use => ?=> syntax.
 - Convert 1-bit fields to bool.
 - Change module visibility from pub(super) to pub(crate).
 - Add new commits to define mmu address registers.
 - Add new commit exposing hardware DOORBELLS.
 - Pick up Reviewed-by tags.

 There are also change logs per patch.

 - Link to v2: https://lore.kernel.org/r/20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com

Changes in v2:
 - Rebase on v8 of register! macro series;
 - Add documentation;
 - Remove manual functions to get address bits;
 - Revise gpu_info() to use macro;
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

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

---
Daniel Almeida (1):
      drm/tyr: Use register! macro for GPU_CONTROL

Deborah Brouwer (5):
      drm/tyr: Print GPU_ID without filtering
      drm/tyr: Use register! macro for JOB_CONTROL
      drm/tyr: Use register! macro for MMU_CONTROL
      drm/tyr: Remove custom register struct
      drm/tyr: Add DOORBELL_BLOCK registers

 drivers/gpu/drm/tyr/driver.rs |   19 +-
 drivers/gpu/drm/tyr/gpu.rs    |  175 ++---
 drivers/gpu/drm/tyr/regs.rs   | 1744 ++++++++++++++++++++++++++++++++++++++---
 3 files changed, 1723 insertions(+), 215 deletions(-)
---
base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
change-id: 20260409-b4-tyr-use-register-macro-v5-f836fd1d8a68

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

