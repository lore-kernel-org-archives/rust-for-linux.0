Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B5A954
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711434890; cv=none; b=jUXTiYEvCDUcu9qBtNz2AWumrrFfCLwV/ShYcuAlnLpmsDLYe/C11qDpGEk0JUf5e8HxbeU6/wAjPoW92XR5pImokSJhmAuODgAyds1g7lbsS2KO/AvrNCHOfByPLMcLaJERVBVKN9gxO8EA8QTUjPrx48ocJFnNarpLqjWUWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711434890; c=relaxed/simple;
	bh=gO6Na9BkkIW3cTqFhPkilAo4Cq4SFPcoG6gBOazwW54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzBp2txbjXVGvQIjWpGXh55P/1S94VBvOlQEjESFsohu0T/RaI9lIfPVi7de0pXYTUQgcZHkLe3xThsXb1dCAK0Ik4kgfgCk6A7nuE0gMA0Es1wOn8pFwtqr/Hpr1AhQFUW641YkB2BETRux1pTSfL8yu/OkGQzxOBq5crnVqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PUlxpurF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PUlxpurF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711434888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzNhwpd5xedlbWxj8dWvJN1JPUpbBgrK+qsHh7egwgw=;
	b=PUlxpurF40a4NdJMBKaNOF/+fjSU8uiX9qi3tRHzt24UBW3n7HSLJt9ixraoDa6XlB2trj
	rBKiitbaPUsQJTFChb4VJDHp25q9Z3W7mQ8O1cOp+Is5xly9bBm0lALD98nqOQ26g2qTW9
	nAl+EP3F9LGiSi+5abYzfSegcDSHwoA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-LNVsRezWO7e85GmlD57RBw-1; Tue, 26 Mar 2024 02:34:45 -0400
X-MC-Unique: LNVsRezWO7e85GmlD57RBw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6963cd45fddso115239816d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 23:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711434885; x=1712039685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzNhwpd5xedlbWxj8dWvJN1JPUpbBgrK+qsHh7egwgw=;
        b=bNnEg62sh2yHnrkK27bEPuiCcDB/FNp6Q9odihthG3KSuw12VGxx1sXog3/CW6pxjb
         9fQEDtJefGuGkZG1V7ndyBJqro/bm8lf28dGDUiviy679yQkIYDYDhizASHydAx80S42
         Fyw+DHhS33Jf2sr/xf7fARYSso7/+Sj78mV5TXJZTaY0D8ovv+21NnA0ciobhe7BvvUz
         ie79F4yUPOyN0EOZQE6uig9KgXPDfP+BZKlDLMeSMwOkDN2CLBTkHocrLg/4LOSfOT4j
         +PZGcLGqJaXYqnJDJI7N/7LN2oesOcR5iQfeomMM0GkFYKAitBiSpdK41eb+Vno9kEts
         qR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhT/geG4MlbK1bx0d+3GEDwAL2XnliEoZEvGGbugnc/JlNEBTOwRLXBWjICABvlXddXOTMg6Xc49wuPkEZg+hEA4jdjOkWzACExrZk7+w=
X-Gm-Message-State: AOJu0Yx+WpoI3s8wb4T4OqY6JtGwKVtYCh0waNyNhDaaq0eFaIqDN1UQ
	bQ5nDsIWXb+sjTNq0p+3QkGAYOqKsxo6F8hHFNHYO39TQdk7YXmNVA+xx/TuGqq9vKg5RMk4VtX
	azrb8um/kscaRVoM4w7wf9GCaevas166FZREfYo9fOZIHDU1JXuwXgkQqXxb6fHOIBTBeQxFCVS
	LraWCXqWX2xhkcRp9Yig+rByEbXOkA3/v75ZTEg9k=
X-Received: by 2002:a05:6214:c6c:b0:696:8ecf:5742 with SMTP id t12-20020a0562140c6c00b006968ecf5742mr681048qvj.4.1711434885504;
        Mon, 25 Mar 2024 23:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuKhudNzqVu1Vkbt/8BJR/bAgZP2fJRW1wYE5Q0NvJEEGjezabVDL2BT6lb6K9v8ETugDUTBMV470jGw2V42U=
X-Received: by 2002:a05:6214:c6c:b0:696:8ecf:5742 with SMTP id
 t12-20020a0562140c6c00b006968ecf5742mr681028qvj.4.1711434885233; Mon, 25 Mar
 2024 23:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh> <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
 <2024032601-deceased-premiere-1c02@gregkh> <CAMwc25omcj6_OKdcBkke5yzC2M5oNO=E3EG4aezNfEMRAp9Wvg@mail.gmail.com>
 <2024032606-dutiful-tusk-5da3@gregkh>
In-Reply-To: <2024032606-dutiful-tusk-5da3@gregkh>
From: David Airlie <airlied@redhat.com>
Date: Tue, 26 Mar 2024 16:34:33 +1000
Message-ID: <CAMwc25ozHGVS5jE3QnDx7EgryL+=dCdUbm6PNBcsy5P8CtX8Lg@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, Asahi Lina <lina@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> I don't mind 50 patch long series, those are fine as we can see how
> things are actually used.
>
> But for complex beasts like DRM drivers, perhaps people should stop and
> implement the tiny "easy" things first, with working users, to verify
> that it is all ok first before biting off the big ones.
>
> Like implement a "simple" bus, which means that you have to have the
> driver core bindings all working properly and correctly.  Once that is
> done and merged then move to the next thing (i.e. a more complex bus
> like PCI or USB or platform).

This is just reintroducing the chicken/egg problem. Implementing a
"simple" bus usually means implementing a "simple" driver for that
bus. Implementing a simple driver for that bus often means
reimplementing an existing driver that is already in the tree. The
"simple" bus driver gets pushed back on because it's duplicating
functionality that is already in the tree and nobody reviews anything
and we re-enter the deadlock cycle. We are actively trying to break
the cycle and get stuff upstream so this can be properly explored
rather than 20 independent trees carrying out of date patchsets to get
anywhere.

> Drivers consume from almost all of the kernel at once, attempting to
> write a driver in rust requires bindings from all of those things at
> once, a very daunting and difficult task as people are quickly finding
> out.  Break it down into smaller things, like the phy driver did, and
> move forward that way if people wish to see rust succeed.  Don't attempt
> to go and do the biggest beast first, that's just going to make people
> frustrated quickly as you have to interact with too many different parts
> of the kernel all at once.

This is all of that, in the drm community we have an out-of-tree
driver done the hard to upstream way, we've decided a small simple drm
driver is the simplest place to write a driver from scratch that has a
friendly enough maintainer that it won't be refused on grounds of
duplication or not implementing a completely functional driver. I
don't think it's unreasonable to start this with a drm driver, we've
at least got developers and maintainers who understand lifetimes, it's
just how we get over the initial device/pci/drm bindings without
blinding intermediate developers with the patch noise.

Next time I think Danilo can just send the monster patchset and we can
see how people feel about things then as well.

Dave.

