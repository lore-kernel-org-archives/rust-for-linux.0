Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BA5249E5;
	Thu,  9 Jan 2025 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436110; cv=none; b=IuSAmEZNse7Oekd95Cu3SPSevnvoCZ8KlFjUPmNKRKTPjfbK8uYklc5GdeIUJzJf5qRHu65ZYT8kabRn4ahp4rvwi7C6MHXfBLRsf46JRtRFzdlikQT5NvCB9/rSPoLYfbYt8MV9CJLsL0ggJfX+bfra5ODQu9gDnsi+sToEPRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436110; c=relaxed/simple;
	bh=G9DD5s8cVk24BOVWAO2AB13rgH/4BzveVGsomFuBONI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRX40460SbFGj/YiZn/JrgZsJG02zSW0fz7/UobZ8frRYFDolHgOa36a2VjvaiBHuvHZcqDC0HpnE8SK64Mi8kKmi2ArVE8IkpV6K3tG5y645ATfR356Mmz7RFhfVv9jTlOwCcr0qz4o4KStPTESceSu+27z9K2F+QSlRDBrboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7QSgJIX; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7QSgJIX"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6eb531e13so50255885a.0;
        Thu, 09 Jan 2025 07:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736436108; x=1737040908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfvbrMU2FVyKpOETR29pxvmad3oAfgz8dbMEvCRyJWE=;
        b=Q7QSgJIXJiZIpnNZkN0ZyXqh5pQKyHf30TdnRmNOtowYt3R5WLBHSIqf/Xlq3lJHRr
         xl/AtJ/ci6/SfCtYXN9g7iqobQJWvomtcU9uf79wWhqsAPco9qiRcgPnqVpPbs+cakTB
         vN1r1Qau6KpPLCHpKJlf8/zFFOoRA0MVjuvSB+X53XWnCNK3NI+md7utdPhuZL86qmbg
         +njo1jc80uOCqRgbyAM0azDNsBpgZXHKRDYUe8xC+B9RptjwusdsJeOSJUI9JWi79CI8
         +aeyrl53nNW/f5cC7ULlU+o5J1k3+7VtOjUnhKu1SP1QaMTWcfVi3cZ/ImBDHFENTGTr
         XPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436108; x=1737040908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfvbrMU2FVyKpOETR29pxvmad3oAfgz8dbMEvCRyJWE=;
        b=Y42pvF9TitjzEKaLP7Q5EhWEZyt/HL5PdgKnD5nuv1dcrMEh/Eik/qxNsA7bGanJVm
         jlzGD7o5R0rzcxFS8p3ytWNMeEYFlXcwVF/opqS3HpQo703rCyqlCtOwcTvIsZOwh7zd
         b5LH6mqDtPT6H5wrp+BipXYvfgj8kxmZKZDXNrSaOYJj5SAz1zU3dDolV3aTAPoXuXEh
         tG0/b+ZXdgNIDJrqVJ9Q5RpvsRgoUl889vIVnC3iIN0bpvq2T5AZgTTZaSBUEwE3ht4z
         mYKwPKKknqVOr3MI7erFR4F59dVUAPrf+IEB6ZOJQjB33VUmTLAu1ASVWxNMDN+/wNCG
         gOVg==
X-Forwarded-Encrypted: i=1; AJvYcCUGFvovV7RltJnuk0O25vWQ8TXVVRlk99/pJwJmtBfoTs9SYLZv2n06WSrqPDQM8vaI2GIKsqF+uASM6vqL964=@vger.kernel.org, AJvYcCUvUMZbckD4JHb/Hl9f5sZdRRAlH8mjvdmV7Rnbn4saL9Mk3J6LxmBTTVhdj9x+W3oEvC/Ow7HdikORTMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ix8+EKVptI3bRNrYhs7b3k39aZLq82gTtxlDI+L0NWri/0mw
	LFMsGZeG/wbQJtHTCkgEU8cT9elWoUFtJQUse8GzfMWMuC1/uPf2
X-Gm-Gg: ASbGncu7XjG02s1syZ6vMZq78N33j5LxTBtoZColmb379uDD4cnC6tiLAXsg6lVmDz9
	+i6nuuQZkR4hJYysHS+pjhxTxnBLIhtXlDquVZJUtgK0VLEhLxRsy/UEh0gVU2sqWd/qhoqb3/6
	6vYvrLtsJhutUBtRtzNDMwbh2fcJJwxql98AgMREUiXcl3lTc+Rgsi7L+SdSyS5mlqIeOpi121q
	AEVOWLlpkzXQE3Vvs+CGP7ywl3L8MXV7LloO9vwWzKSDxwFdm0ooUvKg5jCWWCAh5XHLEq5rFtd
	VDb0Zf/6t95XSDxe0jYI1Zb+h8HSLERUrmHN5fMH9QYt2D0=
X-Google-Smtp-Source: AGHT+IFxRUPF0qBZ6knCWH3i9/Wzl8XXspPX0sg7kqN3Ck0kt2lIU545Mefut9tXvEhOXHwOUMbJ1g==
X-Received: by 2002:a05:6214:29cd:b0:6d4:254f:1c8e with SMTP id 6a1803df08f44-6df9b2d1d3bmr103926366d6.37.1736436107544;
        Thu, 09 Jan 2025 07:21:47 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd1810db8fsm201781686d6.46.2025.01.09.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:21:47 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8557E1200043;
	Thu,  9 Jan 2025 10:21:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 09 Jan 2025 10:21:46 -0500
X-ME-Sender: <xms:iul_Z11trnpSRGDkCNPpREwnfez7MUyxfq7eVykQxIQV9f_hn9hGdg>
    <xme:iul_Z8E6OLLb8O6koeU9kHRQ_ttPz5SMdAekEnkIFDBj5jPLFGxZOn1FzJelTgxRa
    z1iMAccY54XnduZlQ>
X-ME-Received: <xmr:iul_Z17CBua4fH7tdG68fuX7t8tpUCJmEXHYgKppytYrMKy-nYb8FUtcles>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homheqnecuggftrfgrthhtvghrnhepieehtdekhfdvtefgteehteejveelgeeiueegfeej
    tefgtedttdfhkeevlefgffdunecuffhomhgrihhnpehinhhnvghrrdguvghvpdguvghvrh
    gvshgptggrlhhlsggrtghkrdhinhdpfhhffihllhdrtghhnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuth
    hhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhu
    nhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtph
    htthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrkhhrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
    dprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iul_Zy2iDPtzRt1xrYOiqKHZCq3jITqQD9fHleZGHYd3vNQn4jj5Zg>
    <xmx:iul_Z4E_1QEh_6liJwHUVPsBlkVzp2wvURYVKdW7AAcoQ762LN12XQ>
    <xmx:iul_Zz-MrEiLbPLo66319345Y0vr3cvdh8_VsLv28QtMBa-vUceVRw>
    <xmx:iul_Z1niKVYE7fHOXjXrU1tmnENbFfE7ddn0tG6Y92DAn7thO0j5vw>
    <xmx:iul_Z8Ei7jFZPBQyI7bPh-y3Ii0tQqnT9jDwO3MSt00OCr_wFZTIpYzA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 10:21:45 -0500 (EST)
Date: Thu, 9 Jan 2025 07:20:44 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: devres: remove action in `Devres::drop`
Message-ID: <Z3_pTK4_CsvpF8cX@boqun-archlinux>
References: <20250103164436.96449-1-dakr@kernel.org>
 <20250103164436.96449-2-dakr@kernel.org>
 <Z3wKFTkmjdaGHKIn@tardis.local>
 <Z3z4tHzwatjbvz1h@pollux>
 <Z36DU2Rf1O6cJbzG@phenom.ffwll.local>
 <Z3-b7hry7PdB31Br@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3-b7hry7PdB31Br@phenom.ffwll.local>

On Thu, Jan 09, 2025 at 10:50:38AM +0100, Simona Vetter wrote:
> On Wed, Jan 08, 2025 at 02:53:23PM +0100, Simona Vetter wrote:
> > On Tue, Jan 07, 2025 at 10:49:40AM +0100, Danilo Krummrich wrote:
> > > On Mon, Jan 06, 2025 at 08:51:33AM -0800, Boqun Feng wrote:
> > > > On Fri, Jan 03, 2025 at 05:44:31PM +0100, Danilo Krummrich wrote:
> > > > > So far `DevresInner` is kept alive, even if `Devres` is dropped until
> > > > > the devres callback is executed to avoid a WARN() when the action has
> > > > > been released already.
> > > > > 
> > > > > With the introduction of devm_remove_action_nowarn() we can remove the
> > > > > action in `Devres::drop`, handle the case where the action has been
> > > > > released already and hence also free `DevresInner`.
> > > > > 
> > > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > > ---
> > > > >  rust/kernel/devres.rs | 56 +++++++++++++++++++++++++++++++++----------
> > > > >  1 file changed, 44 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > > > index 9c9dd39584eb..7d3daac92109 100644
> > > > > --- a/rust/kernel/devres.rs
> > > > > +++ b/rust/kernel/devres.rs
> > > > > @@ -10,15 +10,19 @@
> > > > >      bindings,
> > > > >      device::Device,
> > > > >      error::{Error, Result},
> > > > > +    ffi::c_void,
> > > > >      prelude::*,
> > > > >      revocable::Revocable,
> > > > >      sync::Arc,
> > > > > +    types::ARef,
> > > > >  };
> > > > >  
> > > > >  use core::ops::Deref;
> > > > >  
> > > > >  #[pin_data]
> > > > >  struct DevresInner<T> {
> > > > > +    dev: ARef<Device>,
> > > > > +    callback: unsafe extern "C" fn(*mut c_void),
> > > > >      #[pin]
> > > > >      data: Revocable<T>,
> > > > >  }
> > > > > @@ -98,6 +102,8 @@ impl<T> DevresInner<T> {
> > > > >      fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > > >          let inner = Arc::pin_init(
> > > > >              pin_init!( DevresInner {
> > > > > +                dev: dev.into(),
> > > > > +                callback: Self::devres_callback,
> > > > >                  data <- Revocable::new(data),
> > > > >              }),
> > > > >              flags,
> > > > > @@ -109,9 +115,8 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > > >  
> > > > >          // SAFETY: `devm_add_action` guarantees to call `Self::devres_callback` once `dev` is
> > > > >          // detached.
> > > > > -        let ret = unsafe {
> > > > > -            bindings::devm_add_action(dev.as_raw(), Some(Self::devres_callback), data as _)
> > > > > -        };
> > > > > +        let ret =
> > > > > +            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.callback), data as _) };
> > > > >  
> > > > >          if ret != 0 {
> > > > >              // SAFETY: We just created another reference to `inner` in order to pass it to
> > > > > @@ -124,6 +129,41 @@ fn new(dev: &Device, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> > > > >          Ok(inner)
> > > > >      }
> > > > >  
> > > > > +    fn as_ptr(&self) -> *const Self {
> > > > > +        self as _
> > > > > +    }
> > > > > +
> > > > > +    fn remove_action(&self) {
> > > > > +        // SAFETY:
> > > > > +        // - `self.inner.dev` is a valid `Device`,
> > > > > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > > > > +        //   previously,
> > > > > +        // - `self` is always valid, even if the action has been released already.
> > > > > +        let ret = unsafe {
> > > > > +            bindings::devm_remove_action_nowarn(
> > > > > +                self.dev.as_raw(),
> > > > > +                Some(self.callback),
> > > > > +                self.as_ptr() as _,
> > > > > +            )
> > > > > +        };
> > > > > +
> > > > > +        if ret != 0 {
> > > > > +            // The devres action has been released already - nothing to do.
> > > > > +            return;
> > > > > +        }
> > > > > +
> > > > > +        // SAFETY: We leaked an `Arc` reference to devm_add_action() in `DevresInner::new`; if
> > > > > +        // devm_remove_action_nowarn() was successful we can (and have to) claim back ownership of
> > > > > +        // this reference.
> > > > > +        let _ = unsafe { Arc::from_raw(self.as_ptr()) };
> > > > 
> > > > There is a pointer provenance issue here I think. `self` is a immutable
> > > > reference to `DevresInner<..>`, so the pointer derived from it doesn't
> > > > have the provenance for writing nor does it have the provenance for the
> > > > `refcount` field in `ArcInner`. Therefore it cannot be used to
> > > > reconstruct an `Arc`.
> > > > 
> > > > We probably want to make `remove_action()` take an
> > > > `&Arc<DevresInner<T>>`. Or am I missing something subtle?
> > > 
> > > Indeed, good catch!
> > 
> > Just for my own learning I've tried to understand why there's an issue
> > here, but no in DevresInner.devres_callback. In both cases we take the

I also learned this in a hard way ;-) let me try to explain my
understanding.

First the difference between here and `DevresInner::devres_callback()`
is "how the pointer was derived" or "where did the pointer come from".

* In `DevresInner::devres_callback()` case, it uses a pointer value
  directly, and that value came from a previous `Arc::into_raw()` which
  uses the pointer directly with an offset (note that offsetting doesn't
  change the pointer provenance), so that pointer has the same
  provenance as an `Arc`.

* In here, what we did was getting a pointer to `DevresInner` from a
  `&DevresInner` and that pointer doesn't have the provenane to the
  whole `ArcInner<DervesInner>`, nor does it have the write permission
  because it comes from an immutable reference.

> > exact same bag of bits and convert it into an Arc, relying on the C side
> > guaranteeing to us that we exclusively own whatever object that bag of
> > bits points to when converted into a real reference.
> > 
> > I don't think we rely on the provance of self here at all, because we just
> > pass that bag of bits to devm_remove_action_nowarn as a magic lookup key,
> > and in the ret == 0 case the C side guarantee is that we own the resulting
> > object if we convert it into one using Arc::from_raw.
> > 

Other than `Arc::from_raw()` there is another side in this picture: the
one that provides the immutable reference, so if you do:

    let p: &Arc<T> = ...; // say you have an `Arc<T>` reference.
    let o = p.deref();    // you got a reference to the internal object.

    let ptr = o as *const T;
    let new_arc = Arc::from_raw(ptr); // use the pointer of `o` to
                                      // construct a new Arc. Even if
				      // there is a spare refcount some
				      // where due to a Arc::into_raw()
				      // previously.
    do_something(new_arc);

    use(p); // here the compiler is within its right to assume if there
            // is no other access the underlying `Arc<T>`, the refcount
	    // should be unchanged (more precisely, the whole `ArcInner`
	    // should be unchanged).

And by voliating pointer provenance, the assumption is broken and there
is no way to tell compiler about that (at least in the current
operational semantics of Rust IIUC). Intuitively, `o` only has the
permission to read the object, so we cannot use it for construct an
`Arc`.

This to me is how pointer provenance actually works: it's a model that
describes how compilers can make assumptions so that programmers and
compilers have the same picture about whether there could be an
optimization based on an assumption.

Does this make sense to you?

Regards,
Boqun

> > I think you could replace self.as_ptr in this function with a random bit
> > value, and aside from being functionally nonsense and resulting in a
> > randomized leak on the C side I dont think it would be unsafe/unsound.
> > 
> > What am I missing?
> 
> Trying to sharpen my argument a bit after chatting with Danilo on irc:
> 
> My take is that Arc::from_raw must discard provenance of the argument, and
> instead entirely relies on Arc::into_raw having been call beforehand with
> a return value that bitwise matches what we stuff into from_raw. So it
> should inherit the provenance of the reference we passed to Arc::into_raw.
> 
> If that's not the case then from_raw is busted, and it only happens to
> work for ffi callbacks because the compiler cannot see behind the ffi
> curtain.
> -Sima
> 
> > 
> > Cheers, Sima
> > 
> > > 
> > > > 
> > > > Regards,
> > > > Boqun
> > > > 
> > > > > +
> > > > > +        // Revoke the data, such that it gets dropped and the actual resource is freed.
> > > > > +        //
> > > > > +        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > > > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > > > > +        unsafe { self.data.revoke_nosync() };
> > > > > +    }
> > > > > +
> > > > >      #[allow(clippy::missing_safety_doc)]
> > > > >      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
> > > > >          let ptr = ptr as *mut DevresInner<T>;
> > > > > @@ -165,14 +205,6 @@ fn deref(&self) -> &Self::Target {
> > > > >  
> > > > >  impl<T> Drop for Devres<T> {
> > > > >      fn drop(&mut self) {
> > > > > -        // Revoke the data, such that it gets dropped already and the actual resource is freed.
> > > > > -        //
> > > > > -        // `DevresInner` has to stay alive until the devres callback has been called. This is
> > > > > -        // necessary since we don't know when `Devres` is dropped and calling
> > > > > -        // `devm_remove_action()` instead could race with `devres_release_all()`.
> > > > > -        //
> > > > > -        // SAFETY: When `drop` runs, it's guaranteed that nobody is accessing the revocable data
> > > > > -        // anymore, hence it is safe not to wait for the grace period to finish.
> > > > > -        unsafe { self.revoke_nosync() };
> > > > > +        self.0.remove_action();
> > > > >      }
> > > > >  }
> > > > > -- 
> > > > > 2.47.1
> > > > > 
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
