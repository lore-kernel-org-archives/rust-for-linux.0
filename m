Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDE800
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795262; cv=pass; b=K23S7UeHbbO9DDuzM6BMnz2r1UENU03d6TS+fftEFMi3VahiXiqI16gSeHZz6NvcCinMBjQYkLFW4gxjQ3AxiGFI2NmHlqUeC3yLnwr5jwyM+lXl7U9F4i0UFzXUWyC7bkxuwxb6Z8HW0YjdBC8TZ0yFInCfGvVOM/50y/dEtwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795262; c=relaxed/simple;
	bh=oqojXc1/gGyRKZZBJpvbn3qnQfO0iMRjzOLegsFVCgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQvYl3iGUuio6euzFCEO/RMQEHz0swoTYJyT7U/xoM8L3w4wLvSgqM8YYN8EmPWosut4yDobKJYsEVtMbv5/nuwC9iZoZ1lbo6IB/KuodZhqE+RAs8uMVJp9uRTr0beSf238yz4ylNTJ5r3RAT/NBTRE5gup9fBpZnPvH5Cl6q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KCe9ASQD; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KCe9ASQD"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec450b950dso147463766b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 08:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781795260; cv=none;
        d=google.com; s=arc-20240605;
        b=YZ7ywA3WfhlYL7MJZBMzk/MhpF2ROT9l9lW6ajjhCDY7r7Vv4dF2n+6IX4pBtAaXns
         dI4oBNtHpsY0mdPDkdm1HgxaLFeCdDtrg7Hsv2zyUOqKTuvbM/KvWyTHJat5k+3LIWYU
         FJgJeRaVaU3F0d5U6UF/jpCDRl7GZexrgPxlehhKPqrkA96W4oqUVOOs03H6CgpPBPDh
         NNVvpSUSdFxJzn5j48thrWq4iw9TttJfeXfJd9Nac2zcAJlrTHXdLWT657bC8iYL0rUu
         715zN//hHNhuW2h3EiS+gPNxvwYKRDHhnRZ0Bpj6CpHrTSelivdvuU6JY1tvDW91zQPq
         GazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NYfGyus+VhVBHeY1TmmYU+r9XB2t30QhuWaxH/6OPAg=;
        fh=vYg7xY/lx6wTaNdtYORFYh3mfJ5p79H4fD7LO+qrsz0=;
        b=MQfr4gNMsejVGLqmYV50aHq/Ben0F7PzqV2g6JNjJS5/AYk3P98+nwv46zuxs0GABc
         bjeSwAoLxM6I0yRZG2m/PWOAd7y1QudK1UcLpoat3GI8MHAfDwyG24srNRrbXrG5LLhj
         w/uu4h2xWGVpvUcktfg1Z2H1ySFiBYtnC29DCFPeWN5/onMylGKAfNoTokY5W2ZV2RZf
         CAKGXppM52Q1cLBPVUkDoo0fpQ7kAljyPW/pDJc+7j8W8oSZTVAiOvOOAFW1UMAimMrE
         SYYwnKQzcJ1PvEoH+wCglO+5Zl1Yj3mri3ol7doQU7oEaygx0rtgQ/cqOHCUZEmNm7r7
         PUkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781795260; x=1782400060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYfGyus+VhVBHeY1TmmYU+r9XB2t30QhuWaxH/6OPAg=;
        b=KCe9ASQDBwiH0ECiU8N5i5XECpdsvhaVGmLC7JMfrXp05K9hMilflk+QRvx81Fg2Th
         ePOpJtui9eB1AkouOeZOMpZcrwVQT/qK79iGZlj1ag8dHeeuy0Dz0GgjMnEywPqB4aPg
         G4bJ+0BEhfGTg21qJffuNtq1sOLILr0mgy6MA5n3QPVCDT9ty8pFLa4pBAY4hJZZhCih
         Ipt2nhz3KDDTf1hxpmxaZnh3VLTkI9odOodfE9qTLB7NppWpE2/snO7mZXX7N/z1JdXV
         C8gckzGFWbzrioccnDClHIiMOov363CpgXeXs5V7gnPruILQcwyAVL3oP1iJO4CbFT/b
         5Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795260; x=1782400060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NYfGyus+VhVBHeY1TmmYU+r9XB2t30QhuWaxH/6OPAg=;
        b=hkq2s+f88cwNmLycwd4YPpxVxmz8SNd7AyBNn1rKe7awq0p8PFgv4XkvNAb/o+scrg
         jojCKWGzdkPD30OhjU3xTTorLenjrNEZKnN9Iea2CMsrAybfH4EU6xaj5p5PTuAhLJM9
         S25d+v3oPnIhTG8h6xQTeAlKxifSo0Jz9Kc5Bv/9lZJ4ViZWqIZxDIxMcMJiNk4+mejt
         knXioCh763ygdxHpyQy72rnvFo60xtAr8/MixRaGcDMo9vMdqO8AgfNwHMint/Hrq6pU
         eX/rem2BDUedPNldXU9wQaGdBpo0GuqwT87jyljMNcXfZyTYY0fOyby2eoH+Ucr8rMuJ
         iBGw==
X-Forwarded-Encrypted: i=1; AFNElJ/jOw+SvU/I3GGwPKQ1/9w1t0k1OW751yAV1tIxuwGFLb5nnrGhr0gXTtsScYPgC1iT7s/EI2g9boNhA86dvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/o182DeL9Qp4vxAL6fvZtV8xOBzZrLN2/hcO0+xiPWuOrVsc7
	s5rvj9YMSvyl1vaRtxeh8mv1Bu5bQHEs2Z5kGJBRK8fjUqdXw1uY/ORu7m9o3ZArfXTeL4u0sCC
	9dRA/TEG0Ws6LbNRanxUhizffEKvAVnVTxo4ptvJWdw==
X-Gm-Gg: AfdE7cnulgUytr1sThcuZpoZ24XcQgR4/EGakdG8MWttPbiUyLLPEo/2disaNiYMiEL
	XaEBb6GgUq1N8/diPxbOnSGBFVRF6ib68YlaEKVfZDuvmo05FP037RB1DVlWSghbByelViRHujl
	3qkt+lq1cXFqQMI/yVXCimwOMzW03hZLy96X5sgwd/j8DT+UUETn4tDwWScq3U3AEkRUjC05HAp
	mFu2lidtr7hFuxXMz/0QQTqKwEMk6IZtlFAWPbb7YSADYA/hihFflHO7KoJZeLIZldVKBuzRVjB
	qGTS3x5jK4oTt5zCBt8ORH6JEA==
X-Received: by 2002:a17:907:98c:b0:bfe:ed06:565f with SMTP id
 a640c23a62f3a-c05d2ebb73cmr565480566b.52.1781795259736; Thu, 18 Jun 2026
 08:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618132628.3811068-2-phasta@kernel.org> <20260618132628.3811068-6-phasta@kernel.org>
 <923343e7-1f11-4e29-8278-917fc65c75eb@amd.com>
In-Reply-To: <923343e7-1f11-4e29-8278-917fc65c75eb@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 18 Jun 2026 20:37:28 +0530
X-Gm-Features: AVVi8CdVSitERASSjLlXjGMzf8QWomu8u5eVZoymDD14ZtOhmnelZ1EXdDXW5pQ
Message-ID: <CAO_48GGKOGMr5bexkW3+d9AsF=RYkZeaU6+nWgnaJxzXVLft2Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for Rust dma-buf
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Matthew Maurer <mmaurer@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Burak Emir <bqe@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eliot Courtney <ecourtney@nvidia.com>, Mirko Adzic <adzicmirko97@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jun 2026 at 19:00, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 6/18/26 15:26, Philipp Stanner wrote:
> > Rust does now have abstractions for dma_fence. These abstractions are
> > quite complicated and require expertise with both the C and the Rust
> > side. Therefore, using the existing entry also for maintenance of the
> > Rust code appears reasonable.
> >
> > Philipp volunteers to help maintain the dma_fence abstractions. Add a
> > corresponding MAINTAINERS entry.
> >
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
fwiw,
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4ae6919454c3..8b03eb2c578a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7535,6 +7535,7 @@ F:      fs/dlm/
> >  DMA BUFFER SHARING FRAMEWORK
> >  M:   Sumit Semwal <sumit.semwal@linaro.org>
> >  M:   Christian K=C3=B6nig <christian.koenig@amd.com>
> > +M:   Philipp Stanner <phasta@kernel.org>
> >  L:   linux-media@vger.kernel.org
> >  L:   dri-devel@lists.freedesktop.org
> >  L:   linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > @@ -7548,6 +7549,8 @@ F:      include/linux/dma-buf.h
> >  F:   include/linux/dma-buf/
> >  F:   include/linux/dma-resv.h
> >  F:   rust/helpers/dma-resv.c
> > +F:   rust/helpers/dma_fence.c
> > +F:   rust/kernel/dma_buf/
> >  K:   \bdma_(?:buf|fence|resv)\b
> >
> >  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
>


Best,
Sumit.
