Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353271C6FF5;
	Fri, 17 Apr 2026 04:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776400967; cv=none; b=jkFYRbFVu15n5VVMkP6n8KNqZD4pkQuHYFnHZqAsxBjfgdrHGktmofyImwtHP8fAslbxtaCaOrIxkfNoZGfDGzdqnSS4xBwtjmNks+DYCf9W3hM1t7OSlCcgEKlbihs20usqDISxWNQbuuFhoBPmmzAc0NURZsDFkV/ff/GU0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776400967; c=relaxed/simple;
	bh=+kZcyO2YZoRks810z1foc/yqdqsP8AdQc/GigncPdOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABTm1lZXY1u3y0h9bkHcFdw6dw7Pwa1DxQtsXMB6r7sLgxal4ay5xYuPAsjS6Z3ePcn/ImMrFOLUSI7RPkO4o3l/iCSuanEILvTAORxi/bruflCxo19EIKmwHWgFN6C47FXJCqRyCcNXfnn6yyM1SXeKof2P6+yJvgwewuL9ucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfGQ5i1V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfGQ5i1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAF1C19425;
	Fri, 17 Apr 2026 04:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776400966;
	bh=+kZcyO2YZoRks810z1foc/yqdqsP8AdQc/GigncPdOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfGQ5i1VLFUUh34+/+2ZJ/V44nhKo2xNclSoGPtwovtCwj1cG6ZQf3ti3r2EXSitX
	 7mJyT9d3TCfs9780go8IhtH920vp4qoBQX/crZM7RcTWAUfaaKUOFLC3mIRX3/KG/L
	 ACBjM+96sMBelsfvWCPPQ3/PUGHEc0GFrCIlNHk+Vrm0hczq+b6Hq6tKw1KVXkac/3
	 Vuk31u6o8Z35yuYIwebWWKYd45HalbXTjzQCVp2BGG4GZchpN7iBVY8ZAkEkVQ7WJn
	 Ghw9ik03Fu3oBmqTiQvABV5dKdd0zntiU0pdUPsA08r7MWtR3DivtjD29SkfohQNsX
	 3drwy+Ol8BqVA==
Date: Fri, 17 Apr 2026 13:42:44 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	stable@vger.kernel.org, Vitaly Wool <vitaly.wool@konsulko.se>,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] slub: fix data loss and overflow in krealloc()
Message-ID: <aeG6RG41sgZuerYa@hyeyoo>
References: <20260416132837.3787694-1-elver@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416132837.3787694-1-elver@google.com>

[+Cc relevant folks]

On Thu, Apr 16, 2026 at 03:25:07PM +0200, Marco Elver wrote:
> Commit 2cd8231796b5 ("mm/slub: allow to set node and align in
> k[v]realloc") introduced the ability to force a reallocation if the
> original object does not satisfy new alignment or NUMA node, even when
> the object is being shrunk.
> 
> This introduced two bugs in the reallocation fallback path:
> 
> 1. Data loss during NUMA migration: The jump to 'alloc_new' happens
>    before 'ks' and 'orig_size' are initialized. As a result, the
>    memcpy() in the 'alloc_new' block would copy 0 bytes into the new
>    allocation.

Ouch.

> 2. Buffer overflow during shrinking: When shrinking an object while
>    forcing a new alignment, 'new_size' is smaller than the old size.
>    However, the memcpy() used the old size ('orig_size ?: ks'), leading
>    to an out-of-bounds write.

Right. before the commit we didn't reallocate when the size is smaller.

> The same overflow bug exists in the kvrealloc() fallback path, where the
> old bucket size ksize(p) is copied into the new buffer without being
> bounded by the new size.
> 
> A simple reproducer:
> 
> 	// e.g. add to lkdtm as KREALLOC_SHRINK_OVERFLOW
> 	while (1) {
> 		void *p = kmalloc(128, GFP_KERNEL);
> 		p = krealloc_node_align(p, 64, 256, GFP_KERNEL, NUMA_NO_NODE);
> 		kfree(p);
> 	}
> 
> demonstrates the issue:
> 
>   ==================================================================
>   BUG: KFENCE: out-of-bounds write in memcpy_orig+0x68/0x130
> 
>   Out-of-bounds write at 0xffff8883ad757038 (120B right of kfence-#47):
>    memcpy_orig+0x68/0x130
>    krealloc_node_align_noprof+0x1c8/0x340
>    lkdtm_KREALLOC_SHRINK_OVERFLOW+0x8c/0xc0 [lkdtm]
>    lkdtm_do_action+0x3a/0x60 [lkdtm]
>    ...
> 
>   kfence-#47: 0xffff8883ad756fc0-0xffff8883ad756fff, size=64, cache=kmalloc-64
> 
>   allocated by task 316 on cpu 7 at 97.680481s (0.021813s ago):
>    krealloc_node_align_noprof+0x19c/0x340
>    lkdtm_KREALLOC_SHRINK_OVERFLOW+0x8c/0xc0 [lkdtm]
>    lkdtm_do_action+0x3a/0x60 [lkdtm]
>    ...
>   ==================================================================
> 
> Fix it by moving the old size calculation to the top of __do_krealloc()
> and bounding all copy lengths by the new allocation size.
> 
> Fixes: 2cd8231796b5 ("mm/slub: allow to set node and align in k[v]realloc")
> Cc: <stable@vger.kernel.org>
> Reported-by: https://sashiko.dev/#/patchset/20260415143735.2974230-1-elver%40google.com
> Signed-off-by: Marco Elver <elver@google.com>
> ---

Looks good to me, but I think we still have a similar issue in
vrealloc_node_align_noprof()? (goto need_realloc; due to NUMA mismatch
but the new size is smaller)

-- 
Cheers,
Harry / Hyeonggon
