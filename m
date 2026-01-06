Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9641D5CC6
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690205; cv=none; b=H1w+aYEo8jFrd4DNjb50YJaDL4rVwlsGeN9knvMfR5IEWOowKHdVhzDT5B5o/iqJ8nGYQADQsuMZ0JmsdC06hbTB5ZuY2WMoeF8Nx6HwIRTcCNy4YiYzr7cGqli2ynB+MCOC6rFIBtvSCJrFkN7uCoYVvqVNA5bbp0WSo0XTwT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690205; c=relaxed/simple;
	bh=WxygpNIGAYmuhRDssNs3rS9qUuNs6DZkI9Gs3akikV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJgUZxWLo9s+JvXDxGSJfcj3EQzynfZxNN1MHxa47cRREJkXYMf4ivxIWL+th7XxYme0+50/DSWfejSGhsD1NnZx7y6UBzHoiGGzuCCZZ8pCQff+jDU93lfwVGvsfJ1Ts/5IP+KV0P3GjWebA68HgPlG8Vb9Z0I0/h62DZMnK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qs+mQiW4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qs+mQiW4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso6838545e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 01:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767690202; x=1768295002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCQ8yUN+i0rvVsgyEjAFAtlzFy0COcjHCjMr8hXPIGk=;
        b=Qs+mQiW4bmaLVAdbULwSNrZ30HqhlU/F27QCIYQgxS5OUTUo14NnVLq5Hm+sAQhD6y
         +RZ6RhQvXVKSL1eOnTbgxTw/rTEdTIwjq6xxfZieyQFWBVLSUsNdUW05OrVCww2qverQ
         tZch1SGIKpaoYxp5bzU8ri4yhSKZDl4ESEHSuiH4Yl4//VCYAvN6pgE9yo7jiZMkQ1Pt
         R55WbabF9Dem/BVgkDVFKM7Qydtq5nXpYk4MEBGuskvtmjpv7Uf9J7PoGmbGYb3fMk4o
         fTXAkRrJsUJ7uk9Wkdq1MjXE6B8KtIq3XN+rHBfdlcf+w/T4FXCuhGM9o9f8oqSX/Zbn
         3FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690202; x=1768295002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SCQ8yUN+i0rvVsgyEjAFAtlzFy0COcjHCjMr8hXPIGk=;
        b=qSXVCiNNKvaxv6SN5l2Trz0IPL1i/IgnyZ9Od0dCXExKUqeRxzGNrrRkwC8OKUDXtu
         IJcBSXSZoEWWH4pr+PvYKA5BZ9eT3I0LY013nJAH5cepCBqkVqTOZEtM2v36Gjpw0MbY
         PBHsHyWIlf+m/O+ddehuMFQJqFSBw2wI0HCveDd+sR93MiS3aSV4T+nT6enV3XZWrJeL
         IJJNciCx1vCrkQ0ejgSZxNGsKAeKRj1DRVF1hsrEeIaLZHYEZVXoOQ7LwVhaa49ptaZ8
         BiRaG6gkfpvrtV/K85cGaGimqerJVMNqGZ7kkUyVZaN2Bki+Fp/QVsvkADBgzEt0Efkx
         /HXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe8mlWuuiWbi62wzTx2u/mD2oKfLuVavkkGfxbJ5bzLMntcrvAfftRVcTL2UZKgRidWiIrlR6WgsgvKwWZbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUY8wjLo+0miuSfRBUKS1pQw2L+Tt+ViSCNR1+y/LRvAnLjQN
	4bkoFje9BHY4K0ikyXsoBNLk1zHwce8wEX6VpxHKm1issi+kFOnyjbiwqn3d6nMrywuchRbSIu3
	oFDA9fKokSc4yKgS6kq/OCTHe5DD6vpqMfSgOs+OJ
X-Gm-Gg: AY/fxX4TGaP+6SwKwuNlW+Tl3MvVBUcoL+CSpJVxP0i90QRIu2wc/69Y4zMs2zapH9z
	bVcpMrR0jUKmVQpEf0KCZSBm2MBGS/nqLj4u4wjJDLtC1l/pTHgs9cmZ2aClzUst70D+n46+PHA
	DsA5rdNudqAG/ZXRGjuSP+Idgbm2d+/2RS/blicSoXEac32AQLk6nuobSrltXRZGyPO5O16207L
	rY7Y1RtJhTlX66VqGOyGaQqkX5X5W01Ucpltk60oqvFPHWZlFYAOogRtMfnj8LXPIqayk40+pBl
	SlnrjADYz5hqhsP1B+IhWQRSKJq8Xt9PAPDgZuOp6iiTfYzo3mxNbtsOSg==
X-Google-Smtp-Source: AGHT+IGGGc1RVk+K2NJjNVeOteqGDnGciIVGvJ1Rs+WgvGuh/StSsQp6X2DQcpVdTZKkFnRSftcjzDbnXqB+UXG54vs=
X-Received: by 2002:a05:600c:81ca:b0:471:5c0:94fc with SMTP id
 5b1f17b1804b1-47d7f41069bmr21995215e9.6.1767690201980; Tue, 06 Jan 2026
 01:03:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-bitops-find-helper-v2-1-ae70b4fc9ecc@google.com> <aVvu3zF2rYKR3XC0@yury>
In-Reply-To: <aVvu3zF2rYKR3XC0@yury>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Jan 2026 10:03:10 +0100
X-Gm-Features: AQt7F2oro7hRfrIYlzb25JB-Q-PHqgoGcjloMFDUeSreDCEcIL-6_a7DKUDFFZw
Message-ID: <CAH5fLgjtXHH40Pcw=ZoOKPzvJzDA8fohNtC6W6DsfkcE-6vtrQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitops: fix missing _find_* functions on 32-bit ARM
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 6:03=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Mon, Jan 05, 2026 at 10:44:06AM +0000, Alice Ryhl wrote:
> > atus: O
> > Content-Length: 4697
> > Lines: 121
> >
> > On 32-bit ARM, you may encounter linker errors such as this one:
> >
> >       ld.lld: error: undefined symbol: _find_next_zero_bit
> >       >>> referenced by rust_binder_main.43196037ba7bcee1-cgu.0
> >       >>>               drivers/android/binder/rust_binder_main.o:(<rus=
t_binder_main::process::Process>::insert_or_update_handle) in archive vmlin=
ux.a
> >       >>> referenced by rust_binder_main.43196037ba7bcee1-cgu.0
> >       >>>               drivers/android/binder/rust_binder_main.o:(<rus=
t_binder_main::process::Process>::insert_or_update_handle) in archive vmlin=
ux.a
> >
> > This error occurs because even though the functions are declared by
> > include/linux/find.h, the definition is #ifdef'd out on 32-bit ARM. Thi=
s
> > is because arch/arm/include/asm/bitops.h contains:
> >
> >       #define find_first_zero_bit(p,sz)       _find_first_zero_bit_le(p=
,sz)
> >       #define find_next_zero_bit(p,sz,off)    _find_next_zero_bit_le(p,=
sz,off)
> >       #define find_first_bit(p,sz)            _find_first_bit_le(p,sz)
> >       #define find_next_bit(p,sz,off)         _find_next_bit_le(p,sz,of=
f)
> >
> > And the underscore-prefixed function is conditional on #ifndef of the
> > non-underscore-prefixed name, but the declaration in find.h is *not*
> > conditional on that #ifndef.
> >
> > To fix the linker error, we ensure that the symbols in question exist
> > when compiling Rust code. We do this by definining them in rust/helpers=
/
> > whenever the normal definition is #ifndef'd out.
> >
> > Note that these helpers are somewhat unusual in that they do not have
> > the rust_helper_ prefix that most helpers have. Adding the rust_helper_
> > prefix does not compile, as 'bindings::_find_next_zero_bit()' will
> > result in a call to a symbol called _find_next_zero_bit as defined by
> > include/linux/find.h rather than a symbol with the rust_helper_ prefix.
> > This is because when a symbol is present in both include/ and
> > rust/helpers/, the one from include/ wins under the assumption that the
> > current configuration is one where that helper is unnecessary. This
> > heuristic fails for _find_next_zero_bit() because the header file alway=
s
> > declares it even if the symbol does not exist.
> >
> > The functions still use the __rust_helper annotation. This lets the
> > wrapper function be inlined into Rust code even if full kernel LTO is
> > not used once the patch series for that feature lands.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 6cf93a9ed39e ("rust: add bindings for bitops.h")
> > Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/=
near/561677301
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Which means, you're running active testing, which in turn means that
> Rust is in a good shape indeed. Thanks to you and Andreas for the work.

I've put together this collection of GitHub actions jobs that build
and test a few common configurations, which I used to test this:
https://github.com/Darksonn/linux

> Before I merge it, can you also test m68k build? Arm and m68k are the
> only arches implementing custom API there.

I ran a gcc build for m68k with these patches applied and it built
successfully for me.

Alice
