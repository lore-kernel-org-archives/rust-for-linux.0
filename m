Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D62311C11
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777191784; cv=none; b=Bdm+pM2DVQ46bou8cJavKPZ2KdQ9n+FmxCt+wKuK1bS2yGUCwaj2M0+5amkCiAveWeb1m6MdGaC1YkAcNdeWseXbTdQbpLzNjFsfzMfSxmAK9qlrEdwgyvpmbXVeolnXIKUDudg3NthaEpy8fA0OZJePtBmbG6R2hfBApCy9Ylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777191784; c=relaxed/simple;
	bh=sAFNi1zFXEIcPtQhtkCNl2JxNcg9SDhO9IV3Ezo7J+w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdG0/15PAOiEhVJo144YxHZ9OLcR9NyThkD2xQ7OlSiOgr9fAg70LiK86eAkGsl7QJbGIqd6osHj8w1MfNMfG1LJ2xsx99u6or2wnyJJ54X5Jktbi4b9NFZv6+TDqzVRqhZsnpVpGV5+d4hNThTIrp0zRE50DGnMQVZmFzh6JKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN5hXIsD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN5hXIsD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso57739115ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777191782; x=1777796582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1qEqq8PLZmBKEBDQMcGtLZPtyhcLKjlPNm9SyBR/+E=;
        b=FN5hXIsDdWmk5lEFGkB+OXuW9dK4ZMeHxtKsVpLLDj5LRA7AoeJl0DehUM8nw0w/tC
         Uff2/c6QdzDGMdNM/vjr7Cdut1LbV7NxjCPG/0uKFy51jtVyzjeeImIefLfbznZwncHh
         LA5JL/jv6BhKFt3DJqDG7ZNwiYKK1btMozQQtN2uYmRMMoMUjIhJeFFrjMoclUQRGhLh
         iNCLvo6q+6mdHh8ECJyknZCeh5gAihSNYJ/pdSaxprmnS4Bpu1UieFoNC9TfUpmrSJkC
         RbZbzYq/Hr+J2n5L36E5qcUJs+ELhQNqWyIMbBjb5Qs06MPMJyCjSDSO4oi4kqkcqoKS
         QMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777191782; x=1777796582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1qEqq8PLZmBKEBDQMcGtLZPtyhcLKjlPNm9SyBR/+E=;
        b=UTeBEja8pt3bwLAZtt07IXoxfs2hN8bfydalS9eEXfiSjcpr+J6mS7NxAzu/Hnlxm+
         bEHtlFQdJvM/KOePiuOuSm3ZKkFhVq3oekNBb9+zWHaQw4+WHx1aypcUULWouAOlhlye
         5SRut+yjfgZs3DfaryzJDLfW+kz3ctpUDXqPGclUe0eQFavDtA9fL+T5olbX399AIo3X
         xyj/dzs6JFgAg/i1gEBjAK6zA2o+YYb9f/hdO+7iC0fMc5dlf4LCEi6AFiykNfDPajQL
         xIwT7oIvga+Wd5uxXUT5qxaPq9TtlKbs4Exzmw9TIYamHGTVQnKkZffF/WLCKhqcQZAh
         45JQ==
X-Forwarded-Encrypted: i=1; AFNElJ8euT3GtC8aXh8QI0dpJH3uMTFlGat2Ux7hGZJkfJfuoFvF7yXCGFPEvZnQvVhibniaeyEkc6dBgo96pLg/lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FTEJ7RMNC59aGAMF3OvEt8CfreFXSypg7/iiaL4hFMt19LAO
	TCJqK4htytQ44ZWIRRY91yZrGLQHMQPkVpJ4gSFVFZUds63hBpHmipps
X-Gm-Gg: AeBDiethFgT6f7C5vTfdlzHZvQzcHdpl9OYpjnZMEqEW3ow1fHJe8uJlzU85iPgDkuj
	b0hdgvzxvfKe+Ns4/uhRiqUfqjVeFk+alqyDhOwBGvYhOmZ/HQ1PPEY4SLYaW6R8cm9DgDOonZT
	1wDuWoNFRfXR1OLQn3VrTd/DPFyUkIqUMIg4tTI7/0Ci6WB+q1SAO3DPDCGLreslr96rx3+MA3s
	n2nmL3E8wjuEE5UsXzg890hYzWA5kfJJOOxxxSIRTCsrg2rMwWFLhUoJt0/KHA8NP8jn4vQ4B9s
	tWXLW+4WeerLNxyJW5zwJD7KHj/97zSjsKjjzN+dohgtO2lLhCStR0aM9KMjpJN2jj8QmnTwrwo
	s15O6YaHVsE87eUmcJ/1ZVBYQiMXQBeGV8ZZVboHuYZWdfs/JK00zJxxihTh96OuGSukp/csngu
	OOLbWxMPZGF9g3qgDdRz/R6RWY7G9lZsdD/hx9pvzLZV/7VTmPF3hU5W3Ogw4xRoKOvl1AszwVm
	6AYuEmr9giRe9I=
X-Received: by 2002:a17:903:b8f:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b5f9fb9d4cmr376823945ad.30.1777191782308;
        Sun, 26 Apr 2026 01:23:02 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0dafcsm284770165ad.52.2026.04.26.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:23:02 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dakr@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	lina+kernel@asahilina.net,
	j@jananu.net,
	mkchauras@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V1 2/2] drm: Make CONFIG_RUST_DRM_GEM_SHMEM_HELPER selectable from menuconfig
Date: Sun, 26 Apr 2026 13:52:34 +0530
Message-ID: <20260426082234.2026908-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426082234.2026908-1-mkchauras@gmail.com>
References: <20260426082234.2026908-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_RUST_DRM_GEM_SHMEM_HELPER doesn't have a description leading to
not show up as a selectable menu item in menuconfig. Along side it's not
dependent on rust.

Fix this by making CONFIG_RUST_DRM_GEM_SHMEM_HELPER dependent on
CONFIG_RUST and give it a description string so that it can be selected
from menuconfig.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 drivers/gpu/drm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8f5a8d3012e4..89adb700d710 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -269,8 +269,8 @@ config DRM_GEM_SHMEM_HELPER
 	  Choose this if you need the GEM shmem helper functions
 
 config RUST_DRM_GEM_SHMEM_HELPER
-	bool
-	depends on DRM && MMU
+	bool "Rust GEM shmem helper functions"
+	depends on DRM && MMU && RUST
 	select DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this if you need the GEM shmem helper functions In Rust
-- 
2.53.0

