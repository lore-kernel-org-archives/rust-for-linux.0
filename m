Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D10280014
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767530735; cv=pass; b=HssOBp8c8r0om1vPVHreqqBVzynx3LS2/+53B9OKfnoQH/uLcDkZht2WDU4wWff1UqhgcpA+1ONrFeqdMO0N7jIDIvVNXM/ZrT8HA0sBpzG5zD16O+jv7Ryf3mJaYxWmu7B9P/J1wBu83jzuIeXS43oBHWaOic69TBrTYP2/V2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767530735; c=relaxed/simple;
	bh=aMDxYYEWu8AfTHWnhAktsERGF4xcc/eWOJQjV2OJT78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsvFrr0rHvNc9D+v0O5L5nYoskraRw8KSDiYpabSKf2js56QufjprFedUBQ2fkglj0tr1RPPWxoMpg/AjrvwIF7LiNhT8jvUH4bpSxb3uNO87EjgWsyZepXDIUweSNtFH9m1jVdSylzBTicj3V17QBmkAtj0v350r/paWH8vaCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mau5+O0q; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mau5+O0q"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f3018dfc3so43798915ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 04:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767530733; cv=none;
        d=google.com; s=arc-20240605;
        b=brb44Y2dipmxSEldjZJxBSRD8IDVsu6BgJ222iBAMLeV7+oe6VnjNq+DFqVzW1txR4
         8RL0Wq13xvKV1JLCoPrbTav/efCHc30t+E4cmhS9gtjNRHWus6wrpuEJdMXdElLsbKwf
         BHS5fjmMyNQhsNIv3GZCgtaD2OAudO62I0yMQPbKy3paGOdloVKwjBQ6cvKXAt0X4/vW
         uJcHgqQO8F1f8Hjuscm6fackywzy6EOXZu2IGU4wWm2+L2gOJnoNpc6MF43ubbFRkR9e
         m3D7XmczANTolkZ47qMgWIxLGRQJ7Y/Zt8AtZHs9VuDf6n1gTXfeeEwbEgr6hFsVY1/j
         usYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aMDxYYEWu8AfTHWnhAktsERGF4xcc/eWOJQjV2OJT78=;
        fh=cDB2IpRvWbKE9VMeouQQVNlONU+OehAwau8yzRCv5yA=;
        b=Zcp6ADnaeh4/c1bUrl+8B+3dJRfEnop5TZnki2bGDKBMzsNtKW6Bp+g5kq7c48jokx
         4CKqMxroEsdoXWmitzaxvcWI7d98LyXEeAMO4l3IeDE9MJHfepavbGOgwvjnjJRVgV4G
         HepLmY4XahwKyhHLz6MxKhgrBxkjo8L18nuqrza+m3QDfKp4XvHNHZ+lyJ/kohnVEjaL
         QAEGoGQ0FXmCm6yJGMwx0O0vDuL3zCFDuT64cHFT/lCbUQ9wZNuLBpuh4UC03TZNCkPh
         JA8t6DoLkrny3E00eKcGnfX+WjyZVWKLlOPcpwRIrpsSwoFHVwiEqshFMRVZGw3rqdps
         lGPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767530733; x=1768135533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMDxYYEWu8AfTHWnhAktsERGF4xcc/eWOJQjV2OJT78=;
        b=Mau5+O0qjtt808o7VDiHv6OwankZGp9WBetvRpTtj8dpIxV61i3n/kKkxEcfN6oUhn
         ap34Uq9x6S0IHAmLXStlpfTYcOWcpkVor+y6ukjJV0QaIimBmfZNB1w+r1YnkwpHOK0U
         Wj2Fa8Ys9wnue1GWSusZ63HrFxyv77SbyIU61wnKrj6InOB5lYlv+EfukxveiALAPi6P
         MVHZajOX6XwL8w4iQC4wtsg20ABfY9RQaIaV5NxdiDF0YgafY6vT+3aVOK7qz/qE2y7F
         irnqM2b4o5PTQbCCoX627isKKgtwun1/J69bxARWJQBEu2HgoqeWaS1zuT50SDTEIG2i
         l15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767530733; x=1768135533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMDxYYEWu8AfTHWnhAktsERGF4xcc/eWOJQjV2OJT78=;
        b=Z/HPQwddQZTuOFaixW7SsxkY6eHdtiU1/Jmb4o2UpcAmq0Gq0h19WZUd7iaaWhlQFJ
         8SX1g7eiuq/Hkj0z8O9Guu50CYRyxRQtCZpnugVvjOOJ0xUACc9xvgKinIGSWPWX/atB
         odabcnd0dTyzH0KLvx+Z+OoR0llJ8y15uPKzEBgSTIe/9EuT/aUk1rbZK8XMvvdA4BXj
         lllkMYzJTGEp5UmCZyzqBAUtxrtanzocxQPblsAkib9M3FLj+PPCS0C98eWinBPVEtiE
         qpJZAEHKBh6nVF9em60OR9FuI+35zDq53U6rLqAD/cxD1C205r1YDtsKWRjrYshKb+2y
         eTSw==
X-Forwarded-Encrypted: i=1; AJvYcCVhMI1DWfl05sgwnstXPhGAzDDlaYQfdzRPlezakDro8xIqJBMZJPtrJty/My0DySn8XDmqZ2989ZFKXwCKJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LJdnkoYGGcGeoHmt4KgA3UrBJf9n1HnB94eh0eBOC6MSLTo2
	KPhqZX0IZ9elM5LML4Nw6r1XvPH/tSgTA66kgm/f/4ci4Swa18zZRV4kOuYYGV71tpcV0DzpALU
	fpi3Q52eKv/zlbewqNY8iPesoTSUFa/U=
X-Gm-Gg: AY/fxX7a06Su5xqjkXyfdH+4qDUUdQyxn4ExIjDYThOUpZz2/riUK+/KGH7DAgKiMrI
	kgSbQDOxF1NrYL5h4BjawSzVkAjhMvpoLU76hDi+fdmcp1aRDwghpph0KnGuKjxkKXsQN29/ink
	WA+RoXRAiSxhKP3xT3dLCwYWe4784o++vh+nN0vZY5Zy2tkNa/pRf6O9bzJpSwDGOo7XI5bPcj3
	ggxgtnT7Iu6wJmJCkqD78U6s2cjZ6bP57HUn5EJoLZQw5L0TY+X85NpiaEmRoWdeJmjcLjxvI8I
	h5YcTiYLSyjDNTYOz8Y02ALScNyxEomla/Tmym4+3dxWohenfmk5Ivr/vDOfsmHiRFFRJshSbqi
	bdMadmPRbXinI
X-Google-Smtp-Source: AGHT+IEUK6m4sIbGPMLynx/AQnYpjqDN2aeMO7BA9xzGR5/6/YcR+IZaImt6gt1jPUsE7+Ct6Nr3B33CQ9MxbENJf3U=
X-Received: by 2002:a05:7022:ec2:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-1217231cbd6mr23295863c88.7.1767530733030; Sun, 04 Jan 2026
 04:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103143119.96095-1-mt@markoturk.info> <20260103143119.96095-2-mt@markoturk.info>
 <DFF23OTZRIDS.2PZIV7D8AHWFA@kernel.org> <84cc5699-f9ab-42b3-a1ea-15bf9bd80d19@gmail.com>
 <aVmHGBop5OPlVVBa@vps.markoturk.info>
In-Reply-To: <aVmHGBop5OPlVVBa@vps.markoturk.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 13:45:20 +0100
X-Gm-Features: AQt7F2r1_JcpVto2Cx11ZhsnaYUBdshm4s5wyslmQT8f9s-4KvSw2N-CSKFb4QM
Message-ID: <CANiq72=t-U8JTH2JZxkQaW7sbYXjWLpkYkuMd_CuzLoJLbEvgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: pci: fix typo in Bar struct's comment
To: Marko Turk <mt@markoturk.info>
Cc: Dirk Behme <dirk.behme@gmail.com>, Danilo Krummrich <dakr@kernel.org>, dirk.behme@de.bosch.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 10:16=E2=80=AFPM Marko Turk <mt@markoturk.info> wrot=
e:
>
> The typo was introduced in the original commit where pci::Bar was added:
> Fixes: bf9651f84b4e ("rust: pci: implement I/O mappable `pci::Bar`")
>
> Should I use that for the Fixes: tag?

I would add both, since it was added in both and thus different set of
stable releases may need to fix it differently (i.e. before and after
the move).

In this case, from a quick look, one is for the current release, so it
doesn't need backport, and the other would need a custom one (since
this commit wouldn't apply) if someone wants to do Option 3.

> Should I do that in the same commit?

If the patch targets the same set of stable releases with the given
`Fixes:` and is trivial (in this case, both are true from a quick
look), then it doesn't matter much either way and may simplify
handling. But, when those are not true, i.e. in the general case,
splitting where possible usually is better and simpler.

I hope that helps!

Cheers,
Miguel
