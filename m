Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489D14F9FB
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311519; cv=pass; b=q8VAFcIL8cKLLBpKDLTMk2VjKI0LjDIcZri2dk8DetdN3N6eMv5Ys9wILP/o2VvypT8Ze5ofV4POyZirzTW8czcyJoqFww8Nraa+mqbwWw/dV19NIyMKWl4L0o3sKkKrAVSxjioF527KhuV3u9opj4y0c9dd8XwNZ5bpkOPHQLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311519; c=relaxed/simple;
	bh=scH9gecDDaVPRj+HI4lsSCDu+sfPo/c7UDLyzWg5qBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wsj1KsZobTv4jFhi2j2Os60C3fRCm5SyWMJcbZqwddhKv4Oxj1kktQ3FOpJghYr51dWuVPtJ9F8XkcmFnixYcScPw5nMa1sVZg7tXwuJX2IvpyOoSplFD4ZARduHWFcV9T20k6ACaJsDkjXlRvqlZYc7/Z+yH9l4i7/3lnmQAJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=OyJJyP2A; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="OyJJyP2A"
ARC-Seal: i=1; a=rsa-sha256; t=1774311492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ioMvtFtwKKAptEddaO84MMN+CZzmAFOcnMmQDdR4qFgfzBiweu+RR4gnU9MCEqz9iGtL6FYbncHZz1GzB0m7+FpSZbYAwc99SOXxtEsjDvsOrlhsBOj/Bhn3PhZKPXE3ZHIaZPhE9jj9opAtR/bPkfahjHzkOiOZI4V5Hrx+SyI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4e8y28/K36QMdoVZh3OhO4HD1eFoiN4nAXu06OWxlK8=; 
	b=ST7m33yIPYUWxV9TmQkDaHRSdIEGRV/UjK2gamEo/BHkX8i8tBqMvOffUN8su1QbfCx+TdWAjMqG2xYhvggVSW/a53qHXjj3RHZnq/QAhRUFE3GA2n48Elsz6oEnqtf6NkTxI4br9k9IpTVlYVRhMGzpJ9j0QU9/qTwRXlF9LDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311492;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4e8y28/K36QMdoVZh3OhO4HD1eFoiN4nAXu06OWxlK8=;
	b=OyJJyP2AaA2pWV+gvkPXUfj8grdBezx4P5ZhMpjjTLLILA4tR5rb0RLLTvtbRp7k
	zRIPmtEmvwgahvklnVoE/R4VMzxOlrYsWPPk6lUUzew2uTgvFQxPCwcpcBv7Lo2ezt3
	XE+Hme1ez9QlY6EcRzGQ08i2U7PCCRPMKLu8uxes=
Received: by mx.zohomail.com with SMTPS id 1774311489953164.47520327121856;
	Mon, 23 Mar 2026 17:18:09 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 00/12] drm/tyr: Use register! macro
Date: Mon, 23 Mar 2026 17:18:02 -0700
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADrYwWkC/x3MQQ6CQAwF0KuQrm0ymeIQvYpxMcIHugBMC0RDu
 LsTl2/zDnKYwuleHWTY1XWZC+RSUTvmeQBrV0wxxBQkCr9qXr/Gm4MNg/oK4ym3tvAu3NWSUg4
 Rt+ZKpXgbev38+8fzPH+t72OubgAAAA==
X-Change-ID: 20260323-b4-tyr-use-register-macro-v3-d4366a02e975
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=scH9gecDDaVPRj+HI4lsSCDu+sfPo/c7UDLyzWg5qBk=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbzgIlca+fGIkdvVR94PWo/fnXBGVlvCQOVK/uqPm1
 VeB7W+/d5SyMIhxMciKKbKctTfqEa96b6Q7/38zzBxWJpAhDFycAjCRy6cZfjFfc3YzXmmtb8ln
 V8cx959D0Z5rcWybz97Q3SM4x3HBxwJGhiXOewxlmn5c6djqdWDfJqF33a0lbpMnfzaecMr5brl
 nMysA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

This series changes the Tyr driver to use the kernel's register! macro
for hardware register access, replacing manual bit manipulation and custom
register structures with a more type-safe and maintainable approach.

---
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

This series applies on drm-rust-next.
base-commit: a19457958c30

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

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

---
Daniel Almeida (1):
      drm/tyr: Use register! macro for GPU_CONTROL

Deborah Brouwer (11):
      drm/tyr: Print GPU_ID without filtering
      drm/tyr: Set interconnect coherency during probe
      drm/tyr: Use register! macro for JOB_CONTROL
      drm/tyr: Use register! macro for MMU_CONTROL
      drm/tyr: Remove custom register struct
      drm/tyr: Add MMU address space registers
      drm/tyr: Add fields for MEMATTR register
      drm/tyr: Add fields for COMMAND register
      drm/tyr: Add fields for FAULTSTATUS register
      drm/tyr: Add fields for TRANSCFG register
      drm/tyr: Add DOORBELL_BLOCK registers

 drivers/gpu/drm/tyr/driver.rs |   29 +-
 drivers/gpu/drm/tyr/gpu.rs    |  213 +++---
 drivers/gpu/drm/tyr/regs.rs   | 1587 ++++++++++++++++++++++++++++++++++++++---
 3 files changed, 1589 insertions(+), 240 deletions(-)
---
base-commit: a19457958c3018783881c4416f272cd594f13049
change-id: 20260323-b4-tyr-use-register-macro-v3-d4366a02e975

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

