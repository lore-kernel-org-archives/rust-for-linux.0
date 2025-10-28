Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C7F13A244
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649273; cv=none; b=s8WfKF+IeIVttaKW4AACbUJ6EhA3uN7qqEy8rnYvylzhn32HTurCrEOjPHc16yS8OHb1M64RSjqbRzGRfwMFrMEGoRnRmzCMSAFNeanQdlQgsrqR7Lv5fgkEgS7FI37RkTV5Utz5UxWSf+ZFijpJqR81Fy4c7QzQiSrcSKAcCIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649273; c=relaxed/simple;
	bh=joNqstAaux1Uvo9uDnCaO8dixJ1y2Pgk6LVKAnRsZX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS3RSbz80fAW8A7LKQk5UiWYYRjKRskW08gnXPq8wPhHZEJsVhQT7lVUn6w28PiaWCXY7AyEGbOKdLRgcmj84/es2PyXVnOaZDg50JG1e5P3m0EtOD1dsbipZ5QFLNulaG/fIrTAZm797zXBH7iZDdP61YpolkPSOvZ+MsiIzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQAFDGVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQAFDGVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF27C4CEF7;
	Tue, 28 Oct 2025 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761649273;
	bh=joNqstAaux1Uvo9uDnCaO8dixJ1y2Pgk6LVKAnRsZX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQAFDGVJ1y4A3KKufiPbMhU/SUwTsMc61uR+qjG39F+0j4aaYttRmAnp7me2xMcqu
	 Qkl+LW69LZWorBe55LroyroUwBZqJ3SBUr45t3o/gbpAwRcI5haW5bjXpzer33Y+wF
	 NW7e7Hl1cCnqDYEzntkDzfqZhrq+/zHZIqLGgwbMaUnYNYzDeaUVj4yJ1jbX/l8+r5
	 mt85/0b4Pq3fGu75TuA1+TIYhWpfwLkKhteVURZfq83jy8YIBxRbYJ6O3ZL/FL+IOU
	 /pk7FqNl3zy5sZqJYRhoR7tj7Xjlb0EexQoW88WaUcXVBB5GxOlyi2Qs5uVxfW7IXE
	 jPURASoIkmKsg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] drm: nova: select NOVA_CORE
Date: Tue, 28 Oct 2025 12:00:53 +0100
Message-ID: <20251028110058.340320-2-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028110058.340320-1-dakr@kernel.org>
References: <20251028110058.340320-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nova-drm driver does not provide any value without nova-core being
selected as well, hence select NOVA_CORE.

Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index 2a70aac64d7e..3e637ad7b5ba 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -5,6 +5,7 @@ config DRM_NOVA
 	depends on PCI
 	depends on RUST
 	select AUXILIARY_BUS
+	select NOVA_CORE
 	default n
 	help
 	  Choose this if you want to build the Nova DRM driver for Nvidia
-- 
2.51.0

