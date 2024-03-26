Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985212B151
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711489708; cv=none; b=F/L70CCRM89hj7cIeR2dxbVgDPqmhB657OZZ8XKHDJlW7Zx2P9xefiE6vQUN/B9d/U5HNb/g8J91ly7EnKu+pHVhFpMJ1iKbhryzYJlqdtJvgN6wOD2K08JeLLG2osocftc2MagsvjrYdPTr7tMvF4/iJD+dWyKYkHA3Yh6Uu7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711489708; c=relaxed/simple;
	bh=6llJh8uaXP3SWcIkDGvMNS3hazSQXGdIxBAZ62166kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iIiMTwYf6yabC5ZhDsfXYomSJg+//Bwt3B1vUGNZ7epLfI14xKx+avyJ9IcdwxnKTzd+PQeaZ/07KMIW2nxrdC+3li1Vo7SBldIdxtwODnwhDXVLmnpJ2hqEHPqsopDh7LqI/ZiLSb1rWjjJ7DOzzdGAiTISAAh7szHslhKSdp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhOwz67S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhOwz67S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711489705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=82puOO7vOBue+wR9Pru9xTMnlwUk3sqY/Gr8xHU5OV8=;
	b=RhOwz67ShibcWeTwnakt9L88UmoRcF3qZub8+yc4k2bGTviXyOxVbcOmWZAGm8cZc0r/Z1
	gJ4yZmZz//TkQAqzc8EPTXi01Mg0OpqsOT2e37VeA/8dVSZhCuy1LuXBDsB7EtN2kBeHDj
	4DXBzpmuURcyn0/hARRt5+BQias5poU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-0ky5j1T3PJmP-jI4Qdb2Hg-1; Tue, 26 Mar 2024 17:48:24 -0400
X-MC-Unique: 0ky5j1T3PJmP-jI4Qdb2Hg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a46d59152c9so445247566b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 14:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711489703; x=1712094503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82puOO7vOBue+wR9Pru9xTMnlwUk3sqY/Gr8xHU5OV8=;
        b=SgOD14bp/AT0iUAuAclRKRlyE5pe7Azac1AJhuSzqvvJ7OAsPLhazKshllkFacoQc9
         5y5OWcIFl3T3pbQzde07KDYh78MiLQyNYcdacBgepN39BatWb07hC2eDvy0jlgPBM5Ap
         vYc1mRGqydBeRt0yrpPPY/Q4265W0KDaVIZZDfdzy3hFb4Uz+i2TNrTWhmqBW4iwOxT8
         OwJNcbB52z6KdOHqGrkWqqKXK1f4Tp3dE+kKlUVMnyvPkXOZuQM2K8h5j7XAFNEK32pk
         ixD0UY8lCbJXoBqbUZKa9TulDezyPfJvFN+lCO+yQoRXvYUueEV+FbbDkMA7V6ysTWmH
         I44w==
X-Forwarded-Encrypted: i=1; AJvYcCUhGUwMF2BY+W070EbhowFKUgE7+9GauJso3eIphgxqPogDwJrkKdC0q5eVC1+zSKiKwBwIHMxbgvN07Waebo2Y4+HHEkwAyySsGKiTVvI=
X-Gm-Message-State: AOJu0Yys/dgS32IMQuCVlIcDCM5rFjl+z7pmzjxrZclCWEzLY3onFfAH
	2jRI2e2J2hMWvjG8LKDPiEM+Cx1HZDEseJvbQ7uj0p/dMqvRRHNVI9VshUc1shIsjAvrk59goMk
	6AvsniX/CmU4oefwz+tjpNX4Wl3Dp3Fz0VTP6n+0SQ1pY7RFA6DOz/XtQH3coyE5J
X-Received: by 2002:a17:906:39d9:b0:a4d:f9b1:6e7d with SMTP id i25-20020a17090639d900b00a4df9b16e7dmr630886eje.76.1711489703101;
        Tue, 26 Mar 2024 14:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFuR3grwkz7w+Qrc5hJmckpQQJuSlzwJENUYsASaYmxlSq808IWf9FpJvldDVB0UKRJNLI8g==
X-Received: by 2002:a17:906:39d9:b0:a4d:f9b1:6e7d with SMTP id i25-20020a17090639d900b00a4df9b16e7dmr630873eje.76.1711489702791;
        Tue, 26 Mar 2024 14:48:22 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090609a200b00a3efa4e033asm4642879eje.151.2024.03.26.14.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 14:48:22 -0700 (PDT)
Date: Tue, 26 Mar 2024 22:48:19 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 7/8] rust: add revocable objects
Message-ID: <ZgNCo4Hvs-EjDNGT@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-8-dakr@redhat.com>
 <2024032514-happier-hazelnut-4b50@gregkh>
 <ZgMA2AFc6mJ8g3RG@pollux>
 <2024032637-nervous-blustery-2566@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032637-nervous-blustery-2566@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2024 at 07:16:51PM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 06:07:36PM +0100, Danilo Krummrich wrote:
> > On Mon, Mar 25, 2024 at 07:21:32PM +0100, Greg KH wrote:
> > > On Mon, Mar 25, 2024 at 06:49:11PM +0100, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > 
> > > > This implements the Revocable and AsyncRevocable types.
> > > > 
> > > > Revocable allows access to objects to be safely revoked at run time.
> > > > 
> > > > This is useful, for example, for resources allocated during device probe;
> > > > when the device is removed, the driver should stop accessing the device
> > > > resources even if other state is kept in memory due to existing
> > > > references (i.e., device context data is ref-counted and has a non-zero
> > > > refcount after removal of the device).
> > > 
> > > Again, device removal is different from unbinding a driver from a
> > > device.  Please fix this all up.
> > 
> > I think this isn't an "again", "[PATCH 8/8] rust: add device::Data" actually
> > phrased things differently (which indeed isn't great and needs to be fixed).
> > 
> > This comment indeed implies that device removal actually means unbinding a
> > driver from a device. I think "device remove" is meant here as the drivers
> > remove() callback is called.
> > 
> > Your comment seems to imply you have a different understanding of what "device
> > remove" means?
> 
> Yes, see my other comments.  A device has a lifespan that exceeds that
> of a driver, and "remove" does not mean it is gone from the system just
> because the remove() callback of a single driver is called.  It still
> can, and does, live outside of a driver quite well, and in fact, the
> driver is not in control of its lifespan at all!

Yes, that's clear. But what does "device remove" mean for you then?

I think this one here mostly seems to be about terminology and I want to make
sure I don't create any other misunderstandings e.g. by using "device remove"
for unbinding a driver from a device.

> 
> All a driver can know is that it has a valid reference to a device for
> the amount of time from probe() to remove().  Outside of that a driver
> can not touch it, BUT the device structure lives on and can do lots of
> other things that do not involve the driver at all.
> 
> thanks,
> 
> greg k-h
> 

