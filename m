Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734516C87B
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503287; cv=none; b=fxy9aLEc3XjP/dMbXQBsqIT1xT1/GjQnxEyj7+ocWYvAFLSVaYmNELi26Q9N1DHycAyhm6Z0tVqnAOhKWCReezhASQwH9z/nP47VrgQ9zB3BtcfgH74n+jXgJN+ojZDHDDV8LTGzHVDZ724i24FnOLyUhQkVVGnaAlXp8gqZwCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503287; c=relaxed/simple;
	bh=4cgHRUWZuN5GT6hqCoW/w0mG65NgGwTSE5vOByclFdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpDrO/7n4Mq7pAEcx0GDnByNq5IfkpziaTG4mDk+Ilmxt13iOjjEkWYAEr8wcZVWtsUAB2JisQ3f31eH6FC6DfetGEuQVDfSrG7Kf/GhBs7k0PZgh9FOrvzOCFJdIrMYNxZkwaRK0izimcSE445PDV8C6nSbKWYY0OHUwtA/5dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zyNAr03o; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zyNAr03o"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368440b073bso1233409f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722503284; x=1723108084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToW3KI8roAC4Do61VeULBMC1otWP2s+jWIh8BYgS1x4=;
        b=zyNAr03oTwrQqqzYI3JeOfCdiIr91tRFJTjHUcW8+IvLtXaTZjRytIG4qdW0QknrV/
         t6r8Ug5OH2X2pVeK93iQTdqAYo8DUZuVT6UP/4FvxH1Iv15/WSIUgJywPDSMZYMkC80z
         GXb8lcans/LqaubexI5oWfaIYQHsSWH6YA/qKDuGX7IxS9RlqSvSh/WqmVhdv3y0Ub4E
         9sqhHciVG5Gxx7/OudRlILfdVU4AdU+wSADkIbcj93faWmAQlPWkSsHiAZCNYrxVg1EN
         JDCAGRefYOxQc74D2YCzJh8ehRHUKEaDZyqqejPXZRgxWq30LEbx52PQ4fbpV5V7o2Fv
         4flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503284; x=1723108084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToW3KI8roAC4Do61VeULBMC1otWP2s+jWIh8BYgS1x4=;
        b=TrboaFKe85Ow6SXJDPdhQ2SssTYBSXs7/pOcVpy8sKlMtPWvP4UdR75TLx3djEnzLg
         VaM1ilg6Wtd3C+JOPw27J2zk4zS5PAPr/ZudphRnXM+ecEjBdOyjyhLsqdafSjsq0Tgu
         9zT37LYpi496+cBky2gHHKWR0TTJiB4XXsGMK+sCmvZtZwsyhxc61bIibxlCSVothaMo
         yZZAMXrG5bHx/lS73Jt4J3wfpzSs79QWZT3zimqiMVLuvHamSfMgWJtz4+N+5Vc/Zy6K
         s4+Jb2eL0ZveWkATHOt12FWGwGsJG3YNEhms7zteKCStLmCvP19rzEt/2tUgJwCyFMBW
         /dQw==
X-Forwarded-Encrypted: i=1; AJvYcCURedHnUKc5Rp4HIlmsmuWdAj4VLTOp1uGsZu8qmH9tnqSdydgk+UU+G4HgbQlWEagqu9WYboKMGyrFSfmYOGOsr86QtykdStAtYeyo4Nw=
X-Gm-Message-State: AOJu0YxAYwSYMPwT0XHzyz4L7ZJVV9MLOoCz3ZOjRGamwLI1EPSrc0lp
	nsr4sO1SgxyP3dTC10oN76iI4wGTPgiyg2pxSaw5vXpdg1lfMwCVMbHc1OjnR02LSpitKeeIJoe
	f62ES5HjJ+yKVEdmyYbkocfW87llhpg9llOp+
X-Google-Smtp-Source: AGHT+IE4PrCeF4zEPR4QJhUj7r4nyMLXvSSgU8B5o78X0bqSZ7xJZrnWJkHxFn4cN8KAQMbCISIm+aYfv6cH83GhURU=
X-Received: by 2002:a5d:4844:0:b0:36b:b08f:64b3 with SMTP id
 ffacd0b85a97d-36bb35d2828mr621605f8f.20.1722503284256; Thu, 01 Aug 2024
 02:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731042136.201327-1-fujita.tomonori@gmail.com>
 <20240731042136.201327-3-fujita.tomonori@gmail.com> <5525a61c-01b7-4032-97ee-4997b19979ad@lunn.ch>
 <CAH5fLggyhvEhQL_VWdd38QyFuegPY5mXY_J-jZrh9w8=WPb2Vg@mail.gmail.com> <5055051e-b058-400f-861d-e7438bebb017@lunn.ch>
In-Reply-To: <5055051e-b058-400f-861d-e7438bebb017@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:07:52 +0200
Message-ID: <CAH5fLghBvd3phRWBzayTVQWyKqBYLNw9dsYKPmMHYZ1_jaWL7g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/6] rust: net::phy support probe callback
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 10:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > > > +    /// `phydev` must be passed by the corresponding callback in `=
phy_driver`.
> > > > +    unsafe extern "C" fn probe_callback(phydev: *mut bindings::phy=
_device) -> core::ffi::c_int {
> > > > +        from_result(|| {
> > > > +            // SAFETY: This callback is called only in contexts
> > > > +            // where we can exclusively access to `phy_device`, so=
 the accessors on
> > > > +            // `Device` are okay to call.
> > >
> > > This one is slightly different to other callbacks. probe is called
> > > without the mutex. Instead, probe is called before the device is
> > > published. So the comment is correct, but given how important Rust
> > > people take these SAFETY comments, maybe it should indicate it is
> > > different to others?
> >
> > Interesting. Given that we don't hold the mutex, does that mean that
> > some of the methods on Device are not safe to call in this context? Or
> > is there something else that makes it okay to call them despite not
> > holding the mutex?
>
> probe is always the first method called on a device driver to match it
> to a device. Traditionally, if probe fails, the device is destroyed,
> since there is no driver to drive it. probe needs to complete
> successfully before the phy_device structure is published so a MAC
> driver can reference it. If it is not published, nothing can have
> access to it, so you don't need to worry about parallel activities on
> it.
>
> And a PHY driver does not need a probe function. Historically, probe
> was all about, can this driver drive this hardware. However, since we
> have ID registers in the hardware, we already know the driver can
> drive the hardware. So probe is now about setting up whatever needs
> setting up. For PHY drivers, there is often nothing, no local state
> needed, etc. So the probe is optional.

Makes sense. Thanks for the explanation!

Alice
