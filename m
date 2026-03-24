Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CAB3DFC84
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347044; cv=none; b=XSnzXAZfOPSIXB+Cwz4JwWMRj75mXqAQPIfweIdrIAS/urcRS+5qGBy5RpPtZJYMFh1JOKR6Libn46Xlw3I7zH0QoWpaFKZdj8zeUN+dpLV8yRRf+PX+UV3XKjAZ86zHRIJa6NNuIolShPj8DUgmVJWMFTLvV63b/SMBaJTwtJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347044; c=relaxed/simple;
	bh=tS22eFJysKVo74hNZJDcXq2eJUM5PcZGoUYIH3gXpZY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aA0Yz5eynfk3XE8qLDaP2/cjwzAJkYxUt2HhBhpirCsldOvOin1Kjk4Vb3ShC/vdbEd92aEW1O4X5uxqdFNy9lfjek/L8mPVmMm01J3BH8OGehvp3jlH+8K1pNPkeYPu+vJSeYETya+CV+GWJAZ399EjRU9zs4B2Zjo4Hug7hoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c11oOv2o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c11oOv2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774347038;
	bh=tS22eFJysKVo74hNZJDcXq2eJUM5PcZGoUYIH3gXpZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c11oOv2oHgIHO9OgZgjbPuMep+RcwIt2aYzFcrmDujGR5DL8WQv3zzzSiYjWbwk71
	 CPI7KIwQVGBbFiNTMoKNYi7uxm9uLTKhI/pCE+/f9VlplfNeVI56vu1PaSrEB2GrzU
	 LWFohktU62E9ct289Sody6prDVqleuCth3Wsi39Ou9z9Ud9cUZ2oOOq5fV0+tjERej
	 2Ehg3P4WiD9xfEuofoGOdMFrwyzz9Gsf/Pta+YNxZ8ICWaqSjsh14Kn1fSCEBX1K32
	 sQdQEpC9tVqmDIcVsLY2H3ry9sIjg/o1Yo/JoNVtAAcGKcGclk0suX+VQNrQpZ8Jid
	 +C7wc8o0C+pVA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A21C417E4D95;
	Tue, 24 Mar 2026 11:10:37 +0100 (CET)
Date: Tue, 24 Mar 2026 11:10:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Boqun
 Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 12/12] drm/tyr: Add DOORBELL_BLOCK registers
Message-ID: <20260324111033.6504e935@fedora>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-12-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-12-a87daf9e4701@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 17:18:14 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> DOORBELL_BLOCK_n[0-63] is an array of GPU control register pages.
> Each block is memory-mappable and contains a single DOORBELL register
> used to trigger actions in the GPU.
> 
> Add definitions for the DOORBELL_BLOCK registers using the register! macro
> so they can be used by future Tyr interfaces.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/regs.rs | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 7e895b6e7deccc049a0ee3963d511c4b579e5ec7..9c1da1f039ccf9fc118def974d48dd40c17f4305 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -1474,3 +1474,25 @@ fn from(sh: PtwShareability) -> Self {
>          }
>      }
>  }
> +
> +/// This module corresponds to the DOORBELL_BLOCK_n[0-63] register pages.
> +pub(crate) mod doorbell_block {
> +    use kernel::register;
> +
> +    /// Number of doorbells available.
> +    pub(crate) const NUM_DOORBELLS: usize = 64;
> +
> +    /// Doorbell block stride (64KiB).
> +    ///
> +    /// Each block occupies a full page, allowing it to be mapped
> +    /// separately into a virtual address space.
> +    const STRIDE: usize = 0x10000;
> +
> +    register! {
> +        /// Doorbell request register. Write-only.
> +        pub(crate) DOORBELL(u32)[NUM_DOORBELLS, stride = STRIDE] @ 0x80000 {
> +            /// Doorbell set. Writing 1 triggers the doorbell.
> +            0:0    ring => bool;
> +        }
> +    }
> +}
> 

