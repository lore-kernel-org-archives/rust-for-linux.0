Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B56210F5B
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540683; cv=none; b=UZrlBZlJpaXCdZmyDd5d6IITgjxHijQ8o+ai9artiYJA6Q8LVHBQgwh62EhO0i/oO6vrIu1zBYs1u6zhGpeXtB9L5riLw7jQ3ZGbGluNK1JEN9L4ek21Kua8TLZNYVwz3iZBmbmwr8YK5kLX96gEQkEcIcr69GtHd8LNw9R2leo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540683; c=relaxed/simple;
	bh=IMZQuv3IZBSNK/FSqjM7tla45OLXz5dphLZB4d+oRg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFmnH8dlByS3kYaPhMj4VHBm0/YohTXrSOgGHLuLO8eDii0qodDNzYpSoDuN1u0JpZhwIL2jDNBPQpJuoHMb97DrNEdvDuO/VPXte07Q3SZ5066O4EWQL5pkzZ9VJt9Qhvg9BfRf8J1jJUqC+jG9wWo7d7jeasuiC1zdqJiO2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/VpSssF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/VpSssF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-386329da1d9so3691688f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 02:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737540679; x=1738145479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBqx9JEcRmW2rWqsjHQwofa4RNCobGVG6rE/MKtUTxE=;
        b=b/VpSssFYk9FWsAwSNEiiHBG0egN2xIPv+TbSohretP+kOjwN0/xs5r8HQvU1JmiVs
         ctErTU3KNWmGt843+Vo0N3uu7wfiRqgcdjQQYhPKQIhqfKpmwBB+X+s2KNi1LSvFDDNg
         4m01KG8RtRQtEP1SQ5xdfK1DvkLK5/98iyxDScQuiaBehk19FFYuwMBEfxCLmFlpxzev
         OV6Q5NTJhm1QowUft80JPUkUDGZgH6GizwYcsn9wBIOkHX6O/UL6gWpJJC18uG3a6xgG
         pF/c7T9opOCbghLAKS5NH9mh0tnp4TCffXRwALJCJ4y4AAHGKEOaQtCdQz/CD1s2PT52
         iR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540679; x=1738145479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBqx9JEcRmW2rWqsjHQwofa4RNCobGVG6rE/MKtUTxE=;
        b=cVK7bXZoUsGvxNPcAlK2YtpcZV7dJLvyYrJ/RMiHrbREFJm5KqqHPKDQiKRscLMGXs
         ftpDjWkrEu9uXRr7uQuoggSDI1Vq4AAf2qi2JOPGyUJuuXgRKaBQIebP65f04CG5E/5p
         RyGrkOW5dApWTcCPk48RI69AWWkouEF2BGzBWhbrffKzuBw49HW8CTdLkPX/Ml20DIjN
         orLdfcYo8fId8MDOdlGxcIspSmJaYAy5hbDBAoEjCJWr5z8IMweDbT1P7UCTHQzI/SJG
         1Ay2c2QgNpB5sZlSNSSKid0KiB4lKhpOwaIZCBTYPR4CuCTwfTPLwl+dFyeIvpceO9/a
         cc3g==
X-Forwarded-Encrypted: i=1; AJvYcCVuXzrW5CWgji/T16FAwCc5ItveS17v4u6w+xnHc5hKd2UmrzyaPEuMuYorVMjUxgrK+v6iqvmEBlXSwqJe2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgpVeyGb56z6tfS/BU4WyhbjwweHZCe4GLOFBKlfcNqUlDMDN
	gb65OfHNccX2JLTIJlAYdRdnXA2GDZHwzmWv0CyEcirQnwxTBzZXFhxcp8Gva/WK4bZH2/NViFQ
	EheK3K2gyQ8CPIPFXBsjdek+fKUZ/z11gLY/r
X-Gm-Gg: ASbGncuQIQLrtSap7rD4NJhiRQZvIFkjIoPcymzTI9yiCNJI4b5Zp0rf+uitulMsgMf
	4b5g1WFlFWgD+V84h62r3ybwh+C2rwiBwt3tDONEw0QRU89cKq5xPmtkpTbgmGTWWGH4rxUr0fO
	QQCOqS
X-Google-Smtp-Source: AGHT+IGjOWC3PbTkuww656m2RVk9JPAhm+2ANu17OZoz/Yt7HyT7RSMMh+WTVtBcN1izRVOO+SYCDvfL9m9Hmjt0jJo=
X-Received: by 2002:a5d:5f50:0:b0:382:49f9:74bb with SMTP id
 ffacd0b85a97d-38bf57a9a6bmr20719894f8f.35.1737540679367; Wed, 22 Jan 2025
 02:11:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com> <2025012243-myspace-woof-1d1e@gregkh>
In-Reply-To: <2025012243-myspace-woof-1d1e@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 11:11:07 +0100
X-Gm-Features: AbW1kvba19lfZ_zJbFc3-O57-O-V34AXaA4ALWsp_9GUCp_0EH-MCLgwd5QkeTQ
Message-ID: <CAH5fLgh7QyVSgqJZM-krHmF87c76a84Cg6PyT47TYjMsN9iwZg@mail.gmail.com>
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

On Wed, Jan 22, 2025 at 10:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
> > When using the Rust miscdevice bindings, you generally embed the
> > MiscDeviceRegistration within another struct:
> >
> > struct MyDriverData {
> >     data: SomeOtherData,
> >     misc: MiscDeviceRegistration<MyMiscFile>
> > }
> >
> > In the `fops->open` callback of the miscdevice, you are given a
> > reference to the registration, which allows you to access its fields.
> > For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
> > accessor to pull out miscdevice::this_device") you can access the
> > internal `struct device`. However, there is still no way to access the
> > `data` field in the above example, because you only have a reference to
> > the registration.
>
> What's wrong with the driver_data pointer in the misc device structure?
> Shouldn't you be in control of that as you are a misc driver owner?  Or
> does the misc core handle this I can't recall at the moment, sorry.

There's no such pointer in struct miscdevice?

> > Using container_of is also not possible to do safely. For example, if
> > the destructor of `MyDriverData` runs, then the destructor of `data`
> > would run before the miscdevice is deregistered, so using container_of
> > to access `data` from `fops->open` could result in a UAF. A similar
> > problem can happen on initialization if `misc` is not the last field to
> > be initialized.
> >
> > To provide a safe way to access user-defined data stored next to the
> > `struct miscdevice`, make `MiscDeviceRegistration` into a container tha=
t
> > can store a user-provided piece of data. This way, `fops->open` can
> > access that data via the registration, since the data is stored inside
> > the registration.
>
> "next to" feels odd, that's what a container_of is for, but be careful
> as to who owns the lifecycle of the object you are trying to get to.
> You can't have multiple objects with different lifecycles in the same
> structure (i.e. don't mix a misc device and a platform device together).

Ultimately, this is intended to solve the problem that container_of
solves in C. Actually using container_of runs into the challenge that
you have no way of knowing if those other fields are still valid. If
the destructor of the struct starts running, then it might have
destroyed some of the fields, but not yet have destroyed the
miscdevice field. Since you can't know if the rest of the struct is
still valid, it's not safe to use container_of.

Storing those other fields within the registration solves this issue.
The registration ensures that the miscdevice is deregistered before
the `data` field is destroyed. This means that if it's safe to access
the miscdevice field, then it's also safe to access the `data` field,
and that's the guarantee we need.

Alice

> So a real example here would be good to see, can you post your driver at
> the same time so that we can see what you are doing and perhaps provide
> a better way to do it?
