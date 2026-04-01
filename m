Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D1F3C9ED0
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034819; cv=pass; b=j3+E8e0u4zY6/hqjtlcp1fA99xPnPfuWKBgs7vOjMV56ikD51dZnao+wKaNPms0OAutWSv1kuTWYPDXmP7RDMnS1mDJTkl7RZUESUH0f4CwUWtkSLuzYOHny1uMi29DCbdM0H/H5PO8OVDujlmiYw5o+bfJfVbBkvkZRiF37nkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034819; c=relaxed/simple;
	bh=QFYF7XZi4JO1uWyMujqTYJc6fNoJQQoTSICnhUPxTgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fmsty7seYyL1PcXlBfPwggoxXC/PuErDgrQa7qQn/3el8YSRSlk3haHOfGmeXzrh16nLjepVFzROJMfEW5E7DEWPgFQNsenDfPSt0eoMQMe2mji9HpUTkGQmIMiOAAK5XgPMR/0hLnAtLlfBHfZYaOFgLvJTP1RkIFUGDYEbHaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLG2Yhhw; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLG2Yhhw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2120416f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 02:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775034815; cv=none;
        d=google.com; s=arc-20240605;
        b=TfBzuFCLvYd4A6RQZH840D2GzFpodetUUbkS69NhLpA5IJ5Y1Y80JoIgtJaKrlvWeQ
         cymKaP3Rxj9gh6j/gzATM4vg/+25ftyU5GVrVIIrBe5NQWkqKdbowVl/Dm0qayni2Y9n
         leOnk8LBK+8t8BfjKRPGbse9BUh/+MqoeISx3kWZisNeIUSbIcqDVEMEE70eCnhC99GR
         Ezx6SYEOsThxl/fRm+zSv74zFdzV8VJoXUqVW2Xk9Oz+HXOzmws5p7MQ4TeKkHhsFbm0
         D5iI/j70nRKIawW6hfICoABohG5r+bSbsfmUSfUYiZEEytK2WKgjLPkNzVshzp+eYgii
         k/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0z9rCSZjhzgqsDij4dO9eDyirD7l3D3m+OFxXCVSvB0=;
        fh=px9Vri6o/Pq7JSScrIjVVzXSx3ME52G4hlZKxvRsTMo=;
        b=bbN4PJ8gIc03seDx2Fswgy/6bT2D6bzRnGZPeKKhLQ1kXiqEqtG4hcW6LfHVAFAiWp
         bxMQUs2a0NzV561j70W79QAvyEhF0v2eRmqDbM/rFT9MhsnSyj6tCUbiL+eGOPeyK0F7
         PES2QCdqeEOBkhsTCvt/obordKXDTBWw0d9krK89mwU4YbJ8KA1i7dyANgJHN4bUXlNo
         FrvICig9/wYOlW8al3erXUTIdtAjep6ANO6rVKeKjc0HvNbVGrf9IL5h3HLzGywlnarR
         c0gwJXPlVmMMjOWS2+8HkM4hmKaUsr4beV8RmNYpT2iwT1MzBp+QCbZmbzy0aqOI5Soc
         QoXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775034815; x=1775639615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z9rCSZjhzgqsDij4dO9eDyirD7l3D3m+OFxXCVSvB0=;
        b=oLG2Yhhw08K5rX01PUypdL3mqeQOH8OZyytrRMhca8jHMFxEZf7xtYT6z11t0o9HrA
         +7IAX+hFfDkqoLxa/PafygWWobxTW0gMi/ndakwdCBSH/bRSVmii3YtuRRCccvcOXaEj
         5ddVv5q98FvQPZpA1uknkeF3WS2T5g7ce/G6xwl51JrRR3If5lNC9PexkiYmJbAsRxFS
         9hvbbxEtwnuymWfZukV5GQXYKAndP02J2I4WSeLeVUWJTCBLy4GLvEkXuvq4Sarzlnqr
         VFVjZRdL0UPH5SSAkbVhBbxii6xpYS9gxz17p08Y0Js1Bp63uW+6Yvjr6yV3Bh1wPy3F
         nfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034815; x=1775639615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0z9rCSZjhzgqsDij4dO9eDyirD7l3D3m+OFxXCVSvB0=;
        b=N5iG0na1lb8j5mh+vjcLSi8+dJwSeE1Vd/HXfiDmCoBNG52+dMGHj4HE4JqX89eGkL
         cOQPlLyyBNEWq2+iZUdWG4d/3/kxJYvQyxzpBzHzQcvGQHJB/M7NPmWCi1jfrZfDZcQg
         3qE9VAeLnKSO0H7z8CVBgSFm+haBvtw5xLCziciFWHkXmuUAwDgGH9if909Yj+gLJnbR
         BMrxAkRelG7REEF+78+5jZ5yohZnXBfJoCWuTgQ5J5UooAbG5zqmpd75XzOJort34yxx
         Ww0UEdu7LLkhP9fcN9ty6ISeD8A+oKoFf85jtqWnC8vzamfCRL4PG5gulHe9yg+5nWtU
         3Q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/EH3Wa1q1xH6GOdN6dCKZZivgaPyvKddcUhkIJoLOo+8dki3Fgm6GwOseo+1kXCroUze0XjD6SlQY0ayEKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqyQ2PE3Wjea5IAIS5OwMDnF5k5UQAPhjBejy0MEYNoGBYP5jJ
	0gI1RjUaP9qUxzvXrf61iVW2pagWjnLQf6p6Rb1EXuu7aRVWlNc/nJaqRnbiKYtO3Fq7G6Ua+vf
	C66i8tuU08MrWSwrt42xj64NCQ11loZnOgiQ9rc1n
X-Gm-Gg: ATEYQzzj37S2ox2zx1h/x2Y+4+fa6pxtGB9o/DQEC7E6fpAoKpkp+eeOZZ47l3q8MyJ
	byfH5rFqo45LScnTitt+YlejiZFLnf/j7N9mCMODBpKgOOfTjWc8xSU/Qb6jg5lSHBojOu6cU5/
	cZymd14GyzbzgYxDCaS+LWl/aEdPh25B8ssO1fNNBtLdGdTK+66PzOgTsCkXnUHIOqEJ4BvsKB4
	1mhYtMlsSTLU5akTKljDSAhlv8PIF8Q0O05kjoly4fzd1rQTKEbL6FAKP6KQCUwjkUJ5tTb03bP
	iWhX7MSLgWiSXWq2hRwsw1IWs7FqNouWacMuh5X9FCbdy/SS
X-Received: by 2002:a05:6000:2909:b0:43d:29a:e42a with SMTP id
 ffacd0b85a97d-43d150c211dmr5076261f8f.29.1775034814196; Wed, 01 Apr 2026
 02:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com>
In-Reply-To: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Apr 2026 11:13:20 +0200
X-Gm-Features: AQROBzB-8BzV3gKkJjU-4FV5-TqIn6Zpz4iTvD2IP9jhw3sFZ4zvgCLsfrZ52lM
Message-ID: <CAH5fLgjbrFsJxikTe-94x4a9Q3K6V5rCJBK=0pmZ2_qjfreBBg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kasan: add support for Software Tag-Based KASAN
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 2:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This adds support for Software Tag-Based KASAN (KASAN_SW_TAGS) when
> CONFIG_RUST is enabled. This requires that rustc includes support for
> the kernel-hwaddress sanitizer, which is available since 1.96.0 [1].
>
> Unlike with clang, we need to pass -Zsanitizer-recover in addition to
> -Zsanitizer because the option is not implied automatically.
>
> Link: https://github.com/rust-lang/rust/pull/153049 [1]
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Drop the first patch for -Zsanitizer-recover, and mention why in
>   commit message for remaining patch.
> - Pick up tags.
> - Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-=
7d3a765a72aa@google.com
> ---
>  init/Kconfig           | 2 +-
>  scripts/Makefile.kasan | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 444ce811ea67..545cbe889a52 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2179,7 +2179,7 @@ config RUST
>         depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
>         select CFI_ICALL_NORMALIZE_INTEGERS if CFI
>         depends on !CALL_PADDING || RUSTC_VERSION >=3D 108100
> -       depends on !KASAN_SW_TAGS
> +       depends on !KASAN_SW_TAGS || RUSTC_VERSION >=3D 109600
>         depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >=3D 1=
08300
>         help
>           Enables Rust support in the kernel.
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 0ba2aac3b8dc..91504e81247a 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -71,8 +71,6 @@ ifdef CONFIG_KASAN_SW_TAGS
>
>  CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
>
> -# This sets flags that will enable SW_TAGS KASAN once enabled in Rust. T=
hese
> -# will not work today, and is guarded against in dependencies for CONFIG=
_RUST.
>  RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
>                    -Zsanitizer-recover=3Dkernel-hwaddress

Sashiko is asking what happens when GCC is enabled. I think we just
don't want this enabled together with GCC. Miguel how do we usually
handle such cases? I imagine we have quite a few options that are
probably not compatible with gcc, but I'm not sure we explicitly list
all those cases in Kconfig.

Alice
