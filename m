Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B1481640;
	Wed,  5 Aug 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947965; cv=none; b=FanjxUR357Ax1K9Ehd4zXExdsotXw1A9txC7B8N4kkHqpkwESLFKCHRBXxjC8qbOuyGGanX3znQhAkJSb4RGFzL8kl6ZB2DNySwFNkw0k0pnqlWZiM8aNDndVg24PiCe9jcbc4VH6VhiqFlkjZn5TCwZLcWFURaxrfpICv7GoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947965; c=relaxed/simple;
	bh=HWUobJM5/dA4/kCrR1GAnJS1EEWutqbhlfdXr0Te578=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxgwYeMVqd45VoH2f4NCn8TVPnuGOyGEfoVdWXUWaX+nvS/9MDpHKrmyqB7w9Bo7xmnZgGZbsteRjv3OHQ+VxZUT0CU7iO75isIEIjbt8ENMcLRu18Vb5YkrR2VuNqy2l7sRlAMoP9xardAfa0sbrh/KiDI6W+MfFXn9ieMp7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJ2m9vXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJ2m9vXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBB71F000E9;
	Wed,  5 Aug 2026 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947964;
	bh=HWUobJM5/dA4/kCrR1GAnJS1EEWutqbhlfdXr0Te578=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJ2m9vXBV+9vu3MZtTSUvxeJx24qgCTQHG+tPdf9RsYFUpw+k3as79xzQmxlo62aK
	 Dn8w4/PLdu5KhDusAzy6ClmVJH+9mAVfiNFzHCDKXhEU/OwGi9GFgN8h9tqcAbdo11
	 tRI+KXy43yoh69SYYZ3ds4yVi2TKE3kz/l95vrmdCFx19Tg9U/GawqtgYdm+Rv84qF
	 RpaKTgHNr5CsDUOqQJRb+vgPjTH28yU/RQo4ZnjRG1TPdQByHi5Zi5UcHzFdbNOqxB
	 tFBfspzQT4r1VQ+BdSN/A5mfvttB4gujwTEyJdQhWYtcRfSzwsf6jnLbpp3lY1vk7n
	 EPHdJQR0g/I/Q==
Date: Wed, 5 Aug 2026 17:39:16 +0100
From: Mark Brown <broonie@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Harry Yoo <harry@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hao Li <hao.li@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
	Bert Karwatzki <spasswolf@web.de>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH -next] rust: poll: fix compilation error due to
 kvfree_call_rcu changes
Message-ID: <f0a3dec2-05bb-4136-9a63-828e02b77101@sirena.org.uk>
References: <20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i8n/Wi0JLixMSCOV"
Content-Disposition: inline
In-Reply-To: <20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org>
X-Cookie: Stop ahead.


--i8n/Wi0JLixMSCOV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 06:28:45PM +0200, Vlastimil Babka (SUSE) wrote:
> kvfree_call_rcu() changed the type of its parameter to kvfree_rcu_head
> in commit acc6fdade62c ("mm/slab: introduce struct kvfree_rcu_head for
> kvfree_rcu batching") in the slab tree

That should be applied tomorrow.

--i8n/Wi0JLixMSCOV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzZzQACgkQJNaLcl1U
h9AOWQf/a1RJT7/LgDrDyXkQJXF+KzjuGk9iJkRbULq6Iky3xjASkQ6j396IkURH
6cp4UfoPhD9wmTzi69u76+qBa/ViwaNu+EArVO+Hystz7pY6X/BuoihvEXQmq19h
rR+BRsJgpt/hoFCC2Ki3Eb3zRucaDaB6j7q0PyTQXOjSlNOusXoQSMCSJTok2aKg
ScZy1L7tKqI/mEs6dHGlb5B+8QxexGciZHpgloQ6xM1/e6QtaurPsIOlg5y9kMEs
fWGq3sQyfyKn7a7bKIGyLhUpqtEfnFxU8GzKvqSG6kSF3eUtI4UgEx9xFrLi39s2
Y3RpK4xFI48knItISMitlMAEcYrMrw==
=AWC7
-----END PGP SIGNATURE-----

--i8n/Wi0JLixMSCOV--
