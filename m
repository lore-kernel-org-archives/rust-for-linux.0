Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707C35FF41
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532442; cv=none; b=bhHGIKia1GMvZ6v+ku94rb5WXaPHgPJ38ag+k3PEiUMxbY3/GOiw45z2waVqfVAXPU5Yj2JxiG3ZsReveT3YE/Axin4cXri9DmRq8WmT8aBZltXf+ggVwZ5x6buYkryXEt1r8LgGuOEbi8v/DdS0DC0lx59A+HMYM/KNDqHzSYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532442; c=relaxed/simple;
	bh=Dn+FGftJrugUUlu2nkUafFid8rSUEu4lJqfhzEDlOMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7TqA272ybbjPnKa8A/zE5z1e6edyAqTri9OxIU6cDRYqaMUxzlstpLhL6+JdKyEDOPvFyzaMPNOMUFT/2fHckDz2EM57mFZ+WLQDxzqxiBHKVW+BbCG3YocNHjcSkf4ZG16O4+ol7uw36FhZP5ZnyGnapuVNLFaIL/GQUSqKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgBqsGdQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgBqsGdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24C8C116D0
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769532441;
	bh=Dn+FGftJrugUUlu2nkUafFid8rSUEu4lJqfhzEDlOMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DgBqsGdQZ5tbV/o4A+/PWYyGArr+GdGzhmaVBq5hqej03fbT/21+uzvh5sm2DXzhY
	 kU5umI15rJM22lCwh1dZwUTqeUv5awgRUT0dwpOogR8kDUCZVfPjPVN6nmqke1guTT
	 dnwe3cbfs3whuD7VgY1N02yOGafWmOqzd1BNDJJV3nfeDeFHi7GEurnwdsGIk6ZtFz
	 1vmkc8M4XN1YAOImrM+iASz/hKY1HjFRf0yEeMRZ0ydRCseq5OZdxgW4yPN5hXvS3o
	 UBDRBU6kwtaUfWf6bAgLraiin66oJmIiVOydB/ZcS9IlMgUC+uUXUL9kWurZTvRdEs
	 FGccKRGPzybNQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso35049741fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 08:47:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFhhx/b0C1kJ4yrZRaU1/FEAunFrGbxpDLeFQYNnL2+t78w4paxnsZz2g/9Bs4n1580rGl5LHc/8OFrXSjLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+NmKXXh4HsZDM3sGJFuiwKaWvGxXFjFlPmYhJSe4mdHHx0zM
	AkhnexnfIkTSFYlddb7Z3QwLqIooRUd2ucQpQ3bMh+20vte+ZoUsQ5ptRNHIpVAHo27QiOoIUj8
	y1MZhVmFWfJewl3qs/Qet08Uw46KfiMw=
X-Received: by 2002:a2e:a581:0:b0:385:9b50:91a2 with SMTP id
 38308e7fff4ca-3861c832ac5mr10143091fa.10.1769532440619; Tue, 27 Jan 2026
 08:47:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-fd-leak-v2-1-1bb55b9b6822@kernel.org> <DFZIS0QDDD56.1ZB0WZUXPR5IZ@garyguo.net>
In-Reply-To: <DFZIS0QDDD56.1ZB0WZUXPR5IZ@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 11:46:44 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=hKVVa9UXFXx-aiqba7U0UHQChf-5pf1d=TdYrtC11Yw@mail.gmail.com>
X-Gm-Features: AZwV_QgeoGbfCOU3jUEvobmD0YCHd7Aj6bunTM3WiQXjl37fWCLVd3-CqRgroW4
Message-ID: <CAJ-ks9=hKVVa9UXFXx-aiqba7U0UHQChf-5pf1d=TdYrtC11Yw@mail.gmail.com>
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

On Tue, Jan 27, 2026 at 11:41=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Jan 27, 2026 at 4:35 PM GMT, Tamir Duberstein wrote:
> > Use `pathlib.Path.read_text()` to avoid leaking file descriptors.
> >
> > Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Fiona Behrens <me@kloenk.dev>
> > Reviewed-by: Trevor Gross <tmgross@umich.edu>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> > Changes in v2:
> > - Use pathlib.Path.read_text. (Levi Zim)
> > - Drop errant Tested-by tag. (Miguel Ojeda)
> > - Link to v1: https://patch.msgid.link/20260122-rust-analyzer-fd-leak-v=
1-1-945577813b20@kernel.org
> > ---
> >  scripts/generate_rust_analyzer.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 3b645da90092..152bd3705303 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -190,9 +190,10 @@ def generate_crates(srctree, objtree, sysroot_src,=
 external_src, cfgs, core_edit
> >
> >      def is_root_crate(build_file, target):
> >          try:
> > -            return f"{target}.o" in open(build_file).read()
> > +            contents =3D build_file.read_text()
>
> Couldn't this just be
>
>     return f"{target.o}" in build_file.read_text()
>
> ?

Yes, of course. I chose this form to be just a bit more explicit about
exception handling.
