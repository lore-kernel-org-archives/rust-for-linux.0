Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55AB1A270
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717782958; cv=none; b=Qrg+D8Z3fy8czIt3YAj4+XMZfLg+TBbel44/GiaSCtIxXHlwNjd9HnE7nXErUfMbhivRE5RFYN2czQTvGneeqr1jkdP/UKj3JGKe6AXxN/f5jA7ZqRPXnRx5GFmDIG5ytj02lUggj/KyMWe2Gtby5CZ06G7XEZQxVxcQ9f3cDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717782958; c=relaxed/simple;
	bh=c3maDcSPYeDxQbuUYm1YkUvjXKWQImXHG/R54siDMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FL74jEzXOfilVa8wu+oCxHqktXfBiI7sh5R5xglK5gYFVTXumtHbzyDcL/ZHPJ8WchoEuuLB4t/U6Zj/iXKD0l36tjGDK6YfkS988KTwYL+HBTt7U23QFQ5gklldoBd6Or6Mi2YuBlFNNLP1ZcRdLPerKiEOH786UKYfhfc2s04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZsnGQM33; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZsnGQM33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717782955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c2USRNsUh4hVMRo8qpq7zv19zfSRCqrdM7qMgjktFAk=;
	b=ZsnGQM33b3kf3iI0jBaLoOhssVfT0GlFPdSBFZlo1qG5x0b+OKFG3a24yVBn6who4pDbIu
	ykSRf23I2qnewzqa3oGOOSP0kUhp/vVXYcTyrRo7wfI8KzrVEH6u4fCDL8N6Robdsa0aok
	zqOaqHtPk05IfRm07sFomxIqcXM0MTU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-QNEAQoWcMYKOiaWV3UnaRg-1; Fri, 07 Jun 2024 13:55:54 -0400
X-MC-Unique: QNEAQoWcMYKOiaWV3UnaRg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3580f213373so1574130f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 10:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717782953; x=1718387753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2USRNsUh4hVMRo8qpq7zv19zfSRCqrdM7qMgjktFAk=;
        b=TnmjPZPeY5qKUzBDzVZdrfJEMC54/Bh26MaFBREgoIEaSkYMYE2mSbFGTseJe+0OZ1
         cVmiPKXy5EXAkY95wC4yx1Tdh18yA6j7gd8py/cHlyjyrxqueuiEz2NMbvFhZbf4kvV/
         /aFQEQeL6Y/33d9bXGRt36zqcFmstaAI5VqL6qogfKGXMG5YOjzbg7pmEXJDettFjUgd
         uzdFYanyEQw2chCT99mqNlvGHgccIGRkaAuh7GsBBn8ZSrfJlISfVG/6YUookPiD1I3N
         LoYmmFhVPmWz2k7Rz5rRFTC1q4zwe60ewBPqIzVbJToJTfHRsxbKa7wRqB1zSwzUEc6R
         4Y2w==
X-Forwarded-Encrypted: i=1; AJvYcCUY4NLJaMs9UZuwarC3DaPx5wrG/qcBoj0Vn9Nz6DLGVjWn9qklft5v33chYPrgxcgGWC488Q/FUqPEQSwPoPB6HXhYbqqUwixzenACb/I=
X-Gm-Message-State: AOJu0YzcwW0GgXTvRVhjqGp+T8MgdVn8hmeHIxVJJZaS9gbxZGBWI2dD
	xToDSFdM9v+JuCvsSFM4kHLqgGAcmH40EL4c4EOwR6dgZjAHkdzd3mCz1kVrGiL4rH7WVBh971t
	QSAG6r2xeR+erDvrsCS7rR7QAaAwSJYzEVCnf/h2acVz6S/zH6vjczGVJWuMnmJnR
X-Received: by 2002:a05:6000:c6:b0:35d:cd60:cc59 with SMTP id ffacd0b85a97d-35efed54c85mr2247713f8f.35.1717782952928;
        Fri, 07 Jun 2024 10:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd0q63Q+ll6ZV0ldUT81ypvw/xe2C9I7iCd+hxmTDRSsRX+Yo5EMV9qMgBA5eGvpIRAqCJCQ==
X-Received: by 2002:a05:6000:c6:b0:35d:cd60:cc59 with SMTP id ffacd0b85a97d-35efed54c85mr2247698f8f.35.1717782952564;
        Fri, 07 Jun 2024 10:55:52 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e983d8sm4420813f8f.84.2024.06.07.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:55:51 -0700 (PDT)
Date: Fri, 7 Jun 2024 19:55:49 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, wedsonaf@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZmNJpQbTtFUPOkAJ@cassiopeiae>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
 <ZmMMMyi3uXTFtIae@cassiopeiae>
 <2024060745-palatable-dragging-32d1@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024060745-palatable-dragging-32d1@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 05:41:11PM +0200, Greg KH wrote:
> On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
> > On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> > > Anyway, that's all hand-wavy right now, sorry, to get back to the point
> > > here, again, let's take this, which will allow the firmware bindings to
> > > be resubmitted and hopefully accepted, and we can move forward from
> > > there to "real" things like a USB or PCI or even platform device and
> > > driver binding stuff.
> > 
> > In order to continue I propose to send out the following series:
> > 
> > 1) minimal device and firmware abstractions only
> 
> Sounds good.

Just a heads-up, I'll probably send this one quite a bit earlier than the other
two to make sure to unblock Fujita on their PHY driver.

> 
> But after this, I don't want to take ANY driver core rust code that is
> not able to live in the "normal" part of the Linux kernel tree.  It's
> just unsustainable to have it all in one directory sorry.  If this
> deadline makes that kbuild work actually happen faster, all the more
> reason to have it.  If that kbuild work is somehow stalled due to other
> issues, please let me know what that is.
> 
> > 2) v2 of all other device / driver, devres and PCI driver abstractions
> 
> I will be glad to review this.

Glad to hear that!

> 
> > 3) v2 of basic DRM driver abstractions and Nova
> 
> I love it how one of the most complex driver subsystems we have (drm) is
> attempting to be the "first real" driver use for the rust apis.  Bold
> move :)

I'd argue that as one of the most complex driver subsystems we have a lot of
need for the advantages Rust provides to us. :)

> 
> > The v2 series would contain static driver allocation (in case of DRM even const)
> > and quite a few more simplifications around `driver::Registration` and
> > `device::Data`.
> > 
> > Does that make sense?
> 
> Yes, but note, I'm going to probably push back on the "driver::" stuff.

That's OK, I'm happy to convince you of its usefulness. :)

> But will do so with more constructive criticism as I want this to work
> very much and I agree that I think we are both talking past each other
> in different ways.  Mostly probably due to my total lack of Rust
> experience, my apologies, thanks for your patience with me for this.

Very much appreciated! Please don't hesitate to ask for more explanation on
certain things if they're unclear. I'm happy trying my best to provide useful
answers.

- Danilo

> 
> thanks,
> 
> greg k-h
> 

