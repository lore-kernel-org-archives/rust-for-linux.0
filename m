Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7B18CC15;
	Tue,  7 Jan 2025 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243387; cv=none; b=U8vsZ7hNuK7pHJXHRVE06x2SP6S4FhQ2s7DG9hg7VhrtACsSeG4VsDXHLDYFlQa6OzIhUTR2VmyGZcXgoaFLP4xsYlu/dAmCReXOIGMAmmfwAdkCLM7xV1U1/VuFI3zRJp00DQwNBIH25vuGFqU4P9qBgy54h7kY5nnx0FQgla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243387; c=relaxed/simple;
	bh=xmDQaYTT1TN6r/OwVipytDPZIaOnb6D4e3M87IKM+f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2YwT7JO3NLyy1GTCPXrU9dUacOv04CtfSeZPJctpg4SwZ52MM/4WVnw4q8iC6bdEfmLuA2Dm1I4677EEVz22OCebJT5NEgvYDH7hY8JSB33wCr9pzRvmQ/5/ysYdzJRdkNAhYydRpE6galD8DKlFWnchwMKRdajN1NBTKbUm2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A22hz/Zo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A22hz/Zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA7BC4CED6;
	Tue,  7 Jan 2025 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736243386;
	bh=xmDQaYTT1TN6r/OwVipytDPZIaOnb6D4e3M87IKM+f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A22hz/ZoAo+riYb5Ddll8j+RcI19yVpERIfi7niftxPYgl6Oj07PwsMnZHi5u1tBA
	 rU8i1K0mJj8x98YmOK0u5Ffk6gzLHhd7RjN3g3S1+G7GoDmuxhHBVZNyST2lVNMxBf
	 z0znZQRqbtubnz6ogtYncj4YdJwlsB9REY70Ec5dD0vynfAoMTzBG10Qdmimd+bYXO
	 P7C0hkl7LqjhSA4nVQ/jqcepMYBtn8T613nPS3Ia2LrgXqcuTcWnbH//Vj/8OVPUr2
	 zOgiwgtx8o1Pxl/z3rxYjA+mMne8I7Mdv/qiukaa31J43o6xxzYvMEHsuFUUZeCwig
	 G8ayr7c9zPKEA==
Date: Tue, 7 Jan 2025 10:49:40 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <Z3z4tHzwatjbvz1h@pollux>
References: <20250103164436.96449-1-dakr@kernel.org>
 <20250103164436.96449-2-dakr@kernel.org>
 <Z3wKFTkmjdaGHKIn@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3wKFTkmjdaGHKIn@tardis.local>

On Mon, Jan 06, 2025 at 08:51:33AM -0800, Boqun Feng wrote:
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
> 
> There is a pointer provenance issue here I think. `self` is a immutable
> reference to `DevresInner<..>`, so the pointer derived from it doesn't
> have the provenance for writing nor does it have the provenance for the
> `refcount` field in `ArcInner`. Therefore it cannot be used to
> reconstruct an `Arc`.
> 
> We probably want to make `remove_action()` take an
> `&Arc<DevresInner<T>>`. Or am I missing something subtle?

Indeed, good catch!

> 
> Regards,
> Boqun
> 
> > +
> > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > +        //
> > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > +        unsafe { self.data.revoke_nosync() };
> > +    }
> > +
> >      #[allow(clippy::missing_safety_doc)]
> >      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
> >          let ptr = ptr as *mut DevresInner<T>;
> > @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
> >  
> >  impl<T> Drop for Devres<T> {
> >      fn drop(&mut self) {
> > -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> > -        //
> > -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> > -        // necessary since we don't know when `Devres` is dropped and calling
> > -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> > -        //
> > -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > -        // anymore, hence it is safe not to wait for the grace period to finish.
> > -        unsafe { self.revoke_nosync() };
> > +        self.0.remove_action();
> >      }
> >  }
> > -- 
> > 2.47.1
> > 
