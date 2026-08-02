Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09623909A4;
	Sun,  2 Aug 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660078; cv=none; b=mMCvPciD5ZDQ9qOqSJy0r402PoF1dPKSr6vc14Zj8eoya781W1k6DaixAydUjf1lRxAdk9WTqBTO9ieNeqoKz4L8Kb9U3gPcfB61B13EusKTEDrEqFVli38Xrj1fuOdP2T6Lc7f74ounjNy37rL2zGoIcTUa+UXpMEETL1TrfvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660078; c=relaxed/simple;
	bh=sz3ZY5jc70+A6sPlXIERJcepPzsWc5VTzUJzQEUCm7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8FXq7Y/JyKIVeck+PZpDFvGr9ZJ6qjZBLwDmp64AMbSCJDPmOFqdYdEhtiAq+TPqX5DmDJa+G9xeOfdbTzsFoN8RqlzVa66Wa0m9RIg+7IbT5Qnio/NByQPOnURikVRvXNwoFUt1RgxtuAzf6FpOCtiimv8bQr7QGJyx9R3oNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QNrpjQlm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QNrpjQlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BE21F00AC4;
	Sun,  2 Aug 2026 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785660076;
	bh=LP+xGuOirTyq9Ob92FPWuGnj3Wd1osEGtU6OKAF+RZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QNrpjQlmIHBKbPH84f7RMOOQMZhCMBELGF79hA4XWb+OEDr6ngzlTUtl2uh/5eqCi
	 cisuC0+fEiLEGehGwrMpRiVcqM9lW/bF4YJaypg2HqalTSk1on/nixQ1u4i+bb4pWX
	 efHs7V+Swl/ayQ09wush93Gju5fNyeb8nS5X99KU=
Date: Sun, 2 Aug 2026 10:39:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] rust: usb: add endpoint abstraction
Message-ID: <2026080205-falsify-stalemate-175b@gregkh>
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-1-655bb444b52c@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-rust-usb_control_msg-v1-1-655bb444b52c@wyliodrin.com>

On Sat, Aug 01, 2026 at 03:01:07AM +0300, Alexandru Radovici wrote:
> Add an abstraction for `struct usb_host_endpoint`, together with the
> accessors needed to reach one: `AlternateSetting` wrapping
> `struct usb_host_interface`, `Interface::alternate_settings()` and
> `Interface::current_alternate_setting()`, and `Device::control_endpoint()`
> for the default control endpoint, which no interface descriptor lists.

Why?  USB drivers shouldn't be messing with usb_host_endpoint structures
for the most part, what user do you have for this?

> `HostEndpoint` is generic over two sealed marker traits,
> `EndpointDirection` and `EndpointTransferType`, whose implementors are
> 1-ZSTs held in `PhantomData`. An endpoint borrowed from an alternate
> setting starts out generic in both; `as_in()`, `as_out()` and
> `as_control()` check the descriptor once and return a reference
> carrying the corresponding marker, so a function taking
> `&HostEndpoint<In, Bulk>` needs no check of its own. The type is
> `#[repr(transparent)]` over the C struct and the markers are
> zero-sized, so the refinement costs nothing and a slice of endpoints
> can be borrowed directly from the C array.
> 
> Control endpoints get a distinct `Bidirectional` marker rather than an
> IN or OUT one. A control transfer takes its direction from bit 7 of the
> setup packet's bmRequestType, and USB 2.0 section 9.6.6 defines the
> corresponding bit of bEndpointAddress as ignored for control endpoints.
> `as_in()` and `as_out()` are not implemented for `Bidirectional`, making
> calling them a compile error rather than a misleading result.

Don't over-think USB endpoints, they are "just" a pipe that contain a
numbering scheme that the USB core uses.  Is that what you are trying to
create here?  What are you trying to "enforce" here that the C code does
not already do?

thanks,

greg k-h
