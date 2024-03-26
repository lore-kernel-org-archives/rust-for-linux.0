Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD32E12B14F
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 21:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711486900; cv=none; b=oLI3yZuMkoLBOUAUWUp6AHB0rSX5qkZ55Mz9YFzizLMKg+OtAFarLWrEPIlnQlwnq7v3rvZkBF+gFwwrjUvWumficIdKJIR4+e9eES+wtrwZXLctBpihwpJZrQ55THpZgMhXhfxFY9IXpWPhvM9LsuQdQfE8csjRD2e9Kvm33mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711486900; c=relaxed/simple;
	bh=rnNkJcTkgR6aCMnGd7l0KFfvZe9aCTSE1QTC5keVbWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BXST3yBtTR+Grd53llU67z4rvebm/q1ycZKJ4cQLz3d18CsBcwaFSjpKhX/Ec7Wfs0raL8zRdkdRW0FvfhZ6YTsxHzOW2v0zPpmTo76U+dVodHevH2ke9P1C8V3eE5jFkzh3+Jf7tey0mBIkG9YhogvqTT5JodxKU/VDtqF4mgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iG09HGsq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iG09HGsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711486897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bo3/4a/5nPEL9biZVNu0nPr0/bKMvOJdru0d+o/3Lo0=;
	b=iG09HGsqHkcunHvXHs4tCZo/X/Ne7LnNYJ9bjPpfdY6PVPv1k3KzfVxEDZ7PBimYRvFN5X
	7Iz6mf+2m+NGAgc+UvqdLwMK2oAWiEd9mFKinnhHNL+vMN/DtoAIZS7fvw/zV9cUZ6je5P
	l8NaVzdRhYGdtyCaKyk1ZDyL5+oqRO8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-MO5UXsj8OZm32EQGgDumZg-1; Tue, 26 Mar 2024 17:01:36 -0400
X-MC-Unique: MO5UXsj8OZm32EQGgDumZg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a47416276c7so216626966b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 14:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711486895; x=1712091695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo3/4a/5nPEL9biZVNu0nPr0/bKMvOJdru0d+o/3Lo0=;
        b=e+/Tn344vx8M6E7ZVXvRCEUNQPnjoif5YNnvTDJQRjw7sCxnf7NJHns/1h06PjXLXe
         bVJ288BTp87QmhNoHUe18pgKYEPgAVFTrpcjv9giY0fdgldj/HdzBQjM+qAcu4qBERGW
         5XdpCE04At0SMEW/EsKRnTZFDII33503tWRqjkKmQqr7LJE9IzPl3mWaJjvMKlCblDYs
         QYwlNOgwq6/EzIpNFnXXch4DrnmQenVV+ZPeeL0XG5cCha11tt37dN9SaFDWDeW94SB6
         DhFcxZ5ot/KeAedf+TPiy40aq+TwojWvqlDCkOW0y6PfG7H4oRLRdsX5OHyZy5SEpPjn
         U85w==
X-Forwarded-Encrypted: i=1; AJvYcCVBSPwT9VbLWf3o2CoOI93AaZAb6hZ6Etu17iORjUbUmYbOZXoSkl5ZAzItAic8dScgJFFWgLxWpiEBQdSdpfcAANdpZnD9QDJOIbepkPE=
X-Gm-Message-State: AOJu0Yw7zAZ4Z19/AMFEqwdhqlO8SFrhDwZ4gdpe0K+QvhKvsaEHpJz+
	3mPisgcuSVT7GpabwDJQlC73zHIrb4RXAqbFYlA+alRcgTutZeBPr+AvaiVLxTSaz1yiiadbuOP
	ObtZUkEpgOp0a3AJN3f/oNq95xmUd0SV0sID2RlLOBW6XDo3Cpd1/F5sy7+FuJFfI
X-Received: by 2002:a17:906:15c2:b0:a47:35c6:910c with SMTP id l2-20020a17090615c200b00a4735c6910cmr2754287ejd.22.1711486895206;
        Tue, 26 Mar 2024 14:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHneftGDWiRnXvzoul5tXLnd4yydBRyIt3XTw9Nb2/q1FaRZDCpUqzzHOJEYcvJw+qrZ+a1eQ==
X-Received: by 2002:a17:906:15c2:b0:a47:35c6:910c with SMTP id l2-20020a17090615c200b00a4735c6910cmr2754252ejd.22.1711486894838;
        Tue, 26 Mar 2024 14:01:34 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709060cb200b00a455d78be5bsm4611924ejh.9.2024.03.26.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 14:01:34 -0700 (PDT)
Date: Tue, 26 Mar 2024 22:01:32 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <ZgM3rJv677EHbklX@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
 <ZgLxcXTw3awyW7cH@pollux>
 <2024032607-sheath-headlock-1fb2@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032607-sheath-headlock-1fb2@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2024 at 07:03:47PM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 05:01:53PM +0100, Danilo Krummrich wrote:
> > On Mon, Mar 25, 2024 at 07:17:46PM +0100, Greg KH wrote:
> > > On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> > > > +        let name = unsafe { bindings::dev_name(ptr) };
> > > > +
> > > > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > > > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > > > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > > > +        // by the compiler because of their lifetimes).
> > > 
> > > devices are renamed all the time, I don't understand how this can be
> > > true here.
> > 
> > As the comment says, it's the safety requirement of this trait, which is
> > documented in the DOC comment of trait RawDevice. Admittedly, it's not obvious,
> > since the comment isn't part of this diff and was introduced in the previous
> > commit "rust: device: Add a minimal RawDevice trait". Maybe we should move it to
> > this commit then.
> > 
> > It says: "Additionally, implementers must ensure that the device is never
> > renamed. Commit a5462516aa99 ("driver-core: document restrictions on
> > device_rename()") has details on why `device_rename` should not be used."
> 
> Yes, I agree it should not be used, but that's different from you saying
> "this is safe as the device will never be renamed" which is not true

You omit the restriction "implementers must ensure that the device is never
renamed".

> unless you somehow prevent that from ever happening on a pointer that
> the rust code gets here.  How can you do that?

By setting the above requirement for the subsystem implementing the RawDevice
trait.

Do we really need to expect the device name to change at any (random) point of
time? Isn't the subsystem in control of that?

The alternative would be to always return a copy of the device name when
RawDevice::name() is called.

Besides all that, aren't we in trouble on the C side as well?

devm_request_threaded_irq(), for instance, just picks up the pointer returned by
dev_name(dev), which is stored in struct irqaction and e.g. subsequently
accessed by the irq_handler_entry trace event.

Another example would be ehci_platform_probe() where in a subsequent
usb_create_hcd() call kobj->name (or dev->init_name) is assigned to
hcd->self.bus_name. In contrast to the example above, I guess the USB subsystem
takes care to never rename the device. Isn't this assumption identical to the
requirement of trait RawDevice?

> 
> And why the issue if the device is renamed (other than the documented
> ones), why is the rust code here special in this way?
> 

I think Rust isn't special here. Isn't the old name freed in kobject_rename()?
That'd be a problem for the current Rust code and it'd be a problem for the
examples I gave above, right?

