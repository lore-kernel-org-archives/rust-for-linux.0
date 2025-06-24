Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F023D2AD
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773280; cv=none; b=kSKlGVM77BOcVYtDaTQPz3ncCqXacmVMN80hKNqxf2OUT7xGn9jBJCTzzMddVWHbLQqHcSTC8/QNNVAkw7QmnQHQTZdb7bztZCc0uua53FpQ1TArxV88Qr3bUQ0gTiPDp7HGHs9hxUmayizf9J9itSod6Kn2MfzKyqHvwEaL7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773280; c=relaxed/simple;
	bh=qCGN185qCjx8F271RlR0vW4iPGcpJCnJd3e/5OauLFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/B3C6R7Itf4wFQBjL3SSxPxlmPJDMQxUQSdDffpH0xS+xHeKtgcOGa+0SdRGL0o0p4tpC/OK5zyLQnwveVBWW4H523weaMok5qHowhbDLGnhqM2E3pfJnGzhkSSqlSbdjmNrpH8JFp255pLYBSXkM/I9EyCzd9Ygq7zKHUr//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J/UpI6wF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/UpI6wF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54690d369so4638132f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750773277; x=1751378077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndIWN7+8y5BdWE2PTIgJRaIaFxEDuJ6LVBN5W+A3/wU=;
        b=J/UpI6wFFt9MJkzf24qTCwKcKkD6jMrbJ4stzJFbZgcVraQBjEwcNcy2Ff5vydeJfl
         gz971kySHoMCUQ5Bl6zOOwYBlagk8tXlGdVJT5gL7lSjLfmhsqHOLvColZHA+M4AIKIg
         RnZgIQJF2EqwE/P3DEEMlCVoTp7eoXpPj1TXFFWMdfnqiG0NsU9+JSbDYQlOz/Y3eqDR
         0RRjYOkZV0HQog/bdLGnA57v5+bAb9IaaMjVRqVYX2SX256LeGvbTGnCpKNM/nMSfUTE
         42TEeSxS2c4aUIhMtWm3JMr6aJQeiinpmChDldJ2v90N/58rRSUZpwQO6uSJz7o27McQ
         Gegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773277; x=1751378077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndIWN7+8y5BdWE2PTIgJRaIaFxEDuJ6LVBN5W+A3/wU=;
        b=KNpEHVBe0WigdTTr3sIXP68B6xR2GEnCp1fZiFmKDCIclj1iXB2ecth6Rpiu6PCzlT
         TN6ZKE18+CJn0lqwreBJAXxpqO8RgH0xlPIT+UIL2Af6LjTmh1aZsQZWxFnIWvdi91S9
         sy1bcHi7ywzsKums981fkVCVMlKbgZfiUYEzCAC3FAI4M5YlSQcHPUOVAsiaMB3QCzp2
         fWc1OMFEP/y33608zlPW1p6j1vCs5aN8seng8/xWmtwOTy/ABmu1GOsU+gAlE9djPZ32
         0MJ0U8E2Ayw7dd0yLE+6lUOrxTR8OxTh0Jg/yUJh1G9bvkJ6cnU/Pa5cmGWYgntKtlk2
         pywg==
X-Forwarded-Encrypted: i=1; AJvYcCWHkp7SGPJ9AkMTGddGYezJNdff2lHgkrfJQmy4zxmLksZPqHD0FFocWg3yFBlgT1i0TeLo7YHH5VcUayIUHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyumCMY3BboqCZLoGwiIXzgiz0piITbluyiObMTySBEXrpd7EtQ
	56Lyk7LRs2vEiY9aWJpTRobU3C1IB2qQoyB5jN1iC3fH84K3bQ8OWaXd+afkdMYTQZEJvIibvXp
	QZY8WPV25Fx5hI78mmbhh95WirNUR0ecr4vmE8DQ5
X-Gm-Gg: ASbGncu75fZuj4/rukn/GR/n4aSu8wuTTqXIKFLaKdFPmIX4kTMLLL56tMVLHI5fuiC
	Sww+XwgJAHd1k4cvbeSrm2+zJsHreLYQHv6PQBf2v6ZGqLPf6UGL/62+IAd/ayGeCaU0r+N9grZ
	OHsUByRfxii5E83F4HdMFnCvUt0ibK363Uvn7RSONFxMbA
X-Google-Smtp-Source: AGHT+IE6qG4yT4F52V089BtqdcgW05JVoCujc2240lce+bClkgklwaKunhcojU2TzqvrWFprU2PCaZKTOAq2hBQtLY8=
X-Received: by 2002:a05:6000:4708:b0:3a4:f6ba:51c8 with SMTP id
 ffacd0b85a97d-3a6d12a3ee6mr13662866f8f.14.1750773277164; Tue, 24 Jun 2025
 06:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
 <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
 <CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com> <20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
In-Reply-To: <20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Jun 2025 14:54:24 +0100
X-Gm-Features: Ac12FXzK2-zU_qiS9xBkPbYaAbQyGj3kbgqXjtmwFWyfIVtERMkUn_W2s4_gTfo
Message-ID: <CAH5fLgjttTnev2h4J-hF-LdUTJCoryJyFm5_LqJ6_GBe+=An5Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 2:49=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Tue, 24 Jun 2025 13:15:32 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >> So would the function be defined like this?
> >>
> >> fn as_nanos(self) -> i64;
> >>
> >> If that's the case, then we've come full circle back to the original
> >> problem; Clippy warns against using as_* names for trait methods that
> >> take self as follows:
> >>
> >> warning: methods called `as_*` usually take `self` by reference or `se=
lf` by mutable reference
> >>    --> /home/fujita/git/linux-rust/rust/kernel/time/hrtimer.rs:430:17
> >>     |
> >> 430 |     fn as_nanos(self) -> i64;
> >>     |                 ^^^^
> >>     |
> >>     =3D help: consider choosing a less ambiguous name
> >>     =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#wrong_self_convention
> >>     =3D note: `-W clippy::wrong-self-convention` implied by `-W clippy=
::all`
> >>     =3D help: to override `-W clippy::all` add `#[allow(clippy::wrong_=
self_convention)]`
> >>
> >> https://lore.kernel.org/rust-for-linux/20250610132823.3457263-2-fujita=
.tomonori@gmail.com/
> >
> > Are we missing a derive(Copy) for this type? Clippy does not emit that
> > lint if the type is Copy:
> > https://github.com/rust-lang/rust-clippy/issues/273
>
> I think that both Delta and Instant structs implement Copy.
>
> #[repr(transparent)]
> #[derive(PartialEq, PartialOrd, Eq, Ord)]
> pub struct Instant<C: ClockSource> {
>     inner: bindings::ktime_t,
>     _c: PhantomData<C>,
> }
>
> impl<C: ClockSource> Clone for Instant<C> {
>     fn clone(&self) -> Self {
>         *self
>     }
> }
>
> impl<C: ClockSource> Copy for Instant<C> {}
>
> #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
> pub struct Delta {
>     nanos: i64,
> }
>
> The above warning is about the trait method.

Wait, it's a trait method!?

Alice
