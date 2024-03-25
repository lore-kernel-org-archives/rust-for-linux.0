Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390238DFB
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390867; cv=none; b=t5UPoYhojoNuWiJTPoPxHtgcU2e6wcRTl9zYzUy18iMYQlto2BvnKVMneJkbs53Fc02yR+6W1vqX6is3byNlnD+x5JHod9wn7LSUZM4+iadSsO7eFnGSKD0dLaEKT8bC4EjNtDk6pAoe3HYEybBfPlSveMJwvAMGgp+HSBNS5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390867; c=relaxed/simple;
	bh=vysrqB4CIYKS4y3Hq4Slj0odlFI6KFPkozFg66sS63c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2q1XatSvQBDGt3sKN0GGzqYcruJniy2mgTaAbblqpeFU5CG6r5DpfNjIDPzib4Jh0bf+RFMMKw0Ge5FZxv6Ega2SaJrjO9NJjuemoMIh4IRCxpShqXQy5ayOTAeV36Kg29XKRwo9PvYUG0UETSIvhhmHO4tG3/l1JGiHULOMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IQYRE0lh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IQYRE0lh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AA0C433F1;
	Mon, 25 Mar 2024 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390867;
	bh=vysrqB4CIYKS4y3Hq4Slj0odlFI6KFPkozFg66sS63c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQYRE0lh0yhJpKmjoBi5wd/OOaMmH1Q3NIQmlX5ib/YAWPXng8VWbP96uFkOU5CH0
	 5kEUd24iXKjXV5/2tSMKvxRyVl9sRZQUaYtsAP+dF+4CkAtfIEUd+q8tRbhZCqJkzH
	 IIsAf8U1x0UZWQ5UZ5/Ztqyn4NiKwjNBalf2BNYY=
Date: Mon, 25 Mar 2024 19:21:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 8/8] rust: add device::Data
Message-ID: <2024032509-tanned-calamity-4e1c@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-9-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-9-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:12PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> This allows access to registrations and io resources to be automatically
> revoked when devices are removed, even if the ref count to their state
> is non-zero.

So it's re-implementing the devm_*() calls?  Why?

And this will trigger only on remove, but which remove?  The bus remove?
Or the unbinding of the driver to the device (two totally different
things, be specific and very careful here.)

If this is implementing the devm_() calls, why not call them the same
thing?


> 
> Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/kernel/device.rs | 120 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 7309a236f512..707c699c3090 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -4,7 +4,22 @@
>  //!
>  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
>  
> -use crate::{bindings, str::CStr};
> +use macros::pin_data;
> +
> +use crate::{
> +    bindings,
> +    error::Result,
> +    init::InPlaceInit,
> +    init::PinInit,
> +    pin_init,
> +    revocable::{Revocable, RevocableGuard},
> +    str::CStr,
> +    sync::{LockClassKey, RevocableMutex, UniqueArc},
> +};
> +use core::{
> +    ops::{Deref, DerefMut},
> +    pin::Pin,
> +};
>  
>  /// A raw device.
>  ///
> @@ -95,3 +110,106 @@ fn clone(&self) -> Self {
>          Self::from_dev(self)
>      }
>  }
> +
> +/// Device data.
> +///
> +/// When a device is removed (for whatever reason, for example, because the device was unplugged or
> +/// because the user decided to unbind the driver), the driver is given a chance to clean its state
> +/// up, and all io resources should ideally not be used anymore.

Wait, unplugging a device and unbinding a device from a driver are two
totally different things, do NOT get them mixed up or assume that they
are the same thing at all please.  They have different lifetime rules
and different patterns of what happens.

So this needs to be taken out and rewritten from the beginning please.
If the comments describe something that is incorrect, I can't trust that
the code is correct...

thanks,

greg k-h
