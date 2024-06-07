Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFDA61FDD
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763811; cv=none; b=IbwXmmvUFtDAJI5PX4LI3yLsQKkxGmJHEN5I1n7OAxBTGYe+dEVSnXVr/l0vuTOQELVdO8/V9ez6aZUIW60n3dqh69YMC/6X2U2aLg2cQGFaD/TUt0OS7umJi/KqMLRnzacID/VhNxIYnGzld3RwQUVyO30pwLWMuapjY8WQ6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763811; c=relaxed/simple;
	bh=YfzeRLsrPb0sG0XHT7D/lb7hJ/Tzc0MEHKP5qnE9QTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRUUFBKdXF2CXtBbKdZdoQktyxa6jXqbxLrC95PJJOPSUcZxo3V1wFPjifh92SODER1OLjY3wEZp0zN/VEcfurG5Z0ADhLCKiD6viX8nWH+ZGJzjPdEHCDT9rxgW8U1b0c3uSZz0TKLDIyjCyimdjzep06ajktMOkKIrthDElYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIluzvud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIluzvud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C718C2BBFC;
	Fri,  7 Jun 2024 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717763811;
	bh=YfzeRLsrPb0sG0XHT7D/lb7hJ/Tzc0MEHKP5qnE9QTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIluzvudUyT/th3uIRXHkbu+TCQF0uRlVXQEntbqLEb5F00L6tRRhxaD0gsxcfUB/
	 9hiGd1FmKWACBylKL7bm/s21Gqo7YZ5zfZwxKy61lOpPg61k4BLuFMEE2ILIZNuVrh
	 6BqrGSSIRBSyegQCnU9p76YcnBIxOTWD7Mq39jJg=
Date: Fri, 7 Jun 2024 14:36:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: dakr@redhat.com, wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024060708-residue-hardy-af36@gregkh>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>

On Fri, Jun 07, 2024 at 09:11:32PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Fri, 31 May 2024 11:59:47 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Once we get to a conclusion I can send a series with only the device and firmare
> > abstractions such that we can get them in outside of the scope of the reset of
> > both series to get your driver going.
> 
> Since your discussion with Greg seems to continue for a while, let me
> include the following patch that Greg approved with the next version
> of the PHY driver patchset.

Yes, please take this one now.  We can build on it from there.

I had a meeting yesterday with a lot of rust kernel and userspace people
at Microsoft and talked a bunch about this and how to move forward.  I
think we need to take much smaller "steps" and even encourage most
drivers to start out as a mix of c and rust as there is no real
"requirement" that a driver be "pure" rust at all.  This should both
make the interface logic simpler to start with, AND provide a base so
that people can just write the majority of their driver logic in rust,
which is where the language "safety" issues are most needed, not in the
lifecycle rules involving the internal driver model infrastructure.

Anyway, that's all hand-wavy right now, sorry, to get back to the point
here, again, let's take this, which will allow the firmware bindings to
be resubmitted and hopefully accepted, and we can move forward from
there to "real" things like a USB or PCI or even platform device and
driver binding stuff.

thanks,

greg k-h
