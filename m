Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF0327BF5
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153162; cv=none; b=cmO3lIlcMpHNFQmrRfU/Pv/Jx0I8+PGYDSe1qmfyZDfz2c5339aSnPTsFI686uzOvenWhVqspcJUZUB3Aru/hNNhmELfecV78A2Kb9J+TVgkgl06vJaVpATbN75skHwY+IqL9vGFaBbesCjg4fcwDJPsSthoV4Xhc8ow4QUmcOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153162; c=relaxed/simple;
	bh=nIsNPow5kM9UVujhZhsZ0wdNvrec7uwwcDAP2NNAzuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KthLgSjHq4dE9segodnHCKddaiXoBavYiJS3JwMasPvjBff3n4iHMkaSusgvY9Tf0+9eFDZwAj+++5e2icrDn5p6QWg5TdGfSHY7jMkSRw9sUgL7XoozV/a1tBtGYuoIM2VYsn+9m0wsdBb+xRbL3gVsRYHhqkrdZ2q8yvzM1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ggenF/6P; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ggenF/6P"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8887f43b224so24534836d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1766153160; x=1766757960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZMm+69u9x+z8ibStDNPIaAJod8bPs48RdpWzI/bCtw=;
        b=ggenF/6PSAYUuFaSNwkOwq9giHS1PXiTe3eVN5fQMURUat0Ao11jibY8qgNXZmSg57
         AU9zdcaQVqX4X1QpkkU8vqJClJR9Z59lzYiH8LCnTMOBtFH/Ik0oBQhxEaso1hYVG0Ua
         HfrbWWH5vQgGt5rXnp3412B6GHsBFu1Zfr4TKyAzfEQK7aaTlLvPbA3ouSJxZ6+856dg
         OGYI4iWdn+Y3l8e3esQ8ReqnCGShEYy5W6NaeVB1LEhsym1RJjDwIxxazqDCMAIna+Br
         kETh05AA3hpOX6uv0SYzIY6CAPyuKeljCvDIFtCENZDQY2sOSj5EWzuhBkDr+3F3Uhhs
         CXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766153160; x=1766757960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZMm+69u9x+z8ibStDNPIaAJod8bPs48RdpWzI/bCtw=;
        b=j9CM/ICllMS31PuZCDsOeqB1ZGQECz0K833FszikXdOtbDXf42FkXINuIJ+CRobAE0
         xZPtZLPbOFH/jpBru+Y1JKHyYEfZHDNEEXLJTnDucMO3gshFjPmlrE/GwLrz22hGGUUb
         DU0//LpHdTFgFa1wCMQmMKorJ/uvRdM5Cubs9RTF1NVS/CxSy938nZZMVqWiOAwlw36Q
         4bRDfa2Zll6dMWQLS7D122YCYEv+MI3Nv+SRGRA+C/VEH539WmECy0IlRd9b384+vbrQ
         BOwVNSwkluWZF2YKwMta8o2crBb8B5UUZo1R2bwTunU3IUOeA7ZYn0DppYtiOjRJhtoj
         U02w==
X-Forwarded-Encrypted: i=1; AJvYcCUR9UNQsoyfYRDyP7If6YvnKeQSkixSp0GXYWb6R7TJDlXs7XnmTsN5PVT295zyTFxP8jBFfEUoVT/TTeNapw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJObuX+3ET2Yy1Ypi4Rp5M3bksi/hOMZvQygx0gtoniYZ1Ie2M
	wEPVJQ5XdrZjwuHUOWoh+sd7QMk4lZUJz4+nFz8gc6ZhoIYhC6n2dqgQukNxQKbsGSo=
X-Gm-Gg: AY/fxX4WFyMjkUKC+tb4PHR33p3q9TQoswuDYIFWAMyuM4iufEiRIKxmx1jntMj0BkK
	Re1nzxEC/Cjk9oDOw8MsHw87Ndlr8ntObk4cptC7SvB0kyE0bhla+/CYvGwRzZGOWmrEmFiF0R5
	Q10Elh9jPUnsQvSoIeA5StSqiZZ5CmUdl5IFfKqfOME+dNsdkWpyx7dKezByL8aiPBxy2tmYpNX
	O/umdcPAh8KvET9bUsmWrXDIfOP5PoZs2pW/DKqEqqmsyv01V673TmPRoQNue8S80lAWlXUUKUk
	VIwICXdnkPx+vYAW36IfkFNmAxIpI7qrUw+x9ZaZUSeUUkrhSoelC+X9tXmJIrrG0Z1WJYfLpom
	PXDnT4JV1tKRWfY0S0AFWHC6A0EjvJiSNbmppyV0MKLVu2sL/5y2dYRCM0Nu/EVHyR3G9Rwm6qR
	9Bp9YPNlssulPr4epCzfn5BbFCdOmIUzmy0MD240hSFM5V3KUxVzXp+eTf
X-Google-Smtp-Source: AGHT+IFvQBh34jY1BRicAO6irDa1zAgb1lDbuHzEzV01DhrEsnJRDHmMIYj0wyL099ZnzNEOzHLyuQ==
X-Received: by 2002:a05:6214:4ec1:b0:88a:3b1d:2f70 with SMTP id 6a1803df08f44-88d8166a292mr48660746d6.10.1766153159564;
        Fri, 19 Dec 2025 06:05:59 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ee182sm184273485a.33.2025.12.19.06.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:05:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vWb7F-00000001Y07-2SxB;
	Fri, 19 Dec 2025 10:05:57 -0400
Date: Fri, 19 Dec 2025 10:05:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v4] io: add io_pgtable abstraction
Message-ID: <20251219140557.GH31492@ziepe.ca>
References: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com>

On Fri, Dec 19, 2025 at 10:50:52AM +0000, Alice Ryhl wrote:
> +// For now, we do not provide the ability to flush the TLB via the built-in callback mechanism.
> +// Instead, the `map_pages` function requires the caller to explicitly flush the TLB before the
> +// pgtable is used to access the newly created range.
> +//
> +// This is done because the initial user of this abstraction may perform many calls to `map_pages`
> +// in a single batched operation, and wishes to only flush the TLB once after performing the entire
> +// batch of mappings. These callbacks would flush too often for that use-case.
> +//
> +// Support for flushing the TLB in these callbacks may be added in the future.
> +static NOOP_FLUSH_OPS: bindings::iommu_flush_ops = bindings::iommu_flush_ops {
> +    tlb_flush_all: Some(rust_tlb_flush_all_noop),
> +    tlb_flush_walk: Some(rust_tlb_flush_walk_noop),
> +    tlb_add_page: None,
> +};

This comment seems quite off..

Usually you don't flush on map, you flush on unmap. The TLB should be
empty upon mapping and not need flushing - except for the rarer
special cases of clearing the walk cache which cannot be detected any
other way than using these callbacks. Doing a big flush on map to deal
with the walk cache would be worse than implementing these callbacks.

The flush on unmap, at least for ARM style invalidations, needs these
callbacks because they provide required information. If the actual HW
does not use an ARM style invalidation system then this page table
code is not optimal for it.

Jason
