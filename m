Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763753DAC19
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390669; cv=none; b=myTeWNMYy2XiYaPWOHWDImhJ/eWtqAWbBtDr6io67Zcn7vmKdubUXbDdskJd6rLtmHfntxTQjizWTFuvaJ8VGM6m9V/f877doimtniROVbNcL9kAsdwbYrmI/LcK4E0x616SK25GCVNDThWgiJ/KKH7M6v9h2NdY2xsLA9N+Heo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390669; c=relaxed/simple;
	bh=Rfz0rUg0/DBlNV8+KCm2H639pKrerekiO9oMebSNsM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2wgBpz0ns2fjQs8zl64jaXuumAb0FCi9fc3Q6E8ZhUJ6YTwrnUxvb8ZSGbWxomr7qM/VD0jDiROe1AO01Y6DKHjq13knfPwQtaPId8MY0L32xiZmqg0vV3cHDiSzPYqajIK3AnhRDkzPlyF8Ld2K/kA4aNRBkSlPdGhozQBun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q2OnyZik; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q2OnyZik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568BFC433F1;
	Mon, 25 Mar 2024 18:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390668;
	bh=Rfz0rUg0/DBlNV8+KCm2H639pKrerekiO9oMebSNsM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2OnyZikx7PtJQxLfvOd7Z3rF4jEkhkK66AsS8nbcGyv23bmGz0JrDH/QrKRaFByG
	 iwqUoZ+7h+jxXBEFZVNXIlMmQFFdSPk1UCqnzzC1qTyhlHrrtu4ABueN99PcmP6G0f
	 3iV1d/1ofBGQK70NOWNqnTc5JM34OkiO/scS6zEo=
Date: Mon, 25 Mar 2024 19:17:46 +0100
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
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <2024032518-swampland-chaperone-317b@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-4-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> Add a Device type which represents an owned reference to a generic
> struct device. This minimal implementation just handles reference
> counting and allows the user to get the device name.
> 
> Also, implement the rust_helper_dev_get_drvdata helper.
> 
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/helpers.c        | 13 ++++++++
>  rust/kernel/device.rs | 76 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 70e59efd92bc..1e40661a33d1 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -23,6 +23,7 @@
>  #include <kunit/test-bug.h>
>  #include <linux/bug.h>
>  #include <linux/build_bug.h>
> +#include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/errname.h>
>  #include <linux/mutex.h>
> @@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
>  
> +void *rust_helper_dev_get_drvdata(struct device *dev)
> +{
> +	return dev_get_drvdata(dev);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> +
> +const char *rust_helper_dev_name(const struct device *dev)
> +{
> +	return dev_name(dev);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_dev_name);
> +
>  /*
>   * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
>   * use it in contexts where Rust expects a `usize` like slice (array) indices.
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 9be021e393ca..7309a236f512 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -4,7 +4,7 @@
>  //!
>  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
>  
> -use crate::bindings;
> +use crate::{bindings, str::CStr};
>  
>  /// A raw device.
>  ///
> @@ -20,4 +20,78 @@
>  pub unsafe trait RawDevice {
>      /// Returns the raw `struct device` related to `self`.
>      fn raw_device(&self) -> *mut bindings::device;
> +
> +    /// Returns the name of the device.
> +    fn name(&self) -> &CStr {
> +        let ptr = self.raw_device();
> +
> +        // SAFETY: `ptr` is valid because `self` keeps it alive.

How can self keep it alive?

> +        let name = unsafe { bindings::dev_name(ptr) };
> +
> +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> +        // by the compiler because of their lifetimes).

devices are renamed all the time, I don't understand how this can be
true here.


> +        unsafe { CStr::from_char_ptr(name) }
> +    }
> +}
> +
> +/// A ref-counted device.
> +///
> +/// # Invariants
> +///
> +/// `ptr` is valid, non-null, and has a non-zero reference count. One of the references is owned by
> +/// `self`, and will be decremented when `self` is dropped.
> +pub struct Device {
> +    pub(crate) ptr: *mut bindings::device,
> +}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
> +unsafe impl Send for Device {}

It's safe if you have a reference count on the pointer.  Do you have
that?

> +
> +// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
> +// from any thread.
> +unsafe impl Sync for Device {}

Same as above.


> +
> +impl Device {
> +    /// Creates a new device instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.

device pointers are NULL all the time, you better be able to handle this
otherwise it's not going to go well :(

> +    pub unsafe fn new(ptr: *mut bindings::device) -> Self {
> +        // SAFETY: By the safety requirements, ptr is valid and its refcounted will be incremented.
> +        unsafe { bindings::get_device(ptr) };
> +        // INVARIANT: The safety requirements satisfy all but one invariant, which is that `self`
> +        // owns a reference. This is satisfied by the call to `get_device` above.
> +        Self { ptr }
> +    }
> +
> +    /// Creates a new device instance from an existing [`RawDevice`] instance.
> +    pub fn from_dev(dev: &dyn RawDevice) -> Self {
> +        // SAFETY: The requirements are satisfied by the existence of `RawDevice` and its safety
> +        // requirements.
> +        unsafe { Self::new(dev.raw_device()) }
> +    }
> +}
> +
> +// SAFETY: The device returned by `raw_device` is the one for which we hold a reference.
> +unsafe impl RawDevice for Device {
> +    fn raw_device(&self) -> *mut bindings::device {
> +        self.ptr
> +    }
> +}
> +
> +impl Drop for Device {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
> +        // relinquish it now.
> +        unsafe { bindings::put_device(self.ptr) };
> +    }
> +}
> +
> +impl Clone for Device {
> +    fn clone(&self) -> Self {
> +        Self::from_dev(self)

Does this increment the reference count?

thanks,

greg k-h
