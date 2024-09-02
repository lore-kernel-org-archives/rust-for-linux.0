Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10FE1C62A0
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Sep 2024 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295207; cv=none; b=APWIxKS/8lfiPgX2ZOnbf90hLdSteWnuZfPrUZ5px1z2nx3Jn+iE70uZcGEREhVKVv8SFdFetW47+/Fe/s0s/tyLiw7AX0HdY0tiZrjdeTQ2PdJpJbDi+OM2asOAjVbsZl/btRU1w78rXqxM6GIjf1JNmKgEhmIMKE2Kx4S0Eog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295207; c=relaxed/simple;
	bh=B7/V0d7uhVQ5KF9odhi5iM1UE82Yqz+Y/gb39iNC1BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUH6P1aXHJm6fjg5SEdN08Tohv+8rvM4DKDCNYe/ViUbvV0wO4BJFqBxyP3C7Z8anmG3+r7bEWfHLB8/n6aZoytpg6UsEz0bNoWn/g+QTVKrw/kkqvA5dZJOetn0xMke2f03xIgmi88F1WICj4f7Oyxy7ivLXQIyluQzBcfBm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Z7bcQZj0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Z7bcQZj0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso38544555e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Sep 2024 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1725295204; x=1725900004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qxn7jDrhXcDat8mwJsxtE8edha00W1MVu07WpvK7c6k=;
        b=Z7bcQZj0IHiGh7ute/u9D94NW4su6pDG1FA8C3aWoVrfrx+AAkHL6RjWo5lH0ZhPCW
         JXjkMACq0y2lu7gVgGEP0oc5FKW7sSTBpGy1uHEF8f4j2YHb4OatZ8/cp9rTLfwbIfI7
         Jh3ZpjvvTgBm8UuffzSR1DlIaodlycqXE0sD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725295204; x=1725900004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxn7jDrhXcDat8mwJsxtE8edha00W1MVu07WpvK7c6k=;
        b=D8ShgGOVe8NCMJtRMSPMEN/MKPPn4IU5QqsAd7MolMyu4P9MjjmJjPr5f4HLfHiHKp
         P70pfBJ2oQUJmlY7PC0vNLPyuESUWsZ+FTqSl9FIXrvyK1LavgcvLSS+lMur1aJbzbzs
         wCCblTzs2XdaaEu2ToUi77sFXlXCs14dSR6jMt7wa0zQ10IjOI7/NKNwJqEQSXSKSC9Z
         EtUoZ14SW1cKpzjGKGVMkHWC15MTLTPKrWr0TzMckNHQGK+lDzKGrmrEJjSbX4viMs1g
         x/mALUofMgYiOju4B1fF4DqR/aGIT1LBEl0RpP5cewqrfkBddNvQRs1f0KlXLLgzTVFO
         JHog==
X-Forwarded-Encrypted: i=1; AJvYcCVagVugRPczlwVPOAzcR1XzjQCcr3e4RIK62K8RPhYxUrsv5Q3LFo3BunC9BXO+BXVso9WhVIlN9/G4Y9M9mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI7VqmUYzbLgxzpMW3Rj9H41ggCMSZcn17A36J9DU/rWVp1EaQ
	W8kOHVMZS4ZFAbFB6aUWTyRF4dlMoKCI48x9s1ha8XhiY9k6k7lRSrBruDa/GJg=
X-Google-Smtp-Source: AGHT+IGE14ktT1PD1qJMhFnhMzNGipg0c4D+FGJxtT3YeSHoyJQBt14wG1cM+FJZoDWCYkaSr3vGdg==
X-Received: by 2002:a05:600c:1d89:b0:427:fa39:b0db with SMTP id 5b1f17b1804b1-42bb01e5bffmr114062755e9.27.1725295203677;
        Mon, 02 Sep 2024 09:40:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bacaac810sm162739935e9.33.2024.09.02.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:40:03 -0700 (PDT)
Date: Mon, 2 Sep 2024 18:40:00 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <ZtXqYGt3g_YY7RUN@phenom.ffwll.local>
References: <20240618233324.14217-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Wed, Jun 19, 2024 at 01:31:36AM +0200, Danilo Krummrich wrote:
> This patch series implements some basic DRM Rust abstractions and a stub
> implementation of the Nova GPU driver.
> 
> Nova is intended to be developed upstream, starting out with just a stub driver
> to lift some initial required infrastructure upstream. A more detailed
> explanation can be found in [1].
> 
> This patch series is based on the "Device / Driver and PCI Rust abstractions"
> series [2].
> 
> The DRM bits can also be found in [3] and the Nova bits in [4].
> 
> Changes in v2:
> ==============
> - split up the DRM device / driver abstractions in three separate commits
> - separate `struct drm_device` abstraction in a separte source file more
>   cleanly
> - switch `struct drm_driver` and `struct file_operations` to 'static const'
>   allocations
> - implement `Registration::new_foreign_owned` (using `Devres`), such that we
>   don't need to keep the `Registration` alive on the Rust side, but
>   automatically revoke it on device unbind
> - add missing DRM driver features (Rob)
> - use `module_pci_driver!` macro in Nova
> - use a const sized `pci::Bar` in Nova
> - increase the total amount of Documentation, rephrase some safety comments and
>   commit messages for less ambiguity
> - fix compilation issues with some documentation example
> 
> [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> [2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
> [3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
> [4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Ok finally stopped dragging my feet on this, went through my old comments,
looked at stuff again, and wrote some replies.

I think all but the question around type safety for drm_driver->features
can be sorted out post-merge, when we have a driver that needs it. The
feature flags stuff I think essentially makes the current abstraction
unsafe, and you can blow up when constructing a new drm::Device instance
if you're creative enough I think.

Cheers, Sima

> 
> Asahi Lina (4):
>   rust: drm: ioctl: Add DRM ioctl abstraction
>   rust: Add a Sealed trait
>   rust: drm: file: Add File abstraction
>   rust: drm: gem: Add GEM object abstraction
> 
> Danilo Krummrich (4):
>   rust: drm: add driver abstractions
>   rust: drm: add device abstraction
>   rust: drm: add DRM driver registration
>   nova: add initial driver stub
> 
>  MAINTAINERS                     |  10 +
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/nova/Kconfig    |  12 +
>  drivers/gpu/drm/nova/Makefile   |   3 +
>  drivers/gpu/drm/nova/driver.rs  |  85 +++++++
>  drivers/gpu/drm/nova/file.rs    |  70 ++++++
>  drivers/gpu/drm/nova/gem.rs     |  50 ++++
>  drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
>  drivers/gpu/drm/nova/nova.rs    |  18 ++
>  include/uapi/drm/nova_drm.h     | 101 ++++++++
>  rust/bindings/bindings_helper.h |   5 +
>  rust/helpers.c                  |  23 ++
>  rust/kernel/drm/device.rs       | 182 ++++++++++++++
>  rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
>  rust/kernel/drm/file.rs         | 116 +++++++++
>  rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
>  rust/kernel/drm/mod.rs          |   9 +
>  rust/kernel/lib.rs              |   7 +
>  rust/uapi/uapi_helper.h         |   2 +
>  21 files changed, 1630 insertions(+)
>  create mode 100644 drivers/gpu/drm/nova/Kconfig
>  create mode 100644 drivers/gpu/drm/nova/Makefile
>  create mode 100644 drivers/gpu/drm/nova/driver.rs
>  create mode 100644 drivers/gpu/drm/nova/file.rs
>  create mode 100644 drivers/gpu/drm/nova/gem.rs
>  create mode 100644 drivers/gpu/drm/nova/gpu.rs
>  create mode 100644 drivers/gpu/drm/nova/nova.rs
>  create mode 100644 include/uapi/drm/nova_drm.h
>  create mode 100644 rust/kernel/drm/device.rs
>  create mode 100644 rust/kernel/drm/drv.rs
>  create mode 100644 rust/kernel/drm/file.rs
>  create mode 100644 rust/kernel/drm/gem/mod.rs
>  create mode 100644 rust/kernel/drm/ioctl.rs
>  create mode 100644 rust/kernel/drm/mod.rs
> 
> 
> base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
> -- 
> 2.45.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
