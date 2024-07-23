Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0114E2E3
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721732150; cv=none; b=r2OiWO2MOlOue02C+UkI5a28UhfMUhhraK4pGkFDjOkQwEYDSJSrQCGgQa7P6116U7KIZjGX6V540vjBtUX/hTriaSaClVEzIqfemvWW1ppDTJTfjn3BULRquIEfZVa28/UAv1BbRNL+YNBAf8hP5oKpQEVGWjWRzIH3i94c43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721732150; c=relaxed/simple;
	bh=qbgHZWjhOWkvRT4sxDgzHnN4j1pNIGBs0utjpq/oJ6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWSKF85gkG8n9X2i9sSx161EbghJQWHGxD2z4kJk2iFE4YBwmzu+jXCdd8UYlAZU3+JfdVqsg5q3WfKN38XnLeKDtUAETcrVZ23DyCUBO2w+Q754Irf2n7OiRe4a03upJMEMEBSOH5u7f+cSe/gfcqzQ6LO/Ljbm3xVKICfKXr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YYcLCW0C; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YYcLCW0C"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf858so3813736a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721732147; x=1722336947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pe9A/KmjRfnSqmJTo8amFeX5jdsHC7+ce4ctbtBqkTM=;
        b=YYcLCW0C9TsDdVwHEkqsEyhTY1ZEpHncwHp5OzuN8Lw/suMIegv8BcuSE1WIbU8EXM
         4V9E+kf0Fzcnhk79xT95Ss8juRZ+pNHamE6coU39w1a6yDqAdr2jgjkgqNsLoC+FmH/j
         +H+e0rnFzZfRc7TR/V9rhFENsM7ICYnk+N3LCgwXx9f9KP9zsuifhF28kf9g/0twB3Hu
         BwGDOY4EMPLDipJimy1WzkF7ospuKvgwiCKB+hQpUyl4F2KP4oEwPefMtfaG7An0o1bD
         VNaLGtwfzPmv/92v8X65Q3777KsY0vcLwF3pwI8DCm+1Bj68Dq2LVQD8WgqqXDMH5Vrg
         4f1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721732147; x=1722336947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe9A/KmjRfnSqmJTo8amFeX5jdsHC7+ce4ctbtBqkTM=;
        b=U9v/WyesaOKjDheQfwkf3rpsNsmEQe5O+VMT2fJxINLtbrgFj9iqN5MRjFK0MKQeRD
         NRMCH+CDMWBKO38qWn/kZdiMLVvtEeIJmO7wG4C/0PaH/nBEmHV3o+GPoLK6VkAzFSg4
         n4InplfQ20nxpz3+Ha6DjGVSnkHSOejII2bBzrgW+mMxdOT/mn2627nsy1uXsJTKsPhA
         sThTxfthGj8/Qe8SsVx1QF8YmNFvAlKmhvZWbBY2pEO2P0C42EMij+Cbgv2VW7jcmzb4
         38fTlcAgjdMMpZ3dvb7Jmu0ZW5eXJ2ukBFFmdV5fnMIWFW1swbiwLnDJiSym0cjb8Jbz
         3qjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs2vo6ivJwkCwpES/BX2O91yi4j2TG6tpCXXaJW2rcWL0emJPijarhQYCg/hbQhp3j6ZE9+sABQ72qBnZ6Nl1CoGW0Yk0+onswfK+QK58=
X-Gm-Message-State: AOJu0YyCcYfLcCIiYnvWyPxCJ93P0eOtneELih1EZh2c7VXl0ZTBfqwf
	hH07JDtxYGIAq+pxaB86F+Er/lqRROwjZqj7LWtl+rOOekK0+ysvd65DBU0j0BM=
X-Google-Smtp-Source: AGHT+IFnu1CtSD7NI8cX8oy1/s1fO3b09mRCXmn4chmnOxeVXYHzEOoS0aY4v6bJfNvEOu6l0cBSsg==
X-Received: by 2002:a50:c316:0:b0:5a2:d411:89fa with SMTP id 4fb4d7f45d1cf-5a47b3ce4c4mr5373936a12.36.1721732146651;
        Tue, 23 Jul 2024 03:55:46 -0700 (PDT)
Received: from localhost (109-81-94-157.rct.o2.cz. [109.81.94.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c9beccesm7307633a12.96.2024.07.23.03.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 03:55:46 -0700 (PDT)
Date: Tue, 23 Jul 2024 12:55:45 +0200
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
Message-ID: <Zp-MMcf1xUgqtFGS@tiehlicka>
References: <20240722163111.4766-1-dakr@kernel.org>
 <20240722163111.4766-3-dakr@kernel.org>
 <Zp9gtelmvzN5tfpS@tiehlicka>
 <Zp-JCWCPbDLkzRVw@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp-JCWCPbDLkzRVw@pollux>

On Tue 23-07-24 12:42:17, Danilo Krummrich wrote:
> On Tue, Jul 23, 2024 at 09:50:13AM +0200, Michal Hocko wrote:
> > On Mon 22-07-24 18:29:24, Danilo Krummrich wrote:
[...]
> > > Besides that, implementing kvrealloc() by making use of krealloc() and
> > > vrealloc() provides oppertunities to grow (and shrink) allocations more
> > > efficiently. For instance, vrealloc() can be optimized to allocate and
> > > map additional pages to grow the allocation or unmap and free unused
> > > pages to shrink the allocation.
> > 
> > This seems like a change that is independent on the above and should be
> > a patch on its own.
> 
> The optimizations you mean? Yes, I intend to do this in a separate series. For
> now, I put TODOs in vrealloc.

No I mean, that the change of the signature and semantic should be done along with
update to callers and the new implementation of the function itself
should be done in its own patch.

[...]
> > > +void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
> > >  {
> > > -	void *newp;
> > > +	void *n;
> > > +
> > 
> > 	if (!size && p) {
> > 		kvfree(p);
> > 		return NULL;
> > 	}
> > 
> > would make this code flow slightly easier to read because the freeing
> > path would be shared for all compbinations IMO.
> 
> Personally, I like it without. For me the simplicity comes from directing things
> to either krealloc() or vrealloc(). But I'd be open to change it however.

I would really prefer to have it there because it makes the follow up
code easier.

> > > +	if (is_vmalloc_addr(p))
> > > +		return vrealloc_noprof(p, size, flags);
> > > +
> > > +	n = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
> > > +	if (!n) {
> > > +		/* We failed to krealloc(), fall back to kvmalloc(). */
> > > +		n = kvmalloc_noprof(size, flags);
> > 
> > Why don't you simply use vrealloc_noprof here?
> 
> We could do that, but we'd also need to do the same checks kvmalloc() does, i.e.
> 
> 	/*
> 	 * It doesn't really make sense to fallback to vmalloc for sub page
> 	 * requests
> 	 */
> 	if (ret || size <= PAGE_SIZE)
> 		return ret;

With the early !size && p check we wouldn't right?

> 
> 	/* non-sleeping allocations are not supported by vmalloc */
> 	if (!gfpflags_allow_blocking(flags))
> 		return NULL;
> 
> 	/* Don't even allow crazy sizes */
> 	if (unlikely(size > INT_MAX)) {
> 		WARN_ON_ONCE(!(flags & __GFP_NOWARN));
> 		return NULL;
> 	}

I do not see why kvrealloc should have different set of constrains than
vrealloc in this regards.

> Does the kmalloc() retry through kvmalloc() hurt us enough to do that? This
> should only ever happen when we switch from a kmalloc buffer to a vmalloc
> buffer, which we only do once, we never switch back.

This is effectively open coding part of vrealloc without any good
reason. Please get rid of that.

-- 
Michal Hocko
SUSE Labs
