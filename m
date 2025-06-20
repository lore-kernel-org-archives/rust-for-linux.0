Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C3328000F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421867; cv=none; b=oU1P3mth6qtcdxif4hUaZ/PbezabHIhxq7yw3hNMruG2fDwKZpgyIrAJEryAQMowOuK+s+813kkvCFFUf7p7XPVyeHYRmPixhvoqoNsXvn6orbpxJUyl6hpoeqDutKeaC64YSQA46OwQaNnN+96m/Ks22CBqK8hJk9hjdgDF30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421867; c=relaxed/simple;
	bh=EFKY6gSu3Q9QSGtZ5sPh2/Tzs7GNR5hqTta3ZaM+P4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpb04wbHmdl/y8uLDV7xA/AVXp8VZXMTlYiKQjLH4hQ3ty5UNMZHu/1uQnQtqvXDZ3mt7DjHbJ0iO7h6knbURIZpO+jNaSlAhvR84gNoSgywzjdWHrbmSyEEAjxeUXdimE4tYXwZ6bhNdfblnQ6Fs8746qiic/qKqpYNrGwhuz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E761516F2;
	Fri, 20 Jun 2025 05:17:25 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5626A3F58B;
	Fri, 20 Jun 2025 05:17:41 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:17:36 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFVQxX70wCZv7A82@arm.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFPsjIFIC1J2qtdc@pollux>

On Thu, Jun 19, 2025 at 12:55:08PM +0200, Danilo Krummrich wrote:
> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> > With the Opaque<T>, the expectations are that Rust should not make any
> > assumptions on the layout or invariants of the wrapped C types.
> > That runs rather counter to ioctl arguments, which must adhere to
> > certain data-layout constraints. By using Opaque<T>, ioctl handlers
> > end up doing unsound castings,
> 
> Which unsound casts? Please see [1] and [2] for how nova implements those IOCTL
> handlers.
>
That's a bad warding on my side.
> Speaking of which, this patch breaks the build, since it doesn't adjust the
> users of the API, i.e. nova.
> 
True, totally slipped my mind that there are already users of those.
Apologies for that.
> If you want I can post a diff to fix up nova accordingly for you to add to this
> patch.
I think you already did - so thank you.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nova/uapi.rs
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nova/file.rs
> 
> > which adds needless complexity and
> > maintenance overhead, brining no safety benefits.
> > Drop the use of Opaque for ioctl arguments as that is not the best
> > fit here.
> > 
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> > 
> >  Additional comments:
> >  - UAPI types already automatically derive MaybeZeroable,
> >    so it probably makes little sense to add any verification for that
> >  - FromBytes is pending, but due to the orphan rule, adding verification
> >    of it being implemented for IOCTL args here is pointless
> >  - Verifying pointer alignment could make use of strict_provenance,
> >    but that one is unstable and I am not sure what are the exact rules
> >    here for using those. Without that one though, verifying alignment in
> >    some cases (i.e. pointer tagging) might require more extensive changes.
> >    Happy to deal with either.
> > 
> >  rust/kernel/drm/ioctl.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> > index 445639404fb7..12b296131672 100644
> > --- a/rust/kernel/drm/ioctl.rs
> > +++ b/rust/kernel/drm/ioctl.rs
> > @@ -139,7 +139,7 @@ pub mod internal {
> >                              // asserted above matches the size of this type, and all bit patterns of
> >                              // UAPI structs must be valid.
> >                              let data = unsafe {
> > -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> > +                                &mut *(raw_data as *mut $crate::uapi::$struct)
> 
> I think we have to document the guarantees we rely on to create this mutable
> reference.
> 
Will do.

---
BR
Beata
> >                              };
> 
> This should be formatted as one single line and also adjust the doc-comment of
> the macro accordingly, i.e.:
> 
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 12b296131672..f0c599f15a41 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -83,7 +83,7 @@ pub mod internal {
>  ///
>  /// ```ignore
>  /// fn foo(device: &kernel::drm::Device<Self>,
> -///        data: &Opaque<uapi::argument_type>,
> +///        data: &mut uapi::argument_type,
>  ///        file: &kernel::drm::File<Self::File>,
>  /// ) -> Result<u32>
>  /// ```
> @@ -138,9 +138,7 @@ macro_rules! declare_drm_ioctls {
>                              // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
>                              // asserted above matches the size of this type, and all bit patterns of
>                              // UAPI structs must be valid.
> -                            let data = unsafe {
> -                                &mut *(raw_data as *mut $crate::uapi::$struct)
> -                            };
> +                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
>                              // SAFETY: This is just the DRM file structure
>                              let file = unsafe { $crate::drm::File::as_ref(raw_file) };
