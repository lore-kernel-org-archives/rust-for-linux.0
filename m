Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6D39BFFC;
	Mon,  4 May 2026 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777936995; cv=none; b=XfS2gW33e6dyYw5R9SkZcOYOvNPbBylhCZGtRvoBqvY7+YxArYbaPTLB4wlmHJPIhNaVrCHFiFHFSUNVdYG8j9mGoCNI7/iI9dekYcokOwiUzwrxEfpUHzETyVWibbiA66HwZMa4HY1oYhBy5WSdFh/rDXokskWvXlzAKMfk/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777936995; c=relaxed/simple;
	bh=LeSSCvVLtm9PQ5VPGvn7vNSMQYNMmngYcC8DgCh+VdI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAMZRPoRgvE4kaVdKuh98oG8jxTNSHoYG52yxmnYV8m9LKHEG+jPvTDLWLNCclMt8+1zUPw8v4CRaKyS9KEVtROyJi35JE9+Jk6mz+xeEhbnJNCbLgl9Mt6N7V3TofEmHWGkkVM1lnoIPMLeYj2QFm2O2nfD//wiN2lqTflb+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/y8Xvzj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/y8Xvzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8207C2BCB8;
	Mon,  4 May 2026 23:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777936994;
	bh=LeSSCvVLtm9PQ5VPGvn7vNSMQYNMmngYcC8DgCh+VdI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n/y8Xvzjbm08Qa8r+5C7+cxILLQPTb/Whw2zbShswvMyPDr7cGcoYiR6eK6hz1gLq
	 iJPnr/h4cElkaro2EuY2NCjhZrW3LSTSki3I8KGM2jmnogATE9ssFxz96k/pYl75Hh
	 +dpbxqqaIb1w5BrzzUKVijig+G5o7GnwAvFVBllEj/T7evR1weQ/iGokfPnoC6GK4p
	 4LbbVvjaQusy2x+sKba/4OhWCMeuLJjukR8GBGJQ+cIh6cZJJnSBij3j0r4jO8W+c7
	 6HTnq+zIy47XX7WGl1ZM9GWDAdHVwqp9rTbhwa75knkMq50nq9KShYElwfBK+/0cRL
	 fPy9U942BRDxw==
Date: Tue, 5 May 2026 01:23:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
Message-ID: <20260505012307.6c5ff54b@foz.lan>
In-Reply-To: <DIA93EI029QR.A0R5KOVDZQGC@garyguo.net>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
	<CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
	<20260504222637.176edc7c@foz.lan>
	<DIA93EI029QR.A0R5KOVDZQGC@garyguo.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 04 May 2026 23:37:38 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Mon May 4, 2026 at 9:26 PM BST, Mauro Carvalho Chehab wrote:
> > On Mon, 4 May 2026 18:08:06 +0200
> > Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> > =20
> >> On Mon, May 4, 2026 at 5:51=E2=80=AFPM Mauro Carvalho Chehab
> >> <mchehab+huawei@kernel.org> wrote: =20
> >> >
> >> > Currently, there is a "P" entry for Rust pin-point that is =20
>=20
> I suppose the commit message is supposed to refer to pin-init instead of
> pin-point?

Gah, sorry for the typo!

I'll fix on a next version.

> >> > neither a valid ReST file nor an hyperlink. While the real   =20
> >>=20
> >> I guess you mean pin-init above, i.e. this entry:
> >>=20
> >>     P: rust/pin-init/CONTRIBUTING.md
> >>=20
> >> It would be nice to clarify it in the commit message that it refers to
> >> a file (which is allowed for `P:` entries according to the docs). =20
> >
> > It is not written there, but by file, it would actually be expected
> > a file within Documentation in ReST format ;-)
> > =20
> >> And, yeah, ideally we could make it a hyperlink to the raw file. =20
> >
> > I'm afraid that this is not possible. Sphinx doesn't allow
> > hyperlinks to point to files outside the documentation root
> > (which is Documentation/ when SPHINXDIRS is not used). =20
>=20
> I suppose we can just change it to a link to the render doc on GitHub.

This works too: there are other P: entries like that pointing to an
external URL that was rendered somehow.

That's said, GitHub (and, AFAIKT GitLab) supports both Markdown and
ReStructured Text. So, if one wants to keep the file on both places,
rst is a common denominator.

> We already mentioned in that contributing file that pin-init changes idea=
lly go
> via GitHub (and then patches are synced to kernel) as this is a library a=
nd we
> have extensive test suite on compiler error message / test on macro expan=
sion which
> cannot be integrated with kernel tooling. So changing the P entry from a =
in-tree
> file to URL shouldn't really be an issue.

Works for me.

> Best,
> Gary
>=20
> >
> > IMO the best would be to run:
> >
> > 	pandoc -i rust/pin-init/CONTRIBUTING.md -t rst -o Documentation/rust/p=
in-init-profile.rst
> > 	sed s,rust/pin-init/CONTRIBUTING.md,Documentation/rust/pin-init-profil=
e.rst, -i MAINTAINERS
> >
> > This way, it will generate a proper hyperlink.
> >
> > Thanks,
> > Mauro =20
>=20



Thanks,
Mauro
