Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E31C3039
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719091; cv=none; b=R1CPWV0pp9/U1zsQGVfabuGIjStKF8Z/0Xectt+K0h8YjZgDlUESw/lYquPKfE56XpUuYkVcxdWZNg4qk4zOH6B9eJTnxJW/jUurV5hNgcPdF/6ba6v9uPiKNGrE0ybL+KyQxZvn+IjTpoxSlJyCT0XR/azIA7FS7dlFh4jrllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719091; c=relaxed/simple;
	bh=E/G+Ma5c3HEoZ6V6jEkOVbUqt0oOEDS4ehHgrAzVM4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDCscjvY0t4JrltsvWp8BQm+yXgpvB3ZwLMahe2LNdm8e/dOZYtbQQ332jaRfYrt8/z8m92NAcWBRXdenmztzRV5rC1UJVwGPHTpzXIdFJ1OBtgmavs8ZNMcJfF7qbkaYA8jfLC5capcGtV0X/O/Zu/+PhV2FynfMqJ6EiSqSI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WGlv/8qM; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WGlv/8qM"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1106407fac.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749719089; x=1750323889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCmVasf54FJSfgyjNqYu9/T4YHBXvjWI8frtIJ+EEeM=;
        b=WGlv/8qMQK/odOh2tFnkafU2uzWyqFvjPJUgkbK1PcArl45x+x1fabFIDN4SIhjMoI
         4LKGdeub4EQr/MVr/XUGrPTH2VMP/IGIY98U39mJy4BjInU3hHicvMZE97KFCvAvRv3W
         KQydLA9WT5uspZ/Asv3ctKdSo5PmM+sNAtwyCkPuePF5slICQX1k1WJd+U+s2mNcM0Ff
         qJ1w2I20ioqZgsHVMdpnSN7JbCYTbnMIb9MrsZWsYQV24uyd0ASK1uKxTWU9ZcDIdwFe
         +HCd3JwJVpULXkDb+Kbx6VFLIDQCw8Z8RptC3dkxto2ZB78Mno4UZiYjwUGidIbGOcnG
         v76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719089; x=1750323889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCmVasf54FJSfgyjNqYu9/T4YHBXvjWI8frtIJ+EEeM=;
        b=LQ6hcsqYUNKNNnNPKpTVnjY/PIajCAHns7uqxmrdYbfZlnBnHV36UzYeCTT7tqtFVm
         0mysNE2xog8hRj4bIzB09QwayRagVqU6ht2gYKZYTesHWgTvQfaJG0Kal8xZrEDNp+3H
         bCQYsa87eIwPnfRigmawKrtXM81k6NAP5afyIKUtqZcZKp1yW8zj/kgQxrf9OGV0yLcA
         HdLbqPSWJtRbTWIrWqBS2P83yFewvHssk6tiBy9C4HMmIE4NYIsYdptHjTOEoaag0a1q
         EQGnsbVVNjzO3uv/j2HaK2KVRmIpo7zJUOum6ai2o/kLy9wvdd06wvNvtGcTkyyRd3nD
         GCdg==
X-Forwarded-Encrypted: i=1; AJvYcCWnR7aVjStAsKiEpTM0FaJf9V783XYMIwPl99JjG6dR34k5UPtqWDnjLWGCTJB6WE2lu7YpNGWiprbcQArVkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61hrVFByLbmZ54KOAT9S2mWOUGsIKqe+0uMvpX6sasQMzi4rO
	lcUqczlyd6IsvR2zqmAKgizN+DPb35SAUaCZJkvjavNDXwd1Uvb2oRcNMKjxnIHTSnDB2lTJ3Wu
	/meqMJ9oh20+BTmIxpPZCmgNhYYyKZZxyxlmxWORL
X-Gm-Gg: ASbGncsnNJ+6Tv1gzzIl+dHg5A+6bl3+3/zAfSj+XDYLfRWvtvQOyHMSvwBNmkBTOG+
	1ho/1H6b5j8goDqEwWICMFTVrTD7FNouwLBfknoJkuwC9h/kuWpNLwATMruINKmhgTZfbIm7i5e
	Q4IVGwDwtEL7RbI6D/WPKw3HzTDXYg1AYnpd1wz0wkFZnoQAD+wsjRcHj6ZXsTF4gN7Itz6ltTf
	w==
X-Google-Smtp-Source: AGHT+IGsCe0eHuSCDp/ZATxEgcLgpmzOAzhfbi7k6bUdPkZ8Iaa0NcKwebiu9Q1dLW5iD7RCwdbjitcdPo1Ghda45so=
X-Received: by 2002:a05:6871:4f17:b0:2e4:9c8e:f59c with SMTP id
 586e51a60fabf-2eab440444fmr1039305fac.19.1749719088810; Thu, 12 Jun 2025
 02:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
 <CAH5fLgi1GBqDHvMh30fbxVUjnTETLXthpK6eGLJA0Vh_TZRnsQ@mail.gmail.com>
 <CACQBu=W4PziG3Fsnzqu_wu-vgBThktD7FcEJ-vOhOMhNDz8h3g@mail.gmail.com> <CAH5fLghV4gYWMyscY2y+TwwqMW_497Sg0sj_HuzNH4nB_5u6Bg@mail.gmail.com>
In-Reply-To: <CAH5fLghV4gYWMyscY2y+TwwqMW_497Sg0sj_HuzNH4nB_5u6Bg@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Thu, 12 Jun 2025 11:04:36 +0200
X-Gm-Features: AX0GCFvLFjwTkqL9rBhxwG-_dzXGQXfs8fCOFdjNJbl3SinDaFDMM4vufd5kjD0
Message-ID: <CACQBu=WiFs=6K78EuTOhe6HR39uXr8ZEKCz=MVNwKoxOV+F+iQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 10:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Thu, Jun 12, 2025 at 10:47=E2=80=AFAM Burak Emir <bqe@google.com> wrot=
e:
> >
> > On Wed, Jun 11, 2025 at 11:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > >
> > > On Wed, Jun 11, 2025 at 9:48=E2=80=AFPM Burak Emir <bqe@google.com> w=
rote:
> > [...]
> > > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > > new file mode 100644
> > > > index 000000000000..1fe72ca980ac
> > > > --- /dev/null
> > > > +++ b/rust/kernel/bitmap.rs
> > > > @@ -0,0 +1,582 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +// Copyright (C) 2025 Google LLC.
> > > > +
> > > > +//! Rust API for bitmap.
> > > > +//!
> > > > +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bi=
tmap.h).
> > > > +
> > > > +use crate::alloc::{AllocError, Flags};
> > > > +use crate::bindings;
> > > > +#[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> > > > +use crate::pr_err;
> > > > +use core::ptr::NonNull;
> > > > +
> > > > +/// Represents a C bitmap. Wraps underlying C bitmap API.
> > > > +///
> > > > +/// # Invariants
> > > > +///
> > > > +/// Must reference a `[c_ulong]` long enough to fit `data.len()` b=
its.
> > > > +#[cfg_attr(CONFIG_64BIT, repr(align(8)))]
> > > > +#[cfg_attr(not(CONFIG_64BIT), repr(align(4)))]
> > > > +pub struct CBitmap {
> > > > +    data: [()],
> > > > +}
> > >
> > > I wonder if we should just call this type Bitmap?
> > >
> >
> > OK. I am renaming the other type to OwnedBitmap then.
>
> Just thinking a bit more about naming ... how about calling it
> BitmapVec? Rust generally uses the terminology "Vec" to refer to
> arrays whose size is not known at compile-time, and "Array" when the
> size is known. Then, if we eventually add another type for declaring
> fixed-size bitmaps in Rust, that type can be BitmapArray (that's the
> type you'll want in a global).

It sounds good, better than OwnedBitmap.

My only hesitation is that BitmapVec does not support growing (or realloc).
On the other hand, we could support that in the future so it still makes se=
nse.

cheers,
Burak
