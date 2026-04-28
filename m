Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAA1ACED5;
	Tue, 28 Apr 2026 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404010; cv=pass; b=UDzJ9J3MPpE8StOB43hGhChi2PTU6rBWNfgfDg8fCdLRDFoVWi79IYRcVLZyG9YcUknmpDS6hXGtt3inEkj+kDiIY0EAea35w9N95JTik2MsC6VJzXPQyP//YJmDT0IMQg/UYBAn04Sii49SdRB6569fUMN5suzsOa0q+VkKb2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404010; c=relaxed/simple;
	bh=C/IlT6foYoxu0RNVT4bIEEkbXufTaRhrVVLu+1cB37Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oa2BbX7J2PYC3iPUajSM3TqGVSd5EOE8G8qa3SM7nEHNEbBOXksj56KAdNNo/JiYcy4DRiNr+ILjrgxGGz3ggwLrR5Y0FyHysMKrcufghdHBwTRPOPBc1Dmvk6LdjJWB8jMN64C+g9RdzBOkz0IkwqHvn66uG1TkDxu/dsLG8No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=fTUFpKI+; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="fTUFpKI+"
ARC-Seal: i=1; a=rsa-sha256; t=1777403981; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gp5oWEVRkyxshS2sf3FbWXYB2aPjtEKBarevFnXVMq60HYh5j2v7NqIodUbIXjwGIz/lOgkgAcd+9ebMeUDIIUyq8lq8LHDU1lv9jefkeomCzHwzMxdHQ2MBtk1NCkh4bYGtYbFX07Dbueoct77XWwYuCU0ZqZNKtzsnfo185ZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777403981; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lylB4VdZYd/+Mm31ZLwjGWKc27cf1j1mM/6RvQC+wUw=; 
	b=Jnrn1Z0EH8IIXG/7Br9I2lVhV4Y6S0AirmFQA5LWfkYckzXWoNygN6843nIyqyHxGw2BRVjhXb4iuFjA7vf5qJh4KO698+HuaQLuw2G6fiqYv7kw4uUh03PTcYM2CK6Izl7JsqVpN4oZM1gCfQRU3YFvqKUbGD2i4b32Hnj7LPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777403981;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lylB4VdZYd/+Mm31ZLwjGWKc27cf1j1mM/6RvQC+wUw=;
	b=fTUFpKI+HyVEctl1lhx0xGez+GjFP6P999D59RhOIlcnlUTH0HpMGjag14RtJvXY
	x7+ILYfa3e0CW5CK4x8sNetYdmpa0DrzbdbcYd1De7b4p5Q48XjXRpyBzAFDN4VOD3A
	tSml0agzQcs/I+yJs3jaqYdrZ5fDSlPJNIsZxSLo=
Received: by mx.zohomail.com with SMTPS id 17774039800641003.5924833519763;
	Tue, 28 Apr 2026 12:19:40 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Tue, 28 Apr 2026 12:19:30 -0700
Subject: [PATCH 3/5] drm/tyr: use shmem GEM object type in TyrDrmDriver
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-fw-boot-prerequisites-v1-3-c69af9abe1af@collabora.com>
References: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
In-Reply-To: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=9AUqc1pwEO0X2lyd1ardJI/seFGgn87n2wfHo+jWFIc=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkfOdyjf6+a23rqoWHiT5bTx38mCUgKLJp9ZOnqD+Z7W
 fheOK692VHKwiDGxSArpshy1t6oR7zqvZHu/P/NMHNYmUCGMHBxCsBEFLUZ/rtdZ/43/247q/IH
 jquuh/rXvHR3FnJJlldyijLPUlqV5cbw3+X51delmy9O9rCvn9Giue2p1465W20+HNVJ+PKoaMG
 8VFYA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

From: Alvin Sun <alvin.sun@linux.dev>

Tyr buffer objects are shmem-backed, so the driver should use
drm::gem::shmem::Object<BoData> as its GEM object type instead of the base
drm::gem::Object<BoData> type.

Switching to the shmem GEM object type matches how Tyr allocates and
manages its buffer objects, and uses the shmem-specific GEM abstraction
provided by the DRM Rust bindings.

Select RUST_DRM_GEM_SHMEM_HELPER to ensure the required helpers are
available when DRM_TYR is enabled.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/Kconfig   | 1 +
 drivers/gpu/drm/tyr/driver.rs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
index e933e6478027..51a68ef8212c 100644
--- a/drivers/gpu/drm/tyr/Kconfig
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -8,6 +8,7 @@ config DRM_TYR
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
 	depends on COMMON_CLK
 	default n
+	select RUST_DRM_GEM_SHMEM_HELPER
 	help
 	  Rust DRM driver for ARM Mali CSF-based GPUs.
 
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index bb90324043ed..cdb9b13bdb32 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -171,7 +171,7 @@ fn drop(self: Pin<&mut Self>) {}
 impl drm::Driver for TyrDrmDriver {
     type Data = TyrDrmDeviceData;
     type File = TyrDrmFileData;
-    type Object = drm::gem::Object<BoData>;
+    type Object = drm::gem::shmem::Object<BoData>;
 
     const INFO: drm::DriverInfo = INFO;
 

-- 
2.53.0

