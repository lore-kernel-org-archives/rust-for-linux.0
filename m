Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC069222582
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742581543; cv=none; b=OsHZaCSARD76NVKSwdTSV4q3dGsq9Dd4JNhpfxXlv2JoBmPZpnqUY9i5Sh2LYqbYoxqwCr+/LqiSxvPZujgX7rojy457RSM8ry9nOYnddK69ZcuVNvegASiNL2Hj0TAljuxOnfH834DsJeNJNGQ0/rGj2DRylWQBmenXCZdhwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742581543; c=relaxed/simple;
	bh=jemg1ODGg1pK6bsHf0OEdD0dT3yUnEMJLXk8hBjZYxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2cqi2kCZGKKM3eDjYw9AC5qSuyV6zgD7UZWV3uRtNlw+RQbjrXIHti4npO7odKUD3XA2X9sLOTMfufyz7BosJHwit9+dp5OYrwuFJTN7whLTByJhgnOznMms9BSy4YsiSZaEMapPcgT+QZn2B3s1BLVzeyrtox+k0W+plHEgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=M1IHhNw1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="M1IHhNw1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e41e18137bso16575586d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742581541; x=1743186341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DRNDu+mZPYgGquCy2SeZdyPfdQyJHb3d44tNADVang=;
        b=M1IHhNw1R9ZQMCmOQL90iwHYcU1BJw2ArHDDp8y12TvacSzmuiJiPxm4tL5It98war
         MwKZ5fNbPFXORUnQAlA+CN7VUOvL5Ys4TVd0H+Gxh5B+/Xojkt0ouGib6cJoe05lQfsN
         2q+yvGq7jJK3rw+1YSo4BRTmPvGBBguijzYNo5Z7q/Tl5GFwlhTQH0DeNjQ/Q2J2Vv4x
         eHaH1K/Bn3Is7oXTLzD21RTv9yFsHMD/9RpMaMiSmHt+OWI+XwddiKTW3sa0nRc5b/tp
         GBgFxqVO9HkXzirutRhmUk/fU3bBAbF9NspYOpJQY18mTmHtOCaXNasxltcTFRhdB9RN
         R0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581541; x=1743186341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DRNDu+mZPYgGquCy2SeZdyPfdQyJHb3d44tNADVang=;
        b=ZOMkkpeVkasiEQYmcWMjJRYIrhl+F/QBd2wTrlG4MfKPkcPADwWxSIZscf6R734DzU
         sRB3+cx3Iwi/WGW4AwoxqD4CtXT7QeXCl0ZtUSzDnclrv9jUUgJB/YmQpNmrQsU5kYEl
         g5HQLiAgCldK9JXXw7PzBS41OWXOM6uG2sZ67+BVAoKnbdrbbwFv11QkgEBPo30IFm6F
         WW8ecF5Swt8IpJMJ+K/VmJ6UhxIVPq5NqHMxKDMQB6dpPYMR+9zTLrQ50jds6CDoCQHl
         PG19MNwiQsW/ojSyVLsE4FPwDAFVuMy3ZXwEK1pkviGZa2JaeesJ1MwCvVXqiLVWXIUe
         eieg==
X-Gm-Message-State: AOJu0YwEnoxM4d8UqQWZ4dHWpLTGQO/dEuj8gGEE2fkveqTsiofsVlm5
	t0Ut/iT0IulOAdfaf5hUDNjUPfwcOHwkWP2ZwLMLfN5UcMqE29eHkqs2ptFqrZGtWos+NbscCQi
	B
X-Gm-Gg: ASbGncucBEJaNyK6ZgZl7mOgy8ujc9JJyLidU7zyxZSFR8Q8kbYTmVvpDwaLEdddDro
	Ud1jRI2Ja8xeGt5ZkZXmdIz6k/+cTCgEnJ2A9NdcN/OxRF4AsK9u6ewPr+ElkANJ/9pNhDUlMw/
	BV+mBnUOrxq6t35Kj8cNzxUqVdfk3ozOh+/VQgkwHge0vfgXClNvU4HEZKpLU+lQ6Jsr+9OhCLD
	XxaKm4t2wripuDQT9YILJ/rVZBmrD9TVaXwEZhCyYWRCj+sw28F6BH9H3B9Qn8RXVjBAcNhBNsM
	oWe1in81ti08hYD78id4vFSF1kJJPk0wANHa97Un1NN/s8swXsJerZT7HtxpzTPK0uc8h6g6+xK
	kr7gxad+8sGLv4knGK6pvKao=
X-Google-Smtp-Source: AGHT+IFpNIlarhIX3KQ1uNeuExxcnUQwaoKxWUOhP9ifvqi6wUM9+9o3gFTu/dM5lv3aP3HzJCq1dQ==
X-Received: by 2002:a05:6214:268f:b0:6e8:ddf6:d122 with SMTP id 6a1803df08f44-6eb3f294de9mr65457026d6.3.1742581540524;
        Fri, 21 Mar 2025 11:25:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efda6ccsm13609536d6.113.2025.03.21.11.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:25:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tvh3r-000000016XB-1iiC;
	Fri, 21 Mar 2025 15:25:39 -0300
Date: Fri, 21 Mar 2025 15:25:39 -0300
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
Subject: Re: [PATCH v14 02/11] rust: add dma coherent allocator abstraction.
Message-ID: <20250321182539.GP126678@ziepe.ca>
References: <20250311174930.2348813-1-abdiel.janulgue@gmail.com>
 <20250311174930.2348813-3-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311174930.2348813-3-abdiel.janulgue@gmail.com>

On Tue, Mar 11, 2025 at 07:47:58PM +0200, Abdiel Janulgue wrote:
> +pub struct CoherentAllocation<T: AsBytes + FromBytes> {
> +    dev: ARef<Device>,
> +    dma_handle: bindings::dma_addr_t,
> +    count: usize,
> +    cpu_addr: *mut T,
> +    dma_attrs: Attrs,
> +}

I'd like to point out how memory wasteful this is from what real
drivers are doing today when they use the coherent API. Let's compare
against SMMUv3's use for the CD table..

This would be the code in arm_smmu_alloc_cd_ptr()

It is making a 2 level radix tree.

The cpu_addr is stored in a linear array of pointers:

			struct arm_smmu_cdtab_l2 **l2ptrs;

The dma_addr is encoded into the HW data structure itself:

		arm_smmu_write_cd_l1_desc(&cd_table->l2.l1tab[idx],
						  l2ptr_dma);

The size of the allocation is fixed size:
			*l2ptr = dma_alloc_coherent(smmu->dev, sizeof(**l2ptr),
                                                                ^^^^^^^^^^^^
						    &l2ptr_dma, GFP_KERNEL);

It doesn't need a struct device pointer or reference because this uses
the usual kernel 'fence' reasoning for destruction.

It doesn't even use dma_attrs. (why is this in a long term struct?)

So, smmu manages to do this with a single array of 8 bytes/entry to shadow
the CPU pointer, and recovers the dma_addr from the HW data structure:

			dma_free_coherent(smmu->dev,
					  sizeof(*cd_table->l2.l2ptrs[i]),
					  cd_table->l2.l2ptrs[i],
					  arm_smmu_cd_l1_get_desc(&cd_table->l2.l1tab[i]));

Basically, it was designed to be very memory efficient.

If we imagine driving the same HW in rust the array storing the CPU
pointer would have to expand to 40 bytes/entry to hold every
CoherentAllocation. This means rust would need a new high order memory
allocation to hold the CoherentAllocation memory array!

Jason
