Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B04EB22
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711477015; cv=none; b=nxy3xm61tv8lFp0TEkbWkLVoDZ981SAt8jk4Ch9NFA9nFxSpXs+0rIN/cs/RR/uAMrOR5Pe8S8S5HT+Ev8n86s2DngqudjtP/5U6LnpiIoZV4bpJ6G0Eaxz5H/2XYVEL3o6PKBU/gaKBFBiOa17JZRim/hp42bWClYKK4JYraXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711477015; c=relaxed/simple;
	bh=M/XLvfoo4/NBo1xyM3EfkcYuf3Krfyx3mp767Pooag4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJTqigEIt+NmcD2JcHp7Oj94JFveOlGSAY7tfkhRQIjkqPtf8RLRfelD23Aggy6tMSp2QZYn806movLG7mpTRkXBvIiq/OH7Y3N6plc3musKb8vGe6Ly9FUsRpfpKQwrDEP1mH0zgfTsa0vReJyrsgkodmUyEaeRBiucg50VLos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DM1t1Z78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DM1t1Z78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A1EC433C7;
	Tue, 26 Mar 2024 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711477014;
	bh=M/XLvfoo4/NBo1xyM3EfkcYuf3Krfyx3mp767Pooag4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DM1t1Z78fiwRSUaVMz+FGm9m5IyKT9eQBvK3epTbAC3ni2zKxvjXai3SM0fGtGPWJ
	 iLfzs/Rx6+wyUmUcAPomu1r7n4bmgyLzkN66xVUVnPMyL2XY3Mle29JXioqtDc727U
	 mCPrNmP8L8VaXtqVSfvxPM2f2SyXKn7TucOB5X3k=
Date: Tue, 26 Mar 2024 19:16:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 7/8] rust: add revocable objects
Message-ID: <2024032637-nervous-blustery-2566@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-8-dakr@redhat.com>
 <2024032514-happier-hazelnut-4b50@gregkh>
 <ZgMA2AFc6mJ8g3RG@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgMA2AFc6mJ8g3RG@pollux>

On Tue, Mar 26, 2024 at 06:07:36PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 25, 2024 at 07:21:32PM +0100, Greg KH wrote:
> > On Mon, Mar 25, 2024 at 06:49:11PM +0100, Danilo Krummrich wrote:
> > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > 
> > > This implements the Revocable and AsyncRevocable types.
> > > 
> > > Revocable allows access to objects to be safely revoked at run time.
> > > 
> > > This is useful, for example, for resources allocated during device probe;
> > > when the device is removed, the driver should stop accessing the device
> > > resources even if other state is kept in memory due to existing
> > > references (i.e., device context data is ref-counted and has a non-zero
> > > refcount after removal of the device).
> > 
> > Again, device removal is different from unbinding a driver from a
> > device.  Please fix this all up.
> 
> I think this isn't an "again", "[PATCH 8/8] rust: add device::Data" actually
> phrased things differently (which indeed isn't great and needs to be fixed).
> 
> This comment indeed implies that device removal actually means unbinding a
> driver from a device. I think "device remove" is meant here as the drivers
> remove() callback is called.
> 
> Your comment seems to imply you have a different understanding of what "device
> remove" means?

Yes, see my other comments.  A device has a lifespan that exceeds that
of a driver, and "remove" does not mean it is gone from the system just
because the remove() callback of a single driver is called.  It still
can, and does, live outside of a driver quite well, and in fact, the
driver is not in control of its lifespan at all!

All a driver can know is that it has a valid reference to a device for
the amount of time from probe() to remove().  Outside of that a driver
can not touch it, BUT the device structure lives on and can do lots of
other things that do not involve the driver at all.

thanks,

greg k-h
