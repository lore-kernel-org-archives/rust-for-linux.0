Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1BA3859EB
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398176; cv=pass; b=l2O/iq98KwSs6CYPbRDCFzsUalRCWaVLV8E1j9KjQJcV+5HZq+hlrWav1GvR0RDVoJfHW24eMRfyTz/iVKFgAmZbqGZ3T/WH9VToMXBfulkxF9qB0Vw1W30HRq/2ytZAxd6IYJs5Qo1Jlw8DfwggpKmE1bALS7cz8z7+nk3M4yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398176; c=relaxed/simple;
	bh=8g5q3C7nsRWNNtihsDdWzjoOptctN5Xc2r4pN5gjoAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npwCgxwFRt2lLPcfuR2vq1Oygj+M6p/7TIH9eK1g+a99W/SXwk/dOntJlntVUWzajvZLjSFR0Zy2OdidrhNW/d/7KPNakYA9q669iGIRtp4l1WFlkC/fiWr2XDRi3TFv6u92dIO8RnPq2OsRFnogQDMN+eVKqz50mzENPXgKEm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s/1tPuQ3; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s/1tPuQ3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1581091f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 03:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773398173; cv=none;
        d=google.com; s=arc-20240605;
        b=JTkjdmtiQ2lWilTdVCvSqNg04VT/AA65A/2y6hp458YKRUClfiVf2tid1D2iFkhm9O
         vJjKJ86fX3f0j2DizeYoJOfBhFnX1zVWVqjUUWfJ2yCkAK1oQ9C6SH9F1uNsOk/8/K6l
         iC1ddHRoJdzKrWvqw6hPvclQ45sTMKqDlNgBaKonqalX7yvJ2BototwPDKLobc6PKOKt
         Pwkpds8WpSL313D+dzzbGdkS+cSypO1Z+j/ruf0VSXqbT8cU4JotNKsFe2Wq+bBHwfW9
         jjlwCmeOMoeS0j9toXk4Xryq6r9K9l/1Qfq1HHzblCVVdK7WpeGTNaml3yCG358czqiD
         kwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/w5DLUFTZVMWmc49ACjqJvi6te4AWIx+IOTh3G/EERU=;
        fh=ezWAISWk8s8xjCpq7dSl9HyLoRh6rxmohZaJLytbqog=;
        b=E+uc5iZ6G61zQkS5He17s9sCnjJmcNZz/fqCvhksD0VhjIDMNUAqP5kIYvX9hHXI2F
         qFzQLwYnbT68ldLT5La04Q+VafP6Yugb+vUsx8MApVxMaWrciYJam2S02C835z6M7US4
         5tLfoVHE2C0nyA0exwOHzOTf+uiHYQL1y3CQ4fgw4bfqIfeHXz/ddMND7auoPx1x2ZpM
         5p891szCdcw+hgIV6BEROw+MvfB1IOADhF/Ba0MKmzfUga9V0wdk9+3sF4B9h6ZqEdQT
         8vnUpNTaYl6E8reIWmGjtKfH4xYnymNdAmgcfcsmDcMNMSs8mX6hkrRgz+n5asLwZ7WH
         dTQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773398173; x=1774002973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w5DLUFTZVMWmc49ACjqJvi6te4AWIx+IOTh3G/EERU=;
        b=s/1tPuQ3pvsnKiJ6NNFhcZW2U162K2KIl9xpqvLj/XgXR/hzWGHjw+T+wEh0ksRAR5
         X8F7nrxs4jRGj8G3aySYrvo6DG181oe1CAQRq1qGYhzoiDzvh9/+I4JNRZ1eg6EgU7/2
         uxNgZgBoeZtsckXPw4XrAVqpqmkawRqwzW86M6FntDSDFhk6cjWBC+PAH8migQrBygPq
         ypsK1cP8k5ZpAQM2PqWZGzQN3pTmJYAMpBhDgNyta2YFNkEyjcTLLI6P1uXTaW/P+WAU
         Nv9qjdzBGh1kzjQ0rTIuTFcDB1J3NkJeQ7AHL6op9a7rz+MD1KgNrQ20QaN+K1joYK47
         n19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398173; x=1774002973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/w5DLUFTZVMWmc49ACjqJvi6te4AWIx+IOTh3G/EERU=;
        b=YGyU9ghl/WsDby30U5pWkLqRGYCLmqrZoTfZAhFOThEMbkMUBT0EpBysnEOfKX6YWz
         1/TEBXEAg5Cd080EJNQKJa0j835eAOYSNuw8HBfEAPa5zTnxrrqp67cWm87sBaHYIrf2
         ZCy+UhbzldHp+Q9WMZhIAq2PAeW9TbOA38mx3eY+CVGAH6BybKBkibAsTEvnK3LRYdQ5
         BqrkwnCKX6KELqVGMUfOKj5P0mQJ7Ygr9mESHiExvMrv8XJZ7h/6Mu6WbACCwQWKfMXE
         NVCUis1rELHX2HD8lgWUB7iBQbGhn184SpiIQVyjLOy/Vwz6Z0TGyOGFInOUrD+QqxBq
         TDhg==
X-Forwarded-Encrypted: i=1; AJvYcCVegiWvFxIj1bWCdQ6jMEtyilXFS6Y02tuvFXdFRU6ewv6OQURrlQaoSJ7vF3jCOljCYnFpXfd4GHwLbFEKgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvg0/fYVxVIGYjdHS7qYy2wnVNnH24d0U/AO/sUqcSChMoWriO
	6qXFIrfqvwWt6C26nepfypwmMgHmTYR3R+c4hapRhkb1Qkm1Ac7khM0zV9CB/LuoLm0kuY2PYVt
	vfUmqDwcLYhnQiBA79UuY4MCHTM25rSY+9y+7qtd7
X-Gm-Gg: ATEYQzyEV34+kcgUx0thJxYdTlhWt5SNY/WTElbGq4hfb+d/LbMcfj6ZUsI8LljWBaN
	u5UkEj0bg+g9k5CcKczVY9HIFmAKFMXiCwQAjMCYFFJjXdkhYuSW9zHmdP4ARnXxOVnGqo5X4qp
	oPedLiJV1I9+qrSo8WxN3Vi+nkG4Sb6xBpbUAMQ7B2P44p8VC2AXED5Gutt6ldYuixWPnMi9oAk
	sld5mRwXY6JcOb+3Xc8+30J/DZbSxlbUqrzRPY0Iowppg4jyFhOC/tQOjgAk0FsCrEDWWXOwDsZ
	9xlOAaW0XVy0TnSAUbwmO4212i0eSkOxuZ22huid+9kkyMK88qktQWeqznz+FbsKOyaU0A==
X-Received: by 2002:a05:6000:2903:b0:439:d7e1:fc51 with SMTP id
 ffacd0b85a97d-43a04dbeec1mr5539039f8f.36.1773398172510; Fri, 13 Mar 2026
 03:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-8-alistair.francis@wdc.com> <8403c8b7a832b5274743816eb77abfa4@garyguo.net>
 <CAKmqyKMXmn6=suyjhB3Kq12-UHuLbPLOHPd2JO2b3Nxn4jYHpw@mail.gmail.com>
In-Reply-To: <CAKmqyKMXmn6=suyjhB3Kq12-UHuLbPLOHPd2JO2b3Nxn4jYHpw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Mar 2026 11:35:59 +0100
X-Gm-Features: AaiRm53JNqGQ31WbLp4l7arJWG84T-kzONXay54ApMwLtspn9NZSDJv5HhHLQcU
Message-ID: <CAH5fLggOnVguVErjySphX__vs3iYAo4O+J6hrXW546JrWSq5ZA@mail.gmail.com>
Subject: Re: [RFC v3 07/27] rust: error: impl From<FromBytesWithNulError> for
 Kernel Error
To: Alistair Francis <alistair23@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, Jonathan.Cameron@huawei.com, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, boqun.feng@gmail.com, 
	a.hindborg@kernel.org, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	ojeda@kernel.org, wilfred.mallawa@wdc.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 3:20=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Fri, Feb 20, 2026 at 12:49=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
> >
> > On 2026-02-11 03:29, alistair23@gmail.com wrote:
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > Implement From<FromBytesWithNulError> for the Kernel Error type
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  rust/kernel/error.rs | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> > > index 258b12afdcba..569d9d032ab3 100644
> > > --- a/rust/kernel/error.rs
> > > +++ b/rust/kernel/error.rs
> > > @@ -12,6 +12,7 @@
> > >      str::CStr,
> > >  };
> > >
> > > +use core::ffi::FromBytesWithNulError;
> > >  use core::num::NonZeroI32;
> > >  use core::num::TryFromIntError;
> > >  use core::str::Utf8Error;
> > > @@ -251,6 +252,12 @@ fn from(e: core::convert::Infallible) -> Error {
> > >      }
> > >  }
> > >
> > > +impl From<FromBytesWithNulError> for Error {
> > > +    fn from(_: FromBytesWithNulError) -> Error {
> > > +        code::EINVAL
> > > +    }
> > > +}
> >
> > Are we sure that `FromBytesWithNulError` maps cleanly to the `EINVAL`
> > error code?
>
> `FromBytesWithNulError` means "An error indicating that a nul byte was
> not in the expected position." [1]
>
> To me that maps with `EINVAL`
>
> 1: https://doc.rust-lang.org/std/ffi/enum.FromBytesWithNulError.html
>
> >
> > Anyhow, please add `#[inline]` for such simple functions.
>
> I can, just noting that none of the others have `#[inline]`

I think add #[inline] to these could be a nice easy issue for new
contributors. If you want, you can open an issue on our github.
Alice
