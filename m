Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9143BB9EF
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772925; cv=none; b=fh52lPKMMzuwhgGbyQZK4Kj9pg96TXFF0mqTELqLj5kkmI949DTGu/JSfALMEvSWbQ0f9fICccBh4ebKaxjZEV+r/4FD3lgMV/uAgcqhawMuVd4CFj1h5KxRiqONKCbgtsPcHDTL5AA7WraMRYJCgSRXFzy9zZRGpOFj96rvmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772925; c=relaxed/simple;
	bh=QM0bVPxlx46ODCacqIIoJuIOnDtNgXJ0Hb7nJeo8Aqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oQaMlVUZwCD+R65AsDZZ6aXO0uDVNetJMGhXwvGT6JQ/YxRa71V5+Db8ony1zvUk/5EXHJqUgrCYfINXARRroniDFN8tYGGULalZh9r56jG1mmizjL+x3wmI3VX2rjnRIhIaTf5JNeAqEyMkhBmvhZO8T06LPdxeEPuW9rZYz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QmpVmCg+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QmpVmCg+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493dc8408fdso13619305e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783772922; x=1784377722; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zqV6pU7J/up3BiO4WkzdnwyvKk4FnHi04KFj10WU3o=;
        b=QmpVmCg+2DNDDL2jg/dOAqzehKJq6fzrkVvm8P8cYCuP3BR8NwYx+S1OKfahrxBR87
         YOZ07u6JohqtQ4Q3Mtc5gb6/n/QWV/MhmKWiQiGxGkblwRjgcHGA/xy0xcUU76K4ms+/
         7pASUuEE00DEze9jHf8x8bXEMcCqhfhnfF1RnWewv9fde6Z7QmkGtELK2tFtbxqd57eK
         +o93/uAF9O08iBBOWAt2duNnfMasXHkx780Pej/oG6O2VwMTz4eME5/qkW+Evy4LsktE
         EzQ2wpChe7LBCPL2Gq6Ghra/ZJ4rOFKO+i4kowlSBVYBXvHSn/ptSlLubzWGeh1BPmWV
         KKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772922; x=1784377722;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zqV6pU7J/up3BiO4WkzdnwyvKk4FnHi04KFj10WU3o=;
        b=gcSDnRXZC604x9Bx+9CHP8frUqV5MSd2D9XNc6Fcis4YbbYrqoYjax/up8fUs4zpIu
         +BgZ3DZliQF1M2nt6/uPMYDSb20tKlJnDjBKJfhgaT57I1DyGQCoEiSkkfZvUC4M/w53
         xhJWbbF0d1FZ0F2Wi8PeyWwjC4oAGaL8qNUCWbQ536zFIPS69+njwV9uACO1493BqGTP
         oVMayOA4WyoJZz0utLmZENmPSjYshEariTgOnL24L4Fi8uWuJrzzifvSI5NVSX6GjCkJ
         8V/FNK2HxyvPi23it6+KgNnhX7OGHj3NAT5VQkvGIjSDiUEt1vsekVtw9KGXOfcQACSj
         zxkA==
X-Forwarded-Encrypted: i=1; AHgh+RppPhLJMZPiz6qRxWe3f9ADtJA8cJfgEjZiaM7E6cJvuejjXCuinrDPbkk5ykawNA82dbqRTC7nCg9PTHcifQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9H9D2LkQ0TAEFvJyGfTSr10vgfhVe+Fxk253flEwhadMtF4Y0
	CLn8EVsgtldcSgZ32uksO8H9P+Zz0rFyncM7O6+r6zQYAYLTGAllFwR6Vt1JS18FQEB7YJVn35l
	nZRD5XU+8LvSDambwPg==
X-Received: from wrue11.prod.google.com ([2002:a5d:4e8b:0:b0:46c:d068:1ef8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6692:b0:493:bf84:53d8 with SMTP id 5b1f17b1804b1-493f87e472cmr24827145e9.9.1783772921797;
 Sat, 11 Jul 2026 05:28:41 -0700 (PDT)
Date: Sat, 11 Jul 2026 12:28:40 +0000
In-Reply-To: <84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710-chid-maple-v1-1-4ee869055268@nvidia.com> <84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvidia.com>
Message-ID: <alI2-KaHDTmUvNK8@google.com>
Subject: Re: [PATCH] gpu: nova-core: add ChannelIdPool
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg KH <gregkh@linuxfoundation.org>, 
	Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 10, 2026 at 02:29:39PM -0700, John Hubbard wrote:
> On 7/10/26 6:42 AM, Eliot Courtney wrote:
> ...
> > +use kernel::{
> > +    maple_tree::MapleTreeAlloc,
> 
> Hi Eliot, Alice, all,
> 
> Eliot already laid out the maple costs (the alloc_range+erase loop
> replicating find_next_zero_area, the extra mutex, allocation on
> alloc and free), so I won't rehash them. What I can add is why the
> alignment is a hard requirement, since that is what seems to make
> the decision clearer to me at least.
> 
> Pre-Blackwell, USERD sits in BAR1 at page granularity, 8 channels to a
> 4K page (chid = page*8 + slot). Giving a VM its own channels means
> giving it whole USERD pages, so a VM's chid range has to be 8-aligned
> and a multiple of 8. Blackwell moves submit to a per-function doorbell
> keyed by (runlist, chid), and the constraint goes away. So it's a
> constraint we're stuck with pre-Blackwell, not one we can design away.
> 
> Given that, the bitmap version is hard to argue with. The aligned
> allocation is the one call the API is built around, roughly:
> 
>     let mut ids = self.inner.lock();
>     let area = ids.find_unused_area(0, count, align_mask)
>                   .ok_or(ENOSPC)?;
>     // area.acquire() reserves and returns the range, drop clears it
> 
> One lock, no retry, and release is a bitmap_clear that can't fail. For
> 2048 IDs the backing store is a 256-byte array. find_next_zero_area()
> is also the existing idiom for this (IOMMU, DMA, IRQ), so it answers
> Greg's reuse-what-exists point as well.
> 
> I'd go with the bitmap id_pool.

Completely agreed. The loop in this patch seems like a really bad idea
to me. If the maple tree doesn't natively provide a way to allocate the
range with an alignment requirement, we should not attempt to hack in
support for alignment by looping. Please use the bitmap.

(Even without the alignment requirement, I think that the 2048 size
limit is also a good reason to use a bitmap, but the argument is less
strong in that case.)

Alice
