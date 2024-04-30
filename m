Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED541C89
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714495331; cv=none; b=XhA3tXPbMUDxHe+ZCjGpAxW2qwABf54HciVMU2D0kkAyymRkhETbZqDt8DWHqhjhTy5irGx19hQMeL7/PIIR2exHxr0epuCf7OuKYa046qs2UptqriI2UlFv4PpJq/z0b+1VSUNoD+qJMkEzlcNr3MHf2SphAeC7h8uw0w3ed3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714495331; c=relaxed/simple;
	bh=BzkVbpiR9JpZ9jUfZoaWvRggZ5TnV+KkIFcrPKhOpPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=M9At4On7AYkJyNtK5NqsKldres92O+LhP0Sa32BdBenYoYtSirhSH0X4d4kegopdG3Gh4qSNruWF84UddcQG+kGwXnBCKXJKTocR5kcilSJ8BuBNjWkeq1/CQ+4stE8risTMmxKtTv5wt9jYenIoXzZA5+iOxYqSVidFsp8X6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SSbAZQ63; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SSbAZQ63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714495328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k00trR9QD/rTsMwpIvcaVLcc/iO9Wv/0y76PlptROIQ=;
	b=SSbAZQ63lri7kHkajUa9SXsCmhTt6HERHlUOi0vdEBVu4/IsgjBwRW93BG70SRAnen/vt4
	PC1R3XvjdTxhv9Y/JvleqkhxbUVLmmung6Vq16u3VDNDXt/M/Tpr5YqZSXFV1pdIDqkbDK
	KpwMmX+n+3lfW4SSQ/FFQctv+svppH8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-Lehrp9-HMsCVszcv5Qx4-A-1; Tue, 30 Apr 2024 12:42:07 -0400
X-MC-Unique: Lehrp9-HMsCVszcv5Qx4-A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-418a673c191so25662285e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495326; x=1715100126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k00trR9QD/rTsMwpIvcaVLcc/iO9Wv/0y76PlptROIQ=;
        b=Bz6uqSa2j1YW38YW2EIItCwJsY4PO98+ofTREo+YD+FkGb8lppEnUgiFBVUrGHNNhd
         oxO6/bHx5lI/EMy6e0OnM9KaG4r84pC/258zTadVH4LaWXG4MzOEmPLhLBFFHByx+w9+
         B55/1NDltc2IDM5Dra5BRnHRFlfjrLSwbawA05AYKjUS291VYSzno1/QFlD6cddUHalJ
         F595d8pCvqMJiYWU+zsY04oHvTUZ1MEJTYJU57yC+PEdhthd49MqkPT8v/gkp+zicW+D
         YT2IgQzTqKdOmKh4DbHiyw10xST4Bb+rTrRCJa/aKEdehDqibFvy2gZmkRgA9J2967Kg
         aXyA==
X-Forwarded-Encrypted: i=1; AJvYcCVnKN2hCwZE64+jXTZAE9eUbrJ/ERc2VJm6B17XIheVakf6y/1Rwk2gstE+26PrIjugyZWLcdsl6Nmc7Az3dDjc1ikeMmhTL2RgwllZT0Y=
X-Gm-Message-State: AOJu0Yw9wQpS2OoGDhZEjT9gWALnD3kBpq7jS0yvow+KLJwIBtD7/4U8
	H25kHkK186EfRtGToPTnr9O3toghcBvDYGLkFpcjYty4H0ALDHmmr/PtT7SsIfz3XvUiRFl+RB+
	3pspZS/mLfhxZEhebjjBW6/Q/A4d6KgieOcXhO3bD7XpfRmcjT3lqNjJ7qMQC4QB5
X-Received: by 2002:a05:600c:45c4:b0:41a:b56c:2929 with SMTP id s4-20020a05600c45c400b0041ab56c2929mr46533wmo.34.1714495326016;
        Tue, 30 Apr 2024 09:42:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4jFUc+oFYz7x8iLS+KoaToA8xBfnLElsuXamJR7bfYtfyaItQojp3s4X8RrSmDU1UX6l0nw==
X-Received: by 2002:a05:600c:45c4:b0:41a:b56c:2929 with SMTP id s4-20020a05600c45c400b0041ab56c2929mr46522wmo.34.1714495325684;
        Tue, 30 Apr 2024 09:42:05 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4b87000000b0034cf3001104sm6481126wrt.33.2024.04.30.09.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 09:42:05 -0700 (PDT)
Date: Tue, 30 Apr 2024 18:42:03 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>, ojeda@kernel.org
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjEfW6QpErDDnntk@pollux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZjAYpsFROI9agY_L@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > On 4/29/24 21:52, Boqun Feng wrote:
> > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > 
> > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > 
> > > 
> > > Good catch!
> > > 
> > > > This isn't a case we should rely on, especially since other kernel
> > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > 
> > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > 
> > > However, since this commit is not upstreamed yet, so it's suject to
> > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > this patch into that commit in his tree.
> > 
> > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> 
> Well, I cannot speak for Miguel, but there's no guarantee of that IMO.

@Miguel, which one is it?

> 
> > fast-forward only, the commit IDs should be preserved on merge, hence it should
> > be fine to keep the "Fixes" tag.
> > 
> > As for squashing fixes into existing commits, this is something I would generally
> > not recommend doing. This would be a non-fast-forward operation and hence break
> > potential references to other commits in general (not only "Fixes" tags). Plus,
> 
> Yes, but here what you fix is a bug, and generally, if we find a bug in
> some commit and that commit is not upstreamed, we should rework that
> commit other than introducing another patch that fixes the bug. It'll
> provide better bisect and less confusion. It's the same reason that why
> we don't allow a patch series to include a bug in the middle.

I can't speak for other maintainers, but AFAICT it's rather uncommon to rewrite
the history once it has been exposed to the public. It'd be especially uncommon
for a subsystems's -next branch. See also [1].

Patch series shouldn't introduce bugs in between patches, indeed. They should
also not break the build, neither in general nor in between, for the reasons you
mentioned. Ideally, this should be fixed before we hit public trees, but if it
happens, as mentioned above, I think it's rather uncommon to rewrite history
because of that.

[1] https://docs.kernel.org/maintainer/rebasing-and-merging.html#rebasing

> 
> > it's usually not providing a great motivation for potential contributors.
> > 
> 
> With proper SoB tags and other tags, I don't see a big difference here,
> or I'm missing something subtle?

Even though I wouldn't mind personally, my experience has been that people do
care about the difference.

> 
> Regards,
> Boqun
> 
> > - Danilo
> > 
> [...]
> 

