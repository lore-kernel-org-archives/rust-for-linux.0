Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817928D845
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752659184; cv=none; b=H6JfRJxYyvpDd9/ioIHJQzT1BTqF1Xpcj2YbB6CBFZbWD8glqv7OX8r2uqbjFtWlUMcaz9hBiY3jVpHoI++F11JpmvfrOgBvzIZHmX3Uwmq3pm6mJy5wHB0LZLMFjRWtYwOoL/3GfmGXQDG10SlR7/dqYCE3ssxOqRvaqSyiAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752659184; c=relaxed/simple;
	bh=sK9WdAzJkT35n2OrnV74SnqD1oF6VrhrbQmeYrx4i6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXoJ484gxXSCxzTQ3iJROvzfmzOVQJwq551IYpilq64SQodXKEAjtaagILcLxE113z7INwe65Pa0HKw+ehB5/DZ98mkdQGO6IQtUMhcxeB3WIdrGKkw1L4GBv+Sjbu3wjoK+AMvjKYjxwsAyCbdmA2O60nAX0iFZ2mupZ1iAjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jFdWCxZO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jFdWCxZO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so46651965e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752659181; x=1753263981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unJc0BdBQI7iWQUSRrhzhQU8c9VKJ16+VGuE1/wwC/M=;
        b=jFdWCxZO/PWYEvCk3nk0q2hbPkOGwrsJD/viZjcHSiSpS5vGSVGXap6Va+ugR7wRqH
         hqVtn+K8KecePgedmF7iCmSXVLG58zTrFNhCFTKrjls/6FRkrhFUe1uaCHz1iiqA4TgN
         G0bsAJTvtQ4yCh9WEYSo9k4WoU1TVZg5fn34n1QkCNizJDhP3RNz58Ez3wtkLGzRyaTY
         p5vpPbH8r02mgTbH1aL1yYH7e9/9/0TzLqwhncQrLxOLwiWbu2posmQ/swQsq96WvSuF
         tt9ftwVRsKPadpBoDiSQtruzsFVuU7RmTbSGd0qtFRflM1XVw5jWrv7hsVHjD566c2dd
         lhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659181; x=1753263981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unJc0BdBQI7iWQUSRrhzhQU8c9VKJ16+VGuE1/wwC/M=;
        b=kEZJGEOKyQwUQ684Rdbp5PLMogEEZ//Sb5Vej+977o+jDeVSo3K/S1rCbcH/UWnT0I
         rJZAe0h0GSbkJIUEPxycogXdN3+QxgDxYiy6oggHAUrhr/rDWrs7a+IbpBzNrhR9xLpX
         hcSyHU02ZD8OnLQnJ2mCG+unr1Z173g9foH0D4FSiXfpsV+KM3moPV6Riiffso4Ty4Qr
         YstK/uOG7lo+hMD1ShCi79GYWk6YdaSICsveyK+pZkzM5LNgt2GU9aN9GD6A1O/ZHleZ
         fPIg+VNuwjPpUZPmMxvbZ51ZQKaTD34Aq9yY7hf02dgujqOF/Vnql0FWIK1uxZPpAe6E
         i/8w==
X-Forwarded-Encrypted: i=1; AJvYcCVYJvuBSo6e1noIPhm3UAZ2b6K28tVN5yGc/nTjEReRoYO6kwK74Ra8AUDtqVmALvvjUQm6juZW1TqImydXdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/IfN1DV6wLd2x+2lekxM5hHXRLFyML9cDlymerzQuXGH3JjY
	57qrDW52hBhHlbjU1LJjBCnulPa2ctuQSFG6uq+dFkN8Ft7aOg7shWjws/6oi0AXtkvPatglzud
	YUA7xSkTgYOatwPC/BpSvjJki/cv95PtFvmUI2U6n
X-Gm-Gg: ASbGnctIdo8SzrDoKygLwTlA2c8a1vVwpwpYoVb4FLxSKpcOSbR8Qog3iQJtpRwoiU7
	dq3Kdf1iiim/NQDvXCe4o7sZBdF3+Hlt+nnnPhUIvZ2MKRyEGp/bKTn8cXzu+yq9suOEC64+55a
	xMTJUAIRxGcC6qmnoI9y1TASglhduIYwNMYp8tXeDKBo5o1ULPsunh+rVIgptvW/dD6Br0w5n4T
	1yXE2CP
X-Google-Smtp-Source: AGHT+IGJvynLQXA/LQk6fcdvOGBEcRDrc5pxDlC+y97uzcPtpCoY1GOnLHBKt5EXqBGMRmyPCzJQVsWFQZFmSoofD4Y=
X-Received: by 2002:a05:600c:c174:b0:456:1752:2b44 with SMTP id
 5b1f17b1804b1-4562e39126cmr18086275e9.23.1752659181173; Wed, 16 Jul 2025
 02:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715-align-min-allocator-v1-0-3e1b2a5516c0@google.com>
 <20250715-align-min-allocator-v1-2-3e1b2a5516c0@google.com> <DBCP0OLEAHAW.JC4AQHMVQW81@kernel.org>
In-Reply-To: <DBCP0OLEAHAW.JC4AQHMVQW81@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Jul 2025 11:46:08 +0200
X-Gm-Features: Ac12FXzX7ouyqpx1LVbRHdVZq8jMUt7yI_ccMl1Rky0bxaMou6U-Kfx8iWXzP3g
Message-ID: <CAH5fLgim-L2nDwrV689-0uizgpLy2pZL1BT3vyBbW7syejn1NA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: alloc: take the allocator into account for FOREIGN_ALIGN
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 4:19=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Jul 15, 2025 at 3:46 PM CEST, Alice Ryhl wrote:
> > diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> > index bffe72f44cb33a265018e67d92d9f0abe82f8e22..fd3f1e0b9c3b3437fb50d8f=
1b28c92bc7cefd565 100644
> > --- a/rust/kernel/alloc/kbox.rs
> > +++ b/rust/kernel/alloc/kbox.rs
> > @@ -400,12 +400,19 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flag=
s) -> Result<Self, E>
> >  }
> >
> >  // SAFETY: The pointer returned by `into_foreign` comes from a well al=
igned
> > -// pointer to `T`.
> > +// pointer to `T` allocated by `A`.
> >  unsafe impl<T: 'static, A> ForeignOwnable for Box<T, A>
> >  where
> >      A: Allocator,
> >  {
> > -    const FOREIGN_ALIGN: usize =3D core::mem::align_of::<T>();
> > +    const FOREIGN_ALIGN: usize =3D {
> > +        let mut align =3D core::mem::align_of::<T>();
> > +        if align < A::MIN_ALIGN {
> > +            align =3D A::MIN_ALIGN;
> > +        }
> > +        align
> > +    };
>
> Pretty unfortunate that core::cmp::max() can't be used from const context=
. :(
>
> What do you think about
>
>         const FOREIGN_ALIGN: usize =3D
>             if core::mem::align_of::<T>() < A::MIN_ALIGN {
>                 A::MIN_ALIGN
>             } else {
>                 core::mem::align_of::<T>()
>             };
>
> instead? I think that reads a bit better.

I don't mind doing that instead.

Alice
