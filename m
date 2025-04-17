Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9951865FA
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921214; cv=none; b=KCEuHB4NCXbKee5PNkoEUUGxPdDNN0ghysvY/aMlBxfpaMSDDM2/N8BwwxoQkvASBmgNVXsIOol3krw5u1luBOqvJGHi7345yBmOZOqJtNf026zy9Zn1z5/Uz57SlAKEeFHOn+GMZLLIW6pQvfuXQEKJJPDYyEZOzEMB4TOrfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921214; c=relaxed/simple;
	bh=BQR63fIYU7Hvg0pLeH3+AIk9Z8ZmOCFlDxnTQjiJsIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJbDK3Z28LaV3J4NyVYr/0okKFYREvKW6HR5mdoTDVwXBsGbyRzLM1gfqhnVgUGzOirNNSWTmQrsd7aIe3wTL/dVsEXUqPD/51nmh0MhLPauezoOlUKJW6ctq9OrU21wuKQa0eLtY7Br+X4nAjUoiDM3GKyUExSXLmXqFNcl1Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3Eae7CV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3Eae7CV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1507EC4CEE4;
	Thu, 17 Apr 2025 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744921214;
	bh=BQR63fIYU7Hvg0pLeH3+AIk9Z8ZmOCFlDxnTQjiJsIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3Eae7CVP6SklxSvECPc5VW5G4XlHlenMQGvsZWpLtsSPt8NhdBGVL3MHUQBUY4GX
	 92NdkP/0El4Ylv81nFDFyXD51muHPTpxHn2xv2rRz0kNw3qQJmlc97L+VmhxMSsBAm
	 7fVwkXigySuLZJf58Mx6tOrWQ7q/IMSXULbMu6tU1bApKrAXnlS1Wk2wi4P04CwlwM
	 qCl4GDtkfBqwe+P94M2WqqTisHjie1xFQwXUx23M8cMNHBbajdMFIRxtqA8HokDS8K
	 tXoJwUkK4FCuSZTN+hiWUGqh0NiLsBQmHbx9r5a8Mzq4Tt1GOO1BLV38aGyHmFmvgK
	 zoszaaLuzpHaQ==
Date: Thu, 17 Apr 2025 22:20:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lina@asahilina.net,
	daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/8] rust: drm: add device abstraction
Message-ID: <aAFidyQbGQmgnk5D@cassiopeiae>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-5-dakr@kernel.org>
 <2e17276392566ed009a80bfd9bccaed3792b9f66.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e17276392566ed009a80bfd9bccaed3792b9f66.camel@redhat.com>

On Thu, Apr 17, 2025 at 02:53:33PM -0400, Lyude Paul wrote:
> On Fri, 2025-04-11 at 01:55 +0200, Danilo Krummrich wrote:
> > +    /// Not intended to be called externally, except via declare_drm_ioctls!()
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
> > +    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
> > +    /// to can't drop to zero, for the duration of this function call and the entire duration when
> > +    /// the returned reference exists.
> > +    ///
> > +    /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
> > +    /// embedded in `Self`.
> > +    #[doc(hidden)]
> > +    pub unsafe fn as_ref<'a>(ptr: *const bindings::drm_device) -> &'a Self {
> > +        // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
> > +        // `struct drm_device` embedded in `Self`.
> > +        let ptr = unsafe { Self::from_drm_device(ptr) };
> > +
> > +        // SAFETY: `ptr` is valid by the safety requirements of this function.
> > +        unsafe { &*ptr.cast() }
> > +    }
> > +}
> 
> Hm. Are we sure that `as_ref()` is really the function name we want here? We
> already have AsRef<kernel::device::Device> implemented for DRM devices, I'm
> not sure if this function would cause a naming conflict since it doesn't use
> self but at the very least it does seem a little bit confusing.
> 
> Why not call it either from_raw(), or (depending on what RFL people think)
> from_c()?

I chose as_ref() for consistency. Wherever we convert from some pointer type to
&Self, we use as_ref(); when we convert from some pointer type to Self we use
from_raw() (from_c() isn't really a thing). Hence I'd like to keep it as_ref().
