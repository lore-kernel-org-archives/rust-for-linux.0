Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06B1FC7EE
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344412; cv=none; b=dLYA+8fFLX3bdu93R6JvrMDhlJw4GbUFu9A509Thdrk9FrrkCmqNs7ASg2B6zzH8oyPvfoZXLh8Fu6wT53t0MhSGgZEjQ5wnUwYa+W6VtaacQYA1f1cGnXvRrqo2UUlx1WHN5KcCDmYbPSiEL2XUjQfIuPh6yDFqplG5cMqiAb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344412; c=relaxed/simple;
	bh=ofXNWqNWX7xHDs+vmQzPrMk0moh+mg0GJoXarej5bcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5SoiADeJNtNg2JntSuMWoUiGVjga8rArxa25y4dlK8/7mbfx31dfpuOcoPhMWlVUhv4K+qioPxJNZsuZ7ZqzWbaMUcKmhycJJpct6WGBbB3BTBgPHK59Ok6kl/dCdgau37N5KhaKNUwjFOEbOxEAX4q0UzETamjaDtZed6hlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=YaYLgdNO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="YaYLgdNO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43626213fffso5536665e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 05:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736344407; x=1736949207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw/I589OID/h/faVFUYy9BE802l0bliUsnODfwl56Tw=;
        b=YaYLgdNOA4kDQdH1BgJDl8Upqf+cQzIQdlPabvVls/vImPdsKZ4Myvzkfj/PDtHWYE
         fHfw6OBiAqNq8WLn/D+9bhDC18MFiil0jACbO3IHR8ylncrOAPobosFFr5a7jrQONt+k
         zkw0uczZ6CIHiJKOkIdkMmCF4Ims+/pEtJCRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736344407; x=1736949207;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zw/I589OID/h/faVFUYy9BE802l0bliUsnODfwl56Tw=;
        b=I9fw8xODMSBigyFTmtl3M+0/iJ+wg2dbT4OiBksVXBc2vdnEjfRPcnH6Ba73SnSNtb
         46kMG9jqtsUynxefo8Aq7QeRTDFd04hssy/fsAgsFcyw5DD7b5P7YXkHvzmPsMLu9L8m
         Jr+SwE6lLd0XfaoV5L6JSMKk06o6Ts2xMf1OZya8b0oSB4PwWE0NftshpqyTLdK7+Qkv
         D/ZLzmYfMpMB/jrRJp6gHWv95aK1vCIhGtvqylH5x/sTGvNqaKzuuZL+faFKQLnwAay0
         NzJ2sOiMf1AtwhFVxwGfTthRuG+U5+5msTeFMF11344C1aUpe3shfzIPG/csDEBx68AM
         aJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKETcsJwnISkpttWIFbi0UJjeqd7p8/xxcpZ/HYCa3ilHMbllR/i9bGeQjrAzyMVGy2gSzWUB229O4b6oIyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEY8iaau61iDdKDPV7zl/CAmXz/i4nA142WZM+uJvi5lM5yZS8
	krP6e31Tdj5gSZD1WFi3ZROiPJzuPdAxEn++fm0sNsE+estAm7oninuCG6i971w=
X-Gm-Gg: ASbGncu/o7Bic5R+L2xvFu/QKZnVUl1sxpmYivnlz07MezR31TqFHx0PbBTEmD2nCW8
	VJL5KruLyYqWveGD2HRjHBYSda3xrPCVYwSKpRT8k5uw8VQmTaN0+G8BlHtb6UkBg+1nEz7P1zj
	B9yAT/+kwwHjvhPwWOrrfTL7UCPFXXEzG1DCIHeJQTDmaHRDtwHBcbFECYUoyvD54DTqdip9RKz
	viCNyzdr4cO5TR/nKm4KQ0nnP+Ctiv3sdPHKdsj6/YTaz/u7syyi3WB8ne/NSDz1Dqb
X-Google-Smtp-Source: AGHT+IGcFX2OqSMOiBQ10fzRud6kCjjcp+4yR6XK5g8oVIXi+3eD0ETorB5ho7YJSs4YplJ/dcJybg==
X-Received: by 2002:a05:600c:3b22:b0:434:fa73:a906 with SMTP id 5b1f17b1804b1-436e1dd3e3bmr24777185e9.4.1736344407309;
        Wed, 08 Jan 2025 05:53:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e9a5bbsm21321575e9.44.2025.01.08.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:53:25 -0800 (PST)
Date: Wed, 8 Jan 2025 14:53:23 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <Z36DU2Rf1O6cJbzG@phenom.ffwll.local>
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
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3z4tHzwatjbvz1h@pollux>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Tue, Jan 07, 2025 at 10:49:40AM +0100, Danilo Krummrich wrote:
> On Mon, Jan 06, 2025 at 08:51:33AM -0800, Boqun Feng wrote:
> > On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> > > So far `DevresInner` is kept alive, even if `Devres` is dropped until
> > > the devres callback is executed to avoid a WARN() when the action has
> > > been released already.
> > > 
> > > With the introduction of devm_remove_action_nowarn() we can remove the
> > > action in `Devres::drop`, handle the case where the action has been
> > > released already and hence also free `DevresInner`.
> > > 
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > ---
> > >  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
> > >  1 file changed, 44 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > index 9c9dd39584eb..7d3daac92109 100644
> > > --- a/rust/kernel/devres.rs
> > > +++ b/rust/kernel/devres.rs
> > > @@ -10,15 +10,19 @@
> > >      bindings,
> > >      device::Device,
> > >      error::{Error, Result},
> > > +    ffi::c_void,
> > >      prelude::*,
> > >      revocable::Revocable,
> > >      sync::Arc,
> > > +    types::ARef,
> > >  };
> > >  
> > >  use core::ops::Deref;
> > >  
> > >  #[pin_data]
> > >  struct DevresInner<T> {
> > > +    dev: ARef<Device>,
> > > +    callback: unsafe extern "C" fn(*mut c_void),
> > >      #[pin]
> > >      data: Revocable<T>,
> > >  }
> > > @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
> > >      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > >          let inner = Arc::pin_init(
> > >              pin_init!( DevresInner {
> > > +                dev: dev.into(),
> > > +                callback: Self::devres_callback,
> > >                  data <- Revocable::new(data),
> > >              }),
> > >              flags,
> > > @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > >  
> > >          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
> > >          // detached.
> > > -        let ret = unsafe {
> > > -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> > > -        };
> > > +        let ret =
> > > +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
> > >  
> > >          if ret != 0 {
> > >              // SAFETY: We just created another reference to `inner` in order to pass it to
> > > @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > >          Ok(inner)
> > >      }
> > >  
> > > +    fn as_ptr(&self) -> *const Self {
> > > +        self as _
> > > +    }
> > > +
> > > +    fn remove_action(&self) {
> > > +        // SAFETY:
> > > +        // - `self.inner.dev` is a valid `Device`,
> > > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > > +        //   previously,
> > > +        // - `self` is always valid, even if the action has been released already.
> > > +        let ret = unsafe {
> > > +            bindings::devm_remove_action_nowarn(
> > > +                self.dev.as_raw(),
> > > +                Some(self.callback),
> > > +                self.as_ptr() as _,
> > > +            )
> > > +        };
> > > +
> > > +        if ret != 0 {
> > > +            // The devres action has been released already - nothing to do.
> > > +            return;
> > > +        }
> > > +
> > > +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> > > +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> > > +        // this reference.
> > > +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
> > 
> > There is a pointer provenance issue here I think. `self` is a immutable
> > reference to `DevresInner<..>`, so the pointer derived from it doesn't
> > have the provenance for writing nor does it have the provenance for the
> > `refcount` field in `ArcInner`. Therefore it cannot be used to
> > reconstruct an `Arc`.
> > 
> > We probably want to make `remove_action()` take an
> > `&Arc<DevresInner<T>>`. Or am I missing something subtle?
> 
> Indeed, good catch!

Just for my own learning I've tried to understand why there's an issue
here, but no in DevresInner.devres_callback. In both cases we take the
exact same bag of bits and convert it into an Arc, relying on the C side
guaranteeing to us that we exclusively own whatever object that bag of
bits points to when converted into a real reference.

I don't think we rely on the provance of self here at all, because we just
pass that bag of bits to devm_remove_action_nowarn as a magic lookup key,
and in the ret == 0 case the C side guarantee is that we own the resulting
object if we convert it into one using Arc::from_raw.

I think you could replace self.as_ptr in this function with a random bit
value, and aside from being functionally nonsense and resulting in a
randomized leak on the C side I dont think it would be unsafe/unsound.

What am I missing?

Cheers, Sima

> 
> > 
> > Regards,
> > Boqun
> > 
> > > +
> > > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > > +        //
> > > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > > +        unsafe { self.data.revoke_nosync() };
> > > +    }
> > > +
> > >      #[allow(clippy::missing_safety_doc)]
> > >      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
> > >          let ptr = ptr as *mut DevresInner<T>;
> > > @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
> > >  
> > >  impl<T> Drop for Devres<T> {
> > >      fn drop(&mut self) {
> > > -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> > > -        //
> > > -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> > > -        // necessary since we don't know when `Devres` is dropped and calling
> > > -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> > > -        //
> > > -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > -        // anymore, hence it is safe not to wait for the grace period to finish.
> > > -        unsafe { self.revoke_nosync() };
> > > +        self.0.remove_action();
> > >      }
> > >  }
> > > -- 
> > > 2.47.1
> > > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
