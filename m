Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6615FA91
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838018; cv=none; b=Y9y4bxHfp9BpGFGC9yi1Isct4IngRt5tDw+bKCmVxhRM9DojzS0khuNrVGKIJyOlKF8qh9H16F00QDMnMDRW+je3z7F8zgaiEFMUwlOCbMtRYLmR4mfiOo2hlvi/0QBwofqkvPxnFuddA1o+QcQG4i7DNGI0JyPpiDYvn5iMKa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838018; c=relaxed/simple;
	bh=s24wEKJioaEDvpjofSWsK2Fd6ynbiwu3tkiHbvAX9jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kGs/sz9Bk9UcrMzaNMv+z7nCmwt+fTtG2KcQwG2C1C4lYPe+JFq2c7ffvi3FjTn71RR8KTe8Cec8WMq4g41GbZvq+f3PLHi8lEYQFgdeKcbA59I5VU4euUXTY/pfRsxfizRAMrLOXl/vmK+jLGJJZ7lJcADW056Ix5SjHmn8XZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cX/7tZdJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cX/7tZdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716838015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=04BP6JgJRJaoyE7XZo+qyeTn0Ydmjf+GQEv5dhrT/JU=;
	b=cX/7tZdJJcBdXee9Uxn7uAPnmudUHnRK0e0AoM1YgN2bCqzEIH8FUFXXFP/5t7i12slyi2
	TunorN9KgUgtOUxqlEpud4Ev3PuN5utc934HT6c8Punfoi05LoQB6qth56Uk0XIhRE88dR
	gE0dXibOBfjGaXb6Uvz0cqrfNqBkrgY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-Hp_I4QR3PVS64h6_ZKPurg-1; Mon, 27 May 2024 15:26:52 -0400
X-MC-Unique: Hp_I4QR3PVS64h6_ZKPurg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35508103145so37167f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716838011; x=1717442811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04BP6JgJRJaoyE7XZo+qyeTn0Ydmjf+GQEv5dhrT/JU=;
        b=UO12foMYv+cWUto6sO/wP4NgRUTccU+O7JKQf4Hw7Roq7CxYweKIqImBrm72x6HcGy
         h0RkFxO3NJr1P249lV2quL67kCjoZkxbvRP0TnKfawHtdDCat0nKArYQC7Gh4P+3B0GC
         kF10vegyit4lQ1suNlqxzTQpmy12eNnFxNNdk6HlAA1dH9Jx+uuKtyeSreYNj4JZ8rhY
         SlvsS4ZGULO8cn6+1Y5Cs9FteGHO1dvwglQyc9HFHlc1Taeobwl7Hg9DE/GNva7Y/hKJ
         1FJfOoPdcinTvDHdeytC9sNgIOmDtuxTrZBILF6IZK4OFbw9CFyNEY8w8DJH2xRJjqtY
         asQA==
X-Forwarded-Encrypted: i=1; AJvYcCXczkGdXHZh/nrbhqneV8Z5gmnQjrLQKJsQXC7IVyOKUlrDoSWzhFe0/8PDeVQLeJOKcKzty+uLkq2XyxS6EHvxUR/+rlxlObeW3M4G2+8=
X-Gm-Message-State: AOJu0YwKaFIL3Yh/7IyIESXhoNFUStO27Zx1dvdwDdJBJwhr4ymFyOpH
	e1iy1JFcwnNN9Nb+2OM+jHjeiHmCcJdanhU7adYXZpjLUFK3gCMTZq2ebRDt+LCn5vJCibd+Ry2
	NqKvdiSFp5ZYJjnFAgGwyXsqi+y05fPHjQW1Lc+eBy64nmMhZm36oojOiW1LSa7GU
X-Received: by 2002:a05:6000:1001:b0:354:db70:3815 with SMTP id ffacd0b85a97d-355270567abmr9871315f8f.7.1716838010929;
        Mon, 27 May 2024 12:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpX5a3JazHsekJBC6hkppw/PzK2VdF3Dw2Az33nM3NarNt2rZRaGhpKwlikcM94rwQ/PNJkA==
X-Received: by 2002:a05:6000:1001:b0:354:db70:3815 with SMTP id ffacd0b85a97d-355270567abmr9871283f8f.7.1716838010499;
        Mon, 27 May 2024 12:26:50 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35aa40ee42bsm846020f8f.47.2024.05.27.12.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 12:26:50 -0700 (PDT)
Date: Mon, 27 May 2024 21:26:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <ZlTed15hXf7UROP9@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240521212333.GA731457-robh@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 04:23:33PM -0500, Rob Herring wrote:
> On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> > From: Asahi Lina <lina@asahilina.net>
> > 
> > Add abstractions for DRM drivers and devices. These go together in one
> > commit since both are fairly tightly coupled types.
> > 
> > A few things have been stubbed out, to be implemented as further bits of
> > the DRM subsystem are introduced.
> > 
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |   2 +
> >  rust/kernel/drm/device.rs       |  87 +++++++++
> >  rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
> >  rust/kernel/drm/mod.rs          |   2 +
> >  4 files changed, 409 insertions(+)
> >  create mode 100644 rust/kernel/drm/device.rs
> >  create mode 100644 rust/kernel/drm/drv.rs
> 
> [...]
> 
> > diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> > new file mode 100644
> > index 000000000000..5dd8f3f8df7c
> > --- /dev/null
> > +++ b/rust/kernel/drm/drv.rs
> > @@ -0,0 +1,318 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! DRM driver core.
> > +//!
> > +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
> > +
> > +use crate::{
> > +    alloc::flags::*,
> > +    bindings, device, drm,
> > +    error::code::*,
> > +    error::{Error, Result},
> > +    prelude::*,
> > +    private::Sealed,
> > +    str::CStr,
> > +    types::{ARef, ForeignOwnable},
> > +    ThisModule,
> > +};
> > +use core::{
> > +    marker::{PhantomData, PhantomPinned},
> > +    pin::Pin,
> > +};
> > +use macros::vtable;
> > +
> > +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> > +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> > +/// Driver supports mode setting interfaces (KMS).
> > +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> > +/// Driver supports dedicated render nodes.
> > +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> > +/// Driver supports the full atomic modesetting userspace API.
> > +///
> > +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> > +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> > +/// should not set this flag.
> > +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> > +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> > +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> > +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> > +/// submission.
> > +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> 
> This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
> I suppose some are legacy which won't be needed any time soon if ever. 
> Not sure if you intend for this to be complete, or you are just adding 
> what you are using? Only FEAT_GEM is used by nova ATM.

Good catch, I think we should add all of them, except the legacy ones. If no one
disagrees, I will fix this in v2.

> 
> Rob
> 

