Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A417FE
	for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716385748; cv=none; b=NJRpV3TtFoiSFZ+jTbOKq+nKtTsL4DB1rszjYa0pdA7/L3qZLmXm3LbvdCntfHn5mBi3xy8ftpfBAQkKjW20fmeX54XzzXnntGDm52X4cPcaTMcbzsYTPtq/w0GCaq0vWjZZhu8LSNdk+M1yiLvzDBNs65zetwPDasQZ9trYg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716385748; c=relaxed/simple;
	bh=pUzUUKvWRBwo9Z0hrwY+90RykS5z+NK2WVo3+xZEFbk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uDImdOby88S8X3341m1B3Vlw2v2UDf8eMOPL3ARsI6l3xG411trkIigZAVjfao00wuwrdKEyvcilke/L6V+Jp/WX2oReDXoqdJca6BdF9vb5cc27SS2UH9qE6GuFpganvjNb8HO0Sh6otr+Lbbe5qTVjeBDm0kDeJr4zXPM5wmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/rXUtKa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/rXUtKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BCCC2BBFC;
	Wed, 22 May 2024 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716385747;
	bh=pUzUUKvWRBwo9Z0hrwY+90RykS5z+NK2WVo3+xZEFbk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=p/rXUtKayjTU8vDVsuH+2b1fH1jzlcpVHe8mE0Ljn4Wf2nUMNfM+J1Faz3hi3TG3V
	 wF3cieLrgk/vkzOygJhAxRlq/3zlRbHhhYgBVlrjfIvD2yKEl6mVxMQnLzRsJBi8MB
	 p1xcSdUAPVXtyV3fah5S6d0GZK7hAwkAorMIx7i22LYHAibuc3uytd7VKi9Tfjin2/
	 oQgCT6IqaVc2sQar4IcGNTvLPFwEo8Mi/PxIsuVO+EDKVRFEqgdJbHbLArdpx5IH5b
	 EL2b5i9firYYqOlExnJ+9qGAr7c0fjLK7/64lhHRachX0sTmhLAluRoFXZhUXEm2SW
	 7rcWdYSj1Y6og==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 16:49:04 +0300
Message-Id: <D1G7YTUR11EW.WIG4RQVBNCXU@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
 <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
 <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
 <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>
 <D1G6UP4N7LP4.OUPA5JVLE1WO@kernel.org>
In-Reply-To: <D1G6UP4N7LP4.OUPA5JVLE1WO@kernel.org>

On Wed May 22, 2024 at 3:56 PM EEST, Jarkko Sakkinen wrote:
> On Wed May 22, 2024 at 3:04 PM EEST, Alex Gaynor wrote:
> > Hi Jarkko,
> >
> > I'm one of the maintainers of https://crates.io/crates/asn1/. Based on
> > that experience, if you want to implement a DER encoder in Rust, I
> > think it'd make more sense to write the type-code in Rust, and then
> > expose symbols to C like `encode_rsa_pub_key`. This should be simpler,
> > but also more efficient (fewer allocations).
> >
> > For what it's worth, rust-asn1 is _intended_ to be usable from the
> > kernel/embedded targets. It's no_std. It currently relies on alloc,
> > but I'd be happy to accept PRs to make it work with the kernel's
> > approach to fallible allocation (it currently does support fallible
> > allocation, but using the reserve APIs).
> >
> > Alex
>
> Right, I need to experiment with that just in user space first.
>
> It seemed like most "productized" crate from all that I found.
>
> Yeah, and it is true that also crate could be as rusty as hell,
> and then just make bridge shim that hides all that ;-) That is
> probably better way around.
>
> Thanks for the response!

If we want to considering getting your code to land to the kernel I
would start with the decoder as it already delivers, as an
*experimental* feature. Then when it is landed it would not be
as huge stretch to move forward with the encoder.

Basically how Rust ASN.1 could work out for kernel is pretty trivial to
describe:

1. Add a new Kconfig flag: e.g. CONFIG_ASN1_RUST. This flag could be a
   subflag of CONFIG_ASN1 and by default obviously disabled.
2. Import asn1 code to kernel and make it build as part of vmlinux.
3. Implement a shim for C with zero or at least minimal changes to the
   developer experience. I.e. you can drop your asn1 file to the subsystem
   directory and some small tweaks to Makefile and you are set.
4. Update MAINTAINERS. I think this should have own entry and probably
   you would be the best possible person to have M-entry. I could add
   myself R-entry (reviewer) because I'm the end customer :-)

If we would get this far and get this to also mainline then it would
be also a huge step towards encoding as then it would be just adding
another feature without infrastructural madness involved ;-)

BR, Jarkko
