Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CBC80603
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 17:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731865095; cv=none; b=fxqhEav/KbaMYYjziv5nG491SajyrnOQs5n/e+tSo263jEIH9GlIobBQRsSM5Do0/lAo4pYehfHiVCS3GjdHCE31A408vaxJ8qf0TZxs6mF4uJmHB2RoMC3tTdEovPl1ZbW7t7GZ9rOnHuV6XDVRIxpfq5Wqze66jI7qbt4Rw4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731865095; c=relaxed/simple;
	bh=v0jwqKJ44hm8Rc+w/59IHn6YeUvfbEsSdHqvQEMdiVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVgjnzCsimgzXcfdThZTDDtTrGL1TGXfGrXY0ZEqHHBUM6ovjHI7GyYTicZSb2fcFzJWOpBovS4lPEjsyRWAzFmzkRYgcqPySQZfnZxQYVGF1mgIDMcEx1natdFTrfPqVUZ15FZ89GEfpztxawSwBYn6jBgR9pD31CaEAmdgtcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=uXWigZLb; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="uXWigZLb"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2689e7a941fso1230365fac.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 09:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731865092; x=1732469892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIpoDL7tJ5I8ekcry5VzaalJzR7YtyoRYbrIGXdcNF8=;
        b=uXWigZLbDl0ScdDvjDjgzyiaktIgbTytOfycbhz0xZlja1Cbi5vJYrFWbtofaEPb/o
         F4GVXjWo2f0uNpXZVGJt+optsILBo6crWtbQGWSr++ZVfXp9Ay/gDBSqdbERkWuctGdx
         ixuqkWQayrMgDkiZq08vC/72wCC0QuZGxtXS0jyrvlSo24/iGc8d48qLxdIUAhwmwQLC
         j2sDWOxy56dTBXcw/MobiMP/wfioduN6h+IZx8ZJ9wYXio+uy+bmKUAuUFYhKPi8TXOY
         CpTtnObo4Wu1gzrKDGwb8/GLnS5gwkCR1MF72/QPQJCO6AuXE3wIRWp90M3W9orlqhkW
         wsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731865092; x=1732469892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIpoDL7tJ5I8ekcry5VzaalJzR7YtyoRYbrIGXdcNF8=;
        b=LPs2O/U6QGzitEJinKG/rGNmFjHazHzIi1ehRkL27hKG3PR0jRW0t7fyb+jk92gub3
         dfDUA2flA1JMOiK9lfUDhRU5xFqBCHBNwsumAbzEiqhJigm2doCiRtIqL59fwRVETalC
         fX9RSFlVAbHsOK57PruFULx+nXdu2VZScBkTcK2pqtKIIJoOMu8y1L8b3w+u/TCGzXJ4
         EHp9hV2zWNeFUzjZWTnDgA5oJyng+YBDRw05oJYrHlQH+5+CV1/SAoFluPrrNd9kficE
         IgRBa32Wvr7dPqEicLOorRY/oFw/Ry4WsVnSFOVHPLrSsZGTS1InAOfFwJrGdPIzCIhN
         A9tA==
X-Forwarded-Encrypted: i=1; AJvYcCUMAP5B+FYRze8sqPiMQ9X3YB/1steejl45RzykkbId/b9Wi8l7TWtQbGnxKNXXNq7czQp4KlH4roMZ8pZW1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzknwLV6iplnutS7QQM4e5OEL0CoQ7lL+uiJXZ02oQfwN+MBuLg
	f3WzfICJya3CnOEDZ+mE3VWCL0itkRkt//ob+vsivADU3QoKyP3eW3wGtd7JBQ0qvYXmxgoIjkn
	MYSPdFFEmq44WFn4kdMqJ0Rf3T++cUP3DdRvsXg==
X-Google-Smtp-Source: AGHT+IGBz9tdlLeFOrCUy15cYV+ydCdP/+jPqsR42hqdWC+MwYMtlq5Jstiv+aR7eaKxW1SsLpVsqtaNIK+mR1FguFc=
X-Received: by 2002:a05:6870:1d4:b0:25e:24b:e65b with SMTP id
 586e51a60fabf-2962e37531dmr6924819fac.42.1731865092563; Sun, 17 Nov 2024
 09:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <20241116195221.373332-2-daniel@sedlak.dev>
 <702ce883-3d20-45c0-b597-ba55f56d418e@gmail.com>
In-Reply-To: <702ce883-3d20-45c0-b597-ba55f56d418e@gmail.com>
From: Daniel Sedlak <daniel@sedlak.dev>
Date: Sun, 17 Nov 2024 18:38:01 +0100
Message-ID: <CAMFZ4eQAKRURVYj8xJwcTULit8sfzsSKFVfdjXB_G88+f6diMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kernel: init: replace unwraps with the question
 mark operators
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 8:34=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> Hi Daniel,
>
> On 16.11.24 20:46, Daniel Sedlak wrote:
> > Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYj=
XkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
>
>
> While talking about that thread, do you like to cover the dox()
> replacement
>
> https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c7886de=
0a@de.bosch.com/
>
> as well?

Thank you for the reminder! Yes, I will incorporate it.
>
> Thanks for working on this! :)
>
> Dirk
>
>
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> > ---
> >  rust/kernel/init.rs | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> > index 347049df556b..81d69d22090c 100644
> > --- a/rust/kernel/init.rs
> > +++ b/rust/kernel/init.rs
> > @@ -1076,8 +1076,9 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>=
, E> {
> >  /// ```rust
> >  /// use kernel::{alloc::KBox, error::Error, init::init_array_from_fn};
> >  /// let array: KBox<[usize; 1_000]> =3D
> > -///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL).unw=
rap();
> > +///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL)?;
> >  /// assert_eq!(array.len(), 1_000);
> > +/// # Ok::<(), Error>(())
> >  /// ```
> >  pub fn init_array_from_fn<I, const N: usize, T, E>(
> >      mut make_init: impl FnMut(usize) -> I,
> > @@ -1120,8 +1121,9 @@ pub fn init_array_from_fn<I, const N: usize, T, E=
>(
> >  /// ```rust
> >  /// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, new=
_mutex};
> >  /// let array: Arc<[Mutex<usize>; 1_000]> =3D
> > -///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_K=
ERNEL).unwrap();
> > +///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_K=
ERNEL)?;
> >  /// assert_eq!(array.len(), 1_000);
> > +/// # Ok::<(), Error>(())
> >  /// ```
> >  pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
> >      mut make_init: impl FnMut(usize) -> I,
>

Daniel
