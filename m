Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7A26ED59
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973023; cv=none; b=l6li0igNWyxsTo3R4iwaxfIMa5fr3GsQkZLlZAkj9wSCGBVGyXj36n7qXw00aapSKmgEAm0w1jKAFiprxzC/P8iqpD8s96imyacEq6hpHUKz3iZWgOo/mtOCprwk5xpqix2sK/HMS7L796b6+nWVuIRL4Iv4GiF2h7wB1h8TGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973023; c=relaxed/simple;
	bh=lNq9HbHx84bO0jNzQuDP2EuhbElpWCYOSVhU+wGOVjw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6yBJDo9S3LOU2tsz1oYQwXaORNMGLZaUonUt0u7yVTDUVwxVKYpdU5CgIjh28D47GYACAZIcGDBMrVXXFZ22l00WHV6zSIwbXKD7iOi9RjgalMQunnyjU+rrzUllycD/hILTWvi+KMGu+MluinZZEanjf/E+jNDdiPyNux/8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGi5Mj2V; arc=none smtp.client-ip=74.125.224.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGi5Mj2V"
Received: by mail-yx2-f0.google.com with SMTP id 00721157ae682-81e7a64294cso707857b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973021; x=1784577821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ/EY59cpu1jkc21PGftgoguMZtfT9udSMBKlCW2BmU=;
        b=OGi5Mj2VyA8svzmhqWbXBJC9SfhEe6eSbp2k7zPV/jOQ3ucKH82EezhbS+nB994lMz
         KzU2sg4RfYxe6qVnXzEjgIHsvQhzrBXw5RhM2lczZGJB52LujnV8xubGt5Z+nf86bZRC
         4WVjkEoCFMCPU07rl+V0nPYj37b8Xo0tvZefvgpFOw6Gf7lH4amwKKQ6L/X+Y4UdFOD4
         hVdURCVxqrM33AxmM1erYI96Dnh29vD/bkKLsVuZlzntHg115f7VOysI+p4RC/dL4LEd
         UTxrQko/b5eZ36UH+G20xQ/ny+GkCYvdn9E+s94fucSK9ksh/KUVXlp5iRoiW3deIzsq
         nFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973021; x=1784577821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ/EY59cpu1jkc21PGftgoguMZtfT9udSMBKlCW2BmU=;
        b=RRVoKPg6cTE2zNWUa4sNvoQSRKgebSCi0uA4H/CcQ0wL75kV7l33KCJZupH+3u2VuS
         ApmoCbhUL6V8dYHprWWQSHgEPuPP7s0yntqOb7Ru2eGvoTpbVo8vR8ky0gwSHk3BQVv5
         LcXBs2k+eZOK1ZpY3F+TVB8PvOSiZGX5Xgr++4wlKNLjhV4Aq1ve6hJRIqJrREatA7QX
         X2lfc2u1UpUqYs65TkOeTg1Klr2jAuiLzPIvHudcksrd1MYP3oPQWe2qU5HY3GJBACux
         HB2sE8aOoLsD5S1S8/QNa+ebRpheD9jLw/kmGPGqnXCacYxiuWTDfFt/JJDHOzPN7v/Q
         8fhw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+pLAORaEKFmqG3nc+rwmHRqnsN4ShgwO4eU1mHjS5om91bo4r028E5BpqG+6NDMQhKhNOTt4QRZVeAOnJCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYAGOQtpVUVmiUC1nDx0iXvLqpfdWV7LopFWzZtJEncoUvHBD1
	NGgXgHesRnNL3moY1ATGoxA2IkZK1nCZN3sgH4KXgujU1hwZrQIu7ViC
X-Gm-Gg: AfdE7cmsGkdBw+vsw6d2sjcP2VzsQj9BsyhrNXkhfWX0en4KcCuc553z8tWZon2N+JZ
	KWgzdge34xF5+9IncTZ0IUS4NcpRrYqQbmCWSteOL/F03YGnXZGaolPm/EFIN+KjEHeh/KW7IhO
	KLpPCDYYnqhtTUz7rTSf3XxnVtMc0Xh9lhif+MyDsA6GGBg0OHSbLB0gZ1hhxDNJ8t5W/bHznjA
	FX528Ik51JO4SYrPrCQzklrDu/AxRTxNP78y1W8XNHVx0twXfhUR9X67CesXpk/GNCQE/hiJX5Z
	RW8Hmv5kvs9EAJ18zGSHz3IyaptPGdodEkH6Y5io43qoEY1SXDrafw2AwocLe1vd6ZTBTFCcs4k
	ozeaYYF8S9FXn7+1jmSW8NA8PtoHDEb27MBiGb8ufTjyMHE0c2z0Od11e7PqZYBVk02P5yHty3r
	IoJF4ibLvrsrLJInNQlTMo90kEZrDoogSvgst5rh3Prm2rWxRoIgJPfdEHj4XssweZzGRaeZLkL
	I08WQ==
X-Received: by 2002:a05:690c:3344:b0:814:5840:2f92 with SMTP id 00721157ae682-81e9014da15mr83359257b3.48.1783973020642;
        Mon, 13 Jul 2026 13:03:40 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm123926137b3.46.2026.07.13.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:03:40 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 15:03:38 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>, oneukum@suse.com
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <alVEUR0JrF1ga3S8@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>

On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
> (Cc: Oliver)
> 
> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> > @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
> >      }
> >  }
> >  
> > -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
> > -    fn as_ref(&self) -> &Device {
> > +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx> {
> > +    fn as_ref(&self) -> &Device<Ctx> {
> >          // SAFETY: `self.as_raw()` is valid by the type invariants.
> >          let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
> 
> Please see commit f12140f21acb ("rust: usb: don't retain device context for the
> interface parent").
> 
> We can't derive the device context of a USB device from a USB interface. Please
> also see the device context documentation in [1].
> 
> USB device drivers are separate from USB interface drivers, we can't assume that
> a USB device is bound to a USB device driver just because a USB interface (of
> that same device) is bound to an USB interface driver.
> 
> The same is true from the Core context, which means the device is in a bus
> device callback, where the device lock is held.
> 
> This is also the reason why I keep proposing to only expose simple forwarding
> helpers on usb::Interface to implement URBs (see also [2] and [3]).
> 
> An URB requires either usb::Interface<Bound> or, for a USB device driver,
> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
> usb::Interface<Bound> a simple forwarding helper does the trick.

That makes sense, thank you for pointing this out. I should have taken a
look at the git log for that line to try to understand its background.

I'll remove the usb::Device<device::Bound>::set_interface() and
usb::Device<device::Bound>::control_msg() implementations in my next
revision (since they will no longer be used) and just implement them on
usb::Interface<device::Bound>.
