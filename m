Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62420C472
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744329410; cv=none; b=PsneAfQNVAXdoQwrDarjBnk54Bfp0iqIxdaV2dshgLtcWt9/tRULAVpz0SZOAxp2C8M97xl63qjF+unZUjZHnX+lMepUdSO3ri0pm98upJOTf2JRa6+o0v+tJrdBS3cpBnImQ6LDz9owrHGAB8yGWFIP7ACiJxb8kLTDnT9uv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744329410; c=relaxed/simple;
	bh=wD7yKJZ0nhyYu7XvsWNjr2WHgkyBprIhC0Fvu9cLs3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5AQa7MqTUK9GQW2RMJbiqGoiqV14HhKjNMIm43MLH5ZLeIo6LDBuKiXaT/4T33MdFtDGbkbYWr+gVSDIcLg7JEcKTRC7HqGas7/3B5nGviVfFKELCro2Die5DoRsDnqdt/3OExCZEcKvRded9eqUUO7QuQc0kQd4QiXC1FUeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRGTBGbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRGTBGbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AA9C4CEDD;
	Thu, 10 Apr 2025 23:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744329410;
	bh=wD7yKJZ0nhyYu7XvsWNjr2WHgkyBprIhC0Fvu9cLs3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRGTBGbM/znZQMDEEZwSRNLiKgGvc9sgvs/jeBY/gs+A9Rw2P9fMR29cLRvQEy032
	 KzEdrSRuEvwypUU8KkV42NydDhWBzzvKrI93gNdJjMWE8pBdDgddLayWeeDvpspbEm
	 SGN+gzOb/AFnznTBU/1eaOzKZgniL8Ur3EKQOm9ZHovkPcwgEw28SMxeleocQp6ASB
	 Ez7edRIuRXIEY9eeUkjwvOAzauMyEh3ahJ9Du4XvGSGuEtqM4Stsd1HkL6+JYfneXJ
	 y0Cu0dMntDuQy9qE/3wSNcR/xAwhyQObKpgKLLFds8XiaRcFIciyI+SQN/neCFEo2C
	 FWl99Di44ywng==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	lyude@redhat.com,
	lina@asahilina.net,
	daniel.almeida@collabora.com,
	j@jannau.net,
	alyssa@rosenzweig.io
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Date: Fri, 11 Apr 2025 01:55:27 +0200
Message-ID: <20250410235546.43736-9-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410235546.43736-1-dakr@kernel.org>
References: <20250410235546.43736-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the DRM Rust source files to the DRM DRIVERS maintainers entry.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..a975fa8d262f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7798,6 +7798,7 @@ F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/
+F:	rust/kernel/drm/
 F:	include/drm/
 F:	include/linux/vga*
 F:	include/uapi/drm/
@@ -7814,6 +7815,7 @@ F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
+F:	rust/kernel/drm/
 F:	include/drm/drm
 F:	include/linux/vga*
 F:	include/uapi/drm/
-- 
2.49.0

