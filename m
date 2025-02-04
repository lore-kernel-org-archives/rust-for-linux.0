Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6020E002
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676389; cv=none; b=qNwJJXGA+er/w7ChEqPtWv0QiQ75hwL5gDvXeqemaqf+4mPpz7cM1jMFAHpX+5mYu13Tzy3x3i3v8+wc4a1y7Mw9Ai2d3tgW6DGb+iH/6C527c5uMuW3sHZ4xg9PDixZyzuy1aHcpqBDzOdli7YcvtIDPt4tLaQpeCrYkIzqmOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676389; c=relaxed/simple;
	bh=PN0CPB/Jhz2333VzA0sDbAy58IyDn5OWW1laMrN+i8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRrbUf5D9+ar1TZkMHeRPVMskCDsUOI3QaFh0sCt5MKTurtxZpmcJte8L9GQHFvv0qjFG8QqDzHMYIqBVwtS5J8wpWEAn906fImmIF6fYEmYJirRQ6UaOw0N55I6PvjV+BF+Lzk/hKPQbabwUoBUTJpgI3EBFhHIIgNDDC8xUdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gh2/SCfd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gh2/SCfd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dabb11eaaso347934f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 05:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738676386; x=1739281186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDierw2/A0zavMG+3sPVdpYZFjRoMNxDKndiA2q1SqI=;
        b=gh2/SCfdTeOXuA7E4iuLIrKUj2Hd4BXClfwM01v9lInUu2ZxsS99wowc+7SCtCa+Vl
         3cZdK6X5du0NVLLoKQJQ1Og+2bxD6v4vTtGWQN8kEX/W2mKP5S9iluS6zRelBjqO6bf2
         jQkXzmbPRuHdxEpsGnUZHCUar9CfKmG8PjBb3cnlqv8Az2zTji4QMjrrHeGTD4HIibGz
         w/f4R+fa2fQ4wdXJJSx9UmYtyRwd/96BQcSKv1KBqkY6piHMYTrtlvPSH7RKUj2CQcNF
         Svnb6DslthYeDGdKVbkosvd3jkwT7RgcvqZuejn674fgwmouDwTFQ7dI5qi1VF8kEerw
         phMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676386; x=1739281186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDierw2/A0zavMG+3sPVdpYZFjRoMNxDKndiA2q1SqI=;
        b=NrPgZFGnoF8k2Ho7zKGNr2GzdcBbxafaL9ZDLwq6EbXMqajgzcxbu5dFMRKbkttEfH
         8kHi/wnOwIMkCJX9dHa4QqJQi/LvExO42Ttc1FO4Lyl0ErCa23gu/b1e7ESARClrUo0V
         qCXTTP0IHTiajJGZHGyU6PMvWX7YKAMlRxNzuSCEqR1PsoZ00JrRnsy0xgmO4GKFPeOK
         be+oTmJMUs81vhGnSb3El0eDMpGLz2RqPa/cAKln02z2DJHeQe1txNkfLhaXp/BzOc1L
         7Gjj6S63NiyoYIFkCX/Iv3o1zgBuolpHiDVdJsX4HRmoDWZmvVhAVFPLbz8F52GiuX39
         Fd9g==
X-Forwarded-Encrypted: i=1; AJvYcCVhqLB6o4GYRZfSuFexxPCD5jVsC8dQbw6rbzr0bHVNm7tlCvlxdpJQRTWGCREtDFZj0odhqe7feuTdh+iTCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/X2cRGWXMd3ukJw7mfrOMmaa1LLDAImsuq1dSX9z4WJqjHP1
	XQOou9VgqARDXvr0XLa3pCuWmPxhntrG2VCDCqzITtDkZ9UGej4WlxtIZqPHs/qukGvf/MkR5/J
	3kLvzFAe9gbQXu8fPmvk1Sg3XphmDQdqkG7na
X-Gm-Gg: ASbGncvpHWg769A87QzqGFrfmflMRKBGGuP+exG63OrwHyhsjqIx4FD0ply+HP7qBJs
	SEjQ95fU4f8cb716B8xUL2+GnbkWxwp5jBhD2bZ1HUmlrkEEdjAJs5LMCc8yLQaDoL/08jl+wv5
	gsBssrN6mD6DFamQo2I+5bZZJTbw==
X-Google-Smtp-Source: AGHT+IH1idF8nb5QXGyrudJAB04PC/gkweM3+/bfTcG2XkkJ7eJVUgkrnIegMUVThJj/wUqrDmPMWq9/zsjcH53913E=
X-Received: by 2002:a5d:634f:0:b0:385:f0dc:c9fd with SMTP id
 ffacd0b85a97d-38c51974c0fmr18902754f8f.27.1738676385542; Tue, 04 Feb 2025
 05:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>
 <Z5ubrUcSuaTtj_wW@tardis.local> <CAH5fLgiTG8nNRdb2=3PdZN=2Bg=KLGy4hvrae+E0jcOeCTBpjw@mail.gmail.com>
 <Z5uzbW2j9fUBt-3H@boqun-archlinux>
In-Reply-To: <Z5uzbW2j9fUBt-3H@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 14:39:33 +0100
X-Gm-Features: AWEUYZmChfcq3HmMbFgadtiv5KZHjn7HO5hyASoeuLdrGk0OS6f7DI8w2rmXhEU
Message-ID: <CAH5fLggDna0E9MtarHDxoS=w3zp-2HipASOLGfYFzTg8fxUu2A@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given guard
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 6:15=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Jan 30, 2025 at 04:43:22PM +0100, Alice Ryhl wrote:
> > On Thu, Jan 30, 2025 at 4:33=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > Hi Alice,
> > >
> > > The patch looks reasonable to me, however...
> > >
> > > On Thu, Jan 30, 2025 at 11:39:32AM +0000, Alice Ryhl wrote:
> > > > Binder has some methods where the caller provides a lock guard, and
> > > > Binder needs to be able to assert that the guard is associated with=
 the
> > > > right lock. To enable this, add an accessor to obtain a reference t=
o the
> > > > underlying lock that you can pass to `ptr::eq`.
> > > >
> > >
> > > ... could you provide more details on this usage, for example, why do
> > > you need the assertion, is it for debug purposes? Does the current C
> > > code have the same or similar logic? Besides...
> >
> > I added the assertion because it makes the SAFETY comment on a call to
> > kernel::list::List::remove simpler. The C driver does not have the
> > assertion.
> >
>
> Ok. Make sense.
>
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/sync/lock.rs | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > > > index 41dcddac69e2..681d67275b49 100644
> > > > --- a/rust/kernel/sync/lock.rs
> > > > +++ b/rust/kernel/sync/lock.rs
> > > > @@ -169,7 +169,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
> > > >  // SAFETY: `Guard` is sync when the data protected by the lock is =
also sync.
> > > >  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B>=
 {}
> > > >
> > > > -impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
> > > > +impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> > > > +    /// Returns the lock that this guard originates from.
> > > > +    pub fn lock(&self) -> &'a Lock<T, B> {
> > >
> > > How about we name this as `lock_ref()` or something else, because
> > > `lock()` itself is already used by `Lock` for the lock *operation*, a=
nd
> > > this is just an accessor, I would like we don't confuse code readers
> > > when they see code like "let b =3D a.lock()".
> >
> > The usual name for this operation in userspace is "mutex".
> > https://docs.rs/lock_api/0.4.12/lock_api/struct.MutexGuard.html#method.=
mutex
> >
> > But since our code is generic over many lock types, I went for "lock".
> > But I guess it could make sense to rename it.
> >
>
> Got it. The good thing about the naming of lock_api is that the name
> "mutex" is not used for other purpose, while "lock" is a bit different.
>
> > > Moreover, if the only usage
> > > of this is for asserting the right lock, maybe we can instead add an:
> > >
> > >     pub fn assert_lock_associated(&self, lock_ptr: *const Lock<T, B>)
> >
> > I guess, though there is precedent for having a method that gets the
> > underlying lock, so I think it makes sense. If we had an assertion, it
>
> I don't disagree, but I just feel we should be careful about introducing
> two "lock()" that one is an operation and the other is an accessor.
>
> > would probably take an &Lock<T,B>.
> >
>
> How about:
>
>     impl<T, B: Backend> Lock<T, B> {
>         pub fn assert_held_then<O>(
>             &self, proof: &Guard<'_, T, B>, f: FnOnce() -> O
>         ) -> O {
>             <assert `proof` is associated with `&self`>
>             f()
>         }
>     }
>
> In this way, not only we can assert the correct lock is held, but we can
> also guarantee `f()` is called with the lock held. Thoughts?

I need mutable access to the guard during the function, though? I
don't think a closure is helpful in this case.

How about I rename to `lock_ref()` instead?

Alice
