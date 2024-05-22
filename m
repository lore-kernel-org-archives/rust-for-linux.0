Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008FD823B5
	for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716382603; cv=none; b=YBQfTOsE0FoV2ur6IniOM3dS14hJgZOVEZrJZL0DZPbOcPcap/OViSRey6IHdEW/BCXDsdfm075Zac1OxRPgH9y6OxSNGKKmZbOHlIgC+WACa+z4zFjycGx3pUaO2sGtnH/3nroim1+nky9/lBHyQDwrjF6Rbq1L+60kHMuGv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716382603; c=relaxed/simple;
	bh=Fbdk6MkNEKNLWXmOwViTNeNWNmZXkGINE5ql58CzrkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CPE3NiBM4wKUm5zHpqsslB0I6cDSY9T7F6UoCEj/rqYyanoV9bmjuiaMj8c5BP9wUcurOwYL0+pYPKatYycD47q4TEBWZEF0JYVBFJLLZAOwKIpCuCs7jtULVc3fsPBnzGuYwK4oCX0l5aI5bncdOHZwRmXHkPmAN6rPHq8R3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liuR8O5h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liuR8O5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EA4C2BD11;
	Wed, 22 May 2024 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716382602;
	bh=Fbdk6MkNEKNLWXmOwViTNeNWNmZXkGINE5ql58CzrkE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=liuR8O5h3ElShM0pDegHCMaqw/urXo9siUsXk3o3v/eSnMc7A05+y65JDYQLDffir
	 1O65YoHI0bS/S+S60Mi3B2KKYtXmpDJdgBkG69hY3JvSLkkckPqHiJC+OC5+A/ovcN
	 fhTlpo3vPm+hqpZINGcr9szBgfcPMk2GG0CxlnCkOC+ylKrFmzEWNxY1rzP14y/RB0
	 QECjktBa7ivmCvu8yhP2hzlucTfZaN5GEfypjr3cqz7R2XUUUlGNpRr1bVohYfYvZh
	 GhRM3GNyi5pw6eqVbI8QNWGekbIMU+CV+/IVfGHLlNtwo9Zf1Ag1nj02Sy3M7Vgvkg
	 W1MuQHav2Jiwg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 15:56:39 +0300
Message-Id: <D1G6UP4N7LP4.OUPA5JVLE1WO@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Alex Gaynor" <alex.gaynor@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
 <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
 <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
 <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>
In-Reply-To: <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>

On Wed May 22, 2024 at 3:04 PM EEST, Alex Gaynor wrote:
> Hi Jarkko,
>
> I'm one of the maintainers of https://crates.io/crates/asn1/. Based on
> that experience, if you want to implement a DER encoder in Rust, I
> think it'd make more sense to write the type-code in Rust, and then
> expose symbols to C like `encode_rsa_pub_key`. This should be simpler,
> but also more efficient (fewer allocations).
>
> For what it's worth, rust-asn1 is _intended_ to be usable from the
> kernel/embedded targets. It's no_std. It currently relies on alloc,
> but I'd be happy to accept PRs to make it work with the kernel's
> approach to fallible allocation (it currently does support fallible
> allocation, but using the reserve APIs).
>
> Alex

Right, I need to experiment with that just in user space first.

It seemed like most "productized" crate from all that I found.

Yeah, and it is true that also crate could be as rusty as hell,
and then just make bridge shim that hides all that ;-) That is
probably better way around.

Thanks for the response!

BR, Jarkko
