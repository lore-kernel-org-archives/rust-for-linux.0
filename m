Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6961FF2;
	Sat,  4 Jan 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735981094; cv=none; b=l/J/unuW4jfC03+nWVJOzZl+Q0Zdp5teTEXmG7vS1kOnORSrxRN6Meo2/LwAYZLfmzKmoEQ1yucuwQ23KhFHYeHpiFBpBPSZYjrgd8ZFTgJjX3gy58WED9kJoRkj3ae7ieSCYRyDf4SnSo4BAQ06RMI8s7nswVnPQiGQSZ1kvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735981094; c=relaxed/simple;
	bh=+6380HLPSCA0ykiIAfqeN9SC3Jp15FluF947rZE66yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWspKmlRs9qw4D6nUTGeoHC2gHxv8BVPuUxA8+BSl54C36xE29ds+MzH4IzwNYNzecuanviRuhOtR/j/f4eO1c32/3vh8jUh05u4BTi6r7TrUjnCMJB/uMUoKheNwWjwEjybaEx/4LwWtjLqxNHLvkVCTVHFSXZCgOoTgHopZL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z/lcT/bc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z/lcT/bc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50B8C4CED1;
	Sat,  4 Jan 2025 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735981094;
	bh=+6380HLPSCA0ykiIAfqeN9SC3Jp15FluF947rZE66yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z/lcT/bcbLffwqpoVtzJHy74Y00sgb0KQ/kLDa+seyy/6/p4wj90Rn+Hv5ofygJg4
	 lU+yz2o0uL6EKNafr+Ks13M5DzObBP5i/xlnBKCNgJkkS52FmFtCGcVXr3YOeOSz2X
	 XyK8X8jg6jyVJ7bWTAV5IiynKcG1F7V4TIhWGeYo=
Date: Sat, 4 Jan 2025 09:57:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <2025010413-fountain-reflux-f6b0@gregkh>
References: <20250103164436.96449-1-dakr@kernel.org>
 <20250103164436.96449-2-dakr@kernel.org>
 <Z3gXPT1HFBYpAiGz@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3gXPT1HFBYpAiGz@cassiopeiae>

On Fri, Jan 03, 2025 at 05:58:37PM +0100, Danilo Krummrich wrote:
> On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> > So far `DevresInner` is kept alive, even if `Devres` is dropped until
> > the devres callback is executed to avoid a WARN() when the action has
> > been released already.
> > 
> > With the introduction of devm_remove_action_nowarn() we can remove the
> > action in `Devres::drop`, handle the case where the action has been
> > released already and hence also free `DevresInner`.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
> >  1 file changed, 44 insertions(+), 12 deletions(-)
> > 
> > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > index 9c9dd39584eb..7d3daac92109 100644
> > --- a/rust/kernel/devres.rs
> > +++ b/rust/kernel/devres.rs
> > @@ -10,15 +10,19 @@
> >      bindings,
> >      device::Device,
> >      error::{Error, Result},
> > +    ffi::c_void,
> >      prelude::*,
> >      revocable::Revocable,
> >      sync::Arc,
> > +    types::ARef,
> >  };
> >  
> >  use core::ops::Deref;
> >  
> >  #[pin_data]
> >  struct DevresInner<T> {
> > +    dev: ARef<Device>,
> > +    callback: unsafe extern "C" fn(*mut c_void),
> >      #[pin]
> >      data: Revocable<T>,
> >  }
> > @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
> >      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> >          let inner = Arc::pin_init(
> >              pin_init!( DevresInner {
> > +                dev: dev.into(),
> > +                callback: Self::devres_callback,
> >                  data <- Revocable::new(data),
> >              }),
> >              flags,
> > @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> >  
> >          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
> >          // detached.
> > -        let ret = unsafe {
> > -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> > -        };
> > +        let ret =
> > +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
> >  
> >          if ret != 0 {
> >              // SAFETY: We just created another reference to `inner` in order to pass it to
> > @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> >          Ok(inner)
> >      }
> >  
> > +    fn as_ptr(&self) -> *const Self {
> > +        self as _
> > +    }
> > +
> > +    fn remove_action(&self) {
> > +        // SAFETY:
> > +        // - `self.inner.dev` is a valid `Device`,
> > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > +        //   previously,
> > +        // - `self` is always valid, even if the action has been released already.
> > +        let ret = unsafe {
> > +            bindings::devm_remove_action_nowarn(
> > +                self.dev.as_raw(),
> > +                Some(self.callback),
> > +                self.as_ptr() as _,
> > +            )
> > +        };
> > +
> > +        if ret != 0 {
> > +            // The devres action has been released already - nothing to do.
> > +            return;
> > +        }
> > +
> > +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> > +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> > +        // this reference.
> > +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
> > +
> > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > +        //
> > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > +        unsafe { self.data.revoke_nosync() };
> 
> With this patch, this shouldn't be needed any longer -- forgot to remove it.

Ok, I'll drop this series and wait for v2.

thanks,

greg k-h
