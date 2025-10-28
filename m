Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3E925486D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649271; cv=none; b=rkf+lsDuh+/O9qgomb4PkbVx9W70Fef+RIrV64VERA7aO5EQLWweoL9pV7bpouRuzqFRirvzYie90LCVioh0kVsxjH9dHy+2G9zm13arZ3smguuFBEUmALa7FnbOQf01Hem4GAT13RXf5Uo7ZfQVZlaGXt8UAnLmhevzggrUnak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649271; c=relaxed/simple;
	bh=VnugrDxmsK2Ym8d6zp8daZgi+0PDrulHuvbm8JV01M4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gt0eC62LToPMOYbcHYd7fy7EaavVe/xqEeGm4gVENWB7FKFaap8naoNA2IPSkpmG95VIGo3z+yodCvqD87Nzqmxbs0sBLtcSVBUpbKpgtCz/dBpqzxpgQwMlgTozANoeAlM/wmz985fwLxFvxl3EyYjr4oQQdAzxMBUuIicxeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b52i6V+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b52i6V+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92591C4CEE7;
	Tue, 28 Oct 2025 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761649271;
	bh=VnugrDxmsK2Ym8d6zp8daZgi+0PDrulHuvbm8JV01M4=;
	h=From:To:Cc:Subject:Date:From;
	b=b52i6V+yJVbDrpkBMouKvroH8gYcfa/iIuKHx1EkRSsWCsqYowVj8yrgxrUYz7+7F
	 HKdxiTkck+xZ9EvOgWh8x3Bh/God4IIpvt+krS2VE7ArsP8783P2SNoS3rPpoxTUXj
	 zuvW7t+pX09UOikQC1NySNHvn0nyW2D1p9P+Kbyf4AL408O1wj/61cqvTAD476GvJZ
	 sTxijDO8ViEvsARmG1cg87nNe2XmXB9L9t8Zpd5LetStiJcO5c8DqhfcIBFz469SGf
	 C/TlcBntTTgDSYDzdsAaGZwj2GNUm1douBTJ7H2SZkvGGUqrOe+ghh2NPCjiqm6oqJ
	 0dC1Wr8w/6zXA==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] drm: nova: depend on CONFIG_64BIT
Date: Tue, 28 Oct 2025 12:00:52 +0100
Message-ID: <20251028110058.340320-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nova-core already depends on CONFIG_64BIT, hence also depend on
CONFIG_64BIT for nova-drm.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index cca6a3fea879..2a70aac64d7e 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -1,5 +1,6 @@
 config DRM_NOVA
 	tristate "Nova DRM driver"
+	depends on 64BIT
 	depends on DRM=y
 	depends on PCI
 	depends on RUST
-- 
2.51.0

