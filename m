Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D6885645
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712929886; cv=none; b=Sw6g6hjLlab69L2LMO+Z1841yM6N84Brws2EDi2G9W9euFirCaAOk5iqdWhR0BY0rlKnvILnIK/ojTTw2BEzBCkUeuQ66B8jaKuWwo7GP+cHSF+AWa35LCWLVzBokZkIvsW2LX5b3zAfl56BZGb3dG+bzevqX2vxPqx28KSMYTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712929886; c=relaxed/simple;
	bh=53Cs+42uICznC+Xas0chinXqpYt7sWkCvzQ690iV654=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUm6w/sii62IBmK5pQzxUdcNCIPk6fQmMJg+rp5T/Ciwb385MTn/a6eZldk3Io1gXUNWHIereUtxpTmUGl1z6dZRt9o32LfU+WhgR+oCJ8YkyDaxOvmI25GUrhVtbAAMCMsX5HNFsqNyqpef/Q3ap8q1d6zYc2M50FrLLrcQuBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dphFY/ob; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dphFY/ob"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7e81870648cso224957241.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712929884; x=1713534684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJnR5552tR98GvdFl2I9gJzxKsxtaACk6KQyxfOH2CQ=;
        b=dphFY/obs5pjYf4o3FSjgCLJBTcJ5+J+d6Nj3Xr8Vh3rlZExJMe13QB67253zP/c/l
         QIR+hqVyoDeIivtI1e2aZDdRbH9wM0RpMn6C1cGzUoes85ok1cNlCAvIq3M9+p/Pk/ba
         Hc/coAOxhbGvVSzefTAA1fnoP/6TXU5bJRkuSNQD45a6cPrEM5vwTfnjowBMuEMC6CUb
         gxUIlHDNSO360mWTLE9uP/qildXmKhKNqhqxPu2GD0GpJHf9zY+WXuV0RwjsRIgEsv9t
         RgzCAvmf9PPTWpNqAyDyI8ojxFQxtPhC2B6N8FuNww4p8k/o+Z9P2GfIDrqIO1Y43Mwf
         B0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712929884; x=1713534684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJnR5552tR98GvdFl2I9gJzxKsxtaACk6KQyxfOH2CQ=;
        b=vELfsnxtKarJixus9KFyWJCBaRfrFu5tu9WZZN0s5OBO9taefHMPTcVsOVPZI8lf9G
         /eoZMeVpPSaneJB+aVXryEmCzFG5aqJoKHe+d/j6eGphGS+cbS2teK6r6ZDKizoPRGqD
         nMw7XyJFrMs5XNV58ZDbhQouC4FbSv60oGgGUfw6ZGSwkrDD0KxzW5Fz1Pd+48XAIG6G
         q6VXps2d7O4aA8ar13bXOJwtu/t9CIpMKSDx1dUnws8E7m/tQhEL/2WZo9bq5Uc66oki
         jFXEeyyDkMFcNxPcjgDJpad1EbBh0peFAxzNB/+uJKcQVuop81y5ScJfXUkmN3pwvHJL
         s7tg==
X-Forwarded-Encrypted: i=1; AJvYcCVxwghh9RgntEWWSGONAE28TyYYLX7bJA2CIpyu07t+g0g18IwcJkESkOsgZU2uThEU7p2YSdEqlKRaB/3WtwSv8f8jRgMK0BVCuioYs4o=
X-Gm-Message-State: AOJu0YxrPGRck3lh1PcYU46+guwD5uDBsiOrMbsTb1DNLe1vYEjdDHdv
	x8BPhDKZdn0DaETHtl2vd0Kx+letBshjAJxRcBFaQ5j3NWRx68bxHkmeBtEt4GqlwOe3vdhrAb8
	kMb2LAGea9FYUBtAr7YnYImbGiOxptLMPu6E7
X-Google-Smtp-Source: AGHT+IHxgfhOwDhXlQkc4GDre4LJSpeZ5vnnJ1PuHWiqe7qJwFHXNft4Odbv4126CJsS+HrJIjBy3eOB/r89t4EkPWM=
X-Received: by 2002:a05:6102:160b:b0:47a:3ce6:6cfb with SMTP id
 cu11-20020a056102160b00b0047a3ce66cfbmr3725899vsb.19.1712929884209; Fri, 12
 Apr 2024 06:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411230801.1504496-1-boqun.feng@gmail.com>
 <20240411230801.1504496-3-boqun.feng@gmail.com> <CAH5fLgg0CkZO9KF58boui6Y5ajpXHuGh0OxyNru2aEG5pNObwQ@mail.gmail.com>
 <Zhk0q-0eM4z5JHqn@Boquns-Mac-mini.home>
In-Reply-To: <Zhk0q-0eM4z5JHqn@Boquns-Mac-mini.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 12 Apr 2024 15:51:12 +0200
Message-ID: <CAH5fLghL=G-ihevf1_D0aGffmJMtxtSpMDoTGtrmdiDfhwpKnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: time: Use wrapping_sub() for Ktime::sub()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Miguel Ojeda <ojeda@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 3:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Fri, Apr 12, 2024 at 10:36:05AM +0200, Alice Ryhl wrote:
> > On Fri, Apr 12, 2024 at 1:08=E2=80=AFAM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > Currently since Rust code is compiled with "-Coverflow-checks=3Dy", s=
o a
> > > normal substraction may be compiled as an overflow checking and panic
> > > if overflow happens:
> > >
> > >         subq    %rsi, %rdi
> > >         jo      .LBB0_2
> > >         movq    %rdi, %rax
> > >         retq
> > > .LBB0_2:
> > >         pushq   %rax
> > >         leaq    str.0(%rip), %rdi
> > >         leaq    .L__unnamed_1(%rip), %rdx
> > >         movl    $33, %esi
> > >         callq   *core::panicking::panic::h59297120e85ea178@GOTPCREL(%=
rip)
> > >
> > > although overflow detection is nice to have, however this makes
> > > `Ktime::sub()` behave differently than `ktime_sub()`, moreover it's n=
ot
> > > clear that the overflow checking is helpful, since for example, the
> > > current binder usage[1] doesn't have the checking.
> >
> > I don't think this is a good idea at all. Any code that triggers an
> > overflow in Ktime::sub is wrong, and anyone who enables
> > CONFIG_RUST_OVERFLOW_CHECKS does so because they want such bugs to be
> > caught. You may have been able to find one example of a subtraction
> > that doesn't have a risk of overflow, but overflow bugs really do
>
> The point is you won't panic the kernel because of an overflow. I
> agree that overflow is something we want to catch, but currently
> ktime_t doesn't panic if overflow happens.

What the CONFIG_RUST_OVERFLOW_CHECKS option does is enable panics on
overflow. So I don't understand how "it panics on overflow" is an
argument for removing the overflow check. That's what you asked for!
One could perhaps argue about whether CONFIG_RUST_OVERFLOW_CHECKS is a
good idea (I think it is), but that is orthogonal. When
CONFIG_RUST_OVERFLOW_CHECKS is enabled, you should respect the flag.

Alice
