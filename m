Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E697386451
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611206; cv=none; b=Bb40ZwXlHRni5ul6xhwT4o0pxloT2dannfqCGG73NkvFeeVn7brC6rHoKb34AW0Gfr6oiHj41nceGh/oDGvrfW+YMgFQTrW0sUvRFTBWQwC60PGd5uX2ayk/X1G3lQityxaZ43dtroOddwSj5/BIcKNXRr38bu2DyX6+eWKhHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611206; c=relaxed/simple;
	bh=mnWuCX8+sSkjwcqYo9JqnziSgy2H0ljhlqP4ueLb/qQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pyhuNM0CA0sy2lIcpC0uuKH3sx3jBXWD2jobUT5AmVnQlHtgqLsdBsO+J3DSzbQL5KMV/lzUx6RmUPIQAZDyecSoTOlGBYpKVlQTzpV2TfFpMDvhgp2wptmAjb2ErKXH6k81bXSwf1fi+MR3CsvbHWhTjxiLdWnbwsLZa24Q6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ns/eaXK7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ns/eaXK7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48379489438so62161795e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 00:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772611200; x=1773216000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yr4CzJIxCtlElo+LPMhI9rocYF8ProN0VOp5lS2yk4=;
        b=Ns/eaXK7dcZ4+4yx9VmDhmrMSZO83d00Kjwb/1yfdQuJbTvQbMWJt9zHkfS8mgFiT4
         rcRoEdips+b/iJtq56cQnmL99VkDtGxCl2o8jqLD6VAfBGHly0o3cv4ynbMkr5c4fIvb
         HgubOEG3psxmz4i1g1X7L1UaaxpaU/UoBj4j4V22b+jKJ4fC6r8+LX3VFc7RdKEm2ZIH
         8FItKMJ1pdVdkbel2wx/JsZEoP0V/dCIxF0QVFjMDH9h356SFXuyp7AbWGbJtNH6g0qC
         EQpAjiPCxBlxqLdQGUS+hpM1qPk1YdFuHOptIZHn7g8ohMw1UUZVGDrj9lvh9GDlQeAj
         gozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611200; x=1773216000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yr4CzJIxCtlElo+LPMhI9rocYF8ProN0VOp5lS2yk4=;
        b=RqCuWNBfCTeL+BMh+7JDaN2Th420I9j5B6U6RxK8J7AJZfEYovqRf4mRVAbEkoLcUl
         x9DC5rAudCkXToc17lGxvrOaDlM4dhZYkilgezthHDG0e+drG1Z+nPwtQfId7OWhfcnz
         cEeZXxo/+cw1T0ckYGtfT0LB4SEtkZw9rnteRC2fh+4FfXG1Grla9wWeACP9lFwlzjcD
         iNa20LaD7h6hL8QfSpBFMkHNEPwsC4MLTkdxQ5pIhiI15W7ZfaoVG+vIB5Fh/pbo0XkU
         vDLpID9xG9htp0e7xEnY6Ww6UAiOLWGHfgpEp/dln9et7lHqPtwpSy2bSYjI/IiGaS6w
         qaCA==
X-Forwarded-Encrypted: i=1; AJvYcCWNN34f1hzVqNzbcANtl5YEPsKxhZDB+nPjCV8xQ523vqZDwr82M9t7Edkw7nburNty11mw2iZH6LJ4T5INEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWN8+HkA0QY8Gdr5LwOgAEnufsH5nDpKnEStwa8L51YarY3xGo
	/YTLCjBPfT6kexRs4+53bQmW5FNUBu6Hv2zNFc+T0+sqDx0p5+iqbZM08yCYnhLSf7UXnDjRln0
	oHPtYewts3iRM7XkCyw==
X-Received: from wmxa3-n1.prod.google.com ([2002:a05:600d:6443:10b0:477:988a:7675])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed0:b0:483:6bb1:117 with SMTP id 5b1f17b1804b1-485198a5a49mr13217865e9.32.1772611200239;
 Wed, 04 Mar 2026 00:00:00 -0800 (PST)
Date: Wed, 4 Mar 2026 07:59:59 +0000
In-Reply-To: <aadbyBmaV8zCYiog@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213-upgrade-poll-v2-0-984a0fb184fb@google.com>
 <20260213-upgrade-poll-v2-1-984a0fb184fb@google.com> <aadbyBmaV8zCYiog@tardis.local>
Message-ID: <aafmf5icyPIFcwf_@google.com>
Subject: Re: [PATCH v2 1/2] rust: poll: make PollCondVar upgradable
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 02:08:08PM -0800, Boqun Feng wrote:
> On Fri, Feb 13, 2026 at 11:29:41AM +0000, Alice Ryhl wrote:
> > Rust Binder currently uses PollCondVar, but it calls synchronize_rcu()
> > in the destructor, which we would like to avoid. Add a variation of
> > PollCondVar, which uses kfree_rcu() instead.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/sync/poll.rs | 160 ++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 159 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> > index 0ec985d560c8d3405c08dbd86e48b14c7c34484d..9555f818a24d777dd908fca849015c3490ce38d3 100644
> > --- a/rust/kernel/sync/poll.rs
> > +++ b/rust/kernel/sync/poll.rs
> > @@ -5,12 +5,21 @@
> >  //! Utilities for working with `struct poll_table`.
> >  
> >  use crate::{
> > +    alloc::AllocError,
> >      bindings,
> > +    container_of,
> >      fs::File,
> >      prelude::*,
> > +    sync::atomic::{Acquire, Atomic, Relaxed, Release},
> > +    sync::lock::{Backend, Lock},
> >      sync::{CondVar, LockClassKey},
> > +    types::Opaque, //
> > +};
> > +use core::{
> > +    marker::{PhantomData, PhantomPinned},
> > +    ops::Deref,
> > +    ptr,
> >  };
> > -use core::{marker::PhantomData, ops::Deref};
> >  
> >  /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
> >  #[macro_export]
> > @@ -66,6 +75,7 @@ pub fn register_wait(&self, file: &File, cv: &PollCondVar) {
> >  ///
> >  /// [`CondVar`]: crate::sync::CondVar
> >  #[pin_data(PinnedDrop)]
> > +#[repr(transparent)]
> >  pub struct PollCondVar {
> >      #[pin]
> >      inner: CondVar,
> > @@ -78,6 +88,17 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
> >              inner <- CondVar::new(name, key),
> >          })
> >      }
> > +
> > +    /// Use this `CondVar` as a `PollCondVar`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// After the last use of the returned `&PollCondVar`, `__wake_up_pollfree` must be called on
> > +    /// the `wait_queue_head` at least one grace period before the `CondVar` is destroyed.
> > +    unsafe fn from_non_poll(c: &CondVar) -> &PollCondVar {
> > +        // SAFETY: Layout is the same. Caller ensures that PollTables are cleared in time.
> > +        unsafe { &*ptr::from_ref(c).cast() }
> > +    }
> >  }
> >  
> >  // Make the `CondVar` methods callable on `PollCondVar`.
> > @@ -104,3 +125,140 @@ fn drop(self: Pin<&mut Self>) {
> >          unsafe { bindings::synchronize_rcu() };
> >      }
> >  }
> > +
> > +/// Wrapper around [`CondVar`] that can be upgraded to [`PollCondVar`].
> > +///
> > +/// By using this wrapper, you can avoid rcu for cases that don't use [`PollTable`], and in all
> > +/// cases you can avoid `synchronize_rcu()`.
> > +///
> > +/// # Invariants
> > +///
> > +/// `active` either references `simple`, or a `kmalloc` allocation holding an
> > +/// `UpgradePollCondVarInner`. In the latter case, the allocation remains valid until
> > +/// `Self::drop()` plus one grace period.
> > +#[pin_data(PinnedDrop)]
> > +pub struct UpgradePollCondVar {
> > +    #[pin]
> > +    simple: CondVar,
> > +    active: Atomic<*const CondVar>,
> > +    #[pin]
> > +    _pin: PhantomPinned,
> > +}
> > +
> > +#[pin_data]
> > +#[repr(C)]
> > +struct UpgradePollCondVarInner {
> > +    #[pin]
> > +    upgraded: CondVar,
> > +    #[pin]
> > +    rcu: Opaque<bindings::callback_head>,
> > +}
> > +
> > +impl UpgradePollCondVar {
> > +    /// Constructs a new upgradable condvar initialiser.
> > +    pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
> > +        pin_init!(&this in Self {
> > +            simple <- CondVar::new(name, key),
> > +            // SAFETY: `this->simple` is in-bounds. Pointer remains valid since this type is
> > +            // pinned.
> > +            active: Atomic::new(unsafe { &raw const (*this.as_ptr()).simple }),
> > +            _pin: PhantomPinned,
> > +        })
> > +    }
> > +
> > +    /// Obtain a [`PollCondVar`], upgrading if necessary.
> > +    ///
> > +    /// You should use the same lock as what is passed to the `wait_*` methods. Otherwise wakeups
> > +    /// may be missed.
> > +    pub fn poll<T: ?Sized, B: Backend>(
> > +        &self,
> > +        lock: &Lock<T, B>,
> > +        name: &'static CStr,
> > +        key: Pin<&'static LockClassKey>,
> > +    ) -> Result<&PollCondVar, AllocError> {
> > +        let mut ptr = self.active.load(Acquire);
> > +        if ptr::eq(ptr, &self.simple) {
> > +            self.upgrade(lock, name, key)?;
> > +            ptr = self.active.load(Acquire);
> > +            debug_assert_ne!(ptr, ptr::from_ref(&self.simple));
> > +        }
> > +        // SAFETY: Signature ensures that last use of returned `&PollCondVar` is before drop(), and
> > +        // drop() calls `__wake_up_pollfree` followed by waiting a grace period before the
> > +        // `CondVar` is destroyed.
> > +        Ok(unsafe { PollCondVar::from_non_poll(&*ptr) })
> > +    }
> > +
> > +    fn upgrade<T: ?Sized, B: Backend>(
> > +        &self,
> > +        lock: &Lock<T, B>,
> > +        name: &'static CStr,
> > +        key: Pin<&'static LockClassKey>,
> > +    ) -> Result<(), AllocError> {
> > +        let upgraded = KBox::pin_init(
> > +            pin_init!(UpgradePollCondVarInner {
> > +                upgraded <- CondVar::new(name, key),
> > +                rcu: Opaque::uninit(),
> > +            }),
> > +            GFP_KERNEL,
> > +        )
> > +        .map_err(|_| AllocError)?;
> > +
> > +        // SAFETY: The value is treated as pinned.
> > +        let upgraded = KBox::into_raw(unsafe { Pin::into_inner_unchecked(upgraded) });
> > +
> > +        let res = self.active.cmpxchg(
> > +            ptr::from_ref(&self.simple),
> > +            // SAFETY: This operation stays in-bounds of the above allocation.
> > +            unsafe { &raw mut (*upgraded).upgraded },
> > +            Release,
> > +        );
> > +
> > +        if res.is_err() {
> > +            // Already upgraded, so still succeess.
> > +            // SAFETY: The cmpxchg failed, so take back ownership of the box.
> > +            drop(unsafe { KBox::from_raw(upgraded) });
> > +            return Ok(());
> > +        }
> > +
> > +        // If a normal waiter registers in parallel with us, then either:
> > +        // * We took the lock first. In that case, the waiter sees the above cmpxchg.
> > +        // * They took the lock first. In that case, we wake them up below.
> > +        drop(lock.lock());
> > +        self.simple.notify_all();
> 
> Hmm.. what if the waiter gets its `&CondVar` before `upgrade()` and use
> that directly?
> 
> 	<waiter>				<in upgrade()>
> 	let poll_cv: &UpgradePollCondVar = ...;
> 	let cv = poll_cv.deref();
> 						cmpxchg();
> 						drop(lock.lock());
> 						self.simple.notify_all();
> 	let mut guard = lock.lock();
> 	cv.wait(&mut guard);
> 
> we still miss the wake-up, right?
> 
> It's creative, but I particularly hate we use an empty lock critical
> section to synchronize ;-)

I guess instead of exposing Deref, I can just implement `wait` directly
on `UpgradePollCondVar`. Then this API misuse is not possible.

> Do you think the complexity of a dynamic upgrading is worthwhile, or we
> should just use the box-allocated PollCondVar unconditionally?
> 
> I think if the current users won't benefit from the dynamic upgrading
> then we can avoid the complexity. We can always add it back later.
> Thoughts?

I do actually think it's worthwhile to consider:

I started an Android device running this. It created 3961 instances of
`UpgradePollCondVar` during the hour it ran, but only 5 were upgraded.

Alice
