Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A42DE719;
	Tue, 18 Nov 2025 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497939; cv=none; b=OBv6fpGQSI71GSbC49PCPnK+47izP3L4E0DaWDzMdWttRhEImZqIx2mE9yrYp5iP/vdrn6deBwl8lRLpGcRESNRo7eXlIrDlKpSIVbeVjYKzmNsvra17962M4BHxiXQ9eJV+CVJdruCaWGfALvn3DkEdHuqvp9fXsCETUedAgtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497939; c=relaxed/simple;
	bh=ToOHEllmyBQ/WL8ZWLVrVveZilBnMuwncko9SGn4Aw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsbyYyvcIPbyav9TLqH9lC52ujfVpBiodSxRsIDGTVO7CFQX4JTIu4+zv729mgngTzp4tfGXyjc3N/Mah7wfCtE2Ewk8sNT1w0xcAuW7tIi9+e2JdQkexkcGZbG18V2DivnrmfamQD/y5D0XramMriJW4YyRSGcTgbu4PP3a6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YU5xvnam; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YU5xvnam"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF40C19424;
	Tue, 18 Nov 2025 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763497938;
	bh=ToOHEllmyBQ/WL8ZWLVrVveZilBnMuwncko9SGn4Aw0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YU5xvnamvLf67o+cM9H23VTi95T8DmfGcvseL0OWQej2iJqtF1Jg4GK+X1NFHpAVA
	 N2pzLZl035nP4agl20Fcm17xGpeZkYGjyDamtGA/v8T5P9zkm7A0qUnjOE71d9zwq0
	 64sG8ZVW+2eM+ZiAMgNUrWVbjYg2Mnu2zx+jG8ravcBH0qbUSOxVFgVfGlRgaIqyF6
	 t50U0yK92QBo0wcXmZOsb8ku9K22DmabgcETuDeLQseO9tLxK0HZ+IBqNrXfemAvAH
	 N7mOXQqSto1/RwfBh99R2l1alRr4id5E8dkb3xLqbh2P7eTJr+eyYslbOlOu4HGU57
	 yUunjzvZ+EBUg==
Date: Tue, 18 Nov 2025 21:32:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Alice
 Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Benno Lossin <lossin@kernel.org>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build
 wrapper
Message-ID: <20251118213210.0e8b173e@foz.lan>
In-Reply-To: <20251118201152.038e2749@foz.lan>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
	<kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
	<87seeb47pk.fsf@trenco.lwn.net>
	<20251118201152.038e2749@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 18 Nov 2025 20:11:52 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 18 Nov 2025 09:38:15 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
>=20
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >  =20
> > > On Mon, Nov 17, 2025 at 10:20:46AM +0100, Miguel Ojeda wrote:   =20
> > >> On Mon, Nov 17, 2025 at 10:13=E2=80=AFAM Mauro Carvalho Chehab
> > >> <mchehab+huawei@kernel.org> wrote:   =20
> > >> >
> > >> > The makefile logic to detect if rust is enabled is not working
> > >> > the way it was expected. Move it to be inside the wrapper
> > >> > script.   =20
> > >>=20
> > >> Hmm... Could the commit explain a bit why this didn't work and why n=
ow it does?   =20
> > >
> > > I don't know exactly why this was not working.   =20
> >=20
> > I would feel a lot better if we knew what the real problem is before
> > applying fixes for it.  Otherwise something seems certain to come and
> > bite us at some point. =20
>=20
> Me too, but the bug is very annoying ;-)
>=20
> I'll try to seek for some time to better understand it, maybe
> next week.

Btw, at least here (Fedora 43, upgraded from 42), rustdoc doesn't build
for docs-next.

Perhaps the issue could be due to some weird things with Fedora 43.

That's what happens after sphinx-build-wrapper finishes handling
htmldocs (after this patch), when it runs "make LLVM=3D1 rustdoc":

Building rust docs
  DESCEND objtool
  INSTALL libsubcmd_headers
  CALL    scripts/checksyscalls.sh
  RUSTC L rust/bindings.o
  RUSTC L rust/build_error.o
  RUSTC L rust/uapi.o
error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `build_erro=
r`
 --> rust/build_error.rs:3:1
  |
3 | //! Build-time error.
  | ^
  |
  =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled=
 with different values of this flag cannot be used together safely
  =3D note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanit=
izer=3Dkernel-address` in dependency `core`
  =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or unset `-Zsa=
nitizer` in `core`
  =3D help: if you are sure this will not cause problems, you may use `-Cun=
safe-allow-abi-mismatch=3Dsanitizer` to silence this error

error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `build_erro=
r`
 --> rust/build_error.rs:3:1
  |
3 | //! Build-time error.
  | ^
  |
  =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled=
 with different values of this flag cannot be used together safely
  =3D note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanit=
izer=3Dkernel-address` in dependency `compiler_builtins`
  =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or unset `-Zsa=
nitizer` in `compiler_builtins`
  =3D help: if you are sure this will not cause problems, you may use `-Cun=
safe-allow-abi-mismatch=3Dsanitizer` to silence this error

error: aborting due to 2 previous errors

make[4]: *** [rust/Makefile:527: rust/build_error.o] Error 1
make[4]: ** Esperando que outros processos terminem.
make[3]: *** [Makefile:1286: prepare] Error 2
Ignored errors when building rustdoc: Command '['make', 'rustdoc']' returne=
d non-zero exit status 2.. Is RUST enabled?

Relevant Rust configs:

$ grep RUST .config
CONFIG_RUSTC_VERSION=3D109100
CONFIG_RUST_IS_AVAILABLE=3Dy
CONFIG_RUSTC_LLVM_VERSION=3D210103
CONFIG_RUSTC_HAS_COERCE_POINTEE=3Dy
CONFIG_RUSTC_HAS_SPAN_FILE=3Dy
CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES=3Dy
CONFIG_RUSTC_HAS_FILE_WITH_NUL=3Dy
CONFIG_RUSTC_HAS_FILE_AS_C_STR=3Dy
CONFIG_RUST=3Dy
CONFIG_RUSTC_VERSION_TEXT=3D"rustc 1.91.0 (f8297e351 2025-10-28) (Fedora 1.=
91.0-1.fc43)"
# CONFIG_CPUFREQ_DT_RUST is not set
CONFIG_HAVE_RUST=3Dy
# CONFIG_RUST_FW_LOADER_ABSTRACTIONS is not set
# CONFIG_BLK_DEV_RUST_NULL is not set
# CONFIG_RUST_PHYLIB_ABSTRACTIONS is not set
CONFIG_RADIO_TRUST=3Dy
CONFIG_RADIO_TRUST_PORT=3D350
CONFIG_HID_THRUSTMASTER=3Dy
CONFIG_THRUSTMASTER_FF=3Dy
CONFIG_TRUSTED_KEYS=3Dy
CONFIG_HAVE_TRUSTED_KEYS=3Dy
CONFIG_TRUSTED_KEYS_TPM=3Dy
CONFIG_TRUSTED_KEYS_TEE=3Dy
CONFIG_TRUSTED_KEYS_CAAM=3Dy
CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy
# CONFIG_RUST_BITMAP_HARDENED is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
CONFIG_SYSTEM_TRUSTED_KEYS=3D""
CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
CONFIG_SECONDARY_TRUSTED_KEYRING_SIGNED_BY_BUILTIN=3Dy
# CONFIG_SAMPLES_RUST is not set
# CONFIG_FIND_BIT_BENCHMARK_RUST is not set
# CONFIG_RUST_DEBUG_ASSERTIONS is not set
CONFIG_RUST_OVERFLOW_CHECKS=3Dy
# CONFIG_RUST_BUILD_ASSERT_ALLOW is not set
CONFIG_RUST_KERNEL_DOCTESTS=3Dy



Thanks,
Mauro
