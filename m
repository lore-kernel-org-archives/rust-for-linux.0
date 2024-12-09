Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDCA3597B
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733762288; cv=none; b=TC9P+wSYvaOKnT6vm6iAPMR4HTXaGKl/0zI7LbNT3OY6Aqog+dj85FwQWyC5CgYJ3YbRbcyNIaHijYf9q3MUdY2+mXMkmM4Kg8JJQkoU1a4DBMm2M1k8dTcgsgATXFqVomXFBWVcxxqu1lKtMYDiOYW4/hEPyF0XwL/JkkY5zds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733762288; c=relaxed/simple;
	bh=xeuCxbmRavI8KLbWHJTI/n1oat/t1DTH2amnkL/h/Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsY8yRrv553lfJZsSRz0xgdGduhqVtYK+N+i1XwWvtgqdTCeXdgPv3S1TNo6TNx7tQfX7skohR+cF8toyX4oPNyLcWdQff2D3BM7caC4gYvW5KdQJ8oKLhbKPQDjMKVUCL/tlPzJJc+BruULyobYouXNLNFwbMH1f5g5KDiTwWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fQeSXUt1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fQeSXUt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A96AC4CED1;
	Mon,  9 Dec 2024 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733762287;
	bh=xeuCxbmRavI8KLbWHJTI/n1oat/t1DTH2amnkL/h/Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQeSXUt1AnGn+xxUcpP5n/Y62pgZ5PYbqCvmddga7mHW1402pLZEOw2so2wSPNIwU
	 gMCRo6EMK5HMC3TuiMNEsOK1mf1zmqtiJIliY20lKJXGw5879eL/4K8W5Qe2Yw+vmG
	 0hMCqOKuVj+eU7V+/H5N0fFUZ7dRE3fLuqjeWyOo=
Date: Mon, 9 Dec 2024 17:38:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] rust abstractions for interacting with sysfs
Message-ID: <2024120958-antihero-slideshow-e30b@gregkh>
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <2024120851-drowsily-anymore-52f7@gregkh>
 <dab64690-ec96-4980-81e7-aae87b53dc02@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dab64690-ec96-4980-81e7-aae87b53dc02@sedlak.dev>

On Mon, Dec 09, 2024 at 05:12:44PM +0100, Daniel Sedlak wrote:
> 
> On 12/8/24 2:34 PM, Greg KH wrote:
> 
> > > I implemented a sample to present the API I have chosen for the Rust part.
> > > It is a straightforward example that does not represent all capabilities
> > > of the sysfs. The documentation will be potentially improved, but I would
> > > like to first settle the abstractions.
> > 
> > What exactly do you want to represent in sysfs here?  Start with that
> > and we can work backwards to say what types of bindings are needed.
> 
> Great question, I should have started with that earlier. Lets say I wrote a
> module that attaches some hooks to kernel function calls and the module does
> some accounting on that.

Modules do not add hooks to function calls :)

> What is the correct way to expose the statistics
> from that module?

debugfs.

> From my point of view this module does not fit into any
> subsystem already defined in `/sys/`, and procfs should be abandoned. Should
> I use debugfs for that?

As it sounds like you are attempting to be a "security module", just use
securityfs instead.

And really, don't hook function calls, or if you must, just use ebpf and
the functionality it provides (all the stats you could ask for!)  No
need to write a kernel module at all.

sysfs is for drivers and the devices they bind to (and devices that do
not have drivers) and sometimes filesystems and occasionally memory
stuff as well (mm is really just a driver for memory).  Don't use it for
things it is not designed for (i.e. module-wide things.)

thanks,

greg k-h
