Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936352D59F7;
	Mon, 24 Nov 2025 07:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970587; cv=none; b=f8Y6hd9FIl+n6QaYuFktCcMg7vQM+QY8iyHAAh0XqcmHfH2CJkFqeZx/EwzepFuZTq4moK77P+KZk/Wph7WCkl/pXfdkDBvrmk+3+yKMoazPQ5XJK2VyfeyD+q1tBvfz4RV38Zb7vFSUifNOGgLKeNn/pfU4rdUh9SPlc/C2T4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970587; c=relaxed/simple;
	bh=r9orO3XxsbwvdX4vdbBlz9OyD/SpnTeN1VrU7ZnWwag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bHPXpkrZOtVscXuvfucFLdLKWtrYcERgKwJOjFKtQO9Zg/Y6N7gWvA3+CZYraa8QBevgxZNd+Y2PmZv38O2kvsoAIN2y5vW1E3ckxZJYOWbRzEBi25+JVtvF3Raa9aaY7SLzURvL7sk2ApZ/FZ4E1Go81adeMGWuZ9k2pvtaRXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=lCXxufjB; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="lCXxufjB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=s8+iYPcWI2cddaAf5HGDey5M4eeRKOeY9STUQfUYtpQ=;
	t=1763970585; x=1765180185; b=lCXxufjBd/iaYs5omnmlTZKGHf87arot41FjAnsGwoR6RxO
	Wm8kIvAWFpW8k3r+jyLSSwxYzJ1czJOBy3qt4vhIvffyzs9EohXJ/Q6nzhw4jdTy3DFgnGAypbQs6
	T5FuT/N3UJ2C9Q9dFjbbvqF0eRIwLRCIIJZirqFrICR3oqox/sOs+/Y85qm/SgBVsEMEkTAS+qxEw
	C6meGazKU5nAsrKtoFtxcXloiqsEYdhUI7jJkvgoliwEpaFq1u5gIdoqM21UEy1OJeR36AMUf5aJT
	LZdxMwv1ei6Uxqbybnbmwe/aFy/gqbrBQ2AXkpp1wZsh86GMjw+6LbSJx2GVI8xQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vNRKK-00000008JVI-1WqF;
	Mon, 24 Nov 2025 08:49:36 +0100
Message-ID: <bfb512e24f365695534313b375fc0c38d0a843b2.camel@sipsolutions.net>
Subject: Re: [PATCH] arch: um: Don't rename vmap to kernel_vmap
From: Johannes Berg <johannes@sipsolutions.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, David Gow
	 <davidgow@google.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov
	 <anton.ivanov@cambridgegreys.com>, Miguel Ojeda <ojeda@kernel.org>, Paolo
 'Blaisorblade' Giarrusso
	 <blaisorblade@yahoo.it>, Alice Ryhl <aliceryhl@google.com>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Mon, 24 Nov 2025 08:49:35 +0100
In-Reply-To: <CANiq72=MXHZ2XswxkfzLqUEPwriNy=_sxAQpOYoYW8iNgyuJ8Q@mail.gmail.com> (sfid-20251123_180818_160099_E5AEF588)
References: <20251122083213.3996586-1-davidgow@google.com>
	 <CANiq72=MXHZ2XswxkfzLqUEPwriNy=_sxAQpOYoYW8iNgyuJ8Q@mail.gmail.com>
	 (sfid-20251123_180818_160099_E5AEF588)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Sun, 2025-11-23 at 18:07 +0100, Miguel Ojeda wrote:
> On Sat, Nov 22, 2025 at 9:32=E2=80=AFAM David Gow <davidgow@google.com> w=
rote:
> >=20
> > In order to work around the existence of a vmap symbol in libpcap, the
> > UML makefile unconditionally redefines vmap to kernel_vmap. However,
> > this not only affects the actual vmap symbol, but also anything else
> > named vmap, including a number of struct members in DRM.
> >=20
> > This would not be too much of a problem, since all uses are also
> > updated, except we now have Rust DRM bindings, which expect the
> > corresponding Rust structs to have 'vmap' names. Since the redefinition
> > applies in bindgen, but not to Rust code, we end up with errors such as=
:
> >=20
> > error[E0560]: struct `drm_gem_object_funcs` has no fields named `vmap`
> >   --> rust/kernel/drm/gem/mod.rs:210:9
> >=20
> > Since, as far as I can tell, we no longer actually link to libpcap, it
> > should be safe to just remove this define unconditionally.
> >=20
> > (If it's not, we can possibly either disable DRM Rust bindings under
> > UML, or move the redefinition of vmap behind some config option.)
> >=20
> > We also take this opportunity to update the comment.
> >=20
> > Signed-off-by: David Gow <davidgow@google.com>
>=20
> Nice, thanks for this!
>=20
> Yeah, I guess we would otherwise need to do the same kind of "wild"
> macro replacement in Rust code to support this or conditional
> compilation, and neither sounds good.
>=20
> If it is not actually needed, then this sounds like a win-win.
>=20
> It seems it was indeed gone in commit:
>=20
>     12b8e7e69aa7 ("um: Remove obsolete pcap driver")

Indeed, that was just missed during the removal, we can't link to
libpcap any more.

How do we want to take this patch in, and where is it needed? I hadn't
planned to send a UML PR to -rc still, but I guess I _can_ if needed?
But if anyone else wants to line it up through a tree (rust related?)
that has pending work anyway, that seems fair too. In which case:

Acked-by: Johannes Berg <johannes@sipsolutions.net>

Or it's not that urgent because all this came up in -next now? I didn't
really see (or fully understand) all the build bug reports.

johannes
