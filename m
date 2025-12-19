Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9722D1914
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165551; cv=none; b=fIBtZpHiAT20jQC1BJCScx+q8Wgbt0C5XeEiWys8u3s3ZL+JK/ADPIo5tCBb2p4GflZ8T1A3GD+CXhba93Gru01Hl7+T5++6bj7h87gLlGVbekG1b6bhT74+/CMBuF6ZvRtnZ1Jm/DHkzSsMjDu2vmKKIUixCXJ6PFWi9ov+yX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165551; c=relaxed/simple;
	bh=SKR0y4ke7g6uJ3VfaXAV4HNn1trVq7fWIQgt9S4Hft8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcdvutw0Ot8O9uXbofYdUMpA2y2ZUQ4ClEjYp1nJYsJNhrYOuI+1P8ObvZWarDNZzC08z9HoTUc6Jw5wHKpQvj+xLi/fuTV4YW1s4Lgfr7rAWpriKBoZVLY5XKbeU+6PSSgaccIDlBe+cZ462rygZIAnkMIIDM4OI8HgkIZGXXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fgkX3VhT; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fgkX3VhT"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a37cb5afdso36468966d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 09:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1766165549; x=1766770349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hC/VXab9lpTCQATnomkfbW2pa0Vc9kadnS6vaPWuw8=;
        b=fgkX3VhTZy/Ty7vqFvfFyl85WVAwVSAYyNQCGbKSBtkeEfi4/S9aUVGtpS2il/BvsX
         9dginh/2SgSNuWp1q+mnK9Y2IWXedcYnW1WEKuAVLOeMUNpPHUByLufNnWFsvoQDRLOX
         8/+Kwkruvr7QSkBbRxL2LzCzwP3UzeZxpDd8YmUsJSS9Adjnu7jQp9igPB1DwVPbKiBt
         dEN3zIe5kLGnVj0VJJIAmWa9gMMDMuEY7zrAvJfBsxXidwHbbypUhXpSaUGHo6HSk+xr
         FGB5zKTvWG71ZGTgEL6gUMtOr25bchQUtOHfH0lEapzM45aW7oTBaFrKvQbLA99/Qdi8
         uwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165549; x=1766770349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hC/VXab9lpTCQATnomkfbW2pa0Vc9kadnS6vaPWuw8=;
        b=RbFsaSNgR73zPFRgY6Db3Dp2zxylJpQ8Ms4rqnzyLBmJwPUx3QVAwS5HksCoEdhTr3
         vKlF4tapzbOVd5bay2qMIgnztj1mO+WeT3eAzAe5Dv+ImoqqQ8D6UsKhbqnJsrOw4Tfw
         gvMF1txmH+1CQbiu1btEl+M7+a+SZXQ+3XnOS5q0zKBf+hT8frZC3ji8DnUD37pLRIUt
         adZUkQf0sy0+y5vRY+4580UTqL+pno6t3m0FIFFf3iXU+LMUgKidHxjnA7TgxP3bjpgk
         qMfwSPAY/yaQb69UX7ja6V/CIz0FAswCZrCI64SgPWskcut4dHM0HaVWA0wr6lnxxe4Z
         g1rg==
X-Forwarded-Encrypted: i=1; AJvYcCXavbVmCgbbzLT6Uiq/jFoxwTRtzS4+Mxu8x+ucr6/pVN/kl1SHMlNDnfBPJtX98cTzB57mf823FYKlGWAW8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpDyt4L2qfa3Fd/MNFV5ClcqSCo6GKoGOUX6FyFB2GHJmLhqhP
	wM0OlnOHii4iHc3FolBNqQUlMH+GR3OIy5czy7aj0AxSQEfveKLb0hqBxmjHxUNJXcA=
X-Gm-Gg: AY/fxX59UI9enh0WAY91zcEHluDxIzSYJhmRJ1TJBdM0Q7OFAU8wUZfR9beLSI4aoxO
	xFkMt/CmTFG8m/k+0tr+rTlzpPVfX+H/slAPzyh4FTZVv+m0AZkKOgyl1B574BE4GXbBotDpkFE
	DNjph2ohq72sMRKAdgpX8vinelUlnNF1TaMybnkx45qfkM1iQxkWS20zNInJ30qBQlzr4ioIQC3
	kxT/kaU+5yQ/TtyP9ud642eUqGKE6Bt8/U0jkAKvGNm0z4CS8fws8IKomVIE0xjrzqTnTpV72yy
	cjqmFCxCpblafeR2GWOt8iwBwiSe4LS9qEbZ1pM/Sk1AOpeTx5qQ92i4TMxNEUYn0Q9NAG+ENCJ
	1qvtm1ozKy8ol68FsqvwA3kG87YSQflFQApN1O8Jx5lzfUI3aYyp9sp6/OiR8mP2dxd3PKiuU5y
	4SW8gpkFkSvZ8dXQzDbTxBq7b99pHZGY4D/m4m5yLyZ40/QP9ZgF0KC322Z6ESShJu6Gc=
X-Google-Smtp-Source: AGHT+IGYAWh2sxLwizpTExt2w6pCX2ECxkldvqQUVe1MFbSK91RMxz7SwBO+heTsOJkJoalFRECn7g==
X-Received: by 2002:a05:620a:c50:b0:8b2:3484:8e22 with SMTP id af79cd13be357-8bee5dcdd8cmr986687885a.0.1766165548739;
        Fri, 19 Dec 2025 09:32:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d925f935asm23424216d6.0.2025.12.19.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:32:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vWeL5-00000001b6X-0xBQ;
	Fri, 19 Dec 2025 13:32:27 -0400
Date: Fri, 19 Dec 2025 13:32:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Will Deacon <will@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20251219173227.GJ31492@ziepe.ca>
References: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com>
 <20251219140557.GH31492@ziepe.ca>
 <aUVje_QZvJ9rjedp@google.com>
 <20251219161153.420d1c46@fedora>
 <20251219151434.GI31492@ziepe.ca>
 <20251219162734.46f3aa9d@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219162734.46f3aa9d@fedora>

On Fri, Dec 19, 2025 at 04:27:34PM +0100, Boris Brezillon wrote:
> On Fri, 19 Dec 2025 11:14:34 -0400
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> > On Fri, Dec 19, 2025 at 04:11:53PM +0100, Boris Brezillon wrote:
> > 
> > > There's actually a confusion between TLB invalidation and L1/L2 cache
> > > flush/invalidation. The things we can decide to flush/invalidate around
> > > map/unmap ops are L1/L2 caches. The TLB invalidate, we don't have
> > > direct control on: it happens as part of the LOCK+UNLOCK sequence, and
> > > no matter what you execute (map or unmap), you have to surround it with
> > > a LOCK/UNLOCK to provide support for atomic updates (GPU is blocked if
> > > anything accesses the locked range while an update is on-going).  
> > 
> > That makes more sense, so these GPU drivers just flush the entire TLB
> > every time they change it - built into the UNLOCK operation?
> 
> I don't have implementation details, so I can't really tell what
> happens internally. What's sure is that LOCK takes a range, so they
> might be optimizing the TLB flush to only evict entries covered by this
> range, dunno.

So, I'd probably just simplify that comment:

 For the initial users of these rust bindings the GPU FW is managing the
 IOTLB and performs all required invalidations using a range. There is no
 need for it get ARM style invalidation instructions from the page
 table code.

Jason
