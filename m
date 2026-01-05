Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F03A1E89
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610191; cv=none; b=FGaPXSC4nObbprMWTV9nHLbemA8EI4aFs3EsnBfqBkTx6j/+CIpLbEhSO16aEs3YDd+U58RIU3Ee//Hcd5Ot5cYrGcRdJ/4SLD5KykbH6tGEFGRdKXB1GZSCV9kvKZ8zvMU+4tlJFvycDNQVDaN83rS0NIraJd7Z+0ApKTumsZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610191; c=relaxed/simple;
	bh=GFuij5wdBEq2MRlW1jzQvwuYeZvYDIWC5JRRjZexnVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe+WpY+MFVqSgHfRsjtyrQ7Y/a521JWPzZ7NvBj24IYpMptyJxeGCmCRiKhff8qVH+AoKUfxZIZKezitNKEdE/VqoLesooW7btlkLNjIQhFj20aQ7VSff+XB6g53cCscESg61VlauifsPwgjTAQyk81Ec9f8WF7EtHFtYqzdRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffcie6cE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffcie6cE"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so18827250a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 02:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767610188; x=1768214988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKumws0iftOhegj62Szxp3+ovrnnJLmq0q7+gI/7KWg=;
        b=Ffcie6cE7YwzqlXsA34Cw/+UHIvSk3WAis0cjzS5lVGyZsKbXi6nNAqCaeHxU1Epzj
         /N7vvmvQ+XnOITP31j/Gu3byODYYCtU/lSUro5cX88GY8iP4x4XVVM4VXmAOrb9WOAyX
         bkWPaWvmG3Cg9UsibE9QSPe3Pn+MtpLNglQUrRuW/HzfNZ74hig9LCzqlMM/dinnvbWf
         8NcWs7SSuu/XRcfst4qSErHk3y8mqTQhJJWLPt0qKj1LaSeGlM/sf/6S64cT3KlLPsdl
         MNiuZhfMa5IjXbZX4p5Rd58ME/x38HToSGMAlYDuNSQ59aqBi/QWIqf2Vn68R7poU4gR
         5xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610188; x=1768214988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKumws0iftOhegj62Szxp3+ovrnnJLmq0q7+gI/7KWg=;
        b=dqAQOSyaawdqy7pgUdch9v0p4/NmR94SgCtL2oHhArioIUcU650geSmUi+t/PMiosM
         wNTBZ0/AIyn1ERywUz41weB6/fFBxuVhAgLMgTfluLSiukVyyV5+tl2HhZpTDReZ7Eyq
         Xyzkg+MmS18YF0h0ijq8StOUP2o4+7kkT8QypGety1pFwLP3EOkyBeq4BIOa2yjrV93b
         OZU2VaVGfECWWgvNWqlFatFShxFKybRRjeBdPaEIAlfvRc0W/+SGb0wsfsS1pTQ2XV0K
         7Md0rBJ2+QKBfFuMA4RI2TaHr7TkgPNHXegLABA8XOqxwb+er7ZTxPZpbGMiu5DNuv15
         RMCA==
X-Forwarded-Encrypted: i=1; AJvYcCWjngNQtXGYamYydJ21nWrKcaDRRC18gn4ZBOTZloiLTYUuMH1FM6K8MLDKo1HqRzUR6OJEMDlAwrTHHUCkBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDX+N8J5Bo0dtaihKHhLPejxJN+/WjNrYOs+TvnCxX1vZyxZO
	56FUX5G6NLMremmogueFDx/t3L5fhhNPjUW3mPj6WkX1atRk79Nymluwkl3pWtNpDdvfP4fF/Mz
	ZsNQXfbjnzfCmKrv4dqqsM6UfnaMbx3Ltk0MTxvg=
X-Gm-Gg: AY/fxX5JijxzbC+waef4vT2VrMrZGNtqi64qm34rw/7y4VGHz1DmDUL6aVw6Ben0f7j
	uXE137PDp5j5++feSq8APzjaeCdz6jxGwCHB9uLc7GK7KMx6IxYxbo0EvCcU4PVR90ANds0yaIa
	/WPADzJdncb5G8A4afup6g8zc090xTW1B/oKTwSPDFmKD46LAjl9CKMnVjBAt6JA/2J6DYnIhN7
	rmEPUaOCqvCDehqDIBQEKpjQnPLLFZBQsvOG0c7ojtyYH4EzUr91CSpTd39OyMQuPNNU5/c5GMR
	hN492nYVz9lynQbRUYlk/xxODknKg0yumr2dDx5LA41y7t7s/wGlU7evzZ6pFOZrUFNwD+EHsq1
	MmH6xXDZLS+nCBA+ZjQu5lgh9RbMMAFMgAJMLSW0fJg==
X-Google-Smtp-Source: AGHT+IEjEWdkF8qxV0vpqljtOyb8+Ov4RfNu0kUWiIp7evC2FuxE0NWHou/PkxVQFWwVaFEzjuVS3KZ2yVN1zbf3wiQ=
X-Received: by 2002:a05:6402:270b:b0:64b:4f44:60ef with SMTP id
 4fb4d7f45d1cf-64b8ecb162dmr45074269a12.27.1767610187743; Mon, 05 Jan 2026
 02:49:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
In-Reply-To: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 05:49:10 -0500
X-Gm-Features: AQt7F2rPV3WULqDpdl6M6CODdC3AfCvZSvua-y8mehk84fw91peAcxEQC-uPWSI
Message-ID: <CAJ-ks9kc5Xu5izxCexV8LeyO3tgHhJq_XZ2xb0uNL4akchqHvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: syn: make rust-analyzer treat `std` as a dependency
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 4:38=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> Fix the `generate_rust_analyzer.py` script to ensure that the
> `rust-project.json` it produces includes `std` in the `deps` field for
> the `syn` crate.
>
> `syn` directly references items from `std`, so rust-analyzer should
> treat it as a dependency to provide correct IDE support.
>
> For example, `syn::Punctuated` contains fields of type `Vec<..>` and
> `Option<..>`, both of which come from the standard library prelude.
> With `std` listed in the `deps` field, rust-analyzer can infer the types
> of these fields instead of showing `{unknown}`.
>
> Verified the explicit uses of `std` using:
>
>     grep -rn 'std::' rust/syn/
>
> Fixes: 737401751ace ("rust: syn: enable support in kbuild")
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Tested-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc94068..3b169904ee41 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -103,7 +103,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>      append_crate(
>          "syn",
>          srctree / "rust" / "syn" / "lib.rs",
> -        ["proc_macro", "proc_macro2", "quote"],
> +        ["std", "proc_macro", "proc_macro2", "quote"],
>          cfg=3Dcrates_cfgs["syn"],
>      )
>
>
> base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
> --
> 2.47.3
>
>
