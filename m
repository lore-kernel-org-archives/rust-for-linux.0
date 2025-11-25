Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1533019BE
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081730; cv=none; b=cY1O+I/q05jlFk61TcR4IxN/NM1KGDfp7dxns1ckTmSEqiWeYBlJKE2bfz/b9+1nBbg6tTLwjqpbHEKXdkOm/oiVsuZH+Uv/NZ2dFgAFKRnuk/I+aDlH7D2O+tpIvVUvESYOttmqUYShLw3JRnI3zV68PtMKh9oTZECVxdAKmss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081730; c=relaxed/simple;
	bh=1I4q1exnOXDZwJFMGBsrKuT7PS+uun9GFceJ8l6w5cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGmIix7b8yOyVnyfyXtKmQOm2UYZQFzcmxIixJ7RZ4jECpB7alpr1s1sk0jubKwpF5bI467GwVsSHqt4MZH+sL9m11pXxmrRXHYt+5iXejjZCYSgRju85iCJOb2CJ6oicDMJX0maHzuysOECOUhgj6ar/vaiG3IuXPrd1MddAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lgvR6Fwg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lgvR6Fwg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so34899635e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764081726; x=1764686526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXLwSJeOSrSWJj4MBoSNOzvUQJm8IEmFrwojTcmAovQ=;
        b=lgvR6FwgJD/21LgrtVZtfNtsue8DF9m7XfBRv6wJvx4UCBGnOfp/JC6EFwBpc2J0SW
         bsu+MP2IN+QErf4bO53U28TuFz0WTRtcq79srGVfHpioITEYympYq/iW9qacYJH9p8FO
         djuTYAupOZLpNRa4EN8U730mVrC3Tg+fW3DvZu39BqVWIf6BSBlbwHgcneWcp/ZXpcps
         oGqlVhp0M8MYN1ABFolNHAN4bHo/kK2IJDJ8RUjKd7vU3pBWJCMky0+Ds+hj26RCPPGO
         5WuWyOmX29pz5k+7NA9JrSfN4slbpzMsyhu93eUs66IFjQ6ZsvBY7ocfGNh5GARxu9s+
         lYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764081726; x=1764686526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXLwSJeOSrSWJj4MBoSNOzvUQJm8IEmFrwojTcmAovQ=;
        b=aT2nQCzRqwcXdEj+lWWnVh9LXyRpQj33OXM/RKmrAtyIuF+2U1C5CE5zX/b2H/z372
         wUXucpq+9zV4q2g3ovcG0ZbMTQwlORs/t0tKACDB6ohxEX2i3hRzxKDrQ6NhyV1gYAdU
         GivSmqFtCOl/Dpp74iIeSAvC1OiI5QIpVpbupHvv0Dd5k/EdivZxPySYOpt+nsMrbuKp
         iLHeCdEqpF6Oxm9qx7yGG6aBJH8SLNcnvJz9fHaCPDIz+B/DkZL5fwRvy+vu75Y3hhD5
         CnAhxjGmRoNH2/Uz9mbLjU1c6NBBoLEr4kf8TWPnEiIG1a94n4JZ/XKCvM3Y+zp7vEwv
         FLBg==
X-Forwarded-Encrypted: i=1; AJvYcCV7o5JGkeYJiOwFOkC30wk1/kkSdqYtJ0MxlotcU/DDrjPKXW6G/B1kVWnPeYaJtxvmKKlHXW2LHNFGTIGEtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7gNJDTOyLApOCAWHTPugrMk+RKJbW+iAJROuOExLRcbznn8i
	E2AIVEuksWUOAaDBO14rDIDFwhI/bpnlXuK4lHfmJcTN6aUK/mvP2qNYpQqAP1kUUlSG+Vf4WJg
	2wln+d+UOsCR7WOzwAmdYgN08zURPhSxdcYthY8F8
X-Gm-Gg: ASbGncu/YYLCVM65ZJmmPDdjjUlBF1l3V9i4G0c/x+3XXIY2b4qPs+YeI+52J9MnHQN
	ZdnHS/btNdmFlVa1+u1mAwcT6y0BjZVEh80MuDd2jO6sHxrr+A9alVdDnBqZv1PL5Qd98q00CZ4
	nlBRPd5NQ3TCXk6jJiW7Ib3SSYDB56Zio+L/7UDBQ94SGWUJCQliQMiLqvU+tj8jNqzfmEa4DPA
	g7zrBJWPjysPp1du+iyzH6O59vXEmRtAUNbr/3ZT41RCu2PiHXOa71xCaclxfEHBsjbEKDn6NaK
	bXHp4kaEagyBwa3kGZ5BAg==
X-Google-Smtp-Source: AGHT+IFeGKwYcckLABLoDuRwmbL2FHkAYRKu3xHvkzEUN1IJnKUZxlmUhaOEldPOHQwm1zmx9YWX1tsv6zNfJS+RYAU=
X-Received: by 2002:a05:6000:1887:b0:42b:3cd2:e9bc with SMTP id
 ffacd0b85a97d-42cc1d352d7mr16108251f8f.39.1764081725765; Tue, 25 Nov 2025
 06:42:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net> <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
In-Reply-To: <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Nov 2025 15:41:52 +0100
X-Gm-Features: AWmQ_bmxXNLN_J61y5iHUicjavjvWZzYRwJvu9pIn74Mqof194vnRt_A4XvclTI
Message-ID: <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> > Use page::page_align for GEM object memory allocation to ensure the
> > allocation is page aligned. This ensures that the allocation is page
> > aligned with the system in cases where 4096 is not the default.
> > For example on 16k or 64k aarch64 systems this allocation should be
> > aligned accordingly.
> >
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> > ---
> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> > index 2760ba4f3450..a07e922e25ef 100644
> > --- a/drivers/gpu/drm/nova/gem.rs
> > +++ b/drivers/gpu/drm/nova/gem.rs
> > @@ -3,6 +3,10 @@
> >  use kernel::{
> >      drm,
> >      drm::{gem, gem::BaseObject},
> > +    page::{
> > +        page_align,
> > +        PAGE_SIZE, //
> > +    },
> >      prelude::*,
> >      sync::aref::ARef,
> >  };
> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl Pin=
Init<Self, Error> {
> >  impl NovaObject {
> >      /// Create a new DRM GEM object.
> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<ge=
m::Object<Self>>> {
> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
> > -
> > -        if size =3D=3D 0 || size > aligned_size {
> > +        // Check for 0 size or potential usize overflow before calling=
 page_align
> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
>
> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - well,
> I'll admit it looks better as a placeholder. :) But the actual alignment
> will eventually be provided elsewhere.

What about kernels with 16k pages?

> >              return Err(EINVAL);
> >          }
> >
> > +        let aligned_size =3D page_align(size);
>
> `page_align` won't panic on overflow, but it will still return an
> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> you return an error when an overflow occurs.

The Rust implementation of page_align() is implemented as (addr +
(PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
if the appropriate config options are enabled.

Alice
