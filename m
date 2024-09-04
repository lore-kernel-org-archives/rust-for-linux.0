Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833303FE55
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Sep 2024 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725445983; cv=none; b=NusirLgRm1Ni14scswaItpyOmz6TI5we1i8s0HUitUP9jOMhBoLfUTuyIANCdCVB7qIAgiNgAUwoOZ+VQKkkh2aRCuUal66/NVDzaIFWhoGhD+mE7YUpMONWf697c9x8ReFZ6JaKy32Yt14p/pur/L3TFFkgH//BG8/TMX7q0wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725445983; c=relaxed/simple;
	bh=3AvC/HvopHDKWAFbhonJNcdID+9j3PuDBg2EN9cYUXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4OvpF+SonQnmNGPtBkriqZYMjabFq4OiIjlBdEOybYZemoabsr2qJWI+Ault8N1WYDhdZ28fNDXY/N8sDmmd9ke99gDBzMhEMnVXb6YEXjstncIJ4k8MX94q8lMvghfWUKX51e7ZiSl+XNGunLDTqgmcGN2z702/ISVRG7Utm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SfBp447m; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SfBp447m"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374ca7a10d4so1797656f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Sep 2024 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725445980; x=1726050780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE1/Hq11uOxchKULHphyn5S0kqPZsHWqE0/VF8WLruQ=;
        b=SfBp447mlIMOS2J7bGY3nhmcX0FnsiMWMJ+worm0mBjeh2AgS6bkC7iWTHSlFl/IcV
         fCl79wYB/NCwbiIm33h0bWoGpgiVvv/Wyk9SkeUrQZQ7ncdWxyrh7UD58RnuUWOquVVX
         Xm3YxyETuDzGaJvpX4kZlXk7IMSZGQPmb36llwMrmweltIXgEgD0K/NKhhU/RH8G/U2w
         iH2lxb2pDZpt6GDIRReyV/nwAXsGlpQaLyeNxo+eM/35DA9hhUFpX9Jh9dxAt41f8Kar
         6Aek3u5IbP6m1hRAhRciUP0WWgPItoRxj/kEWjFUB+rkaidqrQj8YcfrJ4ocDaydwAf5
         pBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445980; x=1726050780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE1/Hq11uOxchKULHphyn5S0kqPZsHWqE0/VF8WLruQ=;
        b=uB9r1OGiZ8VIu56cWx2Tn14YomeuAgE4bMD+zx3xBWd9TSsYCG+KPCba1s9up+lShY
         J/mIMOIVCrBr7ccMB4+KsUosLb0onAP5fJ4TjQN+Wm29qfVx4avKymT1AG+FJ8heFyQ/
         vDuBkZTGcbPSbCOAt21RlLAJr9yJUIsiMFqmMgNeCsgP+/zmmY2jDedBY2LPNH2eYoXa
         KbhLf+KF8FK8tERCYbRS/Oj5gS0je2pHfnrgp/+twBeoTjTwT4zeOvlsTm4aHeD7kiMC
         V5k7w8tbzsX/VyG6IBMejSz3ZasHo5pp5I+xhCSf/ghbh/f0+1PGLbrboVVzIVjvfhzB
         AFOg==
X-Forwarded-Encrypted: i=1; AJvYcCU9h5XK8DaN1VlSjsjDGfPSazlkCJ5DHXw3exepcBjxvT0FNlfBn1DjeR4SWLbWVJpHoKk16Bx/jF8A3SRM2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNt+pjvLF+VsVyz5IHHgWpSWMEfsmvsk+kWdbsB08hmgJumOab
	4vYM5kszIGmOOjBJXAG7dt/Uzbmp+Sr9+Bfk604UVvbT7jksKgyyXcNOeIRV2jQvOhIpFugCJfK
	aOPEvxuD72XYiUpCDate145Pb8NEzdRy1JMzy
X-Google-Smtp-Source: AGHT+IGsqhG20Xuaq75zLs5w9BXHd/1bEmZIuRJUXywMO5FqOhq7bmlArA7HxcoGVRmCM6y/SVZXTSj+THt/5F5OvRo=
X-Received: by 2002:adf:cd0e:0:b0:374:bfb2:39d with SMTP id
 ffacd0b85a97d-374bfb204e6mr9160088f8f.38.1725445979513; Wed, 04 Sep 2024
 03:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-static-mutex-v2-1-17fc32b20332@google.com>
 <10453342-d269-4b78-8962-821ef53d3cb5@proton.me> <CAH5fLgh-DYvXobXQVaQ9txYS4Rx8QhjyVvfTphk6vvnUOGzPnw@mail.gmail.com>
 <3b557f61-cead-4568-b2b4-4a56c4cbff52@proton.me> <CAH5fLggE-fWDuZXH_F3ixDSo7sQEFwnUV3cd+9_rpFH+XmnA2Q@mail.gmail.com>
 <CAH5fLgiZt3uVZiU1xXPcvYNR-Em2V3y+-C9EbsqrNvkScbiAYA@mail.gmail.com> <0030a292-49f4-4575-846f-424b098c7f1a@proton.me>
In-Reply-To: <0030a292-49f4-4575-846f-424b098c7f1a@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Sep 2024 12:32:47 +0200
Message-ID: <CAH5fLgh9kHm4XbcH2X4y6nwZ9VLYuUeu3hNmQBcdZ+Vx1H1L9w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add global lock support
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 12:17=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 02.09.24 13:42, Alice Ryhl wrote:
> > On Mon, Sep 2, 2024 at 1:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >>
> >> On Fri, Aug 30, 2024 at 3:22=E2=80=AFPM Benno Lossin <benno.lossin@pro=
ton.me> wrote:
> >>>
> >>> On 30.08.24 07:34, Alice Ryhl wrote:
> >>>> On Thu, Aug 29, 2024 at 8:17=E2=80=AFPM Benno Lossin <benno.lossin@p=
roton.me> wrote:
> >>>>>
> >>>>> On 27.08.24 10:41, Alice Ryhl wrote:
> >>>>>> For architectures that don't use all-zeros for the unlocked case, =
we
> >>>>>> will most likely have to hard-code the correct representation on t=
he
> >>>>>> Rust side.
> >>>>>
> >>>>> You mean in `unsafe_const_init`?
> >>>>
> >>>> No, I mean we would have `unsafe_const_new` directly set `state` to
> >>>> the right value and let `unsafe_const_init` be a no-op.
> >>>
> >>> But how do you set the right value of a list_head? The value will be
> >>> moved.
> >>
> >> Right ... we probably can't get around needing a macro. Can statics
> >> even reference themselves?
> >
> > Looks like they can:
> >
> > use std::ptr::addr_of;
> >
> > struct MyStruct {
> >     ptr: *const MyStruct,
> > }
> >
> > static mut MY_STRUCT: MyStruct =3D MyStruct {
> >     ptr: addr_of!(MY_STRUCT),
> > };
>
> That's useful to know...
> But I don't see a way to get pinned-init to work with this. I would need
> a lot of currently experimental features (const closures, const traits)
> and a way to initialize a static without providing a direct value, since
> I can't just do
>
>     static mut MY_STRUCT: MyStruct =3D {
>         unsafe { __pinned_init(addr_of_mut!(MY_STRUCT), /* initializer */=
) };
>         unsafe { addr_of!(MY_STRUCT).read() }
>     };
>
> It (rightfully) complains that I am initializing the static with itself.
>
> We /might/ be able to do something special for `Mutex`/ other locks, but
> I haven't tried yet. So the unsafe approach seems the best at the moment.

It sounds like we'll just want a macro that generates a global wrapped
in a Mutex/SpinLock for now ...

If we're going to do that, we could take the extra step and have it
generate special Guard and LockedBy types so that you can have a
LockedBy that doesn't need to make any runtime checks.

Alice
