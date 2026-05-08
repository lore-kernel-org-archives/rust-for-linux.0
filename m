Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282A1F418F;
	Fri,  8 May 2026 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222542; cv=none; b=NC+YX3azHUa3lBYrlJrS7KCS8KYZ9OCcq0lbhnnI/6luMduAi0udANOWy1duVLitDtvEI/aaFuaw1fFBKD4B3onccexTzknyfguTYknbE7jaiKvB02VTakz/SxiW5d70Jl8emTf4I53/lH1G6n8NwgF/I157jWKfO/G/T0T2k5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222542; c=relaxed/simple;
	bh=VMuy0SwEMPFaSiHi5Q4xlS7HxDXEMI+zvYG7N0Q3uh4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QKB8UReJ/8X3g/Go97KS0j+UO7RgRiimI3TxHLfWLOA82hGQIhjklSR0kKRKnLTEWvAa5GI172mVy8oh4IfkHlGwQLk9gR9u2Qd60eJfbTEMja3Lj89TZuKLNS/8a25a5LUPTCuMzv4VJVBWuxJgHc0rM83sKCYPkyfHD+qLdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckg5Zenv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckg5Zenv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15795C2BCB0;
	Fri,  8 May 2026 06:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778222541;
	bh=VMuy0SwEMPFaSiHi5Q4xlS7HxDXEMI+zvYG7N0Q3uh4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ckg5Zenvdz0tihq4Do50wuh8NLJ64SOr9a8qO4ix6i++GgJJCXwx3eRxNoikAIGtW
	 rHqivnUa9QmybpXN0sVpnr/Wh7NAjkE1pMt5zEMoO64RL4YJL3bX3bFelOerJSXbk9
	 l8lfCJdudqss38qmBN93ibqHKkj6lLXNcJKfEJHPcNqO27oMSjtYUx1RUJsAGiD98W
	 OtzOlouqIS4I/AKQ3hZfWJdjfYgRR7Ut2n6o78gefGh0fI8eVqJIKPlqtAm7xL1jwz
	 WebVbM7UNmZwbl9CUhpGlceyFNNFYsDdQHafydpqFGWz43VtNDl7rtuD9lsqz/AkI6
	 CNbx5TyirgZzw==
Date: Fri, 8 May 2026 08:42:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 10/11] MAINTAINERS: make clearer about what's
 expected for "P" field
Message-ID: <20260508084216.586732e1@foz.lan>
In-Reply-To: <CANiq72m_+CR1BikHHuAR2c-srGOtx0WPOF6wfDD9ASkbE5L8oQ@mail.gmail.com>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
	<921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
	<CANiq72m_+CR1BikHHuAR2c-srGOtx0WPOF6wfDD9ASkbE5L8oQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 5 May 2026 20:02:03 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, May 5, 2026 at 3:32=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > extenal site. Make it clearer. =20
>=20
> Typo.
>=20
> > +          patches to the given subsystem. This is either an in-tree .r=
st file, =20
>=20
> Should this mention that the file should be within `Doc/`, due to the
> requirement of the current system?

Makes sense, I'll add the corresponding text there.

>=20
> By the way, are we keeping the parser change to avoid breakage in case
> someone does not follow this? Or should this be
>=20
>     ideally, an in-tree .rst file within Documentation/ for best rendering
>=20
> or similar?

The parser won't break if P: violates the .rst rule. Yet, doing
something about that seems to be the right thing to do. Perhaps
the best would be to output a warning instead.

>=20
> (Also, if the parser is changed, then I am ambivalent about changing
> the `P:` to GitHub, since the local file is available by definition,
> but GitHub may not... But it is fine either way!)
>=20
> Thanks!
>=20
> Cheers,
> Miguel



Thanks,
Mauro
