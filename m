Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CD82E8E10
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648282; cv=none; b=Db3TyTe8T7Hw4/wXlKTjlaFZzt+Wiv8rW1kJNeEzXpK2+avrkzB8l7Tag0L0QXC9jpXpzk1m6mtRsAJkmqfBc7EatTuz0lNssu6CtteKmvAPxlLCZPTMELTU6JMdjl+JWOZheQu4fKhzK1lqDkqi0a292LaUEo93FW+QwIb0Chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648282; c=relaxed/simple;
	bh=Vew93ZOaF3PEzyOv7+dX4417p2dogo24fKYnwZRv6+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIYyVb1hAzLMjB8WuiF7Mm/JcMR9yByYy45PpYrR7zqwepJmuBouKyTb1JDo5g7ixP4/aAUSJvrs3k31wxCcnz/lpZ6UVGzMRzLkoveyXMAEzEynPpL6Slr9BTvDLsz/YyLKTwgqThGz/vxOIYNzjZW9APb+icRkabIN/GoaDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqIuLxKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqIuLxKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1953FC4CEE7;
	Tue, 28 Oct 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761648282;
	bh=Vew93ZOaF3PEzyOv7+dX4417p2dogo24fKYnwZRv6+8=;
	h=From:To:Cc:Subject:Date:From;
	b=oqIuLxKnhhcjGXGZEvyNq/d/3wegF7fARjdw+1ObY65Uesgs/DS2yOzquYCgiO2UY
	 TxyclsCosQFA23byll/sdh5opMa2F66FJXFAsVX9M/UfC0MnRoFXVJfUFsgBuCVWUi
	 mFS+Cq2NJ7VA7jwMdgzxYs7eufAYuBRXQNkK/LmIWkQKdaRaAl2KbYMwoVle1Fj81I
	 97RUqwSCpAg7tk43x1toyzdNMhnFHm6XIxAmWDODE9hCvc7WxNcDUycfLi0rSnU+Q6
	 K0CDHbF7jDwrLRZxHo4Z9MEAyd3cgMxxROSGbQenKOKatMsY6g2vtK/Sik4HXVr/KR
	 7x6TJSgSAMuyw==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH] MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
Date: Tue, 28 Oct 2025 11:44:27 +0100
Message-ID: <20251028104433.334886-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali
GPUs") introduced the Tyr driver for ARM Mali GPUs, which is maintained
through the drm-rust tree, hence add it to the corresponding entry in
MAINTAINERS.

Cc: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..952aed4619c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8247,6 +8247,7 @@ S:	Supported
 W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	drivers/gpu/drm/nova/
+F:	drivers/gpu/drm/tyr/
 F:	drivers/gpu/nova-core/
 F:	rust/kernel/drm/
 
-- 
2.51.0

