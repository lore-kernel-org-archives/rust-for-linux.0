Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC5B2E62D
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711391432; cv=none; b=E/qh1Lf0bM/nDxsYC9yhg9OUGyJFMY/fxnJ7yCALqSepGHRE2lkSzycE4FdL06Tjt3Y8jQaJB/pz2EhQ45b8oOiFhiWhhEjJ7ivqX6D1q/bUP71R5mAOEGdQaQPHSWlezV3jMGDyyWEmZkbbpcmkTfNLYOFeHX5qj5e/YvAmHuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711391432; c=relaxed/simple;
	bh=aDbaQtsScAVdvhtlkqgqgMEeAE0Zpl3bypLBjnMKlTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuVX/I+sRIxz+qCCyQ3W2kixMIpXoDEWMeZxr1LkIzW0dnILvO+8msrRVhf+9TLJFnz+hxOhGw136XzfkJxwZ+aua2h2dFHbSDNaTrtGCYTaL7cvud7e6L6dqdVc6eg4tjZb1slylNXdJby0gjGNtqJgkXazZkY+CNxtYLn22QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oZAoRuK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oZAoRuK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31EFC433C7;
	Mon, 25 Mar 2024 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711391430;
	bh=aDbaQtsScAVdvhtlkqgqgMEeAE0Zpl3bypLBjnMKlTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZAoRuK7aGKZJZZ9HS/0T9yYYEAxbgJi/N4ZWAN/OcnudEMt/TSie+DUbzBfCeRET
	 pzKpHilF9DwzswQIaJT2Rli82yGx12AH4FmkO8MRYFCo8SzVWhMD38qphWtlNDLyE2
	 4W63ZoJY3WDCqocUUkUeqtrWgHepDJk7jB7JQusU=
Date: Mon, 25 Mar 2024 19:30:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
Message-ID: <2024032530-fester-dedicator-a8a9@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-5-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-5-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:08PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> This defines general functionality related to registering drivers with
> their respective subsystems, and registering modules that implement
> drivers.

drivers are independent from modules, and modules can contain multiple
drivers (and a single driver can be in multiple modules) so why is
anything being tied together here?

> Originally, RawDeviceId was implemented as a const trait. However, this
> unstable feature is broken/gone in 1.73. To work around this without
> breaking the API, turn IdArray::new() into a macro so that it can use
> concrete types (which can still have const associated functions) instead
> of a trait.

Again, confused by this.

> 
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/kernel/driver.rs        | 493 +++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs           |   4 +-
>  rust/macros/module.rs        |   2 +-
>  samples/rust/rust_minimal.rs |   2 +-
>  samples/rust/rust_print.rs   |   2 +-
>  5 files changed, 499 insertions(+), 4 deletions(-)
>  create mode 100644 rust/kernel/driver.rs
> 
> diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> new file mode 100644
> index 000000000000..6cba3b750be2
> --- /dev/null
> +++ b/rust/kernel/driver.rs
> @@ -0,0 +1,493 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic support for drivers of different buses (e.g., PCI, Platform, Amba, etc.).
> +//!
> +//! Each bus/subsystem is expected to implement [`DriverOps`], which allows drivers to register
> +//! using the [`Registration`] class.
> +
> +use crate::{error::code::*, error::Result, str::CStr, sync::Arc, ThisModule};
> +use alloc::boxed::Box;
> +use core::{cell::UnsafeCell, marker::PhantomData, ops::Deref, pin::Pin};
> +
> +/// A subsystem (e.g., PCI, Platform, Amba, etc.) that allows drivers to be written for it.
> +pub trait DriverOps {
> +    /// The type that holds information about the registration. This is typically a struct defined
> +    /// by the C portion of the kernel.
> +    type RegType: Default;
> +
> +    /// Registers a driver.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `reg` must point to valid, initialised, and writable memory. It may be modified by this
> +    /// function to hold registration state.
> +    ///
> +    /// On success, `reg` must remain pinned and valid until the matching call to
> +    /// [`DriverOps::unregister`].
> +    unsafe fn register(
> +        reg: *mut Self::RegType,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result;
> +
> +    /// Unregisters a driver previously registered with [`DriverOps::register`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// `reg` must point to valid writable memory, initialised by a previous successful call to
> +    /// [`DriverOps::register`].
> +    unsafe fn unregister(reg: *mut Self::RegType);
> +}
> +
> +/// The registration of a driver.
> +pub struct Registration<T: DriverOps> {
> +    is_registered: bool,

This should never be needed, if it is needed, something went wrong.  If
it is needed, why do no .c drivers need it?

> +    concrete_reg: UnsafeCell<T::RegType>,
> +}
> +
> +// SAFETY: `Registration` has no fields or methods accessible via `&Registration`, so it is safe to
> +// share references to it with multiple threads as nothing can be done.
> +unsafe impl<T: DriverOps> Sync for Registration<T> {}
> +
> +impl<T: DriverOps> Registration<T> {
> +    /// Creates a new instance of the registration object.
> +    pub fn new() -> Self {
> +        Self {
> +            is_registered: false,

Again, not needed, who would care?  Who is going to attempt to register
a driver multiple times?  And what's wrong if that were to happen?
Doesn't the driver core of the kernel already catch this properly so why
implement it in rust code only?


> +            concrete_reg: UnsafeCell::new(T::RegType::default()),
> +        }
> +    }
> +
> +    /// Allocates a pinned registration object and registers it.
> +    ///
> +    /// Returns a pinned heap-allocated representation of the registration.
> +    pub fn new_pinned(name: &'static CStr, module: &'static ThisModule) -> Result<Pin<Box<Self>>> {
> +        let mut reg = Pin::from(Box::try_new(Self::new())?);
> +        reg.as_mut().register(name, module)?;

Again, modules are not tied to drivers, please don't do that if at all
possible.  You can pass in the module reference to the driver core, but
that should be all that is needed, right?


> +        Ok(reg)
> +    }
> +
> +    /// Registers a driver with its subsystem.
> +    ///
> +    /// It must be pinned because the memory block that represents the registration is potentially
> +    /// self-referential.
> +    pub fn register(
> +        self: Pin<&mut Self>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        // SAFETY: We never move out of `this`.
> +        let this = unsafe { self.get_unchecked_mut() };
> +        if this.is_registered {
> +            // Already registered.
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: `concrete_reg` was initialised via its default constructor. It is only freed
> +        // after `Self::drop` is called, which first calls `T::unregister`.
> +        unsafe { T::register(this.concrete_reg.get(), name, module) }?;
> +
> +        this.is_registered = true;
> +        Ok(())
> +    }
> +}
> +
> +impl<T: DriverOps> Default for Registration<T> {
> +    fn default() -> Self {
> +        Self::new()
> +    }
> +}
> +
> +impl<T: DriverOps> Drop for Registration<T> {
> +    fn drop(&mut self) {
> +        if self.is_registered {
> +            // SAFETY: This path only runs if a previous call to `T::register` completed
> +            // successfully.
> +            unsafe { T::unregister(self.concrete_reg.get()) };
> +        }
> +    }
> +}
> +
> +/// Conversion from a device id to a raw device id.
> +///
> +/// This is meant to be implemented by buses/subsystems so that they can use [`IdTable`] to
> +/// guarantee (at compile-time) zero-termination of device id tables provided by drivers.
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +///   - [`RawDeviceId::ZERO`] is actually a zeroed-out version of the raw device id.
> +///   - [`RawDeviceId::to_rawid`] stores `offset` in the context/data field of the raw device id so
> +///     that buses can recover the pointer to the data.
> +pub unsafe trait RawDeviceId {
> +    /// The raw type that holds the device id.
> +    ///
> +    /// Id tables created from [`Self`] are going to hold this type in its zero-terminated array.
> +    type RawType: Copy;
> +
> +    /// A zeroed-out representation of the raw device id.
> +    ///
> +    /// Id tables created from [`Self`] use [`Self::ZERO`] as the sentinel to indicate the end of
> +    /// the table.
> +    const ZERO: Self::RawType;

Don't we already have something like this as the PHY drivers needed it,
right?  Why create it again?


> +}
> +
> +/// A zero-terminated device id array, followed by context data.
> +#[repr(C)]
> +pub struct IdArray<T: RawDeviceId, U, const N: usize> {
> +    ids: [T::RawType; N],
> +    sentinel: T::RawType,
> +    id_infos: [Option<U>; N],
> +}
> +
> +impl<T: RawDeviceId, U, const N: usize> IdArray<T, U, N> {
> +    const U_NONE: Option<U> = None;
> +
> +    /// Returns an `IdTable` backed by `self`.
> +    ///
> +    /// This is used to essentially erase the array size.
> +    pub const fn as_table(&self) -> IdTable<'_, T, U> {
> +        IdTable {
> +            first: &self.ids[0],
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Returns the number of items in the ID table.
> +    pub const fn count(&self) -> usize {
> +        self.ids.len()

Why do you need to ever know the number of ids?

> +    }
> +
> +    /// Returns the inner IdArray array, without the context data.
> +    // pub const fn as_ids(&self) -> IdArrayIds<T, N>
> +    // where
> +    //     T: RawDeviceId + Copy,
> +    // {
> +    //     self.ids
> +    // }
> +
> +    /// Creates a new instance of the array.

Why would you create a new list of ids?  These should be static in
read-only memory and never copied or modified at any time.  Why the
special class for them?

> +    ///
> +    /// The contents are derived from the given identifiers and context information.
> +    #[doc(hidden)]
> +    pub const unsafe fn new(raw_ids: [T::RawType; N], infos: [Option<U>; N]) -> Self
> +    where
> +        T: RawDeviceId + Copy,
> +        T::RawType: Copy + Clone,
> +    {
> +        Self {
> +            ids: raw_ids,
> +            sentinel: T::ZERO,
> +            id_infos: infos,
> +        }
> +    }
> +
> +    #[doc(hidden)]
> +    pub const fn get_offset(idx: usize) -> isize
> +    where
> +        T: RawDeviceId + Copy,
> +        T::RawType: Copy + Clone,
> +    {
> +        // SAFETY: We are only using this dummy value to get offsets.
> +        let array = unsafe { Self::new([T::ZERO; N], [Self::U_NONE; N]) };
> +        // SAFETY: Both pointers are within `array` (or one byte beyond), consequently they are
> +        // derived from the same allocated object. We are using a `u8` pointer, whose size 1,
> +        // so the pointers are necessarily 1-byte aligned.

Why do you need offsets?

confused as to what this is all for, don't you have a simple way to read
a C structure array?  You'll have to emulate that in rust drivers to get
the auto-module-loading logic to work properly.

But again, I thought the phy code already does all of this, why
implement it again (and if it is needed, why isn't the phy code being
moved to this new implementation.)

I stopped here.  Please build on existing code in the kernel, and also,
a real user of these structures is needed to see if/how any of this
actually works.  Why not implement something that uses them that we can
actually review?

thanks,

greg k-h
