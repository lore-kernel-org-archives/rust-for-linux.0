Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1014F9F7
	for <rust-for-linux@vger.kernel.org>; Fri, 30 May 2025 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614474; cv=none; b=RC7vN5fsVXyPiTgUfe+01vNIHNhQvezUnkhkuufdz7OxC+ROrErH66voD7eWbkQnciIlcgu/nPrtDLFEEeM+2rX3uoUP+pOFgTJSxAka0+Y+536D4OazWmTsAo5kQTlQPrWYA2RTlzsWn+n41Uu6RErs5y0nZQkVIJ0iCoYm+0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614474; c=relaxed/simple;
	bh=w6vyIbiIt60OQA+budbiiEAKBy6+C3l3+8JZbPAM7MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOKKyWOvs9c4X5ZWx3vFx8oWjZeN3XaQ7r6Dqx0L5UpucNLg3Zl+W+lEncIkUXfOfVSZMxTErhFarcUzQPKDnXdgz2/84DizEPkE9M3Tdh8Kgc2nU0uTq7rFbEFbh7v4hmMy/W70rMHTINHMnXviCHQRfs6y3IqzewlawGhlwTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CKwkGqyR; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CKwkGqyR"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-606668f8d51so1280660eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 May 2025 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748614471; x=1749219271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJhRCQ3+5ch56FEt+lYFH6O5ry6RxHPulLxItBAvDBE=;
        b=CKwkGqyRH6sw5X3I+l1zhm8cs/qVirMkU8sp9iUxDsR5P6Sjhd5+lVXLdDDx40Vfft
         Ip1XwN8wkWrE3v9B27b/pJx6G/XXV9M3pgk7AiUsB6/ARdwSk8teNXiSYqWhJnqUVCtD
         jt6kjkID00k0DU2TCrJIfrjodbHGkQ5Lm/PGnPjH2znK+G4rCthgOU9dTYjU0aE/bLNf
         7OzQhgPjPMOeEFe1BW4ywjt/5pKqRQ4sWlJVxyZx9mZJdtHypJM2Lq6nw/Hi1bPOv//P
         /f23cyX3w8IFkipSqH54tLE3rsazJ6F3I6wJU/DZ+uhaT2N+4p5YNdHs68H0H7fJJ4wd
         jxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748614471; x=1749219271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJhRCQ3+5ch56FEt+lYFH6O5ry6RxHPulLxItBAvDBE=;
        b=KPHpZd9W6nyGcmj+3JJD4J/xnBJHPz5zhIE3729KiM9ENKnMYYIIDl5J5sVJSzQlV4
         PZR2GcShMC2b7PIw2N9docnWvnT8kQwstuqj8slKwlWrV2GRJpQ9/VbaUmE5n4ChF2ll
         1jV6j2H8ArYzRdDpnsZ7eM+iASyum2Ulz5BVbGyJgsB7rChg0DAzfsl2csgXg12KEodx
         STTQtnNOBIEElvuTj4GlJ2h2UcSblwxsafR8BczzA80VVEALEkF4cdUgbrHAS2CjhQhT
         fsJamDtPke5cFdbm/uoQcIXfB+IbZtOchxGv8C2wIStq5EPy0TfMrBHn62NhtwqH6d8R
         DhMA==
X-Forwarded-Encrypted: i=1; AJvYcCVAamIHUmc4c6zh1q/cMAQLnvELyMM0BMxmTOyyQ1TbXb8Ki5qlIWzzrBG2fCM3kXUUQWJTd8gjdfLgEw+KYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRuvOGNOP3c/48nQI1hZ6F/70BrDjaWK8gpV8h1xPyqN6qq5FE
	NfOBL77em6lNT0FRL72vDWS1l0SDDMxB8Rzw0ZAmQmPjptbABAS2s8h9/ZKzfktbbaCw13p5y6G
	t+GXs
X-Gm-Gg: ASbGnctVKh87C/ZgExZQFt2Z3rPeTbmHcpJdXrXH3FcREMF9BM83cOcXFLP89f8xbZS
	AcVzATy66W+ynU9RVkHKM++FTUvw7AGWLBqpg+GKQDVyeq58UMtQv79rSBfyxhn5TeA/I5Y/ulU
	3s2Uv9gbGlblldjHLd6lAoHn5QRWJ2RMDOF2ZRsfHv7JapphnY3KjBV3yzsOPedUS0fINAPKa+3
	+ByGQ0WqzK4wr9TCqDnIcLNu5LYu2Afpms5DT7cCxNi7O+N2JwPH3/5jHWeAhY0W3NB0zoaWNeI
	MwdDC/nxAL8p7d0MyHKzPZZR29yKj4XnmtRVcWUeyKGSjTTa5rqNOneJewjFiqiEp00xnZuBLgY
	cmH6Hfof74xBffBPNxpwTJ6iJAK80SQcpdjXR6A==
X-Google-Smtp-Source: AGHT+IFOf7i5ZEFKDYgnQUFLsEV+BJeDM6urOVFUTsIaLbJ8t+i0AJQ0vieWmToACnEapeCdrhFPoA==
X-Received: by 2002:a0c:f098:0:b0:6fa:a52b:d4ba with SMTP id 6a1803df08f44-6fac5d3ab9bmr105797986d6.12.1748614460927;
        Fri, 30 May 2025 07:14:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00dcfsm23235216d6.87.2025.05.30.07.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:14:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uL0V1-00000001ELN-1sQe;
	Fri, 30 May 2025 11:14:19 -0300
Date: Fri, 30 May 2025 11:14:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org,
	lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250530141419.GA292183@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>

On Fri, May 30, 2025 at 11:02:02PM +0900, Alexandre Courbot wrote:
> You would have a trait for providing the pages and their range:
> 
>     /// Provides a list of pages that can be used to build a `SGTable`.
>     trait SGTablePages {
>         /// Returns an iterator to the pages providing the backing memory of `self`.
>         fn pages_iter<'a>(&'a self) -> impl Iterator<Item = &'a bindings::page>;
>         /// Returns the effective range of the mapping.
>         fn range(&self) -> Range<usize>;
>     }
>
> The `SGTable` becomes something like:
> 
>     struct SGTable<P: SGTablePages, T: MapState>
>     {
>         table: Opaque<bindings::sg_table>,
>         pages: P,
>         _s: PhantomData<T>,
>     }

At this point it isn't exactly a sgtable anymore, it is some rust
specific way to get a dma mapped scatterlist. Most of the actual ways
to use a sgtable's cpu side would become unavailable for safety
reasons.

That seems fine to me, and is what I was suggesting when I said not to
expose set_page at all.

But I would maybe lean into it a bit more, why have the type state at
all anymore if the flow is SGTablePages -> SgTable -> Dma Mapped?
There isn't really a reason to expose the CPU populated but not yet
mapped state to the user at all. They can't do anything with it. Just
directly create the DMA mapped scatterlist and only expose the DMA
list through the rust API in a single step.

So much simpler to understand and doesn't leak the bad decisions of
the scatterlist design.

Certainly the initial uses of scatterlist don't need to ever know
about or touch the CPU side of the scatterlist, and it would be great
if Rust could stay that way..

Jason
