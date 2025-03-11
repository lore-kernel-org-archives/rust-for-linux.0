Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30D22FF42
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688044; cv=none; b=mHuU9FDY9sRmfZ2n1ebkE6v0WXR1REsKC4ODI6Df7sPPupWGayX7YGspo6U3/ICGljTBlDdf8buKdeS55/8uetfgtzxbVQhr60S+XFg3qBEGx6s/M0qtonGlFNh/dE+gjNI9C5qErd7TzFYuFiJvKMqh0DHnN8oOg8cSHXWNPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688044; c=relaxed/simple;
	bh=794aUF8aT5RtUCA1W8S8mWuIs9X87hy//ZVZ105DGrM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KUb2UUA3HQAiB1VLDC0J2bBwUXLTleAyEolO5RkUssxID5v6s4fSP7itKKvtrT4xNcOTkCENi8eF86l5s3wkSGiZR4LEd0V8H75XBqfEqK0pT2je9H0RWbj6aU7r+6H6BNXIES5BKRqLQIVFyMKCMUuM6MIHFXhVg3+3Pncns9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/EfJZHY; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/EfJZHY"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39130f02631so2034687f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741688041; x=1742292841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76XLIKmBPGbPkpHodLQEwOqQeh98tsdwIlAdA3e7Be0=;
        b=j/EfJZHYrO85cljGKP8q0Rv/LOzNl/aiJ8NSUFmMtOckGDx0r6Uqtd3/XUK9ReyE+0
         ULW6MjyFI7nhGZeZpj6RPczNfDA5OTGQ5OcW4OfIu+1WwRBfvWKZjU5ay01YtueGSr6d
         O1sAHWPv6v2tClDWzkLxfxeOPqJnFb4PRv8Y+YFFEPpPRij/xgCbUOari+fp4otQwzK+
         Vs69LwFH5rgQXp+7ZO2qaVNvJ2qRKF/FWBQifcxedNJCriazXEHhLcudjU9/6IF3DJUh
         YaG2I8+cMtNZKhf3ThQ7r8Me1bwinnkeq3nFXDcS3kikH7pnCYu6sZnt4YY9IOHb/tMv
         iNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688041; x=1742292841;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=76XLIKmBPGbPkpHodLQEwOqQeh98tsdwIlAdA3e7Be0=;
        b=NvjSV6XBYXku9QJkO9sSA1L5CBwHD0NEvlt4jTGDWoJ2zr8NRhF01ja/CfBklv3s+Y
         AtbhRTJQF0SPzKPSxYA63OHzWqKZV12jGKMMr/TdcVC4L4Y+5hfRuoa92I4Q1XY+maTq
         lQKzE2402TdPFchTLD+notrDPHMIkMkdAYeG/SZ749rjzdmIo56nycNT2grQK3n0rz2r
         KqcOwTBZHA5g9VqyESSobg+aUYc90dCYdMA4nPBzx974Ec0aWgHbg5BDRleSBRgLzP5f
         YudPqFRM2Gks1uLH5HhbCL9N3tmzzi88ovueBedTgaVz+V78nyFZRMu4NOG8NCix+ueY
         KpJg==
X-Forwarded-Encrypted: i=1; AJvYcCVmK2mrYm/W/UQK3u9ky3J0SltNRXz+mtdYk5eLvTiWj2pJrAR3qb1v6SBxBeaXpzYOqw0h7BzjByuZpf7PBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2r1nucE5e7Mr98ISD7XebDLEEhhiVsKlTqIJEkNZZFa6qPgG
	GnBA9SN2AhC1niUkpBXAX27OfodNNsNQaEb/gAwAZzrGPigLluzjiL8umj5GBaY98Xu6TZPZURw
	6Au0OKk2w/pbW2g==
X-Google-Smtp-Source: AGHT+IFJVzLeFx7L0yyWjDJgVw/RWiflq5x78L5FY3pE8LtKm0n7pMwPUKo8oJWv4kX2v6gGp6/XzcFbeRoqDl4=
X-Received: from wmbep27.prod.google.com ([2002:a05:600c:841b:b0:43c:fe99:2bc5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5983:0:b0:38d:b325:471f with SMTP id ffacd0b85a97d-392641bd0fcmr3471236f8f.15.1741688041067;
 Tue, 11 Mar 2025 03:14:01 -0700 (PDT)
Date: Tue, 11 Mar 2025 10:13:59 +0000
In-Reply-To: <CAJ-ks9nR9AcqK8WfHDshG4h+K9PzEa8Lwr3odn99r34y=zzWgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250310161947.1767855-2-bqe@google.com> <CAJ-ks9nR9AcqK8WfHDshG4h+K9PzEa8Lwr3odn99r34y=zzWgA@mail.gmail.com>
Message-ID: <Z9AM57PG08UuijDB@google.com>
Subject: Re: [PATCH v3] rust: add bindings and API for bitmap.h and bitops.h.
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 12:44:59PM -0400, Tamir Duberstein wrote:
> Hi Burak, some comments inline. Hopefully I haven't missed important
> context from previous versions.
>=20
> On Mon, Mar 10, 2025 at 12:21=E2=80=AFPM Burak Emir <bqe@google.com> wrot=
e:
> > +/// # Invariants
> > +///
> > +/// * `ptr` is obtained from a successful call to `bitmap_zalloc` and
> > +///   holds the address of an initialized array of unsigned long
> > +///   that is large enough to hold `nbits` bits.
> > +pub struct Bitmap {
> > +    /// Pointer to an array of unsigned long.
> > +    ptr: NonNull<usize>,
> > +    /// How many bits this bitmap stores. Must be < 2^32.
> > +    nbits: usize,
>=20
> How come this isn't held as u32? There's a lot of conversion to u32
> sprinkled around.

Then we would need conversions to usize in other places. I think the
right choice of type in the public API here is usize, but the underlying
C API uses int in various places.

> > +#[cold]
> > +fn panic_not_in_bounds_lt(arg: &'static str, len: usize, val: usize) -=
> ! {
> > +    panic!("{arg} must be less than length {len}, was {val}");
> > +}
>=20
> Have you considered using build_error or returning an error?

I think using build error for these is a bad idea. It's a hack that Rust
doesn't support well, and the optimizer will not always be able to prove
that the integer is in bounds.

> > +    /// Constructs a new [`Bitmap`].
> > +    ///
> > +    /// Fails with AllocError if `nbits` is greater than or equal to 2=
^32,
> > +    /// or when the bitmap could not be allocated.
> > +    ///
> > +    /// # Example
> > +    ///
> > +    /// ```
> > +    /// # use kernel::bitmap::Bitmap;
> > +    ///
> > +    /// fn new_bitmap() -> Bitmap {
> > +    ///   Bitmap::new(128, GFP_KERNEL).unwrap()
> > +    /// }
> > +    /// ```
> > +    #[inline]
> > +    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError>=
 {
> > +        if let Ok(nbits_u32) =3D u32::try_from(nbits) {
> > +            // SAFETY: nbits =3D=3D 0 is permitted and nbits fits in u=
32.
> > +            let ptr =3D unsafe { bindings::bitmap_zalloc(nbits_u32, fl=
ags.as_raw()) };
> > +            // Zero-size allocation is ok and yields a dangling pointe=
r.
> > +            let ptr =3D NonNull::new(ptr).ok_or(AllocError)?;
> > +            Ok(Bitmap { ptr, nbits })
> > +        } else {
> > +            Err(AllocError)
> > +        }
> > +    }
>=20
> Similar question to above: why return an error here but panic in the sett=
ers?

Out of memory is something the caller must handle. There's no way for
the caller to avoid it.

Out of bounds is a bug in the caller. The caller can avoid it by not
passing too large indices.

Alice
