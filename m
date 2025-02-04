Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A53217707
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694377; cv=none; b=MwgEnNK4XkspuIixtD3+ta/3b+/W1hHxoQPDMQ/7pAUE+SF8nJ4SsESZSxOQgoCTQQF1+SQ7euLmmAE/PZtu2pmxIHsBoOWUwUsRZF8K+e5mxOUM5BxR04ynM+DBiahj18pYszB7rBVmiVuXQAZCfcRwTmfu2T8evIaJa75cZUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694377; c=relaxed/simple;
	bh=9h6JJAK4Pu/iYlnPyM0tcNbLTUXHmVjPIFcLtCL7ypk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W59IWPy61/ZwdGf+TrxNxrfrVMnsvyf1EQoZGJazuM8wA+ci9hpWpBjKY/gsETOrOuYN/zBskoPKBu6xOezbWPj3lx5Ddmj3grgf419K6Roga9euydhfHHBPTMfrTGgamdDCJKVzVtP5Qn89TBxXJDFiPVNWxYMZSKndiwDw1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZgXvm4f8; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZgXvm4f8"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6c3629816so317890885a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738694374; x=1739299174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIOzsVL38g1sJ/ZUBOZhRNBuZ1s1V6W+JXIpoF2R4YY=;
        b=ZgXvm4f8xWjq1f1DXd0JgdvTdHxYQod7BYvYqHeX+vcICsPC8JQA59N3FaA6KsYPxO
         jJ/a5l+NJW69onbFmDDtg10NupNihOI2dGJZwXZbplqPqZFfnupn0jKXzr6nW2YfDWFx
         CqtzMQFUwN91GGiGLk14pkU1zXpJIjTeP3jDqESPb3MMJqudOw1uGX4JTBBuxi70XKOg
         5axT78cAZPK/ZcIeok9s9jy3tOe2dH3GQorCNOpKXzDHtJ2Hh12E3jKYjGVWKh51Xk2W
         I6CAdh5qE4fk3vSJ+XmxFGbDqfEEcWKu4wwsm5WKNExA1OAgSlYm95Awfpr9fKeLiN8b
         XVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738694374; x=1739299174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIOzsVL38g1sJ/ZUBOZhRNBuZ1s1V6W+JXIpoF2R4YY=;
        b=UojWHblDfZSr/9A9K/VtNqBGxEhCy0cHUdiy71wAqBoh6nMFHyVpZHY2Y+AxZITF7h
         U/bIo4aHN9bMx0tRmi+PJI3mQ5BLY++wOBuCxGgtFiFybyf9myoag534OzUm478B5Syq
         EGGEqbwMKa5KUYrAdMdk1hq4EcNUS9mM0tb5v/yqk0chFDGolHhHrXtlQhXtGmAvTlsV
         hmOUAVl3vNmwYG0mXmAvVE/vznUmN1lEc175HA332VHfp2jhpk4nhrohUmfsCk69BKyk
         UnhZHXy8IrpxZsAeuSFT3zHbd+U/G4Oys9v6GIGCM3hlS4bll2pdEytT7Q82ddQNDPlS
         oq/w==
X-Forwarded-Encrypted: i=1; AJvYcCWSZ8342+rvV6jzs99sVUy6jkhPFxSj8xWhdc3A9Xq6QAon6soGOXGBu+p1QpsSbPBm3LJgpLYXO0p5GkK8iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygrP/nwcZtslWq9OpT/cUf2N5+eK4yAD36Gbf20hQkOB3QqIGA
	GKIl6xO7Y4MooE9Iid/ekEqi4nIToEaTnoRw5vZ8mWSHMnJJXGC75Ka4yvNwtyE=
X-Gm-Gg: ASbGncvdPSAnSMiOvR6BuHc1ZSj/IC0rHfovvdo2h8MeCoSCW9dJ5oNYwLjwIRJhtTN
	yOVRadLzO5mUl09I+YJSWLIPuZEEzaDUyj1kmHahjG0MJcnS8Pjdg0UHzCYwRDBjUbquywScUVM
	IWbu8T2T2SEcuRkB79W7GvAuFyGeSSQIMXzT5xumLDMip2qtaC/IRpzaKyRKdEUp9WL4t1NjX3u
	nSz5LtLBOKrGzwOlWjlue8qbAJf7R+niPJ+kF32Huc7JOdf+Y0VPALcLpBspYPwDVdX0kb6RSzr
	BjWRZ+gTN0j3RS2PwCpVD80E3HV4CcQjzeZ1wqyoHO8KYBAhKx3PKNtw7eOe1QKa
X-Google-Smtp-Source: AGHT+IGe86LJbhfodbSk2b2jGfTFxFUtn8so+wGv/gOJaU4HL5gvynsh/jzDxiFtVbtWWBBV/9+02A==
X-Received: by 2002:a05:6214:2385:b0:6d4:22fc:ce3e with SMTP id 6a1803df08f44-6e243c7e125mr344942586d6.44.1738694374325;
        Tue, 04 Feb 2025 10:39:34 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548141b5sm64420416d6.39.2025.02.04.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:39:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfNpd-0000000CBTB-0Jbn;
	Tue, 04 Feb 2025 14:39:33 -0400
Date: Tue, 4 Feb 2025 14:39:33 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <20250204183933.GJ2296753@ziepe.ca>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>

On Tue, Feb 04, 2025 at 11:33:24AM +0100, David Hildenbrand wrote:
> On 03.02.25 10:58, Simona Vetter wrote:
> > On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
> > > This series refactors the existing Page wrapper to support borrowing
> > > `struct page` objects without ownership on the Rust side, and converting
> > > page references to/from physical memory addresses.
> > > 
> > > The series overlaps with the earlier submission in [1] and follows a
> > > different approach, based on the discussion that happened there.
> > > 
> > > The primary use case for this is implementing IOMMU-style page table
> > > management in Rust. This allows drivers for IOMMUs and MMU-containing
> > > SoC devices to be written in Rust (such as embedded GPUs). The intended
> > > logic is similar to how ARM SMMU page tables are managed in the
> > > drivers/iommu tree.
> > > 
> > > First, introduce a concept of Owned<T> and an Ownable trait. These are
> > > similar to ARef<T> and AlwaysRefCounted, but are used for types which
> > > are not ref counted but rather have a single intended owner.
> > > 
> > > Then, refactor the existing Page support to use the new mechanism. Pages
> > > returned from the page allocator are not intended to be ref counted by
> > > consumers (see previous discussion in [1]), so this keeps Rust's view of
> > > page ownership as a simple "owned or not". Of course, this is still
> > > composable as Arc<Owned<Page>> if Rust code needs to reference count its
> > > own Page allocations for whatever reason.
> > 
> > I think there's a bit a potential mess here because the conversion to
> > folios isn't far enough yet that we can entirely ignore page refcounts and
> > just use folio refcounts. But I guess we can deal with that oddity if we
> > hit it (maybe folio conversion moves fast enough), since this only really
> > starts to become relevant for hmm/svm gpu stuff.
> 
> I'll note that in the future only selected things will be folios (e.g.,
> pagecache, anonymous memory). Everything else will either get a separate
> memdesc (e.g., ptdesc), or work on bare pages.
> 
> Likely, when talking about page tables, "ptdesc" might be what you want to
> allocate here, and not "folios".

I just posted a series to clean up the iommu code that this is
cribbing the interface from: add an ioptdesc, remove all the struct
page from the API and so forth:

https://lore.kernel.org/all/0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com/

I strongly suggest that rust not expose these old schemes that will
need another cleanup like the above. Page tables just need an
allocator using simple void *, kmalloc is good enough for simple
cases.

Drivers should not be exposing or touching struct page just to
implement a page table.

Jason
