Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610021770B
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311523; cv=pass; b=p50uYlaKY0kjNVtvFh4c1825/dh3RoOz+Bxb0Kqndjttnc0DuR+myTnLFL1UJoHk1YbR9z2g/z8iZmHUp97/vketEdClSayaYM/FuqVurKfDE7V02KSMoD/YlCLighyK19NAaqFHvUlFgoYzp7iPB7J8hfHVjvL8BMorhNA8RCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311523; c=relaxed/simple;
	bh=ZfJpfRuNxawHgkICS0xQGgs/Jr0fdebE/SZzwH+FNmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU1HklNkc+rbzfnKX98oYkY7FF+HveGaHileAVxgmdoViV3GxnW6003/LPBHSUNJTSJqUpXGVDhmxtuSqiAPN9DaH/2zxAY0xKHJaWfo9G7u8fSLmvKUDvagXycGgvBvNjVt9QaBBWr2RxaR7A9lyKO4oqxsE//hiQjYivOjq2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=c01Uz9Cl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="c01Uz9Cl"
ARC-Seal: i=1; a=rsa-sha256; t=1774311498; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DpQrMAUtDmklrh+dMFnyZNkjtma5XMbGLoAyb66ewlEoL8w1+4M7W5QAu+nWUHdv5som1kXUO5SLSBgX7JITtDGP7Nt7jY7oLtk5cEFjbcTX3YM+rC8/xlpI9EtjdwLGLDMKMq9d345QhnXrLN5STKLI2kewv2CnJQxKbGaCYYY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311498; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6q74A0Sa3TLXy/irvwXOSFCbd/3fgC5qNc1kx3bsoJ4=; 
	b=T6GsgPhaOOsaa1uuPZbWrQyDRpSnq71meYjKtcB9dE7iAeKRa7AEdeLsccSNk87eXx8fYrY/k5IJy407nxwSp5o13+ede03kumuynMuvvBQgQAM5VeBt/4Zonmo5NLLXjEqx2nxgRdZQ/PQrPpXWV3/T8qyGg1zINpj7Fz8fWYg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311498;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6q74A0Sa3TLXy/irvwXOSFCbd/3fgC5qNc1kx3bsoJ4=;
	b=c01Uz9ClHfuYEVU0QIWFmXPjh6OVWFbk4aSTY9FzkqgSY4j/DMutQIjA1BiZS2/O
	4CD2hvONj83OGRS32NTpz7E1vrtBkKQ7sFn1oyF0/yOdow9ybS47nxRGTXW383w2kaO
	K0yebWWWt3TPZ95Ecp9xgMOvLpcX5fqEXu2X2PS4=
Received: by mx.zohomail.com with SMTPS id 1774311496998157.28704819988263;
	Mon, 23 Mar 2026 17:18:16 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 23 Mar 2026 17:18:08 -0700
Subject: [PATCH v3 06/12] drm/tyr: Remove custom register struct
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-6-a87daf9e4701@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=ZfJpfRuNxawHgkICS0xQGgs/Jr0fdebE/SZzwH+FNmw=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbzgocQsECHQG9U2KSeLfXNtdlnfKdF6sdUTExIAmA
 Vnetk8dpSwMYlwMsmKKLGftjXrEq94b6c7/3wwzh5UJZAgDF6cATOT/dEaGiX/eed9WUy589Icr
 ultocxUre7LQ7U5d19LqEtutXKUTGRnOaU3qPaK/q44txzyI48yZHpOVn/kM1B2eNk/9fbK6xpM
 VAA==
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Now that Tyr uses the register! macro, it no longer needs to define a
custom register struct or read/write functions, so delete them.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 869bad81d988b4c3d4d65e014d646b6db568e919..f337d99387417a2eca94cd2d7ce8c8fa38bb1cee 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -27,39 +27,6 @@
 // does.
 #![allow(dead_code)]
 
-use kernel::{
-    device::{
-        Bound,
-        Device, //
-    },
-    devres::Devres,
-    io::Io,
-    prelude::*, //
-};
-
-use crate::driver::IoMem;
-
-/// Represents a register in the Register Set
-///
-/// TODO: Replace this with the Nova `register!()` macro when it is available.
-/// In particular, this will automatically give us 64bit register reads and
-/// writes.
-pub(crate) struct Register<const OFFSET: usize>;
-
-impl<const OFFSET: usize> Register<OFFSET> {
-    #[inline]
-    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
-        let value = (*iomem).access(dev)?.read32(OFFSET);
-        Ok(value)
-    }
-
-    #[inline]
-    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
-        (*iomem).access(dev)?.write32(value, OFFSET);
-        Ok(())
-    }
-}
-
 /// These registers correspond to the GPU_CONTROL register page.
 /// They are involved in GPU configuration and control.
 pub(crate) mod gpu_control {

-- 
2.52.0

