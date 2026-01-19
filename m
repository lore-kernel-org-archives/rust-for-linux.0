Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48A36165C
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827293; cv=pass; b=BPPWSNbCoOgg8pfIv/k3TWU7QStxNrH6nqMvEWEkBMmy44ebzwnriuKBM+PDD9M8+JzDVjo1o7fKikro8+78ffOPAL2oHQcxR8JsjQho1lqaSbakRPOx/6V/TT5ACNiOpejmkH+pjTKyL7qSYt6XU/VPzaIXX6mou8TUTj4+vSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827293; c=relaxed/simple;
	bh=IkKYKGBczUCc6iecBFNUGNFccawVKBJFo/hayrkeNZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqVELA32CF3waZjuawunf4fgHNpzSilaJm6btH4Bj+RDkyyKP5oED1kYVmxWhBt4S1vdRXqKSeHasENwrK9kqAtRttFbjTnML0/ij/xDDCMoVOqX/vEVz41LQsZg1GWJhv5RdP/Bro7dM5JADEi6fka31IvZVbM8EhugoNy6r/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc9IqOtl; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc9IqOtl"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb6d38f7so29946711fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 04:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768827289; cv=none;
        d=google.com; s=arc-20240605;
        b=OyURCtGb4PS/Z0VaDDaxcyOCSKoKwENxVB2N7OC75y8kKlB+WUfx1o+jd9ZN6h6E5w
         ltMkHQQGD2BP3WnfzSQ7yuj40SPXr16pHESvwj16uSDy6hH245/BOBJloXJOEGSx6etm
         22VWubLpio4C4QYq3G/LVFiaGw7BgD7mgX0ynokYkSmB8Xk6MK5LHZ+lUxc/TccpAGlL
         USExEAIVZVidOa0BZ92/4NnArPdbN9evyXUxTTvPrNeLjYg2zjXzLWOX6+qZKwQ2wxfw
         Bx2tHOUsukecNeoCdA95xxRGgq52prqJqx28V/qSvuVaazmT/NvTtuDh01XNMTFiLQrK
         JMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGur8UDGGcBE3Hmocy7dgLQOrypMFPCEL+jwBXmsi0Y=;
        fh=gdIlLiAhU6VXw6tUkcH8Xe/YB/tS2w8SjTkSKkATDPg=;
        b=lqfSXqwlI3PMSYJihsx93cdO59xfp9fJC0ZCIkrV9xnIoOgObTtXOsfhfsTLhYnroT
         f+v1lcHF8upO4B4E7G9t5Mz40EqCJwuudyZeTEtn/UoCcjz8MevnYvQ+H3YgR4TCdmDG
         2M940IsoxLDLRD+A2WTm7lK9bjhvTjyVLh0RPr1kMProkNnGX/Ugvr7wOGQ0nXxxDmTu
         lyZWkBynHWM2SMLr3HSJCs+00mLE6Y0/Qi2du1OhLtxSpySRKG1j+pKqBH05IHPuYq4i
         RxaUdOwwS21IUkPTuXvlIxpzhcCDQhbSqKyAACEdZuEo+303TD/Avf9UGy/I+wxuVawP
         K2vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827289; x=1769432089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGur8UDGGcBE3Hmocy7dgLQOrypMFPCEL+jwBXmsi0Y=;
        b=mc9IqOtlkn/IL3YKyUShxHqm9fvpV2shFOmy4YOozzrWEDkPUl/GHeT0vNGfBV7YS2
         4kmGZKeX2eU6zk57TMDvc0IfK3bewVF+yVFXD6fF9hjCblvzwaU1+r+d8IlHf4nib/9X
         XrFoV7gb4ydSmZyclg1ZO02jWzhVvQ5rYoFJSRpZaGu5oYW3GGr2Ie60v/wm2JRICIZ/
         arkhMFCtSxZOP+J3HGDdSDc6qn60/ZddUTS4dMcJAogAg3Lbrdm1eirDVVJmiz2ylnFI
         FeH3ACfFnHgxkJJQlgU97PU9eM/2wuPOK+vHRpDLA+He38XnfStKQa80D/N9d3rlWIPe
         qJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827289; x=1769432089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGur8UDGGcBE3Hmocy7dgLQOrypMFPCEL+jwBXmsi0Y=;
        b=B8xIDy/wYlNnaUf9kotBwlfH3E28CZMEwGq45zjbrDxQm3/E3UJy3AdCrulrv97HdV
         q8J4LKYd5bFwzGzukmFqfncbNqB93ftN36xM7oPIkfVbLisZT2EMLFyhZqY+NrZ+RO1r
         /CqWt0gtgzCpf8Dhd7KBDk9wotr1+QH/NTcgcuM20XSnnIQ2QYNiKkFnWICDOGfNOZMl
         CcvijPHAegNjxDu9/T3x3nnzF5u8DLA2eTQX0crPxd3EiBRqAUq9OAtneo+h2R3zpnu5
         lLGU9n8IK4kJLzCJ8ledvyxtDMCTkvr0Xyov0zj+CchZZqPCAFsIXhdb+FdqhvPyRb23
         U5sg==
X-Forwarded-Encrypted: i=1; AJvYcCXyb0JiS2vzFLxMfbmdlJjI1uOBR9TKKTHm0eFgNPsvbtrvnoavImUyLubSLA9w/+qdKa+4yD35LgEVW/dgtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcgBTqbDIXiwT4AH+lRA+axvMPRKmvHMF9kXx8i4PbBBrsPyRM
	CSTYc7/2HmyQNBQ+SorJ8WO0B9WsarjbxTa0vObRrUnbpBYbX5pe9WmHhrEAtZNUQi1eekJ9qaS
	vi03nPbDVuh0QJLBloQSDZhf30NQVtgI=
X-Gm-Gg: AY/fxX7mrRTpVDaI/0EP05lGuMQk4f7uVhFT0MMoIKsAPPZ2VeszCMGAVnXfTi787BZ
	/T3kT4JAX7g7u1XxN0dC+8haG0+UGOwWw+Qv4jSxoSQ62a/CAib2RxHgjpd6psBQBwxL2vrQoob
	C+XWFyLVw7xfvmXrldisHpymdHqlAK57L9wou24Gv2sjDM4p0DDUQYFTg7MFutyAMpxlT22lLSU
	pyibFNn6FOsshalzCKx92SkjwZDeuDviPdkNhfroAkhW2Y5R0YrJdW4SxZrbc4Crs4OisXRjGqt
	g5PGb609AoZIyuHzG+8r7w56b/CczQHbsM/Yro9eoLm/hRnQP9D4Tyqit2V2lzl0d0URDFgMc5B
	rxWrXqm4csGzwXgxygoW9kuJH09BZHoql3yTgo182vA==
X-Received: by 2002:a05:651c:508:b0:383:5482:b853 with SMTP id
 38308e7fff4ca-383842bcaeemr36918321fa.21.1768827288971; Mon, 19 Jan 2026
 04:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com> <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 07:54:12 -0500
X-Gm-Features: AZwV_Qix7Aukya090jJW0kiXMssAD-LNF3xuSuIb8jpVn4bil5K-YxfJFOSV4PI
Message-ID: <CAJ-ks9=LNe_STYSEJj7tvFNFzLsfEBKd+=Nbft4Kj-7+RbU99w@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 9:30=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Mon, Dec 22, 2025 at 7:24=E2=80=AFAM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > From: Tamir Duberstein <tamird@gmail.com>
> >
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/pwm/pwm_th1520.rs | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > index e3b7e77356fc..8ae8f852ec02 100644
> > --- a/drivers/pwm/pwm_th1520.rs
> > +++ b/drivers/pwm/pwm_th1520.rs
> > @@ -22,7 +22,6 @@
> >
> >  use core::ops::Deref;
> >  use kernel::{
> > -    c_str,
> >      clk::Clk,
> >      device::{Bound, Core, Device},
> >      devres,
> > @@ -327,7 +326,7 @@ fn drop(self: Pin<&mut Self>) {
> >      OF_TABLE,
> >      MODULE_OF_TABLE,
> >      <Th1520PwmPlatformDriver as platform::Driver>::IdInfo,
> > -    [(of::DeviceId::new(c_str!("thead,th1520-pwm")), ())]
> > +    [(of::DeviceId::new(c"thead,th1520-pwm"), ())]
> >  );
> >
> >  impl platform::Driver for Th1520PwmPlatformDriver {
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251222-cstr-pwm-c9b9a4701157
> >
> > Best regards,
> > --
> > Tamir Duberstein <tamird@gmail.com>
> >
>
> @Uwe could you please have a look?
>
> Cheers.
> Tamir

Drew, Guo, or Fu: could you please take this through your tree, or
would you be OK with it going through rust-next?
