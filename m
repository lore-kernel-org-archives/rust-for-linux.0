Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA324EA81
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759956395; cv=none; b=AeJfhRzxBgaXf+xX6Niek9kBKojKb93vwC51/UnM3yFx4pAnRa9WMsrcdjz8SS8MkNkL2WOi7ArZrkVENM9m4nLSw8iWFKYLpdIdNCodwy432S/sw3yiX+LbCCepFr/P9eEU0soEfWHPj1SZVNJ/9XWpFn8jsXE689aYtGxWKxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759956395; c=relaxed/simple;
	bh=ATtk0XNCR2WVF4S15RHWwDC3LY2M+FoezyWVxyx62sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiXq2eO6h2paOPL+3+Phw1reCluw2E4LJjq21H4G2okl+3LbudfQW2zHaWcVcz2yZQeVJGkN+f7Zc7SanfyHc0QWCJP8fwmxUONQqtVACUdxPSq9mtTPW/feWiz7q9nEZNUemfSYk29w2lSwI0NBXhJ7r5WHgO4oV9d5h/6X5eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUrr/SXm; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUrr/SXm"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-363cb0cd8a1so2437991fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759956390; x=1760561190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxhkbVa/uEXngkfUo+dBA3TFbsCdSBF++Qy9JKTTAdY=;
        b=ZUrr/SXmJv9FU6/GNB/gwDeo5Yc6IfyG7pKANFt+DY58Rny1M3VOUHCyRUmvhvhztu
         xsciyxIh41q5WLbBBHsvQEb4i2YV6feBSh4f43JDbuPXrehZ3I7eHbKiWaFW5yqrKpUv
         mVZ75e4D64N9vYN/6HZM4fb188Ixf5taW2b2boKDybuVZ0WsXTyW4g1vmD+7Imh8Eb9L
         uNbJHlzQ6A+Pbsvo81fXSUsNeonxjXOswMXZO8w41xBJ7lEie2i5zRYltPJfN91G/tAk
         PkzxCDgSS7QqquT7wRg75X3D2On+lpkNFyMpFklhxaiOu7c4StMMvOMrztrW7blInbZh
         cM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759956390; x=1760561190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxhkbVa/uEXngkfUo+dBA3TFbsCdSBF++Qy9JKTTAdY=;
        b=duxavUClWLE5qgOkROPktHdSMfDBr5P6QMRtQdy5PHA9n9oyWGa3s1mZGjiqkBmbn6
         oChl4pf/jLAqFY7mjCUmUcnfQr2sp+1GxCz3LIICfO8G+ls/d3fazH8njC3t/cD9XwZ7
         g4XEguD6CsUgwbgl1ioT3n9/h4o4/MbA1xKMVH6fkOd06dqeWi+rVY3Tf/ULAKMFc0TH
         YwlOJDS3ACOTrAvZWcQYVYhruSPKgvKa8xLIWqjZEgaQb0FOmMNAt1a5/6x95G0i7gCQ
         bVwrsM9E2Coo/JeLDVneD2lB3ZGP5Q1SytHUACwEIO6ZL2CSmtpPhNjj+q6VH2kmQYhR
         +RQw==
X-Gm-Message-State: AOJu0Yzen1CQWiTtUa7JOiCIeJD2IVHvcX0V5yUipMv+nEBGAHZWKkdA
	/MbEICkDoVuHZFaFluVmasvf79zllSibRmbQMu6l1TENDbkXZYQAXlZ8ymmF1apASI0F66/P6uj
	7MbOww0k3x29VG2qbnu1CdWROBxIiWDY=
X-Gm-Gg: ASbGncs2AZ4uIlUVCubwsZciMJsk5SdAohkd/KPadpJjzOawnR5CbZpa6Sv5Sgwyu59
	LGSIJqDXHrq9P3f85pcfkkR3h6uyx4CuCYEan8GEaIu1J4Sa2UJK25ep5OGeHFST5NgMdEChpOT
	SukzEj9KIbbjZ6qlzrwSFggXV0XDJBilF5wI1L4eijP9j2bQSD405D0/xrr1CTCj/4wMT3lnLbr
	uWJ/xa20JumE7+tqDQMSIIRMsfT62801SjpN0+bg3bFqJG5+nvc8G5ENDQXXyHL8Uloj6mnkOhP
	lvW3k/3wr8plrm1d+IDJtQBaWAeKkLIRZhGBPBHbFTkU
X-Google-Smtp-Source: AGHT+IFJhp/tSRDD6lbiN5FsweIVaBTWj0SEmB759OfG5ef5vYNgy9NHDR6XMGwyweNedzBOPTYTzZLdyknCujsFpWk=
X-Received: by 2002:a05:651c:1992:b0:372:8ccc:2629 with SMTP id
 38308e7fff4ca-37609ea7f6fmr12329021fa.34.1759956389715; Wed, 08 Oct 2025
 13:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
 <CAJ-ks9mtfVmP+SwZvBVuQSwViiqo2ZngSGQuU5Y7A-Q_JSwjKQ@mail.gmail.com> <20251008225002.011378ed@nimda.home>
In-Reply-To: <20251008225002.011378ed@nimda.home>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 8 Oct 2025 13:45:53 -0700
X-Gm-Features: AS18NWCgbeEJXhSg6SR3UxIn3ImEaYtYHA2yKjUMu36X7Q4evawJbCU6rPxkSEU
Message-ID: <CAJ-ks9nMziN2LU=T=XGhV8xau6UfGXOMZ49+2Lrt8KGbL7Qngg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: xarray: abstract `xa_alloc`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 12:50=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> On Wed, 8 Oct 2025 09:59:12 -0700
> Tamir Duberstein <tamird@gmail.com> wrote:
>
> > On Wed, Oct 8, 2025 at 6:05=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.=
dev> wrote:
> > >
> > > Implements `alloc` function to `XArray<T>` that wraps
> > > `xa_alloc` safely, which will be used to generate the
> > > auxiliary device IDs.
> > >
> > > Resolves a task from the nova/core task list under the "XArray
> > > bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> > > file.
> > >
> > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > ---
> > >  rust/kernel/xarray.rs | 41
> > > ++++++++++++++++++++++++++++++++++++++++- 1 file changed, 40
> > > insertions(+), 1 deletion(-)
> > >
> > > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> > > index 90e27cd5197e..0711ccf99fb4 100644
> > > --- a/rust/kernel/xarray.rs
> > > +++ b/rust/kernel/xarray.rs
> > > @@ -10,7 +10,7 @@
> > >      ffi::c_void,
> > >      types::{ForeignOwnable, NotThreadSafe, Opaque},
> > >  };
> > > -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> > > +use core::{iter, marker::PhantomData, ops::Range, pin::Pin,
> > > ptr::NonNull}; use pin_init::{pin_data, pin_init, pinned_drop,
> > > PinInit};
> > >
> > >  /// An array which efficiently maps sparse integer indices to
> > > owned objects. @@ -268,6 +268,45 @@ pub fn store(
> > >              Ok(unsafe { T::try_from_foreign(old) })
> > >          }
> > >      }
> > > +
> > > +    /// Allocates an empty slot within the given `limit` and
> > > stores `value` there.
> > > +    ///
> > > +    /// May drop the lock if needed to allocate memory, and then
> > > reacquire it afterwards.
> > > +    ///
> > > +    /// On success, returns the allocated index.
> >
> > Returning the index is not a very good abstraction. Would the
> > reservation API meet your needs?
> >
> > https://lore.kernel.org/all/20250713-xarray-insert-reserve-v2-3-b939645=
808a2@gmail.com/
> >
> > If yes, I would appreciate your tags there.
>
> It should be "allocated key", I misdocumented it. I don't have a
> use-case for this implementation, I am just trying to help on the nova
> task list:
>     https://docs.kernel.org/gpu/nova/core/todo.html#xarray-bindings-xarr

I think implementing things without understanding the use-case is a
good way to build the wrong thing.

> The task mentions "generate the auxiliary device IDs", which should be
> the returned key, right?

I dunno.

> There is also this reference [1] that shows that the returned key will
> be useful.
>
> [1]: https://lore.kernel.org/all/aOTyVzpJNDOaxxs6@google.com/

Sure, it's useful - the reservation API also exposes it. But it is not
a proper abstraction.

Cheers.

Tamir
