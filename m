Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A71DE3CA
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378188; cv=none; b=UCo1pn3KmQIK4DgPuznPiUd5uFqV4l+c/wL4vMniapFF9nZbmZli5QbSUYLC2CC5AN8kj+hqWytIllYBcolY6yAx32PXu/VZmCdyP0/5IVQCnfZvl6Ns2dncXY6og5Gbs426TJLdMuU7ty9ijq2Jh7c3V5szParrXHIzUbS9tUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378188; c=relaxed/simple;
	bh=RmgNm1nDHO9RlsbxEiD9oNPhmDJbDfGeZDi6Vt+beEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pj6xnI1viBXIlQmsjxg4x1TZyYYQ5ZMneojcJBTQIhT71Lw2lDWVo6GsN3px7kTR1+9I5RPQmO+42l4uaReqpN2a1piK/z7cQDLCgSrcVsHMfllxYPfQubIFvUupzJWnDCNG6RCSEP0ub/V0JIt8xi21bVM4KEYNZF0tP7a3j6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DcFC/dXR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DcFC/dXR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0618746bso15202385e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744378185; x=1744982985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjaZIMQ5UK3X7Tk2MqXsN70Z2ISqXinE39QWpkxZl7E=;
        b=DcFC/dXRdpwgHBw+yi/84kvOPhp3tsMZBxoPYwcEbnhM1RUP63pfPNGmuQG7C70MKT
         q3TlJSgjZtbegac5Oam9eLY5pO3xLkqjkxJTWgDpkDqtZkIxjGOTAHFu0LGQtwfH79Tl
         KJXfnlgwDDpJSYSx+2yfVfh1dVd2w+rGJWGb0lIce/LqpPc0gu+0/ek5nOAUYmJqtEhK
         qHqGq3QMRp8IPNMmNqtmaOg7XOvmRM77HHackGR6c9Rp5toNt9pASl3N938r02UdU9o6
         ofy2MNgGJ/x97PsmOeLmuRp2loKMI85sA9iuwz/Y3dcxPvWIrSIgUXJtDTW96wtNVrch
         y2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378185; x=1744982985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjaZIMQ5UK3X7Tk2MqXsN70Z2ISqXinE39QWpkxZl7E=;
        b=qJ2XMRuWr+kg7QWdXCyicxQJILimyh8N5UuzoSgvuvbOCnrO4RvTxKmTmOD41/hh4N
         Cg9VXwtTw5J0joCYa5gl9oJ5f31cz+iPa3xNXS3Ko0jwcg2JGVFmPfS2COeoaVDKwrKF
         o4cFypMhp9jR+BSPd83n/mSVAD94gQtdG8YI+9s6oxYXnefwFZOlyhSj7Vbasq9oi0BK
         yP4bYsS9puM/TQIidxjD4giCsZdCF++Btc217zN0OtLlcRbaqrkcyw8GhMqlsxEOSWuN
         FES0a/Yvu8WA2vCjlb0kaVIdqt88ojcK/sytpglhsuvZLSY8z5VmJwbA/WNgLbWlCef0
         KHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuw+wKK3PkuxHEzZ8xvmXbgxja6fhkz++aR7PuuMCs7P/ZCYbYYumdN6JwuxAApoBVQQ+aZtAWrZelXhjsWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDkPkwi2LJNk6uD0gKUACL+6mPXBjKbTcxHcrbtYoGYNFMTO5
	M+UmNQxddeXPMJ7gojQl9tAWi5wc95pHJ3Soh5Pnmgaul2TLzGMMM+i0dSzxcChg6Ylz5BfqTfp
	bjJR0VdrgYMWz1bisSegkpnqYZv54z7ZzQfPv
X-Gm-Gg: ASbGncsVVj2DWJr9a8BRWGnH4OS3RymNEU5UtzLWm1p/tvVh0IDRr+abLbub6KriMAN
	cddmILLMa5B3JQf6drl4S2YdomMGol1+GesQrkvdMnNEVBsuXF35wy2YIfUp4iICqpCAQMeQQ8i
	1eDgDeuO6hIBKLObcIWy/Kg3rdJODAU7g3XA==
X-Google-Smtp-Source: AGHT+IE7vBDw6mW6uo8KLBNqrNzC34hWMMXWeTpzF1qijBMKErhTFhtpmhT/EtMZPiZ+oH+bv8k0GXcSkGJnEdIRF7k=
X-Received: by 2002:a05:6000:1a8e:b0:390:fe8b:f442 with SMTP id
 ffacd0b85a97d-39eaaecac96mr2284507f8f.54.1744378184806; Fri, 11 Apr 2025
 06:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
 <Z_jakOS8mciIpxy0@google.com> <CAJ-ks9kEMwpDoys=RJGfWvyLdRco_Lm1984KSmju7mio5_5_WA@mail.gmail.com>
 <D93TAL6PHO34.2WCMTNVGUY522@proton.me> <CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com>
 <CAJ-ks9k_0Ly1nG5jDYQZL=GQ26FVajekCaMQ9C3MOK9VknZssg@mail.gmail.com>
In-Reply-To: <CAJ-ks9k_0Ly1nG5jDYQZL=GQ26FVajekCaMQ9C3MOK9VknZssg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Apr 2025 15:29:31 +0200
X-Gm-Features: ATxdqUEIIYBv_s5oYArKvrMqN7hPUhiCu1Lr7_5rtUN7yrxa00bRKtmxqCiZRJU
Message-ID: <CAH5fLggDVVwfsxVqOojcib3v0COqyatCisQem5z+CUC7aaLDww@mail.gmail.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 3:09=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Apr 11, 2025 at 8:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Fri, Apr 11, 2025 at 2:35=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> > >
> > > On Fri Apr 11, 2025 at 2:25 PM CEST, Tamir Duberstein wrote:
> > > > On Fri, Apr 11, 2025 at 5:02=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > >> On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
> > > >> > @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) =
-> ! {
> > > >> >  #[macro_export]
> > > >> >  macro_rules! container_of {
> > > >> >      ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > > >> > -        let ptr =3D $ptr as *const _ as *const u8;
> > > >> >          let offset: usize =3D ::core::mem::offset_of!($type, $(=
$f)*);
> > > >> > -        ptr.sub(offset) as *const $type
> > > >> > +        $ptr.byte_sub(offset).cast::<$type>()
> > > >> >      }}
> > > >> >  }
> > > >>
> > > >> This implementation does not check the type of `ptr`. Would we not=
 want
> > > >> it to have the type of the field?
> > > >
> > > > I might be missing it but ISTM that the current implementation does=
n't
> > > > check that either.
> > > >
> > > > It's not obvious to me how you'd implement such a check; given `$pt=
r`
> > > > and `$f`, how do you get your hands on the type of `$ptr->$($f)*`?
> > >
> > > I don't think it's possible with current rust, but maybe with field
> > > projection (:
> > >
> > >     ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > >         // do not run this code, only use it for type-checking:
> > >         let _ =3D || {
> > >             let mut ptr =3D $ptr;
> > >             ptr =3D $ptr.cast::<<field_of!($t, $($f)*) as Field>::Typ=
e>();
> > >         };
> > >         let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> > >         $ptr.byte_sub(offset).cast::<$type>()
> > >     }}
> >
> > You can definitely implement the check with current Rust. You use
> > addr_of! to create a raw pointer with the type of the field, and
> > trigger a type error if `ptr` doesn't have the same type as that other
> > pointer. Something along these lines would do it:
> >
> > let mut ptr =3D $ptr;
> > let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
> > let container =3D ptr.byte_sub(offset).cast::<$type>();
> > if false {
> >     ptr =3D ::core::ptr::addr_of!((*container).$($f)*).cast_mut();
> > }
> > container
>
> It's a nice idea. Wouldn't it require `$ptr` to be `*mut _` and not
> work with `*const _`?

As far as I can tell, it should work with const pointers too. The rhs
of the last assignment gets downgraded back to a const pointer in that
case.

> In any case, I hope we agree that this can be
> done separately.

Yes, since the feature does not exist today, it can happen separately.

Alice
