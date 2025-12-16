Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354492DF68
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846531; cv=pass; b=pslXvEKwQfjZJCLEaAoMgUw9BPpesGhv2rQVlXVbnyS/FiwS7ojSLyGvUfUDLwZ/fGVRNcst/iLRJhvvbPctj+fC3VqHlO6/JaAAZ4wtrUtsY5Tekri/gLbCnqHVIqTHJpvkyBDJDH43zxsj1in2ZUD9mbZMFU/lWPZU6p0Ddb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846531; c=relaxed/simple;
	bh=XedozhfciyhSP4b9nDQllsAAs0EUvQS6wn7xvBD6/wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QitOoCg3XDlddW4ZVd027sALVQAx5naduFlR/aXIKQ7d4ccL+zlDVza5ISSChGb75L8cAZyMJ1CK2VAX+KNaxtlYLrEb48DE6o/I5uIWgfzHO10V27psNzuU5JJkF04sVAPTu5efe/ZXKyAFCyjqpFdFXcQhEaPaMIN668qpxlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O14ocu4G; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O14ocu4G"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so853a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765846528; cv=none;
        d=google.com; s=arc-20240605;
        b=RvCpHSo5JV3jHrjQK65w6Gr459anosYcya2cf/IAzDc2r8T8cepW5JIs3VcTK5Gbj8
         62WI7241FY6yHed4UUeKbXrMO3SSXdoaxbBXKcCtTDbYhEx12YpgDdBWTZJLzwSGMI7g
         Q7VcgTGxm8t8EB3eNgjF0R3H5lnjTG1Ttw8DSFaaHx493/uZSuMZ9y9nKx77g+EDRI02
         3hAOnyW4AwLuvBsF3QemSMkEcpZ8ELqeHLNW/ditMWl10bmO14u6fkEfbDj+DHxbJG5w
         +PKHY6Z0AgvugBUg3dmOhBjZobHTtwLPsi9xleHMUsAQ3iBZB0rG/RfKb/MleIcKlbqh
         mjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hkMrsakpV4xdoiuv01S0CrO/w65fx468q7ZaOYRKG+o=;
        fh=nCAp41PkhA0gt9gA1ExqzzB/2m1y3uJQyhsiFra5s8E=;
        b=Zme7YLGOIJgTBzMOcivXWp4N6RP1EOfuh4tCdmUjeQBX1DnS3B8RgEkDYDSFUaOKl6
         4AIesJbTBM8rjt9cHUZeQNx60N32Ehe5G6dQfIMgtmNZdR4IbtG8qV5mbVHhNTCzHadQ
         SRdRxOUNR5JXte7QVaYUkv8vTO+qvGnrSPYGSMKW0PzR0qsG3yzeI9pmuabY2Q7Vc3QH
         Pj4peU7qE0Gm1fKQnJWuReJIAo9Hdl+Larj8TVJFnaXT2+Qk2O8Ptb9jDW8YsbNxZqCF
         JYTW3nvub3pFxtToxlZxw3zCJCy3isz1zRByYO1ItiYgdZTyTLtMxQ5ghlbTXQ9292bm
         cSGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765846528; x=1766451328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hkMrsakpV4xdoiuv01S0CrO/w65fx468q7ZaOYRKG+o=;
        b=O14ocu4G9tZd4w4Lhwk2KyfG0R+RclS/ZaCOaVAmonJtYpgY6jc81ZNuqyGtSFfqIj
         GLnh1rwm774/luN4Aym9/92bNbFmAVgI1gdMewlgfQyi4R4+hNRbv0WDezGAZo9kJHpt
         MkzHFK4ugnA9wWLsEfzDukOtsoXJvWzcoGYhADDPZ/0pLGmi322FsOPmgNDrdcvFXua2
         nW5oUq05vMVidtnRLzFBAZdfxsvlkxGxi4P316ZSakoWvc6IcAav7u86YD1bn/DTwzdd
         h6AL3L+j6HWz891ELiiH4CsJpsj0hEnIHN2izjuugTIMiDdbbbFbDMrhQ7fm4tmbiIzY
         KPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765846528; x=1766451328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkMrsakpV4xdoiuv01S0CrO/w65fx468q7ZaOYRKG+o=;
        b=KQTqe8T7FN4GM/NZg7zHPIXDVAvcphCvQeOdRZmY2rczsP6OEiAM5jIA/+dBPBGRmg
         DWYSzpNUvnKw2nha8iXy7Wgt4Z2mw9a1IaOZgL52+Na6KoVB0k3Z7qh/+s4PBRDp3bsN
         hE6N39o5PzarzUbUJfx8HLuXS6sk3Hpxf5SXf/tGzUJ3P4SasjAti3EavIiC+UpAuHqQ
         fJYd2vXMwvvj+z93i8BJYnv6YIYi8PARpoxGeYqfxpbaDYQbOQr7o0OJGw6vbW/SAL1r
         UQVihvg5jLdGZ01W0650mPB47ZwsSgvSj1JnEUqQGBpYx11FTRsr3CsHTTIN9GQziCot
         hNsw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Zf/jcBt3aYtGfwdtM52INfNVQNeScZ8NjSB3qv17gprb0HA/XVCQ/DJf3tqlz3rC9j3ZJtVdbLe+bwKpwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgw58y6fVI2yy2nqkdyQVe8A1eJ2hv/edKpHU3evqSwCmFd8O
	Chsh4Hvi+50OxDIp1+fUOAtZbHfv96SSCA1QasIQCSJL/npM8rqv0xHpeUCfsPQ6s3ur1FQvCxf
	tRRMjp3SjaZQLTtPhxCBxEjRIgL1FUdA5wqHSE09n
X-Gm-Gg: AY/fxX6QTNVglThSbypn74OnQFt9Anjx20QRpN/SMknITHaPMi80S1ePXl6QcOX9ZeA
	fKjCOG4+Cfih5mJSgZdaAqR1rqivZy/yXSXhU6AcpGoxCwUr4wmVUcEZAhraayRZkVOAbM8Uab3
	N75UlyRce8/oWtE0lpcm6cbMNU7MjqD4slsV1+/g2wuQKJh7u8uSAbYTNiNm50Bf4Qkw46Ozx8W
	Zx3G3pPY0a+GY+QQ+WgXzJG1UrnuBBvAF308HJxDFUh2wQ/TDdeqVcKJrIuKw0m+jUGORRKFrev
	Ym5oc3HxbUC1NynsvSuX8YqYgg==
X-Google-Smtp-Source: AGHT+IGLXFs6ZQQjk1EVFsSaR/XVMTlgzBvW4YPps7Xv9R6FU3z3dQSvYkmM2olzGcfSdFq+ShBjksrAZKnvMeWwNio=
X-Received: by 2002:a05:6402:23c6:b0:643:1fab:c9fa with SMTP id
 4fb4d7f45d1cf-64b300ec1cdmr5438a12.9.1765846527695; Mon, 15 Dec 2025 16:55:27
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
 <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com> <zgzucan5ysxexmmjantx6sz7upbtouazj4hagjzlhaoo5hvzo5@limvqfce2lrw>
In-Reply-To: <zgzucan5ysxexmmjantx6sz7upbtouazj4hagjzlhaoo5hvzo5@limvqfce2lrw>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 15 Dec 2025 16:55:13 -0800
X-Gm-Features: AQt7F2pHWe0LIWFXW8BDLU_8yyVD7qL8ToGLKpD173W1Z7xz7u27E-MDk1pJUSs
Message-ID: <CAGSQo01-yjNBpo0jCO0sK+0XHLKUyZY8vyA0X2M=fDtcmv6Vkw@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'll get to your other comments in a v2 soon, but wanted to focus on
the lifetime of `qcom_smem_get` buffers for a moment.

> > > > ---
> > >
> > > > +
> > > > +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [u8]> {
> > > > +    let mut size = 0;
> > > > +    // SAFETY: qcom_smem_get only requires that the size pointer be a writable size_t,
> > > > +    // host and item are error checked in the qcom_smem module.
> > > > +    let err_ptr = unsafe { kernel::bindings::qcom_smem_get(host as u32, item, &mut size) };
> > > > +    let ptr = from_err_ptr(err_ptr)?;
> > > > +    // SAFETY: If qcom_smem_get does not return an error, the returned pointer points to a readable
> > > > +    // byte buffer with its size written into size. Because these buffers are derived from the
> > > > +    // static ranges in the DT, this buffer remains accessible even if the qcom_smem module is
> > > > +    // unloaded, so 'static is appropriate. The underlying buffer cannot mutate, so upgrading it
> > > > +    // to a reference is allowed.
> > >
> > > This is definitely not true. The smem data is ioremap'ped during
> > > qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
> > > Accessing such a pointer after unloading smem would result in the
> > > exception. Current socinfo ignores that and keeps on accessing the data
> > > at runtime (which also allows it to read DSP versions which are updated
> > > at runtime), but the comment needs to be corrected.
> >
> > Thanks for the info. In v2 I'll look into seeing if I can make those
> > slices hold a reference on the smem module while they're alive.
>
> It should be a reference to the _bound_ device. I don't think we have
> a way to do it. I suggest just fixing the comment instead.

So, unfortunately fixing the comment doesn't really address this issue
- a `&'static [u8]` is a promise that this buffer is immutable and
will remain valid to read indefinitely, and it sounds like neither of
these are actually true (the former due to the DSP live updates, and
the latter due to the potential for the buffer to be unmapped).

I can deal with "this buffer may mutate" by changing to another
abstraction, but it'd help a lot if I understood the intended way
(even in C, we can ignore Rust for a moment) to know that the buffer
you got from `qcom_smem_get` is still valid. My best guess right now
is that because the smem driver is a *parent* driver to at least this
one, we know based on where we are instantiated that it will clean us
up before we go away. Is that the intended mechanism?

If that is the case, then question for the Rust maintainers, since
`probe` is not an `unsafe` function, could allow the equivalent of
safety requirements on probe methods? Since the match tables are
empty, it will only be probed if explicitly requested, so there's an
argument to be made for "this driver may only be probed by a device
descended from a qcom smem device".

>
> >
> > >
> > > > +    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
> > > > +}
> > > > +
