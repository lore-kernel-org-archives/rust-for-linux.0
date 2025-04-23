Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C91C84D9
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409668; cv=none; b=Ivtq+C/uNdZCTdB6FaJaV6qN+n+Tigui50HWS1iZN92SNAuTy9nqH39Sd6ggSMEDzrAWEJ+dc431hBwb8nONLjAIdFFQ/oE/jIC0Lp95YTeo1d7d3ZoYe3n1CJYMvSXHQemXZFg/nzztFqX+9ldls2b5qFABep3Na/mWZVogpyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409668; c=relaxed/simple;
	bh=hxhs2KUniZpzTm392vVGlXp0MApW9RLKujRwgFDxO4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KviHUesKFmSSVYxFJJROoAMO8B+MVi/jQVfWUX3LPJ4aIKHSwsRRJI+zZ2txq4MVpHhRBqsXttvJMBO/h5yBVexUx2ejS401C9q3x9ExWJR86BBIwhP0cAOMPeoZUlmoE1MYsYwoMKH99clEbFPk87dFZXdiCpZMq7t7BH0wyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kL3TB5E5; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kL3TB5E5"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6041e84715eso4810370eaf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745409666; x=1746014466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljPySLmCIyaDmpmK4mqQYBe7mtVNq+JITC0VWQEJ4rg=;
        b=kL3TB5E5SGEGNrVNJd2hgvQvZYDckJKaMLlmQfOLYTTvhOu60/BVVX2eP5H0DMp/zl
         x9LlV3wyXR34VpAqnC+YIEoPtckJ/+5PUJVAL+oSHYW/IvOaKF8nKiFwXopJujl0iuyS
         whUJUKopfxccQj9Hi6ieGgeuFco7Y4Fi8Hn/En1AunIe6eQZZ7Ir/PjHQsQlAH7XJIb6
         vzmDSXuI3LOY0LHyDqFIfoEjFkh/9OTIIis58Aea86IduSidjRkAWvwmlEDB7dIpuup5
         xpQSOBlK2ziKWQO0yV5ejLYl43JIWVBEYAxh42vp8aHTMVnu5AEllQOVw+Mxf5CFnznz
         KXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745409666; x=1746014466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljPySLmCIyaDmpmK4mqQYBe7mtVNq+JITC0VWQEJ4rg=;
        b=Xp2loUPgPaMTRR3wcT6Z/yxJigEzAqGze4W03a5qrvG6U34j7HKtV5dK4AV6KHdeKv
         KWfMTzkEk/h9I2wK4k3MgPwd42cuQS4/JdqEvu3DJIt5jzHnu4V78uKFeu/rykdR2k/v
         Aq4w4jzFxSVZmK3zsKCOn2yCjxLEyy6k3h6AP80V+psiRJRsFGKWY56NCREOzRgsxNOC
         AAuPoi1gE3h5PW1ExZoJHA1T5zUGZTWkQvnVlSvikf94zhqlwIRd859L8XxES0QtAwQS
         kdiBpmxae321d5KF2mxsKIZT9ydJsBgirazzJdl2CAzl7ImDe8/Y09DOAquwkeB+uUsL
         wv/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+SB0mDeR5QdyrFiU0XRUWEBSXWy/er9DyAkS0T2gEADx2Qg2l6usnEx15M4mWlBV9ixts4idlnSZuu2Tcyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/b+/F8eOxi214kBRBlW48LPn8L/eaZvHl7Q2OqKaBZmPLMUj
	pOxcr8wEEpiVHjF26s9FSEDLQfDeGmYUdniXetTLmF9y3nypPWqoaD5YcdHFGrzRr7FR4F0PS2l
	PKWhu10QigimxDLzvONFkm/DEnMay5T6HuPCm
X-Gm-Gg: ASbGncue3fKEzlAj49rltiA5cU0mPWIdjx4eBmk7nVjapov5eEvBN4cnN5m6y2/sbtS
	/XIVxGJSd2kUEeW+iCv0f+drgaKtGfspveZHoxczjV4ydJAxUY29Qluq0Xa5uoH10TdX/9IGTxm
	nazoEJm+hpPzNCdPdU9auO0mTFOgpYYY6Nljt8NuRp9t9OtU/MKVXh
X-Google-Smtp-Source: AGHT+IEICUZ6rIOt0VtEfuUiCSPVFrcDz/xsGuPmI4E/ktXozNO6fxNk5SFEZA5wiNy2AEhnJ4EDTcCM112plD6Sqwk=
X-Received: by 2002:a4a:ec44:0:b0:601:cdab:15b5 with SMTP id
 006d021491bc7-606004d8aacmr10698191eaf.2.1745409664237; Wed, 23 Apr 2025
 05:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com> <Z-rFPhrNTB8t5xTF@thinkpad>
 <CANiq72kSVHsgZGULhy+t4XyD2xGAKdiyKshC1VgKjTFoHUbMNg@mail.gmail.com>
In-Reply-To: <CANiq72kSVHsgZGULhy+t4XyD2xGAKdiyKshC1VgKjTFoHUbMNg@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 23 Apr 2025 14:00:52 +0200
X-Gm-Features: ATxdqUE76yazRjG4CXiNAyJEU1c522phlZ3cjUnLxo46ATiEfE0-3T2IJ3hPCRo
Message-ID: <CACQBu=V+OrsgBTv3hhWgFhGCBOXC=ytDwcS5v=j8uKcrDaXb6Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: adds Bitmap API, ID pool and bindings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 8:52=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 31, 2025 at 6:39=E2=80=AFPM Yury Norov <yury.norov@gmail.com>=
 wrote:
> >
> > I didn't find any discussions related to the bit_set in kernel context.
> > Is it possible to use it in kernel? If not, can you mention that in com=
mit
>
> In principle, from a very quick look, yes, it supports `no_std` and
> should be very easy to vendor since they don't have dependencies (i.e.
> `bit_set` and `bit_vec`).
>
> > message? If yes, I think you should consider to use internal language
> > tools.
>
> Hmm... if by "internal language tools" you mean a normal library (like
> that one you mention), then yeah, they can be considered.
>
> In general, we have been prudent about using third-party libraries so
> far, but it is possible if it is the right choice -- please see:
>
>     https://rust-for-linux.com/third-party-crates#suitability-of-a-crate
>
> So if everyone agrees that or another library would be the best fit
> than mimicking or using the C side (performance-wise,
> maintainability-wise, etc.), then I am happy to integrate it.
>

IMHO, we should strive to avoid parallel implementations of basic data
structures.

This little patch series was started to replace a self-contained C
code with Rust implementation. It may not representative for all Rust
code, but building an abstraction over C code will make porting a lot
easier to write and review.

Now, one can argue that Rust abstractions could use alternative
implementations instead of binding the C code underneath. This opens
the door to subtle differences in performance or correctness (e.g. the
case with atomics and inner mutability).

> > I encourage you to implement the tests as normal kernel tests - in
> > source files that may be enabled in config. I can't insist on that,
> > and will not block the series because of lack of benchmarks and
> > tests written in a traditional way.
> >
> > But to me, scattered wrongly formatted commented-out in-place way of
> > writing tests is something fundamentally wrong. Not mentioning that
> > it bloats source files, making them harder to read.
>
> I don't think documentation makes things harder to read; quite the
> opposite -- if the docs are good.
>
> But, yeah, if it is an actual test that is not suitable as an example,
> then it should be a separate test (whether as a `#[test]` one, if that
> works already for this use case, or as a sample module otherwise).
>

Now that I figured out how to do it, I'll add the separate kunit test
that exercise code paths which are not helpful in documentation.

Thanks,
Burak
