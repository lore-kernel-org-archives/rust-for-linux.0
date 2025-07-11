Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36DAA920
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752232331; cv=none; b=jLnRFGLJCQrVoFVydIiSUePGhpmA2+Zul+lykeg8KShrELkRrxev8pnLHvQxcEgLIVEkVtviGne46dwQeTo0+79hmL+DhaB13TQz7BepX/zubRTL/R1V1af+50l/kHCAwloIFz13mNSCFTrGqIgs1n4UMBRoRtaxS6QCkr6z2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752232331; c=relaxed/simple;
	bh=i1zamw8OxrbK1pmX8AUAnMJhV/OqLlLcVIZD8H6BljY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl9jtlBt3YdfDIUYmDvpLTrBqV3VwbyeDSWsDbJhgy/hJfrKOVOzGLcDPvTXcdffDe2oTRwpPVKYBXoSBFkqiZLiLl5jV6lq7ThC4RpHe8O+NAYOs/aALf5jnByLG6jjccPm5Qxt7isyoXuCo9ZaggnRlMkp+dgfREyJIV+UKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DLkvah+C; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DLkvah+C"
Date: Fri, 11 Jul 2025 07:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752232326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmvwVX29UC54z92FzAiIHfQJoLjVbikCZHEZdUt1Xvc=;
	b=DLkvah+Ci1VSJWI4/B4C7WOGb5TdMdc9dSeZ9dK00ZecpACf0ZdEUCsqcGwjBYJHYjIaoZ
	KEXe5G1id1Mo7NIyyIBpd/+vk1z25JzlHziVBL6phT9ji3SwNxXBtBcKCx6lnkPXEGAu3q
	2XwN2jD7fl3/bU8/nzOqQrS3+Gn1n+w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Uladzislau Rezki <urezki@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Vlastimil Babka <vbabka@suse.cz>, rust-for-linux@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	linux-bcachefs@vger.kernel.org, bpf@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v12 2/4] mm/slub: allow to set node and align in
 k[v]realloc
Message-ID: <2hiakuk5r3daujixvriejrc3nfqo4oiwmdygvyoxprsec3p6wv@k5i6nckj5tcu>
References: <20250709172345.1031907-1-vitaly.wool@konsulko.se>
 <20250709172441.1032006-1-vitaly.wool@konsulko.se>
 <aHDSLyHZ8b1ELeWe@hyeyoo>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHDSLyHZ8b1ELeWe@hyeyoo>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 11, 2025 at 05:58:23PM +0900, Harry Yoo wrote:
> On Wed, Jul 09, 2025 at 07:24:41PM +0200, Vitaly Wool wrote:
> > Reimplement k[v]realloc_node() to be able to set node and
> > alignment should a user need to do so. In order to do that while
> > retaining the maximal backward compatibility, add
> > k[v]realloc_node_align() functions and redefine the rest of API
> > using these new ones.
> > 
> > While doing that, we also keep the number of  _noprof variants to a
> > minimum, which implies some changes to the existing users of older
> > _noprof functions, that basically being bcachefs.
> > 
> > With that change we also provide the ability for the Rust part of
> > the kernel to set node and alignment in its K[v]xxx
> > [re]allocations.
> > 
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> > ---
> >  fs/bcachefs/darray.c   |  2 +-
> >  fs/bcachefs/util.h     |  2 +-
> >  include/linux/bpfptr.h |  2 +-
> >  include/linux/slab.h   | 38 +++++++++++++++----------
> >  lib/rhashtable.c       |  4 +--
> >  mm/slub.c              | 64 +++++++++++++++++++++++++++++-------------
> >  6 files changed, 72 insertions(+), 40 deletions(-)
>  
> > diff --git a/mm/slub.c b/mm/slub.c
> > index c4b64821e680..6fad4cdea6c4 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -4845,7 +4845,7 @@ void kfree(const void *object)
> >  EXPORT_SYMBOL(kfree);
> >  
> >  static __always_inline __realloc_size(2) void *
> > -__do_krealloc(const void *p, size_t new_size, gfp_t flags)
> > +__do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid)
> >  {
> >  	void *ret;
> >  	size_t ks = 0;
> > @@ -4859,6 +4859,20 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
> >  	if (!kasan_check_byte(p))
> >  		return NULL;
> >  
> > +	/* refuse to proceed if alignment is bigger than what kmalloc() provides */
> > +	if (!IS_ALIGNED((unsigned long)p, align) || new_size < align)
> > +		return NULL;
> 
> Hmm but what happens if `p` is aligned to `align`, but the new object is not?
> 
> For example, what will happen if we  allocate object with size=64, align=64
> and then do krealloc with size=96, align=64...
> 
> Or am I missing something?

You generally need size to be a multiple of align...
