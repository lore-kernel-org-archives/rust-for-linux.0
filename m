Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82701330B2B
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768818; cv=pass; b=ONTNOdryQOc6wkMRQbJ2hoDGHIFbSo0snV322fx1dwfCZvFF/DhiWkkf5bX6O1S7DzqGQc0mUFWQqRJPpK0W2sHNYUeplTCyEL/Jvn+3GFn7yXqewPUnSQ0gc2CAvR7UHGTw0zAgbJjG70eCfLsfTBX+TAjves2qUdnGA7YtJTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768818; c=relaxed/simple;
	bh=keKwmUlZ7OSonG/lmZBAIMewZ5+4Yjw3f7MIUH9AdaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVyILa1yyR0gWSE/dMKKzKSIF1/pa9tAyzTzmXN8k56/PNNXphEOGjmdKjXY5U4vLf3i8EqYtjvrqHF9ur09jZ6v9eFGoB5cN8Mb7DKcAjpn2J6SVYLOuLYrKrKz8QcvjsHPcY0jB9rWND2w52CRZja/6c0Q6Tw6asQLgK2HD5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wL7JCDlg; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wL7JCDlg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359228b7c6so1430240f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 02:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769768816; cv=none;
        d=google.com; s=arc-20240605;
        b=bvIz9n3Vz/R9it2sTJKvon/ZDs/qyEEwhJHsoYf8lA9vvu0K+nXeUEU39WlNO7s9ho
         xYfpxx+S2pQdWZYV6p3ONDn/WyapM/g//08wWOl7MCvKw/ZC6jkwN4goWD6pjwB7HCU6
         /OZyGg3WgsaqbLlkiPArg8uWzOUYeP7Msqmj0KndwN0GUEiV62tbDcXKRDxJU9rHDDUg
         FDm0tX4rFzwFajZ5DB2c3VYNgnnQKXp/Vu0psBHy72722l5a4sW0FlTNyd0FZKksqFl+
         vt8tE+3Bll0pPvspkcLpFnWqU9DrpB/LnhcEmmVi3qkLe89RLUFtLnn8n5Oc4bE9sk3Y
         7n5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        fh=dLclY38RRIE5qlOwfSqDnm7yi+jaBKz70YZrS7gX1zI=;
        b=cADiuUmktNjGm6ClIj4hSrUVmkZH4FJskIjo8oS32Ywl2QtMm1AAIBBwCkHQShmIw/
         98lCh0dZrZ9BY1ovXKjMluqyGpK9AUBQ+gGYEa33MWOxSvkiZCh9FBc4nEL2p7PvJyff
         qm3sJ9kd5xHWbY9NBGj4GeqkMdfIz7U6KknUm7SW5wEPszStxf9ZJOVlK4M1LQuenqLA
         41KQqCucLcEm9l6a8KmQA/TyxmEFSqEO7QJz+euuyDRJbP4UiP0TeOEX+vZkW8yP5yEE
         6Ii0TdaQksRdrN8z5LjCMJPR63N5bZuoJ84eemM65lA3o4Yk5fskfFgacJd4CaqbUSCg
         p6jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769768816; x=1770373616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        b=wL7JCDlgJ3XVJmBEjrZVrW0M2oC4zh1beu/FEdi9D24jLhhCjqwADgASalvJZqNcui
         MVHhvVpqC8mb+iqr00+Fwoe8cBs3ZaaJUvgJ/sWDwFAe9Axh75+rGZ1kWRSL/fl3ES3m
         P5iKYA77eCf32foq7Qr1RaWPMj3BBxiqvOCtWjQoGSoNc4OByM4gs9rvuyOlaH9rB0jX
         RG16yui56G1oy3PhBKdKhmgosQMnsqI9+8cTvxsfoJLj/Qc80oqqgYWCg4arYzELutGi
         7ueDgmARL7qN/sUuC6tIQTPlWwHYQHXGGjF8V6jNObo8JE/HJhtxMOHYvBu20K+kP4ok
         gW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768816; x=1770373616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        b=hKQaeUXnUXZCSGDUTNZum0J5Su0NWnNJWQRnv3LLsQe+fasWldM7wfpEavqzhdKnYH
         aQTu1Cga8SNYtDy5JCNsUc5SP0Y7+yktS8YH6H3FeCupjeEhsGgjqpJMCEPfOtL1GsZ/
         MTNtSAq6NOdvZkO6pKMEXcDs/vMEClSWxO2QbO/WAvm0wINfkaUsH/inrScFCeqmC7pq
         2lGwM08cVCMvqgn0vk3Xu7g1cptn7NMQFVZ+WX3jAY+RTLlxfUXt8IwkrXb8fShVl3NR
         14m4XLMSvfOcSTbdhS78WRTpC4yRMq0OA3CfFfBYbC7HVcAkWwx++a1E0C7+/tQu8FyK
         N3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVG7aOnqyEhTUTGAfpmZbqx8TYYg9vVcdHpnIT1R83AKVIirBg0Jl6gusUlCcMLsr/u0lznP4RrLwppaIHaFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtJPLX4h36SGE+Aygq06XpstaWV5mp7GV9HZ55twF8mafmY9F
	b7lyuyG8LYRtIvFWGlO4I9M2q1z2OrbAiG5xTGH3ZBIb6eSgJPENk5OgAjZNmbFM0xBlKqauwe7
	UDrdfzj+PzOgVZkHCSDC/U8wvw99qZoLkDA2vjEuY
X-Gm-Gg: AZuq6aJK2Ei0CP03WzT2nIB0xAZ0N/KH4Lbq0Uu6elyvu4tsmjAi5V9u6pv75dUvMwU
	uKO+lUPWd0btF80kla3IUVBCfzAx+sxwBFBvWA+Jko6IkcYA0C4MUDTuMPQFs5sN62q0gG6rx6+
	XcBro9XzO9c/7RyhAItLzZ/qK5nurApcMHfOyX1jMfpH6z4HhuJst5v7zzu3Zj0wQu7M+mmjfa5
	3iG4I/tSJR13XirTOb8op3XRiqbSXjGy14QNkMvDoFujpON3/VCRGjn0GKqbShryx63e3pt7jyu
	J3bHgeyMXXqsBbvEsMwwOpqDHQ==
X-Received: by 2002:a05:6000:144a:b0:432:8504:a383 with SMTP id
 ffacd0b85a97d-435f3ab53cfmr3434365f8f.45.1769768815664; Fri, 30 Jan 2026
 02:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com> <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 30 Jan 2026 11:26:44 +0100
X-Gm-Features: AZwV_QjIZnbbm9xp8XOB5ABAESxw5YmRd900W4CPJMrijbzi9HEw_BSq-MEG1sk
Message-ID: <CAH5fLggBd6s5MooGPfUaoarNF651BjTyBt+KcuJc0zdx5xg7cg@mail.gmail.com>
Subject: Re: [PATCH 6/9] rust: dma: add dma_read! and dma_write! macros
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add dma_read! and dma_write! macros using the new infallible methods
> on CoherentArray.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/dma.rs | 103 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index e4bca7a18ac1..f3920f74583a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -811,6 +811,24 @@ pub unsafe fn as_slice_mut<const OFFSET: usize, cons=
t COUNT: usize>(&mut self) -
>              )
>          };
>      }
> +
> +    /// Returns a pointer to an element from the region with bounds chec=
king. `OFFSET` is in
> +    /// units of `T`, not the number of bytes.
> +    ///
> +    /// Public but hidden since it should only be used from [`dma_read`]=
 and [`dma_write`] macros.
> +    #[doc(hidden)]
> +    pub fn ptr_at<const OFFSET: usize>(&self) -> *mut T {
> +        build_assert!(
> +            OFFSET < N,
> +            "Index out of bounds when accessing CoherentArray"
> +        );

This build assert does not depend on runtime values, so it can be
written as a const block:
const { assert!(OFFSET < N, "Index out of bounds when accessing
CoherentArray"); }

Alice
