Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CDF19E83E
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738702191; cv=none; b=QOJm3ug0AI2GRpPxzAZPUGusefVmunT+PK0wsaF2AuCJmgLAEZ4K3r7KlgxlYsEH7rXdmQ3DBZvbYyNkoILIFOqhkA1px8j8N2BIFiM+pOAOa2yAFwV+JXmcjYgefxtlPB8RaqhbU4BekFjbJ/9nPS7/HRqOuKt/1j0yT0SJGs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738702191; c=relaxed/simple;
	bh=kYb8QeKwfReVJv6+NUbSIbrGBhLB5YTqXzeaokiOXnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFEPa450jR6yTa5CdeV+hyWX/HVEvKWbX35cGKRvf5X3mk/4HAIlY2s3mJCSlxCwaASOUzma/cjAuHsbBJmox4xNS/cnwkVsZq45pTy6+e9BhseX46fCDwpy3b6qBfk9E1t29XE5KJEHBIe7SlwjaikGpV13dkNAkNxkUkEpmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=khiolRDb; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="khiolRDb"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678cd314b6so56607461cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738702188; x=1739306988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuMGfHPH8Rgkcs5TNo6U5Y3uMl+k/KNkpfdbRlCt8ps=;
        b=khiolRDbMNMaot2/WmLdMq+REVBXBv9qEgvUdSKxHwBOsFi20H0MPcIFMcC8nlZ7zz
         r1dfNsXAF0nK1A+BtltaHjYCcLC+PNhtFBH+csEI9naZ4ZPoQXOYeMx+JMHy6Rv8PtAB
         gGnuw9w6Hkgoda92Eqs7UgklioMQMnMKs6GjO8BZYrBBZyUZEHEZ+SfdI0vAyuydsLGg
         +Fj8FgpO8rO3Xr0Qh7sD9Bas8wBWjfp5Mo55VcfwT2lzqPrNjCHx8ikAFhWo0AerRoR7
         eDqSD6C2XFS5OflB9lR6f0neKp5/VGR8lUYnyPqFLP/jQpDJaAUh5SRIteGpJ77CMy9x
         C64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738702188; x=1739306988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuMGfHPH8Rgkcs5TNo6U5Y3uMl+k/KNkpfdbRlCt8ps=;
        b=wsW3VC/M66dQXIo8tsuS3+FAdHgPI6qDp7SKHy4caUPAX+G8N212gjo6tspiCucRfs
         UmqrSQgk8KN5PQRkq2FLWuc3XuSUcE1GCNbbD8JpCGh7XwZzh6kjblDyV3OPnhVnm8JW
         VLy49oFX/yxFm9XmR82TZPaO+ZpgohrjMpiz0UDL7GoNlqRKOwZ5PRcg/unZ5+fxYdT/
         mQudKmX3MKZv9i0UJfsvkVVct743vbCOgHEt36/sFiSxEfMmo9AsR6WqmQqXar5514Sw
         g4kVkbzUWvzimnOvvJefhSPA4QG7JZnK/BV/dY2fFWQgFAugbKykfY1/I3pwlwIiLZo8
         sDlA==
X-Forwarded-Encrypted: i=1; AJvYcCU44BqxY4zd1zfSy8QsBnm+38rDnoHJ3v8XdaEFH4Da/uOhQ+hRu7h7X4YGSvdpMPlJs1Kx28q7b532H5hxRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0BewaP10qilHKGtC4waRCo3/H5ARAhvFyngThIePQenahO39H
	/Y8ikYQ+0yoCXcKczSoki2w5DfAuFamatp+8ARqxxkiTyxpw9ysscYaQV+KOH6E=
X-Gm-Gg: ASbGncsCZj7AY+t9TsGmN9kWvpsDfJOefQDxvPhxHGDEQsDoo4yRpYKQkdqQ98/mSlu
	NyVCqDJAAE5MVc63bW9idh/JbxXOcoqygV83QPAnImgJ4rzK0MGVZd9t455OK41eEtq6e/R3gQ1
	BvRu8aKHejdh/MwoMUyBiIOKNbvUCPWmvGwfFc16cj1a619fVtizYDo/p/MDdBP3MMPuWMGOXoZ
	JxJYyMFgFe5UjxkRbmgrKE6rEnqDr3O+NPiF0W1umfsIpn7HGm7ooXCAKAQbx/A2m7wvHbZHqMh
	rt9/FMRrWm3I7ZfV/vMO1GhQiiaCGF0qXnGp7DsHBCOJawt3VgcKHqR5wO082By9
X-Google-Smtp-Source: AGHT+IFCoy9O2sWsL/DnH3NCL2vtPB/0RnkG362y0xiW+CjQk353JmqEMZQpoug4xTMKjQExIBheCg==
X-Received: by 2002:a05:622a:1993:b0:466:886f:3773 with SMTP id d75a77b69052e-470281859damr1708191cf.1.1738702188666;
        Tue, 04 Feb 2025 12:49:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728c8sm62847861cf.56.2025.02.04.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:49:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfPrf-0000000CeMf-150d;
	Tue, 04 Feb 2025 16:49:47 -0400
Date: Tue, 4 Feb 2025 16:49:47 -0400
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
Message-ID: <20250204204947.GM2296753@ziepe.ca>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
 <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>

On Tue, Feb 04, 2025 at 09:41:29PM +0100, David Hildenbrand wrote:
> On 04.02.25 21:26, Jason Gunthorpe wrote:
> > On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
> > > Fully agreed, this is going into the right direction. Dumping what's mapped
> > > is a different story. Maybe that dumping logic could simply be written in C
> > > for the time being?
> > 
> > ?
> > 
> > Isn't dumping just a
> >    decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?
> > 
> 
> IIUC, the problematic bit is that you might not have a directmap such that
> phys_to_virt() would tell you the whole story.

The phys_to_virt() I mean is on the page table pages themselves, not
on a leaf.

All page table pages came from alloc_pages_node() and you'd do
virt_to_phys() to stick them into a next-table PTE, then
phys_to_virt() to bring them back:

  phys_to_virt(virt_to_phys(page_address(alloc_pages_node())))

Effectively.

The leaf pages could be anything and you should enver phys_to_virt
those, this is what I mean by:

> > Or do you mean trying to decode the leaf entires into some struct page
> > detail? Does a GPU need to do that? Agree that would be better as some
> > C function to take in a KVA instead of a struct page and populate a
> > string with details about that KVA from the struct page.

Though I should have said phys_addr_t not KVA

Jason
