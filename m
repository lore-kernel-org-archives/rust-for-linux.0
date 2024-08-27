Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C221E520
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771260; cv=none; b=s4JG8Q6O6dBGFr1G4MkWZwM0+Dr11Q6HbxrN1BKikIlOUyeoj2/k4a0+6ihCP64OsAoPmbuTPSqs6tTavQdBCMgMzmcne0Dn5/PxIV/OQN1U6dZh7a83kaYEJ66pnbVtjk1UoaOCp/ahkH9pK9WnriYDniPpFTlgC8HFZZ/UNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771260; c=relaxed/simple;
	bh=Z8+ylLeUuCq5vqp57N1DCJvtDcDyFZMpK8uUsw/9fjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJvGj0ZsXoCd9ICQeznNBoDaNIm6SlnXgvpggeqP74y3rKbB2I2e8dIJEUQ5nA3kHpaVFLCrOLxwH3Nt7lUVRYwarODbIYs2J6mOGSAmLiBYOC/19wu6VBBw11vdPnx+FUQ70fgMz2d2Rc0VQC7pyqu0O+RFsCpjnVBZUUXlnoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+Ku5Qmg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+Ku5Qmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D4FC61046;
	Tue, 27 Aug 2024 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724771260;
	bh=Z8+ylLeUuCq5vqp57N1DCJvtDcDyFZMpK8uUsw/9fjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+Ku5Qmg98PGcoQTfhEdaUStIKM9tlEMYOh9uNG/TxAT72r1AWYwt2eNMZBPtorD+
	 d+3VA+xHpuSUh7galfaJET3dGQ/qtIH1ak0J9FutmN3Ia6ZJ/j60Rwpkrjz9DAMmxV
	 xp1TrxAtXbloEikmq4/HIQkBk3qaWpVd2z+WDHZh5xC3h4ca6PL/ObwqAJTOW8dyL4
	 K90DfFQpPg/YisiKGohM2w+ALJNMUVhPN2ehFLqFHvx4ELtMuBUte2HbL/OmV9c/Ee
	 JBmZqD4D5mSQH4+PtgO4VSxCs6A4JI9nm73DzNUhRYeCirCHlZg8FMn0uhO2Z0prj5
	 nv4Ay0ijOzw1Q==
Date: Tue, 27 Aug 2024 16:07:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sarthak Singh <sarthak.singh99@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
Message-ID: <20240827-hurling-taekwondo-0bffcf7dddb4@spud>
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
 <CANiq72=BV_kYbSw0YV019zTAmvB5VKHz8592pTTE=P8fBU-PDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OImxw79T0XPjGBfe"
Content-Disposition: inline
In-Reply-To: <CANiq72=BV_kYbSw0YV019zTAmvB5VKHz8592pTTE=P8fBU-PDg@mail.gmail.com>


--OImxw79T0XPjGBfe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 01:19:11AM +0200, Miguel Ojeda wrote:
> On Wed, Jul 24, 2024 at 7:27=E2=80=AFPM Sarthak Singh <sarthak.singh99@gm=
ail.com> wrote:
> >
> > Sets the `sysroot` field in rust-project.json which is now needed in
> > newer versions of rust-analyzer instead of the `sysroot_src` field.
>=20
> Applied to `rust-fixes` -- thanks everyone! I tested it in a vim +
> coc.nvim setup and that error goes away for me too.
>=20
>     [ Lukas, who leads the rust-analyzer team, says:
>=20
>         `sysroot_src` is required now if you want to have the sysroot
>         source libraries be loaded. I think we used to infer it as
>         `{sysroot}/lib/rustlib/src/rust/library` before when only the
>         `sysroot` field was given but that was since changed to make it
>         possible in having a sysroot without the standard library sources
>         (that is only have the binaries available). So if you want the
>         library sources to be loaded by rust-analyzer you will have to set
>         that field as well now.
>=20
>       - Miguel ]
>=20
>     [ Formatted comment, fixed typo and removed spurious empty line. - Mi=
guel ]

Why is it not possible to fall back to the inferred path when the
argument is not provided? It's rather annoying to require different
incantations for the script while hoping around between different
kernels.

Cheers,
Conor.

--OImxw79T0XPjGBfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs3rtwAKCRB4tDGHoIJi
0oyvAP4ljBRPzudtLRmJtDsg3YnLpnPO78Y0E1jCn+WGefKsBwD/XV+i9pTWw6r6
rhuum/MukbJINSkDJNKx2cizBqElIw0=
=sHfp
-----END PGP SIGNATURE-----

--OImxw79T0XPjGBfe--
