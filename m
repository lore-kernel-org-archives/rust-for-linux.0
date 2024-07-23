Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE81509AB
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721736748; cv=none; b=UG2BoGHrLHRX/A2m45gOE8EDM7bdRnpJfK4qNB8cnpcWsHUyFck0G0z+H3uJi8u8EWYiTKp7nrBR3Nq8+GB/2Ho0hfStHgRe/d6PFa7N9i3DptCB9UI/lAaWsfFk2MQ7BcUyldZ/CnLT53rm/wpVt+fBF8qi+SUketRuN+uwfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721736748; c=relaxed/simple;
	bh=BD1XXGgnbr3f9UFnzGCTBfhn/UvJ6FzvvTJs2g2JtY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogJTGPbR236EfGfXY3pl7Z9Uj0ZPbA+NE4QByRsxPfN4Qr97Lk9REaELpdD5X6iwkRTNLyjDVIrxDK3fAydLWk5ga/6F2wwIWnTpHwmmda382J8sHtW5vFyMPgbR1WFVIBw4Ukn+Aecslgv012daoIKjalKKNuBRcLILQ3Lq/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FeIPXjD2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FeIPXjD2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so549943966b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721736745; x=1722341545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5TBBYvkaFdlMlxn3O2wAlHCINLNphPO6tKhTgLcung=;
        b=FeIPXjD2TLc6FnZFa66GpwVS8Uo+2sc3A6RrbFetXALA8IcROo9J4HGLlsljvHrEW+
         qMNyZGuAMaQ/h9Rl+ufesLJ7LotmJ91Fu54Rr4/II86/rkP6KoVITgLPc8uMhw6kBK93
         4Q+aPhNdr6fKuQJDsD4qxLl9tQv/tTenWUwc0cHfILxreBN3FujtHfFknzpKzmwFW24K
         +uxWiOgeIMeI19E/SySDPWLUc0/JeTUIeUFH+8MnNW8KKMYe/QfmQG6jkhSun0CPsb6Z
         bPpI/l77iLRh3COVr6m4iXcrXT6zylsdy+zhmy5stGEODmZQHVFF30nAf67t7yWyI1cx
         xsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721736745; x=1722341545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5TBBYvkaFdlMlxn3O2wAlHCINLNphPO6tKhTgLcung=;
        b=O0nksFRZ38+ahLQPS5BfvkWzf1i8OLkQgxzmfZYq+M2eJbp9yh9yaSr7y12E7nWs4O
         vi5U6Y1njHEKKaLKuKaHT3UcsHnUJLEj5kmkQpimMYZIDNg3QPgSCJfpFBAAeCWpi5um
         Q1VduckTz1AQavfvSV1vtYRf80eLo8z4klg6aP7X5vRrXAPypZ8yfaNcQZpnO83p8oU4
         guPf5EzkUx4iNm4fglKUI9/NJJSsMvrSqP6615UbCb7I4LdzQUeghGepORSfk+44NOW4
         WDSTGnhZI+Mervx/eXrFnAA+TjE0MvXX3m9GybwsTanIVRaY6tjRPe2S/2Q2e80L3XGp
         hByA==
X-Forwarded-Encrypted: i=1; AJvYcCVWPttgdlFtYXTRZjBvcDWwTi74LgkPw2Mdcu3v6fs0U5f23Db4Ruhs4k8OQNjR7RJwhJfvzKmdQupfXULd/0YQ0TxUKXkhn8yvnCEJ728=
X-Gm-Message-State: AOJu0YyH+iQN/5qejyBZCcC7lmOKwdQxbHWaGMrEgLiuefMxm667zHqx
	fZcAyiJO8+cSSPyGdu274IZUXdr8zjy1IOPTPprzy66/UAKW0TqQmBTCWc2eX9Y=
X-Google-Smtp-Source: AGHT+IHKUI+ybyEF8IA4etomsFPdqHkKhA1yjCsCtCHNHdtBaOTVOe+K/W/574pOPrGEAdtQTfOWpw==
X-Received: by 2002:a17:907:60cb:b0:a7a:8c55:6b2 with SMTP id a640c23a62f3a-a7a8c550709mr197491766b.14.1721736745045;
        Tue, 23 Jul 2024 05:12:25 -0700 (PDT)
Received: from localhost (109-81-94-157.rct.o2.cz. [109.81.94.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a9e29153dsm49768766b.7.2024.07.23.05.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 05:12:24 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:12:23 +0200
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
Message-ID: <Zp-eJ6QTsT0wrlS-@tiehlicka>
References: <20240722163111.4766-1-dakr@kernel.org>
 <20240722163111.4766-3-dakr@kernel.org>
 <Zp9gtelmvzN5tfpS@tiehlicka>
 <Zp-JCWCPbDLkzRVw@pollux>
 <Zp-MMcf1xUgqtFGS@tiehlicka>
 <Zp-aRJAIVI9B2pKb@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp-aRJAIVI9B2pKb@pollux>

On Tue 23-07-24 13:55:48, Danilo Krummrich wrote:
> On Tue, Jul 23, 2024 at 12:55:45PM +0200, Michal Hocko wrote:
> > On Tue 23-07-24 12:42:17, Danilo Krummrich wrote:
> > > On Tue, Jul 23, 2024 at 09:50:13AM +0200, Michal Hocko wrote:
> > > > On Mon 22-07-24 18:29:24, Danilo Krummrich wrote:
> > [...]
> > > > > Besides that, implementing kvrealloc() by making use of krealloc() and
> > > > > vrealloc() provides oppertunities to grow (and shrink) allocations more
> > > > > efficiently. For instance, vrealloc() can be optimized to allocate and
> > > > > map additional pages to grow the allocation or unmap and free unused
> > > > > pages to shrink the allocation.
> > > > 
> > > > This seems like a change that is independent on the above and should be
> > > > a patch on its own.
> > > 
> > > The optimizations you mean? Yes, I intend to do this in a separate series. For
> > > now, I put TODOs in vrealloc.
> > 
> > No I mean, that the change of the signature and semantic should be done along with
> > update to callers and the new implementation of the function itself
> > should be done in its own patch.
> 
> Sorry, it seems like you lost me a bit.
> 
> There is one patch that implements vrealloc() and one patch that does the change
> of krealloc()'s signature, semantics and the corresponding update to the
> callers.
> 
> Isn't that already what you ask for?

No, because this second patch reimplements kvrealloc wo to use krealloc
and vrealloc fallback. More clear now?
 
> > [...]
> > > > > +void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
> > > > >  {
> > > > > -	void *newp;
> > > > > +	void *n;
> > > > > +
> > > > 
> > > > 	if (!size && p) {
> > > > 		kvfree(p);
> > > > 		return NULL;
> > > > 	}
> > > > 
> > > > would make this code flow slightly easier to read because the freeing
> > > > path would be shared for all compbinations IMO.
> > > 
> > > Personally, I like it without. For me the simplicity comes from directing things
> > > to either krealloc() or vrealloc(). But I'd be open to change it however.
> > 
> > I would really prefer to have it there because it makes the follow up
> > code easier.
> 
> I don't think it does (see below).
> 
> Either way, I got notified that Andrew applied the patches to mm-unstable. How
> to proceed from there for further changes, if any?

Andrew will either apply follow up fixes are replace the series by a new
version.

> > 
> > > > > +	if (is_vmalloc_addr(p))
> > > > > +		return vrealloc_noprof(p, size, flags);
> > > > > +
> > > > > +	n = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
> > > > > +	if (!n) {
> > > > > +		/* We failed to krealloc(), fall back to kvmalloc(). */
> > > > > +		n = kvmalloc_noprof(size, flags);
> > > > 
> > > > Why don't you simply use vrealloc_noprof here?
> > > 
> > > We could do that, but we'd also need to do the same checks kvmalloc() does, i.e.
> > > 
> > > 	/*
> > > 	 * It doesn't really make sense to fallback to vmalloc for sub page
> > > 	 * requests
> > > 	 */
> > > 	if (ret || size <= PAGE_SIZE)
> > > 		return ret;
> > 
> > With the early !size && p check we wouldn't right?
> 
> I think that's unrelated. Your proposed early check checks for size == 0 to free
> and return early. Whereas this check bails out if we fail kmalloc() with
> size <= PAGE_SIZE, because a subsequent vmalloc() wouldn't make a lot of sense.

It seems we are not on the same page here. Here is what I would like
kvrealloc to look like in the end:

void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
{
        void *newp;

        if (!size && p) {
                kvfree(p);
                return NULL;
        }

        if (!is_vmalloc_addr(p))
                newp = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));

        if (newp)
                return newp;

        return vrealloc_noprof(p, size, flags);
}
EXPORT_SYMBOL(kvrealloc_noprof);

krealloc_noprof should be extended for the maximum allowed size and so
does vrealloc_noprof. The implementation of the kvrealloc cannot get any
easier and more straightforward AFAICS. See my point?
-- 
Michal Hocko
SUSE Labs
