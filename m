Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C7723B0;
	Fri, 24 Jan 2025 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737715961; cv=none; b=fQ0CMralag6eefyacsDUCOgFSuLcoO0zLOiLkSJg3pYHOJMNbUk89au9Tj24zJB/SIj86N1WRDPzXuBaKdQhiCb9sPmVIwsVarbxjOAePC5elvbMx41jB40cLvOVGxQyxO7hAJI/2KUJNb8xAnHi1FCfZApMwWDAAQVRh9FkIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737715961; c=relaxed/simple;
	bh=5SmoWd1KOkPRVTYrOJl9e+LTJcRHO+4cfzNvK9ZYpcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUYqxQ5UgLy3/SiaAoKlDLiE0dlifYQRnxF1D9vAijPZSt8jnShjjd32oHZ6MGAlq187Q3VQhxftiA6tnGckziszIzATuqjZMzptNyRtuY3AmHGGaWlevnBuODdk+Wu2z2ydo96cMdtsKReMsfCfJyjBT3IIVzmgn/XgJNJyePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuTZVN7R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuTZVN7R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF025C4CED2;
	Fri, 24 Jan 2025 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737715960;
	bh=5SmoWd1KOkPRVTYrOJl9e+LTJcRHO+4cfzNvK9ZYpcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuTZVN7RWxhwVjpEFqulZPyjexDPUdcW4XjMKGCYvKpEkbC9l9LLSb3NYqlq4T39M
	 bcZcleuFyyfPGON1/4+X0HeZwtqdZiyJpFPz+KckuGKPlk79L6T6uYQKmGZhNtualJ
	 D16DEvuRpnun36RUwe9QKGC+QNYrsgWXaTI6GwOKCBWcHdrZYeba2EHFyF37lIwCZo
	 LVvLd7tAFqPGynE257OGUkOI5gGCc5IcBkZgIGO7hyJCMupQaY1AAS6Ef9UT7sfszE
	 Z9G2tFNl74EXCJoSgP50XU83P73/tHIQKOLmGyTH/MB5jJdLfpUQ7yHSdJqtA9dMNp
	 nlpCcsZgDsMOQ==
Date: Fri, 24 Jan 2025 11:52:34 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <Z5Nw8kaieLueWyUu@pollux>
References: <20250122235340.2145383-1-lyude@redhat.com>
 <20250122235340.2145383-3-lyude@redhat.com>
 <2025012329-candied-walk-f57d@gregkh>
 <Z5IYKJXuk1vcs4Xo@pollux.localdomain>
 <2025012342-zen-luminance-094c@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025012342-zen-luminance-094c@gregkh>

On Thu, Jan 23, 2025 at 03:17:23PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 23, 2025 at 11:21:28AM +0100, Danilo Krummrich wrote:
> > On Thu, Jan 23, 2025 at 07:23:08AM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Jan 22, 2025 at 06:49:22PM -0500, Lyude Paul wrote:
> > > > A number of kernel modules work with virtual devices, where being virtual
> > > > implies that there's no physical device to actually be plugged into the
> > > > system. Because of that, such modules need to be able to manually
> > > > instantiate a kernel device themselves - which can then be probed in the
> > > > same manner as any other kernel device.
> > > > 
> > > > This adds support for such a usecase by introducing another platform device
> > > > type, ModuleDevice. This type is interchangeable with normal platform
> > > > devices, with the one exception being that it controls the lifetime of the
> > > > registration of the device.
> > > 
> > > Sorry, but a "virtual" device is NOT a platform device at all.  Platform
> > > devices are things that are not on a real bus and are described by
> > > firmware somehow.
> > > 
> > > The kernel has "virtual" devices today just fine, look at
> > > /sys/devices/virtual/ so why not just use that api instead of making up
> > > something new?
> > 
> > I think we briefly discussed this in another mail thread [1] for the example of
> > the vKMS driver [2] in the past.
> > 
> > In [1] you mentioned that with the virtual device API, things are a bit
> > inconvenient and that you want to follow up on this.
> 
> And my intern ended up doing other things last summer and never got to
> this, sorry.  I've not had the time either.  Let me try to get to it
> next week, but no promises...
> 
> But that doesn't excuse the abuse of platform devices, that's not ok,
> and I'm not going to want to take this change at all, sorry.

It does not, indeed. That's not what I wanted to imply.

I brought it up to see if there has been any progress already that can be built
upon.
