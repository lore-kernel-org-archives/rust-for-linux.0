Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BC3597B;
	Tue,  5 May 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777939718; cv=none; b=QVybActfQX/jWlKFfLMBicWLCufn+P0WxPH8YPl6gr7DbB0pYoyn/2hYUCIj9ylzRz+Ei0HyfTrdnvLYHbcEU+yeX83FgM7uZV87eVBSRu10zH7OJdRuUl/swlCbaS0P05JL4MKSjkG0+rlQfijKohK8ic6u6HsNjwnwLJoe2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777939718; c=relaxed/simple;
	bh=zNmLNLDVa4Cr5jGdcLoCSI9ZJ3JDvA3EhC0ZTOepS1s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z52+LKNqZJUuQONnmnE8UT8RkrbpGhaqccMAHG4EW2D7XdHc+oheylDbOY2uZ/DadwBBElWQlGb3efr8j+edo0JzPF4B9nNp0lKiK8kxpv+nxJYM1tsG7C6vOQNgZZUMTTzacfbM6GOHsFCLgOkqJQuQmJbE06GTqtv9sLWHJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y34Qma6a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y34Qma6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F698C2BCB8;
	Tue,  5 May 2026 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777939717;
	bh=zNmLNLDVa4Cr5jGdcLoCSI9ZJ3JDvA3EhC0ZTOepS1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y34Qma6aL0pusOgfVqrRMVGwYb115RFqm66d0Fbe+QCkO+NO4gPq0yJAW0JmLdGbk
	 1FHsggXWnmz5xd6chKrVRYBuu87/mndWXePYGBloxGv5TBSA/1Arm+KF64m1c3sP4g
	 x6RKYzNMvKzsIvxrtj+QPu7iJCEf8DQvvnJkUe3GwA6618AT+41wszEyNY3rM3KxZ4
	 fvEXltIuNSX4RvrrXvKPALhG9a8TRSUj8A7wruxdNrqe/89GRYlYbhcm3IyV9sEkmM
	 OkwIybC0QOv2FERcYex9XzsVpuhh3blFIRauTEedn9v9TpmFTCBMJWtD7uNkCZsapr
	 4MRdPi+akLQVQ==
Date: Tue, 5 May 2026 02:08:31 +0200
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
Message-ID: <20260505020831.698650ec@foz.lan>
In-Reply-To: <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
	<CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
	<20260504222637.176edc7c@foz.lan>
	<CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 5 May 2026 01:34:55 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Mon, May 4, 2026 at 10:26=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > It is not written there, but by file, it would actually be expected
> > a file within Documentation in ReST format ;-) =20
>=20
> I don't know! :)
>=20
> You are right that we encourage rst in Doc/, but for vendored stuff,
> it makes sense to allow other paths (and other formats).
>=20
> > I'm afraid that this is not possible. Sphinx doesn't allow
> > hyperlinks to point to files outside the documentation root
> > (which is Documentation/ when SPHINXDIRS is not used). =20
>=20
> Hmm... That could actually be useful for other things (e.g. links to
> particular source files).

I know but this is part of Sphinx logic to protect against dir
traversal. We added an include extension to allow including
source files, but it will still require a file inside Documentation.

As a general rule, all files generated at Sphinx output directory
needs a source file inside Documentation/ directory.

>=20
> > IMO the best would be to run:
> >
> >         pandoc -i rust/pin-init/CONTRIBUTING.md -t rst -o Documentation=
/rust/pin-init-profile.rst
> >         sed s,rust/pin-init/CONTRIBUTING.md,Documentation/rust/pin-init=
-profile.rst, -i MAINTAINERS
> >
> > This way, it will generate a proper hyperlink. =20
>=20
> You mean on the fly, or committing it?

I meant committing it.

> If you mean committing, then I think it would be best to avoid
> modifying vendored files.

Not sure what you meant by "vendored files". Maintainer's profile
is not something where vendors are the only ones ruling it. Instead,
it has to be aligned with the Kernel development process and Kernel
maintainers, independently if they're working on a particular
vendor or not.

Also, with time, maintainers may change their employers while still=20
keeping their maintainership status.

So, I'd say that whatever is there at the "P" entry, or where it is
located (either on a ReST file at the Kernel or on some external URL),
it should reflect the model that a maintainer or subsystem community=20
that actively participate at the Kernel development agrees with.
This should be vendor-agnostic.

> If you mean on the fly, then that could actually be quite interesting,
> and we recently discussed e.g. whether to have a particular file in
> .md vs .rst and whether we could handle the conversion out-of-tree
> just for that reason. So if it could be done in-tree, even better.=20

Generating on the fly is a bad idea, as when one uses:

	make O=3DSOME_DIR

It is expected that the original source directory will remain
untouched.=20

> But pandoc is a heavy dependency to request, no?

I suggested pandoc as a one-time conversion if one wants to migrate
from MD to rst, as for simple documents like this one, it works
fine.=20

In summary, I can see 3 possible alternatives to have the Kernel
generated documentation to have a link to the profile:

1. convert it from MD to RST and keep only at the Kernel, inside
   Documentation/;
2. convert it from MD to RST and keep both at the Kernel and at
   Gitlab/Github (both supports .rst files natively);
3. change the "P" entry to point to an external URL.

Regards,
Mauro
