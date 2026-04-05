Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7373321C1
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417762; cv=pass; b=DSYCxBJXSb9KeEjSJS27XoHKb76UfV1l7c7Xjn7vetfASF9UfoE/fW6Ea6/citXyRNzCmkNbKED9tVJsrgRI0EGNcZMKW56VlwDqE0YzuGUiok+tsDk12d7x55ESkxKFD7jgbAIyJd0CjoWqnvOLLvNjPgGCXGjxYWxMjHleIxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417762; c=relaxed/simple;
	bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qme9zDZltm6sH4Ane3jCeD7sp/J2+iZUZwL2BOSvG6NMh524ZaXg2gB2H7b4kvOfZK6aRgIHXyjVfDX1TFGIYYcsKyoKDzAhyGrdI1dM+InFXR+l9Qc+GZ90/uuGD5xmhqi66HrPDsNIv0TMmL+yyjXPVqcPz+b1ciJzxsxpPMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkjwnYb5; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkjwnYb5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2cc175eec4dso117355eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=G9dN92Vr6nwEzjua0liLYN9b6rD+vUe031h50/3JO4QHT52XEVZwresFx72lUaG/vt
         KE4Yu16wyFrhHzEnQF1dlFiHT14dCRLNOkwBj3JlcZhJSgAfgONV1fvAUPG0na8OeeFf
         YXvi14yty73RhxbNRIi7YZ+oDyU2/W8XJsHhg2CeWbWKrL0Neux72Rkltr+zTlu2+Ddi
         prNMZoljoXF15TcuCbTvbnIo2DTMp2uJrmPUbNTj8PVnLmels6B7nTUxgxqRPe/Ulzab
         BqgX2NZSVGyuUflWtct+TIjt0TX1uatl2A31WYsbw/fSaD6sb7Aap7zrxZGnrtwXxbGC
         wQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=36Do6fYpmTlBSxdnYrdvAHAIfqTstfsyrWGK1BXSeME=;
        b=fTdCIQtDdu9SvtRoa1XD5O5JZ/CeJTcvdkS09USnn2xqmWxJR0lgFB1VISO1OjT+iq
         6lqf54ECABEWSjwCnAW5SQqPpRRj/np2Thrl2TEvttvo8tHQ/F+mUzgBxeatkinRezM/
         dwYT15tps7qv0Cj8K2DrOnfkzF7SX0cTP1jeeNGBP3VcHP8GtPZg275xCwFGMxrWOCsC
         qqfHBoQ76KzfL0nfqDdDDbQu3E6/D3gte8Y5bT+QLkJiA/hD/wwoj081/XRwenqWfZvB
         l8F1aoy3+EdYKS4lYwQBMPRDOqi3lEyN7pOx/yypsraLV+myOm+cginF/AyRc2jTvDJa
         v9iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=dkjwnYb5y4irn3yDwTic9/zkksmlrGlrcEaDqFrgrrBW2e5KW968xLIRMImwXpMYQR
         ecd1jPK97TvMf6XLAIWhx//UcshQ+msJ11OhHDADc70LU0IvyPC4EIhswfxfuUEFj7qI
         hWDiTqqbU8wBneTz9NyHY1zo75vOqRbvAE/x7Of1tht2oUpm13uX0Oscy9CumKxtRD/9
         u/o04DvH05qA169PQZzzB8juPZXRVgfukM9JTCUj9f2+wlsXYVP7ceiu/B6ANv6bW1tU
         KzL0BCX4ELXxYzoT7TXNvopypQdjHof5W6W3JgDpUBUqBwpEhhcENd/OGF2CaddI+TWR
         HrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=X1N8U9wS36YppzdXejXl8Yt7oLcwWWlHTBoeGbrpY2GKfzdP6dG60HLyXzYaT1FAqr
         c1yxExcb66b9JSutmUj5m+m5W6h7tHeaCFTtglByDFSpwFtTClrl7AnQav3ViV/VX96A
         SIAEvRIkxlz1pzJrVLSCoW2PF48CBeaZpzZBrUfTIMi2JW2OlsFGSqvGnt9wJOVJG3Y7
         xfIJj7SPzDGS54yoLmEPSnWqFwvees2dWy5pOwyR9Dh5UjOPDIaAnXynpcgGFfYoqKt0
         nvEr9c2fPuTR+GAtPuaAzzvS8ym/beyJ8aMXIlrvsnRnJjQfQbp6QBQpKUH6By8KONTj
         I5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW2u/DIADaLM9bMjediOWdFreyr1TptQJx2t1vlBWolwyyPcp08Xzz70phxq92Ey3KdMgupbwQHLtBqpqrVzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylz2cFmT3kudBLnQ920dAgvIf4v1QDXKaSQBGyZZMT3KdMp8li
	JzrsaCxkZQHvtysAKp85bSLFFfKnqKH5/ag5YcwP+CUQrMX7wI/YZwRAz9QrEgAhkKE9WgKjlif
	qo1qXPWBYP/QGdVFYCfV+gncOiL0QanI=
X-Gm-Gg: AeBDietqHeF+MVjgH/B/xzUbJh4LIhCg41WObyZE9EHDwYo4te4ix7CQV2ZF8Sfq5hd
	Q2nilakVENUuNSAjrOJEoG0192D6yRu+XFYgQ3n6Q7QZrkSMOeAZthADM8q+5uhZ6fZu80EnvsZ
	qEfUamkCJ+KSzESfQLtTXF6Q/JnIbdErdL3AXwiogHnVvBw/WDA68Ng8I5l9d2xSC+uOHG97Elz
	pRrNE1SL16LTkOJZDT1k525pZCqiFN/5zstd18+Vf0jKQ8KWuR+9b5Ip1q8CP7TIyrnvGpUYKi7
	KMQwuV2ShNXaonvFa3ZONP8M8x2AcBYk3wXZNP1K+4UN4hvyXMCiCvOVB4jyDTO6gofObwADM5z
	/A59hV7ao4RchLOlVwFNZxOY=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
> still needed there?

Yeah, that would be nice to know.

I tried on my own, and it does seem still required (at least with
those packages mentioned in the example). But perhaps a Nix user knows
of a better way to do it, anyway.

So I kept it.

By the way, I think it would be nice to have a "standard",
well-maintained `shell.nix` (or a flake or whatever is best nowadays)
in the kernel tree somewhere, i.e. one that is known to work, that
covers most tooling used in the kernel, etc.

Cheers,
Miguel
