Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53F1F9AAB
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257765; cv=none; b=iWMXOy8KJyBzBRABiBvS10jCbLjuQLtzL0/3glpfPmZg4TUys3eLrrHArTbJ3xMluqEjuLGedB3WOmnw/jslcDgDYyFRhukOAlco4IVnX6tEStgZSBWiTOccYT70+jkUSepkGoENSoM0El+tGwQfH5dyVq0gqdh7NN9M5YCxk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257765; c=relaxed/simple;
	bh=oMaJ3ttQfUlcOd6XabkwBtso8KOiJkhMq9No5c2mpXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/GRv1IgUpf1g30/OS6CHr6Z3kz/0hlA2o4XNuUzE3gbL/HGBm9mwDFQ/+KRVNpTNOUxNahIG13RloLkOyNPDghyphBVxfOIRH25pCAwBgw1ZQNgasropY78rxMkMuH0Fy4XprglIH6GjNI28NecpxGzV3LfElZbhb+SFYWIxc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=T6N4zsQB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="T6N4zsQB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso2929925e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Mar 2025 02:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741257761; x=1741862561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWKW3oIaJ3+3t6x61qexA9c5kKVmeqkOjY9qTsiPgw0=;
        b=T6N4zsQBV3cvwvAxoO5u9Es6/YK22gaFZSXdbg6UrbrWxHadL/CyDcxB4lYMkvcyPP
         xiOfE2eoWmsbdss5750LQGS8NePlqBuoJ2TQEtDoALTFesNsvgV/VTk27wh/w4gNEo7l
         rtYKhWnQxO+QXz9VIxmbtsO92iBMSa9+kR7io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257761; x=1741862561;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWKW3oIaJ3+3t6x61qexA9c5kKVmeqkOjY9qTsiPgw0=;
        b=USHbq4QLrMfxliZi777VDed9XWECWfaUVNardxAkMSQgs1gD/WSXmE6R32Xk9c0HVr
         KoZbGWc3oJThBbgeq0hrENatXR6nq87/sKJJr5/r6neuDfhEXvDGix2L9/QlkK7Wv9S4
         UBDkQlkvqZ08ZEbeXbkNEiNNUWSmwMKwAlWYKz6CwYb+GO/bpvGNVLf31dxBmiqaQPZ3
         24HrQkLj8EbGNaIEnWMQZ7YdX1SJiNIy3xlhBRbBF1pLtxvVCfDDo9F0tAMQibWftSpy
         Zh00oLSXmrzYOktJqIETWMai7w9bSVKpHfMMRf55edK36zAZFUi7X+hZdgPOHBuBYDwq
         l3sA==
X-Forwarded-Encrypted: i=1; AJvYcCWLPNpo/gWdHkBBn92pMBNi7d/6pRu2QGTP5H0RKV/qH7NWv/a+/RsBWlMIWUkMe5fI7ur4A0wLpW1zrCP6Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32k8KNwnc4wXDSq+aY/xxyOliPVzMxFyL6UDaJrJ6aBZ2BKpk
	PRqSLDz/us3CoY/3Q2PPTQYnY0nfbZl+sDA3XL6Hd9UfLoHVarVctSLnP8Dt6DE=
X-Gm-Gg: ASbGncsMtE1D7ihrP4YUlrmPTFh9um8+FESdHteSspuVRqaBf23t5dpfAZYqb6XRydZ
	aAPqdqWMpxR4hkmERMCnvgiq+pb7RRbmnnaAaRR4X+YIr0ITalhRDu3k8BiwJd7i/EciVDG44md
	7IZ3Ck2LUN20WpV41HTU9846f1O+2CBfcUHKVhvWL5t0kz4Q7R24dz6Zca8JPWk1XLSLBC/4giU
	f4uc9JZvxVEs3dm4RUTssUoLP7ZJq4+WRXy910XQjr9bGiVmW+0QJNlX9peXXq5IcCFtNo2hm9Y
	Brl4uatfWmFYPQ3jx6HjDsA6LFdt0ZtFxnNR6oEO73glMtYM5fBq2OYB
X-Google-Smtp-Source: AGHT+IFWtDrzAmHmNppiYyx5/EBa7seM+yDY/129ZcXODnx/XUpZbw/Xkl5sipcWH6LwnCCp7EOkxQ==
X-Received: by 2002:a05:600c:3b14:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43bd294dd4emr47339385e9.3.1741257761331;
        Thu, 06 Mar 2025 02:42:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435c9c7sm45137295e9.38.2025.03.06.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:42:40 -0800 (PST)
Date: Thu, 6 Mar 2025 11:42:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
	Joel Fernandes <joel@joelfernandes.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	paulmck@kernel.org
References: <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305151012.GW133783@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Mar 05, 2025 at 11:10:12AM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 05, 2025 at 08:30:34AM +0100, Simona Vetter wrote:
> > - developers who want to quickly test new driver versions without full
> >   reboot. They're often preferring convenience over correctness, like with
> >   the removal of module refcounting that's strictly needed but means they
> >   first have to unbind drivers in sysfs before they can unload the driver.
> > 
> >   Another one is that this use-case prefers that the hw is cleanly shut
> >   down, so that you can actually load the new driver from a well-known
> >   state. And it's entirely ok if this all fails occasionally, it's just
> >   for development and testing.
> 
> I've never catered to this because if you do this one:
> 
> > - hotunplug as an actual use-case. Bugs are not ok. The hw can go away at
> >   any moment. And it might happen while you're holding console_lock. You
> >   generally do not remove the actual module here, which is why for the
> >   actual production use-case getting that part right isn't really
> >   required. But getting the lifetimes of all the various
> >   structs/objects/resources perfectly right is required.
> 
> Fully and properly then developers are happy too..
> 
> And we were always able to do this one..
> 
> > So the "stuck on console_lock" is the 2nd case, not the first. Module
> > unload doesn't even come into play on that one.
> 
> I don't see reliable hot unplug if the driver can get stuck on a
> lock :|
> 
> > > Assuming all your interrupt triggered sleeps have gained a shootdown
> > > mechanism.
> > 
> > Hence why I want revocable to only be rcu, not srcu.
> 
> Sorry, I was not clear. You also have to make the PCI interrupt(s)
> revocable. Just like the MMIO it cannot leak past the remove() as a
> matter of driver-model correctness.
> 
> So, you end up disabling the interrupt while the driver is still
> running and any sleeps in the driver that are waiting for an interrupt
> still need to be shot down.
> 
> Further, I just remembered, (Danilo please notice!) there is another
> related issue here that DMA mappings *may not* outlive remove()
> either. netdev had a bug related to this recently and it was all
> agreed that it is not allowed. The kernel can crash in a couple of
> different ways if you try to do this.
> 
> https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c

Hm for the physical dma I thought disabling pci bust master should put a
stop to all this stuff?

For the sw lifecycle stuff I honestly didn't know that was an issue, I
guess that needs to be adressed in the dma-api wrappers or rust can blow
up in funny ways. C drivers just walk all mappings and shoot them.

>  > a device with no driver bound should not be passed to the DMA API,
>  > much less a dead device that's already been removed from its parent
>  > bus.
> 
> So now we have a driver design that must have:
>  1) Revocable MMIO
>  2) Revocable Interrupts
>  3) Revocable DMA mappings
>  4) Revocable HW DMA - the HW MUST stop doing DMA before the DMA API
>     is shut down. Failure is a correctness/UAF/security issue
> 
> Somehow the driver has to implement this, not get confused or lock up,
> all while Rust doesn't help you guarentee much of any of the important
> properties related to #2/#3/#4. And worse all this manual recvocable
> stuff is special and unique to hot-unplug. So it will all be untested
> and broken.

The trouble is that for real hotunplug, you need all this anyway. Because
when you physically hotunplug the interrupts will be dead, the mmio will
be gone any momem (not just at the beginnning of an rcu revocable
section), so real hotunplug is worse than what we're trying to do here.

Which means I think this actually helps you with testing, since it's much
easier to test stuff with pure software than physically yanking hardware.
You could perhaps fake that with mmiotrace-like infrastructure, but that's
not easy either.

So randomly interrupts not happening is something you need to cope with no
matter what.

> Looks really hard to me. *Especially* the wild DMA thing.
> 
> This has clearly been missed here as with the current suggestion to
> just revoke MMIO means the driver can't actually go out and shutdown
> it's HW DMA after-the-fact since the MMIO is gone. Thus you are pretty
> much guaranteed to fail #4, by design, which is a serious issue.
> 
> I'm sorry it has taken so many emails to reach this, I did know it,
> but didn't put the pieces coherently together till just now :\
> 
> Compare that to how RDMA works, where we do a DMA shutdown by
> destroying all the objects just the same as if the user closed a
> FD. The normal destruction paths fence the HW DMA and we end up in
> remove with cleanly shutdown HW and no DMA API open. The core code
> manages all of this. Simple, correct, no buggy hotplug only paths.

This is where it gets really annoying, because with a physical hotunplug
you don't need to worry about dma happening after ->remove, it already
stopped before ->remove even started.

But for a driver unbind you _do_ have to worry about cleanly shutting down
the hardware. For the above reasons and also in general putting hardware
into a well-known (all off usually) state is better for then reloading a
new driver version and binding that. Except that there's no way to tell
whether your ->remove got called for unbinding or hotunplug. And you could
get called for unbinding and then get hotunplugged in the middle to make
this even more messy. At least last time around I chatted with Greg about
this he really didn't like the idea of allowing drivers to know whether a
pci device was physically unplugged or not, and so for developer
convenience most pci drivers go with the "cleanly shut down everything"
approach, which is the wrong thing to do for actual hotunplug.

> > Yeah agreed. I might really badly regret this all. But I'm not sold that
> > switching to message passing design is really going to be better, while
> > it's definitely going to be a huge amount of work.
> 
> Yeah, I'd think from where DRM is now continuing trying to address the
> sleeps is more tractable and achievable than a message passing
> redesign..
> 
> > > If the C API handles module refcounting internally then rust is fine
> > > so long as it enforces THIS_MODULE.
> > 
> > You could do contrived stuff and pass function pointers around, so that
> > THIS_MODULE doesn't actually match up with the function pointer.
> 
> Ah.. I guess rust would have to validate the function pointers and the
> THIS_MODULE are consistent at runtime time before handing them off to
> C to prevent this. Seems like a reasonable thing to put under some
> CONFIG_DEBUG, also seems a bit hard to implement perhaps..

We should know the .text section of a module, so checking whether a
pointer is within that shouldn't be too hard.

> > > If the C API requires cancel then rust is fine so long as the binding
> > > guarantees cancel before module unload.
> > 
> > Yeah this is again where I think rust needs a bit more, because the
> > compiler can't always nicely proof this for you in all the "obvious"
> > cases.
> 
> But in the discussion about the hrtimer it was asserted that Rust can :)
> 
> I believe it could be, so long as rust bindings are pretty restricted
> and everything rolls up and cancels when things are destroyed. Nothing
> should be able to leak out as a principle of the all the binding
> designs.
> 
> Seems like a hard design to enforce across all bindings, eg workqeue
> is already outside of it. Seems like something that should be written
> down in a binding design document..

Yeah ...

I think a big issue is that very often all these things aren't even
documented on the C side, like the dma-api unmapping lifetime I wasn't
aware of at all.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
