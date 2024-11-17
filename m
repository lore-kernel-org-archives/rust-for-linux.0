Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5621C3050
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731853388; cv=none; b=gow2/eyt6lBEYgmUU0Ff62WFeHJWIr4jdFewpjhsFsHBkaG4onEz6NCEkyaryrbaCnykyAT9N8Hu25+ULvuXI4M7EDVHafZItpGx+RS6SEhQNK9A8bJbLqmZPyqHqZymux0yFBpSDtAKMNbDHE5snLLk/vhftzkfX7rM3SGkRIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731853388; c=relaxed/simple;
	bh=Y03ih/VtgGEn2rJLZELBDL74i3MnrdizewsD1qq54t8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eorkzeXwc+r7PcwYUjHK1LGss4lJGIJqI9++xlAA5gBF3he7P16O//gJwiBM2/LhC1pKuTvDw9xUNtBbvGk3uVK6TaWQPXb4UIscvQaIT00iRhR8OuaF0qO16pglNMPKfpfP6ilLXsKd8mc6fHbD09TwgfMB7V9sbqqLRyuu1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io; spf=pass smtp.mailfrom=mandragore.io; dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b=xRevcVRY; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandragore.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b="xRevcVRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandragore.io;
	s=protonmail3; t=1731853376; x=1732112576;
	bh=Y03ih/VtgGEn2rJLZELBDL74i3MnrdizewsD1qq54t8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=xRevcVRYv7dBK8+xO42fdoKaxON0LEJALBsvJl9JmFuRO95Fq/ArX7DIjkLoO32GD
	 aKvWwHCZsXfYS0C664xmk6sr4kXwu08bqrGw4fOX5JKRBO5xJqhbxH0Wudv7zO1mY+
	 C3L9d0NME91+gycBM76MgvyuWGIhefGFqOZapkBq3qnSi2IgifIEmHyHAH8hXtG699
	 BRqUzRrwxp60H+3eTqVQYqgqCy2XhR28oIu4VNwYNMwz6d8FeyuBad+KHh4S6ceSd8
	 +34Nll3OB/1LshOvBieXne+W56GmjbhzO42KZQAkeqXC2aWE+/nqeeWnxz2Ux5hBvO
	 YkxtNO9OJxXaA==
Date: Sun, 17 Nov 2024 14:22:52 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add safety comment in rust_fmt_argument
Message-ID: <wsskxUFiMp-P7-uPh7962QXxwSUviSMoGb9I8NIJo_O4t4ACDvEpDUQJjE1FzMaD__ZMJsoaKpPA3SHq7Re_ogxAa-3pDlHiWpuT6LLFzmM=@mandragore.io>
In-Reply-To: <CANiq72keVxpkDzP_7wshRR=wPubdchbf3HFA132JYca8m+HnAw@mail.gmail.com>
References: <20241115214907.191454-1-kernel@mandragore.io> <CANiq72keVxpkDzP_7wshRR=wPubdchbf3HFA132JYca8m+HnAw@mail.gmail.com>
Feedback-ID: 125704292:user:proton
X-Pm-Message-ID: 0068fd1212128e2f8fc0bc27e9f7b1e8867e6198
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Thanks for the comments! It seems I missed some simple stuff but I am takin=
g notes for future reference!

On Saturday, November 16th, 2024 at 8:39 PM, Miguel Ojeda <miguel.ojeda.san=
donis@gmail.com> wrote:
>=20
> > + // SAFETY: The Rust contract guarantees that `ptr` is a valid pointer=
 to a `fmt::Arguments` struct.
> > let _ =3D w.write_fmt(unsafe { *(ptr as *const fmt::Arguments<'_>) });
>=20
>=20
> Which Rust contract guarantees that? I guess perhaps you adapted the
> message above that mentions "C contract" and/or you may be referring
> to what is done in `call_printk`? I think we should be more explicit
> here, and justify how the pointer ends up being a valid pointer to
> `Arguments`. In other words, please try to explain how that happens.

Yes I was mainly trying to match the style of the existing comment since I =
wasn't sure how verbose I should get. And I agree that we can be more expli=
cit. I am not sure _where_ we should be explicit though. I am new to the pr=
oject so this might have been discussed already. It might be best to docume=
nt the contract somewhere (possibly a module level docstring?). Then be exp=
licit in each caller site on how the contract is upheld. And in rust_fmt_ar=
guments we should simply be able to claim that %pA requires a pointer to a =
valid fmt::Arguments struct so it is ok to cast and deref.

Cheers,
Konstantin
-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0Fgmc5/C0JkP6FRRdCoj7tRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeYIsGgZbOvfHtxEqDJwVNbBk5M3dEocTsU04Oh
RbcOvBYhBGVbTUplRrGbBUXggP6FRRdCoj7tAAAUCwD/duv59yJoOSn8cMAF
uM/ga3SV5jiacjFytdcLpAIT9FABAPRB3HQ2Doe/jQOrGg2/SJ4KWMPRmgRE
3XjnT/HIf8QM
=3DkpEK
-----END PGP SIGNATURE-----

