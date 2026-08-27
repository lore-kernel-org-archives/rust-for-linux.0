Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC447ECDE
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842544; cv=pass; b=MzlpSXYQGgEXxx0ZUL3G7nRYCl+UEFCIJenHADtCrx3knP/+CXwt/EbPrDyJzjQbAJbuzP9POVyg74z3gH0+QKLYNcnqH/SsMosgKB0t3xN1sqaNN/8kHUo/xKH6FyIDLhsMQ14z5qavacsn93UhaRxR5FndJBz0mII/S5y8gEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842544; c=relaxed/simple;
	bh=j6Sbc277CLq+ttnOcBKE4l19KOSuBdsv4WwvfnBjzP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFphU30wbsn0mNiW1J2Sgk/eL23QtwtnZ1hSe+JfF8xmjMBvvFskzt6f64fRBZHDPLo0YCy/vGAu23YdcARuxObacgElPqSGoQT87qcpSwOaRygvYZV8g7Iebe8vCu8MQRrlinbmsktHXMZLmS08o3Wwpn1crB/WjaPaTlzELZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DK1EMGFw; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DK1EMGFw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e5733a5aso1134594f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 07:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842533; cv=none;
        d=google.com; s=arc-20260327;
        b=DvyHo9uTTeNG7AFCZuNjbBF/jcwH5TzkWsNKx9NggOhkiJ7jOuo+K8f3k7AMg00ey7
         P5d09fCh+ULjalnP9DPpl8wshVL6FPiNCn6cDGsySCkFY1CXkqu+5/Dz6vBPFcN4vGKB
         m32sCxxMzgFAdah0Oyomcmk1LsqeBhCqPVACdqHFV6Kzy94EEMTrmUhPt9IKdOIJGrgE
         LUPLYBExc/dH6vlzLSllMYra8hka/UtcbO1RZDisAMpQ5FIX9F1WoDB7dvNPObPiqsSy
         ZdpkSn81027iZCyEn3EVy92Xn3X8CQOKilGCbt70max9dQCP0Mt+UgBWBUCxNBYVepJd
         A/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qVBhIMzhe7WHb1kI7rr6+dI+gx2GywitZXgSUgINjAg=;
        fh=D8XeLFLGVct56jkTvjmcTIuOczdH8VmJO4i4g/S6sM8=;
        b=UmK4XVUxwPwmo0hIsrRtzETE72TOexoriSP+h6kQIX5u/pE08AV47+fOiAka8WAWxY
         id85X1i4U8RV58mYgpaYyxoUiGCCieedjxi2R+8bb/PeTDMl3hHsHyBqaCPOeWgPVr8M
         idUEx/T9ZXpS5UoI/kehO7gWKDf+pFYB2KKBSTgxMQr1WPpi1NWQ0WD7MSHFFAhNt8Ly
         HAdeSS203VHlt5cszPd6G8ORzj048bfRJSm7iFrQQEXBAHXF/yS/blsfSPV4kTvc6rME
         XfbENT6xbBTwfS9YBGHt84lKMPntSlihUL6ZgMt0FZL60hDRbIiz1mbSLFfGy2uC9HSp
         5u7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842533; x=1788447333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qVBhIMzhe7WHb1kI7rr6+dI+gx2GywitZXgSUgINjAg=;
        b=DK1EMGFw1f9U58BlCc5eaMqCOSju1U86UDe040up/EKvfkqguTEpRfyFp2ePrBT182
         eHj1yI9Fu20rbvzBSKIEbbii/xCt4KtNxG1Vq034sgnvLJeuCYuVYZ295PnwHjVvwsuh
         w0EhFtdf5OQHcTYak7I3yWESizw7QApo8cgaH8+tHCpGnXlATC9xF5IyUistTa5T/sqy
         b2N2t4yNfjdtV284HO5cPPzrGcYa8vfgpzZmiwyfGyr3e2wDsGYS9Jf+cd8q4XRVHxvy
         8TkO/Rl4SSUkySTjFbZGHgoJ8COxbEMTWntMg3jI9k8OdAb5FyD1/gbIQUNzsqOhJIZz
         xXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842533; x=1788447333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVBhIMzhe7WHb1kI7rr6+dI+gx2GywitZXgSUgINjAg=;
        b=WTeyAtdhHMOdAtnYWjxPVQU/M5fJIFDaomIVVSrSIxnH2GDHADn4dqXDmug1009Hd3
         hKyvPAvAV26qlz1qYtBlwdMKsgDCzIhJCmbyCCpZ3QljUZRjG/oCozjhzJowwDpeivKy
         Gul4aSuvzJBWQ8HAZ1q1VRux2Guyvx5hXnI/f1QcYybA+BDBnigOI3hT6/fKDd8d3tLW
         /2pI4WiBYFoC0U3rZyUcQFX0RdtsMZee+uaU5Qvsh05xpsTO48hKiHtlkrEyyfIug9Gm
         jC/MR/m8WaGMI+OSpgm9NyIrIpm0GUKRiyPBhCvJtHBKNRWf3Nwpt6OoauC/o51+vd54
         DpAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpH9Mer9WYazR9Bl7oNUtb2KjZHLDPwFrS9CVCPgvZDnckPUOnQbJoHmJnZ/5dHIKwjt62oyn+fKd9ub82rgA==@vger.kernel.org
X-Gm-Message-State: AFuF++ko3heWMF1HFDU7ghJpCIbIF+LZEOhsVY0KTjV54N3OQb13KGUi
	57NR8aMqNsWrnyHvoB3TyYnc+xmsjVPByNC7Bg+6FaABon2JfFU11M5CDEZ0kf4Ht9+ePCOUhCR
	YEmZjkdIhLF+lrpuzxca2URnP46F2SwS+GYjPd/kY
X-Gm-Gg: AR+sD11XuMPy3PotW+QoXsO6xufVhVnq5+ZmPgspfZ/cIrVZUEu21Uabp7iHppF4H58
	wJ8NE1kWJFSfNY7+NORGT9prPjb2Fxkew9sOeq34QIWT6FPDW5OHFh9MbIrABXM3zdu3R9WrT2V
	4TU2aac/3JgK3ie7fSE5tv4yeI+YGeZpeGW/GBz/SIEOPlHKwtKHAKp2MlDQdMG17VLN0mov7kO
	K37asW7u7LMK4RDD7hrpCeX+0Eurl4nU70RoBvSXgTeMoaSTOnxiUanUklSLtKPoCx4gmTr0JI2
	++oIh5kNZPQoBsi87BaRKT5DUC1qrKp5NiVsK4MN9UE1Q3Y/NOnZqE1SezDCvwZEIeIET+b7rpX
	b87R1Suue3CuqU8ti8jCLo/IsB1l1Tl4=
X-Received: by 2002:a05:6000:3106:b0:482:e2f2:19c5 with SMTP id
 ffacd0b85a97d-482e2f21d8dmr18185624f8f.4.1787842532050; Thu, 27 Aug 2026
 07:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
 <apAEK9CUZICDTL1i@google.com> <DKZNWJZTS063.3Q91LQ4LNE4Q6@nvidia.com>
 <DKZOJLLRFT75.1967F9U9JUTVV@nvidia.com> <DKZRUNURZ645.1R1EVJ9ZEXFDE@nvidia.com>
 <DKZSPZS1CQ29.11DHEBVKWF21O@nvidia.com> <DKZSWB7OFDRY.1QKAIFC1QP9RA@garyguo.net>
In-Reply-To: <DKZSWB7OFDRY.1QKAIFC1QP9RA@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Aug 2026 16:55:19 +0200
X-Gm-Features: AcwNN1W6xr0Wm3p3I71rq2uMxpgrJyrhaLEP44TiP1BL4sxWyBuOjb97Iy1a-84
Message-ID: <CAH5fLgiGcOn+HQLj4w9yDc31V54PbqNUQv8cUFRoEuFzQrAAZA@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] rust: num: add cv! macro to create values from
 constant expressions
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:37=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Aug 27, 2026 at 3:29 PM BST, Alexandre Courbot wrote:
> > On Thu Aug 27, 2026 at 10:48 PM JST, Eliot Courtney wrote:
> >> On Thu Aug 27, 2026 at 8:12 PM JST, Alexandre Courbot wrote:
> >>> On Thu Aug 27, 2026 at 7:42 PM JST, Alexandre Courbot wrote:
> >>>> On Thu Aug 27, 2026 at 6:32 PM JST, Alice Ryhl wrote:
> >>>>> On Thu, Aug 27, 2026 at 04:28:31PM +0900, Eliot Courtney wrote:
> >>>>>> Currently, using NonZero/Bounded constants is quite verbose. It's
> >>>>>> unfortunate because it disincentivizes using it in interface bound=
aries.
> >>>>>> Introduce a macro to make it nicer to use. The macro `cv!` (for co=
nstant
> >>>>>> value) takes a const integer expression and widens it to i128 (at =
build
> >>>>>> time only) before passing it as a const generic value to a new tra=
it
> >>>>>> function `FromConst::from_const`. The trait is implemented by NonZ=
ero,
> >>>>>> Bounded, and Alignment and lets values of each be constructed from
> >>>>>> constants without a verbose turbofish syntax. For example,
> >>>>>> `const { NonZero::new(1).unwrap() }` can be written as `cv!(1)`.
> >>>>>>
> >>>>>> Suggested-by: Gary Guo <gary@garyguo.net>
> >>>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >>>>>
> >>>>> This doesn't work in const context, so I don't think this is a grea=
t
> >>>>> strategy.
> >>>>>
> >>>>> I would want to use it for cases like this:
> >>>>>
> >>>>> drivers/android/binder/netlink.rs
> >>>>>         const BINDER_CMD_REPORT: u8 =3D kernel::uapi::BINDER_CMD_RE=
PORT as u8;
> >>>>>         const BINDER_A_REPORT_ERROR: c_int =3D kernel::uapi::BINDER=
_A_REPORT_ERROR as c_int;
> >>>>>         const BINDER_A_REPORT_CONTEXT: c_int =3D kernel::uapi::BIND=
ER_A_REPORT_CONTEXT as c_int;
> >>>>>         const BINDER_A_REPORT_FROM_PID: c_int =3D kernel::uapi::BIN=
DER_A_REPORT_FROM_PID as c_int;
> >>>>>         const BINDER_A_REPORT_FROM_TID: c_int =3D kernel::uapi::BIN=
DER_A_REPORT_FROM_TID as c_int;
> >>>>>         const BINDER_A_REPORT_TO_PID: c_int =3D kernel::uapi::BINDE=
R_A_REPORT_TO_PID as c_int;
> >>>>>         const BINDER_A_REPORT_TO_TID: c_int =3D kernel::uapi::BINDE=
R_A_REPORT_TO_TID as c_int;
> >>>>>         const BINDER_A_REPORT_IS_REPLY: c_int =3D kernel::uapi::BIN=
DER_A_REPORT_IS_REPLY as c_int;
> >>>>>         const BINDER_A_REPORT_FLAGS: c_int =3D kernel::uapi::BINDER=
_A_REPORT_FLAGS as c_int;
> >>>>>         const BINDER_A_REPORT_CODE: c_int =3D kernel::uapi::BINDER_=
A_REPORT_CODE as c_int;
> >>>>>         const BINDER_A_REPORT_DATA_SIZE: c_int =3D kernel::uapi::BI=
NDER_A_REPORT_DATA_SIZE as c_int;
> >>>>
> >>>> `const_as!` [1] should do the trick for this, provided you don't nee=
d to
> >>>> create a const `NonZero`.
> >>>>
> >>>> [1] https://lore.kernel.org/all/20260825-const_as-v1-1-1ce712225fe2@=
nvidia.com/
> >>>
> >>> ... but I agree it would be nice to be able to use this in const
> >>> context. And there is an overlap with `const_as!` that becomes more
> >>> obvious the more I look at it.
> >>>
> >>> In for a penny, in for a pound of macro code as they say. Since we
> >>> agreed on using macros, how about unifying both under the same `cv!`
> >>> macro, with as many branches as we have types we want to initialize f=
rom
> >>> a constant value? For instance:
> >>>
> >>>     // Does what `const_as!` currently does under the hood.
> >>>     const BINDER_CMD_REPORT: u8 =3D cv!(u8::from(kernel::uapi::BINDER=
_CMD_REPORT));
> >>>     // Calls `NonZero::new().unwrap()` under the hood.
> >>>     const SOME_NONZERO: NonZero<u8> =3D cv!(NonZero::new(kernel::uapi=
::NONZERO_VALUE));
> >>>     // Calls `Bounded::new::<{ ...}>()` under the hood.
> >>>     const SOME_BOUNDED: Bounded<u32, 2> =3D cv!(Bounded::new(kernel::=
uapi::SMALL_VALUE));
> >>>
> >>> I.e. we would have one extra matching arm in `cv!` per type it handle=
s
> >>> instead of implementing a trait. The syntax of the macro would look m=
ore
> >>> natural (bye bye `const_as`'s awkward `=3D>`), albeit it would have t=
he
> >>> limitations of such a semantic dispatch.
> >>>
> >>> Even the name `const_as!` wasn't really accurate to begin with: what =
it
> >>> really emulates is a const `try_from`, and we even discussed
> >>> implementing it in these terms in the future.
> >>>
> >>> I'm sure the idea needs more polishing but I think there's something =
to
> >>> explore here.
> >>
> >> Yeah I agree that const_as! is similar and if we had const traits we
> >> could fully merge them and have it always work in a const context for
> >> both duties (which are really a const tryfrom as you said).
> >>
> >> I am not sure about the suggested syntax (e.g.
> >> cv!(Bounded::new(kernel::uapi::SMALL_VALUE))), since it seems very
> >> verbose.
> >
> > A bit, but what I like is that it looks very close to what you would
> > naturally write if you had const traits (minus the unwraps), so you
> > don't have to learn a new syntax. As long as it's not *more* verbose
> > than natural Rust, I think it's fine.
> >
> > It also has the benefit of relying less on type inference, i.e. `cv!(5)=
`
> > requires the caller to specify the type even with a `let` statement,
> > whereas you could do `let v =3D cv!(NonZero::new(5));` and it would wor=
k
> > as expected.
>
> Even with const try_from we'd still want `cv!()` to avoid having to write
>
>     const { Type::try_from(...).unwrap() }
>
> I think having `=3D>` syntax is great because it is a good place to *opti=
onally*
> require type annotation.
>
> For enum repr for example, I think it'd be great that
>
>     const BINDER_CMD_REPORT: u8 =3D cv!(kernel::uapi::BINDER_CMD_REPORT);
>
> would work directly. It might need some tricks, which I have hard time co=
ming up
> as I'm not feeling very well today, but I'll give it a shot over the week=
end...

One could potentially define a trait with a MIN and MAX value
constant, and then implement cv! like this:

1. Verify that the value lies between MIN and MAX.
2. Cast the value to uNN of the same size as the target type.
3. Transmute the uNN to the target type.

Since the trait has no methods, this works in const eval.

Alice
