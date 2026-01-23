Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE530149F
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174059; cv=pass; b=XcFU7oTO3NtekwmmMeyUCNs+M2aP2ipEMLfP0wQ16+q2D1fvsE/2q/UualbeNlwz5/RxwYjWl++3yGqlWDS9v6OgcwrEDQiW3vGYk3AIOewHMBRY3j9LzB8h1Rt4O5bp/kd9jUJOgg/36O+eLuh0ggHRgLyLGB2T116ySIKervc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174059; c=relaxed/simple;
	bh=to2MYATbY51Dk9LpHrErhTqTpVGtWH1NLSJdA3rWTHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1p7RkllzH6g0JjI+o4aRIdxcIQR5h9jqZlVYGVHXQIvzrYJSuLQn6BY3ZHSlSWDy6v6KgM/P7QWlhnN/LUf2BczzwhiVb7TqQeQOgxhBa4mGEejvjMeJVybTgSUyrda4Boam5anmxfLUn5mvXh8qh30bx7L0KUcZLXD0DlegMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyMgeupu; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyMgeupu"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5f52b0728ccso842985137.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 05:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769174054; cv=none;
        d=google.com; s=arc-20240605;
        b=bBSPeM0wuA+D9x+jZf4SK4p7P4WkswRaKJKMEdspFEZFXDronurxXHQZtMv5OTpesO
         UPfP2I6Ko9246MnBquLZJ0qHEHl9aUeJ1CK61bqWLRCwznGwY+K9eNCdaCFMRbo8SKOz
         ZLtB/U2jE3ft/+G2s5t0H5BbSaZIUNmdV+GQNcWSzJXet5ax/YO63uUGmR/eZIPbGPOc
         dIzzsppjvZmBkyB9QeNG69L7eWh3rPv2a/RKgeiT0CZun3A7olG3lEDLlij5fnYAqrbY
         wDIICG6kj8C+HUdwdgMkSmOFASn5SrpuITpnY6S2JFy7iz8/xBprixFhmGAN0xUDo+yw
         SQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XRnZvvwV5MkLIk8f88/ewNKn7VXUukkMueRv4QZD1mM=;
        fh=FlcAI72mRZKnN++T7al9iNLEM2Hd6G4ESvwJQc9R1Aw=;
        b=FZrzTFj9CKj2VNeH1Kr6tgIONndj+qxN6wLFAxM0wGnwPRo49/bcq0jMH5cv6Gchph
         1/nVi7h2IiPOfZzIqrp/jliM06aUr19WM8Bo63SM4lDsVFYeER+UOV4c6A1g68aCQZEa
         DjaT2w4Eez4osWHxoaGoYHEtE/oQ+waRP7iOcXGNxVFc1nryKIV6wignPrXLCkKazkoY
         UHCmPXMjL8aeZsruL+zUnOESZhvC1coD23Xmk49DibGWr7TJsOdQESNPbK7MiXtsnV2N
         ddSaEk2yGEaS4GQMu7Ppr+jbMkOFKUoh6zse6NQT3VHfT2+XeU5KYujqC9WbZcS1lagB
         5dbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769174054; x=1769778854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRnZvvwV5MkLIk8f88/ewNKn7VXUukkMueRv4QZD1mM=;
        b=dyMgeupucPiVLLc9ojIgkBUNjXctqeEMSVFHg2djjHBP/3SjjZMO/Jj9yT0OERCQ0j
         0EGEC9QBz2Ec5/YmC+5T16iRSUCsenwJIQvcpIc+aB5MCRuR2o2qRTwBhMwFYGsQPACf
         uvtfBL3wKzvquKv0+qlMWZOjUYD1Ki4nHXz8otmcqD/Jcq5tCEuqpKK78hAhV/Et84vT
         27X1VBdVYTacJzy0uZmTauvu67ZJNYlqsdC+CoRXiWAEfby2A1rYElN1Rmrh0X/AR4Eh
         yE71RSY5TqSW0yYkrnF0dVMOgMU7oIctoRsdCmZ/p7khLIc6ir0FBOTJaJttqxWjYbsR
         WiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174054; x=1769778854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRnZvvwV5MkLIk8f88/ewNKn7VXUukkMueRv4QZD1mM=;
        b=PASdw+G1VaHPdN7BQhH3uuppFIkZ4P7xFV857meqmC4M1PqFjCvPJnf/h0CNp9PWE8
         vfJgKGISOkFQaUlMfXlvQiaf5ND57N3UiJV/9QspuNxmub3x+jTVm82AaE1Q4C4UT/HP
         R0TMONwlseJQQfpJWtQTmovddx575VdT0VxcwecNKdYsccvz+fO+7BJYCfrzAayREgSX
         krNuokNFwXATQ4RBbWku3z66XL3l0p18CzUiNvOYA/pheewSjOiAyfSvMvf80JlpXFRi
         QbsRKxFGF7yItj1CNv3dXrl5YtADcXYEJdvrT6Jk8wsOCAEtt8ArZWFW49B12c5Z79Za
         RdhA==
X-Forwarded-Encrypted: i=1; AJvYcCUo/EJXyDNQ1t04ccgV8v+xXTrFhrNF+uBVqvr86AVc0ReCFM4b0RtGQEPuAZH4nnmzdw/g2Z/r5LPeSP7yeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAvSiPnnaAMqCbMGQ7HpVGnZNCF0FASFgSpLz58n5QgCasVsXS
	kMbBUmNt6SJhuyj3tEKMyBcS0Z6eGtLiuN7wNacnAOiOKS8+bEh06CWj7XmuLT2W8jUoxpjr7TI
	qF/h2NOW9+5RvIBPd6qwJZRQQL6famPMtI+j9
X-Gm-Gg: AZuq6aJDCU9XMQWyqWt2FC5ca+PnRCIfKiNafUpAc9KgUM+We7RCskutx3zZ6d5x9tw
	4zq1ZThomMhGM8rKbkHakks+GClCHLMTaAIoF39ITdkOc2WXv/evdP9rGVBrw9DuSeurVKt6Jmp
	E5DH5GQDzYXSJr+6jyV42ECct1fGeu0PDtWUzsSIuzX3665Me3ppmQ6HkmpBHtxo13EHIM7tCnH
	3+JE9GkABz4jx+jAnn8waVVgNpThGuLSI7Suv1UjOzEYbrk8qTfF5A16qGB6x1Y77kjo+OCWAxm
	48vqUXl+NkK4GnRxDmXS/Jd4UXc=
X-Received: by 2002:a05:6102:5489:b0:5f5:33e4:12e9 with SMTP id
 ada2fe7eead31-5f54bcbcf3cmr881188137.34.1769174054057; Fri, 23 Jan 2026
 05:14:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>
 <CANiq72kMh2QYZF5gLzSZVOxgZz8Or07c4FxzWNXN1_4CwkBVJA@mail.gmail.com>
In-Reply-To: <CANiq72kMh2QYZF5gLzSZVOxgZz8Or07c4FxzWNXN1_4CwkBVJA@mail.gmail.com>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Fri, 23 Jan 2026 22:14:02 +0900
X-Gm-Features: AZwV_QhEtt_Tgk-zkLztWqqsYBbKJWV33qCaQ0BsMeccCZSjeFcM5El_LXEwvs8
Message-ID: <CAGAB664nN_drDtG3HA=evO4m1o8pyYohQTXxC4D5X2x6VL72ig@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: better pin-init macro resolvea
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 23=EC=9D=BC (=EA=B8=88) PM 7:26, Miguel Ojeda <mig=
uel.ojeda.sandonis@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Jan 23, 2026 at 11:02=E2=80=AFAM SeungJong Ha via B4 Relay
> <devnull+engineer.jjhama.gmail.com@kernel.org> wrote:
> >
> > From: SeungJong Ha <engineer.jjhama@gmail.com>
> >
> > Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
>
> The commit message appears to be empty -- I think you may have wanted
> to use the text below the `---`, since I see another title there
> (although it isn't exactly worded like the usual commit message
> either, i.e. with "Hello" etc., so I am not sure what happened in this
> one).
>
> Also, typo in the (patch) title.

I got it, maybe I got something wrong on my b4,
Let me check and get back to you!

>
> > @@ -123,10 +123,18 @@ def generate_crates(srctree, objtree, sysroot_src=
, external_src, cfgs, core_edit
> >      append_crate(
> >          "pin_init_internal",
> >          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> > -        [],
> > +        ["std", "proc_macro"],
> >          cfg=3D["kernel"],
> >          is_proc_macro=3DTrue,
> >      )
>
> Is this commit 74e15ac34b09 ("scripts: generate_rust_analyzer: Add
> pin_init_internal deps")?
>
> I think you based this on top of `rust-next` so you did not see the
> fixes currently queued in `rust-fixes` (soon to arrive in mainline).
>

Oh, I was wandering the project on `rust-next`.
I will make v2 rebased on `rust-fixes`

> > +    # pin_init_internal uses #[path =3D "../../../macros/quote.rs"] to=
 include quote.rs
>
> For comments etc., we use the usual style used in other Rust files, e.g.
>

Got it!

>     # `pin_init_internal` uses `#[path =3D "../../../macros/quote.rs"]`
> to include `quote.rs`.
>
> > +            str(srctree / "rust" / "pin-init" / "internal" / "src"),
> > +            str(srctree / "rust" / "macros"),
>
> There is this rule in rust-analyzer about `source`:
>
>     /// If two crates share an `.rs` file in common,
>     /// they *must* have the same `source`.
>     /// rust-analyzer assumes that files from one
>     /// source can't refer to files in another source.
>
> I am not sure how that is supposed to work or why rust-analyzer
> requires it, i.e. does it mean `macros` must have also the `pin-init`
> path too? Or just that, for each file, the path that included it (not
> the entire `source`) must match?

I had some brief experiments(after rebase to rust-fixes).
It seems to be related with lsp's "go to reference" feature.
Without this patch,
1. The analyzer fails to resolve the mod `quote` on
`rust/pin-init/internal/src/lib.rs`.
2. The analyzer also fails to find references outside of the
`rust/macros` directory.

And I couldn't find `pin-init` usage on the `macro` crate.

So I guess the latter one has more sounds.

>
> If the former, we may be also "abusing" it in the other place we use
> `source` for the generated files. If the latter, then it is fine
> there, but here we would need `macros` to also have the path, I guess.
>
> Or perhaps that "rule" in the docs isn't as strict as it sounds?

    /// By default, rust-analyzer assumes that only
    /// files under `root_module.parent` can belong
    /// to a crate. `include_dirs` are included
    /// recursively, unless a subdirectory is in
    /// `exclude_dirs`.
    ///
    /// Different crates can share the same `source`.
    ///
    /// If two crates share an `.rs` file in common,
    /// they *must* have the same `source`.
    /// rust-analyzer assumes that files from one
    /// source can't refer to files in another source.

I think the analyzer already includes the path while the parent of `macro` =
lib
already contains `quote`!

>
> Thanks!
>
> Cheers,
> Miguel
