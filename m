Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED48B1BC23
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989921; cv=none; b=HklG+viQqN0XQOxCpnr7smENyTTsU1sQzYIIW3fFgXQ8M2PLmGFh2MLyLbdQof1PjB81u/f+tci+/tdRYjTPM97gppi+1aOlnN66lRNkGb7dN38d97YNtdP6921fyI2E1f0BDKqTiTFb1RhqJbuVsPMIdaZ7+7Rmz6JQBHBhF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989921; c=relaxed/simple;
	bh=it7BnFxWql5egUKdtDDvY8KPg5cflOWt+JLgjcC3KC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFyfh3YHkH+2/0RCEPM6fVsasvztHSPsntpOVoC/E3qtNlnPowbKkMzhJL4pqSx79quin+kyEmjq5+PKtGd15lGKdjosuiaETvKXnTKuXcwPb0jAYcAnza8QcDZgoHRGUJtrV7zxyxlXbeZam7zYiSD/Mv+exVETHqLtmKCyiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=saeM4Gzy; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="saeM4Gzy"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42c7f8588c5so5496571cf.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 01:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707989919; x=1708594719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oICQappuJZC++sBJTw39WmThX8/WjV4FBmngtKS4IZ4=;
        b=saeM4GzyNAIQgeCI5H63DVYLsJwYpddVQGbUOK5IO736AMeVOorqJtIDK45CYCSU8T
         olFs0FH+cBtvaD/cKtrHVt7j7AnH4Q5akD87ka1SVX1Hxx6lhvA5wtoQ8xU8YbNuSwOQ
         VrxxCpzPQ+PvRCqGT4B+r10A0zw1Zip1yOdde7jUa0gnrEnkenvrluOp1HiiVYWe3GXF
         H1sR5MRfZKKYsAHKRJ3gREs6kN66wytSd7dJ3jP8XIcwKvkBIcf0em7UJ5xec3HsjnK/
         ++3CjAiG84VtK91MrzBjmXwmJdtZCzwI8TTd19Vfa2Cdm84nAswY+TPisNX5nTjlTO7+
         yMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989919; x=1708594719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oICQappuJZC++sBJTw39WmThX8/WjV4FBmngtKS4IZ4=;
        b=JTL5blOIKEKBvZho6HXnibccl4/Sr3n2BY/79KPOI718fmPzfXUamm46Xkl0+DLR36
         0taOFQ4A+m5F/T9EKjBGvpX/DR1ujG5KRz7H+veU0JJx/3QLqzKHL/s7KCa1qX/jCklB
         sPytSLsuC/BBuwxQZ44HTkZuMADP+7FL89VSLL53Fg8DQRwWQSWXYMxtpGBHpMDfjiQM
         fSx5KVeLHc+OrWruXlz1kuqU4rgqKpQQ2wyBM5bMj1nfmcYNvozN82Ya283vye3p/jEX
         09VhG0VAMdi7r6g+uFIWqWW9Az/uvzEKJCnHHLMhDsHlOE+/KC6j+9SnW7fXQFCoyPOE
         frdw==
X-Forwarded-Encrypted: i=1; AJvYcCWeHV5DHgvwXDyxASTW8yu7IExZKhgi93wn4gqbJMXh8FFGwXT1n4cRJQ3HUAlp5V71XPpSW3yda6FLUZd6+awiJ9oCIHygzPQFnXY8tTM=
X-Gm-Message-State: AOJu0YzoZdHwi2ADQ4KQQyL3Pj2Dv8tHHzzUO/B2BrcWZ9soO1ZMt59l
	mOzjlH612AOAF0twTOn2T0+2m68aev4PWZo9e89YhDIHbdmMjOuFo1E/1LNQVj5pFZueiVbx172
	7pPBMQeJSGZG3ZT5Mdi5tO0WPCuq8pBlgYuZiMaFjVGfN7Hy8/w==
X-Google-Smtp-Source: AGHT+IG+kztqZmwXQlQkPjW+/X5+zR7GlUXyVh4bp528TkXP1gDbyhtsWgu623VHoOlMPLeqtZsNrscST/aO+QnFytg=
X-Received: by 2002:a1f:e444:0:b0:4c0:3c82:5105 with SMTP id
 b65-20020a1fe444000000b004c03c825105mr996849vkh.10.1707989898259; Thu, 15 Feb
 2024 01:38:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214172505.5044-1-dakr@redhat.com> <Zc0UNUGbmmBlzBAv@boqun-archlinux>
 <2d94d420-fca2-47c1-aee7-bbce7a1505cf@ryhl.io> <Zc1mWCBKNuLrS-tI@boqun-archlinux>
In-Reply-To: <Zc1mWCBKNuLrS-tI@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Feb 2024 10:38:07 +0100
Message-ID: <CAH5fLghO6Jy_hJXhRU_+eBSDHHveAvEOJA6fNkmMS9mqHvS6iQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: str: add {make,to}_{upper,lower}case() to CString
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <alice@ryhl.io>, Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 2:18=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Feb 14, 2024 at 08:59:06PM +0100, Alice Ryhl wrote:
> > On 2/14/24 20:27, Boqun Feng wrote:
> > > On Wed, Feb 14, 2024 at 06:24:10PM +0100, Danilo Krummrich wrote:
> > > > --- a/rust/kernel/str.rs
> > > > +++ b/rust/kernel/str.rs
> > > > @@ -5,7 +5,7 @@
> > > >   use alloc::alloc::AllocError;
> > > >   use alloc::vec::Vec;
> > > >   use core::fmt::{self, Write};
> > > > -use core::ops::{self, Deref, Index};
> > > > +use core::ops::{self, Deref, DerefMut, Index};
> > > >   use crate::{
> > > >       bindings,
> > > > @@ -143,6 +143,19 @@ pub const fn from_bytes_with_nul(bytes: &[u8])=
 -> Result<&Self, CStrConvertError
> > > >           unsafe { core::mem::transmute(bytes) }
> > > >       }
> > > > +    /// Creates a mutable [`CStr`] from a `[u8]` without performin=
g any
> > > > +    /// additional checks.
> > > > +    ///
> > > > +    /// # Safety
> > > > +    ///
> > > > +    /// `bytes` *must* end with a `NUL` byte, and should only have=
 a single
> > > > +    /// `NUL` byte (or the string will be truncated).
> > > > +    #[inline]
> > > > +    pub const unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &=
mut [u8]) -> &mut CStr {
> > > > +        // SAFETY: Properties of `bytes` guaranteed by the safety =
precondition.
> > > > +        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
> > >
> > > First `.cast::<[u8]>().cast::<CStr>()` is preferred than `as`. Beside=
s,
> > > I think the dereference (or reborrow) is only safe if `CStr` is
> > > `#[repr(transparent)]. I.e.
> > >
> > >     #[repr(transparent)]
> > >     pub struct CStr([u8]);
> > >
> > > with that you can implement the function as (you can still use `cast(=
)`
> > > implementation, but I sometimes find `transmute` is more simple).
> > >
> > >      pub const unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mu=
t [u8]) -> &mut CStr {
> > >     // SAFETY: `CStr` is transparent to `[u8]`, so the transmute is
> > >     // safe to do, and per the function safety requirement, `bytes`
> > >     // is a valid `CStr`.
> > >     unsafe { core::mem::transmute(bytes) }
> > >      }
> > >
> > > but this is just my thought, better wait for others' feedback as well=
.
> >
> > Transmuting references is generally frowned upon. It's better to use a
> > pointer cast.
> >
>
> Ok, but honestly, I don't think the pointer casting is better ;-) What
> wants to be done here is simply converting a `&mut [u8]` to `&mut CStr`,
> adding two levels of pointer casting is kinda noise. (Also
> `from_bytes_with_nul` uses `transmute` as well).

Here's my logic for preferring pointer casts: Transmute raises
questions about the layout of fat pointers, whereas pointer casts are
obviously okay.

Alice
