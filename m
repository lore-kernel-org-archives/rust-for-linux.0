Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EEB1FAC59
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122175; cv=none; b=LJvdICHa17Iu/AUPGA3jj5kUcV+zPfYhXlXgUDNzhfaIkp7UupLXdDm1zqFGBSsoFUlV1ZItkFw7Go0rxsBPlnP/JBaX6hBzYJOgaBm8/SpgfLP5gjyZlrU+5pLlTMW24UInRBRV+lEa/tfsGXY0Gmily8iumNrLBm6z9miEz/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122175; c=relaxed/simple;
	bh=srqwl3Fw9jlCmaDuNLjfpcSCKXE+jZ0BjDKIpTAT+gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJHURC7+au1Lo+5D3fj7DbPi+YaHFkjUvs5Tu9Sux2eXr1AlKJL37M6c4DWYwSiE48UFVR7K3UqIWcReFYFu8376nZWUfWmrklqIsX0XXQGVrQDAyunmYjtOh99xqpcbyA0I/o1+s7tAHpDa15UwfHZj9GnL6ask0zy/FNwRYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Q4lLLHEq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Q4lLLHEq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43635796b48so13587515e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1737122172; x=1737726972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZpNwTlyJcHVo487ZfsZ8CWH5tK0goLtZKZSQ5PcLz8=;
        b=Q4lLLHEqeOUfAc4taKWAn/6+kdjJ46bbbx+tHYHwo1pox7ruj+feHMl3YDc0PkT6V6
         PRVck9b+XlVP18iNwXSfqxpdKOwNVRXNSLAJMdu5+sKQXYxM6FFv4AmdNreijg9Garzb
         f6PDl725tAFnpgU+Eo9A80kKbdrT9rCxqEbUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122172; x=1737726972;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZpNwTlyJcHVo487ZfsZ8CWH5tK0goLtZKZSQ5PcLz8=;
        b=DojYOzx9EpyFKBRyN3lqzMV0aZdDX6XPtWs+ikqwC1C03xQ+lkfzYDUoHekDDzaDpw
         Jj2P7LdjKqIuVZAdMVxSHIqFCSPqDeYXTbWNf0oW/WK+8pFlK5bwowBJ443Wg6iMlb5o
         6EiW09pLwxTniasnchLxs8G2wD5Oi0bbwdCEfYsYEXwBjA3eyFDxIa8YZzLZbFeY9ugA
         Rrk2b1hHRugHhcW7qVlrJ3CEwv/+J1l6oAM7nvmNvku9iZJ4SqE9GHrLfHDNjY5f54S4
         +/7TkOEF5+8z7+eyOjTBmXimDMWnFvzvieWq/V8wJhKxByE/dhHUUCGzxs0jz+OX7tiz
         GCBA==
X-Forwarded-Encrypted: i=1; AJvYcCVQgpizLqeabd8rooAd+Wh6bu9yTr6YvR1VppV1zfiqpBbBcEHPiRaoGA1yme9G8Ao0D+5y5aR/qxzmnB6GXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXZEpodnxw/ldRayRTlbiCfJoLMfRNFVQmKlUMWC16ikhs09lW
	2UOLZ5LFYuy2JGNdRov/ZygHvCKccgDc8flu5WaPG59DtYO8bfjghY/NKf81VCE=
X-Gm-Gg: ASbGncsRRzy839y/aiUFBj+srStf72KuL+m+IWv7I9076jpiOMbTvl56m8rLMsEV0t4
	L8kGyxflOd8LWTH9dfkKMq30h0511QefL5ExYXfLEvbm7R9Dm4s8y5GavimLxNFf77CHrMCYdqe
	WOx6lnMwriFBtWH0zXKj5VoGQSVzHdT0LK+4M6jgtfSk/Qv1EThQ+hu8If6/HKO8cnq/+CTH5q2
	Ipz1L6c3ExDMS5/IAYHvFYW3wzm1sP5y5SziwCpMZ3rgXulK34/wxnctRwRcm0ToT8P
X-Google-Smtp-Source: AGHT+IFlu90mq1X2vEqFrqXrWBguIkHLIxlum8gc6SPp9rrHs3FGaagI2j2U3kz4BVFaBnlik1HGpg==
X-Received: by 2002:a7b:ce86:0:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-437c6af2037mr92991175e9.6.1737122171873;
        Fri, 17 Jan 2025 05:56:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041f61bsm34191415e9.17.2025.01.17.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:56:11 -0800 (PST)
Date: Fri, 17 Jan 2025 14:56:09 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
Message-ID: <Z4pheSjBMOjgvk8W@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Greg KH <gregkh@linuxfoundation.org>
References: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
 <20250108151858.GB24499@lst.de>
 <Z36X_ZnCmBQBMoZ6@pollux>
 <20250109080812.GA20431@lst.de>
 <Z3-NqwAG_96yq8VD@pollux>
 <20250110083955.GA5395@lst.de>
 <Z4D5a5NYrAbNxUL6@pollux>
 <Z4kG5AcVeQKegLnb@pollux>
 <bbc60912-7ed5-4bb1-b273-8061abe49e10@arm.com>
 <Z4kshDHw8NEjQONR@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4kshDHw8NEjQONR@pollux>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Thu, Jan 16, 2025 at 04:57:56PM +0100, Danilo Krummrich wrote:
> On Thu, Jan 16, 2025 at 01:57:50PM +0000, Robin Murphy wrote:
> > On 2025-01-16 1:17 pm, Danilo Krummrich wrote:
> > > On Fri, Jan 10, 2025 at 11:41:54AM +0100, Danilo Krummrich wrote:
> > > > On Fri, Jan 10, 2025 at 09:39:55AM +0100, Christoph Hellwig wrote:
> > > > > On Thu, Jan 09, 2025 at 09:49:47AM +0100, Danilo Krummrich wrote:
> > > > > > On Thu, Jan 09, 2025 at 09:08:12AM +0100, Christoph Hellwig wrote:
> > > > > > > On Wed, Jan 08, 2025 at 04:21:33PM +0100, Danilo Krummrich wrote:
> > > > > > > > What does "your code" mean? Duplicated in every driver?
> > > > > > > 
> > > > > > > Yes, interfaces to the DMA API should stay in readable C code and not
> > > > > > > in weird bindings so that it reminds greppable and maintainable.
> > > > > > > 
> > > > > > 
> > > > > > Rust drivers shouldn't use C APIs directly, but rather use an abstraction of the
> > > > > > corresponding C API.
> > > > > 
> > > > > Don't force me to deal with your shiny language of the day.
> > > > 
> > > > Again, no one asks you to deal with or maintain this piece of Rust code.
> > > > 
> > > > > Maintaining
> > > > > multi-language projects is a pain I have no interest in dealing with.
> > > > > If you want to use something that's not C, be that assembly or rust you
> > > > > write to C interfaces and deal with the impedence mismatch yourself as
> > > > > far as I'm concerned.
> > > > > 
> > > > 
> > > > This is exactly what we're doing and proposing here, isn't it?
> > > > 
> > > > We wrote a single piece of Rust code that abstracts the C API for all Rust
> > > > drivers, which we offer to maintain ourselves.
> > > > 
> > > > What else are you asking for?
> > > 
> > > Since there hasn't been a reply so far, I assume that we're good with
> > > maintaining the DMA Rust abstractions separately.
> > 
> > Indeed, FWIW it seems like the appropriate level of abstraction to me,
> > judging by the other wrappers living in rust/kernel/ already. As far as the
> > interaction with C code goes, it appears to be a pretty straightforward
> > midlayer consumer of the DMA API much like others we already have (e.g.
> > videobuf2-dma-*), just one which happens to be a language binding rather
> > than some other kind of functional abstraction.
> > 
> > There is a realistic chance that the C API will evolve in ways which break
> > the binding, but as long as a) that won't break non-Rust builds, and b) Rust
> > folks are happy to take responsibility for un-breaking the Rust build if and
> > when it happens, then that seems reasonable IMO.
> 
> Surely you can expect maintainers of the Rust abstraction to help with
> integrating API changes -- this isn't different compared to driver / component
> maintainers helping with integrating fundamental API changes for their affected
> driver / component, like you've mentioned videobuf2-dma stuff.
> 
> At last year's LPC I held a talk [1] about Rust in the kernel and there was a
> question at the end where I was asked how I think about cases where Rust
> abstraction break caused C API changes.
> 
> My answer was that I'm not too concerned about this. We can just rely on what
> already happens every day in kernel development: people work together and
> collaborate. There are a lot of very core components that are widely used and
> depending on the complexity of the change may require the help of the users to
> integrate changes. So, I don't think with Rust abstractions we're adding
> anything that the kernel does not already has a strategy to deal with.

I think when we know that an api change is in the works we should try to
anticipate that, and not add another complex user of a feature that's
likely going to disappear. For dma-api I guess the big thing is the
dma/page split that's been talked about since forever, instead of mixing
it all up into the scatterlist structure.

But with rust abstractions it should be pretty easy to make sure the rust
side interface is really clean here, and so any refactoring limited to
just the middlelayer. Plus this patch here is not even close to tackling
the sg based dma-api parts.

Same applies for rust wrapping dma-buf interfaces, that's just more of the
same.
-Sima

> 
> - Danilo
> 
> [1] https://youtu.be/3Igmx28B3BQ?si=wD0CP-zku4U6fAsN
> 
> > 
> > Thanks,
> > Robin.
> > 
> > > 
> > > Hence, the next version of this patch series will have the corresponding
> > > maintainer entry.
> > > 
> > > - Danilo
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
