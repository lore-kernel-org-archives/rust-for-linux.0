Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85C2957CD
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 02:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569602; cv=none; b=gPUYwNDV7BszkjyUI7kF+tvToJv5lQb2CpAX26VQ+uxjXp/B5OAg1HfiHLkKjaP/mNaiAtjptfbSuDKtskBJ9J4VvFmq7VO24b946WJehoEIexVPHgWORYT5RmEFskkImWqL1uSYMDZGmJrslxLHK6KXjuCIkEcm0j+EyyUXTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569602; c=relaxed/simple;
	bh=m7LuMJmoMsw8OhL+zbye2ZVtZHlwh+NL6ZssgXY0Ijg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7kuu/f+Z6hdZl42BNQ+Ahiy5aBUlmHa359lIuFlbMTNGe3ozIYGb3pG4bOWHkW8ljSwVqIBPWKesIE5Fa/gMALOnfzTTeBFxDPUO7ntzyDwlY9Oe8S4RbmBHmExZ44NEZBuzHtSWxoPrIbz1z/1USzcvhhIOK3L5LMSeG3rZac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HqJ/2Oi2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HqJ/2Oi2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295c64cb951so89865ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 18:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762569600; x=1763174400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISo6u9Qc4EcSrRzi8tm5pg3DenyGQGDB6em3HujHsKQ=;
        b=HqJ/2Oi2+EUUSDE8o79uHROYexzAQ5agtvvJkztq82qOJMAHY+E+DX+9genkeOqvA6
         yxZEOaijZaUYf1X/po09h2wuan2v9mkI13mkSPS0HUQVqhS1/ZasELwO/0P6o+xHNYtp
         WZLZL8THB41T52tT5YKZyhb13LI2sSNULVZurgXxK4diYTiHAARp0bBtBSO0dhCr761P
         kSKksz52m5yErI9VuSd7WdSxih58Gvu3sp1Gij9BgWVNbv69ayjgaGV7JO3R4zPOpJTH
         sOVWZOq6waoE8+teFt19Rj+t6R1R/bkpMRVMcxpKWQA4lp3SQ8+TPg/6QAviIFVoqcpT
         o1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569600; x=1763174400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISo6u9Qc4EcSrRzi8tm5pg3DenyGQGDB6em3HujHsKQ=;
        b=fHMsqkrB7rAEPjiwn0spwIqumv11RW1hGGE5x6jp20Hkw9577cL0NspoZIHs47my9K
         6o7mWBzDvgUpIR4hMX6MrfAPS1RV6A4tAKzpocBo0cRWHlsa1yUqfhNkVwK/SQl4H9hW
         Vt1GlcYOiLIA1/W651EXZQoTD7UwtHaxhumzUG+cfKJyAb8uEsrEL1hXYIQPRqPguBgS
         86oNQCTzxjx+jLp3PBOpzI8wEnmaMr5FXCb5gjHU8cGRXsj46CeQ2v0MzSM2XndtpCuo
         rJTOo6I0Jhg4RgRLJhayqwQBmAHkkhRP/uysyjIlCIHclNNLQ4G7uvGlOiKWMk6Dx4w6
         4FhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDQw7n/pi6ox/4z091442SsSqyudIKP0bmjmnnnRb/FkvF66navfiKZpn+S4LOIFkXd6+DEwBN5p91XqpKCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwguoTrYcZQBF8WWWQ623FRop/xjo6E3t46sXlqCAD+GVzQq6Hu
	4ysPkBpQDyjfYD33Jyue1UfSzmRpEywzZw2Zsz4qht/+I+23n34TjqUPGLopy/FrAJnexMVZBMu
	t/Ban+NgDcvpIp5DJ5a9MTXxTU8ricCeueMp8tGmdSER+xqr7QOg1lPNK
X-Gm-Gg: ASbGnct5OKLzw1iqVXLbZ5fLNc/nrcEdNGTqVtq0cS25DsdcROMajcpeMHFNKCvgCTd
	b55Nuh4I8c/MHW22eL1XnicSQiiHHlhP0pb+U+6P24CGYqsm52/eEi//IiZ7cBZx5ZV9bBlxpb4
	pXlH5/CuE9ZizQ5IGug8ytKjAeqBf9kL9aYOeb/d6tuZ6n0V8v5+5Ievzsp7tTNG/gBz2gTVXSn
	ABCnDqvS/RxichU6XGxC2M3hDtdDWH1Ey6clijm0GfVEY9p/s3aDwHbAA==
X-Google-Smtp-Source: AGHT+IEcWbEeQy5nVbkbDh62AxtpCgxrZfusi9drFXZyCGpbyRRVAuf5K3IddyD+sWvIScB6XWD5N0JFil1/Ikeqm58=
X-Received: by 2002:a17:902:d502:b0:26d:72f8:8cfa with SMTP id
 d9443c01a7336-297e7df1d8dmr1129025ad.13.1762569600006; Fri, 07 Nov 2025
 18:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com> <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
In-Reply-To: <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 7 Nov 2025 18:39:23 -0800
X-Gm-Features: AWmQ_bmb64VymVFf8Gn-EuS7qsAtPzXyfc2oW8oZ6cRO_18rrTpp7PAlC0xQ6Tw
Message-ID: <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 5:42=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 6, 2025 at 6:54=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Bisecting nightlies, it seemed to happen between:
> >
> >     rustc 1.91.0-nightly (12eb345e5 2025-09-07)
> >     rustc 1.91.0-nightly (9c27f27ea 2025-09-08)
>
> Ok, for reference, it was upstream's ab91a63d403b ("Ignore intrinsic
> calls in cross-crate-inlining cost model"): the object file stops
> containing DWARF debug information because the `Default`
> implementations contained `write_bytes()` calls which are now ignored
> in that cost model and so everything is essentially as if `#[inline]`.
>
> If one generates the bindings without the `Debug` impls, indeed the
> file stops containing DWARF even in Rust 1.90.0.
>
> For the moment, we can just skip `gendwarfksyms` starting with Rust
> 1.91.0 (sending a quick patch for that), but it may be a bit brittle
> in that new versions could again re-introduce some symbols that get
> exported from that one etc.

Technically speaking, bindings.o still exports ~1500 symbols even with
newer rustc versions. If we don't actually expect modules to use these
symbols, the correct solution is to not export them. Otherwise,
modules that depend on these symbols will nevertheless fail to load
with modversions.

> Sami, would it make sense to "auto-skip" in `gendwarfksyms` itself if
> an object file does not have anything interesting and then remove that
> from the `Makefile`?

I'm not sure it makes sense to silently export unusable symbols. I
feel like we should either ensure there's debugging information for
these symbols, or just not export them.

Sami
