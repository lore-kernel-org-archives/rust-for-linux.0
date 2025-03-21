Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6B22D4C0
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742581744; cv=none; b=jr5E3/WGdr3Pn2rB3Q/L4E9qdzo1gdYfTCucohPSNf/Xuttml5GzaNyiNeZNvP7Z50yLysujkbMjqwGkuK6dl77bWslXe3gyyZnq0IpvdWqNVoHlCko5PU//utAH7VB/6GlogoALSdtCbzR6iIJXBbM91iZIUbO2RetXbtqIAOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742581744; c=relaxed/simple;
	bh=vhRSD/sXVHlXEO82NM8Vc+1oXUYVgQcVeL2JYmSpP9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juaJKPZrAhlCzlZHLvWBLYv274aPhPSyKxOyUfHkTfZMfXeOw2GsZVnX3vk9LEinY6DirIRAIpN6Ymr1nlCeYD2GWTuQQXax2Y5gWZcrct8zx47lR+5LgXzmevmD8ITiqPxrtwOpCIhVZFbYD3bEIByJN3/LfLy3fu3ceyROaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=UHqUobbR; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="UHqUobbR"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6eb1e09f7e4so25392636d6.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742581742; x=1743186542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OrQ0EzEMWWG6jQuSoJHeIyls2E9YhdY6/vRFZgsC7e0=;
        b=UHqUobbRnVFT97pGCaj8rvS5P+q3ZbkIf/O2qAG1Ofh5FPnoU38S5IpIFBmew2sFOz
         mIZCuqHpLFodRK4Ce+wJ9hOnpLaNTXVvRKCP05PHILjRJ42sGNnTbF9YSLTww+4TyuH1
         UngwjWbM87qq6fe+3c0n9fpwhAfpwjSUgm7hMTTr65XPBa9ctF7JeYxZh43ICo0yWMaZ
         /bYMXc55qZM+JwtQgWlOZswBnFWLQw2r9n+VTMMSdK5zItRR434E3wOI0g9Xz/OhMYf4
         xL+DcZjwcIHcDTuXSh1qW7ST5KDDxRUNIMkJl5wMhRUCRO9YPyqk/d0wWMC9A/o33MWy
         FRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581742; x=1743186542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrQ0EzEMWWG6jQuSoJHeIyls2E9YhdY6/vRFZgsC7e0=;
        b=mmUuep1u/uiI2xRQoP1aa707BxU+d0PSyp/heuDbOwGotrwc3KhQFTDNS6JiXv35z7
         B6jkBRi3EJRNt9IuAELgC0M23i34u79TdXX97Sgb1HJQEFOxaKMqXUGGvGn5yIegB9RG
         vXzE4Z40fkYhgnLRuvmIJciKSrn/tpBV2SvYitU+bgosxd5g8U+6uc7Iv6Bsh5uHMIFQ
         tCm8xkbcStLA7Z5HvMp7El+hGv0oyq6DEgTw0uqwRcAH05HNwU/ElI8sFRrBmMW/BnMm
         hzQNXePhjrBVEHIG6XyLrEXKLGJHpCm6Gl2q7ipm+r/e/ratb5ITt3f3wz5cNtYGKPXL
         Jlhw==
X-Forwarded-Encrypted: i=1; AJvYcCX57X0PJ0f0hGbpC8sOjQ5YqErgCuFoQrZ/axTl8Q+kr9EGpYj5ne/tX4rT3cbcoCTQVuMS2lcaNmwfC9otww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmwSOlrykaPxOpwDnKjqMoMDvekOAfbxIgOJBVBMDRj1DgC9jY
	vGtnRQ1smXqK9yz3rib38bO6r9F+aXpoYtEvzdvLjktFFjJDEa529FDTlfqmz4M=
X-Gm-Gg: ASbGnctvjmMDxyUmigI4Xg2UZtuxbe2ezpZ5/e+tLJ/OhCyMy4k1xm1qFliyW7w/Vg1
	6K9uiqfN9BLdOu3eVRT0qnSLXRSNKS0juE3uIX8+lx/y2u4rHJJnosee6sMKPqfVHJ3bPYDFs5E
	A69D/J1BT1mFVOB1VH42di/bj+TsrXXToXMsk4P1HdObLLP0PoP9WyP/VRvQ76Mqw4X5WCykypn
	b2AuRQhb7ml8YfQSb4yuKvdHWJIqh9LJfx72/nodQ1wOdfvltSQqNfMqNyT689YgX6UZ6mwD1VS
	JVJLoTqKNDA9aJh54dEtkDncLgU8gaWRiYWpbbSyizU501v6QxZDk3CN0CooxvTeCVqkldTGpO5
	kin9tRb6TZfkI2OxxCZHMli4=
X-Google-Smtp-Source: AGHT+IE8/kN4YgJruUR+/bfMJ7DomcrEj95sqf6MWrpr+dGE/We4hf0Dqm3GWvJMjve9Iw4bEfc0/g==
X-Received: by 2002:a05:6214:2469:b0:6e8:fbb7:6769 with SMTP id 6a1803df08f44-6eb3f2937c0mr69832456d6.14.1742581742075;
        Fri, 21 Mar 2025 11:29:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0ed67sm13821566d6.12.2025.03.21.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:29:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tvh77-000000016ZW-0DDA;
	Fri, 21 Mar 2025 15:29:01 -0300
Date: Fri, 21 Mar 2025 15:29:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	robin.murphy@arm.com, aliceryhl@google.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Subject: Re: [PATCH v13 2/7] rust: add dma coherent allocator abstraction.
Message-ID: <20250321182901.GQ126678@ziepe.ca>
References: <20250307110821.1703422-1-abdiel.janulgue@gmail.com>
 <20250307110821.1703422-3-abdiel.janulgue@gmail.com>
 <20250321172353.GO126678@ziepe.ca>
 <Z92jPXvMOqhgv04k@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z92jPXvMOqhgv04k@pollux>

On Fri, Mar 21, 2025 at 06:34:53PM +0100, Danilo Krummrich wrote:
> On Fri, Mar 21, 2025 at 02:23:53PM -0300, Jason Gunthorpe wrote:
> > On Fri, Mar 07, 2025 at 01:06:19PM +0200, Abdiel Janulgue wrote:
> > 
> > > +        // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
> > > +        let ret = unsafe {
> > > +            bindings::dma_alloc_attrs(
> > > +                dev.as_raw(),
> > > +                size,
> > > +                &mut dma_handle,
> > > +                gfp_flags.as_raw(),
> > > +                dma_attrs.as_raw(),
> > > +            )
> > 
> > This is not the correct safety statement, the device must have a driver
> > bound to call this function, a struct device reference is not
> > sufficient.
> > 
> > I belive Danilo was suggesting to ignore this unsafety for now, but if
> > so it should be documented correctly.
> 
> If just landed patches [1], which are the foundation of addressing this issue.

Those patches say:

 The context types can be extended as required, e.g. to limit availability  of
 certain (bus) device functions to probe().

Which is not an appropriate limitation for dma_alloc_coherent, we
expect it to be called outside probe in real drivers. Is there more to
that story?

Regardless, the safety comment should not be merged with incorrect
information. :\

> > Also think the use of devres here is going to be very problematic for
> > drivers to use as I said in other emails. :(
> 
> In an earlier reply today in a different thread already gave you the link [2] of
> what we landed, which, besides explaining the situation, also makes clear that
> there is *no* Devres wrapper around a CoherentAllocation and why.

Yes, I see, I have so much email right now it is hard find all the
different versions of everything.

Jason
