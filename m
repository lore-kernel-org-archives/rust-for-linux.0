Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5614B949
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721721018; cv=none; b=lEJCEw8neNJzwgskWUqoimrhC0fZQIakGdJXuj6ASE2r3/738yPiFodXsKgrx6powo0h9KDiIkVl8liAmivU4k0bcVxoede2RBBLmH0ZZEFUOOvQJlQOLrjPnUy2r9hBclf9ASA4jKMGIwGtyuOXnEGxWxjTs4Ifqj9J8W6uINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721721018; c=relaxed/simple;
	bh=aba1Lc4JrTPRKQU7uiIA6GUv1lNoMjp/vUTkLtk3sUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNXM7pu2KNK3wyhNeAB6vrVZ0CLrM6XZfHPujJFo+ubcXZZGiXx3ju+f1ID9ffQkqtZUlc9yfh2+7F6V5/TYr2Dpr4imr4qY4zPphsHcGIUHslJmx/Ad/kb/shAiMD0UeVCNnOkivi5OTpz/IJaO1Zte/3tCdf6uZUBNrDkQlg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eXbpiEoo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eXbpiEoo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso37027615e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721721015; x=1722325815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHbbiSpbwBUG2vvtlGIUjQprGr8z88fyXfa4wfrh8N0=;
        b=eXbpiEoodIZmm2jeuD9+jMvv4DBQDo6HNOExcGS+d1KcZGjkP3DWwBVWlZWWyQwaNY
         KJitRVMkC0fkRcj0TEBQVqTb2gRcyM14vWlrZ3ujWj/9oIkvV5pVq3udkxzE5E6pyZlu
         FDcvHeWN9hEmJgsp0wtmhGqAcUvwExuDNiZosDdqcMqrn1VNeo5oSqaGpseYCnmHEHpJ
         ZSLGK9UwajNrIVkVzZ7QAbgWhhqWrNNXABnoYwbrIVgR0ucIRQauK6m66VQhT4GlixOE
         K2mxWKMd4McKVIoTuMmMejn048bpOo64Bt7/mSt24QQqhM9HcUXGFHVvxzoq+XlgJ8br
         LOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721721015; x=1722325815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHbbiSpbwBUG2vvtlGIUjQprGr8z88fyXfa4wfrh8N0=;
        b=ElwcjA6fmrCtieFZNjX16ObD0dr7ufwsrr3yrhJkiUksuxWe+qaCPIxuoS+VtUv83o
         HEglIRIlOPoGnr7lbLl0G7o5lNVFhjhfq1wFOOBsWgLsGhz28rMSkY/PkyAkAK2p+wo7
         /9FnzSm+vZHn+vm12sV3+UwojPnEKcC8qGGkGk2rigiMwBzLUoLCL1jl9cxrHOEUfmIW
         PeGZU+lMsdVPn6AesmTcwJ/RyhHLG8Kkj3UeyXlWwcttqHtr0mgQPLpksGsHBRl8W7VA
         LI+TpRafv5vSaX4Ut+DvJPx82pdFADr4oON5euUzKq3Rbm+lY9jHIhTnX3qlg5CbZDSX
         7Gog==
X-Forwarded-Encrypted: i=1; AJvYcCVFcfGfDcTeTWUhcFJ6wsGDXOO5iSeUDtZjGtvCgmXHjCqBoOp8xWRqxnwDqEX348UJayJvdHOthaAmmf1PvgnsU3dmMnUMHqjOQaFD+Yk=
X-Gm-Message-State: AOJu0Yxcdz8kCcilxnMyMLLuh78GO9519ajYgAAwV8JOwVqgKQIsDp0w
	8/N3e+OtarPp5RC2plR8AmRs0zRTDwmvTEiH/lyAOeYj7Y/bS01bCwF3noUO/ao=
X-Google-Smtp-Source: AGHT+IFEa0dYyhrMKUpXQUIthirOp4aQ1GbTQq/jTNpcnXJtqU5/ALKEJJJtG0qMv9pXImiM03usdA==
X-Received: by 2002:a05:600c:3ba4:b0:426:5dd0:a1ee with SMTP id 5b1f17b1804b1-427ecfce9c9mr14968095e9.2.1721721014618;
        Tue, 23 Jul 2024 00:50:14 -0700 (PDT)
Received: from localhost (109-81-94-157.rct.o2.cz. [109.81.94.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a9466bsm187338875e9.41.2024.07.23.00.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 00:50:14 -0700 (PDT)
Date: Tue, 23 Jul 2024 09:50:13 +0200
From: Michal Hocko <mhocko@suse.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: cl@linux.com, penberg@kernel.org, rientjes@google.com,
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
	roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, urezki@gmail.com,
	hch@infradead.org, kees@kernel.org, ojeda@kernel.org,
	wedsonaf@gmail.com, mpe@ellerman.id.au, chandan.babu@oracle.com,
	christian.koenig@amd.com, maz@kernel.org, oliver.upton@linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: kvmalloc: align kvrealloc() with krealloc()
Message-ID: <Zp9gtelmvzN5tfpS@tiehlicka>
References: <20240722163111.4766-1-dakr@kernel.org>
 <20240722163111.4766-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722163111.4766-3-dakr@kernel.org>

On Mon 22-07-24 18:29:24, Danilo Krummrich wrote:
> Besides the obvious (and desired) difference between krealloc() and
> kvrealloc(), there is some inconsistency in their function signatures
> and behavior:
> 
>  - krealloc() frees the memory when the requested size is zero, whereas
>    kvrealloc() simply returns a pointer to the existing allocation.
> 
>  - krealloc() behaves like kmalloc() if a NULL pointer is passed, whereas
>    kvrealloc() does not accept a NULL pointer at all and, if passed,
>    would fault instead.
> 
>  - krealloc() is self-contained, whereas kvrealloc() relies on the caller
>    to provide the size of the previous allocation.
> 
> Inconsistent behavior throughout allocation APIs is error prone, hence make
> kvrealloc() behave like krealloc(), which seems superior in all mentioned
> aspects.

I completely agree with this. Fortunately the number of existing callers
is small and none of them really seem to depend on the current behavior
in that aspect.
 
> Besides that, implementing kvrealloc() by making use of krealloc() and
> vrealloc() provides oppertunities to grow (and shrink) allocations more
> efficiently. For instance, vrealloc() can be optimized to allocate and
> map additional pages to grow the allocation or unmap and free unused
> pages to shrink the allocation.

This seems like a change that is independent on the above and should be
a patch on its own.

[...]

> diff --git a/mm/util.c b/mm/util.c
> index bc488f0121a7..0ff5898cc6de 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -608,6 +608,28 @@ unsigned long vm_mmap(struct file *file, unsigned long addr,
>  }
>  EXPORT_SYMBOL(vm_mmap);
>  
> +static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)

This seems like a generally useful helper which it is not. I would call
it something like __kvmalloc_gfp_adjust or something similar so that it is
clear that this is just a helper to adjust gfp flag for slab allocator
path

[...]
> -void *kvrealloc_noprof(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
> +/**
> + * kvrealloc - reallocate memory; contents remain unchanged
> + * @p: object to reallocate memory for
> + * @size: the size to reallocate
> + * @flags: the flags for the page level allocator
> + *
> + * The contents of the object pointed to are preserved up to the lesser of the
> + * new and old size (__GFP_ZERO flag is effectively ignored).
> + *
> + * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
> + * and @p is not a %NULL pointer, the object pointed to is freed.
> + *
> + * Return: pointer to the allocated memory or %NULL in case of error
> + */
> +void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  {
> -	void *newp;
> +	void *n;
> +

	if (!size && p) {
		kvfree(p);
		return NULL;
	}

would make this code flow slightly easier to read because the freeing
path would be shared for all compbinations IMO.

> +	if (is_vmalloc_addr(p))
> +		return vrealloc_noprof(p, size, flags);
> +
> +	n = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
> +	if (!n) {
> +		/* We failed to krealloc(), fall back to kvmalloc(). */
> +		n = kvmalloc_noprof(size, flags);

Why don't you simply use vrealloc_noprof here?

> +		if (!n)
> +			return NULL;
> +
> +		if (p) {
> +			/* We already know that `p` is not a vmalloc address. */
> +			memcpy(n, p, ksize(p));
> +			kfree(p);
> +		}
> +	}
>  
> -	if (oldsize >= newsize)
> -		return (void *)p;
> -	newp = kvmalloc_noprof(newsize, flags);
> -	if (!newp)
> -		return NULL;
> -	memcpy(newp, p, oldsize);
> -	kvfree(p);
> -	return newp;
> +	return n;
>  }
>  EXPORT_SYMBOL(kvrealloc_noprof);
>  
> -- 
> 2.45.2

-- 
Michal Hocko
SUSE Labs
