Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57A4266B5
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441166; cv=none; b=U3OU29CLnAa77FD/qz7H3FkD05jTmvU3C+lf4hUyVJztxGgD6GzixzrIBc8PmphC5QYhRUXyx89yImuVIOOoLRFaQsis7+0+cTXw+Mru5nV06zOHn+7PsBKxw0uxf+JDUxJMTZo2qZ7KoVayB6Y0/9O8kobq3J4ZXiFvlFggzag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441166; c=relaxed/simple;
	bh=P7MdvFn0nz7qqSukugxeA9OnzGseB4a4JEs1zGcJjII=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sQmxkPux5wGLDEtu14CQgayNflvO99HB5YcUUvvKElVgJ9rap8ijf0vuoWEhxAA8M0nlJgHZyh0O1edsPGTY85FF8DIDaiPvXCJFLZ99cfQrZqIyAjWO6mfBymMI+1bIiPMsEFifymtiHxZ7gbumUfsCN0+u3FxokZ8Iph6v+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=KExhOCxQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="KExhOCxQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so39719625e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1786441163; x=1787045963; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=keOctzNwfNBsLPbe15O/mUE1LNwpA3sYadag5szckvA=;
        b=KExhOCxQAJILW2gJIwDD7mUcjqpwh8TC0JHO0mb1iY6Plq0Mi0qagshnlpU+ghRH01
         KQmJ8j2qo3VyM2KXUP3rwDWcQbaIv/f1XQgXl/bT7sYxKlXs0tKwhCrLsuDtMDvMcQQB
         SOE5iPEpbnS5AQ+sqsCy3gAyPtybqNnfo3/LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441163; x=1787045963;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keOctzNwfNBsLPbe15O/mUE1LNwpA3sYadag5szckvA=;
        b=TpGGA+ScLkHT1/1+gb2KMR2n+CegnDr7y+8lnmfbBABLG8mkP8FKoIz7JS/tPt4dwx
         7q63tanxcn9A9tRtEWRdkrFbM4BPSdPmz8u4YX/1p/dzMPGuOmkXXbcvtp6vWmAuJJ/Z
         TyblsxvEOlhA0LMhCrl8Iifp2Mi2roOnexjeApfRkrCFmwd6TBZPSMaa++k7W+gJPu6D
         QMBPVDAFTQ63Y2t/Ks+RivUFeD2j/h1g0Tp8cV4gAB5FcpsDUT3oe4QPk1q/zlRpUPz2
         zXEi+BE85Fs184FLdl7+E0Z3l5OTyISh3IHJnirzQdkMKtvgN2LcICaoZvd9zt7bxT79
         F5xg==
X-Forwarded-Encrypted: i=1; AHgh+RrT2ezowC/bV9ld+7/zGZKcWSgOIl/IZNaDyqeVF68+oh87cFmm1GaC+Qd85TB0t5d5ncaB3M2QAGA6tn1fsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLx3u2cvi8rit4JVDyAhTxAwuC3Ik2WAkqe7CfLaritszP4IAK
	+ZjL2WmUTG63CCP0sMNz6Vf2ahOSndjdnJ0nnbxHABLLPlQNaHn9tiJsVodNAu6SGoI=
X-Gm-Gg: AR+sD129aDulMeD1TJW4MBMeBt3qJtkCQgI256C7kAo63NPveX9Q7suM/7HasNeu7Br
	TBBlY8pwnLpxz8FfYhMFrRZpBMHDchYIJol/MbasFZOwmU7mMw+NaxdgvqlVM7Jfz9ea0Bhz2FC
	tQaSwRs/2Ow5LRukXpH/9HkFQXZhLe/mQ+UhfYNQz8tNRAgZj4Bf9fDcM1/dB/25xvmaeWoXViG
	QZUqi/xQZsJErPzFFRmSNgYOq5Ru2JuNBk2KpbTw6ibyzr89rdD3TxbkBhMqwgqAWjbIcZt9Lgc
	RzcAZX+/GpjrxpwyM/o6/6vUqTqXMF+7EUMpXBKtuxGmsObKD1JfMb+ydQw6D+XCbQHEctQj/Tr
	EWlkw562vp7omUSSkPC6ClMwK3LoasScKYndMlnnlgLtAW2u7KgkPy1jOXE43Ctnv0qtVlxAx6A
	wv6h66ObPRyfJyvOrmAm4AkkSGSffoWz9DJMjXboW8LbjWm3mG6gxxz8k20HKfnDAyjbJG18OQN
	z4q0fyORYDEMgYuStwRS8tGBALCWus4Ih5kFrouTfsu
X-Received: by 2002:a05:600c:674a:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-499784712bamr36714075e9.17.1786441162514;
        Tue, 11 Aug 2026 02:39:22 -0700 (PDT)
Received: from localhost ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740c4a87sm52930975e9.5.2026.08.11.02.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 12:39:20 +0300
Message-Id: <DKM0JFH8G8U1.16WQSH2AFB1UO@wyliodrin.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] rust: usb: add endpoint abstraction
From: "Alrexandru Radovici" <alexandru.radovici@wyliodrin.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alrexandru Radovici"
 <alexandru.radovici@wyliodrin.com>
X-Mailer: aerc 0.21.0
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-1-655bb444b52c@wyliodrin.com>
 <2026080205-falsify-stalemate-175b@gregkh>
 <DKFBIK6S4RR4.2PB6HTV910C1J@wyliodrin.com>
 <2026080315-detective-cadet-3d6b@gregkh>
In-Reply-To: <2026080315-detective-cadet-3d6b@gregkh>

On Mon Aug 3, 2026 at 4:23 PM EEST, Greg Kroah-Hartman wrote:
> On Mon, Aug 03, 2026 at 03:46:44PM +0300, Alrexandru Radovici wrote:
>> On Sun Aug 2, 2026 at 11:39 AM EEST, Greg Kroah-Hartman wrote:
>> > On Sat, Aug 01, 2026 at 03:01:07AM +0300, Alexandru Radovici wrote:
>> >> Add an abstraction for `struct usb_host_endpoint`, together with the
>> >> accessors needed to reach one: `AlternateSetting` wrapping
>> >> `struct usb_host_interface`, `Interface::alternate_settings()` and
>> >> `Interface::current_alternate_setting()`, and `Device::control_endpoi=
nt()`
>> >> for the default control endpoint, which no interface descriptor lists=
.
>> >
>> > Why?  USB drivers shouldn't be messing with usb_host_endpoint structur=
es
>> > for the most part, what user do you have for this?
>>=20
>> The more I think of this, I think you are right. `HostEndpoint`'s access=
or
>> methods are only used for debug, as the `kernel` crate can access
>> the actual `usb_host_endpoint` underneeth. For debug purposes, we should
>> just derive the `Debug` trait instead.
>
> Great, if it's even really needed.  Let's see how that works out, as I
> don't know what you want to provide for debugging.
>
>> >> `HostEndpoint` is generic over two sealed marker traits,
>> >> `EndpointDirection` and `EndpointTransferType`, whose implementors ar=
e
>> >> 1-ZSTs held in `PhantomData`. An endpoint borrowed from an alternate
>> >> setting starts out generic in both; `as_in()`, `as_out()` and
>> >> `as_control()` check the descriptor once and return a reference
>> >> carrying the corresponding marker, so a function taking
>> >> `&HostEndpoint<In, Bulk>` needs no check of its own. The type is
>> >> `#[repr(transparent)]` over the C struct and the markers are
>> >> zero-sized, so the refinement costs nothing and a slice of endpoints
>> >> can be borrowed directly from the C array.
>> >>=20
>> >> Control endpoints get a distinct `Bidirectional` marker rather than a=
n
>> >> IN or OUT one. A control transfer takes its direction from bit 7 of t=
he
>> >> setup packet's bmRequestType, and USB 2.0 section 9.6.6 defines the
>> >> corresponding bit of bEndpointAddress as ignored for control endpoint=
s.
>> >> `as_in()` and `as_out()` are not implemented for `Bidirectional`, mak=
ing
>> >> calling them a compile error rather than a misleading result.
>> >
>> > Don't over-think USB endpoints, they are "just" a pipe that contain a
>> > numbering scheme that the USB core uses.  Is that what you are trying =
to
>> > create here?  What are you trying to "enforce" here that the C code do=
es
>> > not already do?
>>=20
>> My USB knowledge is limited, so I hope I am not saying something
>> stupid here. My understanding is that drivers should not expect
>> interfaces to map the same endpoints (numbers) every time.
>
> Why not?  Well, they can, or can not, depending on the device, and the
> driver knows this.  For some drivers, a specific endpoint will _ALWAYS_
> be a specific number, while for others, they are dynamically determined.
> It depends on the device/protocol being used.
>
>> A driver should expect an interface to expose a certain number of
>> endpoints, each one with a certain type, but the actual number of each
>> exposed endpoint is not to be considered hardcoded. This means that driv=
ers
>> should anyway iterate over the endpoints to discover the numbers
>> of the required endpoints.
>
> Again, sometimes, but not always.  What a driver SHOULD always do is
> verify that the device is providing the specific number and types of
> endpoints that it is expecting at probe time and call the core to "find"
> the expected endpoints that are present.  In the C api we do that with
> the usb_find_common_endpoints() or the usb_check_bulk_endpoints() type
> functions.
I suggest adding a structure and functions like:

	struct CommonEndpoints {
		bulk_in: Option<HostEndpoint<In, Bulk>>,
		...
	}

	pub fn find_common_endpoints(&self) -> CommonEndpoints;

I can add them in the v2 series of patches, but as there is no
user yet, not sure if I should.
>
>> My idea is to leaverage Rust's type system to prevent users from supplyi=
ng
>> the wrong endpoint type at compile time rather then at runtime. By makin=
g
>> the `HostEndpoint` its own Rust type with no public constructor,
>> users will be forced to iterate the endpoints to discover the correct
>> number for each endpoint that they require. Once they have it, users
>> can hold to the reference as long as the interface is valid.
>
> Having a reference is great, but really, these are things that you
> should just call the core for and get a reference back.  No need for the
> special encoding logic, see how "simple" the C code is for this please.

I started looking closer at the C API, I think I have a better understandin=
g
of what you mean, I need to think a little more about this. The v2 set of
patches will not include these changes yet.

>> By adding the `Dir` and `Type` generic markers, suplying the wrong endpo=
int
>> to a function will be caught at compile time rather than at runtime. Thi=
s
>> should hopefully shorthen the debug work needed for a driver, as some of
>> the errors become impossible.
>
> functions should be taking any "type" of endpoint as this will be
> checked when the USB core actually submits the data to the device, so no
> driver will get very far if all is not correct.  No real need to attempt
> to provide many different types and check it all in the api as the api
> needs to handle all endpoint types, right?
I still think that this can be checked at compile time and should be.

>> As endpoint 0 is always provided and basically _almost hardcoded_``, I a=
dded
>> the `control_endpoint` function.=20
>
> That's great, but again, we "know" what that endpoint type is, and it
> will be used for both read and write operations, BUT you need to specify
> it somehow which way you want that operation to happen when you make the
> API call, right?

For control endpoints, I guess this is done by the names of
the `control_message_...` functions. They both take the
same endpoint, and use it in different ways.

For Bulk and Interrupt transfers I would add API like:

	trait UsbMessageSend<Type> {
		fn message(&self, endpoint: HostEndpoint<Out, Type>, data: &[u8]) -> Resu=
lt<...>;
	}

	trait UsbMessageReceive<Type> {
		fn message(&self, endpoint: HostEndpoint<In, Type>, data: &mut [u8]) -> R=
esult<...>;
	}

	and implement these for usb::Interface for Bulk and Interrupt.

Users will just call

	intf.message(endpoint, data)

and the compiler will select the correct function. There is no way a
user could use an endpoint in a wrong way.

This API is somehow in line with what nusb does.
https://docs.rs/nusb/latest/nusb/

I am not sure yet how to implement this for Isochornous transfers.

> I would recommend actually porting/writing a USB driver using the apis
> while you are attempting to make these bindings, as I think a lot of
> these issues will fall out automatically when doing so.  USB really
> isn't that complicated, it's just a dumb and slow "pipe" that for every
> message, is triggered by a host request, no matter which way the data is
> flowing.

I am porting usbsevseg.c and I'll send the v2 version of these patches that
include all the infrastructure needed to port the driver.

> thanks,
>
> greg k-h

