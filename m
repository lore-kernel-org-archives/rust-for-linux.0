Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E914293
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Mar 2025 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346288; cv=none; b=GCu+3A7yHQEVQomFURQ7NF3o7BVcS/P3nHLbN1ZYCGtnDaMJbe3UPcCOpD3IRZcE/tOfl5oXRfP7Y4O2MpJcxpR/otkpWbKsxx/HvZoWGBPkTIK6V422oh78dwsRif5TJ24kCuyIFyHDff1IeQcZP7OjsRbS0Zcyj+y6osH77Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346288; c=relaxed/simple;
	bh=aV2N+gi/KxHt+cRDpHyCOE0yhPBLPVwL0fDQFadQGrA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qtX86Z0Y55mE20kU1YhLMtFGzhcyEN0PtU0JnnztCP0aMbgq56rKYrGaXPiEd3TKWj9nGIFd3aadna/KxOlT9wef5eiRiN6AF1rxKosGlL2dB31SIygiJM6RJBDDDjzYmPYBEqbSr6Pm1lA9jSbBCEJWAD9a6xowKHLCiPjHems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3MIPP2AX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3MIPP2AX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bc5a18c52so7600975e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Mar 2025 03:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741346285; x=1741951085; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRLcibLkNuqSJ4oebIn+gemASecItzRG6bVok0DbXQU=;
        b=3MIPP2AX2vIYsuJIas+Gh5KZpF6cCii+B1pUVtXMTuXN1flHEEfuoCxT/IOB1JBsN8
         ayUhEM1evvircbk80utUiTVtua2lOM9qt12jPsCe6pwDMZQzxUIonMCE0erLB+jfn2mJ
         9cStgYJ3oTRSQRJaXB2/7ICxbokzKa7Txs+eTo7UjTGNiuzmYr/KgJkaLPTcAinCpIef
         0Wufb87AvU7/2zpGqblv9/jJChA2dmQWLuwBWHeO0VO3Yp9FFGrHdB2y8vT/BKwtw+vn
         OD01FdjIwKQRsXGh3WrvPB8ri1IbUS5hL1obV1kTXlH2YbQL79c8K3f/ZweTXUE1O6Oo
         Kc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741346285; x=1741951085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRLcibLkNuqSJ4oebIn+gemASecItzRG6bVok0DbXQU=;
        b=W+G26pU+kwrGt3jPpKwwZXKd9kQpiAq9GMYNoAhzbKp7E4VDZ7iuywx/s6KeGA32GJ
         cAn/OEgThojFQKT/aIipCgjIqqikNWwwkybpy4NWVyi6m8xpHnleXKLhwbmbwV3DrNJt
         U5lt4q7saPrq8jfn5SsmnM45vNoJ39zDDQvQYvSaja8Tq+xudb4jC0vfYB2fCgTQ3Qs1
         yBJ60fxVUvLuJ3KDhsUqKGhi+hUm3KZBWEO/jn1BcpkAuxuMR3JgLWmL4PDF1u7ZuEem
         uBCjyDK4Ie6PdRXVg+aE0akJ0pwvZUsxp3DzN6TqL1lEisVFTNXISVLJ9S8CuEd0O0ZH
         qLSA==
X-Gm-Message-State: AOJu0Yx781EQEIrNF+7fIUV3uBEY3q8e2l9F89oCnu7i4F3BLnndYfsH
	ONpBbKTXhkTtl9QXipX8QKV/I0zb59s3LJyOSdezFux/yj42y6EtHI1aap6U2ja4Uh1BEYZazxm
	lwr/Vv0XO4Yev/Q==
X-Google-Smtp-Source: AGHT+IHnzb2nOCmp6+c+syQ1hYMjFz5XWhAo+dQvq2xXAHc19m9MS1tNxCTMGHGXg0ybwWZMPJp/Okj0I4a8moc=
X-Received: from wmbgw6.prod.google.com ([2002:a05:600c:8506:b0:43b:d732:fc79])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecb:b0:439:99d1:d4a4 with SMTP id 5b1f17b1804b1-43c601e1873mr20865475e9.18.1741346285547;
 Fri, 07 Mar 2025 03:18:05 -0800 (PST)
Date: Fri, 7 Mar 2025 11:18:03 +0000
In-Reply-To: <20250307110821.1703422-4-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250307110821.1703422-1-abdiel.janulgue@gmail.com> <20250307110821.1703422-4-abdiel.janulgue@gmail.com>
Message-ID: <Z8rV6y5GLgovaWdN@google.com>
Subject: Re: [PATCH v13 3/7] rust: pci: impl AsMut<Device> for pci::Device
From: Alice Ryhl <aliceryhl@google.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	dakr@kernel.org, robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"

On Fri, Mar 07, 2025 at 01:06:20PM +0200, Abdiel Janulgue wrote:
> From: Danilo Krummrich <dakr@kernel.org>
> 
> Some device methods require mutable references, since they change the
> underlying struct device without lock protection.
> 
> Hence, make it possible to retrieve a mutable reference to a Device from
> a mutable pci::Device.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/pci.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 4c98b5b9aa1e..141430dac2d5 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -432,3 +432,14 @@ fn as_ref(&self) -> &device::Device {
>          &self.0
>      }
>  }
> +
> +impl AsMut<device::Device> for Device {
> +    fn as_mut(&mut self) -> &mut device::Device {
> +        // SAFETY:
> +        // - `self.0.as_raw()` is valid by the type invariant of `device::Device`,
> +        // - `struct device` is embedded in `struct pci_dev`, hence it is safe to give out a
> +        //    mutable reference for `device::Device` if we have a mutable reference to the
> +        //    corresponding `pci::Device`.
> +        unsafe { &mut *self.0.as_raw().cast() }
> +    }
> +}

This makes it possible to call `mem::swap` on two devices, which I doubt
is allowed.

Alice
