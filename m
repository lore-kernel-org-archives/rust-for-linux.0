Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6D923A563
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 23:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742946993; cv=none; b=N4+lI/45lc5paQlVo8Ovoo8xo1jpF7w3k4iQJKYnb8TACofrLyIqBrUTaP1ZktZeQEIaOrpRdte7mA4GiwpAUfNFr7DLCjLsl3GOwzbANeFYyP0MdYbx+YrF7F/7Yv6h2e7+qXb2r0l3MvJ+uqxljVZot/cm+j2QtjXftzOnBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742946993; c=relaxed/simple;
	bh=J+5Ar80w8tDhl22LAV7sasRTJlBrOL/KbuhE9AE55Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWXN89oBEJPJS9OdEFkZYcw1ZX/M8SOBhTQsTJFEhQ2vbVMaVWB1kq1U61HcbyM83M/jAxvySvserxbIkFsPxRq91d6SKDxBEZqVovlAxtPHV2X5SEaQP6NgIxmuhDfb9LUJRXusxxUCxIVu+iM+qh3qsu8JNLyM5ShYQzwEnnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/AW+Nqd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/AW+Nqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF010C4CEE4;
	Tue, 25 Mar 2025 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742946993;
	bh=J+5Ar80w8tDhl22LAV7sasRTJlBrOL/KbuhE9AE55Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/AW+Nqd0RyWdaexZMH3zktzNe83G/6XI83y/5R588bTz0KSUYt21ql2VlmIbVi04
	 uW7tliS5n6VBYjkhEGFnedcCHmjR4ey1VRFlXBS2H3xAYRXrGW3hfB+pY4a/iAlpi7
	 KAN/nMgtQE2+0GPSE+JCnQvzwx3OTkMmCdbuhWKD+aMwfaLm+fcBonRGbqarc3zz6R
	 KCEbN2T1+gtA1/QWNDVnOU/ewK5wSJ6ddkoXTKg8bSMRPvoNNnqHEXarzdnXRUlgmf
	 Uf5wAraulI9xq3H+F6zhzxsc28fgNizhUBSEOHK4A9xN2B7Gl9Aq8W+M4hprQub2JY
	 AduQ7YO9hCf8w==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	lyude@redhat.com,
	acurrid@nvidia.com,
	lina@asahilina.net,
	daniel.almeida@collabora.com,
	j@jannau.net
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
Subject: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Date: Wed, 26 Mar 2025 00:54:35 +0100
Message-ID: <20250325235522.3992-9-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
References: <20250325235522.3992-1-dakr@kernel.org>
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
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index de46acc247c3..c704431f02aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7672,6 +7672,7 @@ F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/
+F:	rust/kernel/drm/
 F:	include/drm/
 F:	include/linux/vga*
 F:	include/uapi/drm/
-- 
2.49.0

