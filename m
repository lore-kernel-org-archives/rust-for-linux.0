Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678422D4C3
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784740; cv=none; b=A6WRudnalLW1XeWlxqloBLYp3R1baeiKcrMUKv+M2RMTzSoHxcNHR+vGInrVgC+2awIeIYFA36iaYd/TA5bGpWRk7Oc0gmSWohTDHexjNCECSMIk9lQdmQZI+/tDE1eOEqRGrCsWoIRvE4mHGCIjH7qTJFlF0yUN+M0G3EmKu/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784740; c=relaxed/simple;
	bh=GOfCFyj6V7D3ee9N0LOQqA+bW6sTRVVoMWyGasGzsiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DaItdXBirEWKK4yqYAhGC39lSN2goG/yNAbyJfi1bGmwLumE+qz27pthAF1EE1rbmZ1WxvuAFgP+ssi9MVsYwNGmPaqbPJtaHT4Ky6ElHKb63Y2Jsza4zu840cEHOvwFc1JML19evVHvPANpO8dr2KC9Yb4xObtmwNCDeWn2SLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvJlwfr2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvJlwfr2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2131FC4CEE3;
	Tue, 24 Jun 2025 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750784739;
	bh=GOfCFyj6V7D3ee9N0LOQqA+bW6sTRVVoMWyGasGzsiA=;
	h=From:To:Cc:Subject:Date:From;
	b=QvJlwfr2RTMVa7HYNisHAE11wAwE5Z7wf8PHmJuZ8+7KmV/96RWfdxB82Mc1Ybnrn
	 YE0S3jNsBr06KD7ia4kaqxIIcT79L325VI62kQWE0V0Gd/tjnIMnMQlM42W9v2w9nF
	 91/urBAfE7L50v6XWjgTO1nvHlNDNP7cpgPIw9RAirqWzJS6JUpaZqLkYMhZEjRs6f
	 rEKCacHDEk6EszYnkE1ewr0IHo/HWhrDSGkaDa8S7Nescr1eZXJIHTnjFInYg5D0Ri
	 hHUNMi2EmhpXceebKiUvtoZ0/FU7eBiP+ktoiNV1TvtGPIbm/Zdcq+ZTYQiNfVOifO
	 v9LKs/GssBrJw==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	nouveau@lists.freedesktop.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	jhubbard@nvidia.com,
	bskeggs@nvidia.com,
	joelagnelf@nvidia.com,
	ttabi@nvidia.com,
	apopple@nvidia.com,
	sbaskaran@nvidia.com,
	rust-for-linux@vger.kernel.org,
	ojeda@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: Add Alexandre Courbot as co-maintainer to nova-core
Date: Tue, 24 Jun 2025 19:05:16 +0200
Message-ID: <20250624170517.105148-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alex has extensive experience with NVIDIA GPU support, is closely
involved in nova-core development, and brings valuable Rust expertise.

In addition to his technical contributions, Alex is actively engaged with
the broader community. He works closely with contributors and
stakeholders to identify and solve issues, fosters collaboration, and
helps ensure that the Nova driver evolves in alignment with the
community.

I trust him to take a key role in making the Nova driver a successful
upstream solution for NVIDIA GPUs in the Linux kernel.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..e694d06dc69f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7718,6 +7718,7 @@ F:	include/uapi/drm/nouveau_drm.h
 
 CORE DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
+M:	Alexandre Courbot <acourbot@nvidia.com>
 L:	nouveau@lists.freedesktop.org
 S:	Supported
 Q:	https://patchwork.freedesktop.org/project/nouveau/
-- 
2.49.0

