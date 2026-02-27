Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27471394474
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219338; cv=none; b=lAmjPvf09iNBi7pBVssTR2MmUs8iJ+XfCiX1fOkDKJVj2DO4vxJx8MRVBrFVK4+Bu7WhgEEgrziaerC4xZ91uyj6azhg1gUMN2pdl6UB0VVfdb0bKaDXCPJK37t76IhI9heNSFrMYk87cBwCS89jMJrFNZTvgcweBuDy/GSh520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219338; c=relaxed/simple;
	bh=9sXlLs4ZMifSbCbQzla7pc8N0u7RyG3QY65nLMhZe/w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WUGgTYHNAChutQT1pMuwv730zCUfL2e+Nv2xZlDnu0arGokBEHjlOzXOEaWY7HHQi0vYmDZOYxBJXSUXFRQCMt15ktgyvRJCBlxnoqpolu2PucNRL/I7atyC1bfilR82YfVyYqRgdpooWEbmArRA2ExbIMoJ1f3qO3tUoG+mYAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1exDHNso; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1exDHNso"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439887ab171so2214019f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772219335; x=1772824135; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKl2L/f64kp6D3wKnrzXcdx82f05o0GZA2F71umflYk=;
        b=1exDHNsoP982SYLBkoB+MkEfQi/rG088WZlmqcoXmjZ8BwViqTNbh3FJsi5boKv53v
         nc43E0QEVyU4Mc3UflH9g/OVNngQ/BZxbpc2xlfUj4L2HD83VtEhpC3NACDD/Z9qGcZO
         gA9fluiW/pNWnkibX1DHry7i+DXb3KH8RSVzEkk5BlBaThvC+m/eXU0aJ4qyaRYvYzN2
         vuLtihX64tZ1CZgvgFfjMkFqusaTAP/27tNkUyrB9iXtvxteton4yzxLwbL9+mCyksFC
         mZubpPflnwSkO8MDurRPJg0ucbR5TDfCCadac4HRmfI8PxCcX/LNAXimvV6PApRRA7WV
         xj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219335; x=1772824135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKl2L/f64kp6D3wKnrzXcdx82f05o0GZA2F71umflYk=;
        b=lB3qjDbLu8r+DjWwPPMWta+oqX1x82lRCKa8d7u56MAoBzGXODbRm6dScoMc3iYF8Y
         XAcLWo8bxHXRt4r8bSY3AhgRST6+JGJ/9GHHB9Dd2ETEyw6fGdqGnUBI7IhoQ8PxwbOP
         phiZmxzlh/Ve9eTRE+kXFVhV8XdeZ337ENvOl28kx35KPAKsiQWimlDdDaOhwOJg7Mb6
         MFkrabjIBUI3kvfwVqymQFEhorki9bk+iEonGIJjDN28N1k/61xya/Q3WVd1WYfAh5Wl
         G1IZlA2Z9TNFmFXiH+VAypzkBEodIH9Pelp96K1VFF2rBzwfBJHna8spPg4mxK6W5P8d
         VajA==
X-Forwarded-Encrypted: i=1; AJvYcCWhWdDmRVJzoqObhAO6VOOrsmOe7tVNEWSHNjiMy12kKbRwvd6uYf5UOnA5sCej3WdEimD0ilsjxtQ3hRSkFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ETVcFS8DBSwm9lUMcbpw19dNbFFIs7bZ+XY1ZY8x1tkem8js
	2zlNYme0gx9nuH4ENwcTwTeDz8vhmOueOQ4VZRDlT99yDMzG3z+BqH+ouQuH3Pi15XBpg6gz/fD
	O3/aUrCV4efcwFlcSQA==
X-Received: from wrpz5.prod.google.com ([2002:adf:f745:0:b0:437:6ebe:6e6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:437:6c23:3458 with SMTP id ffacd0b85a97d-4399ddee887mr7109468f8f.21.1772219335464;
 Fri, 27 Feb 2026 11:08:55 -0800 (PST)
Date: Fri, 27 Feb 2026 19:08:54 +0000
In-Reply-To: <DGPVESJHRDJZ.3VHEZW1ZM7Q3Q@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com> <DGPVESJHRDJZ.3VHEZW1ZM7Q3Q@garyguo.net>
Message-ID: <aaHrxplUcVSUaUrH@google.com>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 27, 2026 at 04:04:57PM +0000, Gary Guo wrote:
> On Fri Feb 27, 2026 at 2:53 PM GMT, Alice Ryhl wrote:
> > Creating workqueues is needed by various GPU drivers. Not only does it
> > give you better control over execution, it also allows devices to ensure
> > that all tasks have exited before the device is unbound (or similar) by
> > running the workqueue destructor.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/workqueue.c |   7 ++
> >  rust/kernel/workqueue.rs | 190 ++++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 194 insertions(+), 3 deletions(-)
> >
> > diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> > index ce1c3a5b2150..e4b9d1b3d6bf 100644
> > --- a/rust/helpers/workqueue.c
> > +++ b/rust/helpers/workqueue.c
> > @@ -14,3 +14,10 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
> >  	INIT_LIST_HEAD(&work->entry);
> >  	work->func = func;
> >  }
> > +
> > +__rust_helper
> > +struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
> > +						     int max_active, const void *data)
> > +{
> > +	return alloc_workqueue(fmt, flags, max_active, data);
> > +}
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 1acd113c04ee..4ef02a537cd9 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -186,7 +186,10 @@
> >  //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
> >  
> >  use crate::{
> > -    alloc::{AllocError, Flags},
> > +    alloc::{
> > +        self,
> > +        AllocError, //
> > +    },
> >      container_of,
> >      prelude::*,
> >      sync::Arc,
> > @@ -194,7 +197,11 @@
> >      time::Jiffies,
> >      types::Opaque,
> >  };
> > -use core::marker::PhantomData;
> > +use core::{
> > +    marker::PhantomData,
> > +    ops::Deref,
> > +    ptr::NonNull, //
> > +};
> >  
> >  /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
> >  #[macro_export]
> > @@ -340,7 +347,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
> >      /// This method can fail because it allocates memory to store the work item.
> >      pub fn try_spawn<T: 'static + Send + FnOnce()>(
> >          &self,
> > -        flags: Flags,
> > +        flags: alloc::Flags,
> >          func: T,
> >      ) -> Result<(), AllocError> {
> >          let init = pin_init!(ClosureWork {
> > @@ -353,6 +360,183 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
> >      }
> >  }
> >  
> > +/// Workqueue builder.
> > +///
> > +/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
> > +/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
> > +/// flag.
> > +///
> > +/// For details, please refer to `Documentation/core-api/workqueue.rst`.
> > +pub struct Builder {
> > +    flags: bindings::wq_flags,
> > +    max_active: i32,
> > +}
> > +
> > +impl Builder {
> > +    /// Not bound to any cpu.
> > +    #[inline]
> > +    pub fn unbound() -> Builder {
> 
> These can all be "-> Self".
> 
> > +        Builder {
> > +            flags: bindings::wq_flags_WQ_UNBOUND,
> > +            max_active: 0,
> > +        }
> > +    }
> > +
> > +    /// Bound to a specific cpu.
> > +    #[inline]
> > +    pub fn percpu() -> Builder {
> > +        Builder {
> > +            flags: bindings::wq_flags_WQ_PERCPU,
> > +            max_active: 0,
> > +        }
> > +    }
> > +
> > +    /// Set the maximum number of active cpus.
> > +    ///
> > +    /// If not set, a reasonable default value is used. The maximum value is `WQ_MAX_ACTIVE`.
> > +    #[inline]
> > +    pub fn max_active(mut self, max_active: u32) -> Builder {
> > +        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
> > +        self
> > +    }
> > +
> > +    /// Allow this workqueue to be frozen during suspend.
> > +    #[inline]
> > +    pub fn freezable(mut self) -> Self {
> > +        self.flags |= bindings::wq_flags_WQ_FREEZABLE;
> > +        self
> > +    }
> > +
> > +    /// This workqueue may be used during memory reclaim.
> > +    #[inline]
> > +    pub fn mem_reclaim(mut self) -> Self {
> > +        self.flags |= bindings::wq_flags_WQ_MEM_RECLAIM;
> > +        self
> > +    }
> > +
> > +    /// Mark this workqueue as cpu intensive.
> > +    #[inline]
> > +    pub fn cpu_intensive(mut self) -> Self {
> > +        self.flags |= bindings::wq_flags_WQ_CPU_INTENSIVE;
> > +        self
> > +    }
> > +
> > +    /// Make this workqueue visible in sysfs.
> > +    #[inline]
> > +    pub fn sysfs(mut self) -> Self {
> > +        self.flags |= bindings::wq_flags_WQ_SYSFS;
> > +        self
> > +    }
> > +
> > +    /// Mark this workqueue high priority.
> > +    #[inline]
> > +    pub fn highpri(mut self) -> Self {
> > +        self.flags |= bindings::wq_flags_WQ_HIGHPRI;
> > +        self
> > +    }
> > +
> > +    /// Allocates a new workqueue.
> > +    ///
> > +    /// The provided name is used verbatim as the workqueue name.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::workqueue;
> > +    ///
> > +    /// // create an unbound workqueue registered with sysfs
> > +    /// let wq = workqueue::Builder::unbound().sysfs().build(c"my-wq")?;
> > +    ///
> > +    /// // spawn a work item on it
> > +    /// wq.try_spawn(
> > +    ///     GFP_KERNEL,
> > +    ///     || pr_warn!("Printing from my-wq"),
> > +    /// )?;
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    #[inline]
> > +    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
> > +        // SAFETY:
> > +        // * c"%s" is compatible with passing the name as a c-string.
> > +        // * the builder only permits valid flag combinations
> > +        let ptr = unsafe {
> > +            bindings::alloc_workqueue(
> > +                c"%s".as_char_ptr(),
> > +                self.flags,
> > +                self.max_active,
> > +                name.as_char_ptr().cast::<c_void>(),
> > +            )
> > +        };
> 
> INVARIANT comments?
> 
> > +
> > +        Ok(OwnedQueue {
> > +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> > +        })
> > +    }
> > +
> > +    /// Allocates a new workqueue.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
> > +    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
> > +    ///
> > +    /// ```
> > +    /// use kernel::{
> > +    ///     alloc::AllocError,
> > +    ///     workqueue::{self, OwnedQueue},
> > +    /// };
> > +    ///
> > +    /// fn my_wq(num: u32) -> Result<OwnedQueue, AllocError> {
> > +    ///     // create a percpu workqueue called my-wq-{num}
> > +    ///     workqueue::Builder::percpu().build_fmt(fmt!("my-wq-{num}"))
> > +    /// }
> > +    /// ```
> > +    #[inline]
> > +    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<OwnedQueue, AllocError> {
> > +        // SAFETY:
> > +        // * c"%pA" is compatible with passing an `Arguments` pointer.
> > +        // * the builder only permits valid flag combinations
> > +        let ptr = unsafe {
> > +            bindings::alloc_workqueue(
> > +                c"%pA".as_char_ptr(),
> > +                self.flags,
> > +                self.max_active,
> > +                core::ptr::from_ref(&name).cast::<c_void>(),
> > +            )
> > +        };
> > +
> > +        Ok(OwnedQueue {
> > +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> > +        })
> > +    }
> > +}
> > +
> > +/// An owned kernel work queue.
> > +///
> > +/// Dropping a workqueue blocks on all pending work.
> > +///
> > +/// # Invariants
> > +///
> > +/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
> > +pub struct OwnedQueue {
> > +    queue: NonNull<Queue>,
> > +}
> > +
> > +impl Deref for OwnedQueue {
> > +    type Target = Queue;
> > +    fn deref(&self) -> &Queue {
> > +        // SAFETY: By the type invariants, this pointer references a valid queue.
> > +        unsafe { &*self.queue.as_ptr() }
> > +    }
> > +}
> > +
> > +impl Drop for OwnedQueue {
> > +    fn drop(&mut self) {
> > +        // SAFETY: The `OwnedQueue` is being destroyed, so we can destroy the workqueue it owns.
> 
> Hmm, is this correct? This should say *why* the call is safe, not what it is
> doing.
> 
> I think this should mention: (1) the pointer is valid and (2) no delayed work is
> being scheduled on this queue.

Although it is missing the part about delayed work, I do think this
talks about why. The pointer being valid is far insufficient. We need
actual ownership of the workqueue - nobody can use it after this. We can
destroy the inner workqueue *because* the OwnedQueue owning it is being
dropped.

Alice
