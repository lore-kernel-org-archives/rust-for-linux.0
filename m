Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55083A1CD;
	Sun,  4 Jan 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767557275; cv=none; b=NaJEtgW/kgkVSlqnla9ROcDABm9kYGvW4qgt9Povigr5ACHMkS17g4V/z/B1sxxYjPk+2fz5lnPeUQyMSwfOubrBuftSwZE9O+b+L95DFvh2SJl7CygsnCIOymw09iQPT0lDKFiYNr2xWqajOtnLjMtJso984hsR+DRa9Q5vk+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767557275; c=relaxed/simple;
	bh=VlMbfI5Cu0cZu7kotVz2jPQNpV7Mha8M6xVDsCVhsCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNVpO6vkTBXAfbFk1eqwnLpbATRtFOezGorm7okPHnLNOdLaf6Z4YzMK6NVHKv0dZzvQHNWJkKH/prxCo/y70hGL+6YImO/Sr51ObVyYTRWH+pWBjvGUrs3jF9yxKm9ZV/bOnLrU1dAPsgrMlUnaqRhIMfqlNxOwB+ntRvxB1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=x14QqdR9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Az0cM8+H; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="x14QqdR9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Az0cM8+H"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dkpPz5Mm4z9sRx;
	Sun,  4 Jan 2026 21:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767557271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
	b=x14QqdR9pfKE2hTG30e+TnnJ9uau1B1BjmSXUpGsgqj9wGo5EvXh3MXoHZbhgViqIv5ORk
	Gl7n4OBE5a+D5FxlVKa2BMwr/CAFe5sdGr1utts596XPapmhvUwsED3s3OTcDJRi7g05NK
	1A3pWGKrkVLlPuCzSvo3EXzCfv51mKoSAc8SXT7bdw+ZP3UG4wt4gmvh9wWfqHIjk/nay+
	vN3keYlxWxKEgP2X94zw/K/WOPnLs17463NCl3aZyK7sGnhOwTlwpp93EoTkbM5mnaBwRv
	1FbRRnM8seDhn9a5VAHXCj1MBr/xWtQ5STwKusmiw94GJYjBnnmVkBG+Y4j9Cg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Az0cM8+H;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767557269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
	b=Az0cM8+H5pkJByTJQ2wCN9Y1s5Y5YB8cUoHZhfkWg4fvdwHf713i5OQWsUxwfkBnK96v16
	K7vruRWr3JIeigd+YKD5BZwuwENfbEcGw/E6lK+uRfqs+Xsjpv3w2Z0usjBvNzKFu/1hEw
	B9TRXeN+kS2S/IXGNvLsgNuuoArgyeurdV0bJtIfH399A9HIWaTzldvlTffuC0fIpGLfi1
	efKDae/7X8FLov28M213cI4UxfH6F0kevZNHmk9AFaHDny6Vzl1jPlVVFmgOVpp6yJ6Y+X
	0VsJkTj0aGAQ5Z8VXgpImkzwvpw2vSQaGdM9bqGhUFPW3bZjjx6bUgbrPHf3lQ==
To: dakr@kernel.org
Cc: aliceryhl@google.com,
	acourbot@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	mhi@mailbox.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] rust: macros: Add derive Display for enums
Date: Sun,  4 Jan 2026 21:07:30 +0100
Message-ID: <20260104200733.190494-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xgh8nq3xjtogenp3g76r4aephjsgq4t5
X-MBO-RS-ID: 4904cf6874f2f5a9645
X-Rspamd-Queue-Id: 4dkpPz5Mm4z9sRx

This patch series adds a derive macro for implementing kernel::fmt::Display
on enums using the syn crate, and then applies it to the Chipset enum in
the nova-core driver.

Maurice Hieronymus (2):
  rust: macros: Add derive Display for enums
  gpu: nova-core: Use derive Display for Chipset enum

 drivers/gpu/nova-core/gpu.rs | 17 ++----------
 rust/macros/display.rs       | 52 ++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs           | 42 +++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 15 deletions(-)
 create mode 100644 rust/macros/display.rs

---
v1: https://lore.kernel.org/all/20260101184137.80445-1-mhi@mailbox.org/

Changes since v1:
- Instead of using the name() method with lowercase strings, implement
  a proper derive macro using syn as suggested by the reviewer
- The derive macro outputs the exact variant name as written
  (case-preserved)
- Supports all enum variant types: unit, tuple, and struct variants

base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.51.2

