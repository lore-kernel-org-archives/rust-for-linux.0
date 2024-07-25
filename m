Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210819D087
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721920170; cv=none; b=k2mC6U61nHRnILoOWCqAoOuEXhxdC/8PssXIDx6UhIpthYiR9wiD46e1c419oiQQcBbGr62hnTwzDDwhldY48YvFTGSp9uIVQABEjlPAc4GnNAKFjKimqC2myFuvYxJPL8CVMgaghXU/ThwaFn4brtoedjmKEJFyRHK9w0YEToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721920170; c=relaxed/simple;
	bh=7R/kNlm8AOHWMAZ3bF0cWW4OJVQjaGMMVii0cMhXxZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJNSq7SKX4k+4BLecLurZcMCp615gy8EuOI2NIt5hweUnEnbl/STdxylJveHejw/XAl65VY/3EgakeeytzOMfbWa2o26gV/tIASC0bSUp0TDleiQUUHuXPOcQy/uy1CduACsWjVAeOorK5h3Q3ZXChc8K0EOPVFjl4piM0lx+Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IiTHDHsh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IiTHDHsh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3687f91af40so676662f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721920167; x=1722524967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLhD6vj6EnRKzwhTDYq6wp8OjwTpujNmgncm/+8lTNs=;
        b=IiTHDHsh1JNlyoQPxS7oZxzYYii7pNUzaTrTLDUnOm/xS/fU0dffda7Pp5Sku3jOIN
         xSfdNyj2cAv+vEgjtqsbSSb5NfO9SdUhV0ULGk6NeRUZt5TI1OHtSD6UuHWrhsdVr26h
         B7goDFTK7mN/qK24Of641CeIwaxrZoTldU/xN3ekQP3ANzsE4ZGznoDsNawywvvGSmGR
         KQbW79O197AbN/OP7QBV7Map0H+p4xNmcCXj+dz4pQqmPXCldiMC2tgoYuQQ2Zt/Q1uj
         Bdxgp1JYFoSNx4bHG9P+ZE4PiHOekoUtShMvOnJQclxOwYgxAvp5bXIW9yEnx3aPMqqY
         ycMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721920167; x=1722524967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLhD6vj6EnRKzwhTDYq6wp8OjwTpujNmgncm/+8lTNs=;
        b=xM7GyiXvDHO1uaT5jW7rhxtf3cN4q1sFlXPNjARDK797VX/loNnOiLSLQ6sP9XQ1l4
         G+9UOaNpBnAO045EwMNrIV+A/YbSO1+uoGRvZYQq9JH81Tnp9QY9W2FdyUtiKINo4u2j
         imZ4U1jU/ooEo+VLLoSANjtY7ti2xcj0lIG/kVYw/uTl8a11y73WD4ye/4yvVU9VZ+5B
         FTlhkzHAveDQfxBzXyoSk/d33x47Kq0lrdGc9yXRnoNatnvNSutiS+vHaXkAL60YA6kZ
         iAeO/l13oXYnrbvCiFYMb2qMad/dDtJBe0If7bExx5aL24Gf7+3wKO0i7DRNjstilpIl
         Auwg==
X-Forwarded-Encrypted: i=1; AJvYcCUPvPSMGpPGoXmfRanVFHAsfPhdtKJflcWM8NmFGgzl88ixeasryvz6V+rBmU4oeQFkVjmuVVjpv6v4KSoD/tKQkrZYL2gNuEDsvmIlNLc=
X-Gm-Message-State: AOJu0YyePPhbaWhJCmdWXYo6I0h0Co5Be8N9eeK5TXQNaYXbyav8ro2X
	GyV1ok5RPZdt94jLx6gGzdAr6TtTbNAZgeYMvrqzwYndqgSph2RZR2jFl+tuy6ssfuA6KqFRKLK
	lnn7IV/jeNwaaS24Wak/OZ1OYGFBtkGtH71On
X-Google-Smtp-Source: AGHT+IESnSYYT29r0gjCfbIZNKznyKqXdmpFla2DK+Gd1GoL7Hg0K8Osu4PN/akyPecECPmhpN9MABVYfTogFo/AoQE=
X-Received: by 2002:a5d:5f47:0:b0:368:5b0c:7d34 with SMTP id
 ffacd0b85a97d-36b319df76fmr2824398f8f.22.1721920166943; Thu, 25 Jul 2024
 08:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725-alice-file-v8-0-55a2e80deaa8@google.com>
 <20240725-alice-file-v8-1-55a2e80deaa8@google.com> <20240725143714.GI13387@noisy.programming.kicks-ass.net>
In-Reply-To: <20240725143714.GI13387@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jul 2024 17:09:14 +0200
Message-ID: <CAH5fLggOo-TErSktC6qmyZpMGVu-M8rFXgvfi3N0Z_u63C3EyA@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] rust: types: add `NotThreadSafe`
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 4:37=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Jul 25, 2024 at 02:27:34PM +0000, Alice Ryhl wrote:
> > This introduces a new marker type for types that shouldn't be thread
> > safe. By adding a field of this type to a struct, it becomes non-Send
> > and non-Sync, which means that it cannot be accessed in any way from
> > threads other than the one it was created on.
> >
> > This is useful for APIs that require globals such as `current` to remai=
n
> > constant while the value exists.
> >
> > We update two existing users in the Kernel to use this helper:
> >
> >  * `Task::current()` - moving the return type of this value to a
> >    different thread would not be safe as you can no longer be guarantee=
d
> >    that the `current` pointer remains valid.
> >  * Lock guards. Mutexes and spinlocks should be unlocked on the same
> >    thread as where they were locked, so we enforce this using the Send
> >    trait.
> >
> > There are also additional users in later patches of this patchset. See
> > [1] and [2] for the discussion that led to the introduction of this
> > patch.
> >
> > Link: https://lore.kernel.org/all/nFDPJFnzE9Q5cqY7FwSMByRH2OAn_BpI4H53N=
QfWIlN6I2qfmAqnkp2wRqn0XjMO65OyZY4h6P4K2nAGKJpAOSzksYXaiAK_FoH_8QbgBI4=3D@p=
roton.me/ [1]
> > Link: https://lore.kernel.org/all/nFDPJFnzE9Q5cqY7FwSMByRH2OAn_BpI4H53N=
QfWIlN6I2qfmAqnkp2wRqn0XjMO65OyZY4h6P4K2nAGKJpAOSzksYXaiAK_FoH_8QbgBI4=3D@p=
roton.me/ [2]
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > Reviewed-by: Trevor Gross <tmgross@umich.edu>
> > Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> > Reviewed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/sync/lock.rs | 13 +++++++++----
> >  rust/kernel/task.rs      | 10 ++++++----
> >  rust/kernel/types.rs     | 21 +++++++++++++++++++++
> >  3 files changed, 36 insertions(+), 8 deletions(-)
> >
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index f6c34ca4d819..d6e9bab114b8 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -6,8 +6,13 @@
> >  //! spinlocks, raw spinlocks) to be provided with minimal effort.
> >
> >  use super::LockClassKey;
> > -use crate::{init::PinInit, pin_init, str::CStr, types::Opaque, types::=
ScopeGuard};
> > -use core::{cell::UnsafeCell, marker::PhantomData, marker::PhantomPinne=
d};
> > +use crate::{
> > +    init::PinInit,
> > +    pin_init,
> > +    str::CStr,
> > +    types::{NotThreadSafe, Opaque, ScopeGuard},
> > +};
> > +use core::{cell::UnsafeCell, marker::PhantomPinned};
> >  use macros::pin_data;
> >
> >  pub mod mutex;
> > @@ -139,7 +144,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
> >  pub struct Guard<'a, T: ?Sized, B: Backend> {
> >      pub(crate) lock: &'a Lock<T, B>,
> >      pub(crate) state: B::GuardState,
> > -    _not_send: PhantomData<*mut ()>,
> > +    _not_send: NotThreadSafe,
> >  }
> >
> >  // SAFETY: `Guard` is sync when the data protected by the lock is also=
 sync.
> > @@ -191,7 +196,7 @@ pub(crate) unsafe fn new(lock: &'a Lock<T, B>, stat=
e: B::GuardState) -> Self {
> >          Self {
> >              lock,
> >              state,
> > -            _not_send: PhantomData,
> > +            _not_send: NotThreadSafe,
> >          }
> >      }
> >  }
> > diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> > index 55dff7e088bf..278c623de0c6 100644
> > --- a/rust/kernel/task.rs
> > +++ b/rust/kernel/task.rs
> > @@ -4,10 +4,12 @@
> >  //!
> >  //! C header: [`include/linux/sched.h`](srctree/include/linux/sched.h)=
.
> >
> > -use crate::types::Opaque;
> > +use crate::{
> > +    bindings,
> > +    types::{NotThreadSafe, Opaque},
> > +};
> >  use core::{
> >      ffi::{c_int, c_long, c_uint},
> > -    marker::PhantomData,
> >      ops::Deref,
> >      ptr,
> >  };
> > @@ -106,7 +108,7 @@ impl Task {
> >      pub unsafe fn current() -> impl Deref<Target =3D Task> {
> >          struct TaskRef<'a> {
> >              task: &'a Task,
> > -            _not_send: PhantomData<*mut ()>,
> > +            _not_send: NotThreadSafe,
> >          }
> >
> >          impl Deref for TaskRef<'_> {
> > @@ -125,7 +127,7 @@ fn deref(&self) -> &Self::Target {
> >              // that `TaskRef` is not `Send`, we know it cannot be tran=
sferred to another thread
> >              // (where it could potentially outlive the caller).
> >              task: unsafe { &*ptr.cast() },
> > -            _not_send: PhantomData,
> > +            _not_send: NotThreadSafe,
> >          }
> >      }
>
> As per always for not being able to read rust; how does this extend to
> get_task_struct()? Once you've taken a reference on current, you should
> be free to pass it along to whomever.

Once you take a reference on current, it becomes thread-safe. This is
because taking a reference creates a value of type ARef<Task> rather
than TaskRef, and ARef<Task> is considered thread-safe.

Alice
