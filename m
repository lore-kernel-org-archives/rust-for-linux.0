Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF1932E699;
	Tue, 23 Dec 2025 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491207; cv=none; b=qsu6BMSC5ptxpCNYnXxWKV13MLYy+0C34/UDPaMao3qVCivph1501EKWNZvtaRmnZ3dSCatwgOlYUvLsOlUHFv9bNoQS0j3vAxsD0rlm6iEmAVnR1EZ3D5ZodLP38lzF/i0g9KMEC5i8ZrfWFkNM2fsALIT4xx1QYcDoO8x87BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491207; c=relaxed/simple;
	bh=PrnVL3Ai7vAVbszzPGgoWaL7YT79xcQUNZBQhUgx82w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+JDzGWdWLtBktTlhzwv8EAyJlMpYZyQ9DcDCAe5SGo7qTt4LvKwKX/6C17lhoFyayA3+70+ueKEb3RRweoAK3LQBADzIVcAr6r8w9Mz4VzijUXpInPFALAI1El0BvKczkn5g83uEvh2Do4sA++th5BedUQ9xiH4P75o5Ue3aLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdPoUgZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdPoUgZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE788C116D0;
	Tue, 23 Dec 2025 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766491204;
	bh=PrnVL3Ai7vAVbszzPGgoWaL7YT79xcQUNZBQhUgx82w=;
	h=From:To:Cc:Subject:Date:From;
	b=PdPoUgZ+himWZazbQU+7oUUc9CZgbDUH/WYGdaTY8SsSv/F94jDUWAWclEI8iouka
	 LKlmR9XKe1p9b6orANO/ubkbsdcavkqmh9iFuzmsPQkhLoCfvyGTqvevD+/tikW8Mr
	 UYHo7IWUZtV281IsvHVZRD9OdBg0CWXwWCenS3SE9Z58CE/n462dIC+p0qKkkPv1u3
	 stXGLWRtGIbOxsCWhBzDtnb7x3Z+8e3DQTxXUbmseYTO6WhyKY7/5X73jaxL7v6VGv
	 SN2HBEWTVF93Fj7uRhAFrf7e8WIM/DcNBVaH3GdROhFkPej7jv1gPPPRaaJxBjO/Ce
	 MOaOU6vIWN6Iw==
From: Danilo Krummrich <dakr@kernel.org>
To: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	tamird@kernel.org,
	boris.brezillon@collabora.com,
	carsten.haitzler@foss.arm.com,
	beata.michalska@arm.com
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: fix typo in TYR DRM driver entry
Date: Tue, 23 Dec 2025 12:59:47 +0100
Message-ID: <20251223115949.32531-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a missing ':' in the ARM MALI TYR DRM DRIVER entry, which does
prevent script/get_maintainer.pl to properly work and pick up the
corresponding maintainers.

Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
Reported-by: Tamir Duberstein <tamird@kernel.org>
Closes: https://lore.kernel.org/lkml/CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fe1e8da6c2bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2158,7 +2158,7 @@ M:	Alice Ryhl <aliceryhl@google.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 W:	https://rust-for-linux.com/tyr-gpu-driver
-W	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
+W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 B:	https://gitlab.freedesktop.org/panfrost/linux/-/issues
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
-- 
2.52.0

