Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002775;
	b=KL2ajKg+1RSUq3nVRTJzJP77nkCRUzvcyPpY2H0AiO8tya7TSDFd4ohP6z/5MBdN+Zk+
	 d9D58VrHDHmDwLRkbhRqn+IvVbvZjMaWGpQx3ADLpw7sBmmkhAq4939FC5RHza8tO9YYc
	 HhWMhwAy3NrzS3DdDiItUxojIPSNzZn1zf4AoLnU2CjyHbejif+G7DIAbz0XcSMf3FOvV
	 3RTfCLS2dLIEbcIRZmik2hcRZbF7tXoab1O9Xt4UnZApiPsHdghfoVDaZWxpbfxlRMBti
	 k8W7MFtUo8k+iWOdC1D0okwIrWqocA5eJil/3lami0xwTuPbKajeniG7YLJowjoQsPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
	b=dfGgRtVXcyElF/00PC3bLNgen2m1eJay54lZ4SDcJJQjzod11Z3WbPhfDkmPzuQEUR0/
	 41zMNnGahUS1x6d2ydTCPNk0QMTL+YnOAtLISoLm6s+XcKxj74329F6adqpeQjSNbyGPv
	 taVHvprjex9KJDv7ma4uANTyBkSvJbXKVde8UtLUY37XLHCdTU02Tuj+NnwDdiF7G9yB/
	 5gk99MwY4ZQYEg/rmXQ90WSGYLb9a5Tgi5NOQxat+k0SgDUn1XmPUDiUBR+tMRVbxMUJg
	 wMVpSTp0+rmF+A/xO180QbLZ907P3qVMqfWYcor3NBFCJvd+2v3g0XU1ydXUcdmUpuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5O1YFgV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFFD606A325
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EFFD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5O1YFgV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6008175e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002773; cv=none;
        d=google.com; s=arc-20260327;
        b=ED2vWqI5i/Mrf5oixWlfRUH1lwE3bWn48odAeqvUSerrUJgvK+oWbEJty8FcwmtWo8
         G2bxtQm3NhMNvSFPCFP1JbETIF6TbE9DbXl7s2EDn6InMNGdSjOqEbcd1tmRt9+MxLI5
         2EHy+GUwnmcXUXnooF9i8FxRUqpvTy/+1wxBuAFatyC2IGBnDJteOzI38x6a1oZ0Em1y
         +B3xiNqkilLPfxlQE0FS3WInYPvYHCf091RbVE6PsN79NHvzfxAlyQIdg+ytNrOcHZXh
         Sv4WjrNl1XM9LYj9lOaeGomHJLxn8bTMhyfD2skRzpxENiAzqqb8rsBxCiA8v4fKqJ73
         jPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        fh=3FyQIcQOdSR80/aOzZuEOTF/igutu0NIbxh26kjhvCA=;
        b=Z1JX/xrKjTQv9x1VqhBFcuh0GaV33mS73V9jPiVevTAFlzEUlfM36Ss4vKMrf4/I1L
         6pHypsJZw5b15XirRJxsBJ9COPyAQL2SsIZcVUWUocsiTySXL6hK66ZlOseevv9ybrj6
         cH1t8VNmfn7UMrh1P263BHMYO/gS9Vqi0KyAgjsfff0kEdNjV8lTFcEx5C+UCyfqSb9s
         bcJ3cXRe7CnRJtflhWoZKso8lA0h+LcXr2XlyPGdy4CA3uxAPw32+1kSvWweL60U71Zg
         VkT7C4f+twyCSzahIjIiGcuc5cAb4Qx7TOIGNb11aj1DnzGpXq4l9ENFu93fB/IVc26e
         E/9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002773; x=1795607573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=e5O1YFgVRV5ukFJdMUpqscp7b4nWgoG1SlTnydT8WNraL5M24baxJfaf1SsX4Jnppx
         7hjVczj49PUmm+DKVG37TuG3QKDMrBLoaR/ZWk0Nvmo6V7XpXLLONKz9hgUOGmjdkedg
         kr9f9PizDYLmDSGTi2uAPBf5G2zixwONqa5bdcYfUJ6DiNcOGkJ2BIQ1KpxNrQDYewkH
         zY6I8/KKfpViBPfn3WPnzdzLxfFuUatkDgdcFcVPDCNwCaTAd5dTxwkiY5pafpWyT4+q
         UPPTSDk05TSOtR3J9lyYNYsuSjH+3+hCyY3YmqpWvxkBtWcY5IN6h2ZECTs/aondEb+E
         MvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002773; x=1795607573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=Eat/E1hqaYqBoLhahgiF+uAINf5fYKm3n48Vqj0PBWVoYOGCtMuJCzZFd3Q8wGvSXZ
         1O2G80uCqXuHt5CSQ9cNZwbC1SzWY1TRRfnOhAiLSTqLri2P4DGlBbEVGe5dwXXUFgdm
         a2KLW+Vw6ocxwHROH6im4qP6R2FNVkaWq1cKDSXECqjN16CL4nj/JZsDfmoaVgvbzHcD
         bTLAn+VStpPxbWHsnRvFwNBHGkNBD3rMXdRBM3z14mpkI1E5Gh2+mlaJVNze9SS21JAR
         EuNzUJhQFNtRbf8f5RlGYgygTOB1PAenLdrJYRnzB5Pbg65Jr3vwqtNob8GfBCiHuo97
         258w==
X-Forwarded-Encrypted: i=1; AL+hErEHGZeFk5XW1MhOUAG/f23KEn2ra2PLTS8yyLjGaziH4d6ysE1NjWwRNn0f3fxyt0oTkFB1xVeilhyQ+llnSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dhCs3HXadvTm0zic7MO6MWiz0pG/VRLoOOGeCWNXiS1Jk+4lG
	vQChsMOcY/GjXKgSWEMRIFJCIRJs6NMY3fs9kdNM8beiV5WIbdBpJ1JUhel607BD8aveADB3se9
	xxh6q8dPbbFTaTstr6mRZNFiPcekLCh7E5BNNoqu7
X-Gm-Gg: AYBFou3s6F4BT1VU+kf1a2sz1r9XoPxTFkWTMttVBtKR6UViu2NFPjeMj9iXUCWyqFz
	JftT4wHdI4gk57UBjBXAE4LHc6N3L3M7ug7eYooF0seJf3QJ4pNzKpihrv0A8EI1dp6QaimBq0r
	u4lA/rP2o8OiBSb4dIdzNDmQC5wSpVxkZIvYakuqzodh7JIsIXRgCVdkDLteyVe2ELwmLMdVKB9
	wAE1Tz9TrkjDR+nwv3k480IA920XjIK9Uwp6HODaYFGe5e5bdhwqCMDFEjB2d6vqg3ZR2BvJ5ZH
	HVpWutvoq54FtAu5TnA4wtk5NtbKmBqn0rfR0nGfgCL7EjgVb++xPeTwxovagqNHRWifcTp+ET8
	ywvwdev/UH7M08tTkAJwld+NJmoW+MPEL64THJi9MJkpJxyAZNy927Ok7igGTEdnSnN19Y5806g
	XSg1lQtZsOBls84U3qrHHVwv8JbjkWHPtlgJGVaQsDKQJM0MtSLK2ra00VMvyXk2SkyA==
X-Received: by 2002:a05:600c:a303:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4bb7da13acdmr37565995e9.6.1795002772260; Wed, 18 Nov 2026
 03:52:52 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
In-Reply-To: <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 12:52:39 +0100
X-Gm-Features: Aa3M54rk28vpmTCa3HDqQLECd8XwI0zPt6LHL51Y7EEk1gBPhG59tDP6nvzdrww
Message-ID: <CAH5fLggQ=N5D3DyCHJyLMB11XEyJF2eVBndYwwktLVeVfyOJpA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Nov 17, 2026 at 8:58 PM GMT, Alice Ryhl wrote:
> > On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> >> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@go=
ogle.com> wrote:
> >> >
> >> > The LLVM fix itself is trivial, and it looks like a pull request for
> >> > it already exists. I assume we'll want to drop this flag for fixed
> >> > LLVM versions when they're available.
> >>
> >> I will link it in the commit message when I pick it up soon -- already
> >> did in https://github.com/Rust-for-Linux/linux/issues/1132.
> >>
> >> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/=
issues/2.
> >>
> >> The `-Zmerge-functions` flag is internal but has been there since Rust
> >> 1.34.0 in upstream commit:
> >>
> >>   b91d211b4030 ("Add a target option "merge-functions" taking values
> >> in ("disabled", "trampolines", or "aliases (the default)) to allow
> >> targets to opt out of the MergeFunctions LLVM pass. Also add a
> >> corresponding -Z option with the same name and values.")
> >>
> >> so that should be fine, but I will ping upstream Rust so that they are
> >> aware we are using it.
> >>
> >> And, yeah, agreed, we probably should remove the flag conditionally
> >> later on, to confirm the bug is gone etc.
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Do we not want merging at all, or only when the types are not going to ma=
tch up?
> If somehow the KCFI type metadata is always emitted, will two functions w=
ith the
> same KCFI type metadata be mergeable for gendwarfksyms purpose?

In principle merging would be ok if the gendwarfksyms CRCs are the
same. I think that if KCFI hashes match, then the gendwarfksyms CRCs
are quite likely to be the same too, but I don't think it's a hard
guarantee.

After all, for a pointer to struct argument, the KCFI hash depends
only on the struct name, whereas gendwarfksym CRC also looks at its
fields.


Alice
