Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAB1EA65
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 01:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767402928; cv=none; b=rCuh8KwqCXrTcBho8JbTQDZqUcPKZJUI+9jUjgSSh0oUP31GFoWyYY+iHuocsgF4nAqsegs8TRUf5ya5cQ75j9s5PJnpJoLadaT0YrT5Jk6naTeTwN6cj3aGjah61aI5lwzY6XWSFXao9N5Enxi3HAM84DIgMgfi0fbVKsbMFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767402928; c=relaxed/simple;
	bh=QTARhEJFSTGPsOzXe/OtuPsuhBEhi+O/7Bh3fR3pyUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMCFV0xRPPhETF7ceZn1I2+5/bt5wg8lZbzyUOv6rgbPIxmVoB+TmsChlYzA1B1ZMD09GjeNh/vcBX+/OSWqOSnh0lXcyVBQQboGBn8+XlmCsBkSNEZ1jabwTaKMzG9jdkaq7wAQoSMlEbki2nSdZF5Ju3kT5HFKSheQHz5W/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtVYMx4q; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtVYMx4q"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so13420933a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 17:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767402926; x=1768007726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiIFd69Z/eoWAamcI85TAhCk1Ks8rrGMYMOPHSRq7hU=;
        b=NtVYMx4qZ70JwqK4YtdyYUe3YVLc4bm1Ya3FeAUnazVwwyG/MJyMHOr1+TFW2znCFk
         M1U/kRocfNob2IztILbrfBIyTSXHb/SGV5j0nXgQr1eM24eFNRpE1Eq52hzAjNSUxpaE
         JHLIjigOofn0Qsrs+FUhdN6+WmijNjEIgLj6UcyKM30ZvExFBZW3ytc4HamYHTT3DRxS
         hGqrPCFOXjmUdasnEjPkaEBgNxy6KQkCeDTr3KJpQyv73F2pVFL4az0mzxxvU75x8TyV
         YoQOrxzU8CsDH0mDiU5XQ1yJ1xFWGzh32U9ZhZw7Fbf6ezaZuzFormMp+5X6Uef5ZIYr
         dZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767402926; x=1768007726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiIFd69Z/eoWAamcI85TAhCk1Ks8rrGMYMOPHSRq7hU=;
        b=MxEHR2IIcDU8ms04kBxQ0GBJcKYxLmsFB/2BKHdRfJLpo9BbLBY6Xf2q+R+VW5VB+w
         mGIF/K53iiWLP4O404EntxezvTBKuOVgb+VMOKLGJZGeNjp8Uwt/HHR9bGOgmcfIGEpk
         45+ZuccIoIpli34kU4aKoDxEoH+UStnzu9O4SlWhDqpfjkpm1HZ+rM2NKaWPJi3LU76Z
         paAW/wzUOJqhOpR9b8VSuKoz1Qmj1o+IkeDEt7WDSkNxPglfCJR7vgRzxvI4cW4Vndab
         LyMuxcMgi8QyfWCIxlaykXcL6G9iUwA79QKc27LQn9EZGlQCqSKPVrzB0iuXbghO05za
         ULgw==
X-Forwarded-Encrypted: i=1; AJvYcCXiMMh6xoDeKV1A/+PXXIo10/TsDlGxf27oepaqwz23UOEcm5ifPocsN5FkUmUlqgnwNdF7k5GYE++MRhMcTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/N0aAR/jPHN2LZBmffTyCR6XmtKwe9G3XosbcMLlBLfNtFxQ
	v5vFx/VKljPGbD08wrWn75FMMqcIvBbavH4p0NAu1x5XMuAozcQT+AOxc+ThGhRnrsHGNvqpeu0
	Wxomx50oibcM7MkEkXx01BQR6Efe3RFw=
X-Gm-Gg: AY/fxX5iOBJJkRsib4eWVOtmhbjb3KXZjJ447ap2ESn4RruznnH12rtE3mdsAN/pIoy
	1xIwWp0j98cn0rWGuRVKQwUELhtZjA61njz6H/Cg1KkMbhIB7fw1prQDTqAcFARVDUS/YIBUMST
	LvsthB7CPSfWFEyM35+Yq0IJ/5Zu5WbicjlCaUAFx7J/f1gqDqvCVGMmz3EPE0NzRF3CSXDqmyd
	YX9R6hxwbrJCWyqElO6NSp6x6hnsotDgswjhv6WgOpuB4NqCUCiEw+EI+PhawUJ97J35fx1VnYI
	CUik7iilpL6qriy1pNurPGLRA0E=
X-Google-Smtp-Source: AGHT+IGEtM7wos8GvJOVgaGDn17Kk0w8djxpcf3i+mo3RvyJT0CGLPD87eMQpabQjb8cWiTVLyqlTTowmIsaXLH7tK4=
X-Received: by 2002:a17:90b:5804:b0:34c:a29d:992f with SMTP id
 98e67ed59e1d1-34e921ce52emr34410010a91.31.1767402925980; Fri, 02 Jan 2026
 17:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
 <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com> <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
 <88BAA5DC-6025-45E4-88E8-396113766D32@collabora.com>
In-Reply-To: <88BAA5DC-6025-45E4-88E8-396113766D32@collabora.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 3 Jan 2026 03:15:10 +0200
X-Gm-Features: AQt7F2qGbJJpMfXMPuNRThfy1shzhQvtXfweIh-u0J40OUhz9pK-_Ix2ZhfkZHo
Message-ID: <CAC=eVgSKwqxpEPPNv++ipHGJpNE9TxjdWK91N+wDR=L3RibK2A@mail.gmail.com>
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

On 2.1.2026 16.44 Daniel Almeida (daniel.almeida@collabora.com) wrote:
> > On 1 Jan 2026, at 18:39, Kari Argillander <kari.argillander@gmail.com> =
wrote:
> >
> > to 1.1.2026 klo 22.23 Daniel Almeida (daniel.almeida@collabora.com) kir=
joitti:
> >>> On 1 Jan 2026, at 16:14, Kari Argillander <kari.argillander@gmail.com=
> wrote:
> >>>
> >>> =EF=BB=BFOn Thu, 1 Jan 2026 at 20:21, Filipe Xavier <felipeaggger@gma=
il.com> wrote:
> >>>
> >>>> +/// // Combine multiple permissions using operation OR (`|`).
> >>>> +/// let read_write: Permissions =3D Permission::Read | Permission::=
Write;
> >>>> +///
> >>>> +/// assert!(read_write.contains(Permission::Read));
> >>>> +/// assert!(read_write.contains(Permission::Write));
> >>>> +/// assert!(!read_write.contains(Permission::Execute));
> >>>> +/// assert!(read_write.contains_any(Permission::Read | Permission::=
Execute));
> >>>> +/// assert!(read_write.contains_all(Permission::Read | Permission::=
Write));
> >>>> +///
> >>>> +/// // Removing a permission with operation AND (`&`).
> >>>> +/// let read_only: Permissions =3D read_write & Permission::Read;
> >>>> +/// assert!(read_only.contains(Permission::Read));
> >>>> +/// assert!(!read_only.contains(Permission::Write));
> >>>> +///
> >>>> +/// // Toggling permissions with XOR (`^`).
> >>>> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
> >>>> +/// assert!(!toggled.contains(Permission::Read));
> >>>> +///
> >>>> +/// // Inverting permissions with negation (`!`).
> >>>> +/// let negated =3D !read_only;
> >>>> +/// assert!(negated.contains(Permission::Write));
> >>>> +/// assert!(!negated.contains(Permission::Read));
> >>>
> >>> I really like the OR (`|`) operator. Personally, I don=E2=80=99t like=
 anything
> >>> else. When
> >>> a function or expression gets longer, something like let negated =3D =
!read_only;
> >>> already feels strange to read.
> >>>
> >>> My suggestion is that everything else should be functions, so we woul=
d write:
> >>>
> >>> ```rust
> >>>   let xxx =3D Permission::Read | Permission::Write;
> >>>   xxx.remove(Permission::Write | Permission::Read);
> >>>   xxx.toggle(Permission::Execute);
> >>>   xxx.invert();
> >>> ```
> >>>
> >>> This way we avoid expressions like:
> >>>
> >>> ```rust
> >>>   let a =3D !(!xxx | yyy ^ zzz);
> >>> ```
> >>>
> >> =E2=80=9C
> >>> At that point, no one understands what is really happening anymore. P=
eople start
> >>> wondering whether operator precedence or evaluation order matters, an=
d may even
> >>> have to go read the source code to figure it out.
>
>
> Then don=E2=80=99t write convoluted expressions=E2=80=A6it=E2=80=99s not =
something you can
> fix at the language level.

I disagree. Rust already fix lot of problems at language level. This sounds
to me it is the same as "Then don't write memory bugs, it's not something
you can fix at the language level". And Rust still did it.

> What=E2=80=99s your take on the boolean operators, by the way?

They are very nice. I do not see how this is relevant.

> >> I disagree. How would that look like given your suggestion?
> >>
> >>>
> >>> By only supporting OR (|) as an operator and expressing everything el=
se as
> >>> explicit function calls, the code becomes much easier to read, review=
, and
> >>> maintain.
> >>>
> >>>   Argillander
> >>
> >> How is A | B readable but not A & B or A ^ B?
> >
> > Because that is just a way to express multiple / group of Flags and not=
hing
> > more. And thinking of this it could be even & operator. So we only allo=
w
>
> So A | B is =E2=80=9Cjust a way to express multiple flags=E2=80=9D instea=
d of the much
> more obvious A OR B? Same for A & B .
>
> > creating / enabling / disabling / toggling for a group of flags. Everyt=
hing
> > still needs to be explicit. So we would end up with something like
> >
> > ```rust
> >    Flags::new(A | B);
>
> This is _much_ more straightforward:
>
> +/// // Combine multiple permissions using operation OR (`|`).
> +/// let read_write: Permissions =3D Permission::Read | Permission::Write=
;
>
> >    toggle(A | B);
> >    disable(A | B); // Or remove() (I do not have opinion)
> >    enable(A | B);
>
> Now we have to break extremely straightforward operations into multiple
> function calls. This is not ergonomic.
>
> >
> >    // I would even consider & operator here as then you read it quite n=
icely
> >    // toggle (A and B)
> >    toggle(A & B);
> > ```
>
> Sorry, I don=E2=80=99t buy this syntax at all. What=E2=80=99s the differe=
nce between A | B vs
> A & B in your proposal?

Following is a problem in my opinion. Rust use | for OR in match statements=
.
So if we do bitflag operations it looks quite strange when we do this:

```
    const WRITE_READ: Permissions =3D Permission::Write | Permission::Read;
    match permissions {
        Permissions::None =3D> println!("None"),
        Permissions::All =3D> println!("All"),
        Permission::Write | Permission::Read =3D> println!("Write or read")=
,
        WRITE_READ=3D>  println!("Write and read"),
        _ =3D> {},
    }
```

This has actually been documented in rust bitflags [1]. I also think we sho=
uld
document this somewhere because this is not very obvious in Rust.

[1]: https://docs.rs/bitflags/latest/bitflags/macro.bitflags_match.html

> >
> > Most annoying thing with flags is that if you need to enable 8 flags th=
en some
> > operator becomes a must. Still using those in everywhere is error prone=
 and
>
> So you=E2=80=99re proposing both operators and these functions?
>
> > confusing. So I totally agreed that we need some way to express group o=
f flags
> > without always doing something like "t.enable(Flag::A).enable(Flag::B)"
> >
> > If this way is used it is really nice that every function get's documen=
tation.
>
> We do *not* need documentation for =E2=80=9Ctoggle()=E2=80=9D, =E2=80=9Ci=
nvert()=E2=80=9D and friends.
>
>
> > If we only allow | or & there is very little chance that someone mix wh=
at those
> > means as it is always documented function call. Using operators too fre=
ely feels
>
> No kernel developer is ever going to get confused by basic bitwise operat=
ions.

Most developers just need to write drivers.

> > very C++ in my opinion. Rust is very explicit language so let's not cha=
nge that
>
> How is C++ relevant here? Bitwise ops are used all over the place in C to=
o.

Sorry for my bad words here. I meant C++ operator overloads, not
bitwise operations
themself. Those are used very freely in many places So you actually do
not know what
even "+ operators" do anymore.

> > but let's still make it usable for our cases.
>
> The language specifically allows us to build this API, so I see no proble=
m with
> the current approach. Your implementation is, in my humble opinion, a dow=
ngrade
> w.r.t to what has been developed so far: it changes a syntax that everyon=
e
> understands in order to solve a problem that doesn=E2=80=99t really exist=
.

bitwise operations are backed in C. In Rust you really have to know
that now this
struct supports bitwise operations. That is not so obvious in Rust
that you can do
those operations for non-integer types.

But probably there is no point continue discussion as two people has nacked
my suggestion so fast and I'm totally ok with it. Still thanks for
taking time on this.

    Argillander
