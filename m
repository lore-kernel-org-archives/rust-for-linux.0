Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B9411FA5
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761217; cv=none; b=X4HvCU3uQBaRDG9F/ffH+IPiU4PWFkl61b5jxx9kE/Jk+OIKpq6ozB93Ms2H+FE1K53AC3ggV+/posqAnGtGCp9aBwFSHCYdLKzINuTW3n9INL0luKRG5p962hSw/i+tv1HiczXYW7bYvf5AXUqAGDF16x3BjvgQ5umF8kWEwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761217; c=relaxed/simple;
	bh=3t2Y19LKMm77Slx5NukqzKKFy6+5z1A41mGry0j7HLY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LUf2XGwzytUjBNc0A7pKwtPDIMgSZvyl/daxxaqhDk14Y9Oe2hvCYfByTu6+cOA890trIKXk5RsY8MnUqyHB+TE6v19X36d5uaLf9r2qMAieb56+XYJ4893ZJ9VqK6ttCrGkaQBFViJYEwZ/sr0jhgdM2j9whxKfjbD9C/lnJ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=LvlzEj+u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="LvlzEj+u"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso9706515e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785761214; x=1786366014; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eTIIU0RK6De8tsthf1eFYkTZzNYuQyIWVcByhEPLnjo=;
        b=LvlzEj+utmZe7TfshZDJHNYEQjGPFPwLrfiSYVzqwHM+9C0WbvGt0FTksPy1vx85Zc
         s5QPSZh5uI0lU0zXe9ApobOQyWx6KpIAfwAipsbGyjIBlbjM89LrvRRtrE7r6u8BOcoj
         b/NML6QqiV9XnmrHRsHWVlvCKwdFhIxoz2230=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761214; x=1786366014;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTIIU0RK6De8tsthf1eFYkTZzNYuQyIWVcByhEPLnjo=;
        b=E89x8kGuue9tz0LPSuvwID2bzjsSLqdMFi4zIhorBSRZJHAyiJ/JIhtpvnB5A4roWS
         G731cAnbLSwSaI0gOdi46A1AYWqS+U9N9lwXZzzpq7AiVr+xEULEnB7hKyZ+LMx64WHX
         8f1+HAqGcczp22DvyDNwQWRGl1ic1d88cXEZl4X6JHPKxcDT2umW5j8mCiXhIGRjNu7b
         6vd5JaULd7PAGCxrS277K1he9cotcrC2v3rJUZXnjOpwT4AnvtgZUyDeXmSrxiEQ5ZZc
         esuosvOO6tH+PAiLj3BQVxXSPg08ilDKjeNi5Br0lXJdWk+468DrWsRTvaX6G7HvdOK7
         Qqkg==
X-Forwarded-Encrypted: i=1; AHgh+RolUXXQo4dEi/MMyb33cbMwYnAx9Yox5F/zEK7Bhazpf2vuTL0Qy942PgrNKpS21mK80ktpqYIKJGIeA3xSzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkhmCJWWjjqPd8mjObCZDG6D4uxqaR3FJk88bB4TAqTFLa8Pt
	qyLt3Q1A7vvNz3s4jkiBnEFB/jsxLhbzgzQk5fFseGMtAOtSvIsxPN/ZJyt3geInbgQ=
X-Gm-Gg: AR+sD13Xk2oBjZfvbrtRJyCrpLv3zOVNYdM0U+8Hi+x6zsVx/6X944rgr3RUpDPC5TT
	aFcJh9EF8cuz9cY5MMCCnUvKHYjqW96Y0LXM4/UNIulwtdF37RgIr28Sfs+LjamJoHW8+O/nFBN
	hMCsexNyHlZoBkg0kimy2/7/I/JsRU6Iygn9PjHi8Ao2F1WUryi/P5B0/JXTkJb26/O1VZBUhXI
	xjUy9nUDO6md9vTamxJOWWMp6Mv2u4Ox+pwGcMnJ2lrGiiI9N+XKlfjTc8ffA8C+KU3Ux5J/NaI
	YBrRjIQY7jjEMBTCfoNvWGao0F9WjIdJBPssUolP/tasNInV8QL+NG3NuEzswCgKS2MDW2X9jml
	GJtQlnxmuacUg3brir1IbvgnTJ3eb9AvH5Mvm/91/j5OsY/BF3nWkrRcmTIbou9f9YXVRnKLodQ
	Wilg6cZPSpj9EI7vDYI0ayTeYRN3XXFGbBL/3QS9TYdEbQODCjI+zvlvmbk6jlfeqo0Siv3g5zf
	agulazYnRew9UV1ttge4kJekZR0tevAfA==
X-Received: by 2002:a05:600c:5494:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-4980c679d64mr214413325e9.13.1785761214212;
        Mon, 03 Aug 2026 05:46:54 -0700 (PDT)
Received: from localhost ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm278310995e9.2.2026.08.03.05.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 15:46:44 +0300
Message-Id: <DKFBIK6S4RR4.2PB6HTV910C1J@wyliodrin.com>
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
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alexandru Radovici"
 <alexandru.radovici@wyliodrin.com>
X-Mailer: aerc 0.21.0
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-1-655bb444b52c@wyliodrin.com>
 <2026080205-falsify-stalemate-175b@gregkh>
In-Reply-To: <2026080205-falsify-stalemate-175b@gregkh>

On Sun Aug 2, 2026 at 11:39 AM EEST, Greg Kroah-Hartman wrote:
> On Sat, Aug 01, 2026 at 03:01:07AM +0300, Alexandru Radovici wrote:
>> Add an abstraction for `struct usb_host_endpoint`, together with the
>> accessors needed to reach one: `AlternateSetting` wrapping
>> `struct usb_host_interface`, `Interface::alternate_settings()` and
>> `Interface::current_alternate_setting()`, and `Device::control_endpoint(=
)`
>> for the default control endpoint, which no interface descriptor lists.
>
> Why?  USB drivers shouldn't be messing with usb_host_endpoint structures
> for the most part, what user do you have for this?

The more I think of this, I think you are right. `HostEndpoint`'s accessor
methods are only used for debug, as the `kernel` crate can access
the actual `usb_host_endpoint` underneeth. For debug purposes, we should
just derive the `Debug` trait instead.

>
>> `HostEndpoint` is generic over two sealed marker traits,
>> `EndpointDirection` and `EndpointTransferType`, whose implementors are
>> 1-ZSTs held in `PhantomData`. An endpoint borrowed from an alternate
>> setting starts out generic in both; `as_in()`, `as_out()` and
>> `as_control()` check the descriptor once and return a reference
>> carrying the corresponding marker, so a function taking
>> `&HostEndpoint<In, Bulk>` needs no check of its own. The type is
>> `#[repr(transparent)]` over the C struct and the markers are
>> zero-sized, so the refinement costs nothing and a slice of endpoints
>> can be borrowed directly from the C array.
>>=20
>> Control endpoints get a distinct `Bidirectional` marker rather than an
>> IN or OUT one. A control transfer takes its direction from bit 7 of the
>> setup packet's bmRequestType, and USB 2.0 section 9.6.6 defines the
>> corresponding bit of bEndpointAddress as ignored for control endpoints.
>> `as_in()` and `as_out()` are not implemented for `Bidirectional`, making
>> calling them a compile error rather than a misleading result.
>
> Don't over-think USB endpoints, they are "just" a pipe that contain a
> numbering scheme that the USB core uses.  Is that what you are trying to
> create here?  What are you trying to "enforce" here that the C code does
> not already do?

My USB knowledge is limited, so I hope I am not saying something
stupid here. My understanding is that drivers should not expect
interfaces to map the same endpoints (numbers) every time.
A driver should expect an interface to expose a certain number of
endpoints, each one with a certain type, but the actual number of each
exposed endpoint is not to be considered hardcoded. This means that drivers
should anyway iterate over the endpoints to discover the numbers
of the required endpoints.

My idea is to leaverage Rust's type system to prevent users from supplying
the wrong endpoint type at compile time rather then at runtime. By making
the `HostEndpoint` its own Rust type with no public constructor,
users will be forced to iterate the endpoints to discover the correct
number for each endpoint that they require. Once they have it, users
can hold to the reference as long as the interface is valid.

By adding the `Dir` and `Type` generic markers, suplying the wrong endpoint
to a function will be caught at compile time rather than at runtime. This
should hopefully shorthen the debug work needed for a driver, as some of
the errors become impossible.

As endpoint 0 is always provided and basically _almost hardcoded_``, I adde=
d
the `control_endpoint` function.=20

Best regards,
Alexandru
