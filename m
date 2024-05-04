Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E123763
	for <rust-for-linux@vger.kernel.org>; Sat,  4 May 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714832301; cv=none; b=HzKtK4DRUCBO4FOLUK4yCSSc5bCw/m4NP4btfzCJa8+ShgOsN3HQGgI46AJN4jEptQb0FN1R0wSvRZGAoBGbqPhAiUBKy0MuRZlZFv2oo2CMcIC6n0zL50PH/yQJPPv9/3o3YTwgOeOxYmpWx5LBKWrv8daVzNDqWW5WblAieBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714832301; c=relaxed/simple;
	bh=hQlIKHumhgNNCKtn7ab4hDa3IrQTDvboGbI4VGSoUgY=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVYrEGEm05CI7YjTukVKN92F4WJrRYYEUgRM2Wbr2M3VUIM/vUAs/NkV15ZAYmcnT3PEsnebaJfs4QuBr5q3O7ssbn4EpkkRuMV067LgZ5htFhl1kmSahVi16+28rUQ48ECWIkgHbZpqyvXXBG/2hqil5mK51zIZfh44SiUsVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=k8evzPCM; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="k8evzPCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714832283; x=1715091483;
	bh=HONbczm72IWGyH5jlsk1scUYBH7+zbqo7qraxYEd8fM=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k8evzPCMhEm/tP1EzLlRabeSzErrqDzGtDb7qeHjN56iMiERxf7+0DsDcVuX9K49A
	 mvLLeRKetcpBNpXOZ9HDpeVo5MXziC29KXnjN+oYIDvXx42OtZP4pEsNB0t4r6LfO7
	 06DwY9sOBcz5UKsJa7FXdMuJZDOLkkfeZeI1Bs1n3dMTgKL7fPvC+jRnH8HprIfFUw
	 c1mfNIVSLjKdRGETiwpFRjMHLx61EecFJfiSoWDryBYuK7Bsi+XdC+yCBoKKSY1CKb
	 NWXLaU2nB+yHl9fV9k62kjoj7UdOj9MVAr/vTQpOQvNBC2OIE1c5R4Ok3EXVXiPncr
	 MVa78s6dL8X5A==
Date: Sat, 04 May 2024 14:17:59 +0000
To: Alice Ryhl <aliceryhl@google.com>, rust-for-linux <rust-for-linux@vger.kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: Bug report: Deriving zeroable doesn't work with const generics
Message-ID: <5cece2a1-e375-44de-a748-8cf13f70aefe@proton.me>
In-Reply-To: <CAH5fLghwYAZkwjEQzhXK1RV6-J8SVBugk-a+OvjEC79evXdJAA@mail.gmail.com>
References: <CAH5fLghwYAZkwjEQzhXK1RV6-J8SVBugk-a+OvjEC79evXdJAA@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c11ff2aaafdf3cab582f9614136bde6946fe9ac9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03.05.24 17:03, Alice Ryhl wrote:
> Hi list,
>=20
> I noticed that the #[derive(Zeroable)] macro doesn't work on const
> generics. I get this error:
>=20
> error[E0404]: expected trait, found builtin type `u64`
>     --> rust/kernel/list.rs:105:32
>      |
>  105 | pub struct ListLinks<const ID: u64 =3D 0> {
>      |                                ^^^ not a trait
>=20
> Anyone up for fixing it?

I already have a fix for this, but I haven't had the time to put it on
the list. Will try to do so soon.

Also I wouldn't count this as a bug, it only is a missing feature :)

--=20
Cheers,
Benno

