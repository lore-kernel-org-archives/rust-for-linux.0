Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217D1C3BEA
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737551204; cv=none; b=FZO66Z4CAyHHoebFRmTjYkri5sqj35BVSjxpdIxoUuGjkGoBw3E1qvW7Ka7u1SibbOdKwLfBJuj3p8si8vSYV5Qqx7M6NOkkqyvx1fWQf+o5KDzpLjw6DQGy+a6/m9V0Mnb/Zqrj0nUixTr+HXIRMPQ7/VQollw55WeOTTvuRi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737551204; c=relaxed/simple;
	bh=1ETw9IhqG56jtRaLYaznqKWTKflYxqe5PAOOpJgRzNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ux5+jiZ27ccsVQPH3nztqphn7ImufapriTfMF2kz9ujGxcu7LyU3etIL4GXlHF1DoW+OZv8LXd+b5WMmlv/5LLYGFrEvpXTNkXbzeJQsluHwi+Jjn0a1NdZ1SrCeUueq64kLsigABvypcixKr0e+N/0LkuOqqDWa6qi5BvJX9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ssxlm+0J; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ssxlm+0J"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso5598988f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737551201; x=1738156001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTeqbnzz8YvyGJljY2CjmvIj9MNXNnmVnmAhWiCCGY8=;
        b=Ssxlm+0Jhs0g3LlCKEfaUccGV9AMGtb2IbQXhxHmHsLaRhBMnrtoiNDt34R49S/LqL
         cFzTCNi+gaHpBLTNIqgzcUTqJ/qX+8bDnbWDK4/G9nDd6LdJUivpLCKDaczDKvbBQ5yd
         +G4ktyYeyjuiTgysL16chURc4x/uLN1lnGopO759vLuD5QxZlPfty9w4jfu7eyhpgweW
         6uFc7vxnh+zde8zPYkYQ7+/nczB2CeO2FOPpMPO/zTNTARGWsWmevgB8D1gP4hoUnyT0
         eEM23QWjwpQrKAJL197ER8HJsfsOrcjg7nfAuIe+E8RbsiZCj1jk3JaeLP6HQgITwO5j
         dIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737551201; x=1738156001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTeqbnzz8YvyGJljY2CjmvIj9MNXNnmVnmAhWiCCGY8=;
        b=DWnAJcuN2xN7rh/p7f1N9LvfeNBViIn7lgSegnLm/8pDtJ3xfUQPkj800tsFB68LTk
         sapWoGKI5KHObAHL0qQoyXtFAzigBef4ikvoD+cbtnTG2Im+r/4hwwNOXg22NxYlF33j
         qSbUpkbSbLYR+bv3LFQEKe3pvXsuvmaua5L8XwBu5qtfyLOSUS4h5nJxwcdDNGcyL4Gt
         na9baOmEsDEJdX+fTYyCYqWH7tlhhAnZYUdPpxiHv//+kFxuvfCrBKZWpPk5uAEy7LxN
         A3JTmQFMo6+8seVcYzqLQdKHd8mWNFh/ueToOibiVDJdGe/ZychMYLRQJ39xszOClNPi
         9vyg==
X-Forwarded-Encrypted: i=1; AJvYcCUjL9L4UgY34Y1Bh+JgGZBQKPmXMiBYccIl20A/7YHzTS9Wxtg24guFyZUcJWGR1+p5AjnCcJVRwpnqoIUMLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnca3C3Wv0+RavtuVM/9+Takk+WjAxmKSkyUZcd3DlEz8jgjI
	QAmPvv921C7Irw8ipqdoNiQWURgzfjmophNbiDnH/yEcCHwxAxrO2JbILeryxZQxN5v9m8cJE+r
	gLEUO45r0PU44lKCcuZw4F64cxoSr5i8MGFMq
X-Gm-Gg: ASbGncs/9kshpni2rfyr1yZiP/Y6zSmy+0LTOsCJM5MQIXkVgWkRzd6FFkeQ1Iiy9Ue
	nMMt6uU8wFG2CP5P67mgP1bPbi3OZO1VPs2R0Ghpp6/U2hUYsyWmAl+6527teXQ+s9GnKjAo16A
	IE1LDA
X-Google-Smtp-Source: AGHT+IH6a9t4mm+ItelXmoZC7p3SHzSdGTwG2NyjoO9vrBE9ehu6+FqSSIw5SWXmqXpEkD3TPyBZOBjAkXZhgNxpLyo=
X-Received: by 2002:adf:f545:0:b0:386:1ab5:f0e1 with SMTP id
 ffacd0b85a97d-38bf5659a86mr18301142f8f.14.1737551201239; Wed, 22 Jan 2025
 05:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <2025012243-myspace-woof-1d1e@gregkh> <CAH5fLgh7QyVSgqJZM-krHmF87c76a84Cg6PyT47TYjMsN9iwZg@mail.gmail.com>
 <2025012236-tall-untried-1d7c@gregkh>
In-Reply-To: <2025012236-tall-untried-1d7c@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 14:06:29 +0100
X-Gm-Features: AWEUYZlhTjA7DXh2zWN-i4GkWfb4qbSeTLkVOzFsHMw28wHweCCufLQj_r9t1CI
Message-ID: <CAH5fLggZ-7Rb=98JF+KkieY_H13mRVLB+T1umOrQib3ah78M-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to MiscDeviceRegistration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 22, 2025 at 11:11:07AM +0100, Alice Ryhl wrote:
> > On Wed, Jan 22, 2025 at 10:28=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
> > > > When using the Rust miscdevice bindings, you generally embed the
> > > > MiscDeviceRegistration within another struct:
> > > >
> > > > struct MyDriverData {
> > > >     data: SomeOtherData,
> > > >     misc: MiscDeviceRegistration<MyMiscFile>
> > > > }
> > > >
> > > > In the `fops->open` callback of the miscdevice, you are given a
> > > > reference to the registration, which allows you to access its field=
s.
> > > > For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
> > > > accessor to pull out miscdevice::this_device") you can access the
> > > > internal `struct device`. However, there is still no way to access =
the
> > > > `data` field in the above example, because you only have a referenc=
e to
> > > > the registration.
> > >
> > > What's wrong with the driver_data pointer in the misc device structur=
e?
> > > Shouldn't you be in control of that as you are a misc driver owner?  =
Or
> > > does the misc core handle this I can't recall at the moment, sorry.
> >
> > There's no such pointer in struct miscdevice?
>
> struct miscdevice->struct device->driver_data;
>
> But in digging, this might not be "allowed" for a misc driver to do, I
> can't remember anymore, sorry.
>
> > > > Using container_of is also not possible to do safely. For example, =
if
> > > > the destructor of `MyDriverData` runs, then the destructor of `data=
`
> > > > would run before the miscdevice is deregistered, so using container=
_of
> > > > to access `data` from `fops->open` could result in a UAF. A similar
> > > > problem can happen on initialization if `misc` is not the last fiel=
d to
> > > > be initialized.
> > > >
> > > > To provide a safe way to access user-defined data stored next to th=
e
> > > > `struct miscdevice`, make `MiscDeviceRegistration` into a container=
 that
> > > > can store a user-provided piece of data. This way, `fops->open` can
> > > > access that data via the registration, since the data is stored ins=
ide
> > > > the registration.
> > >
> > > "next to" feels odd, that's what a container_of is for, but be carefu=
l
> > > as to who owns the lifecycle of the object you are trying to get to.
> > > You can't have multiple objects with different lifecycles in the same
> > > structure (i.e. don't mix a misc device and a platform device togethe=
r).
> >
> > Ultimately, this is intended to solve the problem that container_of
> > solves in C. Actually using container_of runs into the challenge that
> > you have no way of knowing if those other fields are still valid.
>
> You "know" they are valid if you have a pointer to your structure,
> right?  Someone sent that to you, so by virtue of that it has to be
> valid.
>
> > If
> > the destructor of the struct starts running, then it might have
> > destroyed some of the fields, but not yet have destroyed the
> > miscdevice field. Since you can't know if the rest of the struct is
> > still valid, it's not safe to use container_of.
>
> That's a different issue, that's a lifetime issue of "can I look at
> these other fields at this point in time and trust them", it's not a
> "these are not valid thing to look at".

The memory containing the field can't have been deallocated yet, but
if we provide a safe way to get access to those fields after their
destructor runs, then that's still a problem. If there's a field of
type `KBox<MyType>`, i.e. a pointer to a kmalloc allocation, then the
destructor will have freed that allocation. We cannot let you access
the field that holds the KBox after that happens because the pointer
will be dangling.

> > Storing those other fields within the registration solves this issue.
> > The registration ensures that the miscdevice is deregistered before
> > the `data` field is destroyed. This means that if it's safe to access
> > the miscdevice field, then it's also safe to access the `data` field,
> > and that's the guarantee we need.
>
> I'm confused.  A misc device should be embedded inside of something
> else.  And the misc device controls the lifespan of that "something
> else" structure, right?  So by virtue of the misc device being alive,
> everything else in there should be ok.

This patch proposes that the way you write

struct MyDriverData {
    // lifetime of these fields is controlled by misc
    field1: Foo,
    field2: Bar,
    misc: MiscDeviceRegistration<MyMiscFile>
}

is

struct MyDriverData {
    misc: MiscDeviceRegistration<MyMiscFile, Inner>
}
struct Inner {
    // lifetime of these fields is controlled by misc
    field1: Foo,
    field2: Bar,
}

in memory all three fields gets laid out next to each other.

> Now individual misc devices might want to do different things but if
> they are being torn down, that means all references are dropped so any
> "container_of()" like cast-back should not even be possible as there
> should not be a pointer that you can cast-back from here.
>
> Or am I confused?  I think a real example would be good to see here.

Christian, do you mind sharing the example you showed to me?

Alice
