Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D842AD35
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779750128; cv=none; b=bggc2c1I0ghY8X2Q1up+cg00i6npqI7FpQAjqHoVXOoXtHn73FQqNNZ/4QaUtMPjFeDNMQCM4SmOBP3J9Y3K7E9lytDnp2sBxgdV1w34+Udz68N37UE1LAysRq784HGaG0kqtAuvR7eOnwrMmNZUeFH5lH2NaLyQjac99AbJEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779750128; c=relaxed/simple;
	bh=b2dhkxdjO7PJbwgs6sub88sS+SJH0TAJKy7ZAv14wxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXD4hdcK7b9F2cFnFY78yhUeVRc9Lznh6p2AtoVYNbjiNgVgN4FowUOE3D1a5uVK7QJC96UuD/TUwQN/drPuryVQgFafBpZTY/wCJZb8zpIOPdj5chH39EQkJi9Xl419FEueS77FoJlPJ1w5vCfBia6CujDxPtuSHBM1AXfW/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/o77t8o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/o77t8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330711F000E9;
	Mon, 25 May 2026 23:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779750126;
	bh=S2uI5zgspP6cNcWKDDQWRpzAEQVb4nF+eNOFB+O6P0k=;
	h=From:To:Cc:Subject:Date;
	b=M/o77t8ojLAk7q6HCkyBbDZzhoTrEdSzdqfF9SeGll7wR+dz0xjpALmERSq0GufdX
	 p7ihl5N8ns8m7vPUT/hHX5h9wt/9C11WUGDBepTmQRd5Es3tgTOL7fD6xPa1jb3xss
	 kOIwyzWuWPWf/C1kS0YIMTRgYXSyXQnPg9cJdIUp0jaDjLVIAqc6AAZUU5UIFdc4bB
	 en8u/8ydqxIpqwz/MPVpq876HX5CgWEce5g9fH+PPvC1ZMCfo6kMiENayP/LmhawZ5
	 efKarLzCVCTMIrInz1sKBy7xoODafyhJ2Laz3Lpstllfq83frxdoTjl8KWZCNyzlub
	 UNiZOltqAo/oQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	boris.brezillon@collabora.com,
	deborah.brouwer@collabora.com,
	gary@garyguo.net
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/2] drm: tyr: use lifetime-bound IoMem
Date: Tue, 26 May 2026 01:01:42 +0200
Message-ID: <20260525230152.277820-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adopt the driver core lifetime infrastructure for tyr.

Separate the driver type from the driver data and use lifetime-bound
IoMem directly in probe instead of wrapping it in Devres and Arc,
simplifying register access.

This patch series is based on [1] and drm-rust-next.

[1] https://lore.kernel.org/driver-core/20260525202921.124698-1-dakr@kernel.org/

Danilo Krummrich (2):
  gpu: drm: tyr: separate driver type from driver data
  gpu: drm: tyr: use IoMem directly instead of Devres

 drivers/gpu/drm/tyr/driver.rs | 29 ++++++++++++-----------------
 drivers/gpu/drm/tyr/gpu.rs    | 13 +++----------
 drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
 3 files changed, 17 insertions(+), 29 deletions(-)

-- 
2.54.0

