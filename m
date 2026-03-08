Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5962D7BF;
	Sun,  8 Mar 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772953728; cv=none; b=YD20ye782DY1UUDku0zVtQjRpjbbMbnmG/2/vKuUVYaJWes0MXUU2Tyrj63/jHUafADB+3Buqzfc6nuLXOfwBqD6imvpUiQCp2Gbmu0fQTwMYDvtY/z9nCzmCiSJRSJdI8YZW7aNmHWLLbWkhXmwKPI1e8B2PiddCdF+yCx7Cmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772953728; c=relaxed/simple;
	bh=RR9kC2pmD/+qUq+s4hglANy7KP5UzDgKoohyFVfW7c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFzPcHDNBcAs7ljqSdaNcxr+RKbrfRtJbD94nwXo6lxtMvc+2xD4JNXTO4UPAd+HlA0IBFn0dcf6zkZ+kpKYMnTigfrRSl9tF31wSkQR1TmBhslLTaMj9/O0iolrmP4ZXRlH2DPj4iriiQ9WjmwjgO4iNVuMo9Z69mJ1VZQWkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jkzLRa0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jkzLRa0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753F4C116C6;
	Sun,  8 Mar 2026 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772953728;
	bh=RR9kC2pmD/+qUq+s4hglANy7KP5UzDgKoohyFVfW7c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkzLRa0mzUzscmKtkbUh6z3HiFFyoSg+AmQSVcZ9QKEtTSoFU/Ur6JEELImQMsnj5
	 Vkq8D8O+wd9p8r+HqU4fHwoymdI3vksnSGh8iFMk25oMMCh1px81D/6dsmmQ7ZvDey
	 3mDhRq8gzlc/S65wIlKB2F3WiVl7cUljrgF6Kw8c=
Date: Sun, 8 Mar 2026 08:08:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: Add initial synology microp driver
Message-ID: <2026030842-stained-semantic-6cbb@gregkh>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
 <20260306-synology_microp_initial-v1-2-fcffede6448c@posteo.de>
 <2026030742-concave-dastardly-801e@gregkh>
 <938755087c25b0b4eb6e32b84c1dd25cc2d71439.camel@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <938755087c25b0b4eb6e32b84c1dd25cc2d71439.camel@posteo.de>

On Sat, Mar 07, 2026 at 12:58:31PM +0000, Markus Probst wrote:
> On Sat, 2026-03-07 at 08:15 +0100, Greg Kroah-Hartman wrote:
> > On Fri, Mar 06, 2026 at 07:38:30PM +0000, Markus Probst wrote:
> > > Add a initial synology microp driver, written in Rust, to the staging tree.
> > > The driver targets a microcontroller found in Synology NAS devices. It
> > > currently only supports controlling of the power led, status led, alert
> > > led and usb led. Other components such as fan control or handling
> > > on-device buttons will be added once the required rust abstractions are
> > > there.
> > > ---
> > >  MAINTAINERS                                        |   6 +
> > >  drivers/staging/Kconfig                            |   2 +
> > >  drivers/staging/Makefile                           |   1 +
> > >  drivers/staging/synology_microp/Kconfig            |   4 +
> > >  drivers/staging/synology_microp/Makefile           |   2 +
> > >  drivers/staging/synology_microp/TODO               |   8 +
> > >  drivers/staging/synology_microp/command.rs         |  48 +++++
> > >  drivers/staging/synology_microp/led.rs             | 229 +++++++++++++++++++++
> > >  drivers/staging/synology_microp/synology_microp.rs |  73 +++++++
> > >  rust/uapi/uapi_helper.h                            |   2 +
> > >  10 files changed, 375 insertions(+)
> > 
> > No signed-off-by?
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

That has to go into the real part of the patch :)

> > 
> > And why staging?  That's for stuff that needs obvious cleanups done to
> > it, you don't list that here.
> Because the driver is not done yet. There are components that do not
> exist yet, because the rust abstractions are missing.

That is not what staging is for, sorry.  Please just work to get the
driver working properly and merge it to the correct location first.

thanks,

greg k-h
