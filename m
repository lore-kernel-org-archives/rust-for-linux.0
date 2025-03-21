Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FC22F38C
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577837; cv=none; b=VyS2fcAthaLCUDaFwyv+rbhb4KLcQvvfEr8/Is6KAeRAsZ+KF05APvI6Pt1ioy/UlSHBIVLK4pNuaOrUdEshNu0u8C7TCDOrKxO2XvoUa6CMBnmSJixxQHCjLvTwj4C2Widu9ImDUNNYHcfvxWWph/cIiY2mkY+1z4myUEeaeE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577837; c=relaxed/simple;
	bh=63kUb6i4KPgRFntoZv3miaEIb8TL1peyDSzJmVeDWRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnEFE+Iyey1JCF97oQj0QETCTwCs7fVyNqF43d/JukeKTUkXbdW9X2PP8Q3nTbX7Jfh0g4VCaoqsJwScbC2EGr+bS1cEsvm9guPBGTDdPzY59yaG/5qbJiwmnPgyvcO9YfYomAsK4gtkqyDqrAK5uSn8n89ChuXoH5FmB4cbbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ICWc6CnU; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ICWc6CnU"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f7019422so17868446d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742577835; x=1743182635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B7cUBiZB6rMMBQ9cEsifqHUK/CE90uznVL1fa3h2l80=;
        b=ICWc6CnU2hIvRrJj7JjEsjo4tYQ2lHZDsdOWo+iGBgsy2cgZFLTtXpNE0IkvP6+4pR
         SNpVhyHL6m7nXppNOxaY5nKZ/JGenikLp55VSQVUEywXINPXUVwvwNVHWLJ0pZqRPuMo
         Qahm3Iv6z/jtEBrDf51Sue7s/Wu4UIObfEJLTevwRJxv1Lo9klbweyo6iOiNh/Jo4zEY
         d33fRt0gANORFC1vccqKjxwtjVkoNF/Usq77XwKILvPAHUF9n7DbjNl6iK7Erd8LyMU6
         Eamqoyd3PC9P+AMzd88+0xQHS0xxO6uWY9df5JKASp7GDND06I96oovLoIC2/Ps0ibSt
         4i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577835; x=1743182635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7cUBiZB6rMMBQ9cEsifqHUK/CE90uznVL1fa3h2l80=;
        b=lCPMmqHlfRRt50DCyo7CbVjPYnnH2k8pRGtfxm4CSjeOaFeZ2lnLxY/g4fGcEPqxvN
         Q9pkXZH0X5EVFDqB6awsqLtkOfbPevuhqfprCpUsaftXLU2VZvLiym1EHRN2k3zipfCL
         3GlpzKIQ68U9wXf8bKGiw6Lzzw/+dGID3u0K+bk8eDCVcWlT9YIo2t2dv8WwKtf1NVOB
         5qzlRVpWbm4Kui4sMnyMy/ZpuxHtnKa8GMXc6JgWcc44RYIhK5O5d8hw6JgGiD0odz14
         QiGPi5zMVVCU9tDSOhwqPyoM9LRLSvs9X0VjsrpJuL9E/LB1HcOVBse/R5af+yQHrZEh
         Zt3Q==
X-Gm-Message-State: AOJu0Yz3gQYUSIg29NK/gPmSv5Jmi0iO/EZ0zYyv3KicHUyHYcTqYAS6
	eFE70AkWKVhuxm9v8QsAky1CQyxJgPernoEt0EN+lIO//GB3GoR+0eCgyrU4BqM=
X-Gm-Gg: ASbGnctcRZQhi9lK8AV3lDtsyzd1tzobCtGaimFI3HBk5HWwtv8V9QypKxCkwwQDwZW
	EBV6kDd7IFS4QJbFP6lV4KDdyzaiS0UBJTwwvdaeKHQfCV3y67KU5lEzlaym9fvp9ZEG7bfdPYz
	P5CP5aD19tFhvFkkNa+ZehGU2+4oiB33TiNXQ03Z5dVziUkbGdljiUVeaLGDueK7iOw/5ajjU4Z
	bCzo8GUdR8HROsRUUrXyzKCmHyPCKcfa1xGaRqAY2Ad3V6U84usvj/fu8vNgG3Q7TALhQJYTyPa
	fVgN74pXehAlEWz1dYMq7AXbO/pzD0EZ3ec/tyH6RZ90Ph0KFrQ2stoGjNgUnlFJuRZsMrPNsAZ
	12wtzDH6HYwdEgJGbiXjxk3w=
X-Google-Smtp-Source: AGHT+IG23S+1v4mPh1NGe2HYPhjeqBlMWVod6kGobo7eDwLg9We7SFMHsjxiwrS7ZSg/ehqUcUu3Vw==
X-Received: by 2002:ad4:5cad:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6eb3f339763mr68882316d6.33.1742577834870;
        Fri, 21 Mar 2025 10:23:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0e76bsm13237786d6.1.2025.03.21.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:23:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tvg65-0000000161t-3Xbk;
	Fri, 21 Mar 2025 14:23:53 -0300
Date: Fri, 21 Mar 2025 14:23:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	dakr@kernel.org, robin.murphy@arm.com, aliceryhl@google.com,
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
Message-ID: <20250321172353.GO126678@ziepe.ca>
References: <20250307110821.1703422-1-abdiel.janulgue@gmail.com>
 <20250307110821.1703422-3-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307110821.1703422-3-abdiel.janulgue@gmail.com>

On Fri, Mar 07, 2025 at 01:06:19PM +0200, Abdiel Janulgue wrote:

> +        // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
> +        let ret = unsafe {
> +            bindings::dma_alloc_attrs(
> +                dev.as_raw(),
> +                size,
> +                &mut dma_handle,
> +                gfp_flags.as_raw(),
> +                dma_attrs.as_raw(),
> +            )

This is not the correct safety statement, the device must have a driver
bound to call this function, a struct device reference is not
sufficient.

I belive Danilo was suggesting to ignore this unsafety for now, but if
so it should be documented correctly.

Also think the use of devres here is going to be very problematic for
drivers to use as I said in other emails. :(

Jason
