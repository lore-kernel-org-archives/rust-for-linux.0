Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA41A8836
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711516959; cv=none; b=QlaLRSGBbepQVOob/hG4SUHH1JHdZRK8JJYcByX34p4tWz1nc+xDG2H5tHvd1nQXPGahmKtr28d9/ujtYwbhUshYttS/4rBpwgOm9NyqR2PDp99cbc+YxAr6fJ6VIbdlaN9tIXmTTkRFUOUYPWmp/mm4siD36Ch5EwO9HdSNNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711516959; c=relaxed/simple;
	bh=sgeTxLUneg2Bl4+yopttMCl1IaJhZtlk2GVcYS3GvAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgfxE34ZbYbKLuUu6ajNUV4MdWLxwATb2DC1a1jQFFIJRl1FXvYX5tgrgbuXEN3VRLwIGlRnPWWNYXVKHpJx4UXiIh//1WeLHqm1LvmIBIqMyKBsJNE9Sl0cCwkjG1bATaVn0qJTyupZscRhojooBqe2yPRhCxbO3Z2mAdPJFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fL0jn8hE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fL0jn8hE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69077C433C7;
	Wed, 27 Mar 2024 05:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711516959;
	bh=sgeTxLUneg2Bl4+yopttMCl1IaJhZtlk2GVcYS3GvAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fL0jn8hEIb3HuyjHGl8M+mypQMQYexELo/SwvgXB7GHcodE9tlJLEdmuj/HAA90Qn
	 15spQLZThAx/EsgNxa9AFw4832UvykafbW1+TEhsnDWpGwmM7UnsbU02uq5F4ojtL1
	 8/b7SrBCvkquOleBMvsxRCs8DNERrZd201T02uMg=
Date: Wed, 27 Mar 2024 06:22:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <2024032703-mobile-perch-0a55@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
 <CANeycqqQjSqA8CK66wyaNnSckr2GNDtfEUv_Tm29WbzAs7Njzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeycqqQjSqA8CK66wyaNnSckr2GNDtfEUv_Tm29WbzAs7Njzg@mail.gmail.com>

On Tue, Mar 26, 2024 at 10:38:49PM -0300, Wedson Almeida Filho wrote:
> On Mon, 25 Mar 2024 at 15:17, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > >
> > > Add a Device type which represents an owned reference to a generic
> > > struct device. This minimal implementation just handles reference
> > > counting and allows the user to get the device name.
> > >
> > > Also, implement the rust_helper_dev_get_drvdata helper.
> > >
> > > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > Co-developed-by: Asahi Lina <lina@asahilina.net>
> > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >  rust/helpers.c        | 13 ++++++++
> > >  rust/kernel/device.rs | 76 ++++++++++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 88 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/rust/helpers.c b/rust/helpers.c
> > > index 70e59efd92bc..1e40661a33d1 100644
> > > --- a/rust/helpers.c
> > > +++ b/rust/helpers.c
> > > @@ -23,6 +23,7 @@
> > >  #include <kunit/test-bug.h>
> > >  #include <linux/bug.h>
> > >  #include <linux/build_bug.h>
> > > +#include <linux/device.h>
> > >  #include <linux/err.h>
> > >  #include <linux/errname.h>
> > >  #include <linux/mutex.h>
> > > @@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
> > >  }
> > >  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
> > >
> > > +void *rust_helper_dev_get_drvdata(struct device *dev)
> > > +{
> > > +     return dev_get_drvdata(dev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> > > +
> > > +const char *rust_helper_dev_name(const struct device *dev)
> > > +{
> > > +     return dev_name(dev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rust_helper_dev_name);
> > > +
> > >  /*
> > >   * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
> > >   * use it in contexts where Rust expects a `usize` like slice (array) indices.
> > > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > > index 9be021e393ca..7309a236f512 100644
> > > --- a/rust/kernel/device.rs
> > > +++ b/rust/kernel/device.rs
> > > @@ -4,7 +4,7 @@
> > >  //!
> > >  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> > >
> > > -use crate::bindings;
> > > +use crate::{bindings, str::CStr};
> > >
> > >  /// A raw device.
> > >  ///
> > > @@ -20,4 +20,78 @@
> > >  pub unsafe trait RawDevice {
> > >      /// Returns the raw `struct device` related to `self`.
> > >      fn raw_device(&self) -> *mut bindings::device;
> > > +
> > > +    /// Returns the name of the device.
> > > +    fn name(&self) -> &CStr {
> > > +        let ptr = self.raw_device();
> > > +
> > > +        // SAFETY: `ptr` is valid because `self` keeps it alive.
> >
> > How can self keep it alive?
> >
> > > +        let name = unsafe { bindings::dev_name(ptr) };
> > > +
> > > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > > +        // by the compiler because of their lifetimes).
> >
> > devices are renamed all the time, I don't understand how this can be
> > true here.
> 
> This was discussed before:
> https://lore.kernel.org/lkml/ZAnB%2FDozWsir1cIE@kroah.com/
> 
> I even sent a patch (that Greg applied) that fixes the C comment that
> lead to the safety comment above:
> https://lore.kernel.org/lkml/20230406045435.19452-1-wedsonaf@gmail.com/
> 
> The decision then was to remove the `name` method until some driver
> actually needed it. (We had no plans to upstream the one that used it
> in the rust branch, pl061 gpio.)

Ah, I thought I had reviewed all of this before, thanks for pointing
this out.  And sad that nothing really changed since then, I'll just
ignore all of this thread for now someone figures out how to act on
review comments that are made.

Ignoring them for a year and resending the lot just wastes everyone's
time :(

greg k-h
