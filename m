Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F8266F12
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104653; cv=none; b=pMv+zFGZvtPIgt45SXHpaM0SKx6Yjw/77NzpAp5O103DSSoE8qKqq419C/yps6BU2CjQwzidWe4IOKrdTqgpBgYvGIsHHD3OVR+dNDtcglPOIOxwyLBHxU5s68A2O5e+baX6juPkyg0Qg/b8nHGidSr2I/1YHk2FSufKypRBNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104653; c=relaxed/simple;
	bh=f/c/msyx1e3vxoDPGJKe0SJqzT6HzDxhGA9qQONgqPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoLNBDXHc6IkxQoQgHnLr7arpniaOpSzTA5borkys8BQzqJAAS2c+sMlkVkx9JS619Pw0EWirPDFlIAok0TkxltAG1/WiEgQ94cS96G1LfUSIRmK9dXG7dO8XAq1C3HaccDgnAFi5L0wIlOXhbo0GixbMsjT26L+RK9cut/824w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=h7VZO1a/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="h7VZO1a/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f69e71c8so2525326f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741104649; x=1741709449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIy9PeTTsN4YAiA2ClJKxcubBrW079aT6S1+RxVahlY=;
        b=h7VZO1a/xH/NrWcg39uqEMTPWcGttJPocZJUGcpS0MpqTeC1Sixu5X4RoqWggnfI32
         i10x6bLCLVUmz0P2cyi9PrbpdkFz4imDleBeUUXWnw8oI5apER4yxw9/Nbt9dEOKSX4y
         WGkY/lFE9+hUWSdIcRcFfHK8fjnOQjcHMwiDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104649; x=1741709449;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIy9PeTTsN4YAiA2ClJKxcubBrW079aT6S1+RxVahlY=;
        b=hiDomjFXk/B/dx5ER1kmP8qEN34zug+jSGkr3RSgY9tGxyZHGveB0WoB8ZhMvkmy8j
         dr1uXxk7xm/77Z7MuF7/O5Lg3tIFJ1X7ZCAkZIvSynIxOIRx7T+YLuoyRuK3O3B8fL79
         vn2hwWH6QCs+HcCT4JTzY03c8pdFlltss982d4X1x1acrytVhHhGj1A0C/jccOZwwSwA
         KhPRJmGjCYgZRbyIGidX0RrE5PvfSva5xo8RVsN5sizGihjOx4OtZC33wge7VX/ZyzH2
         bBZBg3A6rQHLpHokAAi/gOUozlYPJLbikonSr6WcM/qSIXtjpyV9GjV1WFi4AMrBkSRW
         mAbA==
X-Forwarded-Encrypted: i=1; AJvYcCV61JfJ0/7r5SOvp+StrQIvxRwArzzBl/Y9M7SQtpvDbO7dVtgLOZ7trBYTQuybi9fAPPv0dTT1go61CDajig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PFHSmg7No1PhNhS3A1eTiDBKrBKn+gV19h9jvZ1te5SI59tK
	ZREQld6zmPkah1K2o/337DV+nyKJmEz4JkQAT1hX+j2rlbPjl3CQ6N33ZE2kolc=
X-Gm-Gg: ASbGncurUxPQTn4L5C3QtmCId8WRmNPnyo8NNfcUUhQO2PW3IvS3Hq/+HqVQ5YtONbs
	ymONdBy+64KIxjzGk4w7M8FigZbDTAnf9undkn7mCwtzl94A/J6MDJvmOHfPGN39Ik3Hf6GjQTb
	jsouLqIc+xULeN8Yn7LVkBfkobzZagnNhdFaABxJZ9eyR22zxQS0BqbPkp9H3lDkS3upwfAj2DO
	SkU9IOEJcQdZYWpPejxy6UdUOGAhyUnRqJYMehkGCudH2iXCOi/zrR05m2+ScMhSIE6zICi5fgE
	/rtdnoO87HeSucZao8SEI4wSnoIjQsQZNiIBHu9lUafUQk2gVQe1Hk3f
X-Google-Smtp-Source: AGHT+IGYstbykxSLckXcDtbIvHnaqvWhbPG4L7oRKtT9m1rH0Ss1kauZrIqVjxI5p2CBcuWK44nyyA==
X-Received: by 2002:a05:6000:402b:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-39115605344mr3132563f8f.12.1741104649374;
        Tue, 04 Mar 2025 08:10:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db82sm17762968f8f.88.2025.03.04.08.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:10:47 -0800 (PST)
Date: Tue, 4 Mar 2025 17:10:45 +0100
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
Message-ID: <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
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
References: <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com>
 <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com>
 <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228184013.GF39591@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Feb 28, 2025 at 02:40:13PM -0400, Jason Gunthorpe wrote:
> On Fri, Feb 28, 2025 at 11:52:57AM +0100, Simona Vetter wrote:
> 
> > - Nuke the driver binding manually through sysfs with the unbind files.
> > - Nuke all userspace that might beholding files and other resources open.
> > - At this point the module refcount should be zero and you can unload it.
> > 
> > Except developers really don't like the manual unbind step, and so we're
> > missing try_module_get() in a bunch of places where it really should be.
> 
> IMHO they are not missing, we just have a general rule that if a
> cleanup function, required to be called prior to module exit, revokes
> any .text pointers then you don't need to hold the module refcount.
> 
> file_operations doesn't have such a cleanup function which is why it
> takes the refcount.
> 
> hrtimer does have such a function which is why it doesn't take the
> refcount.

I was talking about a bunch of other places, where it works like
file_operations, except we don't bother with the module reference count.
I've seen patches fly by where people "fix" these things because module
unload is "broken".

> > Now wrt why you can't just solve this all at the subsystem level and
> > guarantee that after drm_dev_unplug no code is running in driver callbacks
> > anymore:
> > 
> > In really, really simple subsystems like backlight this is doable. In drm
> > with arbitrary ioctl this isn't, and you get to make a choice:
> 
> It is certainly doable, you list the right way to do it right below
> and RDMA implements that successfully.
> 
> The subsytem owns all FDs and proxies all file_opertions to the driver
> (after improving them :) and that is protected by a rwsem/SRCU that
> is safe against the removal path setting all driver ops to NULL.

I'm not saying that any of these approaches are bad. For some cases we
plan to use them in gpu code too even. The above is pretty much the plan
we have for dma_fence.

> > - You wait until all driver code finishes, which could be never if there's
> >   ioctl that wait for render to complete and don't handle hotunplug
> >   correctly. This is a deadlock.
> 
> Meh. We waited for all FDs to close for along time. It isn't a
> "deadlock" it is just a wait on userspace that extends to module
> unload. Very undesirable yes, but not the end of the world, it can
> resolve itself if userspace shutsdown.
> 
> But, IMHO, the subsystem and driver should shoot down the waits during
> remove.
> 
> Your infinite waits are all interruptable right? :)

So yeah userspace you can shoot down with SIGKILL, assuming really good
programming. But there's also all the in-kernel operations between various
work queues and other threads. This can be easily fixed by just rewriting
the entire thing into a strict message passing paradigm. Unfortunately
rust has to interop with the current existing mess.

gpu drivers can hog console_lock (yes we're trying to get away from that
as much as possible), at that point a cavalier attitude of "you can just
wait" isn't very appreciated.

And once you've made sure that really everything can bail out of you've
gotten pretty close to reimplementing revocable resources.

> >   In my experience this is theorically possible, practically no one gets
> >   this right and defacto means that actual hotunplug under load has a good
> >   chance of just hanging forever. Which is why drm doesn't do this.
> 
> See, we didn't have this problem as we don't have infinite waits in
> driver as part of the API. The API toward the driver is event driven..

Yeah rolling everything over to event passing and message queues would
sort this out a lot. It's kinda not where we are though.

> I can understand that adding the shootdown logic all over the place
> would be hard and you'd get it wrong.
> 
> But so is half removing the driver while it is doing *anything* and
> trying to mitigate that with a different kind of hard to do locking
> fix. *shrug*

The thing is that rust helps you enormously with implementing revocable
resources and making sure you're not cheating with all the bail-out paths.

It cannot help you with making sure you have interruptible/abortable
sleeps in all the right places. Yes this is a bit a disappointment, but
fundamentally rust cannot model negative contexts (unlike strictly
functional languages like haskell) where certain operations are not
allowed. But it is much, much better than C at "this could fail, you must
handle it and not screw up".

In some cases you can plug this gap with runtime validation, like fake
lockdep contexts behind the might_alloc_gfp() checks and similar tricks
we're using on the C side too. Given that I'm still struggling with
weeding out design deadlocks at normal operations. For example runtime pm
is an absolute disaster on this, and a lot of drivers fail real bad once
you add lockdep annotations for runtime pm. I'll probably retire before I
get to doing this for driver unload.

> >   This is why I like the rust Revocable so much, because it's a normal rcu
> >   section, so disallows all sleeping. You might still deadlock on a busy
> >   loop waiting for hw without having a timeout. But that's generally
> >   fairly easy to spot, and good drivers have macros/helpers for this so
> >   that there is always a timeout.
> 
> The Recovable version narrows the critical sections to very small
> regions, but having critical sections at all is still, IMHO, hacky.
> 
> What you should ask Rust to solve for you is the infinite waits! That
> is the root cause of your problem. Compiler enforces no waits with out
> a revocation option on DRM callbacks!
> 
> Wouldn't that be much better??

It would indeed be nice. I haven't seen that rust unicorn yet though, and
from my understanding it's just not something rust can give you. Rust
isn't magic, it's just a tool that can do a few fairly specific things a
lot better than C. But otherwise it's still the same mess.

> >   drm_dev_unplug uses sleepable rcu for practicality reasons and so has a
> >   much, much higher chance of deadlocks. Note that strictly speaking
> >   drm_device should hold a module reference on the driver, but see above
> >   for why we don't have that - developers prefer convenience over
> >   correctness in this area.
> 
> Doesn't DRM have a module reference because the fops is in the driver
> and the file core takes the driver module reference during
> fops_get()/replace_fops() in drm_stub_open()? Or do I misunderstand
> what that stub is for?
> 
> Like, I see a THIS_MODULE in driver->fops == amdgpu_driver_kms_fops ?

Yeah it's there, except only for the userspace references and not for the
kernel internal ones. Because developers get a bit prickle about adding
those unfortunately due to "it breaks module unload". Maybe we just should
add them, at least for rust.

> > We can and should definitely try to make this much better. I think we can
> > get to full correctness wrt the first 3 lifetime things in rust. I'm not
> > sure whether handling module unload/.text lifetime is worth the bother,
> > it's probably only going to upset developers if we try. 
> 
> It hurts to read a suggestion we should ignore .text lifetime rules :(
> DRM can be be like this, but please don't push that mess onto the rest
> of the world in the common rust bindings or common rust design
> patterns. Especially after places have invested alot to properly and
> fully fix these problems without EAF bugs, infinite wait problems or
> otherwise.
> 
> My suggestion is that new DRM rust drivers should have the file
> operations isolation like RDMA does and a design goal to have
> revocable sleeps. No EAF issue. You don't have to fix the whole DRM
> subsystem to get here, just some fairly small work that only new rust
> drivers would use. Start off on a good foot. <shrug>

You've missed the "it will upset developers part". I've seen people remove
module references that are needed, to "fix" driver unloading.

The other part is that rust isn't magic, the compiler cannot reasons
through every possible correct api. Which means that sometimes it forces a
failure path on you that you know cannot ever happen, but you cannot teach
the compiler how to prove that. You can side-step that by runtime death in
rust aka BUG_ON(). Which isn't popular really either.

The third part is that I'm not aware of anything in rust that would
guarantee that the function pointer and the module reference actually
belong to each another. Which means another runtime check most likely, and
hence another thing that shouldn't fail which kinda can now.

Hence my conclusion that maybe it's just not the top priority to get this
all perfect.

Cheers, Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
