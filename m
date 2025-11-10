Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B147D314D0A
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787499; cv=none; b=dB/YB4P9GIrGzo6juLSoB4BcjFbDOYap9KNiNXWqWfhQWVsApR7MKf8RtxokqzWSzxxZxF3Hw59juEBfI9rL0DXIT65tYgCc2gu8NEYuS00C1/kJlR/pxVECscocRV0Fi/9iDhXPPicMWGdQ+ciQhRPNtFocDiWhc/p4BcFrauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787499; c=relaxed/simple;
	bh=e41KUEQkCI83Pj0eBDnULI9EieLfc+PrPGbBZCQVW34=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d1A1VZJLGtDZAnZpqpCSTIQ8DbDsLSnGjBULuTlICL/Ok09rCiL2HDXV2EKszw+kR450C/gYBSve2gRjdOYeE2r1J2mFJVd+gMOrqPf3D71OkjaFP1skNdARpgTfcV5A1aBlM62VPxzhgdYHx68Ctg3OjsU6zAKFb5P4po1Yl2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AHYgGko0; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AHYgGko0"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6417a4b67f9so1288684a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 07:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762787496; x=1763392296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVuIBWwz8TeHXsPjnU/vf4FRd0BvXZesO2CMM5Oe16o=;
        b=AHYgGko0XqrhEA1vif2W2eAIEnrMJQ9otUv4QFV8jJ6u9ADBg74mVqSFw0vXAirAQG
         vqrbxCA7ZIwUJtdwRhwmK2nHGauxaDAJ+D5v/adfwK2iwKBBoqFC2/UnUnxZnMxyrHzr
         cLFkD5WH7TPZUWOeRoPYk6kDensha1an8XMHXL7hqLfguKAtzSxnSh1KN2LzTPnCiENc
         LxebE0Wqn1a0z/zpSQR6bk7LRR6xBMGhtiKQnn6SHebbab0K0OzxWlIUas8nIcHiOikS
         yX+LLG1N9WMWfbmju+EROFvmXENxp3fE0uLSW8aqRurrFdrTCQXM+0QU8G85MF7GInsz
         kkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787496; x=1763392296;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bVuIBWwz8TeHXsPjnU/vf4FRd0BvXZesO2CMM5Oe16o=;
        b=rK+TJD1CXswjpfXCKfFT4gxcPoG8FIXhQfmntf72C92obiRnFE8zAmDDoM6SPj2O5w
         AD21vbn5J7YFnaSbx88XgmV63jGG0E36BETZqYZpLgbQTcL4ohDrhXVBOXci1kl4k2mY
         FF4yWYfGJvre4MqKOB6ijNX+yZZm9/lhO0LiRqjQA5i2h18wa6MXcWQ3I3IhE9HBw24b
         3uMCQ1Zw5YF0/yXlJxbjaa06mvjmlJ+VBLe2qkWbTLX6j02RvI8gGRx4W2Z4RP4PFHan
         8L3blTPvQj7UeI5VgZ8Ystvyw7FIrzF94/TeyUn2L0NivdCuG6kjmnEpKSCt0nztI8cw
         xQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCX6BElEERQaJFu9xh9nym58PZdfGBi98sp3J5/Dwjk+x0v7t/eHOI4R6F7tYj9aw10Gw/QdNPwc8HEiDeHIkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU2rcDmAnhZJ3p8ZI9Ol9bbBvG3kkJwql0wqpuP2QFgWHo3pfU
	CFDx9Vo9kQmFZBQWna2BrmHhG0bQLnvvfGzwdJpus1miZZIUR5kegJczkHVhv1giUxeV3z6zhVj
	+NB41RXglJGaWWh4YWQ==
X-Google-Smtp-Source: AGHT+IFcz9xhXtdSWWsSNnakXTmc94w8f4qYVgDYqMrImPS2rfopKwtNGIQ99/JJqYZQESgV4WJXhLDpColfHEE=
X-Received: from edr25.prod.google.com ([2002:a05:6402:44d9:b0:641:1f23:7304])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4408:b0:63e:600b:bc86 with SMTP id 4fb4d7f45d1cf-6415dc19b19mr6937044a12.14.1762787495992;
 Mon, 10 Nov 2025 07:11:35 -0800 (PST)
Date: Mon, 10 Nov 2025 15:11:35 +0000
In-Reply-To: <aRH-ScufjvGYPx5W@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
 <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com> <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
 <aRH0oRU5JXKpAKpB@google.com> <aRH-ScufjvGYPx5W@yury>
Message-ID: <aRIAp3LHs0NsEKvL@google.com>
Subject: Re: [PATCH v4 1/6] rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN constants
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:01:29AM -0500, Yury Norov wrote:
> On Mon, Nov 10, 2025 at 02:20:17PM +0000, Alice Ryhl wrote:
> > On Mon, Nov 10, 2025 at 08:59:36AM -0500, Tamir Duberstein wrote:
> > > On Mon, Nov 10, 2025 at 8:06=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > To avoid hard-coding these values in drivers, define constants for =
them
> > > > that drivers can reference.
> > > >
> > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > Reviewed-by: Burak Emir <bqe@google.com>
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/bitmap.rs | 16 +++++++++++-----
> > > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > > index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..15fa23b45054b927241=
5fcc000e3e3b52c74d7c1 100644
> > > > --- a/rust/kernel/bitmap.rs
> > > > +++ b/rust/kernel/bitmap.rs
> > > > @@ -149,14 +149,14 @@ macro_rules! bitmap_assert_return {
> > > >  ///
> > > >  /// # Invariants
> > > >  ///
> > > > -/// * `nbits` is `<=3D i32::MAX` and never changes.
> > > > +/// * `nbits` is `<=3D MAX_LEN`.
> > > >  /// * if `nbits <=3D bindings::BITS_PER_LONG`, then `repr` is a `u=
size`.
> > >=20
> > > Should this and other references to bindings::BITS_PER_LONG be
> > > `NO_ALLOC_MAX_LEN` instead?
> >=20
> > Ah yeah it probably makes sense to update this in a bunch of places.
>=20
> Yes, please.=20
>=20
> NO_ALLOC sounds a bit weird in exported API. Maybe NBITS_INPLACE
> or similar?

Ah, good point. We started using the "inplace" wording in other places,
so lets also do so here.

> Also, at this point we're really close to:
>=20
>    pub const NBITS_INPLACE: usize =3D CONFIG_NBITS_INPLACE;
>=20
>    union BitmapRepr {
>        bitmap: [usize, BITS_TO_LONGS(NBITS_INPLACE)]
>        ptr: NonNull<usize>,
>    }
>=20
> That would be a very useful addition for some particular scenarios,
> I believe. Even if you don't want to make it configurable, let's
> keep this option in mind?

Actually, one option here is to define BitmapVec like this:

pub struct BitmapVec<const INPLACE_LEN: usize =3D 1> {
    repr: BitmapRepr<INPLACE_LEN>,
    nbits: usize,
}

union BitmapRepr<const INPLACE_LEN: usize> {
    bitmap: [usize; INPLACE_LEN],
    ptr: NonNull<usize>,
}

This way, the driver can specify this by saying: BitmapVec<4> for a
BitmapVec where the inline capacity is 4 longs.

And if Binder wanted to make that configurable, Binder could define a
constant based on a Binder specific CONFIG_* that controls what value
Binder passes.

Since I wrote `=3D 1` in the struct, you may also write BitmapVec without
specifying any number and get the default.

It may be possible to specify the number in bits rather than longs too,
but then we have to decide what to do if it's not divisible by
BITS_PER_LONG.

(But in the case of Rust Binder, the value we want is one long worth of
bits.)

Alice
