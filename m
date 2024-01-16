Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2144867C50
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 23:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705449238; cv=none; b=sF+wQW/a0bhQXx85hZTRzonNRufkfiUHGQM9UEN78meeNWsz2XB9z4d7FyxAOiPMhhPSI5tvJmaeAj/xdF5ADjxyjZ+s3WlSSFiRt9DC+N9ftAf2bSoOnKMQPufjhqsFB/iNkFPh42kWA0dtOUZBs9/aYWpgnv2xjV+IeaaNVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705449238; c=relaxed/simple;
	bh=mqP49LU/7wDuVWATbX8r4NikHCc8NiuZ8O0RouprPqo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:Received:X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:
	 X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=lgT1JNhOmyvODtu3UPBVWNsTXZOWqMlr08y0fm4BVrgCQ9dt7ONn8Bf2jBfthLk3yF35M6dr++dfppRil241jCNRdBnuYtpvZ4VqP0Ei85F1uktW/DKwI5tuQoCr+Uh+UyGr+pVsMEEpwoSiIWBMLGOkoxCBrLazpIUhnIfCryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF0vXgbf; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF0vXgbf"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7833b6bb41bso524664385a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 15:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705449235; x=1706054035; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SFYplAg8EeUO3zS6Xla5VXDalSDSOU38nNCodpFh3kI=;
        b=nF0vXgbfamUX5yXuAy2c00zf+ot2WLRi/xWIOQfxtBrGEUWL8Kzqilz2qzrTSjJN8d
         X553zGazwVI3QcGKUPMqkxbMpbmYDwKQi+F3HeFmWycnuMeEUD3ZtjbIXbKKLHgk7H55
         ilLswe/sD0zJfrezUQrkU1xS6vMv2i/yCpQnpBvElImDsOTi/7N5hrcGTjlA6hP9Jcra
         NP7ONbFyMTQgUT6Tk/fcwutm+dAWc+Cx6Vo3TC1zZgyBmdeKz7rBJa1SzZKxEL6+80zo
         aBbesfPwWyU73voOGJdi2nB9EOPINefQ+H5FC2KgszLr93+g8hu22lFQQkr0ChbM4pNz
         RXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705449235; x=1706054035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFYplAg8EeUO3zS6Xla5VXDalSDSOU38nNCodpFh3kI=;
        b=lmr17inbIbqCgj5WvWzhhk8lWC7nZ6u/5HcpOVDQMi33Zlrl3kXGyIG2h1le4dLv26
         MGZmwBrllrcOkoR4ZV++s3rPjp2SZt0XSIFViLOFiFSjKJZl4XBcqqlIIgfwNuLQstT+
         2UpsM0xQwkbTxQcQiL7Z3ghikjlethjNhb2gmKP7i4KbPCLNANusg6qd58ekDejK2TzO
         dlUImnaBkgDsEa5FqJumM41dfQ8cufUlMjeoPll6VJa3OBYx0AEhTfib97svePSEPDgm
         EEtSVmJ5/0HY5gHu5qnLu0QNSWbir2MfiGztIr7CS27DCTVXt6MVyaLNBZ4JXSD99J2K
         5HaQ==
X-Gm-Message-State: AOJu0Yx0yg1fe6XBGO8rILNpPSmYLMHkMs6tvV7sF4ZIyze2kkMBgeR4
	iEKPznHMbsrBGRirPCo8Re0=
X-Google-Smtp-Source: AGHT+IGrnFdy2QIx0lxLmPmP4uOYwAyzGYladd+rmPTb+7i4T4Qmm4QMl8W8QBxGTBoHAng0xxCXbw==
X-Received: by 2002:ad4:5ae8:0:b0:680:9d65:e94a with SMTP id c8-20020ad45ae8000000b006809d65e94amr9408786qvh.91.1705449234854;
        Tue, 16 Jan 2024 15:53:54 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id j18-20020a0cf9d2000000b00681785c95e0sm399767qvo.46.2024.01.16.15.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 15:53:54 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id F017A27C0060;
	Tue, 16 Jan 2024 18:53:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Jan 2024 18:53:53 -0500
X-ME-Sender: <xms:ERenZZ4CjfxSlLBTBYrcezvPQp6H35VpoAX3waqbtAaQtKGGv1vKzQ>
    <xme:ERenZW4tAu5o-CQyjOAxZqGTE7AuvV0TfgnNqKK9fVG3ZEzYisWU_f1pY_MKQJJzf
    coCGv6zx8XAygiV4A>
X-ME-Received: <xmr:ERenZQeEhoiRREYmAEvMW0Q6IJS7g38ZYgiEgW2vggYtpMP-AlhfNu0LNFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejgedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepkedvvdeggfdtuedvveegtedvleejvddvveetgfeujeeiieethfdutdeg
    keehgefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgv
X-ME-Proxy: <xmx:ERenZSLtOwlo0c2xlT5JYhs7JWEXfkujSvLDcnI0PmQ6B-JR5FYqIA>
    <xmx:ERenZdJHLBnF9DpcgIeE4X0Ybd61MtH7dRgWM5GpyxoLCwBw_hM7cA>
    <xmx:ERenZbzc31IOWN5lcFl_6T6d0hqu-JdSvINPJWWSyifIQQ_jypUVzg>
    <xmx:ERenZXD-K5FXpS-nxHiqK_obVtozsaRZAfKk_XzVYXGckMxVKZ7A5Q>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jan 2024 18:53:52 -0500 (EST)
Date: Tue, 16 Jan 2024 15:53:33 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v6] rust: xarray: Add an abstraction for XArray
Message-ID: <ZacW_e1mnNi6hT7M@boqun-archlinux>
References: <20240116151728.370238-1-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240116151728.370238-1-mcanal@igalia.com>

On Tue, Jan 16, 2024 at 12:06:03PM -0300, Maíra Canal wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
[...]
> v5 -> v6: https://lore.kernel.org/rust-for-linux/20231201195300.1329092-1-mcanal@igalia.com/T/
> 
> - Update constants to the new format (RUST_CONST_HELPER)
> - Add invariant for `self.0` being a pointer derived from `T::from_foreign` (Benno Lossin)
> - Fix the place of the INVARIANT comments (Benno Lossin)
> - Use the Pin-Init API (Benno Lossin)
> - Remove PhantomPinned from XArray (Benno Lossin)
> - Add new requirements for calling `xa_unlock()` (Benno Lossin)
> - Improve SAFETY comments (Benno Lossin)
> - Split unsafe block (Benno Lossin)
> - s/alloc_limits_opt/insert_between (Benno Lossin)
> - Specify the target type of the cast (Andreas Hindborg/Trevor Gross)
> - Guarantee that T is 4-byte aligned (Andreas Hindborg)
> - Add code examples in the code (Boqun Feng)

Thanks!

> 
> [1] https://github.com/mairacanal/linux/pull/11
> 
>  rust/bindings/bindings_helper.h |  17 ++
>  rust/helpers.c                  |  37 +++
>  rust/kernel/lib.rs              |   1 +
>  rust/kernel/xarray.rs           | 383 ++++++++++++++++++++++++++++++++
>  4 files changed, 438 insertions(+)
>  create mode 100644 rust/kernel/xarray.rs
> 

[...]

> +
> +/// Wrapper for a value owned by the `XArray` which holds the `XArray` lock until dropped.
> +///

Although the comment here says that `Guard` represents a *locked* slot
in the xarray, but..

> +/// INVARIANT: `Guard` holds a reference (`self.0`) to the underlying value owned by XArray.
> +/// You can use the `into_foreign` method to obtain a pointer to the foreign representation
> +/// of the owned value, which is valid for the lifetime of the Guard.

nothing about the xa lock is mentioned here in the type invariants. I
think it's better to say:

/// INVARIANT: `Guard` holds a reference (`self.0`) to the underlying
/// value owned by the `XArray` (`self.1`) with its lock held...

and then at the Guard::drop..

> +pub struct Guard<'a, T: ForeignOwnable>(NonNull<T>, &'a XArray<T>);
> +
> +impl<'a, T: ForeignOwnable> Guard<'a, T> {
> +    /// Borrow the underlying value wrapped by the `Guard`.
> +    ///
> +    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` type.
> +    pub fn borrow(&self) -> T::Borrowed<'_> {
> +        // SAFETY: The value is owned by the `XArray`, the lifetime it is borrowed for must not
> +        // outlive the `XArray` itself, nor the Guard that holds the lock ensuring the value
> +        // remains in the `XArray`.
> +        //
> +        // By the type invariant of `Guard`, we can guarantee that `Guard` holds this reference
> +        // (`self.0`).
> +        unsafe { T::borrow(self.0.as_ptr().cast()) }
> +    }
> +}
> +
> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
> +// form implements Deref.
> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> +where
> +    T::Borrowed<'a>: Deref,
> +    for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Target>,
> +{
> +    type Target = <T::Borrowed<'a> as Deref>::Target;
> +
> +    fn deref(&self) -> &Self::Target {
> +        self.borrow().into()
> +    }
> +}
> +
> +impl<'a, T: ForeignOwnable> Drop for Guard<'a, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariant, we guarantee that we have a reference
> +        // that owns the C xarray object.

you can (and should) also mention, "by the type invariant, `Guard` is
the owner of the xarray lock, so it's safe to unlock". Justifying the
ownership of lock at unlock point is safety related, since otherwise a
data race may happen.

> +        unsafe { bindings::xa_unlock(self.1.xa.get()) };
> +    }
> +}
> +
> +/// Represents a reserved slot in an `XArray`, which does not yet have a value but has an assigned
> +/// index and may not be allocated by any other user. If the Reservation is dropped without
> +/// being filled, the entry is marked as available again.
> +///
> +/// Users must ensure that reserved slots are not filled by other mechanisms, or otherwise their
> +/// contents may be dropped and replaced (which will print a warning).

I feel like this is a bit weird: instead of dropping and replacing, I
would expect we do nothing if someone steals our unused reservation ;-)
But let's see whether there would be a real user complain ;-)

> +pub struct Reservation<'a, T: ForeignOwnable>(&'a XArray<T>, usize, PhantomData<T>);
> +
> +impl<'a, T: ForeignOwnable> Reservation<'a, T> {
> +    /// Stores a value into the reserved slot.
> +    pub fn store(self, value: T) -> Result<usize> {
> +        if self.0.replace(self.1, value)?.is_some() {
> +            crate::pr_err!("XArray: Reservation stored but the entry already had data!\n");
> +            // Consider it a success anyway, not much we can do
> +        }
> +        let index = self.1;
> +        // The reservation is now fulfilled, so do not run our destructor.
> +        core::mem::forget(self);
> +        Ok(index)
> +    }
> +
> +    /// Returns the index of this reservation.
> +    pub fn index(&self) -> usize {
> +        self.1
> +    }
> +}
> +
> +impl<'a, T: ForeignOwnable> Drop for Reservation<'a, T> {
> +    fn drop(&mut self) {
> +        if self.0.remove(self.1).is_some() {
> +            crate::pr_err!("XArray: Reservation dropped but the entry was not empty!\n");
> +        }
> +    }
> +}
> +
> +/// An array which efficiently maps sparse integer indices to owned objects.
> +///
> +/// This is similar to a `Vec<Option<T>>`, but more efficient when there are holes in the
> +/// index space, and can be efficiently grown.
> +///
> +/// This structure is expected to often be used with an inner type that
> +/// can be efficiently cloned, such as an `Arc<T>`.
> +///
> +/// INVARIANT: All pointers stored in the array are pointers obtained by
> +/// calling `T::into_foreign`.

... or null pointers (considering reserve() cases).

> +#[pin_data(PinnedDrop)]
> +pub struct XArray<T: ForeignOwnable> {
> +    #[pin]
> +    xa: Opaque<bindings::xarray>,
> +    _p: PhantomData<T>,
> +}
> +
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// # use kernel::xarray;
> +/// # use kernel::prelude::*;
> +/// # use kernel::sync::Arc;
> +///
> +/// # struct Foo {
> +/// #     a: u32,
> +/// #     b: u32,
> +/// # }
> +///
> +/// let arr = Box::pin_init(xarray::XArray::<Arc<Foo>>::new(xarray::flags::ALLOC1))
> +///                                                    .expect("Unable to allocate XArray");
> +///
> +/// let foo = Arc::try_new(Foo { a : 1, b: 2 }).expect("Unable to allocate Foo");
> +/// let index = arr.alloc(foo).expect("Error allocating Index");
> +///
> +/// if let Some(guard) = arr.get(index) {
> +///     assert_eq!(guard.borrow().a, 1);
> +///     assert_eq!(guard.borrow().b, 2);
> +/// } else {
> +///     pr_info!("No value found in index {}", index);
> +/// }
> +///
> +/// let foo = Arc::try_new(Foo { a : 3, b: 4 }).expect("Unable to allocate Foo");
> +/// let index = arr.alloc(foo).expect("Error allocating Index");
> +///
> +/// if let Some(removed_data) = arr.remove(index) {
> +///     assert_eq!(removed_data.a, 3);
> +///     assert_eq!(removed_data.b, 4);
> +/// } else {
> +///     pr_info!("No value found in index {}", index);
> +/// }

Again, thanks!

> +/// ```
> +impl<T: ForeignOwnable> XArray<T> {
> +    /// Creates a new `XArray` with the given flags.
> +    pub fn new(flags: Flags) -> impl PinInit<Self> {
> +        pin_init!(Self {
> +            // SAFETY: `xa` is valid while the closure is called.
> +            xa <- Opaque::ffi_init(|xa| unsafe {
> +                bindings::xa_init_flags(xa, flags)
> +            }),
> +            _p: PhantomData,
> +        })
> +    }
> +
> +    /// Replaces an entry with a new value, returning the old value (if any).
> +    pub fn replace(&self, index: usize, value: T) -> Result<Option<T>> {
> +        let new = value.into_foreign();
> +
> +        build_assert!(mem::align_of::<T>() <= 4);

I know Benno suggested this, but this is not quite right ;-) Sorry I
didn't mention this earlier. Here T is a ForeignOwnable type, e.g.
Box<_>, Arc<_>, while they may be 4-byte aligned but the return pointers
of into_foreign() may not. What we need here is that `new` is at least 4
bytes aligned. Yes, this is a boring difference, but it's a difference..

> +
> +        // SAFETY: `new` just came from into_foreign(), and we dismiss this guard if
> +        // the xa_store operation succeeds and takes ownership of the pointer.
> +        let guard = ScopeGuard::new(|| unsafe {
> +            T::from_foreign(new);
> +        });
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant, and we are storing
> +        // a `T::into_foreign()` result which upholds the later invariants.
> +        let old = unsafe {
> +            bindings::xa_store(
> +                self.xa.get(),
> +                index.try_into()?,
> +                new.cast_mut(),
> +                bindings::GFP_KERNEL,
> +            )
> +        };
> +
> +        // SAFETY: `xa_store` returns the old entry at this index on success or
> +        // a XArray result, which can be turn into an errno through `xa_err`.
> +        to_result(unsafe { bindings::xa_err(old) })?;
> +        guard.dismiss();
> +
> +        Ok(if old.is_null() {
> +            None
> +        } else {
> +            // SAFETY: The old value must have been stored by either this function or
> +            // `insert_between`, both of which ensure non-NULL entries are valid
> +            // ForeignOwnable pointers.

Type invariants can be used here other than functions' behaviors.

> +            Some(unsafe { T::from_foreign(old) })
> +        })
> +    }
> +
> +    /// Replaces an entry with a new value, dropping the old value (if any).
> +    pub fn set(&self, index: usize, value: T) -> Result {
> +        self.replace(index, value)?;
> +        Ok(())
> +    }
> +
> +    /// Looks up and returns a reference to an entry in the array, returning a `Guard` if it
> +    /// exists.
> +    ///
> +    /// This guard blocks all other actions on the `XArray`. Callers are expected to drop the
> +    /// `Guard` eagerly to avoid blocking other users, such as by taking a clone of the value.
> +    pub fn get(&self, index: usize) -> Option<Guard<'_, T>> {
> +        // SAFETY: `self.xa` is always valid by the type invariant.

XArray's type invariant only says: "All pointers stored in the array are
pointers obtained by calling `T::into_foreign`" (plus the null pointer
point I mentioned above). So here the type invariant doesn't guarantee
`self.xa` is always valid, I think you will need to extend the type
invariants with "`self.xa` is always an initialized and valid xarray".

> +        unsafe { bindings::xa_lock(self.xa.get()) };
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let guard = ScopeGuard::new(|| unsafe { bindings::xa_unlock(self.xa.get()) });
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        //
> +        // As we are taking advantage of the lock to protect the data structures
> +        // that we are storing in the XArray, we need to call xa_lock() before
> +        // calling xa_load(), which we did.
> +        let p = unsafe { bindings::xa_load(self.xa.get(), index.try_into().ok()?) };
> +
> +        NonNull::new(p as *mut T).map(|p| {
> +            guard.dismiss();
> +            Guard(p, self)
> +        })
> +    }
> +
> +    /// Removes and returns an entry, returning it if it existed.
> +    pub fn remove(&self, index: usize) -> Option<T> {
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let p = unsafe { bindings::xa_erase(self.xa.get(), index.try_into().ok()?) };
> +        if p.is_null() {
> +            None
> +        } else {
> +            // SAFETY: All pointers stored in the array are pointers obtained by
> +            // calling `T::into_foreign`.
> +            Some(unsafe { T::from_foreign(p) })
> +        }


Hmm.. seems we need a:

	pub fn try_from_foreign(...) -> Option<Self>;

to avoid duplicate code. I will add an issue then.

> +    }
> +

[ snip, will take a look at the rest later]

Regards,
Boqun
