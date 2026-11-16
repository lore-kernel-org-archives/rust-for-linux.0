Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857904;
	b=AY60hhLE5qvZsHH1kmEul9/ocIw+3oZGiyy+7UhImT0W1Hr6VGeSzowMet0hxGzP3fGL
	 yf1Nv3CjHIbi8cvo8wZ/70RILaK/j2qVRXqCQ2IbewMS2NE7x07cWvh+aZMuZvQB1j+Ak
	 +QNOEz2zaUSVlVXnZzokMeUXMApUJ2HVWMJZN/0T3kaik9acuKnKpKnbYU6OEqkArqDv9
	 5AGeToUWkDdeqs83bariyr88aa1+U76QKga8SvCwFOJr4xZYDqtJ/k0x1NgWyzZcgqxr0
	 BfwVpilLUUtiZi50+xxdlUxtnFTBN80G0Tio4cmMj/BiV9IDZtJuIQZkyEPDrDGDcsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
	b=bfqAw1glG/QAz+vUoIFiJnbstAGQ74nA/AeLln3jkwo2BF6QN2NyZ/+yHLfeeeBlerlJ
	 TB/RX3N53D7wz05pYHcCl2VCjWP/2MPd0z/gvbYn4VUzRwxuGSbBpxKSiJn8DpvtWgiGM
	 88nJBqkMnVz3s4i7MjxtWHuK/XwDgurGJtEkUSZu2y4kzcWJ7gxN0EmkHeHqH1wKyBDFS
	 3FR4JDtGjsZx97OtvBfxS3mjGtLlNuJw8MmDb48Gu5vyH+ha0AFMpkHgYD8/oFnkuE5E9
	 K2H0uZ6ZzqVsaUBw17bTQJOGsP/U/BNypq2MbcpgQetFCSKpSwwl1biBruQnoRqU6EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UP7tqSIg;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3252606A31C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 19:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3252606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UP7tqSIg
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5365d725440so42019581cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857903; x=1795462703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
        b=UP7tqSIg+Zq7+LwHBwpTHoLbN3LwuEyc94bwjDub/kzmA0gGs0fz7b/MTO1qulRMm4
         z6aZmiuXiuWs7PrvYN9s7AD8FGW6PzS5VAu8NKi3Hogxa+vDE6+MnJdS/r3I8/6CtALU
         pjzzc369dq0nGNUuMu4UBd5ig/bpJIOKOLpuJZ84CBV0FFdOqzt3TuhP8/5cclRXMyZL
         jHDEo7Lf08rka0zDNQ2Ao9QogTC5TAdtyslpzbaM6/EOiCUa42r+wBxysBUaTM2UeIBf
         kQ34MT9B0u2/17/9VdIuXNGcf5LXeoyUsISgFKQpTmoGF++cfuUfL7IEWHipaMSGrHOm
         zyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857903; x=1795462703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
        b=bzKVEbsKQxYfeXO0BnJk7YvHESlp0WfUcxsaW8WcZ+1GbyJvVxE4x9GmYer+bmEcJq
         D5gVNuIaQg11BzH5hAe2lxY15a6s3KLwFPxu6ZPfEFu/Aze1paA1EmT0kkq5RmTLKMUp
         /yyLACcA+S2StFMMfAYtIR7s7jf8vQl1XlirwELtsZV05TT5nEkZBJv5ARQt/8oS71UK
         os6YuZ01gK5oHxYgiaBZ5SmBbmY6ZSF0cRVD8A0FIvO+KJUkDT9ieIQgRu67YSB+RJw/
         vXUbH8YWk7Kl2DbUIUX9vRWmSSWrYU8CjwuC7xeEVVSaV0EkmfhILNP1rFwfrIgPMSfk
         Hprw==
X-Forwarded-Encrypted: i=1; AL+hErF2btvRo8HFVmcJ4aQsqtLuYmTAg31206HL/TpVT8upQeTNsximTrL15/7KchxoGo7p8t0VLBZiI6FhvziqNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/x7MYHiF/zOJTrDcy38RGuHjLPxqZ9917l6e2aoX7bqTr/L/ld
	U6r/RyWKN0/p8jXje8p0R0B5A+HY2aSCgcUgpc6cMKU4NtVrFZ4Iui3ElJ7JBwIS3hE=
X-Gm-Gg: AYBFou2Ywrg9xmkeLn4brWl+LKjlS0bvLd8LdWiXsw5Nl3qd0uoqKm+67r6MIGoILrW
	t6sYxubXEEeYUaMe8IwxjNnqSG5WGpgFKNLIQgcmIg/k4hSc0XLF9SRVcFaeElUM4zetJYzsvHy
	VKib/1S6MZxBqdfD/4AZs79aN3i9oB1g1MlmY+2jqE1olMiTuLk+J+G0czOp9e+eG+9pmB6c4rR
	SHrI9rF/7YV/kGsaRxzxv9oIu5X2Mk5k84ibe9l7viUF9Vtd46X/HjHkb6nK3Aw+miC1AVw1mwg
	t5xOBnq83276o50mmtOuyj2xeO5Ejc2f5lyxdL5Ggbbv5RDqe/l6cVRZX+1rbJBcP2iONu2QKvP
	vavgT4Xd8ZxAHaW4oCMZYRMApRPuYmerRfXqdpOQa1J9syNLrWY5GNZzY6pH7R2HfaBXR/m1wJ9
	tPX11WPeSCqmQciXrWokW/wRoWk8tECBfSCaDyiY4iDZD5n1nEEV2S58GGExQhKN0s0uHNsFUe9
	EIQa4YLy+zMcIcUNC5wC/mqVOcIbX7P3yPJ6kQcRoXkV+2p+v+0m7aHIQ2ijkBBRs0Uhm/NWJ5q
	2waTDA==
X-Received: by 2002:a05:622a:1f94:b0:53f:8b7e:c0e with SMTP id d75a77b69052e-55ac755ea54mr198728171cf.24.1794857902540;
        Mon, 16 Nov 2026 11:38:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d3610521csm36870131cf.23.2026.11.16.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:38:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2Wz-0000000AK3c-0tcq;
	Mon, 16 Nov 2026 15:38:21 -0400
Date: Mon, 16 Nov 2026 15:38:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261116193821.GC2452510@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>

On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> This series adds a Rust abstraction for IOMMU paging domains. A driver
> can allocate a domain, attach it to its device, map pages into it, and
> install a handler for its faults.
> 
> This will be used by the upcoming rkvenc driver that my colleagues
> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> [0].
> 
> As part of the security model, each client will have its own IOMMU
> domain. This is needed as the submission model will let userspace set
> most of the encoder's registers directly, so the kernel cannot check
> every memory access that a job makes the encoder do. With a single
> domain, one client could make the encoder read or write the memory of
> another client.

How do you plan to get the paging domain in the first place?

Using paging domains directly is very complicated, I'm not excite d to
see DRM trying to do this at all. IMHO there are many unanswered
questions how it could even do this safely.

It would be better to come with a user so we can try to understand
what you are even planning.

> Patch 6 adds Domain::with_fault_handler(), which allocates a domain
> with a FaultHandler installed. One handler can serve several domains.

You intend to use fault handler?? That's even more esoteric.

Jason
