Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594E39DBFE
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270291; cv=pass; b=sAPp88di+ognsbXVGDjhy9byhto5LzwjVBdt9Oeg4HIvpR+9gc1iZudAW1e94mPq1ax3E9V2Fjj0rSfwIH5Fn9gQ7ie7ZTvDJmi0Q0u5nIRe8RMHe6XdC4i7gexhXXSTmQS2XfIH2popQxq5C0vON/CLUHFeyNt+CsOFY6+L2c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270291; c=relaxed/simple;
	bh=rMcctwteKG8Xh+sRtGaa+Y1MF4VoaAsf3Y6bj0iQuHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewCN6nqI6faYZzfmIlNHssHEwIZE5vQQ0QdvgxU92WcUYNIbGYWhksmiYiQk8rjcbYSVycbQygdATQzguxcFWisLsxhjSGUNBZLTf4au8ibArDHLclKnbqNJ8VDWcmPyry6JVuhopQ2YTjeg1FiO9RO5qEND2GtxSoRp6LyVP+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Sm13O96B; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Sm13O96B"
ARC-Seal: i=1; a=rsa-sha256; t=1773270270; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b9tNZqkXV2H3hS+EfXkqhAYLOf6Utbgr8TyuKRW6r79q9pyFx6wUbC74GlVb7OYnyTI2NXuFcxLNthySMSdaP3Ckzy85udJ8AVeEkjWWaEAUrMUuwyxkMvM8HjRhvYK/MAtA5IS/lJH6KK64tJ66fSZ2XQ2/S8zrkOj8Sf+VTUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270270; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iTybMURHQ311bMbIiYhoFOdTrxlhhPYel+M+GNgLouo=; 
	b=IGpNWAjzUnMRtjZnNS77L/pcsii7HecyvKy2IyjAAk0VgaRaswf5xLIPRe+JSmNVMbxud48jOWTWcn+1T0KWldYMCvYWGa8b42Cuf/1Yq0OevK/Av93fVCsYYxCNuvOSaV/rH/4OZtG4kBYwytMt8Xw8riPedKXzVRbVmgsojsg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270270;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iTybMURHQ311bMbIiYhoFOdTrxlhhPYel+M+GNgLouo=;
	b=Sm13O96BmHn6GR6kOrxoWRueNzKW2usX1rkVt+js03AFKu8XaSNzIqNGKMYRzYrn
	CUlL8wMZP0PuHN2PxyZ4M082ykJrOkT8MYkrJqLiqB8cWYfA+NUGqTu1+o1g8MU/rXX
	enHOZ0bvEtAjhRRZ8RUrCTGQMtELJak78og3r1d0=
Received: by mx.zohomail.com with SMTPS id 1773270268071883.1934255356537;
	Wed, 11 Mar 2026 16:04:28 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 11 Mar 2026 16:04:02 -0700
Subject: [PATCH v2 5/5] drm/tyr: Remove custom register struct
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-b4-tyr-use-register-macro-v2-v2-5-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

Now that Tyr uses the register! macro, it no longer needs to define a
custom register struct or read/write functions, so delete them.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 6c16a041ab3c36f8aaf785487ad61925be65a026..3fc5101c2dcd5d892abc726ea07d75d8f22b5d23 100644
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
 pub(super) mod gpu_control {

-- 
2.52.0

