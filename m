Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13598245020
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947284; cv=none; b=u4eGW3TRZrDgrezjttsGdeF8901n5xUf1PZk92WZSWJLS9M74V+F2gEtqPaI6KAgj+fyGYKZAM/e8hjqtT4fH7CZZEyAYspvcm0eevD9hR3uiZExHo2gu5y515n9J4mEAV6JHBKK31tfBat9b9ystJsaSRWfmJ+2jtR4jDz2s+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947284; c=relaxed/simple;
	bh=KCvg+ikTpFCXv53G51DcHrbuLvPBIVU9eusIF5PQAc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmgcItOW8Zu7DUTvvGRYe4DD9gakXxHYmBMdPwbdUtB1Nm2HvViIX0+n4BLvI5Pl8zF/E3OBMGj+4dPmqD1azbjQOOVLF1rLhW5ViY1LbEADHyY+zWUA6Jghj/exjGiHV3/Pod8iUvjT2/gJ0HfUNAx9jpZEz3bEFgxXR2pt/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQsADKf9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQsADKf9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bac5b906bcso411642b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947281; x=1764552081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=SQsADKf9IDPus5tv+CY7N9psMWWkUmsEqNFkS0qsvLWBCvGozAOXbuTI67jRVDjCj7
         cEV3prORe+WEzUeeGYGZkRDuKgJqRBDAGrZEAAay9PGrTX/rEzulshsJzOYIN8yMxiG4
         HpmzIFH1Nw2LQBZfF26EUw3uxo10ogQyu9RHIAMPi5rZWY7ktXdm2PnNxy/2g+d8rIlo
         FGShM64CtJsFnw0kp1G+kQFibAQKp+158YR4uVnWpJHHmKsRVC1TEYCBmRm2rYNpoCG3
         i2bufYQZOMUpb0IT+MgrI5gfRdSrvEGqqx01YJSjAcgoFqlTuA+OPutjkxwQp/08Glhx
         k8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947281; x=1764552081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=l+qnHW+Tc2RRaGnYnaWNUNJQCTuQ6L8xJoW48aJz8mxVQqmsR0l2r4XYpuJilIPYsk
         Y1VMBzW0Xfo8TihVsX/qIACJYyIcyfIslMCHgoD4k8x6xr+WYxefSjyQ1Jj1obzqXmct
         JWevk15evMPnCTmIUNgHzKyODXdXj+nt3tsVoInmK3cvmpnBeqiVr5mA26BDVAygC9Ma
         YqNVnKbyOWccd4Re0DMmd5LW/M6S8IQZNA48TE1Js1F9w1soKF2XYbY+yTQCYXrYRiFd
         lu7kV7dvDdcbSt4XAywSiG36NdHjNkJ90O8rs/hDjS87BTEE6tiVfRlyySx4q19NKDIR
         0ZZw==
X-Forwarded-Encrypted: i=1; AJvYcCWi9GyWaObbj877c3dG+DRj+TXui3HHSedT7xg+8mCv6eBSaqDgOrJ56M5jwHSCcY9dia+6w12HxyhnKTgQCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyme+CVuizQFDeP6hz3GEcnPYfLnicBJ39ld47evByc3tLFjnng
	6csVvXLitZ8BRIdjrTb9CELfHzM5Q1ZU+jEHtK+9Y3E9UnPiG1EQPr7Ud6ExIU3UaVZjzp9Z6qB
	h4tTzyxZarfFctctIdpZ9PJempuO/MsA=
X-Gm-Gg: ASbGncvalVZ2tIsGFjmaAYdBJTqNqu3Wkfhqv5gioCEOAKdDRlfcUHtItmrXu5XfPwz
	/RxDF9nD/kIFAzM7ZE15G08gMDxguvPrPjefweGCZOMEjO0JdqfLUOgnUVKvyRpqbRSAd5wPTsd
	980uIYYxuxJyq1cXRGiXMDFTma2M4RydMD9ObmLnHNEspLLsEV2dH0tA7jnWXxXH1QUF0kwji+f
	91m2cuePlBsN/9HHyv9xqQNFZLbxolnFGcd/VxYPJSWGxROpdKAZ5SkWCug0ZOchpY1qWnd/7tS
	8AbZU6W3WSwMWwKnjH6fl8nY81GBJC1jh0daINFNLoCfZJNNHmyky0mxtJLJSxEg5g+pSrGPGEB
	ZifokBU5w70DBqA==
X-Google-Smtp-Source: AGHT+IF7uCgR8D7JuSAXIkPZpUGPSLX7RZ4rQ8XZiWkfQ1rTA8eM7wEtMX1LZxU2dGsl6gS27smUFSiUHNUF0PYkbLY=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr5716030eec.3.1763947281135; Sun, 23 Nov 2025
 17:21:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:21:08 +0100
X-Gm-Features: AWmQ_bnEyQjjwkSgNtuZsnn9EWb0bwxCuBV5MLpaTWl4ay19-nMkjpn6O6IgwyE
Message-ID: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.

This should mention what we are doing, i.e. re-enabling the GCC + Rust
support again.

Also, I would recommend avoiding to say "fix" in the title, unless it
is actually a fix, but perhaps the RISC-V maintainers consider it a
fix.

> Add `rust-bindgen-option` conditions for the availability of libclang to
> the RISC-V extension Kconfig symbols that depend on the `cc-option`
> function.

This is now in a different commit, right?

> Update the documentation, GCC + Rust builds for RISC-V are now
> supported.

"are now maintained" may be better to avoid confusing it with the
"Level of Support" in the table.

> Documentation/rust/arch-support.rst |  2 +-
> rust/Makefile                       |  3 ++-
> scripts/Makefile.rust               |  1 +

In any case, for the Rust bits, this seems OK (I didn't test it, though), s=
o:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(By the way, I wouldn't mind if we started adding `MAINTAINERS`
entries on who is maintaining particular architectures for Rust,
especially if there is someone in particular involved with it etc.).

Thanks!

Cheers,
Miguel
