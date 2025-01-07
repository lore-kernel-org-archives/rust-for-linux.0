Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC8F1547D2;
	Tue,  7 Jan 2025 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244300; cv=none; b=U+kKB6jB+xKAvJ5NSc2xIjDmZFSKrRSEms4ItfasU+d0lSRKuINvZJQbgra0xQdWKssdHb6LUcwq3rvKtfOKNFvKkew/g0aRAZroLTblzx35yVzt7KrEb9X15sdcW37CxJL/PUuMTOvmbZAMFAhxqyZbf9fLtoaqmH/57f+2PUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244300; c=relaxed/simple;
	bh=nKpS8kA19i8oiCGofhEwpxJUD9Z7a2SLYBoSmVQUzyw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8Vn2HC+tFue6WuHKL/fT9hL+GTJJcaxluUmaRRj00GYLXZSGlZXVGIkK0p+4V580os6WVpRcGENyOeY/7JyHAoSlji/0bPZaN06a6oDMsCtdJyC/1dmcK2EXJqk//1GwEjLBksOg7fqMQAagaj+s2/3Ib8hCDReNbPsmReUxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alybgoLV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alybgoLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA25C4CEE0;
	Tue,  7 Jan 2025 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244299;
	bh=nKpS8kA19i8oiCGofhEwpxJUD9Z7a2SLYBoSmVQUzyw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=alybgoLVcGoIr+BE/KgoXWH6JGqr2xzvg2CXpjiBHTlSFnitLG5z53f4ETLunYjKq
	 Q/GfgPU5kq+k2cmZkKvGCUrg47KRgSwnvP2eoRW4BB4qnUI+Bcpe8NmJbLbeVf1p+U
	 BgDQAuy8BYti8ZG1V5VFO7j+O+N5O1ObI8/VQAvyTeaxkAifNSpICOGBatpn2mkbPX
	 7HwzJ8ZL1vR8bWEJKg7Tn9XFNyggCJ3jwZJnEqwfhaUixjfDHFk/h331Ey0frwPMvr
	 m6ttHZwYVdazlhgoEBao9sH9xAOq8PLTDVR+LRGq9S5tBU6bM5AbLBpOJvLYltIOyS
	 CY3sKHalchLVw==
Date: Tue, 7 Jan 2025 11:04:53 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] devres: add devm_remove_action_nowarn()
Message-ID: <Z3z8Ra2PUQjL91kn@pollux>
References: <20250103164436.96449-1-dakr@kernel.org>
 <Z3vC6MzIG7zN8zBT@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3vC6MzIG7zN8zBT@phenom.ffwll.local>

On Mon, Jan 06, 2025 at 12:47:52PM +0100, Simona Vetter wrote:
> On Fri, Jan 03, 2025 at 05:44:30PM +0100, Danilo Krummrich wrote:
> > devm_remove_action() warns if the action to remove does not exist
> > (anymore).
> > 
> > The Rust devres abstraction, however, has a use-case to call
> > devm_remove_action() at a point where it can't be guaranteed that the
> > corresponding action hasn't been released yet.
> > 
> > In particular, an instance of `Devres<T>` may be dropped after the
> > action has been released. So far, `Devres<T>` worked around this by
> > keeping the inner type alive.
> > 
> > Hence, add devm_remove_action_nowarn(), which returns an error code if
> > the action has been removed already.
> > 
> > A subsequent patch uses devm_remove_action_nowarn() to remove the action
> > when `Devres<T>` is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  drivers/base/devres.c  | 17 ++++++++++++-----
> >  include/linux/device.h | 18 +++++++++++++++++-
> >  2 files changed, 29 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > index 2152eec0c135..d59b8078fc33 100644
> > --- a/drivers/base/devres.c
> > +++ b/drivers/base/devres.c
> > @@ -750,25 +750,32 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
> >  EXPORT_SYMBOL_GPL(__devm_add_action);
> >  
> >  /**
> > - * devm_remove_action() - removes previously added custom action
> > + * devm_remove_action_nowarn() - removes previously added custom action
> >   * @dev: Device that owns the action
> >   * @action: Function implementing the action
> >   * @data: Pointer to data passed to @action implementation
> >   *
> >   * Removes instance of @action previously added by devm_add_action().
> >   * Both action and data should match one of the existing entries.
> > + *
> > + * In contrast to devm_remove_action(), this function does not WARN() if no
> > + * entry could have been found.
> 
> I'd put a caution here that most likely, using this is a bad idea. Maybe
> something like:
> 
> "This should only be used if the action is contained in an object with
> independent lifetime management, like the Devres rust abstraction.
> Anywhere is the warning most likely indicates a driver bug."

Yes, I thought of something similar too, but wasn't quite sure if it's needed.
At least for me, if something has the postfix "nowarn", it already makes me
wonder if I should really use it.

I'll add a paragraph.

> 
> At least I really can't come up with a reasonable design in a C driver
> that would ever need this.

I tried, but couldn't either. The only thing I could think of was a revocable
thing in C.

> 
> Cheers, Sima
> 
> > + *
> > + * Returns: 0 on success, -ENOENT if no entry could have been found.
> >   */
> > -void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
> > +int devm_remove_action_nowarn(struct device *dev,
> > +			      void (*action)(void *),
> > +			      void *data)
> >  {
> >  	struct action_devres devres = {
> >  		.data = data,
> >  		.action = action,
> >  	};
> >  
> > -	WARN_ON(devres_destroy(dev, devm_action_release, devm_action_match,
> > -			       &devres));
> > +	return devres_destroy(dev, devm_action_release, devm_action_match,
> > +			      &devres);
> >  }
> > -EXPORT_SYMBOL_GPL(devm_remove_action);
> > +EXPORT_SYMBOL_GPL(devm_remove_action_nowarn);
> >  
> >  /**
> >   * devm_release_action() - release previously added custom action
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 667cb6db9019..6879d5e8ac3d 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -399,7 +399,23 @@ void __iomem *devm_of_iomap(struct device *dev,
> >  #endif
> >  
> >  /* allows to add/remove a custom action to devres stack */
> > -void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
> > +int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
> > +
> > +/**
> > + * devm_remove_action() - removes previously added custom action
> > + * @dev: Device that owns the action
> > + * @action: Function implementing the action
> > + * @data: Pointer to data passed to @action implementation
> > + *
> > + * Removes instance of @action previously added by devm_add_action().
> > + * Both action and data should match one of the existing entries.
> > + */
> > +static inline
> > +void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
> > +{
> > +	WARN_ON(devm_remove_action_nowarn(dev, action, data));
> > +}
> > +
> >  void devm_release_action(struct device *dev, void (*action)(void *), void *data);
> >  
> >  int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);
> > 
> > base-commit: 06e843bbbf2107463249ea6f6b1a736f5647e24a
> > -- 
> > 2.47.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
