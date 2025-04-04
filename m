Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BA8635C
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Apr 2025 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773054; cv=none; b=rm+pdeoJtZi5JsJdlrbrBymsg0p1yojHMBxHomV40XDV5VOJQ4itJhH/1A9rj7TkwcKN4pBrQEDffjE05xbpoz0Rr5mwy2GEmEcagYo0hyD8ikvmoDas1c+WNJdM371VFY6PfYGkmgM/wy3Cv1ioMbn1lZLeOwRxY2n1ZjEggjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773054; c=relaxed/simple;
	bh=WyHgvKKiWUk+AGHymqRmuDi3yJyYxQcDtPVVyyf+S0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXMdim8Fbztg/B3zEJtW9ARMrChjw3C5jeb9sizg9R5+PAErIVk/cuviZE5tow2rp0iogYZ2GMM0LSuLGyk3Lok7zQv6Io3ycZ+f+ttMjbV7weloruzT3D0xhC4xvO7GE0O0lCM7p7nk++To0AiiapcpY9tcLX2dfS7a5dNQG6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqeER51a; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqeER51a"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30ddad694c1so21428541fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Apr 2025 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743773051; x=1744377851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDDgc58r2ic3bl4DEUTP1HKWP1q5RumnY5TvMBZc8G0=;
        b=FqeER51aQvlu0F160PWAY4Tls/eezNtRSWmOzss/+bVBm2Bk2Tix/gR/4tSzIaIy5X
         JDIY71/QBWx+wPSe19plaN8Vn4pnADU8ev0OJUbLS9Azru5JdhvMw0v5+8X2+QQvDJ7O
         oHXOoSM9dko4U211YRtwf/1a2SY5V5MPmnbaA//e7CUK5eaxt4E3KKM9F3jYF8dFBjGM
         z9g5nzaMusPaWibrv1bVz/k5vEYHKsYOdEVHMwu1IQvvXZNrtQVNYk8h8W8P+u5/QjWa
         hd17mRqCInALcSILdSjRyVJ8pkVFRa3IMrgOYJFSxlwVZyGPPZ7HjoxrAcfxrVM2EUGc
         rUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773051; x=1744377851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDDgc58r2ic3bl4DEUTP1HKWP1q5RumnY5TvMBZc8G0=;
        b=s6TgqC9QcDs9EexoqGTcuI+oObI396D0DXvbkwm3MwcfpJ4YECuiZAWZ9KG0UdbSkm
         60S5VjivicFX6Ibodw9dOOb3WrN/QewO469rBbq1PvNM/JfqUKbv0KFW8SSIjYfj6vZN
         Zuj1ZViAtQOmgwg+AjXXRJ7jJffdA/6U8Rx+ZkZEgIfyslDy2Eg7M+5O2i430ME9hfZP
         X7LoX/DOf3f94EE0V/v1zW184CbuQ+enlxX88c6HdGB+RKX1RVd6IX7G7ktPgyxTPpYQ
         1LvB8LWMH7ASNLkBYHnHKPmnzoY2/1D21oCU/VHU57PxyIGOrcCpleqD3JK9HNSwpAWT
         etqg==
X-Forwarded-Encrypted: i=1; AJvYcCVbP41wgZ1GEuH9oTf3KgM9HuMcbNKv/Y4FdYREysVCNUMZHEwHnkaGG01c9b9e5x5TNB1xOGyM4UNNvkdzag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7AUCULSkNNM2o5nIlJWaFqAHR4q+Si2Uc7VD0XB5k/+qmL/U
	M8kCNnF7qTLbuxpLcZel716HYSDWEd5ehf/icWyKIMr+eSi6y2ejUExf+FFjVNN8HbS1fKPDnAm
	YEa5PDEUNHDScrPuJoiTG3yA/gUI=
X-Gm-Gg: ASbGncum01SLVvaHrssLBBLRacv72Y5MpIGIJNcWhS7OXgPkIV17BEv4Mxp9hSskzFN
	wrWRLyrfUDSB/Q1KZM+rTIMosTYcNqpKYtFt17gWNlHfSS0V2W721MjUMlzMmQJalt2O4KZxs18
	XaKlQ9NU0R9ZVZ/AOutnh8XK0+IQck86SfxsURo8xANcN4REKNKU2v30neXLQ=
X-Google-Smtp-Source: AGHT+IFI3Zw9s0kb1n/hEOp1OvJ9CTnxfAWezYwJM09TS+fCFGDLAMT1HEYpO51hkyFmqqkAeeGGvImAmauyFbRCgcY=
X-Received: by 2002:a2e:bcc4:0:b0:30c:12b8:fb9e with SMTP id
 38308e7fff4ca-30f0c061ce6mr10013451fa.37.1743773050571; Fri, 04 Apr 2025
 06:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404125150.85783-2-kernel@o1oo11oo.de>
In-Reply-To: <20250404125150.85783-2-kernel@o1oo11oo.de>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Apr 2025 09:23:34 -0400
X-Gm-Features: ATxdqUGyhuSLKvp60qfgxUIxJAiONiYJ9dZdXzz6hJtom1d19pI_04feupTkmfA
Message-ID: <CAJ-ks9nKoUwSjfF4QWTXJGGFvLjcq4nDzgW+ybX89cr6j0hwgw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: Add ffi crate
To: Lukas Fischer <kernel@o1oo11oo.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 8:53=E2=80=AFAM Lukas Fischer <kernel@o1oo11oo.de> w=
rote:
>
> Commit d072acda4862 ("rust: use custom FFI integer types") did not
> update rust-analyzer to include the new crate.
>
> To enable rust-analyzer support for these custom ffi types, add the
> `ffi` crate as a dependency to the `bindings`, `uapi` and `kernel`
> crates, which all directly depend on it.
>
> Fixes: d072acda4862 ("rust: use custom FFI integer types")
> Signed-off-by: Lukas Fischer <kernel@o1oo11oo.de>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  scripts/generate_rust_analyzer.py | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index cd41bc906fbd..fe663dd0c43b 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -112,6 +112,12 @@ def generate_crates(srctree, objtree, sysroot_src, e=
xternal_src, cfgs):
>          cfg=3D["kernel"],
>      )
>
> +    append_crate(
> +        "ffi",
> +        srctree / "rust" / "ffi.rs",
> +        ["core", "compiler_builtins"],
> +    )

The dependency on compiler_builtins looks weird to me, but it is that
way in the Makefile. We might want to revisit that, though.

> +
>      def append_crate_with_generated(
>          display_name,
>          deps,
> @@ -131,9 +137,9 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs):
>              "exclude_dirs": [],
>          }
>
> -    append_crate_with_generated("bindings", ["core"])
> -    append_crate_with_generated("uapi", ["core"])
> -    append_crate_with_generated("kernel", ["core", "macros", "build_erro=
r", "pin_init", "bindings", "uapi"])
> +    append_crate_with_generated("bindings", ["core", "ffi"])
> +    append_crate_with_generated("uapi", ["core", "ffi"])
> +    append_crate_with_generated("kernel", ["core", "macros", "build_erro=
r", "pin_init", "ffi", "bindings", "uapi"])
>
>      def is_root_crate(build_file, target):
>          try:
>
> base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
> --
> 2.49.0
>
