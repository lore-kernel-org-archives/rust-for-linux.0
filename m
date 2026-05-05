Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29B513B58C;
	Tue,  5 May 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777959940; cv=none; b=lPGmWNa5xIjZCZY7rGL+4gU/YvvfQ3DNbonAz8fFmDg+LZSF7xp0rAYRCfu4X75CqqnUVQH9+dEJdncJ7NCGDkEFCdnwgQLv2euTFL9qNieTdPhtudcKAugYhoBTWihpF5PohzcnMKjKD3UrJtn78M7pQMrhdVtxbDwwKsJikUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777959940; c=relaxed/simple;
	bh=OENmeeQaHzhjS6HWnKib03SzAKJuZk1wLrest0Rn0Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxfiQoxPmqTQlaYsdSx3NXIigJ1VoRVounul/ehTr5JNHbM3pbnOcNhKGDJiK7X0FbAVOPMcgGVpocfxI7CV6hEFnx5t0OtKumyPTfyzlpkZMvEbcXRhnvOdn8Rh4SxwWWy/Q3x5P1U/xqLIAobL6q66ZdhUbyxUeE2NwM5RxiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHdQj19z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHdQj19z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAC8C2BCB4;
	Tue,  5 May 2026 05:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777959940;
	bh=OENmeeQaHzhjS6HWnKib03SzAKJuZk1wLrest0Rn0Ys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KHdQj19zcI2Bl9bULjdpwcRyhFQXnC2gy06ZZ7rvhfNJQmQSluSgRPU9/xPzcn3gw
	 rBetE6LYSJSF3e+iSOEm3ObLm6tXcKrTfeamRdqHov5X7y3BVQA6wZOd8BxTdTod8U
	 FALP9dSYBwkkDbSa7EMLAdFvhGr7qHYYRPd8SEzhiWy8jDKW+XScG5DYuY9ledeX1P
	 NxiAqc47gPMYivUpUnU15WPIYgvrhscXg32oxZKu7d8a3jjr0rqYbsV2m9gcNNUWXo
	 Wyek03nx2U7/EUSVOi0ZQkGkn837G78CrVo3ezqmepqYEhDl9BwtcFiCIxKUeO7J1v
	 NlVZetHLE34Gw==
Date: Tue, 5 May 2026 07:45:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, Benno
 Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda
 <ojeda@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross
 <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
Message-ID: <20260505074534.5fefbed0@foz.lan>
In-Reply-To: <CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
	<CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
	<20260504222637.176edc7c@foz.lan>
	<CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
	<20260505020831.698650ec@foz.lan>
	<CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 5 May 2026 02:20:45 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, May 5, 2026 at 2:08=E2=80=AFAM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Also, with time, maintainers may change their employers while still
> > keeping their maintainership status.
> >
> > So, I'd say that whatever is there at the "P" entry, or where it is
> > located (either on a ReST file at the Kernel or on some external URL),
> > it should reflect the model that a maintainer or subsystem community
> > that actively participate at the Kernel development agrees with.
> > This should be vendor-agnostic. =20
>=20
> I am not sure what you mean. By "vendored" I don't mean
> companies/employers, I mean that the file comes from an upstream
> repository:
>=20
>   https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md
>=20
> Nevertheless, it is true that this really is a special case, in that
> the upstream project decided to provide something that could then be
> fit into the `P:` field.
>=20
> One could say "let's ask them to do rst upstream", but to be honest,
> it is simpler to just put a hyperlink to GitHub's rendered file.
> Markdown is anyway a better fit for their file.

Ok. Then it P entry could be:

	P: https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md

> > Generating on the fly is a bad idea, as when one uses:
> >
> >         make O=3DSOME_DIR
> >
> > It is expected that the original source directory will remain
> > untouched. =20
>=20
> I am not sure why that would be a problem -- the output would be in
> `objtree`, not in `srctree`, as usual.

No, this won't work. See sphinx-build help:

	$ sphinx-build --help
	usage: sphinx-build [OPTIONS] SOURCEDIR OUTPUTDIR [FILENAMES...]
	...

	positional arguments:
	  SOURCE_DIR            path to documentation source files
	  OUTPUT_DIR            path to output directory
	  filenames             (optional) a list of specific files to rebuild. Ig=
nored if --write-all is specified


The way Sphinx works is that it will consider a source file
only for stuff inside the SOURCE_DIR positional parameter passed to
sphinx-build. It handles SOURCE_DIR the same way chroot does:
assuming that you add at toctable inside Documentation/index.rst
(e.g on its root level) something like like this:

	/DIR/file.rst
	../DIR/file.rst
	../../../../../../../../../DIR/file.rst

They all will be interpreted as:
	{SOURCE_DIR}/DIR/file.rst

Making impossible to reference any file at the OUTPUT_DIR, except
if you place OUTPUT_DIR inside SOURCE_DIR.=20

On normal builds, where we have "output" dir inside "Documentation",
this works, but when O=3DDIR is used, the output directory is=20
typically elsewhere, which effectively breaks O=3DDIR support.

Besides it, Sphinx makes a 1:1 map between a source rst file
and a destination html file (for make htmldocs).

MAINTAINERS is actually a good example of such limitation: I would
love to produce per-subsystem output files from a single
maintainers.rst file, but Sphinx doesn't allow that.

>=20
> > I suggested pandoc as a one-time conversion if one wants to migrate
> > from MD to rst, as for simple documents like this one, it works
> > fine. =20
>=20
> They are the maintainers, so it is up to them, but it is simpler to
> use a hyperlink.
>
> (The file is trivial, i.e. the conversion can be done in a moment
> without `pandoc`).

Ok.

Thanks,
Mauro
