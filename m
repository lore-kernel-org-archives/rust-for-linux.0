Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70E23C4FA
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 01:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268351; cv=none; b=ACwdtN5M/GUiUgKlRpDS4hh6RNanXOo6fO6II7MBla3Qcrg23ow9b0HnaV975RuqbXZau+SUVeVteQnqjUUpOEnq7dHI76HwlwY9hnJi0P69ezWfDXXWxXWgTfVWLQevLz7m7MtrbPk3A9E4Mw/eFgdVwpKubOuo6+K6srPPf7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268351; c=relaxed/simple;
	bh=NS3x+3uL6ysGvCZR84jG/XsOHzLhTxn5Mimn/9n8TZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U72IajNVSmw4C6NHY/bAyKNTlJQXVAWfyclOpZ4wGRlnrKFfhDaim5oEXrQ+/uRGQj4h8WqWjbWjAmu2tpUIZTBjt6xeUo4W4cBGoMLznRhwgAR2C9n7XnyblxTO302q7+lLlNPXlGs38TkNNqZR0otjvshIhetzCauR9CsjkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c67cqJPN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c67cqJPN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c2af7d09533so4501160a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 17:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768268349; x=1768873149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jnnF25VCkg0T2SybZ7yCUZ9VpuY5q1ByUf+LCHdaPI=;
        b=c67cqJPNweTCdA1tCJ2A2dA5wsnuS15M2erybASfGfo4Iyqi7R2ZaI+7lm1IJoZdGg
         hnUTvkOc/lTIETC+y9YysA6RcVNZFvGd01TWzh4Zc3qDUWKdSJBayNpIyUEjgwn2tpfG
         2XMsGyimOHsdQYZCydbh0vArJ5k3XVZkmVj8NpDRjuJ3bnDNiI+b8Esj6vmcfzFIlkM5
         69xgUv0IlCEKOo3Y1y1Pw3SV3VisMpsysjL8rw2JdjkzJh2hI5TgWREP+aL0txMJqsNY
         TXo8O3QZgXFwAG0MKX+fcpsiSze2ietqZp8UGKgvedPqQXgE5w+S2kaCHJdbb9d8kMh/
         oCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268349; x=1768873149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jnnF25VCkg0T2SybZ7yCUZ9VpuY5q1ByUf+LCHdaPI=;
        b=lBkFgOCQFnvLMIKdp4u3d5aThcm2a5AM1vBMOa2DT+WfgrKVSbmC7xLyfWxc5a7/qz
         1/kXQNTWvwhX8OEEGcryz/Ywn5ByqHeFZa0pCf17nJFrkmCQ7UhP0i3PPLatHwY7fh2p
         1sJP6gSNGQPKMB4NBaBw/9t9i8ZMxdp/7KOJ1BeXFORkFEPCw5J7JC1sKLDnamwJ8FgX
         sGRupnM7WkU70fi17xOFgMt/21cuf5s/MnKvX9onPKoIfb9FzKDyqjoDmWwa8dleAOLo
         dAPTfsnMy9LQi0zuqtdA647XBOUmP60/ISfiENqsb/3SzK8sWXLGzbBtwLaKdn0QjRIC
         +LGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtEb7jZmmZPNDfAfR5GFoYnFZoMtkukP4M1knaZ9bwawtyERKNsGBcyfdcrVUdtWyA521QcbvOjeuMsoDnVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeV6Hbnb+zNY2ycxQ/39nZsneAR5p1K8wLVVa4wNDVQ2t/YL5J
	dnC9Fwv69zTQBIXzi/pstSdmE5RcP7Fepk2V9whCyUSV47VvI+trdWMEw9qEjbix2bE=
X-Gm-Gg: AY/fxX42i8oXdqTAqKY69FX37AG4cVzvNUZaEOnY6COPzRrq6RJWtReeAi2qE8arbqR
	EsyxEDwd59EQe/XeBH7OmAE+DIrabByae2C4fWZGoLxzCoUZL5+kFOWYM4Pf67Fl7g7K2oulkTe
	f0jjLSpKp5VpHK4JtNVTdzboGnnknjn6t1b9MRV11CLfLKVwsD5HFn/fsjUFqRqtfAsgwaecnXH
	cgJYDgr/er3RqGOHdijCcJI4iCnFED12sOMIKIef0THVvhJnAIfSyxuSWj7I0o2TxA63QkppPvi
	p16nmNANdFqpKOVzaZWUuvO6m4SqSqUNYYaQMIV+jeY/5zFAZB27zLWgo/sRTeN4ylbEKvzvH5e
	gJcwD5eoFtCZ4SwoHXu4rpUbJsapwHlRXfGBNjlt+9EiTbrmJZaTyjxqHYGhGGDxhg7I1uMPDgy
	Ig2+CeMUb7sPQ=
X-Google-Smtp-Source: AGHT+IE+8ODXdgONlaPfMReyPaErVGpU2QlslXQuDgOl+fISaHx/HgOObknC4HoLwe/gX+WeDJkx6Q==
X-Received: by 2002:a17:902:e949:b0:29e:a615:f509 with SMTP id d9443c01a7336-2a3ee42bc2fmr216894745ad.17.1768268349214;
        Mon, 12 Jan 2026 17:39:09 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm187713755ad.33.2026.01.12.17.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:39:08 -0800 (PST)
Date: Tue, 13 Jan 2026 07:09:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yilin Chen <1479826151@qq.com>, 
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND] rust: cpumask: rename methods of Cpumask for
 clarity and consistency
Message-ID: <77y2t5fsroqn6ogczr7jadbuf3k2qvuea526d3diup5ek6aq74@eu3m3yns2jwb>
References: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>

+ Yury.

Yilin, please use scripts/get_maintainer.pl in future to get the list
of all relevant people.

On 12-01-26, 16:00, Yilin Chen wrote:
> Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
> align with the established naming convention for constructing types
> from raw pointers in the kernel's Rust codebase.
> 
> Signed-off-by: Yilin Chen <1479826151@qq.com>
> ---
> Changes in v3:
> - Use real name in signed-off-by line (Kari Argillander)
> - Add links to priveous patches:
> - Link to v2: https://lore.kernel.org/rust-for-linux/tencent_58EDE157C8C700CFF88DA204B7492A113508@qq.com/
> 
> Changes in v2:
> - Use real name in From line (Alice Ryhl)
> - Send this patch individually instead of bundling with others
> - Link to v1: https://lore.kernel.org/rust-for-linux/aUMUA_JWalyGQdAx@google.com/#t
> ---
>  rust/kernel/cpumask.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> index c1d17826ae7b..44bb36636ee3 100644
> --- a/rust/kernel/cpumask.rs
> +++ b/rust/kernel/cpumask.rs
> @@ -39,7 +39,7 @@
>  /// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: CpuId, clear_cpu: CpuId) {
>  ///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
>  ///     // returned reference.
> -///     let mask = unsafe { Cpumask::as_mut_ref(ptr) };
> +///     let mask = unsafe { Cpumask::from_raw_mut(ptr) };
>  ///
>  ///     mask.set(set_cpu);
>  ///     mask.clear(clear_cpu);
> @@ -49,13 +49,13 @@
>  pub struct Cpumask(Opaque<bindings::cpumask>);
>  
>  impl Cpumask {
> -    /// Creates a mutable reference to an existing `struct cpumask` pointer.
> +    /// Creates a mutable reference from an existing `struct cpumask` pointer.
>      ///
>      /// # Safety
>      ///
>      /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
>      /// of the returned reference.
> -    pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
> +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
>          // SAFETY: Guaranteed by the safety requirements of the function.
>          //
>          // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
> @@ -63,13 +63,13 @@ pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
>          unsafe { &mut *ptr.cast() }
>      }
>  
> -    /// Creates a reference to an existing `struct cpumask` pointer.
> +    /// Creates a reference from an existing `struct cpumask` pointer.
>      ///
>      /// # Safety
>      ///
>      /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
>      /// of the returned reference.
> -    pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
>          // SAFETY: Guaranteed by the safety requirements of the function.
>          //
>          // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the

Applied. Thanks.

-- 
viresh
