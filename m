Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA742252A
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504718; cv=none; b=D4K8Bg3DoD+DD3GYYqPZ6gUwy9l4kBN/LbBrmuPgbPNMnpEmYrJjg7IPR6+y/NserbU2ySDELwAR+al5mVBbfQwXa2f1vZD2RJM81YsYYCpoI8xQi4gUMF5F9j/orF9Qmk/VJ4u6gPYXt6qJJQzUSrl/5cQXWGOMKt/lOlsg03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504718; c=relaxed/simple;
	bh=nT63MBjGYKXTBb/NSuHd+oJTrFjNQs+xdTT7XV7D6U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsraWkzap7R1AeNSPbPM6MGiTls4rYoKqbUwRuuDBcQV8mBEgZv3hQi6CnXXAwJifdJUvwiO0Aw7TYgEfglUPm8S2uAo7c/PRajGwxdSOMd2qzfy1fWEz12d5aC7BazMV3V5Ocap7yl1P97upQu8/SbPvCWxN8iAONNUpXuPdOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoixS568; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoixS568"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471211F0155C
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788504715;
	bh=CrsDik+i/dqZ6n3D5e69L4gx5T8tSTpe8l3r/D5fJtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hoixS568WhHyYz0u5xdHJORIzc0XJOSda/Nt4wA1f51JJq2NoZr+T8MQ6cNjBSEq/
	 a29dssHaIINvDBPXBcBPL1dMwUR/elqI7MGHyJlwML1Lq1d98fJO6MghEPk9WKwvs3
	 V5rqria8mN8IJjc0xaeuuAzA1L+a+QF4kxa53zalhvoSAHk/uT0fBZf5+zGZuafSCy
	 7oc2PtkNOvYWlbXX1GEJFcNshj+TUqC1UqKQS0Sr7Lx6itxcLjpEH514ImSYUY2YeU
	 CL3q9DVw6fNKpRL4/ByelAbqiRguhcGveBu4g4fF5/2Db5zqhPUD6m0HSSDOBQNjnk
	 JRTbNmEAA+3FQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so903401a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 23:51:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFXKRLF1hVS51lVmwDY436IGfsRNkxZ/XVT+cqDkODIHpSlb84PDtUB/7HBL/6qge2zf8+059YyqP2IaB6cg==@vger.kernel.org
X-Gm-Message-State: AFuF++my+DIjYYbcr9MSacGGA+WRzmNFA10ng0uWA4jkM7ptxeEm6ud/
	Xj0T49T9j4tIpfXlc4AyaiVW/5MDthd+nBDJ/PfOEdbP+ZdFmmE9iz6y2lULFVCeKmqCNmB6oCL
	B+qbwZw5uQMPM6eFHC/fTOiLZvPHlrRQ=
X-Received: by 2002:a05:6402:3886:b0:6a7:ea53:f621 with SMTP id
 4fb4d7f45d1cf-6a7ea540b62mr646655a12.32.1788504713638; Thu, 03 Sep 2026
 23:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
 <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
In-Reply-To: <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 4 Sep 2026 14:51:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
X-Gm-Features: AcwNN1WVbV3UVJPY6vBHMoHJf_6Z9XFAkSpgPnoM44jiVUQuUMOn41ZyOzStCwQ
Message-ID: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 7:04=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 3, 2026 at 10:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > After commit 2625480a1bf7 ("hardening: Default randstruct off with rust
> > for better allmodconfig support"), which allows Rust to be enabled for
> > allmodconfig, ARCH=3Dloongarch allmodconfig starts failing with:
> >
> >   error: kernel-address sanitizer is not supported for this target
> >
> >   error: aborting due to 1 previous error
> >
> >   make[4]: *** [rust/Makefile:741: rust/core.o] Error 1
> >
> > For the same reason as commit 84a0f7caafc6 ("ARM: Do not select
> > HAVE_RUST when KASAN is enabled"), do not select HAVE_RUST when KASAN i=
s
> > enabled until the loongarch64-unknown-none-softfloat target in rustc
> > supports KASAN.
> >
> > Fixes: 90868ff9cade ("LoongArch: Enable initial Rust support")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Sounds good to me -- if LoongArch gives their Acked-by, then I can
> take it in the rust-fixes PR I will send soon; otherwise, this can go
> through their tree or Kbuild's I guess.
I queued for loongarch-fixes, thanks.

Huacai

>
> Thanks!
>
> Cheers,
> Miguel
>
