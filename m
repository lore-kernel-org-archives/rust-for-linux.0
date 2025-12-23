Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D124A21;
	Tue, 23 Dec 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491488; cv=none; b=b5l17P5BRVdZfQhtdDfNuazRP5xKORyCs9MsIv7o/spb7BKRN4FL0yxCIP7F0lRGoNdjkjJLZ/ZlBoki/rgPjvyL4KNWabj4ldtJiG0FIagVQ46Iru/BUQeNxISWd/XXQ9kL7n9iDlw1xmt3GhfUTorU7EQReQ1G/2JTZkmQi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491488; c=relaxed/simple;
	bh=mckLwRkfGzMTWSYhXWdOIvNIuwgtZdqY7fZ5tXiEo6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AyUqZd+9mAkQxYxNWzIZA6SHZ2yR6bLaqeYEoOBN+nWY+1oXVrQyOBL7/TjViAb1uUCDnV9ShcWOnPotzDrXiBRok+uPJIsq0wDBQdiPPB24lIC573JwtMInpLGlaoL6vgK2ruY/BGCq1RtHVKMP25+ncM1HAlp5U+K+9ryaMxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxT5/ZBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxT5/ZBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE713C113D0;
	Tue, 23 Dec 2025 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766491487;
	bh=mckLwRkfGzMTWSYhXWdOIvNIuwgtZdqY7fZ5tXiEo6U=;
	h=From:To:Cc:Subject:Date:From;
	b=kxT5/ZBGu262VmV/8pa9lI15gM8hh3gIgShgZSLzQgyjjjY5wntMP68NTyoirZi3p
	 yVvZshtmtswbjwnKBALRwn584zFyNI134jB/pKQ27ah/71I7BY1L68jiODA8jYmaNo
	 YMG7VuDYlCywLJOdF75nEQkvz/MMyHUvhL+bLnKfmRK430J3NpgzoJJ/ZQfHWywgLL
	 /ejY0c9CDTmg2P9IWVD8pxhz+IkQhTyuLJ/JrVnUo5QmCXamobYdA8JxJz5ll5ePOm
	 1q1OTrsV+zwSBfQIFXSz4nwdxW1lt8KsD2WlCIAWSmtQy08W+X5f3Fd9W8BwIKZqFo
	 3sixlUyAqPw0A==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	carsten.haitzler@foss.arm.com,
	beata.michalska@arm.com
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: exclude the tyr driver from DRM MISC
Date: Tue, 23 Dec 2025 13:04:34 +0100
Message-ID: <20251223120436.33233-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARM MALI TYR DRM DRIVER is already maintained through the drm-rust
tree, hence exclude it from drm-misc.

Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..4c72eca29e50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8357,6 +8357,7 @@ X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nova/
 X:	drivers/gpu/drm/radeon/
 X:	drivers/gpu/drm/tegra/
+X:	drivers/gpu/drm/tyr/
 X:	drivers/gpu/drm/xe/
 
 DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
-- 
2.52.0

