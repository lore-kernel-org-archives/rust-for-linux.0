Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F41246BB2
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155137; cv=none; b=cSjZWr0Mw1ZHknvGq0Kw1JzFRrD1gXppajobWRnm5SHm67fT2MIJg8zEn6+P9jfodSbATObOPzoXB13fjeYlLd5WoaSC7tutO1VB0PFP0gNaHV/z+K6ESafDjSxYFbSyJ8AdLUH7ZWN0hPVAjuKSVIyF+DUdqCzBvAlp8ACTbOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155137; c=relaxed/simple;
	bh=tzimXUpPz/zg3NdCk2OmrJcENbwrPXNc11dumAfPvgs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HF5t2Cr4Rzp/CcXJH/6ZXw06U15sNonZGYgabggSF7i0BQofuW9J3v5CSnqyftLi+CSwsj8KGz40Z5d6IzcQj+2RRyqY7WO9sIC0UgHf1vA15nqdBwgXp2Ikt8v0P2LAcFnULV2lF+XXS8NUDgQbWrFN0PYVYK8jKX/KPyKHoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fd0RtB8x; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fd0RtB8x"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so12205865e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 06:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766155132; x=1766759932; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOmyd9DWvECzG90gfBeqQtyNiAxdrLgSD+wKw6UfL7Y=;
        b=fd0RtB8xJR/x+TcQy2kUE53Lt+lW6rwCMcSK4ofPd2PQD40/Lk90KPJ4fxNd4FDNQJ
         TiieZybzbkvRHN+ul0mvE+JycAwr9K9Vv5RvtjP5Hb44CgSlUNq/GVoPogrQ9545T3Cz
         ue3mDpmNi3YOj+b559N/6NgGb7Ea505KNs2YHgRVhI4wgmPwoYR8kKv/G8O8IpOZIiyb
         Z9UQ96A2zcw46AviIAcTk7xEGFPHWxL9Oen5AHnKwtd6BKtuUoxW7XJXksOSwOPONz1E
         P1FI7n26NnD+H69EL+ehJwigjV8BQEGhk5nWcgQDJB8gtYU+z5H9MV+2CWNVWsuq3v+c
         P2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155132; x=1766759932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOmyd9DWvECzG90gfBeqQtyNiAxdrLgSD+wKw6UfL7Y=;
        b=MKfz8UcjVbgljbaz3lmTJVoSJWnzq6syOYa9Ni5stbjkQ6ZG8UOpedSViMDdU2BwDw
         UVmquPE/sYFsiPl7uTWDxp3YJJeE1wnzAdF2dRiFOQ1AbcUQcaVbplIvlTToFgfdir+P
         iTLH+ntPv5TxASp/GipvetKRVpLqXeOYYO8YphOxWdc8Getm8c33V2NXwbAaI0zEhUnU
         Rw/NhvKEfys7SEvV1Lh03ni0LPTpncpqi+tYwaC/bqcXiJBQUsQgcvy07f2po7hKt+Zr
         yLBK+CRZKR9z6uxlqjjeJNUA0FQDkFWXldTa9YC9p6mSOnnjjuVFdRBT5NwCwAUUgIr8
         3sDg==
X-Forwarded-Encrypted: i=1; AJvYcCW/YT673bKS7ES2Bm2e1EUdCjdm92HoPfmQrc8AWQSRasH0ud8Xg9PKMsqIWlt07tAAxm4rP1Uk+mmJ8lKqeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxspWw1Ftxsd8lHMEtwi4qieupwYAm7h7pIFY5WvrNQzl9MFTFT
	UJwxAUAdn1Q+ZAqkM42I9AmKV/YUQEqUOAp4AA3coPtEI9cczFSXbnMQAuhzaUdE+60GzMBDCAm
	M8nbCqU1jkj01g81PNw==
X-Google-Smtp-Source: AGHT+IErMGwUK2SBp0iKRCGeYMRpkaCULx6zVFN8P1+g0RA4ffuZbMddhqUM3GNAvGi3LgVlXFFniESPnoRBsS4=
X-Received: from wmbz6.prod.google.com ([2002:a05:600c:c086:b0:477:9b53:8816])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c174:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-47d19582bd6mr30147205e9.28.1766155132493;
 Fri, 19 Dec 2025 06:38:52 -0800 (PST)
Date: Fri, 19 Dec 2025 14:38:51 +0000
In-Reply-To: <20251219140557.GH31492@ziepe.ca>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com> <20251219140557.GH31492@ziepe.ca>
Message-ID: <aUVje_QZvJ9rjedp@google.com>
Subject: Re: [PATCH v4] io: add io_pgtable abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 19, 2025 at 10:05:57AM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 10:50:52AM +0000, Alice Ryhl wrote:
> > +// For now, we do not provide the ability to flush the TLB via the built-in callback mechanism.
> > +// Instead, the `map_pages` function requires the caller to explicitly flush the TLB before the
> > +// pgtable is used to access the newly created range.
> > +//
> > +// This is done because the initial user of this abstraction may perform many calls to `map_pages`
> > +// in a single batched operation, and wishes to only flush the TLB once after performing the entire
> > +// batch of mappings. These callbacks would flush too often for that use-case.
> > +//
> > +// Support for flushing the TLB in these callbacks may be added in the future.
> > +static NOOP_FLUSH_OPS: bindings::iommu_flush_ops = bindings::iommu_flush_ops {
> > +    tlb_flush_all: Some(rust_tlb_flush_all_noop),
> > +    tlb_flush_walk: Some(rust_tlb_flush_walk_noop),
> > +    tlb_add_page: None,
> > +};
> 
> This comment seems quite off..
> 
> Usually you don't flush on map, you flush on unmap. The TLB should be
> empty upon mapping and not need flushing - except for the rarer
> special cases of clearing the walk cache which cannot be detected any
> other way than using these callbacks. Doing a big flush on map to deal
> with the walk cache would be worse than implementing these callbacks.
> 
> The flush on unmap, at least for ARM style invalidations, needs these
> callbacks because they provide required information. If the actual HW
> does not use an ARM style invalidation system then this page table
> code is not optimal for it.

You should not assume that the way I worded something implies that the
GPU hardware does something weird. It's more likely that I just got
something wrong.

It looks like panthor / tyr flush the range that was modified after both
map and unmap operations.

Alice
