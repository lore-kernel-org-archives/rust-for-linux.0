Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEE1EA7D9
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742852706; cv=none; b=NOoqyV/Sbe88Tm5Mx7IHw4XbkPsuAqITn71BdY+jhyoCpxlx9jU5fM/7fMZbgFssmlAsqESu7UFAqAzhz2Hig1F2DnfoDWTYDSlBDBGJ/JqjzHqzZikQkiRq42QZmaVFCyrpA/hM6HhkkRCgkAciNwHsWHjh5B1OtUKHyf4hgH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742852706; c=relaxed/simple;
	bh=7rHwgPNX7XCcic7qiH9INvn5EII8UP6WhEGq7bLMMnw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTa26RyEguTFqHxRjFOm1ZjO3FTLALVp+i06GSgYb2QA4hJ0R5FqVnqH9ns0P/t23ga9uRB/aYlMVU8xnQJdVPRg809j+DMMuhYCXK3jrB+DRqf7uT5wjrUM/QMmu79QZTn4Prf/1nHThtVLBgZ2vwieWwepc1CX+gzl9776K2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=L+GQGKpQ; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="L+GQGKpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1742852696; x=1743111896;
	bh=7rHwgPNX7XCcic7qiH9INvn5EII8UP6WhEGq7bLMMnw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=L+GQGKpQa8S6MVsWMs+lH5T/9jV6x42yUBpPJPICHcV4JsqhEmTARF5MQaZCJcqd0
	 Go637OvCCk/5FvhHuY1CLrqwUBVau+eWnhivwnFpjowsUAV+rbdjO2993zn1/D/Itd
	 zPl3+oFHGq5HHjLlzCtp1qDY69pjoJ0mPqhqVqgBy1h8cI6VJgj2ABuaXH1AibAJ/d
	 J+WY+RU8fncUvxPi0xve10Ge/GxBWZgnu6d/bMSSl8oUMSwH8VuSBBNFZYC0BxRjDn
	 219Hgeb8oHM7/di+LIGilzt9zZbZL3GHqcKoPNHkN+pQmmdSqMkwmKa1aj+AUgTUK/
	 oT5QbnPsqZYGw==
Date: Mon, 24 Mar 2025 21:44:50 +0000
To: miguel.ojeda.sandonis@gmail.com
From: Altan Ozlu <altan@ozlu.eu>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, altan@ozlu.eu, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH] rust: static_assert: add optional message
Message-ID: <32b45da5-3c32-4d6f-a29e-1b0df06f9726@ozlu.eu>
In-Reply-To: <CANiq72mTL=vStohG+H2Xzu5i6O=XVjj7k1tKi7wWf09PCShe0Q@mail.gmail.com>
References: <20250324184403.868691-2-altan@ozlu.eu> <CANiq72mTL=vStohG+H2Xzu5i6O=XVjj7k1tKi7wWf09PCShe0Q@mail.gmail.com>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: c1fb8d6bcbb78a6a5abb6b7b85435d84336d1f14
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 24th, 2025 at 20:06, Miguel Ojeda <miguel.ojeda.sandonis@g=
mail.com> wrote:

> I wondered if we should use `*` instead of `+` nevertheless, so that
> it eventually "automatically works", but I guess the advantages of
> using `+` are that we will not forget to update the docs eventually
> (since the restriction is mentioned), and also using `+` means people
> do not mistakenly use it in beta/nightly (since it seems it does not
> require to enable the feature explicitly, from a quick test in
> Compiler Explorer).

`const_format_args` might not stabilize in the future,
please see https://github.com/rust-lang/rust/issues/108595#issuecomment-145=
7030352
So it make sense to keep it as `?`

>=20
> > +/// It has optional argument for custom panic messages.
>=20
>=20
> "It supports an optional..."
>=20
> > +/// Panic message doesn't support formatting.
>=20
>=20
> "The panic..."
>=20
> > -/// static_assert!(f(40) =3D=3D 42);
> > +/// static_assert!(f(40) =3D=3D 42, "f(x) must add 2 to the given inpu=
t.");
>=20
>=20
> It could be nice to showcase both the case with and without the message.

I have applied changes for nits you mentioned in PATCH v2, thanks.
--=20
Kind regards,
Altan


