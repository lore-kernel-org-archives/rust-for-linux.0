Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811F342C95
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157280; cv=none; b=GlQaYCzUkSigFPu+Do/sHgMNGSu+g2/XgkBT5RVVLu+XgTZQdG0Tam1UXdtb/unmBf0KR6/htnzexYE/9lWd/uXZJ866BTLWeWsuXHznx/vSX9b1BapzF0PzoXOJik+VSgTnFMmvLrLkHRQjkLZYiTazLejZ95TRz+j4pDe/3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157280; c=relaxed/simple;
	bh=bu+2UhDyr8oNj3zxOVAf6TDIA6PfTPU1OUzVkwJ0dNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7cOtqREn/Gobgm8oMJUkeSwl1k7WzbGpRj5DyV7iY1FUtG+ANGKPOURdhl9kE1fdFwA1KmGFIBV4iO/ymodzw+1ZNsPjECRZNfV8CSiJWuuGLhpPtPJ14qpbx5DJ/P4CoHBORfF7sKA7mTOJekKtER7GLBrBv5hJNVUw5ux2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GbQccgsz; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GbQccgsz"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a2fe9e200so14988716d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 07:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1766157277; x=1766762077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bu+2UhDyr8oNj3zxOVAf6TDIA6PfTPU1OUzVkwJ0dNE=;
        b=GbQccgszOfNLT31APJcGbTKwBztPmqvtL5bZdxyywenjz6xfMIL2wRemgDl8cuzWuV
         8s3dHP1NXN/2Rz1faUbJGUfLm1Wp2AJy1pXyXXRU1W+wzxn2VD7ciVDYcNxWPg/iI++F
         +F0s2wgTpEgI9hFmOk/wL+lm8HUbZiCJynXZk0dDSofAF1OcHszAyTGyUJp5sVqorLkp
         Dk7aowTxFIben0G9WPqSKdapqwL9nK6UHYxVVvojRjZDGIzYSZbfr/9L+xNkik8s/N66
         fTty9Dhd8omSja23EmuSJKGxPH0sNE3tKGjuKYicz+VTFJmPQ+htFWPr3vV1QFVoiehn
         Sqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766157277; x=1766762077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bu+2UhDyr8oNj3zxOVAf6TDIA6PfTPU1OUzVkwJ0dNE=;
        b=VjBEfTXF1euB9dkU7hgR3plYVLc9K/FGCEH8amZjYyRuS++5O9z6JxJH/FMm9TbHWg
         rzzwDpPDjmhdvX3Pk48TO5a/lehWlXv1ThZyqAw8hTl0X+4qyxrF1x+oo82Q1VKnT9Jy
         DLHoONY2vK7v7ECVFa/TskNYonzoa4BdXpR/DEq9pwb17qqELBCZqEiKYWVIyqrAPdKz
         8X5KNpewvF8lgChm/ueDIhIwMAj5RTnxnUa/ViKibiI/BrYNh2g6TWYgDZKU/QB7wpDi
         XOfNQgstVeXhy4DnmiPUsI/FCZ3qNPS6CgssRIKbGaDAmO848v6B4do3HkldvU6SyVXp
         WumQ==
X-Forwarded-Encrypted: i=1; AJvYcCVScOlhNQ8lrKYvjEFgPnvirZMCVA6QCK3WwWu63P+RuahUNL9C2rCx2AG5I9nyX+X5sPvuY4zRM19gOVMmUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEajU32ZV3vFVa0ZDKpDMelwpsp083vT80G1th14QxTri49vP
	MN7JijYGszAIiL5N7uXSfnMN9UipUDrtLuVsL+TBfgxAnVp1teHukz9eao7jvJOSio4=
X-Gm-Gg: AY/fxX52RhkEdbN93Z4EY9tTFffp/nL97JYQKNmJfQ3JkT4AzWJ6UIEkKQ0nBhb0Sg1
	q0gG37wOLGKb0zdCoVN3VeE2K7gCBn9wkcED0q3OrNSjUudy7XDBA3hlqdnH0ZgivMP9K+eKKyg
	jT9DYZQPnqup9ciTqjR0y5eAm6V9csZcSkCQUji7bb1UPyjrxyF/VdWY0Y+Adz2Sn/yECKOGIHr
	CoyKCjit+1zifbtXkGhaOwK7A0V6qILHy5v+2+5ROXL1yJ+gVMaIrfalFwx8yzr9YtRfd4S7s0a
	9PCURxyXVVlz8l92ffvdbTLzL6F7nmUzpKQbwEHqMbvTz8JHmqTo1pTNWr6ldPWZKzoE8CRig4O
	yGAkA29f9Oly4fCyqLttSmD/SosT9pBrxV8B5aUOuVKXUHaEKF2akicUySVRC5rii+bX3h03OKp
	+F5xVJ1IRR3ZJUaQ/xfjNjTZ9ho1BFmgUGBoUPQ7HqvCMK4E/1X02PNc6/
X-Google-Smtp-Source: AGHT+IFpccyEL+iZKcyKf39srRplzey4v4m0ObAaVXPx8Si8//BYqbNk1PZ+iX8dYDJiLgUevufXLQ==
X-Received: by 2002:a05:6214:23c6:b0:88a:261f:6af4 with SMTP id 6a1803df08f44-88d8404df6amr54276446d6.58.1766157277272;
        Fri, 19 Dec 2025 07:14:37 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fd14sm20785516d6.8.2025.12.19.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:14:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vWcBe-00000001YYV-2m7p;
	Fri, 19 Dec 2025 11:14:34 -0400
Date: Fri, 19 Dec 2025 11:14:34 -0400
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
Message-ID: <20251219151434.GI31492@ziepe.ca>
References: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com>
 <20251219140557.GH31492@ziepe.ca>
 <aUVje_QZvJ9rjedp@google.com>
 <20251219161153.420d1c46@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219161153.420d1c46@fedora>

On Fri, Dec 19, 2025 at 04:11:53PM +0100, Boris Brezillon wrote:

> There's actually a confusion between TLB invalidation and L1/L2 cache
> flush/invalidation. The things we can decide to flush/invalidate around
> map/unmap ops are L1/L2 caches. The TLB invalidate, we don't have
> direct control on: it happens as part of the LOCK+UNLOCK sequence, and
> no matter what you execute (map or unmap), you have to surround it with
> a LOCK/UNLOCK to provide support for atomic updates (GPU is blocked if
> anything accesses the locked range while an update is on-going).

That makes more sense, so these GPU drivers just flush the entire TLB
every time they change it - built into the UNLOCK operation?

Sounds slow, but is a reasonable explanation why they don't use the
callbacks.

Jason
