Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8B1DAC49
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Sep 2024 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348778; cv=none; b=cG1QrwRYM5iXod/0YIYWee9Tg0Ebsrjfez0qmFoob0u4DfEwu8kTsntczCR5lCl+FWsKdtQrszIVL30G40gFPh4cqCI62MCYlABIobK+oAnbp36OaEHFwa8e9Vuih4xJkbVb1T98/caT4aGThPhuXSjUWWAi6bsbNJuu32H37Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348778; c=relaxed/simple;
	bh=Rn92/H1Lal57o2/xeMzBHVfPmlWLNEi8SdikdYhf4Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkQopKXJ9Y3RaU5CU9oVcqDSSjoVMW4Iilnd9BODCpvZ4a+s07UARQ89sIy9JqOHabAFW5vd6eA9hqJsBgEH/8pZlA8SiL/R6MQIquZ+5xuy8GZNgNmvj1ttwsGteYpgttVQ5Yr/6CoRi+b/S0ngSkMLqo3oNQmgXIKTHkRbX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=WF5WKj9C; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WF5WKj9C"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374bb08d011so1938676f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Sep 2024 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1725348775; x=1725953575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jStyz7cF/GRPSLiBq7afoHfr3JzNU62RShSwfRKzITo=;
        b=WF5WKj9CDBOMZNIUPpnpVqk7DLkcMpmakaLz6jeN9ob4EqBhmVlk+pNSJ6X2G01CvT
         3g3aBhlPeshwk1Nk05yFe2AYvwi3K4H0Cq4Al0r2aJR7tmD2cg0LiNj7ajmNZg7MLSOC
         WgJf9S5vkXHOUJviQye/vnVIvVtsSRUjdqv3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348775; x=1725953575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jStyz7cF/GRPSLiBq7afoHfr3JzNU62RShSwfRKzITo=;
        b=uA9m78mkSal6YJceMDWwOlKlolCun9T6+0ltQVBGW9qQ41PQvI2ZodfItJN5q/9ww8
         lOzYVXap6xSbTXysP2m77BrjgNBA+gXWxPmXPBWOwpIOeAiAmMzol8YI62x5s3/7ngus
         6n3vXEyFMQpOUQHlYB4W4FBKzJ5jP8NQVmC88sjstGWj2YYQmR9ToiRLqceEAxeJ1B0V
         lTAI3VqFKW+kOBZn7abqRzZ0/8IFGOkRTOpI8AjETBVVpZ2TuPnvsTtsY0JBILbGY61b
         Aff/4HBgOfFXY8/DtUThxlw3dxxQWP6XpMCKEACN3aoTqeQJRWfpRMELZL8B0izq1kxP
         I10g==
X-Forwarded-Encrypted: i=1; AJvYcCUhA82e/HmUkjOMuDQwb0sac5OZEYD4Z+/IAA3LWeMo83f41w74rbegfnHN9h1yYB29Zy+6Yj917MIcp/G/8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5l6xj0poEk2S4hbd8VEeCXzmrtKn8alcIV878a0R7v5ZQmWVn
	Fde6AObey0o8rBTTbKT3YeC//RSUR9/yVSYFjwjsVWjs8q9hg88uw83JGZuvjHM=
X-Google-Smtp-Source: AGHT+IGgQUY7p0fwPG8ckVOXs6G5z6LEBN/3GIwOhXGelUa0A/UnYm2cH9vzWq0+BrRRjfVRAHkMdQ==
X-Received: by 2002:adf:fc4d:0:b0:368:3717:10aa with SMTP id ffacd0b85a97d-374c9455425mr3438719f8f.11.1725348774560;
        Tue, 03 Sep 2024 00:32:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cc75a5fbsm4256548f8f.80.2024.09.03.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 00:32:54 -0700 (PDT)
Date: Tue, 3 Sep 2024 09:32:51 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
	robh@kernel.org, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] DRM Rust abstractions and Nova
Message-ID: <Zta7o089vlSbfZbq@phenom.ffwll.local>
References: <20240618233324.14217-1-dakr@redhat.com>
 <ZtXqYGt3g_YY7RUN@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtXqYGt3g_YY7RUN@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Mon, Sep 02, 2024 at 06:40:00PM +0200, Daniel Vetter wrote:
> On Wed, Jun 19, 2024 at 01:31:36AM +0200, Danilo Krummrich wrote:
> > This patch series implements some basic DRM Rust abstractions and a stub
> > implementation of the Nova GPU driver.
> > 
> > Nova is intended to be developed upstream, starting out with just a stub driver
> > to lift some initial required infrastructure upstream. A more detailed
> > explanation can be found in [1].
> > 
> > This patch series is based on the "Device / Driver and PCI Rust abstractions"
> > series [2].
> > 
> > The DRM bits can also be found in [3] and the Nova bits in [4].
> > 
> > Changes in v2:
> > ==============
> > - split up the DRM device / driver abstractions in three separate commits
> > - separate `struct drm_device` abstraction in a separte source file more
> >   cleanly
> > - switch `struct drm_driver` and `struct file_operations` to 'static const'
> >   allocations
> > - implement `Registration::new_foreign_owned` (using `Devres`), such that we
> >   don't need to keep the `Registration` alive on the Rust side, but
> >   automatically revoke it on device unbind
> > - add missing DRM driver features (Rob)
> > - use `module_pci_driver!` macro in Nova
> > - use a const sized `pci::Bar` in Nova
> > - increase the total amount of Documentation, rephrase some safety comments and
> >   commit messages for less ambiguity
> > - fix compilation issues with some documentation example
> > 
> > [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> > [2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
> > [3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
> > [4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next
> 
> Ok finally stopped dragging my feet on this, went through my old comments,
> looked at stuff again, and wrote some replies.
> 
> I think all but the question around type safety for drm_driver->features
> can be sorted out post-merge, when we have a driver that needs it. The
> feature flags stuff I think essentially makes the current abstraction
> unsafe, and you can blow up when constructing a new drm::Device instance
> if you're creative enough I think.

Oh one thing I've forgotten: I think for the subclassing pattern in rust
there's clear consensus now, at least from my discussion with Lyude on the
modeset side of things. Well maybe aside from the little issue that rust
doesn't guarantee uniqueness for static const ops pointers, but apparently
that's getting addressed. One thing I'd really like us to be consistent at
though is not just the pattern, but the naming (like RawFoo vs whatever
else people came up with) of the different struct/traits, so would be
really good to document that somewhere for drm and make sure we follow it
in all the gpu related rust bindings. Unless upstream has that already
(maybe as part of the device/driver binding stuff).

Cheers, Sima

> > Asahi Lina (4):
> >   rust: drm: ioctl: Add DRM ioctl abstraction
> >   rust: Add a Sealed trait
> >   rust: drm: file: Add File abstraction
> >   rust: drm: gem: Add GEM object abstraction
> > 
> > Danilo Krummrich (4):
> >   rust: drm: add driver abstractions
> >   rust: drm: add device abstraction
> >   rust: drm: add DRM driver registration
> >   nova: add initial driver stub
> > 
> >  MAINTAINERS                     |  10 +
> >  drivers/gpu/drm/Kconfig         |   2 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/nova/Kconfig    |  12 +
> >  drivers/gpu/drm/nova/Makefile   |   3 +
> >  drivers/gpu/drm/nova/driver.rs  |  85 +++++++
> >  drivers/gpu/drm/nova/file.rs    |  70 ++++++
> >  drivers/gpu/drm/nova/gem.rs     |  50 ++++
> >  drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
> >  drivers/gpu/drm/nova/nova.rs    |  18 ++
> >  include/uapi/drm/nova_drm.h     | 101 ++++++++
> >  rust/bindings/bindings_helper.h |   5 +
> >  rust/helpers.c                  |  23 ++
> >  rust/kernel/drm/device.rs       | 182 ++++++++++++++
> >  rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
> >  rust/kernel/drm/file.rs         | 116 +++++++++
> >  rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
> >  rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
> >  rust/kernel/drm/mod.rs          |   9 +
> >  rust/kernel/lib.rs              |   7 +
> >  rust/uapi/uapi_helper.h         |   2 +
> >  21 files changed, 1630 insertions(+)
> >  create mode 100644 drivers/gpu/drm/nova/Kconfig
> >  create mode 100644 drivers/gpu/drm/nova/Makefile
> >  create mode 100644 drivers/gpu/drm/nova/driver.rs
> >  create mode 100644 drivers/gpu/drm/nova/file.rs
> >  create mode 100644 drivers/gpu/drm/nova/gem.rs
> >  create mode 100644 drivers/gpu/drm/nova/gpu.rs
> >  create mode 100644 drivers/gpu/drm/nova/nova.rs
> >  create mode 100644 include/uapi/drm/nova_drm.h
> >  create mode 100644 rust/kernel/drm/device.rs
> >  create mode 100644 rust/kernel/drm/drv.rs
> >  create mode 100644 rust/kernel/drm/file.rs
> >  create mode 100644 rust/kernel/drm/gem/mod.rs
> >  create mode 100644 rust/kernel/drm/ioctl.rs
> >  create mode 100644 rust/kernel/drm/mod.rs
> > 
> > 
> > base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
> > -- 
> > 2.45.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
