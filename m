Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD83A4539
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786197201; cv=none; b=qtZa/IVubv9KK2bbRz29sHuko+gBv7fp3oOvWM9bz46+d84ud4NkpjFttY9tGnQW9FOTui40yx8ORyJ4tli/G8bktz7HNGlXnV+zRJp+1Je29pYpIT3GVEe90UQVOXaFSbSAflyWEEBA6QbRPo9MbCA6HnFv9V6Rg+8C5ouGL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786197201; c=relaxed/simple;
	bh=IcthlcxHcH4F4JgAEetrapn+n9qKsljYE+7hUcANoKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gtHuP+ASoijsH2dxgv83yxA4ahvrJ+khZaYXCrA9Dhj5VXXJgx1RkFsXptJ7ZLj4UJugT/wj4XqwlHf5JKPrdiOO40fPMiGqebyPuIQrsCMw+bftr3UKEo5Tv/nt48YjXPYD96cHzA0SBMip2LgQrHCvy2Lzx/uJzLsHe63FUWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=giv/azpz; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="giv/azpz"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955e865174so2113195e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Aug 2026 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786197198; x=1786801998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j6YhX/Efyy0dzXw6FSkTaS9JiJzp146xrTR9z+Cnp8M=;
        b=giv/azpztd8d7ZWP1ThA4U87Sugq4D+sB4Jeq/5M4wHgV8xzcmgR8+IReR3sZPfdhF
         vzOVBUUrxZ/b1DD8KmKnFNDImTy2u72ZbRGNv1gIUbxOpSSeoKhaPq8GYZtJvIrirbCh
         Y1KIOyv2eM76lZOH/q6ARbzWNx/cTTTxJAse3q6apJWgchGQDEn7Xk/l/bweA6b22TsK
         fWAdcOxsgO2iscxi2nSXatp5BvdSpEmexXFB726OM+bDU4xWfXK0rQL8psGKKkwIwiUu
         sVsqDs/Zx5nJwDuA6FBRsi76EV602fx2wfLvt5LQHxNEMEZpI80OVC/fbNSzuM9a+fMF
         TDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786197198; x=1786801998;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6YhX/Efyy0dzXw6FSkTaS9JiJzp146xrTR9z+Cnp8M=;
        b=HsgX7Y55bJ+1XVei+f3Zvw/VrV6+6ih7JjGWhsVZ3oo2wt/75GJ1KLXvjv/aCjHPyi
         Z6vUgF448ke44o0PpG9333WNIqJK1bcnPDAZqtHwkLCIuVBCcsydi/Z55BKo6XEebt/4
         8/19w5ocAAc8jrbJt96ThoWmC+p3X3dnbeHdietOxkZymb1OdI5NRKUFTRjEPS2uLXuQ
         kNOBSPpvzUDF+pvbEZKLU1QP6sNJrwxUZnO7a9lCszcAIh6xenFFqmI1QjZjOEuEx7C8
         tlCVunIoWI7+d4lrDk6niF/tNNhXRFzF10iX+urfbKdt7fn3Q0y8qSUmuAT4Xbm9E/ta
         Iedg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Lv6m7qIfDCZGfC+FeyFyMzXS/AYd5a2IBJ3QJFIpivmIsSAbdo9z9/ibuYJxBGMCQcqs2RPAluaMpWZDyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaa40fJhMYKad7XvZcnKe1zbDIAJ/ozpVyfJmAmS0ptArPkPUP
	ZAn62yPLgNaKTHayuRzvMpG6n18jxBVUqzvc3LX98+DyOul3XtL+rXAME+mG/cwtgZLkybewMQQ
	4RVf0UndUU8OjVLjXdg==
X-Received: from wmjy11.prod.google.com ([2002:a7b:cd8b:0:b0:495:5ec9:83bb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3501:b0:495:5e86:4e11 with SMTP id 5b1f17b1804b1-49961983990mr87923605e9.12.1786197197577;
 Sat, 08 Aug 2026 06:53:17 -0700 (PDT)
Date: Sat, 8 Aug 2026 13:53:16 +0000
In-Reply-To: <DKITW7C1POAV.QX2CZS7JQ6BM@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com>
 <DKISHUP2OL6U.1NEMCW4S0Z9FR@garyguo.net> <CAH5fLggVkEYB0_SXcSGVBgs2hDejSU8P_y-5BvbyNhEvBPY1eQ@mail.gmail.com>
 <DKITW7C1POAV.QX2CZS7JQ6BM@garyguo.net>
Message-ID: <anc0zESlTrEoBv8I@google.com>
Subject: Re: [PATCH] rust: miscdevice: add registration data to MiscDevice
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2026 at 04:48:53PM +0100, Gary Guo wrote:
> On Fri Aug 7, 2026 at 4:44 PM BST, Alice Ryhl wrote:
> > On Fri, Aug 7, 2026 at 4:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
> >>
> >> On Fri Aug 7, 2026 at 3:22 PM BST, Alice Ryhl wrote:
> >> >  impl<T: MiscDevice> MiscDeviceRegistration<T> {
> >> >      /// Register a misc device.
> >> > -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, =
Error> {
> >> > +    pub fn register(
> >> > +        opts: MiscDeviceOptions,
> >> > +        data: impl PinInit<T::RegistrationData, Error>,
> >>
> >> We can just skip the `RegistrationData` and use `T`?
> >
> > `T` is the type of the data stored per-fd. We do not separate types
> > for those two concepts.
>=20
> This is getting backwards though, and won't work when we need to introduc=
e
> lifetimes.
>=20
> Per-fd data needs to be able to reference whatever lifetime is available =
on
> per-reg data, so it should be assoc type of the per-reg data type. The wa=
y
> around you current have causes `T::RegistrationData` to be able to refere=
nce
> lifetimes on `T` which is not okay and would only work with `'static` dat=
a.

Unfortunately the fds can outlive the registration, so we can't have
such lifetimes to begin with.

I know that miscdevice isn't currently built to work with the new device
model. We should fix that, but it is out of scope for this patch. Until
then, I think the current solution in this patch is sufficient.

Alice
