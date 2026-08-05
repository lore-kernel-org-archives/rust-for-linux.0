Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A21A682E;
	Wed,  5 Aug 2026 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947489; cv=none; b=S/Q9zK7LIO7Qwuh3q5AJ8KM0ArSxmsmMbOR/poys365dBGTF6KX0lrVKDkmmmWTsjUj0OKbNl5PNdXJRk6oUDYfgwLZVjKyLHFicTgdSPU6daBoeZpbHKlJkL65LrmPL/PKXmWjMcjQp+Swl1nq58gxIO22ERHBY0WNZogrO9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947489; c=relaxed/simple;
	bh=Vesky0oOdtDPCS+v2e04uNjqqE2rII1NdQQLWr8z9zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usa5MmU3dlB17q11dx9YF45A+q+YLH9+qyE/Iu49/eUGOPwPKAAEPwryaGxXxENxYGmFBsmTpNSTrpuRv/LRpWJwgraUqdmxPAU2xf0IirnKJtQwqMaKFJLPH3YeUpXcX6q0F+zlN/C/6Z0MBNWuHIi5BrOdftaIDpW2iGLVD+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHDKy3Qx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHDKy3Qx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6CA1F000E9;
	Wed,  5 Aug 2026 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947488;
	bh=KuRIHYHaygPZ0s9AerYW6Hbt3czgGyABLPBEUL2nTsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OHDKy3QxD1y3LOfOyYzHCbJzA3uiGseSweCYq/24S5qeFi+TzUOHGCUBXmaNeA/my
	 B42diFqpOv7uCl9qWUTyr5JjTUS/ROXtb311LwHiKO1f0Ap0nDJuNtqlLu3Pbuvtzf
	 6BpL2LeO66Icy5l1P+F9z2yTpZedF7JDjKZC3sUhoZGRmBLAPCAoVY0/q98D/j17mw
	 V8H3MJ8HGbiK+csRTfOxWVIy7gy48P14Rky0wFMJq/JQmNa4QqhyAqLe98/DXWbPgQ
	 RhIzDKcsCOJpIdv1xdeVfZNqOPqB4RguwYGwLHkZrOt/2SCopoyZoWI/gm4zHNaqlS
	 EorXKd/PPGEvg==
Date: Wed, 5 Aug 2026 17:31:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Bert Karwatzki <spasswolf@web.de>, Harry Yoo <harry@kernel.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: rust compile failure in next-20260730
Message-ID: <49305296-b2e5-4e59-befd-50fe85bf59ff@sirena.org.uk>
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162>
 <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
 <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
 <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org>
 <DKG2TQ94TGLB.3EO7ZNVKB50KY@garyguo.net>
 <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
 <CANiq72=Y1eVO5F0j4NXbnUzVvEnDGg0evAkeiE9hd-7hkeVr7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fi/cLxyyNmzKXZ1g"
Content-Disposition: inline
In-Reply-To: <CANiq72=Y1eVO5F0j4NXbnUzVvEnDGg0evAkeiE9hd-7hkeVr7A@mail.gmail.com>
X-Cookie: Stop ahead.


--fi/cLxyyNmzKXZ1g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 06:24:03PM +0200, Miguel Ojeda wrote:

> I don't see it in next-20260805 -- Mark, could we please get the last
> diff hunk from:

>   https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org/

> applied tomorrow in the char-misc-next merge? i.e.

>     -    rcu: Opaque<bindings::callback_head>,
>     +    rcu: Opaque<bindings::kvfree_rcu_head>,

> in `rust/kernel/sync/poll.rs`.

Could someone please send me the exact merge fixup you want applying as
a patch, together with a description of which merge you want it applying
to (or at least a description of the two trees affected so I can work it
out)?  That's going to be less error prone...

--fi/cLxyyNmzKXZ1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzZVoACgkQJNaLcl1U
h9DaoQf/XT+aIlyRi1+qIjYa607JbEn7AXb6+3VbbqRQjdfNsbToDSnA3kal9fkB
UXhpBoTIWLIW7gfXJ3afsqA1aMQuQJkYyt+mv9a9WyLF0BAqEPx/DEky2A70Q8ly
Ii6/Ee4hK9wzlr5WMT1O7frcYmA1PTVnrwPl5Hp9kovuTTcDWfIIrNJaIIj00t7D
gYpr+2bNa3c2IBcyNOJiyeD46JyISgkDAx8SHfEaUElUqmfVvO/F76zbOWPU3iR4
BV3EKvRcNSIsa3/QmGp2zKxr9x/7SB6KppO0z2eBYgUicaS8MjYwIr7dH9OZ0C2n
1H6ht/r8jmz4lkBK3Pie/ihPi4klrA==
=LQf3
-----END PGP SIGNATURE-----

--fi/cLxyyNmzKXZ1g--
