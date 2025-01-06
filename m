Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2414B959
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154177; cv=none; b=IUCGEtZTLBTsCP+rPxjV95WD2Gn1XA/MGHP2CSKQdG02b5rFl8E5qf8laM8UC5jWKGRCgQs6++99fY09niu4157i6Sz7iMU/926adqAXNjnkB6xCn1FwSe9Yz2GSx5eKgK7rMMXM7MhJtQkOFTBOMKPRFiC/OJG7ba/M+oBG26c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154177; c=relaxed/simple;
	bh=ln+xipIWtR756VpfjRBcdsXgI7ozwANiQoTrmUHi5dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1o6Dh3iZJ/vc3BcmO9xBvNu0ivMY2mwYrZoEncHDJ1vAdepwIWosdbf941YsapzJwWrZisZ7LOSeTSEAjtksE24v/2Lh8SEO50Yh3/Kt7Nj8Swac3zQRAfW+8/z99EYc0LbzAjtbg9UIavP0wU3I7xBv1NLnwtTDXI+noPQP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JUABx3/O; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JUABx3/O"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso13578463f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736154173; x=1736758973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNwuZVs/WFX1AlyLcnmThK24HPexmJnIk9uzVui8y2c=;
        b=JUABx3/OLj5bIbvfEAtjUKg4eHv/5dP7VDQfbNyqvXtXnV0CNj1Mwk2l9Dcpld5nZS
         PK3RAgvlx+FSGll0HnrqSL28pvmazYMTJRWNBtlFtcg1FLTA81gJgQVK7hOjkfzAK9Lx
         jREkXgSEAVfAEQmIMDOrPE24YenMAvV6UFkpeVZny0bYM23o1pU93ubo/vOYx6Q5xlml
         ktK34dTU4bIR7BrWkiXPW3XQ9SXCyg9TTZmUs9yR1w6ai1sp4RQ3Wl2nbLQEU6QCFsVe
         HnbAiLKQnTuX0Fsl44LIMeRwS5QBpqNgQ013m79Nt2M0D/nEjkrFeR/unCIozig2GZQs
         4bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154173; x=1736758973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNwuZVs/WFX1AlyLcnmThK24HPexmJnIk9uzVui8y2c=;
        b=dPKzxmrj9pyBF9Yu/9tgXlhPzuDRP9kPu81vivTQNMb91kbFcMA7t3xnHG+LT/rp5N
         NnN5cDRYtrOgx+pESERlw0IpPlsSL60LwPdnJDNyzDbfi2bshaJ0itFaIDRVr+0mVabW
         pINA9yScRWS3wJC43ZURSEN33WiqPD8u4JPzWeMqpRa/3wmw5XqpJt1RUyHZ4xPERWXI
         OTWSW9lmU87xUUo2gVKXeksrAUtoLSrQAygQlhZvdZ8xFqR8j3u47skFN2bmmW99JEmc
         ozjMbyUOAy8oEV2oadrgSEw6F9nVRhzzrzqeBOrQstezEob7kZCxj6OCJ7bV6Sj7u+GJ
         c9uw==
X-Forwarded-Encrypted: i=1; AJvYcCVugydL7JcVl4psTIRPFlbfTtmhM5/e0LOZrvWwK6h1Vbhu0AkOJSR4l1pPnOL9yMPdl/CxXwCeQUVrNqjiDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5eTm9AYzsKRgcPp9kP23VyCzipUz1kXpvMdZqtQMCZAV5rX6
	TheBXxfZ3x+tj3h5VLleXrHmHcO5HXCfVB0TLJNtTP14qg7R+SVpPXGJJ2WYvZcunTWXWHfb/+q
	U+Plw8/Ia8tUQ7UqqRU8h8ic7rosB309+sYJq
X-Gm-Gg: ASbGnctVJDNcCsol6jclI6jaW7le93dttfLnEUJdLzAtN2SgxNLktYiZrRTMwJqLBXU
	2SlNfx8VKh+ps7kR2N8iba0JkQOfr/7RVNiaB/gl4jMMLgj2KF24xx49M8tOs0RQEQ5Eq
X-Google-Smtp-Source: AGHT+IGY5t3j7JLgOnK7GQ+pcy6E1PtQP3lWc94uYa/uhct4TgLrGv6fdtYVOO02HRihn6+eHc7Z3uPLO6tQyR2RxAc=
X-Received: by 2002:a05:6000:4028:b0:385:ded5:86ee with SMTP id
 ffacd0b85a97d-38a224069b1mr48733909f8f.57.1736154173480; Mon, 06 Jan 2025
 01:02:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net> <20250105194054.545201-2-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-2-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 10:02:41 +0100
Message-ID: <CAH5fLgjjWW5Jrt+k76wJUhmLKTKUW5zThwUoxXuwBmk2-gyMxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Jens Axboe <axboe@kernel.dk>, Chen Ridong <chenridong@huawei.com>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This config detects if Rust and Clang have matching LLVM major version.
> All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> matching, otherwise it may generate errors, or worse, miscompile silently
> due to change of IR semantics.
>
> It's usually suggested to use the exact same LLVM version, but this can
> be difficult to guarantee. Rust's suggestion [1] is also major-version on=
ly,
> so I think this check is sufficient for the kernel.
>
> Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  init/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a20e6efd3f0f..cbe4b2922ce2 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
>         int
>         default $(rustc-llvm-version)
>
> +config RUSTC_LLVM_MAJOR_VERSION
> +       int
> +       default $(shell,expr $(rustc-llvm-version) / 10000)
> +
> +config RUSTC_CLANG_LLVM_COMPATIBLE
> +       bool
> +       default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION =3D $(shell,=
expr $(cc-version) / 10000)
> +       help
> +         This indicates whether Rust and Clang use LLVM of the same majo=
r
> +         version.
> +
> +         Operations involving handling LLVM IR or bitcode (e.g. cross-la=
nguage
> +         LTO) requires the same LLVM major version to work properly. For=
 best
> +         compatible it is recommended that the exact same LLVM is used.

typo: compatibility

Alice
