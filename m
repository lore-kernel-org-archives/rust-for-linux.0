Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E92376FD
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771813514; cv=pass; b=s/6wedLbiwmkPfEM55ChidMX2vGIp5P1gNwLecz3M1dOzBG1ZvrJDZW2pz4JANDGP97C0l6rr4Vfmaau7SF8D6UJ7Wl49TawWiBcTK7Jj2m24Ppu3DeQt1O5SRYapiDhK8AxkwiM+0F9BeJqLMvcSC8KnQ/2mhjlPS6zIHALEfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771813514; c=relaxed/simple;
	bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ0u1l0Q9GLEYOu+/9Svs+Lta/1Yj8fOxbGjEkRkf4YXSiJxOIcwrlUsLh4gdmbHE++M8clx24Met/TEJmslaibe/GYSyETSfEA32iNFSVMy0ypdO6t5RFwJ7qz2DoxGzNBXKkKo/1/QWf+d4klY5FMBTqb5qWb1NGlj3p6DrMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXnTB73J; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXnTB73J"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba6737fafbso177634eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 18:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771813512; cv=none;
        d=google.com; s=arc-20240605;
        b=ZhxWcd4WsqWRO9A4+DGy3V4lcLtwNaQTRLruKywGhqcVjwyGiWZGo+c8oLQ+JiG68g
         Uu1kMsHyIFk7z4Djmbnph8pwCNOorP5AB9D41mjVbRYFjjbmtBEIFYu4mNycVRSDtPMu
         KergkbUt/IBrQQGMAtNkJJ2F+nT03kePC5CKebg6wo1M2ROJwqncL9+gdn8Gv/RQxsCR
         L/44jIfrEB5KkfN6BNihL7+H/EEiAhdYupJCSDbM1mtvQoEVYiU/dQnTXGpXbdbt1Mcw
         g5kTO3XAJjAsxIrIr86bYXPzOF+WAaum0DyaCsCNeUFVIGjHBBva/pYS5kYpYjcklZP4
         RovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
        fh=e1gn67URSM+sDBJjqXP8MSId1Fx2q5OiiNcN2P17qfI=;
        b=WFPIIxsancl4c8sGzHveb0/YJmOoorrMQouSEx8sIJWjRfSnpARVw8AwFPAPQNaqky
         9cyMiHol6a/814rY5qlWY4HSgVBgOzZHDS/ZUw6bzkAhSaBLQ/sv3oYqb4jVtnqEfzvb
         Kz6hDyZ+m5bChKBvV0jX+S/rPQ6S0DhAQfxP5yQIZchcdodF/KH0gscFnYhu7MLl8GD0
         8ANRB6fqXmV2s1+JWb4S728kSuWcsnB8F05MX+LsB7YCN1NrM4Wh44bPpKlpB4edRQYs
         WzxHS1IZWDNBF9GEk5c3LuoDlyECMUZAZAKbAqEZVKNHz5GJi2v+8ZQzIZBaqdMa1hZc
         rgVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771813512; x=1772418312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
        b=fXnTB73Jgk+PYqCJ6ZcUIxxqibaRUn/CSpA/tYUj+7rght1yEseqqkO2LFDLG628Jh
         ynh4PHR/MD1n7IsuY9TfUdpbTENRXd7q+sj85T7GKS3b+u9AjEcZWhf/sRCS/tTIHkjr
         ut2ewqhbnC/IcYTYHbm4X1ub71i8vhunHKIbs+Fcqam8F5HnMLwX+DrusxThWh82EFGP
         PpGot3dJNwROCvrOXVQqr6uZQLe3cqVg9lWmDH9cLcQD4AiMjWUxirMcJ9nMzs/J/YEA
         xJ0ftcMzs8EnRpZPOlsbZryVIzNN7Uv9WkMhXpwU3m5cJ0CzqYmV2LBN0p8Mn7GOTfZA
         UwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813512; x=1772418312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tbHJF6hDFqsQ8A1dtHSJC/hy2VvSIYqdWhNls4XmMk=;
        b=Afn4K7uqEJlaAryARKuUxoNhp0PNjMrVQlLsfad3Iqe6wM6udpTI8C6sr3TUJ+FpfZ
         cy9WxQVPttyyD3l3d6D/dKmGanxRRzv8wYo/OLXZcqc4xgYnGOHyiygZXWsXhBvloRXO
         CpskvsHKMOmMImxl9KVjiKm3Jq7bRlIdYhxV6xzOMTL8Yo0aiHp+k38G24znpoqYTWac
         E5gTipEAjthvX2Zze9gkFR36RTT5zbbEYwDlOoRWd/gYKu3VeqBAoRe5DQ5POaOwSGSs
         fhF9+RorlKqHDjA7LD/dFrsTq9ML3b+g5KbPRxhgO9Wq7pFtlyUBg5HJmiR9vaWq9ksN
         zAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBms8Ep2ih4y0E8CfIne7GG+5qDIgGHtb9snZnyRuc/XNMOWiS7cIOT6xefUnHr1Uo9CYrmmWi+5RQM6MqTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RGmFmySplZxz+btQekoTeaEnomAwW9TyAg3ZhJFzCv53tLwR
	J551So9P4jdcHUSu5pWPRdIhLCXZrEnU1Whg0DN83FMuKaoK8Db/XZ7OdgJvguJZDOOKXbd1sfc
	C3LdnRKqVywR9iacXUUl7TZ1k+DJ/puk+dCwN
X-Gm-Gg: AZuq6aJz/+QRxZk7mzqkzLAEBOfD9PKE1ysKnzuE+9K/AzCbyGHj9Pez0dqz2BzmZpK
	v1IB2SVhWyABUBTR8O0jWgHCVTIU1wWOlt+jf1RV70m54IdqD1S2ivy4IAcAqXJOMe/z8kTnn43
	6b9veV/8+yqAHx4pK9NFaqnoaM0oCqhnnDnfxsZorYbgxwwOZWdu8wl1esVsYMxMWrdY7jhjG8R
	8PHqAgMUJJ/p9ij1TxLIjdm3MxEM78GgXUgvFGDXd3NOXr8kMGFzaYoSLFlCijHW1ghkSQ5gf2t
	HEAIsrOPd4x+iyLZb1m5tadgr7lzw2l/h3P0p+x83qzBi/dbSswEG4px1WAyEUwqtVFfg/cQjCG
	x1yDHYmOiWP0fsPSo6wNp67es
X-Received: by 2002:a05:7300:cc0c:b0:2ba:6f02:2939 with SMTP id
 5a478bee46e88-2bd7b9efccamr1605384eec.1.1771813512092; Sun, 22 Feb 2026
 18:25:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
In-Reply-To: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 03:24:59 +0100
X-Gm-Features: AaiRm50lW9Xl71njyNGUysmdmXECtepW9tM9FUg6Hm0S35zjUK9PXq2xME2Xor8
Message-ID: <CANiq72mKm7TO6RE_cofh=OiSz9sBuZ2EgAiXZHKpcTR0eDgEcQ@mail.gmail.com>
Subject: Re: Rust build speed-ups - please?
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 11:09=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yes, the actual "check that rust is available" part makes sense as a
> prepare phase. The rest? Not so much. Why the heck does it build that
> 'rust/core.o' file when I want to do a test-build of a totally
> unrelated file?

The background is that we need to establish dependencies between Rust
compilation units in order to build them (unlike C). But when Kbuild
descends, the different `make`s do not know what the others are doing,
i.e. there is no easy "treewide dependencies" support due to how
Kbuild descends.

So, for the Rust initial integration, to keep things simple, I added
everything that was not a "leaf" to the `prepare` step, since that
allowed to have simple, normal dependencies in the Rust `Makefile` so
that then the descend can build the rest just like in C.

I discussed in LPC a couple months ago my plans with Nathan regarding
a new system for building the Rust bits, because we need to become
more flexible for other reasons too (e.g. we want to split the
`kernel` into smaller units and allow dependencies between crates
elsewhere in the tree). I am focusing on that now.

Cheers,
Miguel
