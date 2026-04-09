Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366F93B3BE3
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727914; cv=pass; b=TqR42SttCc3LBL9rkcJUP89rPGmTHmxHZVBRckCCh1cXbp8Kr0mW6NNx5FSKbzsmx20r29w/sx1AzkF3eNhFVoMO9S1uzfDLoplwBPzU2IY3P1ADUcx2waEWbt/67u2eyxCkgyYAYzLftiDNVnnQtRDaWWskPKugHhxJk7qeuEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727914; c=relaxed/simple;
	bh=bEjzaHGGX7sKPD7WM457c3wEt4lxkqQERZLcuKMlH4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGLCShDvwI2j/8h1cNssvVBazMPfJRni4uDcvVje+prI2dOJymhJTqeiOEAdf87jecviXEv+RLdPS/D8iLhg1oXWx6MeyBW77TjBT/HEQRz4lUJ/ydXP1J0BUoOqFIlHfHxqEm2g51Q8Wm9SAI+PN7Vx+4TI9LWBXmnNqDXHQR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sb8RVii+; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sb8RVii+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so745549e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Apr 2026 02:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775727911; cv=none;
        d=google.com; s=arc-20240605;
        b=Et6XL/NCBhPXJAmbOprlt+n5vVM8MUsSxOEsz5WoJuDmPVAUiMW+ma42fE4E2YeTBN
         +LVnl/i3oJb65nOb0c0Din9XioDxQcirRRZa+6fO4A3RbnEvbURObGcmcNkxL6Y2881t
         jyk9gzh4dQE97VHUU89q4PYNfOc4ZY8c5Dn7kEgh6S/cIAh11bjmhcYwuXuHsgaGMwHG
         I6N+SlL+0iZMQa9mN+V9gi4Z3WkI73ybQVQuUytZUfWWwA72M4AptIru2tlzGeZbG38E
         SWyApaqG23XHUYJLPhIcj5iQCpYI3SSz+3e2lKOC1wCbZ71ZFNvCBE8yHe8IBIL6UrN4
         enHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bEjzaHGGX7sKPD7WM457c3wEt4lxkqQERZLcuKMlH4E=;
        fh=aZJyzYRiiBHpAeoODGVXyaWyl6BXrX21wmJlOUVXD5g=;
        b=cEcogIiOfkPFG1hmgjA4NSQuOqShjH9mwrqSYGdCLfPrDKqMPZ3Oby57haAZOHAzEe
         TuLqnPPK6FhrGRGUQzbxI3cICCawmK1hAJStm9E4rSER80bgQ/XtnPBo47Q6YBesb3mP
         7Kn9aAWniR35/P0uCiIBykf4RjEnvxlmxu7AUvlm1L4FN10Y2yNqfF+3SU6C04Ffq5FG
         +uukR2DnO+Gcv7ij/55G4Ls4xPn9tfTkslQGWcJtVj3y2KBtbMbhmpU9Vmwl/o71QoO5
         bQAYRNpr8QF2bfzQx1zjrWYltYaPX2egQNTSGJ2M3DS2EFPIw5PM9Hle/2SBd5DG4gH8
         +ihA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775727911; x=1776332711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEjzaHGGX7sKPD7WM457c3wEt4lxkqQERZLcuKMlH4E=;
        b=Sb8RVii+xmJ4dKahHPJLv9f9+V0Kuib7wK0VP+x7vPhYYdNmH0k8FEZCEW5EsI2uTq
         JFwp5noh1Po7jkql9XbLyiHJOVaTLfyuvV7zEa36MyTPeLSZ7t3SUQOrYD/D2wsPPE/P
         JHA5537+CfLyYHFz5MHmzhOuRT2Uc4VDrZ3S3GILJZJ06j9s3W3SKV9Kz7p1dY2tLqiU
         IA4HAD1sbJEq2G4IKR2MNWdGxA/JF/HyO9negs/1VMEgJ+ShWBSC0xTHkE6Cc149aOan
         uPuIn4PzVtDUOW7Kw3wBbbuQF+Qx5GHG3G2kQ9iU/TESmRBuyJZlrHwht5wsl+3DnD2m
         ZJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775727911; x=1776332711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bEjzaHGGX7sKPD7WM457c3wEt4lxkqQERZLcuKMlH4E=;
        b=bn2CaYAB1hYTV9TJFMze+2IXJk38CmovVfL/1pGd9s3EO+bs98eJj6n5dTNuT9f1XS
         XgGEN0/91mPE59O6HE2rOlemy4BfoxJzxPhelY+IOFvOAgeDYWuvsVJLYVkGrCqMIPty
         pVC6K0yIY7JAmQg93o3EP5hu9WajQOhsQne8EoIHrQYF8ZUeQoBk//CGGibPk6RfazUn
         X5MywX+ISSDuMaZnLa43mfUhfmg8lKiZqrO1hHi1NXJGFmdLCPEhXcUoL/qvJXtYN3k3
         2Mzo3DY8OWOKAvvCwFIQ2KAaxpnx/UbjYuNwU7/DICdEZWlmQFRDEI+xgW9p1irkzNL8
         9bDA==
X-Forwarded-Encrypted: i=1; AJvYcCWWTrX0Kk50oGk0JY/35eIGVPjl65z1wSwR0+/T9Ag/WQW9H1rnLIibCASEVcPQ4qCFRgnRVF8354OOi8TmXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmMi/CJDL9WjRFiFan1aCsI9rMyz4imflqQ6BgZLqwM/sqbENg
	j3LdpahX6NIGjyHpEoB9UqPmw6Z+SM4KPn/2UcJPVPMBrGGppmKutKympBZ5mcDE4e9XjRVU3HZ
	GtM3qdNm5zRtt6D4zNoolXhNr1v5VcczDdAlMHlLSTw==
X-Gm-Gg: AeBDietmQG1l0dmUmAW9VJLB3u/vbmCxIEJ/0ePQulUQ4O93r6VTK2UzlzvJ1AyAD5S
	Ijt7jlQWtK6KDU1V6J7AijVL2NgtkOLx6yvIBWA69Tz1tcKKNzsdbZHjVP92EqjSJ8/RqgLaYA1
	Us6O3+b6XKhDiMgnfpd8xOruWTF3evT+9Ds79KwOOcYkIaDsAJhBhZxEKWwt3EPJwy/aP+yvBGT
	MPib2Ec3UMpS0YsSU/DK287FZbGQ5xIvoOmM5iBLp+1Fd6D48lGuwxa6CDTy5DDPJdbzq+Ctqcr
	XGnNN9DGQQf5wGaybeGWQTmvHuFKGum21sUAFIT9
X-Received: by 2002:a05:6512:4016:b0:5a1:3b7f:450e with SMTP id
 2adb3069b0e04-5a3e7c4e7ccmr1148328e87.42.1775727911365; Thu, 09 Apr 2026
 02:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204155037.325482-1-marco.crivellari@suse.com>
 <20260204155037.325482-2-marco.crivellari@suse.com> <aYNxkG3gCspeeW9_@google.com>
 <CAAofZF5GZ9UBLNH_+NRSyXW1114d++TfEc3EuBiCpPkdwK1pUw@mail.gmail.com> <CAH5fLgjwz_WmkWDJrZ1d_HZ228-whdgQkMb4WnmKu+g3ktEskw@mail.gmail.com>
In-Reply-To: <CAH5fLgjwz_WmkWDJrZ1d_HZ228-whdgQkMb4WnmKu+g3ktEskw@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 9 Apr 2026 11:45:00 +0200
X-Gm-Features: AQROBzCQH1R1G4iX3SZuj2NRPY7piWLcprlVgCBatX3HXfrtB2jAMFitBuVOU9M
Message-ID: <CAAofZF4yJBM7jep5z8w-eRB2TGBHV72-hNfeKJ_k-vHopXj2=A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add system_default() around the new system_dfl_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 5:39=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Wed, Feb 4, 2026 at 5:29=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > On Wed, Feb 4, 2026 at 5:19=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > > [...]
> > > I don't think we should use different naming than C.
> >
> > mmmh I think I misunderstood you here then:
> >
> > https://lore.kernel.org/all/aYMk5skDB0Rk7vWS@google.com/
> >
> > What do you meant?
> >
> > Thank you!
>
> I think the ideal would be to rename it to default in C too. :)
>
> Alice

Hi,

While I respect your preference for a different name there it doesn't
seem to be any urge for that in the C side of the kernel. So I would
really stick with what we have there.

If you have any specific naming preferences for the Rust side,
please articulate them, I am more than happy to follow but asking to
go with yet another rename seems out of order.


Thanks!

--=20

Marco Crivellari

SUSE Labs
