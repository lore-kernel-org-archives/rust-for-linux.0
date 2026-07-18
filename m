Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C938821E0BA;
	Sat, 18 Jul 2026 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784404420; cv=none; b=DnaLzuDp3SFrJiVmaZ9XXEwkJzgPsfxxxkf9E6xWcKop0p8awDGr12QR6ykdGzEl7TDKFn/3gFWM0Ti6FuLJ9BjYevNXgBse9pvJY50SeffyprMk9Lj7AnilfB30Z8GFz+MnxGU/RPwIxx0/GiV1TB6UZQ6BueRysWdpBUa/fKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784404420; c=relaxed/simple;
	bh=lMq/EhsOacgV0jgXVNu8dJ4WMrAAI5hxCgiwsBgvYRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U6CvXBq+HjbxED3bp5jEMmtunC/O/CHkh5DEwmyK8rH/Lah6/a9RgzAn8RJIxnYCCxWj7PP3VopM2eH+uzCQ20TYbu3perYctXO6A/Eli6GqHefJAIHDE0bnX5J4NuJQBkqHHlUjPy7oWLeIJJaXnYlbUccEbhgKpTGm5ZlOHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WWObqVrr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WI2x8e0I; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WWObqVrr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WI2x8e0I"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h2csW1lyMz8txp;
	Sat, 18 Jul 2026 21:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784404415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q9fGxwUp7I/1j3y/cSl5ogqwUUkW66zHyf7/sZoHXyU=;
	b=WWObqVrrmhIG0kM1hCCcfPtwlJk0WDTsc+ejv2vdUGt4I1Csnjja/KgBAghVkRpM5wBiuY
	hMSph4Udg693I0UsRWv903xpcocmysD4VLqkBEDEEOa5xb7FUS0iJBMVZGxmi0X3Tm+ObE
	tLQna2JlA3uRQvskvjQUHDJxtdhs/5DNRWp3Zgmsfw7H3jA/0h11MlOCdYDaZmrBwlhTLu
	4IRdnLDNH8nJFHUFj695VOQlvRY4QSLhPmCDNCZagNLnRyWDHovZng/O2jojaE+s/1D1hI
	Q4w2OHcGsmFjlN+KMdqqNB/BjIk1qiLAgOZCQuS/heJBcINzSjna9pzYb0qDUw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WI2x8e0I;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784404413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q9fGxwUp7I/1j3y/cSl5ogqwUUkW66zHyf7/sZoHXyU=;
	b=WI2x8e0I3zpOG9B8EMvnjDgrENRjt48r45b+ab0qrr4N1B9dMdjGpKxD/cBCIx+qIvJLf9
	wrh/C+DxX906XWI4SCPOkDSkj3SMAeZ7Oa3sQcZE/9Z3rnJH3+rQt31UVWTXMV+mV5cqv+
	92CKAyeG5/eCqGvOazgiCWzq8q2mYk3i/nWcQE4eCAjntTxG9UWKbLsAphjOGmTswoPMUh
	Cg6zRkvez2mWvjoscVxg/2LJsMmlPXqX4QrodAAIJqYnHleQoBD9BGwMbwgr0aq8lC3nrZ
	5eNJTfSAApjTP2CxEaPqJuDHBQO/ArGMVD8ofd59yaFfjUgdo6Qu4uW8wQQ7zA==
Date: Sat, 18 Jul 2026 21:53:19 +0200
Subject: [PATCH] rust: drm: gem: shmem: drop stale dma_resv locking TODO
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-rust-drm-shmem-stale-todo-v1-1-b81ff0663f49@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMBCE4VeRPXchClXpq5QeTDKtW6opu1EK4
 rubtpeB7zD/RgYVGF2qjRSrmKS5oD5VFMZhfoAlFlPjmtZ1dc+6WOaoE9s4oWweXuCcYuLQeZy
 B3sM7Kv+34i6fX/t6+9sW/0TI3yDt+wEqn1yJfQAAAA==
X-Change-ID: 20260718-rust-drm-shmem-stale-todo-c7be5ee8beb0
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Maurice Hieronymus <mhi@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784404408; l=1485;
 i=mhi@mailbox.org; s=20260525; h=from:subject:message-id;
 bh=lMq/EhsOacgV0jgXVNu8dJ4WMrAAI5hxCgiwsBgvYRE=;
 b=JBehnO1NTKxdJ5KkSMWWWjPdtBFyqOhxO+e9LgPYs3ZQq3o+PH7TGk1JjQ32HvA6Hvv2r6pdM
 Wij3c6bYMccCTaXlTYWogZ3LHlH19mXKS5uLohUeY4PID1dRkgmT1a0
X-Developer-Key: i=mhi@mailbox.org; a=ed25519;
 pk=AHlEkGG3hpXZHntlEzF42Ip/LFyXWOgsNUvaHqAnV80=
X-MBO-RS-ID: c76ce972a1cfbbd5e12
X-MBO-RS-META: qce7o56o34skw5fb7kcro4pnkgg95fnu
X-Rspamd-Queue-Id: 4h2csW1lyMz8txp

The TODO describes "a number of spots here that manually acquire/release
the DMA reservation lock using dma_resv_(un)lock()", but no such spots
exist in this file.

The only `dma_resv` reference left is the `base.resv` assignment in
`Object::new()`, which takes no lock.

The manual locking the comment refers to does exist in
`GpuVmBoAlloc::obtain()` in rust/kernel/drm/gpuvm/vm_bo.rs, which already
carries its own equivalent note, so nothing is lost by removing this one.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 rust/kernel/drm/gem/shmem.rs | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 34af402899a0..3c1d75b54c2c 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -4,11 +4,6 @@
 //!
 //! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/drm/drm_gem_shmem_helper.h)
 
-// TODO:
-// - There are a number of spots here that manually acquire/release the DMA reservation lock using
-//   dma_resv_(un)lock(). In the future we should add support for ww mutex, expose a method to
-//   acquire a reference to the WwMutex, and then use that directly instead of the C functions here.
-
 use crate::{
     container_of,
     drm::{

---
base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
change-id: 20260718-rust-drm-shmem-stale-todo-c7be5ee8beb0

Best regards,
-- 
Maurice Hieronymus <mhi@mailbox.org>

