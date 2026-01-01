Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EE24BBFD
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 22:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307855; cv=none; b=iqQAe8gDgJOlZqKt8v121VUyymUWTzSMawHERvaIdb3wpP46jg99E68E+r+M5K0UUk4jHFbrEICr/RzRFx/yBpj3Pm4YY8EXn+urj4h0N1zmfQyVDCm7FhEb78ck/3CrBWiXPnTYPTaQdXgeeGl6amHTyCOUzg2ESoPJeF/XcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307855; c=relaxed/simple;
	bh=mJR9yUdEYaRCpaar3ACIRSkGScpmPGUzRKf0shkYnBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQspXqg96rwfgpDkODhJHsyeVQAvufNExdVXeUcV88txUbntXFuoUwCX6j/X5t8kQx34fJSnG2cJVEmjxiPKfqwKr3Ch6jMX/JrPBAjQf4sBEAmflF3LEZ2/AR6FW1wfHeaC2UpRIx8WQF70Mx58VdQfUvmATFVYDOr3mVbxczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyhYkrCc; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyhYkrCc"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c363eb612so11868812a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 14:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767307853; x=1767912653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ttauW/VLLsAZEayOSfiVj/k5gt+bXd93Qof26ks/w=;
        b=OyhYkrCcFAQjM4zf8jt28U8sbZXdUvPSiB5rdcqB2Arur41XMobqQrW9ZLBQDlZ7zB
         p4xpDBW0nPfmORcMoCuD+snG/PMwo7LjV6o4Z1icoo746OzWV6ejmdtssUbV/SJjmSyV
         b1P2t0ynKtRtYETYWCopdjhgMQlTcThZsTlVM8sZ5fAl0IeHzIdjJ4+VRcZ75+ZnjNq0
         12r8rMkQv+SNGThcfrhSDlOGBJxrgsuLxBuPQEwb9RJ6k3zeeSaYPiYnKsDlDhKsagss
         z+Ndr34YrLcOrxvvw3upGxnsVPtxHzU71dEdBAzIxPcYCOPZcTJu4Qd4AIEbuvaZURZz
         Iszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767307853; x=1767912653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0ttauW/VLLsAZEayOSfiVj/k5gt+bXd93Qof26ks/w=;
        b=GHoS68yyWW/9Nv9kziEKFX0VCNM01DTE8fZgOeLKPdteX7ve7rmYu/IQ+you0dHe/5
         /GKm/9hw6AdjXMEW/j6C4DvChjGt4bOMkOgvf6n71pHceF6dKku8N7R0oV+a+DAzhFSR
         VvTqhVw86zjV6G3QFrP9xWmbaTCiRL8ogoDX/6Kq6c34IlWiQfz0AJ440nMvtQVD1bjA
         GrxLQQS7sW8rAfm92hXlNlsoOGtnZTuijPM2v60x1Dn3yXvRJP+rpax2TYYnLnG48Qsq
         CmSaKyjcThV44uXkx/F/Ye6DCxThXsT15xv+gGjnrQp5nICdz2srjfs7wtcHvxFx4JiP
         yFOw==
X-Forwarded-Encrypted: i=1; AJvYcCWo9BkT0KSTWve6VzTXhq0WuATLbwQYIrMD9bvSxN1PJokyQ2BWYuz4291xfL9wq0yxVlaB+/T+qSM3k5H34w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42B2lJlh3NyCubjdNY+yFlHY2z8WbalLsqMPI3F6PjM7PdlqD
	2oSwyguiLMgy7QkD8dy5Uo6VSjuSSxoXb3znTB4Q6LGgvL7xFU4bvVYjGHrblF9eWhKUCQCrZBh
	sOq9QMkc/TkruTS9P39aZXQf+fdJweVc=
X-Gm-Gg: AY/fxX4CK8WZWDLuYfcbC4ZON0uujX/F7A5I5oNs6Om9gk/83LV/OAWTIkRvrXlxWTF
	ouve3pqMzzmBFwyTOvZgTb7iMaB9UIBsOSsCql1g506LLf4pZibnMMq2WpDmhl7mQQcfaILg8gj
	U1E648hyzSPYeAJQ4HzAQxTz6wZGlXX+QFdI1JWcLao+EycMBYwd1pmppczzUbiT33SNiuewj37
	tk5WbcunySI4//38U5m79jMVk+NvvtLh3+QLyNNZ4ZICTXtVwMkGwZ22VyF4oQG/5DyBXLXjHSD
	0h4bpHtp8yIr/TUrE4UpnzOA+24=
X-Google-Smtp-Source: AGHT+IHv1/ea7pThwXQ0QLaZqqDMezO6OvUnJvW2PcQ4eUaGMnzCLTsRPAdzwmzp0YA6SptZVcr1EyRHUXQliEoi+hM=
X-Received: by 2002:a17:90b:3882:b0:340:d511:e167 with SMTP id
 98e67ed59e1d1-34e9207378fmr33344096a91.0.1767307852629; Thu, 01 Jan 2026
 14:50:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
 <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com> <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
In-Reply-To: <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 2 Jan 2026 00:50:36 +0200
X-Gm-Features: AQt7F2rHrCltn1KL0PVOaglB_QY7OXF0HCxSXF3ZNRnAhj18Qfgg8QiLGOMBKDQ
Message-ID: <CAC=eVgSW_zeYGwNhs05kSVa1MuszR1qyQe29nRJU7r7vznxo0A@mail.gmail.com>
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

to 1.1.2026 klo 23.39 Kari Argillander (kari.argillander@gmail.com) kirjoit=
ti:
>
> to 1.1.2026 klo 22.23 Daniel Almeida (daniel.almeida@collabora.com) kirjo=
itti:
> > > On 1 Jan 2026, at 16:14, Kari Argillander <kari.argillander@gmail.com=
> wrote:
> > >
> > > =EF=BB=BFOn Thu, 1 Jan 2026 at 20:21, Filipe Xavier <felipeaggger@gma=
il.com> wrote:
> > >
> > >> +/// // Combine multiple permissions using operation OR (`|`).
> > >> +/// let read_write: Permissions =3D Permission::Read | Permission::=
Write;
> > >> +///
> > >> +/// assert!(read_write.contains(Permission::Read));
> > >> +/// assert!(read_write.contains(Permission::Write));
> > >> +/// assert!(!read_write.contains(Permission::Execute));
> > >> +/// assert!(read_write.contains_any(Permission::Read | Permission::=
Execute));
> > >> +/// assert!(read_write.contains_all(Permission::Read | Permission::=
Write));
> > >> +///
> > >> +/// // Removing a permission with operation AND (`&`).
> > >> +/// let read_only: Permissions =3D read_write & Permission::Read;
> > >> +/// assert!(read_only.contains(Permission::Read));
> > >> +/// assert!(!read_only.contains(Permission::Write));
> > >> +///
> > >> +/// // Toggling permissions with XOR (`^`).
> > >> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
> > >> +/// assert!(!toggled.contains(Permission::Read));
> > >> +///
> > >> +/// // Inverting permissions with negation (`!`).
> > >> +/// let negated =3D !read_only;
> > >> +/// assert!(negated.contains(Permission::Write));
> > >> +/// assert!(!negated.contains(Permission::Read));
> > >
> > > I really like the OR (`|`) operator. Personally, I don=E2=80=99t like=
 anything
> > > else. When
> > > a function or expression gets longer, something like let negated =3D =
!read_only;
> > > already feels strange to read.
> > >
> > > My suggestion is that everything else should be functions, so we woul=
d write:
> > >
> > > ```rust
> > >    let xxx =3D Permission::Read | Permission::Write;
> > >    xxx.remove(Permission::Write | Permission::Read);
> > >    xxx.toggle(Permission::Execute);
> > >    xxx.invert();
> > > ```
> > >
> > > This way we avoid expressions like:
> > >
> > > ```rust
> > >    let a =3D !(!xxx | yyy ^ zzz);
> > > ```
> > >
> > =E2=80=9C
> > > At that point, no one understands what is really happening anymore. P=
eople start
> > > wondering whether operator precedence or evaluation order matters, an=
d may even
> > > have to go read the source code to figure it out.
> >
> > I disagree. How would that look like given your suggestion?
> >
> > >
> > > By only supporting OR (|) as an operator and expressing everything el=
se as
> > > explicit function calls, the code becomes much easier to read, review=
, and
> > > maintain.
> > >
> > >    Argillander
> >
> > How is A | B readable but not A & B or A ^ B?
>
> Because that is just a way to express multiple / group of Flags and nothi=
ng
> more. And thinking of this it could be even & operator. So we only allow
> creating / enabling / disabling / toggling for a group of flags. Everythi=
ng
> still needs to be explicit. So we would end up with something like
>
> ```rust
>     Flags::new(A | B);
>     toggle(A | B);
>     disable(A | B); // Or remove() (I do not have opinion)
>     enable(A | B);
>
>     // I would even consider & operator here as then you read it quite ni=
cely
>     // toggle (A and B)
>     toggle(A & B);
> ```

I tried implementing and my suggestion is something like this:

```rust
    let mut f =3D Flags::new(Flag::Read & Flag::Write);

    f.enable(Flag::Write & Flag::Execute)
     .toggle(Flag::Write & Flag::Execute)
     .invert()
     .invert();

    // ALL-of-these (built with &)
    assert!(!f.contains(Flag::Write & Flag::Execute));

    // ANY-of-these (built with |)
    // Could also be contains_any() (Personally not fan).
    // Or we can just do f.contains(Flag::Read) || f.contains(Flag::Execute=
)
    // But this is quite nice imo
    assert!(f.contains(Flag::Read | Flag::Execute));

    // Or single flag
    assert!(f.contains(Flag::Read));

    // By design these won't build as does not make sense.
    // let f =3D Flags::new(Flag::Read | Flag::Write);
    // f.enable(Flag::Read | Flag::Write);
    // f.toggle(Flag::Read | Flag::Write);
```

and you can try it yourself if wanted in [1]. I only played with the interf=
ace
and this is not ready for the kernel by any means.

[1]: https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D20=
24&gist=3Db90f6e6e92b02ed6b90cbf7e094e5d48
