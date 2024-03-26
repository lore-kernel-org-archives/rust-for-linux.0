Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAD5A7B4
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711472069; cv=none; b=UqVQ9sv+dLvAzCWVAFlxZIG+etYyCFSXm2oIyRP91WNoiZkyMwM9bE4dXdP1g9ztGrB0VcNpFi/TcVnvvRoG4AMeAM+kcDAQTLyxp7iAnazq5ttCPuYRO8RE5YhbBqclZnIhbaKv7uZeaxpk3jF9CpTa1KPdG82ds6JJn6KfKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711472069; c=relaxed/simple;
	bh=WVcXS0H856uD7AAFBBde56ZbkMmmZOmFEyzgwjQDxcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KDv0rESQ61SwvxvtZlaQ0qKsXK4tG036izEhQKD5McgZCjozhd5Yrk0nDN/8N/V2YcwVaOv5iSeBp/1bRNvEJLAc+fnG/AdjDRs8+XZPx91R5b9TBG43S+kveNUYWG/KFKoWXXVbjJ7aNQRV1/qBgXwngceTF+Ajw4vCHeJ+Qsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KciqoqAn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KciqoqAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711472066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJ+eC0Is2RIgb1SbevZW99bkWB3zskcTfRDHyTD1ce0=;
	b=KciqoqAnbUrNTORSEeJD+2N6dCHOLr7pbVRiAUCBwLvbszbkcwVjpO8tIQCfPrvTZhwKrZ
	pAavRqMjqNnhArycrWvc6mLlYfrbRl7damEhfMfjicUc6zXcPvJHTTYTvue5pQm9N99RVJ
	TwWUNwt3zV7+OZGKmLCZ+nJvE/DPgf8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-xwFsqioENYyXUM8tlWNysw-1; Tue, 26 Mar 2024 12:54:24 -0400
X-MC-Unique: xwFsqioENYyXUM8tlWNysw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d6c8f170e2so30588461fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 09:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472062; x=1712076862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ+eC0Is2RIgb1SbevZW99bkWB3zskcTfRDHyTD1ce0=;
        b=JUpNu7X/JhYvqVrbhj8p2KLyI8uFSuyx+GK61X6TALdyxJ5GT6es9E/JzhwtjfLlcZ
         bAbXO9HpyXcOTZUy9fPA/vyCW5TkdmCe4PosVL0/q9vSmf7CCBNJHUE73bxUqjSz7VgL
         Ql6BWj8MpBS0BsocE8PepN6RXZSO7gkAdL9QG76HAAx0r/TOpDbiNLWMcP+cRionZ64U
         5H4R3eNlKatMDDp8bia8FYSfto36tKgwukUfgd3nEn/+ab7oEJ2x/GIyPmFrSJJJHlrF
         xTgBTFQK6pb4Uw0q6Fxe+ldJut7VPiuHgWPh/8sXyzVVvWHlTnkCUmmUlzu7i6mASr7p
         1ZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoX1TVcXmTnLxRGU/+lKxdnxdZQzMKzm6xeE6aUDfsjTtLC9bq7c4BuGVihhuyKyBAzqVGAisaU1wkU/3mX2f+s4QP7i8B7FBMf5UpiCc=
X-Gm-Message-State: AOJu0Yzxf4+83XxjsSgoYfOU4h1EJp/mGdh0pcxyU3MKv0PUlY8UirPR
	Rt3CcZ3kSz4DDydxUSOcNPfnk0qPTKi29liesKnvvf7mcgyerrwizkSKTJfpVkEV5wDQOrAYAXJ
	9ioHD/tC1Vb+j4yrx4W7ITsSmysARRtU8GWxhS5wmpeYOi4YpoF9t7JyEGZqjlmC1
X-Received: by 2002:ac2:5b5a:0:b0:513:e7a0:5aa5 with SMTP id i26-20020ac25b5a000000b00513e7a05aa5mr124178lfp.51.1711472062573;
        Tue, 26 Mar 2024 09:54:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIWA3/P3llUagWmHwuTzC0zTuP/9TAy0hMWpdMqunWpRt0YNDjNDfXC9hwpns0qt2+Cy3jpQ==
X-Received: by 2002:ac2:5b5a:0:b0:513:e7a0:5aa5 with SMTP id i26-20020ac25b5a000000b00513e7a05aa5mr124139lfp.51.1711472062166;
        Tue, 26 Mar 2024 09:54:22 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id gx24-20020a1709068a5800b00a46f0d133b9sm4418392ejc.98.2024.03.26.09.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:54:21 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:54:19 +0100
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
Message-ID: <ZgL9u-L1T_J1UZLt@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-9-dakr@redhat.com>
 <2024032509-tanned-calamity-4e1c@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032509-tanned-calamity-4e1c@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 07:21:04PM +0100, Greg KH wrote:
> On Mon, Mar 25, 2024 at 06:49:12PM +0100, Danilo Krummrich wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > 
> > This allows access to registrations and io resources to be automatically
> > revoked when devices are removed, even if the ref count to their state
> > is non-zero.
> 
> So it's re-implementing the devm_*() calls?  Why?

It's not. Taking IO resources as an example it's more a generalization of what
e.g. DRM solves with drm_dev_unplug() and drm_dev_{enter,exit}().

While devm_*() ensures to, for instance, iounmap() a mapping when a device is
detached, the Revocable<> resource ensures that a driver can't access the
pointer pointing to the just unmapped memory anymore.

So, this isn't something that replaces devm_*(), but kinda builds on top of it.
For instance, we could call Revocable::revoke() from a devm_*() callback.
However, and that' what this patch currently does for simplicity, we could also
just call it from the corresponding driver's remove() callback.

> 
> And this will trigger only on remove, but which remove?  The bus remove?
> Or the unbinding of the driver to the device (two totally different
> things, be specific and very careful here.)

The above comment says "device remove", maybe say device / driver detach
instead?

> 
> If this is implementing the devm_() calls, why not call them the same
> thing?
> 
> 
> > 
> > Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
> > Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/device.rs | 120 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 119 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > index 7309a236f512..707c699c3090 100644
> > --- a/rust/kernel/device.rs
> > +++ b/rust/kernel/device.rs
> > @@ -4,7 +4,22 @@
> >  //!
> >  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> >  
> > -use crate::{bindings, str::CStr};
> > +use macros::pin_data;
> > +
> > +use crate::{
> > +    bindings,
> > +    error::Result,
> > +    init::InPlaceInit,
> > +    init::PinInit,
> > +    pin_init,
> > +    revocable::{Revocable, RevocableGuard},
> > +    str::CStr,
> > +    sync::{LockClassKey, RevocableMutex, UniqueArc},
> > +};
> > +use core::{
> > +    ops::{Deref, DerefMut},
> > +    pin::Pin,
> > +};
> >  
> >  /// A raw device.
> >  ///
> > @@ -95,3 +110,106 @@ fn clone(&self) -> Self {
> >          Self::from_dev(self)
> >      }
> >  }
> > +
> > +/// Device data.
> > +///
> > +/// When a device is removed (for whatever reason, for example, because the device was unplugged or
> > +/// because the user decided to unbind the driver), the driver is given a chance to clean its state
> > +/// up, and all io resources should ideally not be used anymore.
> 
> Wait, unplugging a device and unbinding a device from a driver are two
> totally different things, do NOT get them mixed up or assume that they
> are the same thing at all please.  They have different lifetime rules
> and different patterns of what happens.

I think the comment does not claim that device unplug and device / driver
unbind are the same thing. I rather think in this context the expection is that,
ultimately, both result into the fact that the corresponding device resources
are not available anymore and hence shouldn't be used anymore. Where the latter
is enforced by using Revocable<>.

> 
> So this needs to be taken out and rewritten from the beginning please.
> If the comments describe something that is incorrect, I can't trust that
> the code is correct...

Not sure the comment is actually claiming something incorrect. If, with the
above explanation, you still think so, please let me know how to phrase it
correctly, such that I can improve this patch accordingly.

> 
> thanks,
> 
> greg k-h
> 

