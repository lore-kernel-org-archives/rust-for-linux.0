Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1F1B143D
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jun 2024 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899814; cv=none; b=mcFwFyBlM5Z+reVsjKr0AZdoD+vj+DEC1eX31fL3KX2kO0wwW0vt7hC1Sm7Htzd88Wx63okhkVt5NVYFVwgO1/5y5c/1VvkqB7y3F0O2B35ucfER9L2/we5/D6Go/KUQb5qLjWbTkpgJatkJz+9eXypxTnrTNe110Ggsdq2R/Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899814; c=relaxed/simple;
	bh=ssSMczIhe71muC2Ge+dwgnfPO/j9QwLwj7JhCu3oUzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=o+k7H+mZxLczIyL4SZBSBKHqtl1BqYd6iyNZB1M45dSlwlPQrpmnrlLJTsdqnKxneZhX2xzJZDIObE/mY2lp8eavz4+BKrcE4dUFoFFkP6C0nPtrLHI+4av6fICnt0NDfoDn+XlcS8sNOKZcNl2DSf01OU9um+bgaO5e+fVJBjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rmt/2x/H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rmt/2x/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718899811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWEIbolo6Iwem2kYP/7UWqPpNHLzHJcoF74xqzSRPHU=;
	b=Rmt/2x/HTlBGHiAb4xTd66kafkMIdDwp6D/mjGoDJ2JacvlodvvWrxg/j6ljN+orCuXiDv
	Yv0pj5m/s/6+VBonQxaieT6p5F6gWM6MSeIq92n2tKNhcvtRhEpkXBLz0dhbXtl9uholbc
	1Xjxa4436RdN+N4pWfXPJJW8JE4fmjU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-WPNkbGYqMc-RnFXk4FNx-g-1; Thu, 20 Jun 2024 12:10:10 -0400
X-MC-Unique: WPNkbGYqMc-RnFXk4FNx-g-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ec308d6f53so8953251fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jun 2024 09:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899809; x=1719504609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWEIbolo6Iwem2kYP/7UWqPpNHLzHJcoF74xqzSRPHU=;
        b=TZBayrhv1x4c8RWPc0I/FzYQ6b0CmoYMVgoIUESqLxINL0RYnYcVFvEeoKHI4DKL19
         g6eBZuztHkYAxqvsefHbAn1D5tMSZer6LnlRiL08+eipR0S1B0pZfh7YXDDaU+HSrSE8
         ZHrAAP3Z1tvJI1CXysvpKjGP4F5Yx7HsmsJUknvoLK5DbU5OvOW/o58ykLu5bFpFIqTJ
         3nJUw6kNhTT7yvzS2RSqukr0U2fevNzqvdpC2vuxCHRd/dLdjlZl09j9Hfxv1k8PGper
         gt304BKOQeNwAcTgqyCBMrbpNfp2KTJciRUbORp86DsvxgUVXUZqcXUN/Z+im1VDTECx
         EYhA==
X-Forwarded-Encrypted: i=1; AJvYcCXQCiASdF82tXqF38nq/QUbr3RviCcd/2iluG6YzQ/tVfb+gYOyAWMHDqZoBUJc1rakk3a4p7/ljYOcdxE6glxh3fvfNKlHN0vtg3RlAfg=
X-Gm-Message-State: AOJu0Yx32v2Vi0AataxZQ5n5uyoNX9V9j8W36jHEqbBWo7ydS94Fjvbv
	Z3bnm9hm7uQSeACVRer2ta36ysvDHqnKxAo67/OJmJnzHU2HOpR/pw56Po3hb6rS3+vUrOPJg2B
	tXTcH8K+xq5wHRdmf0fgN2IgTx+KjhWeZm9k2g6hMs9ls3V9cobBNxHgBSLbeIJ3h
X-Received: by 2002:a2e:9c04:0:b0:2ec:4399:9c0f with SMTP id 38308e7fff4ca-2ec4399a2b0mr23102341fa.0.1718899808747;
        Thu, 20 Jun 2024 09:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqT2XLxCu5eI2DOyMEtopS2O39oKnD5e98TK9RmyDbH3ZDUd9YDTErMjogmKKv4i+QXKnhpQ==
X-Received: by 2002:a2e:9c04:0:b0:2ec:4399:9c0f with SMTP id 38308e7fff4ca-2ec4399a2b0mr23102001fa.0.1718899808264;
        Thu, 20 Jun 2024 09:10:08 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d1e390bsm30844945e9.35.2024.06.20.09.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:10:07 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:10:05 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, bhelgaas@google.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, airlied@gmail.com,
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 01/10] rust: pass module name to `Module::init`
Message-ID: <ZnRUXdMaFJydAn__@cassiopeiae>
References: <20240618234025.15036-1-dakr@redhat.com>
 <20240618234025.15036-2-dakr@redhat.com>
 <2024062038-backroom-crunchy-d4c9@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024062038-backroom-crunchy-d4c9@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2024 at 04:19:48PM +0200, Greg KH wrote:
> On Wed, Jun 19, 2024 at 01:39:47AM +0200, Danilo Krummrich wrote:
> > In a subsequent patch we introduce the `Registration` abstraction used
> > to register driver structures. Some subsystems require the module name on
> > driver registration (e.g. PCI in __pci_register_driver()), hence pass
> > the module name to `Module::init`.
> 
> I understand the need/want here, but it feels odd that you have to
> change anything to do it.
> 
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/lib.rs           | 14 ++++++++++----
> >  rust/kernel/net/phy.rs       |  2 +-
> >  rust/macros/module.rs        |  3 ++-
> >  samples/rust/rust_minimal.rs |  2 +-
> >  samples/rust/rust_print.rs   |  2 +-
> >  5 files changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index a791702b4fee..5af00e072a58 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -71,7 +71,7 @@ pub trait Module: Sized + Sync + Send {
> >      /// should do.
> >      ///
> >      /// Equivalent to the `module_init` macro in the C API.
> > -    fn init(module: &'static ThisModule) -> error::Result<Self>;
> > +    fn init(name: &'static str::CStr, module: &'static ThisModule) -> error::Result<Self>;
> 
> Why can't the name come directly from the build system?  Why must it be
> passed into the init function of the module "class"?  What is it going
> to do with it?

The name does come from the build system, that's where `Module::init` gets it
from.

> 
> A PCI, or other bus, driver "knows" it's name already by virtue of the
> build system, so it can pass that string into whatever function needs

Let's take pci_register_driver() as example.

```
#define pci_register_driver(driver)		\
	__pci_register_driver(driver, THIS_MODULE, KBUILD_MODNAME)
```

In C drivers this works because (1) it's a macro and (2) it's called directly
from the driver code.

In Rust, for very good reasons, we have abstractions for C APIs, hence the
actual call to __pci_register_driver() does not come from code within the
module, but from the PCI Rust abstraction `Module::init` calls into instead.

Consequently, we have to pass things through. This also isn't new, please note
that the current code already does the same thing: `Module::init` (without this
patch) is already declared as

`fn init(module: &'static ThisModule) -> error::Result<Self>`

passing through `ThisModule` for the exact same reason.

Please also note that in the most common case (one driver per module) we don't
see any of this anyway.

Just like the C macro module_pci_driver(), Rust drivers can use the
`module_pci_driver!` macro.

Example from Nova:

```
    kernel::module_pci_driver! {
        // The driver type that implements the corresponding probe() and
        // remove() driver callbacks.
        type: NovaDriver,
        name: "Nova",
        author: "Danilo Krummrich",
        description: "Nova GPU driver",
        license: "GPL v2",
    }
```

> that, but the module init function itself does NOT need that.
> 
> So I fail to understand why we need to burden ALL module init functions
> with this, when only a very very very tiny subset of all drivers will
> ever need to know this, and even then, they don't need to know it at
> init module time, they know it at build time and it will be a static
> string at that point, it will not be coming in through an init call.
> 
> thanks,
> 
> greg k-h
> 

