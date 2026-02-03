Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2DE3644A2
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141859; cv=pass; b=bd8M97Ma5YIZY7uCFQbwmYM29D96fY+yy3dSVZMzqvw/Ngu/DgBoEwNSohLhfOFWidQ4qhCsE/Vk16EuuZWjXiSEtiX7ll53nG0H8ALA74KbLG/NBz4YAyFJE9ufX6lVlWF0w7RDmH0INFBPzobAjnR/vzpkh2u2CblGFVsJ2kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141859; c=relaxed/simple;
	bh=NiYmGhBDnkvI8ZJQgcCZNDyToFlarmUji712KD5FXgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku1vN7U0cwFzaM+cbHmi6WKeKk/MPfnd/UFkRO+KzMcd6DLmaMPZDGDn/GKOuEKqanZA2FXvfHazNeeQfCayWjmPdvM7SYEUZc1KImiLdAf5C0HNqtHykGhI7daiHUpNEc2/HHVoNNw+c0Urk62W/I1TXdhPLplZfNacBzt/t2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KNR5uij6; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KNR5uij6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so480a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 10:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770141855; cv=none;
        d=google.com; s=arc-20240605;
        b=BlCiE3wHho1S4R8+dHZ+hafQCUu9NoCpG2h7AF66wGk+Ur7XTYK1g06xgpsBCx0WZb
         JMktuMZPjIbazOAhPPsF8kBOIzLTeFLS8aGObdLCFhtbyGrCquB3LyGvVVsy0uOqGo2o
         W2s0VruHDQPdvsb8NO7Be3nHJECr0H2kqo7Fxl9KtXtnQYa+gdoSnxFgdyCexiDjyhO2
         jzfC94v0fnTQ0Wl5gVyOhiDvEmREO63kjzQve3cbxW3AucyhusPPqvnvFQsFyOkfr3Qo
         7TYuZjYuXW/vtjauiYunzGnryxYfHnReuC7c3kJzXG5tyxjCrsSb43HuMR2xCyDlofyy
         enDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        fh=eSqkjIvG316tiI8sFDynd7q2Cb37EdiQnKS/ZpUHOtk=;
        b=Y09XkN8+6BY+jhNNu2YKKJStsGBZbABnWym5uIU/1sA7ESfOHcJtUE6ueAtzGQokLd
         NYy/TIR3tJrNnoQEZGSI65h2B8uuS9Ng+EkTIW3+KG65bHaqNBs4X0aH6o9qWI8SReja
         9xtDtiMxu7OmP/7iNwlOZ6NUUA9jx4OC0/Xlfgxa/nPXvwN3g5DJ1PwNDnjGmc7zMLJ4
         f5nhs9AL8QlSlnM8X850K7/QMBwCEP9i/EAWn8qhNsOqwXpwKwKVSfrMTGcnOnsbUr9N
         Z7JRhPe3ffIQND1S6aFCRjAQX6aTspbI7vMarmmEdjczeIurC1JT7Y23RglGoLEAiOv7
         rWZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770141855; x=1770746655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        b=KNR5uij6C7FzK9xZwFmLsgZCkuZtZmjaWLp7PcA9CyI7xspZmm7CvlSzZMEwS3DgN9
         Cj9xbgNF1mV97TWI3f2ZGpsIo7h09OsDhH+kDMw9hux7PANFMxIa5O+85bgAB3fi2Czu
         Teeivr0u+gL2DWcfCVkfdT92MEfPWGnUQhPuAgAdsggDZMT7tI+OuSsL3a7/rcs7JkBX
         jNsFiDQKefQhCEg6HZl9NbXDeG+uGtZpARYiDaV+77a+plJcX5MiOrwtZNyJzADISdJr
         EP1XmBHgfNOQIXmZrahHQLxo3eabd3RoQECoa05lDa6iyKFyDW+USqo7lVIelyVnFj8t
         dTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770141855; x=1770746655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zo5g4kjzsHVdCYVph0+zHfHpTvTrsr3e0LsvYcnTAos=;
        b=EvFOaWI1fYpXTatC39ZCsnQ3TVmsdnxgw5y7JUudPRB4STAMioVDzr3SOInL4g24Ev
         lZkxhhUrQlw+lZxaF+YxJkTdrRCME2z5HSYmyjIwd+yG2O2D2SXSCAvKNk90PZfzl1d9
         TNKwrbvl24hCaB2uwXDk2RxjkjmxpSU8w/UJiLGL9lCaQRnTGpQEQo3TEN8SgLouWPBr
         bgFLn8VvNMq8iZG9KTg3W1xpZ0i+LhI+ic0AENkv+LYYMBVVLx4HJ3Z32nrQinvHh5lS
         +SEYT8mpVzdrIDEbawSVb3xJg0jR1K0GH5vcOX6cTXKnmlnPEXphDd/uSWob+OfQ0B2l
         K1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXE0C/xU5LGECcWK/HCF9ejf2Teif/lJAqDVQmpnj2iGf2LZo/8/X1UHyA+T5GOUkv4ZD5XE4x26U25ANis6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cH3cCi21H8M8aHJTyuRqHopEhjAsmf8udm+Jm3U3az9ob5P9
	EY2XRMlmyp+eRjhm+V6AyOtujUBR+wMeZ0v3O/F2CUJT4ZrguvhaM++Y6jjPtBAGCblj/nLXf3Q
	otmnWxHphJt4TcZEG0IYZqR2hcOPAJ/eTg73igqjM
X-Gm-Gg: AZuq6aJDfRcGXM2Hr9CzYu7mba9guWHZAiCphO/4GWY4WBXGi3W4MOFzR1s3qCewb4z
	pBlxYwK/YJRWHRw/wecl7ROmrCw5bd1CBMcaCJRCQvCelcqJCdljA7Ov4MqMX+0Gc+XbUem23/x
	6rP8rjPaIWeZ7ZkX3sIdpYmDKbrasc5mPHdbs9mwrxpRW4Y6bliMySuEU6H+cnXvQe1pzBv6CwB
	lkqpIqO8dQ0Wt9L4CSLMDqahqz823I6xm02YUmCicCTdZaDg0CcspIpmxqoABQGkRiDVeDbqc/L
	LSbNpsW/JFbMDKZpq1+qjTCYpw==
X-Received: by 2002:a05:6402:5351:20b0:659:3fc7:e1e1 with SMTP id
 4fb4d7f45d1cf-6594a350f8dmr6491a12.16.1770141855228; Tue, 03 Feb 2026
 10:04:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-5-d6719db85637@google.com> <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
In-Reply-To: <DG5HAM6F5QYE.1ZFO7GD3SL9V0@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 10:04:03 -0800
X-Gm-Features: AZwV_QiFdGyk29eec1MFmYhNyUzLZTIr17YBC0D3LJX2IXJzzxnb_bKNmlHpqIg
Message-ID: <CAGSQo03g8bjRosYVPzxhK9FpSW1ZfW52unPaoxpcn=pXaDUriQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
To: Gary Guo <gary@garyguo.net>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:48=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Feb 3, 2026 at 3:46 PM GMT, Matthew Maurer wrote:
> > This adds support for creating a DebugFS directory which is aware that
> > it is bound to a device. As a result, callbacks under that directory
> > have access to a bound device which gives them efficient access to othe=
r
> > Devres, ability to use dev_err! and friends, etc.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> > index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b66=
9e9ba61958bec609e 100644
> > --- a/rust/kernel/debugfs.rs
> > +++ b/rust/kernel/debugfs.rs
> > @@ -11,6 +11,11 @@
> >  #[cfg(CONFIG_DEBUG_FS)]
> >  use crate::sync::Arc;
> >  use crate::{
> > +    device::{
> > +        Bound,
> > +        Device, //
> > +    },
> > +    devres::Devres,
> >      fmt,
> >      prelude::*,
> >      str::CStr,
> > @@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
> >          }
> >      }
> >  }
> > +
> > +impl<'a, T: 'a + Send> Devres<Scope<T>> {
> > +    /// Creates a new scope, which is a directory at the root of the d=
ebugfs filesystem,
> > +    /// associated with some data `T`, enclosed in a [`Devres`] for th=
e provided device.
> > +    ///
> > +    /// The `init` closure is called to populate the directory with fi=
les and subdirectories. These
> > +    /// files can reference the data stored in the scope. Because it i=
s stored inside a `Devres`,
> > +    /// the init method is granted access to a `&Device<Bound>`.
> > +    ///
> > +    /// This can be used for cheaply accessing device-protected data i=
nside DebugFS methods or
> > +    /// accessing device-specific methods (e.g. [`dev_err!`]).
> > +    ///
> > +    /// The entire directory tree created within the scope will be rem=
oved when the returned
> > +    /// `Scope` handle is dropped.
> > +    pub fn dir<E: 'a, F>(
> > +        dev: &'a Device<Bound>,
> > +        data: impl PinInit<T, E> + 'a,
> > +        name: &'a CStr,
> > +        init: F,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'d=
ir ScopedDir<'data, 'dir>)
> > +            + 'a,
> > +        Error: From<E>,
> > +    {
> > +        Devres::new(
> > +            dev,
> > +            Scope::new(data, |data| {
> > +                let scoped =3D ScopedDir::new(name);
> > +                init(data, dev, &scoped);
> > +                scoped.into_entry()
> > +            }),
> > +        )
> > +    }
> > +}
>
> I think it is a big strange to have this on `Devres` (in patch v6 it has =
`Devres::dir` doesn't make
> too much sense). I would suggest that we domsomething like
>
>     impl<'a, T: 'a + Send> Scope<T> {
>         pub fn devres_dir(
>             ...
>         ) -> impl PinInit<Devres<Self>, Error> + 'a;
>     }
>
> To me `Devres` is just a generic container type, just like `Arc` and `ARe=
f`, so
> the assoc functions should be defined on the concrete type.
>
> Also: is there a reason that this needs a special API, and by
>
>     Devres::new(device, Scope::dir(data, c"name", |data| {
>         // use data and device
>     });
>
> ?

Yes - that won't work, because the function being provided to
`Scope::dir` is `for<'data, 'dir> FnOnce(&'data T, &'dir
ScopedDir<'data, 'dir>)` - this means that *intentionally*, if you
capture any non-static-lifetime variable from outside the closure, you
won't be able to use it with the methods on `ScopedDir`, because the
`'data` lifetime bound should stop you. In the general case, we
wouldn't want a reference with the same lifetime as `device` in that
example to be usable inside the debugfs callbacks. The device of a
Devres wrapped scope is a special case because we know that it will
outlive it.

>
> Best,
> Gary
>
>
