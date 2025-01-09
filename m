Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5937217667
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416245; cv=none; b=mG6K4eTi9X/I6j0tV2WPPqzY9QAz/6dcMSH83F0hvWLDmerm9V9YX65iScE2u7kuU72OsZZB737y1a3Ia7ZGvDPRKeciN1tURV+1cu+KJZekQ8ab5vm6Sm7HkD1hf2QPst9yT6ohj5+ze2y4x4DUkxNaISbqWu2xXW6OKA5YJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416245; c=relaxed/simple;
	bh=t630YFYw7ih3O+vXH/ApcsyYFOIjkR1OnM7GTx12KNA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC4O5BMSbn+vJ0iXeIheqMqmLiu0wW84W/0k+SMK7bZLNoC+Rf9xWYxQrfOy84mb19erZLm3On/vaZl4LnfLC5l8ZzyK5SMYlNbNqordesTbpGR+BdSDodGgYC9ynk1kpgtb2Hni7YcOR/ZY/HulquWHytKRJYUjAEvaV7uoPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=gleBEQ4c; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="gleBEQ4c"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e06af753so332878f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 01:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736416241; x=1737021041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M0FmZrALMc+V2GBg/dbwamb8Cl1rUxCuUNqLXjiYNVw=;
        b=gleBEQ4cMVz2tX0OyAl7f8E4GBXZ0/WT+GtDWHJbXSR84aXJ4jXb/CiBtu/Sx6DMqZ
         MbrjBCivjSIWZC/8FTiGfiNSsSNsADpeGc92hhVSA1s5Vqjcp2tmjCf0m5LKad9bNFzY
         zKisUDL7UY3LzF80x12wtQVvbPG4YfD+YQgSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736416241; x=1737021041;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0FmZrALMc+V2GBg/dbwamb8Cl1rUxCuUNqLXjiYNVw=;
        b=ovQLh0MZq8T5jaY36RGRPBpEUpbsCuRVH3sXUn51TBbSjQUGeaUgf20WiK4FXyhQhZ
         M8lNKOgPh0r0UPPkAYrMyBWXGBJMnry5GidkAQ3bRM4GNC6xF9Bc3rFkpcwJSOibMKKR
         1X4t1XfmEIjL/xwFKlPZ+gWkhnFhRaGfswzaueBfhXEhUpgJS6B+KU9a69gHIRnHgWQj
         YxJwjBQBCpwdt4mYbmMseB/ZJZ/vyJQdrbr0rbKgDqp4IcDfiaW/6DG8On/5yJ+Pbk5f
         S34l/devvw+SPHyb9XzfesukK3JY16XEVlDFwVUUz+6sPZ+24bI9eLtWaXQWEuqLePpk
         TQJg==
X-Forwarded-Encrypted: i=1; AJvYcCX/J8NVuHqZZt7Kv9dkHnw2m6TZ/wx7/H37XEi12Vqvo/4rwTap0DdD3DaZJRKxIuqa+hWW6jkoXxWxQhOllQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHq8dqwK164hKWHAdsYKkfmUPiznLk7hTc6R7ZKQtqRf1LhG5O
	7Q84qbUw/md5/PcpN1uYBUr7yh+e6Dx2SatStjMdI6q1rylFIyu99gGJnfRKqdU=
X-Gm-Gg: ASbGncvwg5pqRBY2GO8hLJdJuA48N2RUB/2UHuAVcL8K1xRLpoKK71B/mocPDKMbhzU
	dFeukxgv7tisbdR4dkwZh1lnmLuD40OSukcCIHzDICoOYtGG6VIqEJj8I/UQ4opIQdMr0LuttHN
	hD0RO+8SVZzOvho52IqvPKxadFYrIwRHiLqhejfn03HdTXmeAFY6KvMoZ76eigVQhEX3JLZea/w
	gVyRXu/1cryYfLXmLK42wZgaC2y6xwSal2sdMtOx15prU9nEUgExm58ubpIuh22dKSN
X-Google-Smtp-Source: AGHT+IFC5Mzp5fEYBWsDyeg37JgP6HOrlN5fQZuQOXaem3AvJ1HtBZgz0REFCIswNMzFxjSFt461ig==
X-Received: by 2002:a5d:6d06:0:b0:385:e30a:394b with SMTP id ffacd0b85a97d-38a87303f25mr5043068f8f.16.1736416240874;
        Thu, 09 Jan 2025 01:50:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38f176sm1351638f8f.63.2025.01.09.01.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:50:40 -0800 (PST)
Date: Thu, 9 Jan 2025 10:50:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <Z3-b7hry7PdB31Br@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250103164436.96449-1-dakr@kernel.org>
 <20250103164436.96449-2-dakr@kernel.org>
 <Z3wKFTkmjdaGHKIn@tardis.local>
 <Z3z4tHzwatjbvz1h@pollux>
 <Z36DU2Rf1O6cJbzG@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z36DU2Rf1O6cJbzG@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Wed, Jan 08, 2025 at 02:53:23PM +0100, Simona Vetter wrote:
> On Tue, Jan 07, 2025 at 10:49:40AM +0100, Danilo Krummrich wrote:
> > On Mon, Jan 06, 2025 at 08:51:33AM -0800, Boqun Feng wrote:
> > > On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> > > > So far `DevresInner` is kept alive, even if `Devres` is dropped until
> > > > the devres callback is executed to avoid a WARN() when the action has
> > > > been released already.
> > > > 
> > > > With the introduction of devm_remove_action_nowarn() we can remove the
> > > > action in `Devres::drop`, handle the case where the action has been
> > > > released already and hence also free `DevresInner`.
> > > > 
> > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > ---
> > > >  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
> > > >  1 file changed, 44 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > > index 9c9dd39584eb..7d3daac92109 100644
> > > > --- a/rust/kernel/devres.rs
> > > > +++ b/rust/kernel/devres.rs
> > > > @@ -10,15 +10,19 @@
> > > >      bindings,
> > > >      device::Device,
> > > >      error::{Error, Result},
> > > > +    ffi::c_void,
> > > >      prelude::*,
> > > >      revocable::Revocable,
> > > >      sync::Arc,
> > > > +    types::ARef,
> > > >  };
> > > >  
> > > >  use core::ops::Deref;
> > > >  
> > > >  #[pin_data]
> > > >  struct DevresInner<T> {
> > > > +    dev: ARef<Device>,
> > > > +    callback: unsafe extern "C" fn(*mut c_void),
> > > >      #[pin]
> > > >      data: Revocable<T>,
> > > >  }
> > > > @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
> > > >      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > >          let inner = Arc::pin_init(
> > > >              pin_init!( DevresInner {
> > > > +                dev: dev.into(),
> > > > +                callback: Self::devres_callback,
> > > >                  data <- Revocable::new(data),
> > > >              }),
> > > >              flags,
> > > > @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > >  
> > > >          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
> > > >          // detached.
> > > > -        let ret = unsafe {
> > > > -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> > > > -        };
> > > > +        let ret =
> > > > +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
> > > >  
> > > >          if ret != 0 {
> > > >              // SAFETY: We just created another reference to `inner` in order to pass it to
> > > > @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > >          Ok(inner)
> > > >      }
> > > >  
> > > > +    fn as_ptr(&self) -> *const Self {
> > > > +        self as _
> > > > +    }
> > > > +
> > > > +    fn remove_action(&self) {
> > > > +        // SAFETY:
> > > > +        // - `self.inner.dev` is a valid `Device`,
> > > > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > > > +        //   previously,
> > > > +        // - `self` is always valid, even if the action has been released already.
> > > > +        let ret = unsafe {
> > > > +            bindings::devm_remove_action_nowarn(
> > > > +                self.dev.as_raw(),
> > > > +                Some(self.callback),
> > > > +                self.as_ptr() as _,
> > > > +            )
> > > > +        };
> > > > +
> > > > +        if ret != 0 {
> > > > +            // The devres action has been released already - nothing to do.
> > > > +            return;
> > > > +        }
> > > > +
> > > > +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> > > > +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> > > > +        // this reference.
> > > > +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
> > > 
> > > There is a pointer provenance issue here I think. `self` is a immutable
> > > reference to `DevresInner<..>`, so the pointer derived from it doesn't
> > > have the provenance for writing nor does it have the provenance for the
> > > `refcount` field in `ArcInner`. Therefore it cannot be used to
> > > reconstruct an `Arc`.
> > > 
> > > We probably want to make `remove_action()` take an
> > > `&Arc<DevresInner<T>>`. Or am I missing something subtle?
> > 
> > Indeed, good catch!
> 
> Just for my own learning I've tried to understand why there's an issue
> here, but no in DevresInner.devres_callback. In both cases we take the
> exact same bag of bits and convert it into an Arc, relying on the C side
> guaranteeing to us that we exclusively own whatever object that bag of
> bits points to when converted into a real reference.
> 
> I don't think we rely on the provance of self here at all, because we just
> pass that bag of bits to devm_remove_action_nowarn as a magic lookup key,
> and in the ret == 0 case the C side guarantee is that we own the resulting
> object if we convert it into one using Arc::from_raw.
> 
> I think you could replace self.as_ptr in this function with a random bit
> value, and aside from being functionally nonsense and resulting in a
> randomized leak on the C side I dont think it would be unsafe/unsound.
> 
> What am I missing?

Trying to sharpen my argument a bit after chatting with Danilo on irc:

My take is that Arc::from_raw must discard provenance of the argument, and
instead entirely relies on Arc::into_raw having been call beforehand with
a return value that bitwise matches what we stuff into from_raw. So it
should inherit the provenance of the reference we passed to Arc::into_raw.

If that's not the case then from_raw is busted, and it only happens to
work for ffi callbacks because the compiler cannot see behind the ffi
curtain.
-Sima

> 
> Cheers, Sima
> 
> > 
> > > 
> > > Regards,
> > > Boqun
> > > 
> > > > +
> > > > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > > > +        //
> > > > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > > > +        unsafe { self.data.revoke_nosync() };
> > > > +    }
> > > > +
> > > >      #[allow(clippy::missing_safety_doc)]
> > > >      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
> > > >          let ptr = ptr as *mut DevresInner<T>;
> > > > @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
> > > >  
> > > >  impl<T> Drop for Devres<T> {
> > > >      fn drop(&mut self) {
> > > > -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> > > > -        //
> > > > -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> > > > -        // necessary since we don't know when `Devres` is dropped and calling
> > > > -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> > > > -        //
> > > > -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > > -        // anymore, hence it is safe not to wait for the grace period to finish.
> > > > -        unsafe { self.revoke_nosync() };
> > > > +        self.0.remove_action();
> > > >      }
> > > >  }
> > > > -- 
> > > > 2.47.1
> > > > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
