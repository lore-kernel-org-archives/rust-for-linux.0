Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2E38F63E;
	Mon, 16 Mar 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658671; cv=none; b=VRRPZil+ADc1Ce/heIWQmT5zcjlKhV1K2eDkcvaHVTa3XjZ3BtLdT+0zpyUpNLwJg8KuqypwAhdyiY1MhhK9jmpQiRLKyY9ZxkNZFs+DFSbPS8S15Ffeoj9UT5fJ8bZrzOEVKXmwzr/FQ031Dl9DbZanxcrkc7JLbwal+mlntJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658671; c=relaxed/simple;
	bh=FYDMasLvIv5NWR58T4Jb92xKG+jwRfp6xPCknteYx74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dgINi2DRvUPrcl+9sZ3H/VR484Xr5VYJenP/Z+p6ByQyW0PiYyO6p45VduCe0vJ7LQeIuZ1h34N5xlqED3eZxGSIErVfFeDYS9YXr+nEKVFgXhgloSTQ9HqpqnU+pRIr4x73rXzrC6IHBzI/ZvNmMljir/AdKGMThS009Ytb+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+uETQkm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+uETQkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CB2C19421;
	Mon, 16 Mar 2026 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773658670;
	bh=FYDMasLvIv5NWR58T4Jb92xKG+jwRfp6xPCknteYx74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i+uETQkmNj5xc1vNgEf7mcsI/qEo4KUJ7lvUNDRjJJ39ttMr/TpaA4PbqHx6VL1z1
	 UWYwD8K0zq/SpqHTwACuLmWTgc728muVcizIk1bqeCSodA6LEoSzK6dXIHpiZuhZ+U
	 2DTykjV/wO6S0J1kMVPSoytJ3wxHpmgzYOWjCBpVjtZVY0VArmPQGiaFKtc4oS18cu
	 Zr06VAAYv/eILrbNOiGZ7E8eSB5DiWvpfzTDF0l/cf01vEvvGW/kPDwzi848nZPXIa
	 zW2fpWKmtf5VU8kF+l1H9g3IGZyRkw1i1B+MccCdgQpe3//4r2GappfvJbjiDN+iQO
	 kC1yCtZGBc7Vg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, Boqun
 Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, Tamir
 Duberstein <tamird@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
In-Reply-To: <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <w0p27rGwxnTIYLId4IA3wuzLE_SM-svmCGmNK1EyA7FhtBfw2H8Al-EdeNamE1Z0__OaC3hYmGlL9E3mKMO6RQ==@protonmail.internalid>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
Date: Mon, 16 Mar 2026 11:57:33 +0100
Message-ID: <87jyvcrqhu.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/workqueue.c         |   7 +
>  rust/kernel/workqueue/builder.rs | 380 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/workqueue/mod.rs     |  44 ++++-
>  3 files changed, 428 insertions(+), 3 deletions(-)
>
> diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> index ce1c3a5b2150..e4b9d1b3d6bf 100644
> --- a/rust/helpers/workqueue.c
> +++ b/rust/helpers/workqueue.c
> @@ -14,3 +14,10 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
>  	INIT_LIST_HEAD(&work->entry);
>  	work->func = func;
>  }
> +
> +__rust_helper
> +struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
> +						     int max_active, const void *data)
> +{
> +	return alloc_workqueue(fmt, flags, max_active, data);
> +}
> diff --git a/rust/kernel/workqueue/builder.rs b/rust/kernel/workqueue/builder.rs
> new file mode 100644
> index 000000000000..d4d77b96f9c4
> --- /dev/null
> +++ b/rust/kernel/workqueue/builder.rs
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Workqueue builders.
> +
> +use kernel::{
> +    alloc::AllocError,
> +    prelude::*,
> +    workqueue::{
> +        OwnedQueue, //
> +        Queue,
> +    }, //
> +};
> +
> +use core::{
> +    marker::PhantomData, //
> +    ptr::{self, NonNull},
> +};
> +
> +/// Workqueue builder.
> +///
> +/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
> +/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
> +/// flag.
> +///
> +/// For details, please refer to `Documentation/core-api/workqueue.rst`.
> +pub struct Builder<T> {
> +    flags: bindings::wq_flags,
> +    max_active: i32,
> +    _type: PhantomData<T>,
> +}
> +
> +pub enum TypeUnbound {}
> +pub enum TypePercpu {}
> +pub enum TypePowerEfficient {}
> +pub enum TypeBH {}

Could you expand the name here?

> +pub enum TypeOrdered {}
> +
> +/// Entry-points to the builder API.
> +impl Queue {
> +    /// Build a workqueue whose work may execute on any cpu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_unbound().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_UNBOUND")]
> +    pub fn new_unbound() -> Builder<TypeUnbound> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_UNBOUND,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a workqueue whose work is bound to a specific cpu.

Could you elaborate what this means? When are work items moved between
CPUs normally? If it is a specific CPU, how is the CPU specified?

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_percpu().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from percpu wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_PERCPU")]
> +    pub fn new_percpu() -> Builder<TypePercpu> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_PERCPU,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a power-efficient workqueue.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_power_efficient().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from power-efficient wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_POWER_EFFICIENT")]
> +    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_POWER_EFFICIENT,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a single-threaded workqueue that executes jobs in order.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_ordered().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "alloc_ordered_workqueue")]
> +    #[doc(alias = "__WQ_ORDERED")]
> +    pub fn new_ordered() -> Builder<TypeOrdered> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags___WQ_ORDERED,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a workqueue that executes in bottom-half (softirq) context.

Is bottom-half and softirq context the same?

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_bh().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from BH wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_BH")]
> +    pub fn new_bh() -> Builder<TypeBH> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_BH,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +}
> +
> +/// Options that may be used with all workqueue types.
> +impl<T> Builder<T> {
> +    /// Mark this workqueue high priority.

Could you elaborate the meaning of "high priority"?

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_unbound().highpri().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from highpri wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_HIGHPRI")]
> +    pub fn highpri(mut self) -> Self {
> +        self.flags |= bindings::wq_flags_WQ_HIGHPRI;
> +        self
> +    }
> +
> +    /// Creates the workqueue.
> +    ///
> +    /// The provided name is used verbatim as the workqueue name.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// // create an unbound workqueue registered with sysfs
> +    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
> +    ///
> +    /// // spawn a work item on it
> +    /// wq.try_spawn(
> +    ///     GFP_KERNEL,
> +    ///     || pr_warn!("Printing from my-wq"),
> +    /// )?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "alloc_workqueue")]
> +    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
> +        // SAFETY:
> +        // * c"%s" is compatible with passing the name as a c-string.
> +        // * the builder only permits valid flag combinations
> +        let ptr = unsafe {
> +            bindings::alloc_workqueue(
> +                c"%s".as_char_ptr(),
> +                self.flags,
> +                self.max_active,
> +                name.as_char_ptr().cast::<c_void>(),
> +            )
> +        };
> +
> +        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
> +        // caller.
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
> +
> +    /// Creates the workqueue.
> +    ///
> +    /// # Examples
> +    ///
> +    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
> +    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::{Queue, OwnedQueue};
> +    ///
> +    /// fn my_wq(num: u32) -> Result<OwnedQueue> {
> +    ///     // create a percpu workqueue called my-wq-{num}
> +    ///     let wq = Queue::new_percpu().build_fmt(fmt!("my-wq-{num}"))?;
> +    ///     Ok(wq)
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<OwnedQueue, AllocError> {
> +        // SAFETY:
> +        // * c"%pA" is compatible with passing an `Arguments` pointer.
> +        // * the builder only permits valid flag combinations
> +        let ptr = unsafe {
> +            bindings::alloc_workqueue(
> +                c"%pA".as_char_ptr(),
> +                self.flags,
> +                self.max_active,
> +                ptr::from_ref(&name).cast::<c_void>(),
> +            )
> +        };
> +
> +        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
> +        // caller.
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
> +}
> +
> +/// Indicates that this workqueue is threaded.
> +pub trait TypeThreaded {}
> +impl TypeThreaded for TypeUnbound {}
> +impl TypeThreaded for TypePercpu {}
> +impl TypeThreaded for TypePowerEfficient {}

Could implementing one of these traits for the wrong type cause
unsoundness? If so, should they be unsafe?

> +
> +/// Options that are not available on BH or ordered workqueues.
> +impl<T: TypeThreaded> Builder<T> {
> +    /// Set the maximum number of active cpus.

Please clarify more clearly what "maximum number of active cpus" mean
for a workqueue.

> +    ///
> +    /// If not set, a default value of `WQ_DFL_ACTIVE` is used. The maximum value is
> +    /// `WQ_MAX_ACTIVE`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_unbound().max_active(16).build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from wq with max_active=16"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn max_active(mut self, max_active: u32) -> Self {
> +        // If provided `max_active` is greater than `i32::MAX`, then we need to trigger the C-side
> +        // comparison with `WQ_MAX_ACTIVE`, which we can do by clamping to `i32::MAX`.
> +        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
> +        self
> +    }
> +
> +    /// Mark this workqueue as cpu intensive.

What does the kernel do to a queue when it is marked cpu intensive?

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_unbound().cpu_intensive().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from cpu-intensive wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_CPU_INTENSIVE")]
> +    pub fn cpu_intensive(mut self) -> Self {
> +        self.flags |= bindings::wq_flags_WQ_CPU_INTENSIVE;
> +        self
> +    }
> +
> +    /// Make this workqueue visible in sysfs.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from sysfs wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias = "WQ_SYSFS")]
> +    pub fn sysfs(mut self) -> Self {
> +        self.flags |= bindings::wq_flags_WQ_SYSFS;
> +        self
> +    }
> +}
> +
> +/// Indicates that this workqueue runs in a normal context (as opposed to softirq context).
> +pub trait TypeNormal {}
> +impl TypeNormal for TypeUnbound {}
> +impl TypeNormal for TypePercpu {}
> +impl TypeNormal for TypePowerEfficient {}
> +impl TypeNormal for TypeOrdered {}
> +
> +/// Options that are not available on BH workqueues.
> +impl<T: TypeNormal> Builder<T> {
> +    /// Allow this workqueue to be frozen during suspend.

What happens to queues that are not frozen during suspend? They just
continue executing tasks until the system is powered off?


Best regards,
Andreas Hindborg



