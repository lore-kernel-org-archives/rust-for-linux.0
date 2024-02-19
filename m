Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC8224F0
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708333764; cv=none; b=D/QW1VlJefDaqvH9jXmmLo/tM51d3sXvjT6dg04XGrmwYpXkmIQXTeoDqkIRhwRfp4bBkwuofBgX6av0cc1Jy7G5Wcy+3aSomFGtSfnRyMI6u5aSSHrSZ2fOtbm2wEYvIYdt/e6zzSNFX44qHONRCDRoVhySAE0PSBAQk6HxX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708333764; c=relaxed/simple;
	bh=DJul3TWyiyFiIYG37u7BiMg+il0uv1aR4uQbAGcWQQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdnJxyZfE6r91vAiaA7mVTgnEXZmG0jnox3Xl7eWDqCk1oD2tM5NBWtHTrFxNsVn6r3hWBKKCZDJkAOCZ+DMqXVHXFxVYtqPVGEA5PRrWg36YwtLmDa8RdmdrTJPn6PjU5LgSW2ekEy03XAbqs2vu0o/ciSPIaUugJrVtIBzRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BybPD/h+; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BybPD/h+"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d5c257452dso1458238241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 01:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708333760; x=1708938560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pITza/p79puTXkzLF57AKL2ujyb3FxitC2KLqmYBBWs=;
        b=BybPD/h+28wYwaWtfH7FE2hIOxseZz8JgPQu3Q8rec9SmD5gsV3m3AxX5YJ7m4+zwO
         eBg1V0yziJ1jgbijM/6D6NbPVZEcPByjeYp+qyrpKunRK9aia8qv+INEvZsbP6gO/mNu
         /MCg8Ku4uBefcLcvOARySenfMQwkI5A8PbjyJOZgi0Q5ah4+P/RtCEG+79anzTK8y8z/
         T6zqYB1Q/rLvkJ3fQMIYXrbjYSSM/g4ikYGnaz/jTKR6BbZjlgKHawQQhJxiG8XxnTe6
         2NEQb8k1RC5dfvd0w48L7/i15xPCjJhFOK1SlqRRABgFkM7hAELH6uDFlMEcRLifVuwl
         Mn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333760; x=1708938560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pITza/p79puTXkzLF57AKL2ujyb3FxitC2KLqmYBBWs=;
        b=InIdT2IJPTzU2Cbc/+3nNUpDIvDpsMgWIy/lRypGYFDU0Uvbiqb27L95yeAEdx/kdB
         wMmEkDgod7h9mz16/vA0SxwY74FTa+InoqSbLOicaacg8sFh3wUCapK+pb4HFJ07emgc
         i1xfCd8g+0yAIaNYntd/ovCwVL2IteuyJDEtCY+fQPICjQ8TdV9OtuwKT4Jel/sLWq16
         SCluCLOPWSiNNRJBZdNSQL1/R/f8pJqnMPLy49fyBvr/O5jeRD/AtKxRWB/rSjIH2Hpy
         KF0V+QrWAVybe/fjW6xvsZbv8pKHQtCxdZUjmw01DArZUqqDFTkPGfe2PFaK/ZMCQil9
         8PhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEBYJLP1B3rbr7+Yq2IfKawEX6L1CnnYe+v9TcbqKxHBJ7AQdiEUt2R+zHytim+BiAlwUTgl7rKgMpqDLdePaZnMeRSZBREbixhmCpLJ0=
X-Gm-Message-State: AOJu0YwtEFo6qXnvwULiKRs8ar+ss6yjPMjAEvaW22PrJCY4kiXZ4vRV
	RoLsfYfLoI6jtiXnQr3wiJ903C8gC9ZUp+B/hh71ZOqBzpN8/1mlXjieBN7xTEPXUcTk6peCq3e
	HZi9w8heoE0s8F2gWR7zVvbxAD7Qxf0xti0p/
X-Google-Smtp-Source: AGHT+IHzGqRc5VnbP00Jo3Xc0zRJ6YpmB8/ccl+F//H9hD5P0VDV2TgQ4Y+PEIWCp01pNe7fCDf3Nd+l617M5tt21mY=
X-Received: by 2002:a05:6102:6c6:b0:46e:c3db:aab6 with SMTP id
 m6-20020a05610206c600b0046ec3dbaab6mr8365013vsg.24.1708333760384; Mon, 19 Feb
 2024 01:09:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002638.57373-1-ojeda@kernel.org> <20240217002638.57373-2-ojeda@kernel.org>
In-Reply-To: <20240217002638.57373-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Feb 2024 10:09:09 +0100
Message-ID: <CAH5fLghAC7yJLzH1K4Jv10QggnG5eHacGTJ8mxgO5neH7YR+EA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: upgrade to Rust 1.76.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:27=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This is the next upgrade to the Rust toolchain, from 1.75.0 to 1.76.0
> (i.e. the latest) [1].
>
> See the upgrade policy [2] and the comments on the first upgrade in
> commit 3ed03f4da06e ("rust: upgrade to Rust 1.68.2").
>
> # Unstable features
>
> No unstable features that we use were stabilized in Rust 1.76.0.
>
> The only unstable features allowed to be used outside the `kernel` crate
> are still `new_uninit,offset_of`, though other code to be upstreamed
> may increase the list.
>
> Please see [3] for details.
>
> # Required changes
>
> `rustc` (and others) now warns when it cannot connect to the Make
> jobserver, thus mark those invocations as recursive as needed. Please
> see the previous commit for details.
>
> # Other changes
>
> Rust 1.76.0 does not emit the `.debug_pub{names,types}` sections anymore
> for DWARFv4 [4][5]. For instance, in the uncompressed debug info case,
> this debug information took:
>
>     samples/rust/rust_minimal.o   ~64 KiB (~18% of total object size)
>     rust/kernel.o                 ~92 KiB (~15%)
>     rust/core.o                  ~114 KiB ( ~5%)
>
> In the compressed debug info (zlib) case:
>
>     samples/rust/rust_minimal.o   ~11 KiB (~6%)
>     rust/kernel.o                 ~17 KiB (~5%)
>     rust/core.o                   ~21 KiB (~1.5%)
>
> In addition, the `rustc_codegen_gcc` backend now does not emit the
> `.eh_frame` section when compiling under `-Cpanic=3Dabort` [6], thus
> removing the need for the patch in the CI to compile the kernel [7].
> Moreover, it also now emits the `.comment` section too [6].
>
> # `alloc` upgrade and reviewing

[...]

> Link: https://github.com/rust-lang/rust/blob/stable/RELEASES.md#version-1=
760-2024-02-08 [1]
> Link: https://rust-for-linux.com/rust-version-policy [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/2 [3]
> Link: https://github.com/rust-lang/compiler-team/issues/688 [4]
> Link: https://github.com/rust-lang/rust/pull/117962 [5]
> Link: https://github.com/rust-lang/rust/pull/118068 [6]
> Link: https://github.com/Rust-for-Linux/ci-rustc_codegen_gcc [7]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
