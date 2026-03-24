Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A360119F11B
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311518; cv=pass; b=LISeZ+u3HaD2xyDOOYeMy0XhPp9YL8VRYF/6BxJRGOkKj5GLoE5oUKNBY+U7C56R2iu4m1gQ9goe+FXo7e9d+3LNpe/IAeR4coZ5YIhvmC9FwXvG45/2KdstgOqUzEFEKiTgy/XwVTN5Az7BpVfdFTCKbKqext1PjOdyNzKft6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311518; c=relaxed/simple;
	bh=y/eX4Nan4CWOmpCMb7JU44AvApniset1afnI5FprGDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGKekGsWIQwi1JQ9FfZgHXMOVKJD3KHZ34baqBYqeKLgm15MiEbKshrmVinsOjRPiNYN+i8mhe/1Z4iRLKtAFVhSAU7PDrmgsPvPhAZ9k8H8Xt7FjzzBMt0CfyIipiN/mkEM49T810OVKPfhOb3d6RWeTToaf1F4tXYqPpBzx7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=HXwZHwOz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="HXwZHwOz"
ARC-Seal: i=1; a=rsa-sha256; t=1774311494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G1sIxVzTS+cgbMUCria/ovO9VyzQGKrsgxwaJ/osZYl+Dm+kJSomlBPJUePL7OV1FrVtdWa8vfX5UM8meGzVBi/EUr+9DtXVUdMxJf5h/F0UgCyga2B6oJHaJOi38M8ZG1Ed20+rITeO2cae6FSbwETTKDk+gssWzeGrnx+cwxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311494; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y8zaiwa3hpPfFoOxkcz0fUhM/cd50FNBf75YfDVuvyg=; 
	b=UHku+EfUuxOUmRQLvXXxIDzqyNX0Rp2UmNBj25Ge9DtTAgHUERQkmeA3qVBUVeG1iQ8a5+8k7L9Rmpnmu37NqgujhlXQs8nWmqTPUotVG+y5wDelDWQghNI+OYeQzFsCr0lK/KVmkFGH97Dhe1eyV02fgHRomqx+RNbtVtkt5MA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311494;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Y8zaiwa3hpPfFoOxkcz0fUhM/cd50FNBf75YfDVuvyg=;
	b=HXwZHwOzXv5K3EFmtSsWM1P2j73TWuuizRRa9Ye0M5jKMqdcHZfKTow4PpWKVjwL
	TPj29uxPTQ0cEp1EVM2SVKoM6mlXi1VOSYNNOepDzpO+q9XBrFJqunph3uUmcMA0MzV
	wiDVr8cZsl6Sl8zu4e51MJlfi7axFnvZkT3DbtLU=
Received: by mx.zohomail.com with SMTPS id 1774311492566704.1233899822591;
	Mon, 23 Mar 2026 17:18:12 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 23 Mar 2026 17:18:04 -0700
Subject: [PATCH v3 02/12] drm/tyr: Print GPU_ID without filtering
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-2-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Boqun Feng <boqun@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=y/eX4Nan4CWOmpCMb7JU44AvApniset1afnI5FprGDM=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbzjcK3Zl6zXrj5zGcWPq5s6QvQEx1a7CrZed17Ke/
 lX9Mu9MRykLgxgXg6yYIstZe6Me8ar3Rrrz/zfDzGFlAhnCwMUpADf5MiPD6vio2D/TXGa17Tmx
 UJjxljRb8XKdtispG1T89Y5sdA3fwchwZ8oe64lXjsj3HNvVlKw3vf3ITK/LDQJWjGVWz5PncCh
 yAwA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Currently, Tyr prints just the upper 16 bits of the GPU_ID register,
namely, ARCH_MAJOR, ARCH_MINOR, ARCH_REV, and PRODUCT_MAJOR. This matches
the id printed by the panthor driver.

To avoid the manual bit shift, just print the full GPU_ID register. This
prints all of the same information and adds the VERSION_MAJOR,
VERSION_MINOR, and VERSION_STATUS.

Before this change:
  mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5

After this change:
  mali-g610 GPU_ID 0xa8670005 major 0x0 minor 0x0 status 0x5

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/gpu.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 66fd6c016c62abe3c34669a2e47b680c3a3f873d..4a50055b415c693a89cb99dba241b21351a14149 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -124,9 +124,9 @@ pub(crate) fn gpu_info_log(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result
 
     dev_info!(
         dev,
-        "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
+        "mali-{} GPU_ID 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
         model_name,
-        gpu_id.into_raw() >> 16,
+        gpu_id.into_raw(),
         gpu_id.ver_major().get(),
         gpu_id.ver_minor().get(),
         gpu_id.ver_status().get()

-- 
2.52.0

