Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE718732D
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765545; cv=none; b=unY6EN04M1K5wXsvbkAAtosoo+VnsrGcCjDLAb+5IWz4/BdM22oHi4EakOw9PWkq4G2t2dt2Y4+5IOKUeXJPObF8RKDn7XmFcUkguQbVTUl7Tk6KcZNsoc745oQeXmRtdCSWlzKRwWDFcSzsWGoHs4eHvxM8xLSj8buxjUmjNWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765545; c=relaxed/simple;
	bh=+JdoV022umSBz4Uajz8UqEwb6azvBLjqEL+jN6EOOcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uWJeeznSz2vHBCn09nfPhNNfxITHDpJDISaYE9rmExrgyMhufbRxuLUeic6neFqfDapL3tYJBOKZBSx4Qn8o/zC1ZY/33wkRYjVp4FVGv0gPFjDTaqcjuX0fAYKNa3n4gYIXg4P1y5r/mfi3AgVYMZFvMwDylOGeSf2cAM12/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehBJD/RS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehBJD/RS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717765542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijh5gOQE/Y+mRRmFMhr0PS9aA4OZEs8muMm2wB2PIjI=;
	b=ehBJD/RSlO8KZ3rbRnbQ98p2vVLCIcoxsHye0mZT30CL3qhwpy4DAS36PJ1S7l5L3zwer3
	tORlTIQOTq88vfyNjFvknJ0fCdUicAQe+cWmWWzSQskMyFGrpO1KdtFaNvyEXx3OeEhYO2
	wHw8Xdr1JJf/DeQXAIqv327c9PzcCco=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-JfjbrQteMMmOwJkxSgu5Zw-1; Fri, 07 Jun 2024 09:05:41 -0400
X-MC-Unique: JfjbrQteMMmOwJkxSgu5Zw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-35dcdb26f5eso1676594f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 06:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717765540; x=1718370340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijh5gOQE/Y+mRRmFMhr0PS9aA4OZEs8muMm2wB2PIjI=;
        b=Tx3IkdzlNXIj9WhgNEunpFFEZRuRA0Y6N6H6SmRRHqUvIwtBT2MxA3POY1bf9e6bEV
         3mkGZiO5ghlaQzKlbsrBw1x92LTTtx65wntsSzCgLm5EESSKQW1tWqGSYAmFg9ZuMd98
         D+aGNLhAXUqkEK43IUanhK0N/oDz1M1SYB/zqzd/ywfJ2N1y6rgAypVBzGdmMWm39hCw
         KMBWYArrJF127idYWM8v+wOj2sSAAEy3gXLQMqXhXaNuxotoB6qnh4TuNuFXDL2/2qfM
         kMWRN3tBQVBId22FYgWXcBChcpOfU4xz1xoP3t34bSYjKmoePd1lV+L/F+2UjU31dc9/
         UqCg==
X-Forwarded-Encrypted: i=1; AJvYcCUgM2GV7RMNrTmHaGUt5nLPU1+3ANS5VyqRrCezJgKrXWlJymTYAeQ4k6Ke7CelW3i7l8hkHHjKY1QfxitMfWpX+F5lv3BGEyFw8Ide2n8=
X-Gm-Message-State: AOJu0YzUDwtD9KEL2mdHsxdD3DDwXZ+2blYML3D6jVgqDgZPAbt00RMq
	kRqdJj7C5iFTY/RE0x1DoBAV3VQUQ8DLyS55xCqu4SnvYPpdfHU2bFcC5rANH8P2BgLODGssaum
	94uT5AzHHQaE7Nt8ad+JBUyacUDk25MCevzBwQ3eqYaXAhdYY4DO3XI5FqCY7Pd17
X-Received: by 2002:adf:e451:0:b0:35f:cd6:7538 with SMTP id ffacd0b85a97d-35f0cd675b6mr608029f8f.7.1717765540440;
        Fri, 07 Jun 2024 06:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhE9vaemAHFaA5yCK2dCQn83HAZMLlxklLRbU4vCgE337Y15ysZQMtmWhB9+FiRiVoN001pA==
X-Received: by 2002:adf:e451:0:b0:35f:cd6:7538 with SMTP id ffacd0b85a97d-35f0cd675b6mr608011f8f.7.1717765540032;
        Fri, 07 Jun 2024 06:05:40 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d49e43sm4000079f8f.31.2024.06.07.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 06:05:39 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:05:36 +0200
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
Message-ID: <ZmMFoHYR8INkhMru@cassiopeiae>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
 <2024060708-residue-hardy-af36@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024060708-residue-hardy-af36@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
> On Fri, Jun 07, 2024 at 09:11:32PM +0900, FUJITA Tomonori wrote:
> > Hi,
> > 
> > On Fri, 31 May 2024 11:59:47 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> > 
> > > Once we get to a conclusion I can send a series with only the device and firmare
> > > abstractions such that we can get them in outside of the scope of the reset of
> > > both series to get your driver going.
> > 
> > Since your discussion with Greg seems to continue for a while, let me
> > include the following patch that Greg approved with the next version
> > of the PHY driver patchset.
> 
> Yes, please take this one now.  We can build on it from there.

This patch still contains the points *you* are discussing on the original one.
Why do I spend my time on this discussion if those points don't seem to matter
for you now?

Also, why would we want to have this patch (and the firmware one) in two
separate submissions? If we urgently want to land the firmware abstractions I
can send a separate series with just the device and firmware abstraction
patches.

> 
> I had a meeting yesterday with a lot of rust kernel and userspace people
> at Microsoft and talked a bunch about this and how to move forward.  I
> think we need to take much smaller "steps" and even encourage most
> drivers to start out as a mix of c and rust as there is no real
> "requirement" that a driver be "pure" rust at all.  This should both
> make the interface logic simpler to start with, AND provide a base so
> that people can just write the majority of their driver logic in rust,
> which is where the language "safety" issues are most needed, not in the
> lifecycle rules involving the internal driver model infrastructure.

What do you mean by "drivers to start out as mix of C and Rust".

I don' think this is desireable. Writing abstractions for C core infrastructure
already is a lot of effort and sometimes rather difficult in certain aspects,
(e.g. align lifetimes).

An immediate concern I have is that this is an invitation for drivers to write
their own abstractions, as in interfacing with C core infrastructure in C and
and do a driver specific abstraction.

> 
> Anyway, that's all hand-wavy right now, sorry, to get back to the point
> here, again, let's take this, which will allow the firmware bindings to
> be resubmitted and hopefully accepted, and we can move forward from
> there to "real" things like a USB or PCI or even platform device and
> driver binding stuff.

The abstractions for that are on the list and in the sense of what you say above
for "smaller steps, they are quite minimal. I don't see how we could break this
down even further.

> 
> thanks,
> 
> greg k-h
> 

