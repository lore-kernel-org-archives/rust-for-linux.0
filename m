Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE837264627
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023948; cv=none; b=F30Nd/s0OvMShPSk0HAkT3ihowt72xqxlGfiZXb3y+7cqX3K64S9UCRbsT2ArSq0cJx3ymutJqV2F86TAJInPKvgqSKLDyOMiTzqXYeJ8OA1itKMQ9lEQRyQS/WsoBibZBqd3fZCuvAhPYMrgywvWyOi+M4qyJJmwmiBNjJxguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023948; c=relaxed/simple;
	bh=1U2Gg8fJQE90/ziDJ/bSUMYAa6BKau/4S039zv3sZTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frxrqX2CI7nRsnYIpGRzg0LcCnTmKUbe4vKvUHnAUtO6l3mw1wC0qUZE2aW217Xn/Jb1v6gkuYqBymHOndZqwH+ZKs8gWh84JTpXrn0op+iGh/YCK6Bh926DjYsQ14cFZ+7+jxk0+k7OSpVhcP3NccoH7ZzcMjY+YP9gYjllatw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqEfnN9S; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqEfnN9S"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37bbb36c990so88158371fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767023944; x=1767628744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDweXtb0IHQYv+0WcedvZHWmbDiT9oh1CmMucaaf0S8=;
        b=UqEfnN9St2citV9nCiBy8tRDRsTDZ5kuoae9NyiKFK6HawZ20xD3+WGO+tP6rJfLtd
         rccF+aTnBGBg3+5+eBU0YeJXCT+fg7VXlZjrGuZbPxiQAEdBbGFbyjRJz+lWl1TeWoCN
         +sp4S2ONUgq/FDlw2DoUwSjHnw+xRWLv3mw7laqa4QPnPIkwpSCueZidCm8cAjf8w7mN
         b7YzLnbHcyS7mfT5Dv6JVDT+fF6O9bvz3PmGnXtAHNDFHOE8cCSLSiKI57Wf3K6Wf7pj
         jTjTIBDPbBKdn/dYA97BfwtX2P0dZdkh0R5mYS1oMD9aHd8KHuypAjnbvfkzDvEUIMH6
         39Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023944; x=1767628744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XDweXtb0IHQYv+0WcedvZHWmbDiT9oh1CmMucaaf0S8=;
        b=KjIdW8nnQO5VzzXWB+UgxefauBey1U0GPwAmXNFBuj5uGJTxR9tu9MdBicfCkkqV8A
         84c1qEmkMDv6mtkAcRTNoISGywk6C19PffbcOsioncRx1cyX5HP6JcszdZy6UdwF6DK7
         wsVxFzM76b9mdGlw2FHcIHnxKURrylF83Dfpfns/oMst8jJGWRFe9YJX43lLyGs+X/fs
         YDoDF1OovRo0dsKKFvZ69pPH2h5Ol7UQhfGNV67ZbMMp064+KnFtNtM+ibc5EnMoPqGE
         7TzCmym0G9KXZ8mfuuTSnySc3pcM2UONjKe/DfXMI2LcD0lTsp3ByzqWiqki0qZibCZi
         VPcA==
X-Forwarded-Encrypted: i=1; AJvYcCVkceoFJbCtkun3RjmNISbiGZ75QJLq39DbxxtTtfx+l73myUOuVZ593KqtIFx6JSuHwj+wszkplnw71biGZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7ju6medP7ZUrJgTes/uebWijfs2G8GkQy1PmE+gsxMXy9o1k
	Rdxc1guYdFEk3wy7SDtbUmRVK8Q16pNpkvAh5nhYkODM7MYGesyGYlznlaSs79EHdKqFCY+vNon
	1vz0JUbD2iv0oimbNY1OHA7ddWptiHLc=
X-Gm-Gg: AY/fxX6M7R/EHTirDdX/XHJTSwZNo4a/QDaZA0stEkZ+cOCHgvxGZNN0s4Q2YlmjFqY
	9ZQYFFBH8zJLwMgYrfzWzpt5qbwzWCbWofZ8OVPR9FRcftWaIZSh3EpfrFcryS6xVB/f41c5GlT
	FH8X5bScP+nMPphTqcNqsS0bZ3Z94U4nr6wMH7wB79dnx7btzcucn1yBiZBKrczfNThznIda976
	o1OO1N2yV2qs3LIcENhoHsY5PKb7j4e0nWGh++pavBMVZXRsCbmz13fxJXplxN5u5KJuoGkks6n
	NmuymbelUm5o32/3UNPvhtpEulrfFh2txpwlXbqAuhseNw9jxeXlWxFUULo/EWmcu7ARPp0ZDt7
	4huAb0kdhbA86DKeU0EFY7WpSrJMPzqd/tOB06h68Fg==
X-Google-Smtp-Source: AGHT+IGOPj+vY5lg7mpMMB3eo81BW26yN/H/wV+loA/9ZKgb6nh+8qrYjFWFjhiTyAAELBLRWecvNn+jFL9ZBX0ht24=
X-Received: by 2002:a2e:a54a:0:b0:37e:5208:e2d7 with SMTP id
 38308e7fff4ca-3812085b41emr108545771fa.19.1767023943777; Mon, 29 Dec 2025
 07:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-1-9e5ffd5e3cf0@kernel.org> <CAJ-ks9nZMwBsSPOR5N8Li37M0zDwTZRM4XOY9sqVgOiov_suag@mail.gmail.com>
In-Reply-To: <CAJ-ks9nZMwBsSPOR5N8Li37M0zDwTZRM4XOY9sqVgOiov_suag@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 10:58:27 -0500
X-Gm-Features: AQt7F2pQJLzxUkFV9PLBgvMSSl5HUdQgdusGtnv8pwk_H_sOOimIGHK9z721L2w
Message-ID: <CAJ-ks9=MP6f2WW8yyp7sy_tDef-ZCphTZHWvx5ZZ_OS5=ir60A@mail.gmail.com>
Subject: Re: [PATCH 01/10] rust: xarray: minor formatting fixes
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 10:56=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> On Wed, Dec 3, 2025 at 5:28=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
> >
> > Fix formatting in xarray module to comply with kernel coding
> > guidelines:
> >
> > - Update use clauses to use vertical layout with each import on its
> >   own line.
> > - Add trailing empty comments to preserve formatting and prevent
> >   rustfmt from collapsing imports.
> > - Break long assert_eq! statement in documentation across multiple
> >   lines for better readability.
> >
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> > ---
> >  rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
> >  1 file changed, 29 insertions(+), 7 deletions(-)
> >
> > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> > index a49d6db288458..88625c9abf4ef 100644
> > --- a/rust/kernel/xarray.rs
> > +++ b/rust/kernel/xarray.rs
> > @@ -4,14 +4,33 @@
> >  //!
> >  //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.=
h)
> >
> > -use crate::{
> > -    alloc, bindings, build_assert,
> > -    error::{Error, Result},
> > +use core::{
> > +    iter,
> > +    marker::PhantomData,
> > +    pin::Pin,
> > +    ptr::NonNull, //
> > +};
> > +use kernel::{
> > +    alloc,
> > +    bindings,
> > +    build_assert, //
> > +    error::{
> > +        Error,
> > +        Result, //
> > +    },
> >      ffi::c_void,
> > -    types::{ForeignOwnable, NotThreadSafe, Opaque},
> > +    types::{
> > +        ForeignOwnable,
> > +        NotThreadSafe,
> > +        Opaque, //
> > +    },
> > +};
> > +use pin_init::{
> > +    pin_data,
> > +    pin_init,
> > +    pinned_drop,
> > +    PinInit, //
> >  };
> > -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> > -use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
> >
> >  /// An array which efficiently maps sparse integer indices to owned ob=
jects.
> >  ///
> > @@ -44,7 +63,10 @@
> >  /// *guard.get_mut(0).unwrap() =3D 0xffff;
> >  /// assert_eq!(guard.get(0).copied(), Some(0xffff));
> >  ///
> > -/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), =
Some(0xffff));
> > +/// assert_eq!(
> > +///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
> > +///     Some(0xffff)
> > +/// );
> >  /// assert_eq!(guard.get(0).copied(), Some(0xbeef));
> >  ///
> >  /// guard.remove(0);
> >
> > --
> > 2.51.2
> >
> >
>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Tamir Duberstein <tamird@gmail.com>
