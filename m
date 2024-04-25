Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA67F486
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Apr 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035655; cv=none; b=BWSKpEq3j77v6R+DHU4THoRfRUuj3ACcSSdNtx179LLjQfRVDiyhFKXn8SNQ6cWyAJRNRxFI2JW8Pr8btAG/s9op13a2WnUH/wYE43/8Q8+9AQYM1HE2uGG17ItJmffaouisM2C3OvM1+SksDVWNfr5A+UfqpVA0+5WLc1M1j8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035655; c=relaxed/simple;
	bh=hxPa/xW4XemSSh+6kDeb4Xm5EBcoU8VCtmv3JFmprx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s0JUL07SPLSDp1azZ/HTfaYLMoTwfjzCWfMlWuS5aNWiKYrQhrPyPdF3na6gGi71Ss2Sm408NCOhgvEGqI/ZjX8bHZJtP/qsw+wA2F327jsqJAard63oTDAavPX4jFH/BfFHkrzuQ/MxmZdFyCHyNaQ+Tcp76F2Ms3smfE7P6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=K6S6L3sE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="K6S6L3sE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a557044f2ddso87701266b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Apr 2024 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1714035652; x=1714640452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvEI4foK1L+IEvRMU+9j0M20skVBYn6iR5gFVtibc6U=;
        b=K6S6L3sE/hgQ53jCSXJEtfsrfFMOaT7ixm7ZY9B5+94FrHh7v+HO6L3Sz1CA1rd/wE
         kQE6fTwyPKEd92A4ATGdaAyqW8AeoUK/N+QsEmEOSgy96a3hvOi0HXUlhl0gt/98x9fi
         GBupEEYnVkz45EyRaCAjxIIOj+dZUHtaLuWufT7ZeHMbiINx8VvDPdWxH+bcpRG46wAI
         ePAcu9L2BWnKCZo9iRKEva6tjNmd9rroq9R4rtmkGKzNt0hxwveTj6FlEteRKEIob+v4
         Ty/ic2C26x4MIaL3k3o/oYeqQDDEFAlGieVLLow1LU6Zjlj5XX1GArsl1Dvit4WgiSvs
         VqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714035652; x=1714640452;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uvEI4foK1L+IEvRMU+9j0M20skVBYn6iR5gFVtibc6U=;
        b=G7jPVPZBLN6Z0RQVSJOclP/0f9sb7d6aLSgCD8+TcfedIj81rG/XXWV8QNFvjqvEFk
         xTTC2y857OWGLVQHMuQfxBrSEb/FvnwohXO/xOHSudmD8SncFGAnO/KDJJTw2JLAbUtv
         Y7sqcn02f6xVurRcZqMSOJUIitd4lvqrLMYURyRlZrcZl7icQPKvzNZeJ5LnZzsfWDA0
         CQovdz6kaS+5BUoZl+9MumPEU6bMXvDTkXFzQ9e1M/xNhES73nm5D7f11U2Hv7rdIHhq
         U8+sW8zK5t6o7RkOWGV0aUDiyUPu6fB2onNfjQ92nKV7Oa6ylxouQyMtCLHpGZuice0m
         P35w==
X-Forwarded-Encrypted: i=1; AJvYcCVakDHVvtkELBF91ybP6UCy8JTkyxJW+JNfDSiWPNYKpLYYO7Z0+qMV3C7EK6l+C5cLTEyH1sgCB2uYHZktAIsZf52gKEIaZ5h5dF6xlwY=
X-Gm-Message-State: AOJu0Ywi3tcpgcFiiLt3rrhVC1pSf6lk4Mpq5H+jLUWpxcH0IS//MfX0
	oHR9bhk+zR/SHdX8YO0fGaDPT8GTAwl6fBZqLQ1K7lnIoY9jTUx/V0imlxmu2ps=
X-Google-Smtp-Source: AGHT+IEPKJB0fifRbgzdg1AP5xzQvJRUxnNuDjffQON6Bb85hb1b2r53VTCuJLLfykdKZy8YCjaamg==
X-Received: by 2002:a17:906:1b45:b0:a52:30d3:41dd with SMTP id p5-20020a1709061b4500b00a5230d341ddmr3498691ejg.41.1714035651546;
        Thu, 25 Apr 2024 02:00:51 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id cf5-20020a170906b2c500b00a587868c5d2sm3315093ejb.195.2024.04.25.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 02:00:51 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,  Thomas Gleixner
 <tglx@linutronix.de>,  Miguel Ojeda <ojeda@kernel.org>,  John Stultz
 <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>,  Alex Gaynor
 <alex.gaynor@gmail.com>,  Wedson Almeida Filho <wedsonaf@gmail.com>,  Gary
 Guo <gary@garyguo.net>,  bjorn3_gh@protonmail.com,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@samsung.com>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: time: Use wrapping_sub() for Ktime::sub()
In-Reply-To: <CAH5fLghL=G-ihevf1_D0aGffmJMtxtSpMDoTGtrmdiDfhwpKnw@mail.gmail.com>
 (Alice
	Ryhl's message of "Fri, 12 Apr 2024 15:51:12 +0200")
References: <20240411230801.1504496-1-boqun.feng@gmail.com>
	<20240411230801.1504496-3-boqun.feng@gmail.com>
	<CAH5fLgg0CkZO9KF58boui6Y5ajpXHuGh0OxyNru2aEG5pNObwQ@mail.gmail.com>
	<Zhk0q-0eM4z5JHqn@Boquns-Mac-mini.home>
	<CAH5fLghL=G-ihevf1_D0aGffmJMtxtSpMDoTGtrmdiDfhwpKnw@mail.gmail.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Thu, 25 Apr 2024 11:00:31 +0200
Message-ID: <877cgln7f4.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alice Ryhl <aliceryhl@google.com> writes:

> On Fri, Apr 12, 2024 at 3:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
>>
>> On Fri, Apr 12, 2024 at 10:36:05AM +0200, Alice Ryhl wrote:
>> > On Fri, Apr 12, 2024 at 1:08=E2=80=AFAM Boqun Feng <boqun.feng@gmail.c=
om> wrote:
>> > >
>> > > Currently since Rust code is compiled with "-Coverflow-checks=3Dy", =
so a
>> > > normal substraction may be compiled as an overflow checking and panic
>> > > if overflow happens:
>> > >
>> > >         subq    %rsi, %rdi
>> > >         jo      .LBB0_2
>> > >         movq    %rdi, %rax
>> > >         retq
>> > > .LBB0_2:
>> > >         pushq   %rax
>> > >         leaq    str.0(%rip), %rdi
>> > >         leaq    .L__unnamed_1(%rip), %rdx
>> > >         movl    $33, %esi
>> > >         callq   *core::panicking::panic::h59297120e85ea178@GOTPCREL(=
%rip)
>> > >
>> > > although overflow detection is nice to have, however this makes
>> > > `Ktime::sub()` behave differently than `ktime_sub()`, moreover it's =
not
>> > > clear that the overflow checking is helpful, since for example, the
>> > > current binder usage[1] doesn't have the checking.
>> >
>> > I don't think this is a good idea at all. Any code that triggers an
>> > overflow in Ktime::sub is wrong, and anyone who enables
>> > CONFIG_RUST_OVERFLOW_CHECKS does so because they want such bugs to be
>> > caught. You may have been able to find one example of a subtraction
>> > that doesn't have a risk of overflow, but overflow bugs really do
>>
>> The point is you won't panic the kernel because of an overflow. I
>> agree that overflow is something we want to catch, but currently
>> ktime_t doesn't panic if overflow happens.
>
> What the CONFIG_RUST_OVERFLOW_CHECKS option does is enable panics on
> overflow. So I don't understand how "it panics on overflow" is an
> argument for removing the overflow check. That's what you asked for!
> One could perhaps argue about whether CONFIG_RUST_OVERFLOW_CHECKS is a
> good idea (I think it is), but that is orthogonal. When
> CONFIG_RUST_OVERFLOW_CHECKS is enabled, you should respect the flag.

I would agree. If users do not want panics on overflow, they disable
RUST_OVERFLOW_CHECKS. If the config is enabled, overflows in ktime sub
should panic, even if it does not do so in equivalent C code.

BR Andreas
