Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1213212A;
	Thu, 23 Jan 2025 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641846; cv=none; b=qQAdwFzL4amtvqrzAcWmCGzHRdMHdJ/nGXgZEGkHso2omDgpop1QdwPKnEBgdkL32Ow0YyUyG7d3xaKGPx2pJx1YXjjPIQAZJTUg/8w07saIuTcrdy6ltyVlxEon0XGe2q5jy4zdB5GLbj4Sr587vAILWA66devhkR5wb1IvRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641846; c=relaxed/simple;
	bh=fD8QbZo0MTZTCdtj1/y91kr+HFRSi3so1dvKDEu/s2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQnZfidk2/Pac+CQglqEWcEU9WUnOEixV7xr9F2xWFToFLsunAgCL++SlZ+uwfb9U4KMCfFxhqj0VPE9s1R++XJqv1RH/mF94EooJ6WfKQYRgIJ6/fMYstRxQNh43uchJLIJ3+IXsc3+scPE68ERB4l8n/UL2UjokSvXjiduVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LETWbbla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LETWbbla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC0FC4CED3;
	Thu, 23 Jan 2025 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737641846;
	bh=fD8QbZo0MTZTCdtj1/y91kr+HFRSi3so1dvKDEu/s2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LETWbblamQIIRC1mxXgA6mhDpmn18ojcn5FcicAp5ocBG7XaXWqLSeL4S+bjWCfQn
	 o7aADE8igBsG5tKBxFM7EkgQrEZNHiK/f+axPhfB9wcO6JOXZ0OasQS4676evGRRS8
	 FXm4KYG/DXdJ/PkO6x2+2NmVEQGLbT1PZMl07b4o=
Date: Thu, 23 Jan 2025 15:17:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 2/2] rust/kernel: Add platform::ModuleDevice
Message-ID: <2025012342-zen-luminance-094c@gregkh>
References: <20250122235340.2145383-1-lyude@redhat.com>
 <20250122235340.2145383-3-lyude@redhat.com>
 <2025012329-candied-walk-f57d@gregkh>
 <Z5IYKJXuk1vcs4Xo@pollux.localdomain>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5IYKJXuk1vcs4Xo@pollux.localdomain>

On Thu, Jan 23, 2025 at 11:21:28AM +0100, Danilo Krummrich wrote:
> On Thu, Jan 23, 2025 at 07:23:08AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Jan 22, 2025 at 06:49:22PM -0500, Lyude Paul wrote:
> > > A number of kernel modules work with virtual devices, where being virtual
> > > implies that there's no physical device to actually be plugged into the
> > > system. Because of that, such modules need to be able to manually
> > > instantiate a kernel device themselves - which can then be probed in the
> > > same manner as any other kernel device.
> > > 
> > > This adds support for such a usecase by introducing another platform device
> > > type, ModuleDevice. This type is interchangeable with normal platform
> > > devices, with the one exception being that it controls the lifetime of the
> > > registration of the device.
> > 
> > Sorry, but a "virtual" device is NOT a platform device at all.  Platform
> > devices are things that are not on a real bus and are described by
> > firmware somehow.
> > 
> > The kernel has "virtual" devices today just fine, look at
> > /sys/devices/virtual/ so why not just use that api instead of making up
> > something new?
> 
> I think we briefly discussed this in another mail thread [1] for the example of
> the vKMS driver [2] in the past.
> 
> In [1] you mentioned that with the virtual device API, things are a bit
> inconvenient and that you want to follow up on this.

And my intern ended up doing other things last summer and never got to
this, sorry.  I've not had the time either.  Let me try to get to it
next week, but no promises...

But that doesn't excuse the abuse of platform devices, that's not ok,
and I'm not going to want to take this change at all, sorry.

Again, if anything, we should be using LESS platform devices in the
kernel, not more.  And especially never using them for devices like this
that are NOT a platform device at all.

thanks,

greg k-h
