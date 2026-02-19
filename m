Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF93191BB;
	Thu, 19 Feb 2026 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512025; cv=none; b=cDO8oQLqQm/0FxmvBkkvyytX7oF8FiJ/1i+gyMmHnBg7XxKW4av8w5eD1fkrQGf/Gnt/pFIrQuqow5jNaCqu51zstPFyDuM3pFXJYb7HMEnQhgpiVGXC/2bTcKQTZUaZumD7Sjl1ju3Z7iDU8XnSQdbZ94oXyCN2pfuqJqKJcZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512025; c=relaxed/simple;
	bh=+mWop+SGGQtuAmErfrJzTJmQkk1/L/C3KS2AgGyoXZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SljB6Y+fMJdoC6SuCPX2ka6bPmsAzKUSLbtEHiycPE2D9ZYlWk3UaXqD4w8JTu3st1TOAjU0nMqe5Q71to7y3k1D+R0qPnGtaAL7l2smmuY25T/Ev1NVUQkC8pnKhwBctjFr6cKWe0/ABrtBuwt2TZgiu3JHJHLnwEz323H+5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoY/i30f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoY/i30f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDFDC4CEF7;
	Thu, 19 Feb 2026 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771512024;
	bh=+mWop+SGGQtuAmErfrJzTJmQkk1/L/C3KS2AgGyoXZc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MoY/i30fOkwRavStwnW2hKd0VBKt538Ome4n/uhfJa2p/7ilnAT001jdk9zIJZCTD
	 MlxXqosMVae1O0ATFtxFy5eDAHnxd5y88AaV62zFDruqjfSvtsv6dONYVqqTL1DdHy
	 fiavA8w2cVQUbS2zyZAjMQEl5hayM5k5JJ3l5eE7vHBDCR+FlWMh3pHfST0TT9Cwt1
	 xmMB6okl/zwtJozEfUKFPQM4pLNic6YXxW1wpgQ0bYLWJ04IBvVHEP9MVOaihQTut3
	 HmpDjvMGINDxbFP0Vb4tO/uy9WglTDR9WCXDOit4rSSzBuTA1yZJpu7smtylMqHEKZ
	 W+gbJLsd3sNag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 15:40:20 +0100
Message-Id: <DGJ0LNG3KO1N.35V3YXBLS6IT1@kernel.org>
Subject: Re: [PATCH v4 2/6] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-2-8364d104ff40@google.com>
In-Reply-To: <20260130-gpuvm-rust-v4-2-8364d104ff40@google.com>

On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
>
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Taken from:
> https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
> with __rust_helper added.
> ---
>  MAINTAINERS                     |  1 +
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/dma-resv.c         | 14 ++++++++++++++
>  rust/helpers/helpers.c          |  1 +
>  4 files changed, 17 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 618becae72985b9dfdca8469ee48d4752fd0ca41..8d44728261ffa82fc36fa0c5d=
f3b11a5bfb4339b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7467,6 +7467,7 @@ L:	rust-for-linux@vger.kernel.org
>  S:	Supported
>  W:	https://rust-for-linux.com
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-=
core.git
> +F:	rust/helpers/dma-resv.c
>  F:	rust/helpers/dma.c
>  F:	rust/helpers/scatterlist.c
>  F:	rust/kernel/dma.rs

That's fine for me in general, but maybe the DMA BUFFER SHARING FRAMEWORK i=
s
probably the correct place. DMA BUFFER SHARING FRAMEWORK is also under the =
DRM
umbrella, so we should also add it to the drm-rust entry as well.
