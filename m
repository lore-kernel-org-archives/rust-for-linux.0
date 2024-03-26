Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28121CAAE
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 22:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491885; cv=none; b=kP9xVaYI+HtMpattZnY8OnDygn/zKfNpDd81uNka5r/gSIXIsYQSY2DaAOOJic33p15+pTd65fESvZ1D5JZRDqD3sXRi7YA2tqWnlGVMzApwmE+DZ6q6aDurzPmeKnQwKZx9FLqC4qRRDQQm+Tjwg70YB5Dd/zX/iBZDGzHKCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491885; c=relaxed/simple;
	bh=D7hqrY4hxyuXLgUF/GnaQCJDBLIklHdBUBk9qWxEmrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LTLcb8LmBoh/DNXvlBX8tlGnFsGFizBPxdHFC+gGq3IIBQv6hZfoNfJFkF4m8P9cPsqFWA63xi9BRUQh6bxTqcMq1G0DyMkubWqh5ncL0DQ5IGQAUdZteI1vdEciV26Hun2dwh8pJBfBbNpLXTgCCY/7OWJZaacCgADtJhVKknU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gc3TH6Wp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gc3TH6Wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711491882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QsM3a4OixPoYqAMMlWjGJAvEdFJzrqpIju+R+yECgg=;
	b=gc3TH6WpWv0NOk4/N0YV+MugzNExoIPz3qQ770tNa+PUdE5lHjlOpyCViKXr2BfvyyJUDU
	hSre5nu6bvqHSl1UTe5M7CWytWf9CY9y6maSeWs32ulEzU7i4ZAMDyUPYfLX184dfHrjUw
	bGXgqbqpWw9ghqyquzNBBF9hi951jKk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-6nh0gMYGOyiCBA-co3Qldg-1; Tue, 26 Mar 2024 18:24:40 -0400
X-MC-Unique: 6nh0gMYGOyiCBA-co3Qldg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4751b21400so26804066b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 15:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491879; x=1712096679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QsM3a4OixPoYqAMMlWjGJAvEdFJzrqpIju+R+yECgg=;
        b=Gk+z5JlX2xsYYk3Smpq9Vqx/pUyKNKSr/Fp3BklX/jN3/v51y2dZdx8aI3JmK6m2iH
         NKANpArXvnpt6v0qR+35Eo2JmgDZJQSuhwWtLrPn61V2PWFTDinX/qvaL/SdDYj51a53
         Wfa3D48REmTlc1RPMzM0m6myIblGQf557fXD37V+0gYaDbjUBiaZkKs6SSzSorF5g7yT
         rEyhQBc2JOPoOBFWy03oeSMXXbUUnQGeII18iQzwRQ8W/leyCUXb+3t9TDwgwmquvBWc
         MHc3nhTpwYksZEChoexeGM8EW+F1f6P/d/2ij7Xrjjx3bi8z9jyncpsBPfUW7cSvysD3
         1RjA==
X-Forwarded-Encrypted: i=1; AJvYcCVZvDbJs+oVmGySXVu1RH2e8qWcXpXhLMrTzgYFQSVzkiJWHixvjH1cSZxrQzY4Ml0MIjeRkMzY6G1miWItWk16yAFJYd2FSY7oXikOEZI=
X-Gm-Message-State: AOJu0YyXsuHn5ixLZJogIdskqqFig1UTs7JGZil3+DbutjktrQtaEu2E
	/xXo16/kDAwoXv8VNR00C7kTd37XQhkVuOW8fVjxDJbWFExlbuJUwkSEgg8NZWYL/jO/Ip4C6mH
	yfPHhM06DH/Ap9NPUAmxQJIHFXnTGsX9ZFak48QL9AX0dfpckEjawYO1WQn12XTNz
X-Received: by 2002:a17:906:5512:b0:a46:a28d:2f49 with SMTP id r18-20020a170906551200b00a46a28d2f49mr2345405ejp.32.1711491879330;
        Tue, 26 Mar 2024 15:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+OWc+IDSi+LOspQiMIVPe/F262DZdC2Vj8k/H7sdxQ+cE5Dtx/d1WWu9Lk7uiLzF4nEQ0/Q==
X-Received: by 2002:a17:906:5512:b0:a46:a28d:2f49 with SMTP id r18-20020a170906551200b00a46a28d2f49mr2345377ejp.32.1711491878924;
        Tue, 26 Mar 2024 15:24:38 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id jy10-20020a170907762a00b00a461e10094asm4718329ejc.95.2024.03.26.15.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:24:38 -0700 (PDT)
Date: Tue, 26 Mar 2024 23:24:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 8/8] rust: add device::Data
Message-ID: <ZgNLJEpw670wca_M@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-9-dakr@redhat.com>
 <2024032509-tanned-calamity-4e1c@gregkh>
 <ZgL9u-L1T_J1UZLt@pollux>
 <2024032651-chrome-museum-7027@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032651-chrome-museum-7027@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2024 at 07:12:29PM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 05:54:19PM +0100, Danilo Krummrich wrote:
> > On Mon, Mar 25, 2024 at 07:21:04PM +0100, Greg KH wrote:
> > > On Mon, Mar 25, 2024 at 06:49:12PM +0100, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > 
> > > > This allows access to registrations and io resources to be automatically
> > > > revoked when devices are removed, even if the ref count to their state
> > > > is non-zero.
> > > 
> > > So it's re-implementing the devm_*() calls?  Why?
> > 
> > It's not. Taking IO resources as an example it's more a generalization of what
> > e.g. DRM solves with drm_dev_unplug() and drm_dev_{enter,exit}().
> 
> That is a drm specific way to handle devm_* stuff, right?

Depends, if you mean it's a DRM specific way to ensure devm_* managed resources
can't be accessed anymore after the device is "gone" from the perspective of
the driver, then yes. If you confuse it with drmm_* stuff, which ties resources
to the actual lifetime of a struct drm_device (device is freed), then no.

It's basically the DRM way to implement Revocable<>. drm_dev_unplug() marks a
struct drm_device as unplugged (protected by SRCU). drm_dev_{enter,exit}() are
used as conditional entry / exit points of code sections that access resources
that might have been released by devm_* stuff already, such as IO mappings.

> 
> If that is to be "baked" into different bus types, great, let's make it
> a bus-specific thing and put it in the driver core, but don't make it
> something that is tied to rust devices only as that feels odd, right?

You lost me a bit on this one. Can you please clarify?

> 
> Also, work with the patterns we have, don't create new ones as that just
> causes confusion for all of us working on this part of the kernel.
> 
> > While devm_*() ensures to, for instance, iounmap() a mapping when a device is
> > detached, the Revocable<> resource ensures that a driver can't access the
> > pointer pointing to the just unmapped memory anymore.
> 
> Great, this is something that we have been asking for in a generic way
> for all drivers/devices in the kernel (see the many talks over the past
> years at conferences about it.)  Please work with the developers who are
> doing this in the .c side to be sure that things are aligned properly to
> work the same.

Unfortunately, I'm neither aware of those efforts, nor the talks. Mind providing
me some pointers?

> 
> > So, this isn't something that replaces devm_*(), but kinda builds on top of it.
> 
> Perhaps document it that way?

Sure, I can add this example.

> 
> > For instance, we could call Revocable::revoke() from a devm_*() callback.
> > However, and that' what this patch currently does for simplicity, we could also
> > just call it from the corresponding driver's remove() callback.
> 
> If that's the proper place for that, yes.  It could be the proper place
> is in the close() system call as well, right?  But again, document it to
> explain what this is please, as it was not obvious at all.

Correct, it depends on what you use Revocable<> for, device resources is just
one example where this is useful.

> 
> > > And this will trigger only on remove, but which remove?  The bus remove?
> > > Or the unbinding of the driver to the device (two totally different
> > > things, be specific and very careful here.)
> > 
> > The above comment says "device remove", maybe say device / driver detach
> > instead?
> 
> It depends on what you mean.  Those are different things, as explained
> in other places.  Where do you want this to happen?  Where should it
> happen?  And why in only those places?

For device resources, device / driver detach should be the correct place. Agree?

> 
> > > > +/// Device data.
> > > > +///
> > > > +/// When a device is removed (for whatever reason, for example, because the device was unplugged or
> > > > +/// because the user decided to unbind the driver), the driver is given a chance to clean its state
> > > > +/// up, and all io resources should ideally not be used anymore.
> > > 
> > > Wait, unplugging a device and unbinding a device from a driver are two
> > > totally different things, do NOT get them mixed up or assume that they
> > > are the same thing at all please.  They have different lifetime rules
> > > and different patterns of what happens.
> > 
> > I think the comment does not claim that device unplug and device / driver
> > unbind are the same thing. I rather think in this context the expection is that,
> > ultimately, both result into the fact that the corresponding device resources
> > are not available anymore and hence shouldn't be used anymore. Where the latter
> > is enforced by using Revocable<>.
> 
> But those are different things happening, and different things happen to
> the objects when those different things happen, so while a driver might
> seem to see the same thing happen from its point of view, the lifespan
> of the object itself is VERY different here (could be passed back to the
> driver, could be freed, could be sent to a different driver, could just
> be ignored for a long time, etc.)
> 
> So be specific as to what viewpoint you are considering here, a device
> object has a lifespan that greatly exceeds that of just the window where
> a driver happens to see it :)

Fully agree, this is indeed from the viewpoint of the driver. We don't really
care what is happening to the device after detach. We only care about all the
cases above lead to a detach, which is the point where we have to make sure
we're not accessing any device resources anymore.

I will try to make this more clear.

> 
> > > So this needs to be taken out and rewritten from the beginning please.
> > > If the comments describe something that is incorrect, I can't trust that
> > > the code is correct...
> > 
> > Not sure the comment is actually claiming something incorrect. If, with the
> > above explanation, you still think so, please let me know how to phrase it
> > correctly, such that I can improve this patch accordingly.
> 
> Please step back and try to determine what you want here.  How devices
> are created, assigned, reassigned, removed, renamed, destroyed, etc.
> They have a well known "phase of life" and one that different parts of
> the kernel sees in different ways (driver core, busses, classes,
> drivers, userspace, etc.)  Be aware of what you are wanting to do here,
> and who is acting on the structure where and what they are wanting to do
> with it.
> 
> thanks,
> 
> greg k-h
> 

