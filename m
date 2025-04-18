Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934911C5485
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954288; cv=none; b=IA9mxcmV8X5X2OY4ITn1xmSF/qroYVEmjP1P1Y2LwcRLOEuwkmyLEp/S+ep+VwbKhYCY5iEfEgcDsI3NFrSlggAh2F7EaxnM6o/17z06glDNPxx+MChmG3s/yMrp+AItJDVylDXQQ/9XO8F3xZdrUW1pQt2RDbtQe/NevQ7bFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954288; c=relaxed/simple;
	bh=t78eeW8rpooSOC50VO4f2MXEiuTp2tAMO7oBbagNQcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdrIkcOyLx4SRCf/IXMoVMMAeG00+Ro/dietgOJtgHS8TKEac1kDgXTxMBpam68/5BzRgNRKNJetLwGWi+jvfcAf/eR8uD0EROMEQPKsPBcjQKxL6AptcMdM2ssJugBUfDgmcEg0I10HnbkArk8VezbXMgqWTfYuuOkHnC0o/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR0JTqnR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR0JTqnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1FCC4CEEC;
	Fri, 18 Apr 2025 05:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744954288;
	bh=t78eeW8rpooSOC50VO4f2MXEiuTp2tAMO7oBbagNQcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jR0JTqnRvpzp0ou+ooTqySeFI/Z9lxQPYcoWxAExNdoosFOLJUf0WMlKl16ItjgQ5
	 Y7xLhXCNP1aSoueO1VUVtO3kzILlF2vF0cbS7IMKHMSXW9r9LAtiVOIVkEhS0PdmYS
	 nAKzROQHn+2c8z2nMI1ZIhZDF0GB1V7vIu23UO4yGz6auhcwWIbEG2STyX1SPdxroK
	 eQSi3zu0xrYJliFEO3VbsH97W2qQez1s/2FD5zvhvZzjjTjvIrDvuhLsvfBABVbMD4
	 N15aTj2g0TUpugDAKOfRNnuU74ervycefMhKWkdoXrkTIAt1L+HKgrmfBkBCu+3Ox1
	 wtz/pZUP1QPqw==
Date: Fri, 18 Apr 2025 07:31:21 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lina@asahilina.net,
	daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Message-ID: <aAHjqSfCBXID7rOu@pollux>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <1ea450fdef728a5c783738c0770ea38ba6db39f2.camel@redhat.com>
 <aAFlMmZxa8V-SFn7@cassiopeiae>
 <587c41634c36043e84d8d653dc3f4584979089f3.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587c41634c36043e84d8d653dc3f4584979089f3.camel@redhat.com>

On Thu, Apr 17, 2025 at 06:33:24PM -0400, Lyude Paul wrote:
> On Thu, 2025-04-17 at 22:31 +0200, Danilo Krummrich wrote:
> > On Thu, Apr 17, 2025 at 02:42:24PM -0400, Lyude Paul wrote:
> > > On Fri, 2025-04-11 at 01:55 +0200, Danilo Krummrich wrote:
> > > > +/// A base GEM object.
> > > > +///
> > > > +/// Invariants
> > > > +///
> > > > +/// `self.dev` is always a valid pointer to a `struct drm_device`.
> > > > +#[repr(C)]
> > > > +#[pin_data]
> > > > +pub struct Object<T: DriverObject + Send + Sync> {
> > > > +    obj: Opaque<bindings::drm_gem_object>,
> > > > +    dev: ptr::NonNull<bindings::drm_device>,
> > > 
> > > Not a huge deal but why don't we just use NonNull<device::Device<T::Driver>>
> > > here?
> > 
> > Yeah, we could indeed also use NonNull<drm::Device<T::Driver>> instead, but I
> > think it doesn't really make a difference.
> > 
> > We only need it in Object::dev(), and the unsafe call would change from
> > 
> > 	unsafe { drm::Device::as_ref(self.dev.as_ptr()) }
> > 
> > to
> > 	unsafe { &*self.dev.as_ptr() }
> > 
> > I'm fine either way.
> 
> If it doesn't make a difference then yeah, personally I would prefer the rust
> type over mixing the C type in. I think my preference just comes from the fact
> it feels more natural to use the rust-defined wrapper type wherever possible
> especially since it will give a bit more of a helpful documentation blurb for
> the type when using rust-analyzer. This can be done in a follow-up patch if
> you want as well

I will change it accordingly.
