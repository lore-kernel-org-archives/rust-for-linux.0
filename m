Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC240381AFA
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561261; cv=pass; b=MlNdsixrENW5RzSTWisS5BzHXIz5acpiJz51jthsRWzJ+QOdzdTao8SLu/dRnLM4SILjVxsy2L4L+Lcq7oJYucyWp4CaEpni9I29Nob8oNNU+DLMdiWEmlIC6OvKC6g68YcfQ/suh73186fwOJoKPDdEElk2S0ioeilS8X2nStE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561261; c=relaxed/simple;
	bh=HUHgj2ElBuPGmubcslyfUuFNZEOEJOjv22IyfxcfieI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlnwW0m1VmDeMnXpICtK7CihEMwFKTi/rFPBpWZqGa1KGXHLyer5VGicmdZ0MAO+eJXO6gMgYGR5jG5KJrSBRiKbxZtA8im1ljw6oKbQHh6PYdaqrp31t71hPRTF8xeBrpQadItOmxEvmPg/OOdOWuPgukMt8+1KcYU3xLIfrdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGapfEar; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGapfEar"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be084d8166so184490eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 10:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772561260; cv=none;
        d=google.com; s=arc-20240605;
        b=XO5RNW6QSiOLSshi5JJRV504ZTOjuk9IsS799+9jxKcd/62wyokTwJb6XXYLvNZdSA
         FrptkZ8APN5SUIaMn3smCbeN/FZFyDMU86089bR81d4FZpTnPoVycEYl4Dm6qB5SL/ap
         nLwczaKHTRxaLi9hTYezHsCL4lAePiN7qze/8Bl1wL5WqSBTxo2w3OC/H1v6nyIEAkT1
         EMGDOYPoBU+Tg+dkckv4H/x96+8+T0YoHUv6WtviRSMHIszUIDY0BWPRlh7FblbiSY+q
         5/rb7dxrRHuep1V+4BdZAd6Sy5K6uMHsqKaJrXxtJtX05X/WEkAHoEcSx0rSqOTLiol3
         YqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R+q0jN+aH2U740XZAx90ODP1AU2BrSp5EsLhQpO8EjQ=;
        fh=1cf0D0mLs5EtQ+7ICwzCHqpJqdyBTJesIKsqjc4ZIhI=;
        b=EMEzr9sFoW1VM8M+92//dcgtY65kOpaz1Q+/d2kQA2RvCO4Dht0GOupGZxKOtDB1pV
         rVsxMDf4kSRPcRIJWDBeCfBgmiMD8GnP/Xyi4OkxqJa375e/nDmyQzK1b12yUqMUk4V6
         tQLLBx8zRLG4rm2gRvAjBnHGmdbJD0JDJm4zFWPtYso+eZbbWMrw6Tam9pH6+qw3Jbh5
         Ftq+9u6uoZRvZWHhywxhA0iU5XxT7HM9wwmadPO1MrbLnTm2U3ZJ7jYBncBY5KzawDt7
         nWkDJi22rP+NBLe/2ZoLdJYnNFT6p4yOtDJGAovoKJDyi3Jg2DjjCCPcCAv4ONDOIltm
         kCKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772561260; x=1773166060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+q0jN+aH2U740XZAx90ODP1AU2BrSp5EsLhQpO8EjQ=;
        b=XGapfEary2QvfkhT2A03zHWPyyNJ6Iao5dpwc6qoSW9t7U0bZEFgeqdUWFHiQx0oZt
         PMLO+YoBvftY2bV44jNW3TwFTtG4+y+HvpwCZzdquagngv7grRMS793RBb3gGOrxwQRh
         E+PmR57RDenuPd2sT4bp9qvEo7O0dtyqmqUziSLy77o3fNg0n4FGzzCCtazjecQmuc8l
         dZf2ZoDEqsp7iR5H+H2dKfgw6JlLEfrz5Ncya6As4PgHqhx+nA9oWgm8LS6SgA4Ko0AV
         JbiY+EHuU8qjRGYkzNbMAvD2NsVOQBJUH/75SaxLlqMriheKko1HccaKIHW3FGGn/Ig8
         WpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772561260; x=1773166060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R+q0jN+aH2U740XZAx90ODP1AU2BrSp5EsLhQpO8EjQ=;
        b=jeAwUuHPXP3ba9ngGTJz0cdXsk1sC+b+/BeBV2G8z7RWHXKrBbrdZNbXXY9Oe4KBx+
         HPqr/R1vULaR3w4rk7li59oX1kTKry0IAGGirXhNV4/8NKfS+bFrmchKRMoqtYCFEfvd
         sxnoG1hidiFRYacRrZz/B329/gTgCk14dB1D+hYko3k+dlcjptPrDWNhK0xzId1Ho3tN
         HRizjptmb9sp72vnuYUMvFNyDYPEJgoS7JsIiUl0hmOU1U/kdQGkiWzkSb963WtJvCm/
         1x8M8qOTcLZNzhB9fqe3ofUOUfFDLYIpqF8zjQk6kk0kImd9FlcMRhZjGNjKUgzqRkDm
         TvFw==
X-Forwarded-Encrypted: i=1; AJvYcCVOBlPCqcJWvFIKv1KPYkPFBua5R05JDsqYJhX7R3LVYB9Xgy1svNPzOnZjn5GiXix90PRU59DKs8wQqCjp+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYjZalush3vsQdA7aEuDkYKc9wIHX4uKRleHFYYbB3iMZDLe4
	A5OsO9cwPCwGLl0A1birq0NCi4x+dxe5bqRsRhqQWuQXm5kWpvFXcPobt1jHR3t6AHUCVZIn3Nu
	gpbGdV59tOTzdO8MJ7f0/1Y+KaVVeGf8=
X-Gm-Gg: ATEYQzwIWhWWHQyjjrdVZzb7fKmIwVaAprjLKhUMBmAu2Cu/z/UA5Zs7vxmX78gWWpv
	/pKX4o5obVBgyqt6rCyGv/T2cG4GP9oCY+j8e933P4+aJreMi/4/fNz7mIIoCPcvOTz1X4oFvEW
	5ThBGi+z828zNq/hpTcUo6eoMrYObT4OhKPMNokIXj2mWeu7KnGQ/M3BpkiCyvtu63Y1qy3NewP
	L7BOeeqtC/HvAL76mIW19PifaI5q6lKjsdZWDL5MbnJNIG5orNQqlMR+2q3mlovIlTNnEJz7S7/
	EXJFoZoKnMLDgVgkXQZBLoKY+AhZrd9v6lhhm2vnpjVkwaeomMEmrsWpmiJQdwxsYD1tffsCXmV
	6keOHJ4nQWJnu3LaoVSB/ycKZ
X-Received: by 2002:a05:7301:128f:b0:2be:1946:8576 with SMTP id
 5a478bee46e88-2be19468a7cmr1189062eec.4.1772561259708; Tue, 03 Mar 2026
 10:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-14-alistair.francis@wdc.com> <20260303120901.00004f09@huawei.com>
In-Reply-To: <20260303120901.00004f09@huawei.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Mar 2026 19:07:25 +0100
X-Gm-Features: AaiRm50kQCG3rWYXRXgEs_41HrhB68jbew2wmRd5fS8L-moVcgSEic_0M728KX8
Message-ID: <CANiq72nU-0Da1R3K6eHeJU1jkhnu7arVP5NOykdvQEpoHSgHbg@mail.gmail.com>
Subject: Re: [RFC v3 13/27] lib: rspdm: Support SPDM get_capabilities
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: alistair23@gmail.com, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 1:09=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> Can we use bit_u32() or similar here?
> We've tried to move to BIT() for similar defines in the C code, so I'm
> looking for something along those lines. Provides a form of documentation
> that they are single bit fields.

We have these so far:

  https://rust.docs.kernel.org/kernel/bits/

Out-of-tree long ago we had also a `bit<T>` generic const function
(https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/types.rs#L31=
7-L349).
I think we also discussed a `bit!` macro at some point.

> This is why I was getting bit grumpy in previous about long lines.
> Fair enough if this is only option, but it's not nice for a review proces=
s
> that relies on patches!

This should be using the kernel imports style, which should make a
case like this more readable:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

I hope that helps!

Cheers,
Miguel
