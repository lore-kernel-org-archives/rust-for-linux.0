Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B705616D8
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885781; cv=pass; b=F8ru0+3aBcW8GShtraxKfrIYuxRzoP9wawatk3ny8DEtvkO31MJGn0L3TIR7rWRhgarCgzwkwiU9yz6xvobfE+fcBSvQu4UuyFYEiY3fYuSktRF8dqt3Ro85/kwnhOSBvd28ziMGtYehd1rGgnYsYN6cyIZ3WfYRz72IWAQD7wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885781; c=relaxed/simple;
	bh=+4KqyN4BGkjHLUxn+rJtW3zPxBepuB49yhgcuUyTkkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sC51Gh5OXxRaxr/1C5petz/Te79AH6IdrUfmKJVjFx3h1mGdolYB9rWqeAdDUD0xybYUulVPBhCFlvDS1LAyyL81R/i4TzfA2dbRShOwRs8JOBP+sqioWoz8OkZR4TKLWNM5QhujcjIFDloAk9+FhBdfFjLE385iL+w8wTvNR+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jZXHFoM6; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jZXHFoM6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so3660457f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 09:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788885778; cv=none;
        d=google.com; s=arc-20260327;
        b=En3/5Q6c9YTcoHNBDwEcRwZAABUn18fFriUVt9qicZQ18KTygZA6XX8iuk2mexBRmR
         Y6tCH6Wkl6M/rVuNzMG2gmCtGlgCv31fHju71+kP+OLECPGVlVJsBZfUKJKQSN9fRaP3
         f4wQpYUmip/e2TunDZ/8ZsJ88cb4hneEF+psKw6H8KfbNuCGYzbpMgAKEAnWCQq2KGRS
         L/NYoiRtT6mJdKp2tJCGnnfYPxeAjDTnwxtaRNtas8tGgk5FE208PrwkV7HzkrF/6TXp
         RSwsFkCgSzTki9CCpF2eZ0xvkxTh8LlkOBiVK+ePW0wI8haN2557fAXVl6diQDL9vFku
         /YfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJhYp30JIZrNouyXjFymmzkSnnCPcp8ceCj3L7sIPeU=;
        fh=5b9GltS3K9qIZmip1OBeZT0B1G+S+tcdyaKsNLtQjhU=;
        b=Dx6oEEJcExZx61h7rKFXJluC+lctnqk2RGZf4Qm4sDzWl3Kc/keIN1mE562JbsQu3P
         LVutUBhPfk9rEk1wzE9+fatdEI82TUiLe8kADUTKzuOW/CXK3vhS2cWzfU2R92HcgEu9
         zdo7p/fvziaYvbVhwyc+9nJR9MzdOQZbFtP097C49X8eGsgDm31FUEILcvmJbJk6e1Zy
         6pHTsfTIuTm04AwemZrFVa0ppA9WISFY/LfOreFrdwe5RJwYhZ/0YgGLz8syqFqjQURJ
         5CFn5VKh7AppYW+YyQrMJz1hA44y7whMK1fhjHliXd9PUoh54nyJ/FiHzapIof1armrb
         4J0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788885778; x=1789490578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJhYp30JIZrNouyXjFymmzkSnnCPcp8ceCj3L7sIPeU=;
        b=jZXHFoM6qAiPz7w9JRM5tbUQgRv6N5OT3v3izwkpZQ3J8ouh7Pkg91puJdUczb/ddR
         2kVsO6YjAlIAn59vlpAdC5ss7P5W4/JY+Ft9eYhzRFhtNdqkMECIq23+dIdQ3ll+6OSz
         YnbQ51V0iu4huszy6l/IsPzk4n7MdgK3+14vYj6w/iXWawnB4mBo2jGkMbMHc6Fx+TfI
         jTRbN1nLmcw+GG5IHoOuDpdh2oH5SGjDhy2NW1hoG8mSrIM3TRPqZoP88nuLCoVLOn9g
         zk9TOUwWmAeiFUKdPPzPgo8LqssNgobSWjzbGxZiBPUhRjSOO++HiEDFkiFWx/XpoVEZ
         BFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885778; x=1789490578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJhYp30JIZrNouyXjFymmzkSnnCPcp8ceCj3L7sIPeU=;
        b=eea5bsMCnnsY6TjYS7qji2wDKkGETr2H8GkOeO3hZFQHPl8TWvxhAxBjYbToHCHEe8
         8fBNmKwE0S0pRD+izQMpt7n1L9cnAFHgCpRYpZ/vHmT0VLZYt9kNM27U5tTFYlc2/2mu
         /WT88HvJZwfDxv0jbB5KMZP3czYYJoccUEV4Ft3MRWQP2qt2mCokr3jCH57OKbK+Qc75
         ujJNeqOG+h6XOfcaJjM8W/t8LzoairW79n2LUizxXIBQeBqe1sSSBG/40oGa1Plh1354
         omyNS5wnSQicSulWX/DKOLcSvanGc2GpEFQ7h3HGm9nlCyx0Wp0gb2joN0zBXNpmZath
         dHrw==
X-Forwarded-Encrypted: i=1; AKwUvBz3Wxvw+zuiEEhiwbBu7PvcTAg+6HcQi3gtRUfp951HhoP+XB8sUaNb77QUJtacdYxtdWZoCowMkT5G++93cw==@vger.kernel.org
X-Gm-Message-State: AFuF++lG5to6cCz3nn/lT+HmMGUXsP7h4tA7iYKDdZtTufL0nqwWx+G+
	kP2LVOS7rPbIjpmneOW8gdgzpWe0Mk8ADbOPf2pEB01mui/dcdKkZxiEMKJODVo0csUcsV19+zk
	UrL06U86CsHigBGfkJzilI1zyxooXrM3gDgJHhX4b
X-Gm-Gg: AYBFou1ow1BXxw08NTzIYMCcYd9TBUd4EVTOmuvl8RpeeD8pMIbw4AveASGdcyVKXzu
	AFgPuH3hTQMou3kNeHUzzeSkFOiSvlQ5Ep0ILAjmL54RNdyBxjPrwL376f8gTogsQNP0FRCDUbn
	XtN3+Hb3uGi7VYNmOpPQtA+KcaKcUWrjDSx1G1DHw7g3SAQuWmiCG8OLgL86891LFvE9/WnQB2r
	u2CvQv3pZmRY4geQRU06d7CxrunPhaDIbFm8tPKRmuNz9LQF38fLjqcHyyqPkoIPhMgpYp1SjOe
	JhbXqfDhfBTXc/2+DGf2C0alvh+yIaetZd+IjxikVq3xk4EEEo7GeedwGltqgM38lf+dft8u0Pw
	=
X-Received: by 2002:a5d:5d01:0:b0:485:8547:5060 with SMTP id
 ffacd0b85a97d-485872a0271mr33180121f8f.15.1788885777497; Tue, 08 Sep 2026
 09:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907123524.2332118-1-tomo@flapping.org> <aqADhk2Z7ynuawJf@google.com>
 <20260908.224511.1733725108685542391.tomo@flapping.org>
In-Reply-To: <20260908.224511.1733725108685542391.tomo@flapping.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Sep 2026 18:42:44 +0200
X-Gm-Features: AcwNN1W28ItH0EgipmUubZGafuQ3m_HB7KYlOus2Kad7uF0m53S3RkHtqtbwyL4
Message-ID: <CAH5fLgj=J+cCwCNar-_3TGFCGNCnvWbpWTBOP-poLBc07AKmyQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 3:45=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> On Tue, 8 Sep 2026 12:45:58 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Mon, Sep 07, 2026 at 09:35:24PM +0900, FUJITA Tomonori wrote:
> >> diff --git a/rust/helpers/math.c b/rust/helpers/math.c
> >> new file mode 100644
> >> index 000000000000..e2ee29bcce0f
> >> --- /dev/null
> >> +++ b/rust/helpers/math.c
> >> @@ -0,0 +1,8 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +#include <linux/math64.h>
> >> +
> >> +__rust_helper u64 rust_helper_mul_u64_add_u64_div_u64(u64 a, u64 b, u=
64 c, u64 d)
> >> +{
> >> +    return mul_u64_add_u64_div_u64(a, b, c, d);
> >> +}
> >
> > This looks like it's never an inline function, so I don't think a helpe=
r
> > is needed.
>
> It's an inline function on x86; arch/x86/include/asm/div64.h.

ok

> >> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> >> index 6c0a5e8090d0..8e9c349b1df7 100644
> >> --- a/rust/kernel/time.rs
> >> +++ b/rust/kernel/time.rs
> >> @@ -39,6 +39,10 @@
> >>  /// The number of nanoseconds per second.
> >>  pub const NSEC_PER_SEC: i64 =3D bindings::NSEC_PER_SEC as i64;
> >>
> >> +/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`. It i=
s the upper
> >> +/// bound the kernel uses for a jiffies span, not a wait-forever valu=
e.
> >> +const MAX_JIFFY_OFFSET: isize =3D (isize::MAX >> 1) - 1;
> >
> > Should this be:
> >
> > const MAX_JIFFY_OFFSET: Jiffies =3D (isize::MAX >> 1) - 1;
> >
> > The Jiffies type alias is always the same as isize, but it may be more
> > clear for readers to use Jiffies for the constant.
>
> Jiffies is crate::ffi::c_ulong, i.e. usize, not isize. And it will be
> removed; replacing it with Delta<Jiffy> is what the series is for
>
> https://lore.kernel.org/rust-for-linux/20260808062839.1159990-8-tomo@flap=
ping.org/

Fair enough

> >> +        // `bindings::HZ` cannot be used here. bindgen keeps the firs=
t definition of a
> >> +        // macro and ignores a later `#undef`, so `HZ` resolves to `_=
_USER_HZ`, i.e.
> >> +        // 100, from `include/uapi/asm-generic/param.h` instead of `C=
ONFIG_HZ`.
> >> +        const HZ: u64 =3D bindings::CONFIG_HZ as u64;
> >
> > Sounds very error-prone. Consider fixing this in rust/bindings/lib.rs
> > similar to `compat_ptr_ioctl` and then use bindings::HZ here. This will
> > reduce the chance of others using bindings::HZ and getting the wrong
> > value.
>
> Good idea, thanks. I'll do that in v3: patch 1 fixes bindings::HZ in lib.=
rs,
> and this patch then uses it.
>
