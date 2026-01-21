Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6276537A48A;
	Wed, 21 Jan 2026 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999204; cv=pass; b=NXnZLs166bxxspHASXZFSqT1yWhI1oboVPATaVh6JjBt4WcOoJgrTcchuLkYIMBmUyfVF4xEXXF+baiod8yH6p8XgWZwOIfHR0oly26jccBb1dn7gJuVh5qQNIGpa+pMEjo+lyfZrMjCh+bQmlkhEANZOink/o6fnZlwxYgiKtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999204; c=relaxed/simple;
	bh=FruKUZeVaEO2vIQoZYU5RL27l134hCl5y4HXfvFxVe4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HTvEi7scHxqDEvZYzLgh3Wh6dxkzasJLA4I5jR+vpFpiaCPvNK2TpVTB9ma48VnQJgebaRwfQQ46OVLnDDrHLQioCo6hwsF/Y9llIR+L7oWIq+TNhhxZaTtzBjmpZD7bkl938KMKpb2JkFI/6JLCfBJS3svvCRqbGOkydleWnJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=SUenF38y; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="SUenF38y"
ARC-Seal: i=1; a=rsa-sha256; t=1768999166; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e97FuFEyOckkW0iWrstCnoKMKeVePHdcvvGnhNkZWB7MTlEFnbNM/CZ9Psltm0ug8T9QzpMNY36wfyAzLGt6uhzlynhXmLdGWYcK7PHzwisjMd/s0kndJM+6wcmVNoiTKRvaQzF7mBHqFjWikiL3pf9PPGWzBXGO1POZ5ao0xKk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768999166; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QBXUqKedMswOGKmU4Ch5i/HnxEVLO3CtXRwgzv6nR2g=; 
	b=Psa0y8/6sOwBKUpUqDDab1cilIWbATi0VEERggqn3xXppRvLHPUzA6jE71k6UhRJGGlJSyXt8x/U5EACAdAJLbzRMcx1C4fJa6f/mFKTTWtdAOkf0xc76YvDeCHENV0Bhe6XAsfd/b1DtNGXk3hQPQyrBP7ozbyYxGdHz2FW2sY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768999166;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=QBXUqKedMswOGKmU4Ch5i/HnxEVLO3CtXRwgzv6nR2g=;
	b=SUenF38yVmB8gKM95QkFajCkTKVgFX0ZmLpkMgrnxkRIPpGBSamAHWObVSXtGE2C
	7XwwxgyY1ZffJX2oRAO1nHROXs5qiVBs/kcy9NKDjdoF2X9iXuIU4g8oLYuv/mOtysZ
	ma3ZRvlGIjwPgPxSR3N/g3QnNNU6n17oEtX2LV2A=
Received: by mx.zohomail.com with SMTPS id 1768999165019356.93375165160535;
	Wed, 21 Jan 2026 04:39:25 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 2/6] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260121-gpuvm-rust-v3-2-dd95c04aec35@google.com>
Date: Wed, 21 Jan 2026 09:39:08 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <34582CF9-6EBB-4205-B05C-D30E9C3EDD25@collabora.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-2-dd95c04aec35@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> From: Asahi Lina <lina+kernel@asahilina.net>
>=20
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
>=20
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Taken from:
> https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
> ---
> rust/bindings/bindings_helper.h |  1 +
> rust/helpers/dma-resv.c         | 13 +++++++++++++
> rust/helpers/helpers.c          |  1 +
> 3 files changed, 15 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index =
dd60a5c6b142ec2c5fd6df80279ab6813163791c..ed80dd8088bc60c67b02f7666e602e33=
158bb962 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -52,6 +52,7 @@
> #include <linux/device/faux.h>
> #include <linux/dma-direction.h>
> #include <linux/dma-mapping.h>
> +#include <linux/dma-resv.h>
> #include <linux/errname.h>
> #include <linux/ethtool.h>
> #include <linux/fdtable.h>
> diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> new file mode 100644
> index =
0000000000000000000000000000000000000000..05501cb814513b483afd0b7f220230d8=
67863c2f
> --- /dev/null
> +++ b/rust/helpers/dma-resv.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-resv.h>
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct =
ww_acquire_ctx *ctx)
> +{
> + return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> + dma_resv_unlock(obj);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index =
0943d589b7578d3c0e207937f63a5e02719c6146..aae78c938b0b5848b1740fb3f2dc4b7f=
93b1a760 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -25,6 +25,7 @@
> #include "cred.c"
> #include "device.c"
> #include "dma.c"
> +#include "dma-resv.c"
> #include "drm.c"
> #include "drm_gpuvm.c"
> #include "err.c"
>=20
> --=20
> 2.52.0.457.g6b5491de43-goog
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

