Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702937D13C
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774149024; cv=pass; b=J2kVGuBeSHrdo/ZUwz2kl23Z6G2C1SuJ/WV4KlrrTCBbEEso5YGpdMrzx2dUITh3/5lRH4zKI6m3FTHwKtTrJ6vZm0MQ8P7SLgVVlnccG4tbOjm2GKb6WHtDU3Lb8ELehQj4CGeFKawRcGsSu6znyhmrNsb0a0Mcrs8qpPj6FyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774149024; c=relaxed/simple;
	bh=qI8cGLYSonvblVpAObq8aWy/zacJYgiJ4SIZlevZ3xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krZJi1IWqHfzzNMWdf7xjgrGbHui/OQa9YCURK3WVPvQXMiqLQU/jD5EvdPEzyZ6Gs4EufT16ZTmngH6lhK88e7e8tmgU4nLH5jx8dQmsHcEPpl5lgDeM32IaOAQ2XMU0VQCF6//WwFAB+45yzdxxRY0BJfp5o016rvjYT7sPPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7OQAzrM; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7OQAzrM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b98133bdc4bso370315066b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 20:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774149022; cv=none;
        d=google.com; s=arc-20240605;
        b=Rrsd84T5x2ZcVIuEBu3W9CxRhA19OmI66Gbh7YTDzYM+DzKRCZyOv4tktDppsvx9zR
         n7DVrFFhIX1qfo5Skxc3oPdBoZ8xWMtOYD2UqTV5Fu8pwPxyc418eo+nZBX5UhDu8v0l
         FB+FTTBplR3/TS2yFm7eKVvW0j8mhzlf2tSZ2S/yGE3RCdB7QEeWPK7O7bnezzJ1WfQZ
         O1JFVE5t3AxWYDg/lsy+/D04fJPcyMrRnNT0bh5of09/P6db7Ll/BS7MCzkJzFrB1tw/
         +ghED54wua+9/ZZkotSYKlLSh6XCbwNZFrdVHjpdMTOH/UNhkx4H2l3qjQhPx4R2AmDl
         pbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTLkowE6KYKLruDWq465rIcU91SM9HijKVAqGBSPyPM=;
        fh=ReEX4/E5Ql7UDabyBMLzyZ4PN2pFAHwkU8X9tjeKYPw=;
        b=RWlIeLPAtqly+xTlKkuvYmfp1cQ/6PgETL04dHPVXl/Jehsxz1b3+jTBcYoZSCkfxD
         wSkyN4mvEmEuIRZ+gmN+jbF8lAPumw5P/f+mVnfDeVa1Ew3LjS7OMBvvdbiLc2/hr1VC
         pkqmb90gs7D1GyQd0170UPmGXxkl0xZmPu85hhsw1uzQroOLNy6zZKa5FBZtenvWBUPn
         HmDWFyUw3bblT+8PLsTT4lS9nl2EijQjwnZn6ciakZNGdZbHqG7DMXDl/Y7kfC6zKqgH
         VO6ezHQ901WnY5aVrqcRyG+iw/BFRHGnvYVm/fhDvrgSgkk+JTDZLZWqP7lKKV8tfSUc
         XCTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774149022; x=1774753822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTLkowE6KYKLruDWq465rIcU91SM9HijKVAqGBSPyPM=;
        b=K7OQAzrMB3qDVNe5VMNQPQ7qMXHq3IJrx1gX+8YMOabVJn0U2tE79TTuytIVQ747Hv
         474bovLYcrmaLo3q/sGgLbKK+bg85tOy6QUV1d1Ca+kEcpmaB2VgAppkXx9mqJeAxsgT
         +shZbrgmFv77DCQGKTN/goSbwVDplqa4Me1u/WtLY9YdRdAY5Y5n5SurvHce48J4MhDf
         /ofb0sjUZUsex4C1SjqngCz4zWs5VFftM3KyhLtxHnnDd5gkpDNSMdihvzM4vQ6q91FG
         lDZiEenvMCNRfB4iyhKq5xpZUmMtE6fRIqtmD1hab7iri8bqQ+j82Uw07/UrewJe9GtW
         lchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774149022; x=1774753822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTLkowE6KYKLruDWq465rIcU91SM9HijKVAqGBSPyPM=;
        b=B7wJJ+GFtzo38n68dc9jKJ3ssifrERSrl0aOX626d+ZZ3GMa8YgEfr1mT+ijjF3j7H
         6xrSUvamF7Tl8PU5/5TPy0u/nylLYaaXzYJCqBCBPelDo5MKuUL5dmf+HK0kZMchpHZw
         89oR80SMYypSLxbEtWWcnRpCGjBw6OTI/MwMe6duyw2CRWga4naY81rXHrSTD0DonVnh
         nAWOd39Rk+n7s875cKoqa4APwlNtv7mfdEH3K3NkiW8IDzOqPg46cm8RwsenLjs2Pu8z
         7rracHTIBX1pQsrdbl8s7r2WkHNz1vfkXruUIiQu+pkjYVYigyyFE9uVmJIeRosaXr6H
         nVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUylDXw/QyFCPRKs5TlLwyDpuXENrJKowt/y0ixfDP5zmgYhMg57eDc3Ak4NogGjvnB3qfvIwx+6VEItWe1jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMPSAZ1IExUsW7MAIzbaBd/lpv2ctBLMuorvBgjdnqbgZXeMS
	69c3twqgxKiBzrgnXphcVvFOkoxKQECV5D0wgmcJ1VdmWKsKSAUMOqco/mnfw75vp+xxM8pd0XZ
	QG0Yesq9/1bCRjKobMW46KexPGlnnhOQ=
X-Gm-Gg: ATEYQzxIhDsax02dNt3SF5LpZI/v8MSjIM+h9tIscDEjaVCsx37nz7AwRtfaXY+01Dm
	Ho1dM1mtms+GYKyR1yXwLbyWCn2xRV7r4t5jScYgAdX1hE+iY2U1CfhP7iNMFZca70Mt68awDVj
	LdBQ4f89AxegcxtbBjks6sG6n6gV8NKCRFq/hayhyeNPbGMvCK/TQ9ApGi1WS0WBhPQRJifjaeJ
	QM+1Dz4iSFgWcUyf7Umy6QaHOJBvm1igchNSBAcaRHeHMtBRHC1WWVmVLEhGOgDgxW7wstjoE+A
	8n+TdYzeH9DsWaBYy97hv+3jgSp7ZqfRQhEQH4juHsCQ
X-Received: by 2002:a17:907:c99d:b0:b97:9419:609d with SMTP id
 a640c23a62f3a-b982f0aaea1mr360158066b.2.1774149021466; Sat, 21 Mar 2026
 20:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321143406.67066-1-albabhasan276@gmail.com> <CANiq72=w0HcWi7z1wL+R1wa6jS_+P=L8Zp7pvZtUG+C51ETzng@mail.gmail.com>
In-Reply-To: <CANiq72=w0HcWi7z1wL+R1wa6jS_+P=L8Zp7pvZtUG+C51ETzng@mail.gmail.com>
From: Albab Hasan <albabhasan276@gmail.com>
Date: Sun, 22 Mar 2026 09:10:10 +0600
X-Gm-Features: AaiRm50-D3tZ2a_GEv_GqcRQhk7gc44v2NKYPE-GGbDaqe6cepTbTm590htRFYI
Message-ID: <CAM9eepVx-ZR74CPEk3kup3nMrBb7=FVXsrW+ZC957h2618K5zw@mail.gmail.com>
Subject: Re: [PATCH] rust: print: add SAFETY comments to unsafe blocks
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ali Zain <alizainuimx@gmail.com>, Shivendra Sharma <shivendra02467@gmail.com>, 
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for pointing these out Miguel. I wasn't aware of the prior
patches. Sorry for the
duplicate. Happy to drop mine in favor of whichever version you prefer.

Thanks,
Albab

On Sun, 22 Mar 2026 at 05:14, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Mar 21, 2026 at 3:34=E2=80=AFPM Albab Hasan <albabhasan276@gmail.=
com> wrote:
> >
> > Replace the placeholder // SAFETY: TODO. comments with proper safety
> > descriptions for the two unsafe blocks in rust_fmt_argument and
> > call_printk.
> >
> > For rust_fmt_argument the ptr parameter is provided by the %pA
> > format specifier handler in vsprintf that guarantees it points to a
> > valid properly aligned fmt::Arguments<'_> value. since
> > fmt::Arguments implements Copy the dereference is a bitwise
> > copy with no side effects.
> >
> > For call_printk the safety depends on the functions documented
> > preconditions the format string is one of the fixed compile time
> > constants from format_strings and the module name is null terminated.
> > the arguments match the format specifiers (%s for module name %pA
> > for the fmt::Arguments pointer).
> >
> > Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
>
> Did you see the following ones?
>
>   https://lore.kernel.org/rust-for-linux/20260212125427.122362-1-alizainu=
imx@gmail.com/
>   https://lore.kernel.org/rust-for-linux/20260211182755.82220-1-shivendra=
02467@gmail.com/
>
> What is the relation with them? (Cc'ing their authors)
>
> Thanks!
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
>
> Cheers,
> Miguel
