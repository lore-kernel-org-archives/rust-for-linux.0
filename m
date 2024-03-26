Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBA484D0D
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711476752; cv=none; b=qigk3SnnB6x4reOLM49w7YlgCSrxFwJjiatPPq+O8XzoUHzLzaK8Z7qcmm9OCxMT5t2TvbKoVvDeRP7W1ecBKUvU53aXunhniG8lT1V9MaNhB/tKKFNhfqPOhC0OZjnaqZsj/b55zEUvLK5IRIx8SYgWhDzxT1Rv27Mjyc2h16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711476752; c=relaxed/simple;
	bh=tvZlvBxN8WCwBrVzdVVcys94yolLf+AMzjpfCPywZzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7Sbd6OQqCTevmscP/bNXccTsd6W19tfMxJymnGs3we0gTlm5pfhAGdWm2XA7pbswxOQFX2LIL7gbojVTJawAxzm9ERTHRaNw+nt41t9/3w4hnZgV05JZiTJanTvXfL4FsaKkzClurhQ+yPSSpCyrpvqswiBy6B8iTyLDFBIlf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k+S0ZA/5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k+S0ZA/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EDAC433C7;
	Tue, 26 Mar 2024 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711476751;
	bh=tvZlvBxN8WCwBrVzdVVcys94yolLf+AMzjpfCPywZzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+S0ZA/5elJS9lf9z+fL0HfIkTss5j33U42m3NrYGn/zWWeT2pN3tich9iPD+xkjp
	 b+VKv2uKMIi2D26VC/73Z4F0GK4j9ZhyhVemeow0g25oz54biFsWm44utMicqvCNHZ
	 kdfLZ3oFeHD0MOGEz2ko5Iue4iwgColkwHz2Ks+w=
Date: Tue, 26 Mar 2024 19:12:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 8/8] rust: add device::Data
Message-ID: <2024032651-chrome-museum-7027@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-9-dakr@redhat.com>
 <2024032509-tanned-calamity-4e1c@gregkh>
 <ZgL9u-L1T_J1UZLt@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgL9u-L1T_J1UZLt@pollux>

On Tue, Mar 26, 2024 at 05:54:19PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 25, 2024 at 07:21:04PM +0100, Greg KH wrote:
> > On Mon, Mar 25, 2024 at 06:49:12PM +0100, Danilo Krummrich wrote:
> > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > 
> > > This allows access to registrations and io resources to be automatically
> > > revoked when devices are removed, even if the ref count to their state
> > > is non-zero.
> > 
> > So it's re-implementing the devm_*() calls?  Why?
> 
> It's not. Taking IO resources as an example it's more a generalization of what
> e.g. DRM solves with drm_dev_unplug() and drm_dev_{enter,exit}().

That is a drm specific way to handle devm_* stuff, right?

If that is to be "baked" into different bus types, great, let's make it
a bus-specific thing and put it in the driver core, but don't make it
something that is tied to rust devices only as that feels odd, right?

Also, work with the patterns we have, don't create new ones as that just
causes confusion for all of us working on this part of the kernel.

> While devm_*() ensures to, for instance, iounmap() a mapping when a device is
> detached, the Revocable<> resource ensures that a driver can't access the
> pointer pointing to the just unmapped memory anymore.

Great, this is something that we have been asking for in a generic way
for all drivers/devices in the kernel (see the many talks over the past
years at conferences about it.)  Please work with the developers who are
doing this in the .c side to be sure that things are aligned properly to
work the same.

> So, this isn't something that replaces devm_*(), but kinda builds on top of it.

Perhaps document it that way?

> For instance, we could call Revocable::revoke() from a devm_*() callback.
> However, and that' what this patch currently does for simplicity, we could also
> just call it from the corresponding driver's remove() callback.

If that's the proper place for that, yes.  It could be the proper place
is in the close() system call as well, right?  But again, document it to
explain what this is please, as it was not obvious at all.

> > And this will trigger only on remove, but which remove?  The bus remove?
> > Or the unbinding of the driver to the device (two totally different
> > things, be specific and very careful here.)
> 
> The above comment says "device remove", maybe say device / driver detach
> instead?

It depends on what you mean.  Those are different things, as explained
in other places.  Where do you want this to happen?  Where should it
happen?  And why in only those places?

> > > +/// Device data.
> > > +///
> > > +/// When a device is removed (for whatever reason, for example, because the device was unplugged or
> > > +/// because the user decided to unbind the driver), the driver is given a chance to clean its state
> > > +/// up, and all io resources should ideally not be used anymore.
> > 
> > Wait, unplugging a device and unbinding a device from a driver are two
> > totally different things, do NOT get them mixed up or assume that they
> > are the same thing at all please.  They have different lifetime rules
> > and different patterns of what happens.
> 
> I think the comment does not claim that device unplug and device / driver
> unbind are the same thing. I rather think in this context the expection is that,
> ultimately, both result into the fact that the corresponding device resources
> are not available anymore and hence shouldn't be used anymore. Where the latter
> is enforced by using Revocable<>.

But those are different things happening, and different things happen to
the objects when those different things happen, so while a driver might
seem to see the same thing happen from its point of view, the lifespan
of the object itself is VERY different here (could be passed back to the
driver, could be freed, could be sent to a different driver, could just
be ignored for a long time, etc.)

So be specific as to what viewpoint you are considering here, a device
object has a lifespan that greatly exceeds that of just the window where
a driver happens to see it :)

> > So this needs to be taken out and rewritten from the beginning please.
> > If the comments describe something that is incorrect, I can't trust that
> > the code is correct...
> 
> Not sure the comment is actually claiming something incorrect. If, with the
> above explanation, you still think so, please let me know how to phrase it
> correctly, such that I can improve this patch accordingly.

Please step back and try to determine what you want here.  How devices
are created, assigned, reassigned, removed, renamed, destroyed, etc.
They have a well known "phase of life" and one that different parts of
the kernel sees in different ways (driver core, busses, classes,
drivers, userspace, etc.)  Be aware of what you are wanting to do here,
and who is acting on the structure where and what they are wanting to do
with it.

thanks,

greg k-h
