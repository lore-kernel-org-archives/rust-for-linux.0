Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673931CD2C
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780012872; cv=none; b=QYCk3Q8R3tHBfuQTAjpYFKpyl/2y6LtxLHLHrBtZHwX/qOJcD/9Yv6w4O8vKdSqTfNjU3cpcYpbxjwV3U2qxQa+WfYwdg8IMwR8BlyxcmzjaKYstUvqegGIN8WqypdKmP1JZM94IK5BE0LW/rKs/4lDOAK1IFmF+f1I+KqHvH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780012872; c=relaxed/simple;
	bh=W80Ui8IxHPdH6aYMnP7XONzC6aNeglDjskkZRP0YlX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EREkp19KHIW3WbHh9rEtFoEa2R32aZg1cK3U5bb2d/daA4OdTCRLxkc0kIhcRRDMlNxElxHxvlOeD0ye2jh3mdzbsFy1rC4o8sneZWbcy+Tc0UnKNf3wWCgqkkkVlgB2zp24UiRHsmRlFpllO9/ifEsK3052XsEp7s8io9hLQzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd1sNyoE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd1sNyoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D38C1F000E9;
	Fri, 29 May 2026 00:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780012871;
	bh=JPawECuv70TjMvx1NH/GERoDHWctvHzeFAAYYj/q4rA=;
	h=From:To:Cc:Subject:Date;
	b=cd1sNyoEw1TqeuNAvlnXCPm4lukbXAqjelpJuF5EVWSwu655aUewYq8aQzHoTAXvr
	 EgST2lTHodbaCZLf2w0bbBq7piSJOGWHnTLbgulx+p2dhQNcWYLPMPcdy3vyFKeoNK
	 3KDRW4WqvGF+hkfBvkJQyCg8g2CFX5ojiZSoLDlLJ7GMRTCYHQKwn6ssr6HDGjW8JH
	 b2H1kcYD49xUCrCePihYNU2h9iDoY769RAZbEloC53FdmuBZI6Y+rGtnCOpQQQGc78
	 BF6pewQ3pvyaGQl+VnZkHOwdttpbBcRyhsocVK5ZK52YrTw1rN70/rPrzQohlXQQjp
	 JuF374ZaN11LA==
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
Date: Fri, 29 May 2026 02:00:52 +0200
Message-ID: <20260529000106.2257996-1-dakr@kernel.org>
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

Changes in v2:
  - Don't return Result from GpuInfo::new()
  - Use "drm/tyr:" commit message prefix

Danilo Krummrich (2):
  drm/tyr: separate driver type from driver data
  drm/tyr: use IoMem directly instead of Devres

 drivers/gpu/drm/tyr/driver.rs | 29 ++++++++++++-----------------
 drivers/gpu/drm/tyr/gpu.rs    | 17 +++++------------
 drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
 3 files changed, 19 insertions(+), 31 deletions(-)


base-commit: a3e50e7279996cd987001fd8a3db36e72665f8f7
-- 
2.54.0

