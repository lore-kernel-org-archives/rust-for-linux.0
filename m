Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5517BB21
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 21:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767303584; cv=none; b=RHvp1NmN7QSvdYyAc2aiRMDFsj5e8WB8EvzdBflHm0dq6jYX2ioU9WXkIe6C2M+AWOD8RUZ2g2bf2VweS+hEx5orD75XnnzMzNxMHLQsds4cabFDYYCRAb3BomEQKyNxGNJ7HQXVSwLBH7R/D9N4ZLESjDbaqPCNwP6tPtZJjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767303584; c=relaxed/simple;
	bh=ofnUVaqlqNUv5A5EhEXXtl1beO/mdSfPectgF6XIXMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDaH3ypgR7c05J11JzLeOkzgde+oYfTwmMnLG/CZo8naSMEQ1EFqleZ/7qngKuvI2XZoBCzgJLGVj7Gme5o6Mh08/zotzs4mUBCpfU+OxWOV0o2rfXJrwZn5KFWlRcRZsPkr0mb5f0RrqQRIdEEG9ma4n/SqW+gtsPfLxpv/n48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdkA39x0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdkA39x0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c3259da34so12126627a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 13:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767303582; x=1767908382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhyR6EeWJn5gH7L2lz5ysxC2PI22BfFF/L9Mt2XFck4=;
        b=BdkA39x0q+4gvoh7IKJ7rKoaId4vhJSgfCfXN3ZmdDTzqU4J9EUY5IddnOOnajnALx
         qOyWEf6dxDO8raV9+MVhEGK05IKQF0SQaBNonTM43gmL8OVo5mjlHQ6i+iHQ0o2ICbm7
         spVF8o4cs9q69TLQ9sdYeHuKdYQGKfn3cZZSK1TryA7HN4tzzS+6kbTHeUrmEbImmTGk
         n02PKOzLGxLdz5ewfrQ+gmYISWTXG5kEg9Jcg4QJ88dlWF8IAWPNRs9lDl5hJ1cuxpTW
         EsLPJaVly6+060CFi0Vzg2/GhpYc4+K8WzYDOGkiyDGshjv/vxVkXGTBYAtE016WvnWK
         e2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767303582; x=1767908382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BhyR6EeWJn5gH7L2lz5ysxC2PI22BfFF/L9Mt2XFck4=;
        b=Mr4Uono4dl0CNKrZo24cgKGNcJSZMnlgoa3TjQKw1J2DeU7yGkozOUSOg396uwHtv7
         8aqpUiTmWhSd1YXsFtu4bAYbo/sHsy2AF+jKOoIZ5Z0EEgaiaU36OuZ/dhNgEXLfgie4
         4Y8ufnelcEEpX5ZSY97O+o2hML0rhFRIhVr6IhzsXpXtW3imY15BGRb9nXXe9H5fr1P7
         fRSMIY6UUyUYxLCOJztWSHZPPsbM5WH25D3PfMpYbGyzQO10SeasGb7ffeCpRirPmA7w
         NN9OSw3RtTHUTvWADx5UfDI69dAE1dwOQXdrEWanAM93ablmzEjEiHOKcr2UUnIiCcd5
         AIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7BSOIDVjjcyJBvnnZdQ04sdfeFJOG7tgBej9NqTPNEGVGAEeUFCe5wY2myZbHzWFB6o/W/UVSq+97zngJRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTI3eJVg2HzMh6q+iL8lMoPmQnAMi4SXmyPQpxz4gp2u6tAm5P
	Uf0JRDS1rMaDROMfc4GMPcA9rYqznNukDgoICfK8XDvGQMDL9QA2eaMqQs+X2tNguYcwJVENv6y
	pjgl1uB5HMPoYUL9KYmetJhqvLVh+b5M=
X-Gm-Gg: AY/fxX5/wIXPcuv1YEo5sKBfHipF7MqW/cEutmHo+O72Red4fBltVq1uKmv62XnOiJa
	iyVswR1HQLEEmtPo1qC5PgTY/kapTmodobGYeXyxNTA3RYWxG1Odom3xZrQusTjCrWpisqSXKtp
	Pz5j4cGNZEd2/OEwJAZMgATnTHt4/N4WqRS3wTIDkiv9SeVq5D6tR+2Oqnkp7113vEHjfk4XF5p
	l5hBMh6EdgxMl8fQs8NZpnhXLHnzKvgugVgZKtDpvxtfB8W1ZkDEC9jmK6J/LDedJyxn6PVDlXX
	Zv8yJi66QX7YlGOIFcrtI5PvPyk=
X-Google-Smtp-Source: AGHT+IEdTApMiiK0+VoNAW0h3YNYUEf6nSdx1hT9Rb1ud4eCLjiNNyshbuXzWOrOrVsCsXWcCKDLHGtHVZIdPt2Iqic=
X-Received: by 2002:a17:90b:28ce:b0:33b:cfac:d5c6 with SMTP id
 98e67ed59e1d1-34e921d19b6mr32157698a91.29.1767303582334; Thu, 01 Jan 2026
 13:39:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
 <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com>
In-Reply-To: <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 1 Jan 2026 23:39:26 +0200
X-Gm-Features: AQt7F2qfR3Flfulnpu7CTFF4Iu04c1NBiPjGBkl4SwomwuR3f5UG8pj1b3Yaor8
Message-ID: <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

to 1.1.2026 klo 22.23 Daniel Almeida (daniel.almeida@collabora.com) kirjoit=
ti:
> > On 1 Jan 2026, at 16:14, Kari Argillander <kari.argillander@gmail.com> =
wrote:
> >
> > =EF=BB=BFOn Thu, 1 Jan 2026 at 20:21, Filipe Xavier <felipeaggger@gmail=
.com> wrote:
> >
> >> +/// // Combine multiple permissions using operation OR (`|`).
> >> +/// let read_write: Permissions =3D Permission::Read | Permission::Wr=
ite;
> >> +///
> >> +/// assert!(read_write.contains(Permission::Read));
> >> +/// assert!(read_write.contains(Permission::Write));
> >> +/// assert!(!read_write.contains(Permission::Execute));
> >> +/// assert!(read_write.contains_any(Permission::Read | Permission::Ex=
ecute));
> >> +/// assert!(read_write.contains_all(Permission::Read | Permission::Wr=
ite));
> >> +///
> >> +/// // Removing a permission with operation AND (`&`).
> >> +/// let read_only: Permissions =3D read_write & Permission::Read;
> >> +/// assert!(read_only.contains(Permission::Read));
> >> +/// assert!(!read_only.contains(Permission::Write));
> >> +///
> >> +/// // Toggling permissions with XOR (`^`).
> >> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
> >> +/// assert!(!toggled.contains(Permission::Read));
> >> +///
> >> +/// // Inverting permissions with negation (`!`).
> >> +/// let negated =3D !read_only;
> >> +/// assert!(negated.contains(Permission::Write));
> >> +/// assert!(!negated.contains(Permission::Read));
> >
> > I really like the OR (`|`) operator. Personally, I don=E2=80=99t like a=
nything
> > else. When
> > a function or expression gets longer, something like let negated =3D !r=
ead_only;
> > already feels strange to read.
> >
> > My suggestion is that everything else should be functions, so we would =
write:
> >
> > ```rust
> >    let xxx =3D Permission::Read | Permission::Write;
> >    xxx.remove(Permission::Write | Permission::Read);
> >    xxx.toggle(Permission::Execute);
> >    xxx.invert();
> > ```
> >
> > This way we avoid expressions like:
> >
> > ```rust
> >    let a =3D !(!xxx | yyy ^ zzz);
> > ```
> >
> =E2=80=9C
> > At that point, no one understands what is really happening anymore. Peo=
ple start
> > wondering whether operator precedence or evaluation order matters, and =
may even
> > have to go read the source code to figure it out.
>
> I disagree. How would that look like given your suggestion?
>
> >
> > By only supporting OR (|) as an operator and expressing everything else=
 as
> > explicit function calls, the code becomes much easier to read, review, =
and
> > maintain.
> >
> >    Argillander
>
> How is A | B readable but not A & B or A ^ B?

Because that is just a way to express multiple / group of Flags and nothing
more. And thinking of this it could be even & operator. So we only allow
creating / enabling / disabling / toggling for a group of flags. Everything
still needs to be explicit. So we would end up with something like

```rust
    Flags::new(A | B);
    toggle(A | B);
    disable(A | B); // Or remove() (I do not have opinion)
    enable(A | B);

    // I would even consider & operator here as then you read it quite nice=
ly
    // toggle (A and B)
    toggle(A & B);
```

Most annoying thing with flags is that if you need to enable 8 flags then s=
ome
operator becomes a must. Still using those in everywhere is error prone and
confusing. So I totally agreed that we need some way to express group of fl=
ags
without always doing something like "t.enable(Flag::A).enable(Flag::B)"

If this way is used it is really nice that every function get's documentati=
on.
If we only allow | or & there is very little chance that someone mix what t=
hose
means as it is always documented function call. Using operators too freely =
feels
very C++ in my opinion. Rust is very explicit language so let's not change =
that
but let's still make it usable for our cases.

If this way is used it is really nice that every function get's documentati=
on.
If we only allow | or & there is very little chance that someone mix what t=
hose
means as it is always documented function call. Using operators too freely =
feels
very C++ in my opinion. Rust is very explicit language so let's not change =
that
but let's still make it usable for our cases.

    Argillander
