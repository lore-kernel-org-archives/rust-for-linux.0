Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325862D3739;
	Mon,  3 Aug 2026 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763457; cv=none; b=msOdHLKhqQsiIditfxX4ZphgVh5B9QPWAeEpi6Bwkrwh8tsBqSdV6RhDaETedEC1LA0jTJtLHIiqtQQ8zIgDetpFxW+COpM6xqnxL07/Hpkwl/DC3ojBeo6vwzWdpr1o3j33ReUeAXjz4KEllbTIddkNJ5Rq6+e/1hzTAvYVfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763457; c=relaxed/simple;
	bh=io70q+vRuGk3N5ExD5UOvCDVL7S+IOqFzLmaleXV1fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zf3xZ7JESP+SjGvrFbRRsSMGmtjKgBZCLcJbOxfqBPGZ8MCpBx/eyghXTtLrdidu/0G5hurhWb1Q6l5m+6COOUttEqlHMIvn3UNTdaTycx5owbpZLdh3fkAiMdoGwsHZtPkiNJN/sEpthReOfOSZArSJeSX4UwoYHf58H8cQsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KvHjvcLW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KvHjvcLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4821F00A3A;
	Mon,  3 Aug 2026 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785763448;
	bh=BTw1PP4fGyh+lRmHukTr2trbQrcwcQX1uZG9P9Zp3Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KvHjvcLWDOOyMJ33VGFRUfBVCf6m6vjo7KffKuOiA7h43lMQChtX3FNKhtybT7a4Y
	 GlHjVfUTxvaOSC77/XLoj/0Nh+cuOafK+wyHj0wa3vx39joWhjDwROIzhpx2kt7YgT
	 zxWBCP0UX4VSUMQW8w2rlv/yhxLzdq9wqbYThEMw=
Date: Mon, 3 Aug 2026 15:23:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alrexandru Radovici <alexandru.radovici@wyliodrin.com>
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
Message-ID: <2026080315-detective-cadet-3d6b@gregkh>
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-1-655bb444b52c@wyliodrin.com>
 <2026080205-falsify-stalemate-175b@gregkh>
 <DKFBIK6S4RR4.2PB6HTV910C1J@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKFBIK6S4RR4.2PB6HTV910C1J@wyliodrin.com>

On Mon, Aug 03, 2026 at 03:46:44PM +0300, Alrexandru Radovici wrote:
> On Sun Aug 2, 2026 at 11:39 AM EEST, Greg Kroah-Hartman wrote:
> > On Sat, Aug 01, 2026 at 03:01:07AM +0300, Alexandru Radovici wrote:
> >> Add an abstraction for `struct usb_host_endpoint`, together with the
> >> accessors needed to reach one: `AlternateSetting` wrapping
> >> `struct usb_host_interface`, `Interface::alternate_settings()` and
> >> `Interface::current_alternate_setting()`, and `Device::control_endpoint()`
> >> for the default control endpoint, which no interface descriptor lists.
> >
> > Why?  USB drivers shouldn't be messing with usb_host_endpoint structures
> > for the most part, what user do you have for this?
> 
> The more I think of this, I think you are right. `HostEndpoint`'s accessor
> methods are only used for debug, as the `kernel` crate can access
> the actual `usb_host_endpoint` underneeth. For debug purposes, we should
> just derive the `Debug` trait instead.

Great, if it's even really needed.  Let's see how that works out, as I
don't know what you want to provide for debugging.

> >> `HostEndpoint` is generic over two sealed marker traits,
> >> `EndpointDirection` and `EndpointTransferType`, whose implementors are
> >> 1-ZSTs held in `PhantomData`. An endpoint borrowed from an alternate
> >> setting starts out generic in both; `as_in()`, `as_out()` and
> >> `as_control()` check the descriptor once and return a reference
> >> carrying the corresponding marker, so a function taking
> >> `&HostEndpoint<In, Bulk>` needs no check of its own. The type is
> >> `#[repr(transparent)]` over the C struct and the markers are
> >> zero-sized, so the refinement costs nothing and a slice of endpoints
> >> can be borrowed directly from the C array.
> >> 
> >> Control endpoints get a distinct `Bidirectional` marker rather than an
> >> IN or OUT one. A control transfer takes its direction from bit 7 of the
> >> setup packet's bmRequestType, and USB 2.0 section 9.6.6 defines the
> >> corresponding bit of bEndpointAddress as ignored for control endpoints.
> >> `as_in()` and `as_out()` are not implemented for `Bidirectional`, making
> >> calling them a compile error rather than a misleading result.
> >
> > Don't over-think USB endpoints, they are "just" a pipe that contain a
> > numbering scheme that the USB core uses.  Is that what you are trying to
> > create here?  What are you trying to "enforce" here that the C code does
> > not already do?
> 
> My USB knowledge is limited, so I hope I am not saying something
> stupid here. My understanding is that drivers should not expect
> interfaces to map the same endpoints (numbers) every time.

Why not?  Well, they can, or can not, depending on the device, and the
driver knows this.  For some drivers, a specific endpoint will _ALWAYS_
be a specific number, while for others, they are dynamically determined.
It depends on the device/protocol being used.

> A driver should expect an interface to expose a certain number of
> endpoints, each one with a certain type, but the actual number of each
> exposed endpoint is not to be considered hardcoded. This means that drivers
> should anyway iterate over the endpoints to discover the numbers
> of the required endpoints.

Again, sometimes, but not always.  What a driver SHOULD always do is
verify that the device is providing the specific number and types of
endpoints that it is expecting at probe time and call the core to "find"
the expected endpoints that are present.  In the C api we do that with
the usb_find_common_endpoints() or the usb_check_bulk_endpoints() type
functions.

> My idea is to leaverage Rust's type system to prevent users from supplying
> the wrong endpoint type at compile time rather then at runtime. By making
> the `HostEndpoint` its own Rust type with no public constructor,
> users will be forced to iterate the endpoints to discover the correct
> number for each endpoint that they require. Once they have it, users
> can hold to the reference as long as the interface is valid.

Having a reference is great, but really, these are things that you
should just call the core for and get a reference back.  No need for the
special encoding logic, see how "simple" the C code is for this please.

> By adding the `Dir` and `Type` generic markers, suplying the wrong endpoint
> to a function will be caught at compile time rather than at runtime. This
> should hopefully shorthen the debug work needed for a driver, as some of
> the errors become impossible.

functions should be taking any "type" of endpoint as this will be
checked when the USB core actually submits the data to the device, so no
driver will get very far if all is not correct.  No real need to attempt
to provide many different types and check it all in the api as the api
needs to handle all endpoint types, right?

> As endpoint 0 is always provided and basically _almost hardcoded_``, I added
> the `control_endpoint` function. 

That's great, but again, we "know" what that endpoint type is, and it
will be used for both read and write operations, BUT you need to specify
it somehow which way you want that operation to happen when you make the
API call, right?

I would recommend actually porting/writing a USB driver using the apis
while you are attempting to make these bindings, as I think a lot of
these issues will fall out automatically when doing so.  USB really
isn't that complicated, it's just a dumb and slow "pipe" that for every
message, is triggered by a host request, no matter which way the data is
flowing.

thanks,

greg k-h
