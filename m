Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6DE13633F
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753629724; cv=none; b=rInAWYA+j+NHQ/qhZzPehjMD9KO/PqUmNHtv3GZQRxwRt1Es16ytm5KScbsrKmN1PGrhTqJAapwPJhjQSr4WBwe/kwUGI1P+prto+U+MCLRBQVUcztFurOJEN7BNwH17k+N21dGLNkkUvrIgBbajbN/fliKTNUhDNCupAwkPvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753629724; c=relaxed/simple;
	bh=Po3qHfXG4RDsmYL5ZG1PeIcj5n22Sx0AhA/NR33X4U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcSc1+3NqRXeXmUUBeCFNMEKjcuX6RHcWCSHGw6av4F1uOybsbXY2BFvdZtMuqjLLh8O6zE5OtWfTU9KuE2R9Km/RI9NnieKkPum0FFkwj4fmzd0p3yZZT8Ju5n06Cu5Mi+Qxa9WIBzacIuLxshKLgF4g2UEzgBE9TqFYUAyh5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PCdO+Tk+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PCdO+Tk+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d7b50815so24373155e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753629721; x=1754234521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3sXyGIJ6PASoegDkygWEKucjl3q/H9sX5NxO7xaX7E=;
        b=PCdO+Tk+zlhRVhnwND9tOCA9tyTP/jFDz1Jh8LuwhndFOkCNZGcE1D7Y8jakQ1KTka
         OGzQENHIvs7N278ffEPDtT41mAfyRtn+Fo+agA/HQuhaXGG9/24EKVKYRh2zsENlPIWq
         fbAZsFGRmiHVusvPClY/lKE9dVpBumr7cJN2MnBmowXUiO9QfTpO1n//rPKDj6Jtb2EW
         Qi2TGrhPxQcIemC4UttzwxZk9+yaVLAeS9Lq0OvcrLa+WhTR+AY4gj/dG96dncat+S1u
         LUI8xcZNYw6qaXoM6PmGMcHK5wZGmI3c2f5hmLlXfnFKiLJqNbSWpM6d5dLmvEPQqKi4
         mlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753629721; x=1754234521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3sXyGIJ6PASoegDkygWEKucjl3q/H9sX5NxO7xaX7E=;
        b=DitVLJXN8qMxkmAle6FZh2khC+fEWV9rbI4QGTLsJOjOYUKvEskuLZW+rKT72rQqaT
         DqKUTwu55Jmaizss9/WlgHsbWDoW4NBR6X9Ziiuybd5R+ItcC1DfTB1FyFsaHb0eqM/Z
         nD9ylor7UV4UFFW5mkYiPZ5XsTd0ccC7E9YGiXNYlonduz9ABDibFWPwVJ1QH9BZpuo/
         KrlCRz4JSQEUGsXD8D7CX1M3jsSvVP1aw4AdHhsBUqMnQlTlPj7kRoiN0UYp0fSPwBSp
         vNFx7uacJ5rWifExfMb5Bk7RC7sC8UA6ihtTpH7UsFZfKGBlxRSzlSfN+mbBXexF/FML
         Gepw==
X-Forwarded-Encrypted: i=1; AJvYcCVBuUx/l/Cy048HMmahTaoeaAei4nthbZmRr3dLU9GEAEuiREr2O5Q6Vju/9bxSYyeYs7+fRtANQKOGpcEV3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtD9XzgKtP+lUgNpVY+Qk2IRYHTji0/GAg9J0Smq6dBS/FR3/T
	i/ie32cglLn+l/cWtysX/v7nDoeDK7VYvDON69qvyUK8UTqkg60aEWQ+jl1a8LDCLSqNWG1i7Kz
	ltwPYMOhCFHAYIA8HzYpNoHCy2PWz8KJrXPN31+Di
X-Gm-Gg: ASbGncuyFGv4Cl93GdaqlWq+mpE4F+udVRJSg52n31mGJmzos/GcHVGOuL4RyyauUuX
	TmYADUjiUUtHZEifHJ0ybx9FES245nbIvShd7SO9yqHrEgJJJE0zLswgWlMnIDKrJXXz7mDA9+g
	bV4tI59RYBF/ET1mlZ28p7wS6M/Qs9EnwYAugHUWrOJ7dOXZuONxmpC6YsXlzweIuKp/z0FnOOk
	IaDUh5P
X-Google-Smtp-Source: AGHT+IFPVSD6UtZYE7ccVbslqDPw6GjDiR87M3+N7c8lsSzNsDM84rNM37yFwEiy9b0EwoiMwDnKTltAeNqumXzJ4Dw=
X-Received: by 2002:a05:6000:4203:b0:3a4:f00b:69b6 with SMTP id
 ffacd0b85a97d-3b7766818c0mr5765848f8f.54.1753629721342; Sun, 27 Jul 2025
 08:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-as_bytes-v3-1-eb7514faab28@nvidia.com>
 <CAH5fLghNDDo0HKupPXe8G6z2TP4TJE881Bd76k0LDjSm75KcEQ@mail.gmail.com>
 <aIX-JDehurnGYppE@google.com> <DBMUEH5MYR2L.CXM12OIUH7TZ@kernel.org>
In-Reply-To: <DBMUEH5MYR2L.CXM12OIUH7TZ@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 27 Jul 2025 17:21:49 +0200
X-Gm-Features: Ac12FXxuw7B9pqg4skEpZ0pOaH-6NO8cvdAnxqQ71j--pw4gktabUDdpVNl6vNw
Message-ID: <CAH5fLggpqHAXekdLTxLu4XqvDDae6ctOu4b1FHQsUF+WVW30MQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: transmute: add `as_bytes` method for `AsBytes` trait
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, "Christian S. Lima" <christiansantoslima21@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 2:39=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Sun Jul 27, 2025 at 12:23 PM CEST, Alice Ryhl wrote:
> > On Sun, Jul 27, 2025 at 08:52:00AM +0200, Alice Ryhl wrote:
> >> On Sat, Jul 26, 2025 at 4:47=E2=80=AFAM Alexandre Courbot <acourbot@nv=
idia.com> wrote:
> >> > diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> >> > index 1c7d43771a37b90150de86699f114a2ffb84db91..69c46c19a89191d8a2ab=
c5801564cacda232218c 100644
> >> > --- a/rust/kernel/transmute.rs
> >> > +++ b/rust/kernel/transmute.rs
> >> > @@ -47,7 +47,16 @@ macro_rules! impl_frombytes {
> >> >  ///
> >> >  /// Values of this type may not contain any uninitialized bytes. Th=
is type must not have interior
> >> >  /// mutability.
> >> > -pub unsafe trait AsBytes {}
> >> > +pub unsafe trait AsBytes {
> >> > +    /// Returns `self` as a slice of bytes.
> >> > +    fn as_bytes(&self) -> &[u8] {
> >> > +        let data =3D core::ptr::from_ref(self).cast::<u8>();
> >> > +        let len =3D size_of_val(self);
> >> > +
> >> > +        // SAFETY: `data` is non-null and valid for `len * sizeof::=
<u8>()` bytes.
> >> > +        unsafe { core::slice::from_raw_parts(data, len) }
> >> > +    }
> >> > +}
> >>
> >> Let's also have an as_bytes_mut() method. I would require the type to
> >> also implement FromBytes as it lets you replace the value with another
> >> set of bytes.
> >
> > s/I would/It would/
> >
> > FromBytes is needed only for as_bytes_mut(), not for the existing
> > method.
>
> I agree with your suggestion, but it can be an independent patch and
> doesn't need to go in via this one, right?

Sure, that's fine.

Alice
