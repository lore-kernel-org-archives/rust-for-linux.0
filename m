Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D1423A7A
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468974; cv=none; b=EqsdvyJaUb7fQyCa2KuGMZWO4gKVAPIZIXrWGFIWyk2QU2VX1/132VGQ8TJyuWglY45exyyQe+dhWmna3WkhH8gN2GaMSRaLEy63eUPgtUUsbeMPpl3TfdyhwZjARIwKY7J5dYJ4iZFZE4RntjA/Ti/rA5hnud4YN7tKuC4WNbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468974; c=relaxed/simple;
	bh=xV4ZS145hGBCUUa1t/ytg2t0onAvfezASEADcCkUiJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6a6pt/4X7sjlFZoq/EP7CCfHJF2j+8R9J2vKInmLoaD1VVU+PvO3/mw92DzgBcaZjvrx6e3vNiR+q8X3kB+Zb5YulGl9z71Rh9fIei1CdkYn81hu7GIrtNTZkz8feI0CkyMV5r9g8GTyfY2+RAxuXQm2h71OYpRel6RWxNOIY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9U0WvZs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9U0WvZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F7AC4AF0C
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772468974;
	bh=xV4ZS145hGBCUUa1t/ytg2t0onAvfezASEADcCkUiJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g9U0WvZsVPLk4ADrsfSrJzEfsITRk+IuippNq8kM/rfkUBhNJtHEFRHZLqAs0PvsU
	 +cVNVWHBVRyBvL8QwTYQ+Rofh8yueSSagagdgLBk0H1d9j9c1/FaX95bmkgRE9edi0
	 7GBHLpCaJle5Ib1RcRgjYRKQn+p0/oPmkOz9niY9Xc7daapYVBsXO7/MMoLwChOQxN
	 tS4O87AiS4Mc1vJM91F09znknv3fGgIZ7NeHOQlsIoLRF49Rm/yJDi3S/wmoG74ZEh
	 ALuLeTA3Um5rhAywJJtQ0fyafcamri2Da56ZRTOvyxgm8EBcYrcRNbp9sJH54q3i8d
	 8uQCcCUFh0HAw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-389fa0d1040so63800001fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 08:29:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrOpEVs0lfwQc8re7fizzAc0fdR6PNcmXpSOA02OWxEjw1rWE+E4Nw+kCvVTbl8YKyFvJ4RNix9L5FF6ExkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnrpWQU+6ynVRLXa2d9Rs0ULqObZ91QdTX2ImNg1bDYMtJbYG
	30ZZWg/2KgNbt9naGhg9FXMQ6t7IfkwFX3e54xBNI4gVYcTuXQi3aBwXps6Z4vQ7A588+5JOhF4
	o+cIqX9rs9Pgrpn6rOsFvVQzu/yjv6j0=
X-Received: by 2002:a05:651c:98e:b0:386:7cfd:55de with SMTP id
 38308e7fff4ca-389ff11899dmr104670501fa.13.1772468972769; Mon, 02 Mar 2026
 08:29:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-fd-leak-v2-1-1bb55b9b6822@kernel.org>
 <DFZIS0QDDD56.1ZB0WZUXPR5IZ@garyguo.net> <CAJ-ks9=hKVVa9UXFXx-aiqba7U0UHQChf-5pf1d=TdYrtC11Yw@mail.gmail.com>
In-Reply-To: <CAJ-ks9=hKVVa9UXFXx-aiqba7U0UHQChf-5pf1d=TdYrtC11Yw@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 2 Mar 2026 11:28:55 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nvHUx+qHACnYjOM-BN6F8WgyZC3zMwGdywRfpQEb5kVA@mail.gmail.com>
X-Gm-Features: AaiRm53u8FUxamHR_boStthY1CgbumpReSSF-7qWvE6DWxMwfd_Xq6c4zIU3isI
Message-ID: <CAJ-ks9nvHUx+qHACnYjOM-BN6F8WgyZC3zMwGdywRfpQEb5kVA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer.py: avoid FD leak
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 11:46=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> On Tue, Jan 27, 2026 at 11:41=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
> >
> > On Tue Jan 27, 2026 at 4:35 PM GMT, Tamir Duberstein wrote:
> > > Use `pathlib.Path.read_text()` to avoid leaking file descriptors.
> > >
> > > Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > > Reviewed-by: Fiona Behrens <me@kloenk.dev>
> > > Reviewed-by: Trevor Gross <tmgross@umich.edu>
> > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Use pathlib.Path.read_text. (Levi Zim)
> > > - Drop errant Tested-by tag. (Miguel Ojeda)
> > > - Link to v1: https://patch.msgid.link/20260122-rust-analyzer-fd-leak=
-v1-1-945577813b20@kernel.org
> > > ---
> > >  scripts/generate_rust_analyzer.py | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rus=
t_analyzer.py
> > > index 3b645da90092..152bd3705303 100755
> > > --- a/scripts/generate_rust_analyzer.py
> > > +++ b/scripts/generate_rust_analyzer.py
> > > @@ -190,9 +190,10 @@ def generate_crates(srctree, objtree, sysroot_sr=
c, external_src, cfgs, core_edit
> > >
> > >      def is_root_crate(build_file, target):
> > >          try:
> > > -            return f"{target}.o" in open(build_file).read()
> > > +            contents =3D build_file.read_text()
> >
> > Couldn't this just be
> >
> >     return f"{target.o}" in build_file.read_text()
> >
> > ?
>
> Yes, of course. I chose this form to be just a bit more explicit about
> exception handling.

Applied to `rust-analyzer-next`. Thanks all.
