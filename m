Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A728936B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349231; cv=none; b=GzCyQKdtdOKbRjUpCGAzpMbCsnhO32rGQCeCtJCZqsVrP0TfU9PZHp7JRMTbSdwvv7LoDoqSPfpm3UdzbFBRu9UjXnTj0W0d9d7jEKKNlQ5I74ig/eRcWDoYlWEjKfJv4cey6qgVL2ZK3r4qEYCT1tHeDCnZgcUsIYPivmEgrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349231; c=relaxed/simple;
	bh=oC2hiLR6kxwc1TU6xVigW4Srs1fTtT0IXKZJDJ8B1iU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FBHtWLsw50LQtsEk0ks1mr8UQgm1ztnLGkpLvidirgAmhmWiXaOi3YcOiA28RxZrFXRPQjmeAivkjf9FC6mo43S4BPeOWQvlNJRbWSCwW9fZmbSirB8Wq0hvKQqjJJEaA3p697EI8vwI1ButhaAsBWcc/bZFEExBhYnFlw1WSGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B18hBf2u; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B18hBf2u"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ae6d6b8eacbso64328966b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753349228; x=1753954028; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWsmFNqMTJifoq1H166MjVpnMG97Pu9rGEwqko2e+Qs=;
        b=B18hBf2ut+3HV5Vef0fuytkGPqHm+IIlkTtovyVhcs6KcrUB/sracrq+Za+C/iolWr
         3RvN2c9dtTIc1kIVu7TNtOocRhgZydIcrRoU3++C/thKsdQyVMrnVrqjY8JYkAeHwzh2
         aroEb7HQ97+hOcUwu0W3oFQtLlSjRSGjwQ9pPhPfobIbbVIg0/fwDpRqLHsCCTBP6WCN
         8jKUrm/CqHzc9zk8dzJti+0dub3441tr5jSAuXfr4dh1y0dPCPhh9rq2S5sjeihob4vn
         rTWEEbzx4bi64JvVo5uOFnTd5KpTtx8LhfEQ1q2SqA+yjBSB3qKDPSQEOU5RjsLjTO0/
         3HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349228; x=1753954028;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWsmFNqMTJifoq1H166MjVpnMG97Pu9rGEwqko2e+Qs=;
        b=KJ2r9EcZtkdXKJjc8Jc0PUSY9pJTd8sJVDtnFJXgAHHAG1I39ZWTVSXsG40SddybbI
         bTVZ2gMOBatsSvrPMHwkbgujktgBrEgTQdasOSg5Hl5r56mRN8L1+ll8vZJv3YoUdv64
         ynKBTATJwJL/7UhQLkZiSmWYeTgq+Pb4I3VzeChwvGOpVGTuIxSWqtCKljOR/rXzABbk
         lfxqU50bz0Gxyt/RgPMiacHL1+tRuBl8eG+QnDhypFzcbAj+qbL2nea3dofyhdcgahyb
         XNmlLal8DHsf9PxcR6XSNx6JYP+nu/rOjybLBDAM1Rs+YqwgFKPMWeEXhhkp5hdgc+cA
         sKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3DuM0u466sQViG0oLqEEiT+RvJkVSfRg8lm1MDoC2ne3Y0jDUvcuj/W88VA54Kuy2wlBKhYUrOg3GVD/nSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXhQBrUnQL/0KkSk6mRdG8clOrcDfyPSLvz4uvU5tyAtVVlKw
	vDOlFpqTa6JOYeJRi3grmUb9Rp7J8a2oZTUFPgG44BPcWNBauO9773aD2tEaev/BSnF2e5+Uafn
	cGZgwn+fJZlvoQdmGoQ==
X-Google-Smtp-Source: AGHT+IGtDDoKDFdpf55RlRT16x/MrXLiY+iPYPhinM0WVwWZbH0DR7wxKq7NKGyO2VWyDlAiEA0xZK8qvSrqdQk=
X-Received: from ejcvw7.prod.google.com ([2002:a17:907:a707:b0:adf:bef7:bcbf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:9fc6:b0:ae3:4f99:a5aa with SMTP id a640c23a62f3a-af2f64bcdf5mr605481366b.4.1753349227748;
 Thu, 24 Jul 2025 02:27:07 -0700 (PDT)
Date: Thu, 24 Jul 2025 09:27:06 +0000
In-Reply-To: <20250715135827.2230267-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250715135645.2230065-1-vitaly.wool@konsulko.se> <20250715135827.2230267-1-vitaly.wool@konsulko.se>
Message-ID: <aIH8as4gSAJ1dTl2@google.com>
Subject: Re: [PATCH v13 3/4] rust: add support for NUMA ids in allocations
From: Alice Ryhl <aliceryhl@google.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, rust-for-linux@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-bcachefs@vger.kernel.org, 
	bpf@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 15, 2025 at 03:58:27PM +0200, Vitaly Wool wrote:
> Add a new type to support specifying NUMA identifiers in Rust
> allocators and extend the allocators to have NUMA id as a
> parameter. Thus, modify ReallocFunc to use the new extended realloc
> primitives from the C side of the kernel (i. e.
> k[v]realloc_node_align/vrealloc_node_align) and add the new function
> alloc_node to the Allocator trait while keeping the existing one
> (alloc) for backward compatibility.
> 
> This will allow to specify node to use for allocation of e. g.
> {KV}Box, as well as for future NUMA aware users of the API.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>
