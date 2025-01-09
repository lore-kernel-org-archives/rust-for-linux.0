Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AF221D96
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440004; cv=none; b=nMyINpg4syjqF+PoYY9P7UtF+DsJEH7EddTVo5XUoNZvV31NjsAPSJ342KppdS71zkxEpL2CI1TF5dN/8HSsLsy4L6FuABIFInaImVo6YnniwE9jxkirSfO16q+1bb+RUgPKZSpg/FbjKM5NfiUssJYjTr7+t9Zs7u/JX71U7RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440004; c=relaxed/simple;
	bh=Gmdb5XBj1OcvOEn//+9+BVcJXLZ7RN9neHCWD1jFLA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwClWokngqYh/s9/+wLQNg523TpHiuYq3rjahUFgBCOaM/b1cVqEM8cNkkwLPS5fYfynuxIJ9qF1kM/RMR0Sqm+ytNly429+FnA/9f3g/V3768wgQ1r72uTxm1rbaV6Cu2GCbrjm1IlUd9DN9jtIr3epHoYxz3GQlv1s1gfmgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hCYjRJOe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hCYjRJOe"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so760451f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 08:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736440000; x=1737044800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TjglzA56HDr/yaOVTln0vT2dJpdHmICmUV3OhZ+6zs=;
        b=hCYjRJOecnOlrE0aaS8taIVr6x4v+FkSny2MtrqgSuwZn3iBblm9qRnq1UAW0AUnj3
         E27S50iWsOocOvpiSEpAz4mNCa7qiGZDzVsEcctmAu1C/jmwvdaB9iwfDdK/IFenJqft
         HtClgxIcIa668h0BKMuFEGQ4kbPaIYSGKXKIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736440000; x=1737044800;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TjglzA56HDr/yaOVTln0vT2dJpdHmICmUV3OhZ+6zs=;
        b=M8RVjRug7bIp7NpkfvTtXrmpuKoCEX8e5DaCfZY/QG6oMb34caK34QVhXkjM1uQfFU
         nUpuXDqshbhZllpSD6+kkAgUXUz8KXalDv7lWCecIc5K3KwIclIoIk8zVoB8cV+xqUh6
         omlH7zXrzyOQ/nfQnaV5dF6gms9/cQdXaAGc1HdLUJOR/oTmh/B1Hw2upBN25bEnFlFq
         JC9Yt/7aBwjP58znDJMl1wocqfroWGBQW0VliVPe/++VP7EsAtr1bDIqfMFUkSm1TVzt
         3Qo98zRvzzx7F3iV5z5IVROUZ0vULYQcasJLSw1OWwYXpJU2242HhHJw0rnd81g/YqBf
         CoAw==
X-Forwarded-Encrypted: i=1; AJvYcCWVlTrfdEDQhsdITm4DHlMpJnqht6I7SCM3D6JtG4Qq8RENh9mBjY8ErQgLXkfTv4OoJPC0OJSqphJMnigtyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXBZAa9349LwExRgHzqQBPjswKyaf2OCOtePpYwkOs7Wv8Kxu
	Z/AtXYvlFrV6xuF2X2v/2kZeHokJAVGaobe+PDDXbm+vGuk526c15FPGMRF75d0=
X-Gm-Gg: ASbGncs6FltZldFKPPoH2dbyxPwhH3H2WSGUmurBw0KnhTFx4w7Hxb+bQv9nCquOZ09
	FnW0BVUxKKNLlUeYAhVOgV2/wZJt1yZAQVmSMTRFlybo5yfYFY9dHPHI7EZqb3kOYhHAAQqCZNM
	EHeHAVAD1mkOhlXQB/7tnrnj4Nu+CuBPk3aWjiIrBMJc/5nbR0udej1D3165+gVguyFEUJxbJBm
	BRK+AJZHBuJOLgkBcGKLHheEGRNmzBo9+7yjuai6KPTsrBjrxMj5ruj9zw7o5LhPNAp
X-Google-Smtp-Source: AGHT+IEIYvU/dkOQCn4ZIc7/Zt0uWzRi+twnLYSpL+iXeMJAG0i7Cn460Oz0K3gjRyZBXtJUprIiUw==
X-Received: by 2002:a5d:5986:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-38a8733a214mr6795091f8f.52.1736440000232;
        Thu, 09 Jan 2025 08:26:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383654sm2251859f8f.30.2025.01.09.08.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:26:39 -0800 (PST)
Date: Thu, 9 Jan 2025 17:26:37 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <Z3_4vQPiZGRZ5F7X@phenom.ffwll.local>
Mail-Followup-To: Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250103164436.96449-1-dakr@kernel.org>
 <20250103164436.96449-2-dakr@kernel.org>
 <Z3wKFTkmjdaGHKIn@tardis.local>
 <Z3z4tHzwatjbvz1h@pollux>
 <Z36DU2Rf1O6cJbzG@phenom.ffwll.local>
 <Z3-b7hry7PdB31Br@phenom.ffwll.local>
 <Z3_pTK4_CsvpF8cX@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3_pTK4_CsvpF8cX@boqun-archlinux>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Thu, Jan 09, 2025 at 07:20:44AM -0800, Boqun Feng wrote:
> On Thu, Jan 09, 2025 at 10:50:38AM +0100, Simona Vetter wrote:
> > On Wed, Jan 08, 2025 at 02:53:23PM +0100, Simona Vetter wrote:
> > > On Tue, Jan 07, 2025 at 10:49:40AM +0100, Danilo Krummrich wrote:
> > > > On Mon, Jan 06, 2025 at 08:51:33AM -0800, Boqun Feng wrote:
> > > > > On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> > > > > > So far `DevresInner` is kept alive, even if `Devres` is dropped until
> > > > > > the devres callback is executed to avoid a WARN() when the action has
> > > > > > been released already.
> > > > > > 
> > > > > > With the introduction of devm_remove_action_nowarn() we can remove the
> > > > > > action in `Devres::drop`, handle the case where the action has been
> > > > > > released already and hence also free `DevresInner`.
> > > > > > 
> > > > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > > > ---
> > > > > >  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
> > > > > >  1 file changed, 44 insertions(+), 12 deletions(-)
> > > > > > 
> > > > > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > > > > index 9c9dd39584eb..7d3daac92109 100644
> > > > > > --- a/rust/kernel/devres.rs
> > > > > > +++ b/rust/kernel/devres.rs
> > > > > > @@ -10,15 +10,19 @@
> > > > > >      bindings,
> > > > > >      device::Device,
> > > > > >      error::{Error, Result},
> > > > > > +    ffi::c_void,
> > > > > >      prelude::*,
> > > > > >      revocable::Revocable,
> > > > > >      sync::Arc,
> > > > > > +    types::ARef,
> > > > > >  };
> > > > > >  
> > > > > >  use core::ops::Deref;
> > > > > >  
> > > > > >  #[pin_data]
> > > > > >  struct DevresInner<T> {
> > > > > > +    dev: ARef<Device>,
> > > > > > +    callback: unsafe extern "C" fn(*mut c_void),
> > > > > >      #[pin]
> > > > > >      data: Revocable<T>,
> > > > > >  }
> > > > > > @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
> > > > > >      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > > > >          let inner = Arc::pin_init(
> > > > > >              pin_init!( DevresInner {
> > > > > > +                dev: dev.into(),
> > > > > > +                callback: Self::devres_callback,
> > > > > >                  data <- Revocable::new(data),
> > > > > >              }),
> > > > > >              flags,
> > > > > > @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > > > >  
> > > > > >          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
> > > > > >          // detached.
> > > > > > -        let ret = unsafe {
> > > > > > -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> > > > > > -        };
> > > > > > +        let ret =
> > > > > > +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
> > > > > >  
> > > > > >          if ret != 0 {
> > > > > >              // SAFETY: We just created another reference to `inner` in order to pass it to
> > > > > > @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > > > >          Ok(inner)
> > > > > >      }
> > > > > >  
> > > > > > +    fn as_ptr(&self) -> *const Self {
> > > > > > +        self as _
> > > > > > +    }
> > > > > > +
> > > > > > +    fn remove_action(&self) {
> > > > > > +        // SAFETY:
> > > > > > +        // - `self.inner.dev` is a valid `Device`,
> > > > > > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > > > > > +        //   previously,
> > > > > > +        // - `self` is always valid, even if the action has been released already.
> > > > > > +        let ret = unsafe {
> > > > > > +            bindings::devm_remove_action_nowarn(
> > > > > > +                self.dev.as_raw(),
> > > > > > +                Some(self.callback),
> > > > > > +                self.as_ptr() as _,
> > > > > > +            )
> > > > > > +        };
> > > > > > +
> > > > > > +        if ret != 0 {
> > > > > > +            // The devres action has been released already - nothing to do.
> > > > > > +            return;
> > > > > > +        }
> > > > > > +
> > > > > > +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> > > > > > +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> > > > > > +        // this reference.
> > > > > > +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
> > > > > 
> > > > > There is a pointer provenance issue here I think. `self` is a immutable
> > > > > reference to `DevresInner<..>`, so the pointer derived from it doesn't
> > > > > have the provenance for writing nor does it have the provenance for the
> > > > > `refcount` field in `ArcInner`. Therefore it cannot be used to
> > > > > reconstruct an `Arc`.
> > > > > 
> > > > > We probably want to make `remove_action()` take an
> > > > > `&Arc<DevresInner<T>>`. Or am I missing something subtle?
> > > > 
> > > > Indeed, good catch!
> > > 
> > > Just for my own learning I've tried to understand why there's an issue
> > > here, but no in DevresInner.devres_callback. In both cases we take the
> 
> I also learned this in a hard way ;-) let me try to explain my
> understanding.
> 
> First the difference between here and `DevresInner::devres_callback()`
> is "how the pointer was derived" or "where did the pointer come from".
> 
> * In `DevresInner::devres_callback()` case, it uses a pointer value
>   directly, and that value came from a previous `Arc::into_raw()` which
>   uses the pointer directly with an offset (note that offsetting doesn't
>   change the pointer provenance), so that pointer has the same
>   provenance as an `Arc`.
> 
> * In here, what we did was getting a pointer to `DevresInner` from a
>   `&DevresInner` and that pointer doesn't have the provenane to the
>   whole `ArcInner<DervesInner>`, nor does it have the write permission
>   because it comes from an immutable reference.

Yeah I think I got that part of understanding provenance, it's essentially
all the things the compiler keeps track of for optimization passes.

> > > exact same bag of bits and convert it into an Arc, relying on the C side
> > > guaranteeing to us that we exclusively own whatever object that bag of
> > > bits points to when converted into a real reference.
> > > 
> > > I don't think we rely on the provance of self here at all, because we just
> > > pass that bag of bits to devm_remove_action_nowarn as a magic lookup key,
> > > and in the ret == 0 case the C side guarantee is that we own the resulting
> > > object if we convert it into one using Arc::from_raw.
> > > 
> 
> Other than `Arc::from_raw()` there is another side in this picture: the
> one that provides the immutable reference, so if you do:
> 
>     let p: &Arc<T> = ...; // say you have an `Arc<T>` reference.
>     let o = p.deref();    // you got a reference to the internal object.
> 
>     let ptr = o as *const T;
>     let new_arc = Arc::from_raw(ptr); // use the pointer of `o` to
>                                       // construct a new Arc. Even if
> 				      // there is a spare refcount some
> 				      // where due to a Arc::into_raw()
> 				      // previously.
>     do_something(new_arc);
> 
>     use(p); // here the compiler is within its right to assume if there
>             // is no other access the underlying `Arc<T>`, the refcount
> 	    // should be unchanged (more precisely, the whole `ArcInner`
> 	    // should be unchanged).
> 
> And by voliating pointer provenance, the assumption is broken and there
> is no way to tell compiler about that (at least in the current
> operational semantics of Rust IIUC). Intuitively, `o` only has the
> permission to read the object, so we cannot use it for construct an
> `Arc`.
> 
> This to me is how pointer provenance actually works: it's a model that
> describes how compilers can make assumptions so that programmers and
> compilers have the same picture about whether there could be an
> optimization based on an assumption.
> 
> Does this make sense to you?

Yes I think so, but your example above has the crucial issue that we've
picked the wrong raw pointer to pass to from_raw, because it's one that we
didn't get back from into_raw. So with my understanding of this all from
that pov, the from_raw in v1 of this patch is broken.

The issue is that the fix still doesn't get things right, because while we
supply a pointer with enough provenance to hopefully prevent the compiler
from doing bad things, it's still not the pointer we've received from
into_raw.  They happen to bit bit identical ofc, but the entire provenance
thing is about all the stuff besides the raw pointer value.

There's two cases for how I think the provenance is passed on:

Arc::into_raw -> devm_add_action -> devm_callback -> Arc::from_raw

This one is correct, because we pass the right raw pointer into
Arc::from_raw.

Arc::into_raw -> devm_add_action -> (in remove_actio)
devm_remove_action_nowarn -> Arc::from_raw

Now the thing to note is that devm_remove_action_nowarn does not return a
void * with the data we need to clean up, because the void * data happens
to bit-vise identical to the lookup key we pass in. But what it does
return is the provenance of the bitwise identical pointer that was passed
into devm_add_action, and that provenance is the right one because it's
the pointer we got from Arc::into_raw. On the other hand the lookup key
does not have the right provenance, because we did not get that one from
into_raw.

I think there's a few options here:

- we hope the compiler isn't smart enough

- we pass some provenance that should allow us to do all the right access
  as a stand-in, and hope the compiler isn't smart enough. This only works
  if we have a suitable reference we can pass down the call chain to where
  we need it (like is done in v2), and I don't think this is possible in
  all cases.

  I can think of two examples where this might happen:
  - We only get an immutable reference, and the C ffi call is what gives
    us the provenance/proof for write access.
  - We only have a pointer to an inner type (probably gotten from C ffi),
    and the C ffi call does a runtime upcast and so supplies the proof
    that our reference is part of something much bigger.
  Neither of these make sense with pure rust code, but I do think it's
  stuff that can pop up when interfacing kernel C functions.

- we add a fake void * out parameter to the ffi wrapper so that we can
  pretend to get the provenance back from the C side (it's just a copy of
  the lookup key we passed in when ignoring the non-value parts of a
  pointer). Maybe could even do that properly with the new strict
  provenance extensions that rust has, so that it's a true phantom
  value.

- we have a much more magic replacement for into_raw/from_raw which
  magically transfers the provenance behind the scenes. So kinda like
  free() consumes provenance and malloc() creates new provenance (at least
  for mutable references, for immutable ones it's a bit different), except
  the pointer value stays the same and the memory contents of the object
  also stays the same. So something like Arc::into_raw_c_void and
  Arc::from_raw_c_void, since this magic provenance transfer would only
  really make sense for ffi with C code where the void * is just an opaque
  reference that's passed around, and the C code never looks at what's
  behind it. Well except for runtime type casting, where the type is
  probably a bit more specific than void *.

I don't think we can ignore this issue, because using void * as the lookup
key is fairly common in the kernel, and these lookup functions don't
bother with returning that pointer again. But semantically they do return
the provenance for the full object that you pass in and cast to void *,
it's just that C totally sucks at type safety.

Or maybe I'm just really confused about all this still ...

Cheers, Sima


> 
> Regards,
> Boqun
> 
> > > I think you could replace self.as_ptr in this function with a random bit
> > > value, and aside from being functionally nonsense and resulting in a
> > > randomized leak on the C side I dont think it would be unsafe/unsound.
> > > 
> > > What am I missing?
> > 
> > Trying to sharpen my argument a bit after chatting with Danilo on irc:
> > 
> > My take is that Arc::from_raw must discard provenance of the argument, and
> > instead entirely relies on Arc::into_raw having been call beforehand with
> > a return value that bitwise matches what we stuff into from_raw. So it
> > should inherit the provenance of the reference we passed to Arc::into_raw.
> > 
> > If that's not the case then from_raw is busted, and it only happens to
> > work for ffi callbacks because the compiler cannot see behind the ffi
> > curtain.
> > -Sima
> > 
> > > 
> > > Cheers, Sima
> > > 
> > > > 
> > > > > 
> > > > > Regards,
> > > > > Boqun
> > > > > 
> > > > > > +
> > > > > > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > > > > > +        //
> > > > > > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > > > > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > > > > > +        unsafe { self.data.revoke_nosync() };
> > > > > > +    }
> > > > > > +
> > > > > >      #[allow(clippy::missing_safety_doc)]
> > > > > >      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
> > > > > >          let ptr = ptr as *mut DevresInner<T>;
> > > > > > @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
> > > > > >  
> > > > > >  impl<T> Drop for Devres<T> {
> > > > > >      fn drop(&mut self) {
> > > > > > -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> > > > > > -        //
> > > > > > -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> > > > > > -        // necessary since we don't know when `Devres` is dropped and calling
> > > > > > -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> > > > > > -        //
> > > > > > -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > > > > -        // anymore, hence it is safe not to wait for the grace period to finish.
> > > > > > -        unsafe { self.revoke_nosync() };
> > > > > > +        self.0.remove_action();
> > > > > >      }
> > > > > >  }
> > > > > > -- 
> > > > > > 2.47.1
> > > > > > 
> > > 
> > > -- 
> > > Simona Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
