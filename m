Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0023504B
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 02:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773368451; cv=pass; b=kSPv7t+Ph654+yaobetxt7LrEfomftG36ElEB2FM1lLgHCBFQFfEArlhPVe7G2x7EtujeaAeQZ0hjhArbwA2Vec+TrRfruOeiY8QMyfhAcX6bPnf/uobcDPySIgkt/uaumsc0PJOVwHL42yPmofXW2eMV90rb3kHEzOTSXO3b9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773368451; c=relaxed/simple;
	bh=Nc3vSgPCiZyWTFw4ReuW9B3v4aeGpdG1apfFjxfTvD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ad5AxmVXM42QAgv8Zn9CO8rHEdlF3S+aU2Cc0hRg14kzJ41HH0GwbUGIWD2lHEUw9OtZ/0hAoSbMh/V0REZ5n2oxtxliHORd5l0+OMMM8xRhpeaLehMfDv7/FDcOcLFvOOdZVPCEf5RAOg+ThQ0FqEnZZQ1ZZvjNv7hk0HR//bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5m/2h4t; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5m/2h4t"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-661d929219bso1960932a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 19:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773368448; cv=none;
        d=google.com; s=arc-20240605;
        b=YtndiSwGwCGAOkM4lCpUTeQGwwZ3z/g/9ktURVr0Dii+BpOgp08fyuKJm0wFXuFvOW
         wXIkw1pc7s6JKtIbmCV8wysjPtAZgQxG8qQiFP0909QtQyWQZgv+f3COdbCUFhiqoqup
         rsq32rz/Uj4QonS0AY+12B8tzf9M0wwFCI2TTC6MALpNsIKRxjev+iF8joQqfCLiWZ0K
         YxpgYo2xxj8Zph/J21P4R0zSyb0td+NE2OaizSiP071DsfbhOnoHM/MKBzYzkg3gU5oe
         iZh+9yGsfTbM3pW0hnJO/ecB69F6XFkgu8h0u2Aee7Ys+8HmvS4Ogczct+9BJcTTB/qQ
         +R/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bF3o1la32fuvNbL6eogbD9OSVNGno1MaF2cdSSjD26g=;
        fh=FxmO40ejd5UyY+/NI7MU1pN0A8iUYhvlhx1g4qHdT50=;
        b=Of59U64rtaoVEfO79m+FAUAcRE255QLSltpZyy3OIKSIp+Nsgviw52IyjJ5whE4YcN
         cnaFSVLqDCHCy3cyeHDs8i+psAjOfz94ILViR33B/wWfg4vGHO5+B4V9dUxHreP21Iyq
         jlxG1LpTIsaKPCWCYPPdRvfOb7bbDVEL+NpKfeIlANEycD1Kv+pmXL0xA6RGUOtMD/Oz
         ZrEg47EZCXYDA2knx2Z7L2d6kOOzEsFWJwyuuOxLe1GB9NGBF35FHZDAiNNp+wNHAWAu
         8pvAruAdqdcJieGVU1h+1Ox0Oykpyn6tTSS0ixU1ARVV8/pINT9lCW+q7dWIRcwZQ+SS
         WpBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773368448; x=1773973248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF3o1la32fuvNbL6eogbD9OSVNGno1MaF2cdSSjD26g=;
        b=h5m/2h4tZSYh97yKPQKNRK5SkPzjkbsLDTs3h2w4/4UGx2qb5nct95DPQcMPjEmLvu
         QLz8mY/x9UqfIykNYB5GPFSB93REPQaQbSvZH460waH4nC2nP9bvd5BKNsndUcwP6Zf7
         Cdnybwni30ur9x4zy1pa6qts7Ggg9yDm3C+Q53o2EHPja3PYguRU9Lea81P+xJnazHFa
         jVqpIZtYCWZHdKquQhNfwgzwJnHquxXF3Sa8Drgc1PamUK8jq8E/SaxzG1ax3UasmBLG
         5XGKXBm5wXnrZC+MXV1OO/UlVfGlu2poukrA8a8ksFCmByoGzNleCWEQ4gq7Mw+uCM2C
         +Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773368448; x=1773973248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bF3o1la32fuvNbL6eogbD9OSVNGno1MaF2cdSSjD26g=;
        b=dqjAEc45nUHKRmRqeoZQWNnAgyshqWs1e8bitOfxASHzK+CzhNadi+Nlxfg98I8xvB
         rl0KjZoXysheasOgllcYqzZz0NlRWeWmC9FNY94+3aMGMCmhyAkn0pGPlzqKUV3taJuX
         qeRaPUdz28AFyTW3LNUE/UNTgVNhOR06B0cqpoCpLa+0iZ7VLPeZgicsteC0+nCRrWzx
         lnOGaQg0/jqlsLgpa5PpJEScJTV0EVDaac3C6JuMHR7ENNWYxrY/lhIGGGGUxndHGWpP
         0enBKvpyISi0o8BJKum0GX3WhikEXGW/yiAu21nMziu3L8spE84tlvLM4oOHr7SX0BEd
         daSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwyxOBzJcxSQqyzJhI/T4AZcqI1pJMjtyA3hGrh9E5/v5hUcuBVJcQRNxoV//MVZ0UI1DmkIZNhGSUaJ9jA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs76axHF1wfkMKMeutsVmPfr+/VbVANzDAnYDoZL6Z/60sCsMo
	p23svQtmVOHMdqlWtgDdq3zCQr7UMztyCPDBWHDhPUih3vp2ZDjwnweJwQtw+cDfpV40AEgng7V
	8szbjsUJcQrGTOk/x/yYRYFZMW07IKJ0=
X-Gm-Gg: ATEYQzyiBL70CkTBJb14aQ1xFDy66T2VADql+RuMXO4td7uM100tptzpz9aNu+3P8BT
	2JK8eHZV6fmzhuZNLsZciS6LIrCm/poxmV6uCvTRORqIN2geo6t2jY7PQ3Uehelp/ipJL5bTfni
	sH4EvrSqN87ClLx0wVzh0qSivB2TSAUxVBnDiEvIGuGV3PQDTfjZG7cz61zBlJblD4/4LxCj/ds
	DVS0HKHlLNKXGRYwOQk9ltkb7/qzl5X9xVoVtHIPduNva+MJj+TJMM9g50kGu7oRa8ESkf5QxLU
	nS6G6Niy74BnxEyF1rdhrRIUf91nyLRqKJEz9g==
X-Received: by 2002:a05:6402:35cd:b0:65b:edef:40b6 with SMTP id
 4fb4d7f45d1cf-663babb2796mr790403a12.6.1773368448051; Thu, 12 Mar 2026
 19:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-8-alistair.francis@wdc.com> <8403c8b7a832b5274743816eb77abfa4@garyguo.net>
In-Reply-To: <8403c8b7a832b5274743816eb77abfa4@garyguo.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2026 12:20:21 +1000
X-Gm-Features: AaiRm52El5V2cLVcjV-Q8_ZosbewKKcX058abV65Lg9yJW4Ibt_OSl9fj2Npv2A
Message-ID: <CAKmqyKMXmn6=suyjhB3Kq12-UHuLbPLOHPd2JO2b3Nxn4jYHpw@mail.gmail.com>
Subject: Re: [RFC v3 07/27] rust: error: impl From<FromBytesWithNulError> for
 Kernel Error
To: Gary Guo <gary@garyguo.net>
Cc: bhelgaas@google.com, lukas@wunner.de, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-pci@vger.kernel.org, 
	Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, wilfred.mallawa@wdc.com, 
	aliceryhl@google.com, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 12:49=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On 2026-02-11 03:29, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Implement From<FromBytesWithNulError> for the Kernel Error type
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  rust/kernel/error.rs | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> > index 258b12afdcba..569d9d032ab3 100644
> > --- a/rust/kernel/error.rs
> > +++ b/rust/kernel/error.rs
> > @@ -12,6 +12,7 @@
> >      str::CStr,
> >  };
> >
> > +use core::ffi::FromBytesWithNulError;
> >  use core::num::NonZeroI32;
> >  use core::num::TryFromIntError;
> >  use core::str::Utf8Error;
> > @@ -251,6 +252,12 @@ fn from(e: core::convert::Infallible) -> Error {
> >      }
> >  }
> >
> > +impl From<FromBytesWithNulError> for Error {
> > +    fn from(_: FromBytesWithNulError) -> Error {
> > +        code::EINVAL
> > +    }
> > +}
>
> Are we sure that `FromBytesWithNulError` maps cleanly to the `EINVAL`
> error code?

`FromBytesWithNulError` means "An error indicating that a nul byte was
not in the expected position." [1]

To me that maps with `EINVAL`

1: https://doc.rust-lang.org/std/ffi/enum.FromBytesWithNulError.html

>
> Anyhow, please add `#[inline]` for such simple functions.

I can, just noting that none of the others have `#[inline]`

Alistair

>
> Best,
> Gary
>
> > +
> >  /// A [`Result`] with an [`Error`] error type.
> >  ///
> >  /// To be used as the return type for functions that may fail.
