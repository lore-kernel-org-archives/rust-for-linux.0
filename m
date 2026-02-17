Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38103587B3;
	Tue, 17 Feb 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333242; cv=none; b=ZMuxwXT/M+QaP/q/fvowRyfHpDntWdEyJ5bkM6hIwT7l4BlruucPWTGWDkpBtgMX5N8AErEB06evZG9cWVcdiZd3qmR3590CTFgCoM+snmD1EgUUXYgEpOxol+1D1yCmbKOuWNr55+BS8kVIrJrwTfZLTY//pkGlZ1iEpol9234=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333242; c=relaxed/simple;
	bh=IAUkPVT3oAQRNLgr8QkqsWYP9mCAD6S5FhX4uRFv0lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk0X2B3j9/CkNALs4RGj7y5NMDDgjOy5manRGoCk0HqhJnfR2rDi61eaAuL3fItiTvmDHr+sPuqv4zfxFQO5qnXLGn19NvOAfXc/AhMujIX6b4QiAKeRmC8PtcTcQMegifee6CwrKXSKiHkTxhbAWtw/LAribBlrby/lrVCAvw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L7yoJjBa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L7yoJjBa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N4hQ/54nXt77VYVXs4XfMX29eXF0oqY1wB0KVxPzS48=; b=L7yoJjBaA7IKrtmrvdGGkXYCXo
	DImo47qGhyqKHzrHBQdVk1afo5uhPHTX7OPHlh+LYKKk0P9H9voCxZKMEb88rf4CWKZipQm5ccMgQ
	kZq/6OQFYpCePnCJXUII1r/lkweniuOTUosb7Kog5O2sIKhnOXBokB+WQjt9yAN2elbjejvzHc4eu
	sMMxz7ZP5jITLkm920X6I0mkQmJ9S1wwgeqEGbtZ9mkKauQ1+9Ji4/lZeZG0CCZWMdrgOom7u0rcp
	HfMfwwP1+W+Pmm6PC6y3V9YVTpU3dUjdzW6+t5whYoctkcb30aqC7C40RxwjRIYlwWET2xVQrJsx3
	3Jgy4Osg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgp-00000004RlM-0ElZ;
	Tue, 17 Feb 2026 13:00:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9AB3F30315A; Tue, 17 Feb 2026 14:00:24 +0100 (CET)
Date: Tue, 17 Feb 2026 14:00:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260217130024.GP1395416@noisy.programming.kicks-ass.net>
References: <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
 <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>

On Tue, Feb 17, 2026 at 01:09:20PM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 11:51:20AM +0000, Alice Ryhl wrote:
> 
> > In my experience with dealing with `struct page` that is mapped into a
> > vma, you need memcpy because the struct might be split across two
> > different pages in the vma. The pages are adjacent in userspace's
> > address space, but not necessarily adjacent from the kernel's POV.
> > 
> > So you might end up with something that looks like this:
> > 
> > struct foo val;
> > void *ptr1 = kmap_local_page(p1);
> > void *ptr2 = kmap_local_page(p2);
> > memcpy(ptr1 + offset, val, PAGE_SIZE - offset);
> > memcpy(ptr2, val + offset, sizeof(struct foo) - (PAGE_SIZE - offset));
> > kunmap_local(ptr2);
> > kunmap_local(ptr1);
> 
>   barrier();
> 
> > if (is_valid(&val)) {
> >     // use val
> > }
> > 
> > This exact thing happens in Binder. It has to be a memcpy.
> 
> Sure, but then stick that one barrier() in and you're good.

Anyway, I don't think something like the below is an unreasonable patch.

It ensures all accesses to the ptr obtained from kmap_local_*() and
released by kunmap_local() stays inside those two.

---
diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index 0574c21ca45d..2fe71b715a46 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -185,31 +185,42 @@ static inline void kunmap(const struct page *page)
 
 static inline void *kmap_local_page(const struct page *page)
 {
-	return page_address(page);
+	void *addr = page_address(page);
+	barrier();
+	return addr;
 }
 
 static inline void *kmap_local_page_try_from_panic(const struct page *page)
 {
-	return page_address(page);
+	void *addr = page_address(page);
+	barrier();
+	return addr;
 }
 
 static inline void *kmap_local_folio(const struct folio *folio, size_t offset)
 {
-	return folio_address(folio) + offset;
+	void *addr = folio_address(folio) + offset;
+	barrier();
+	return addr;
 }
 
 static inline void *kmap_local_page_prot(const struct page *page, pgprot_t prot)
 {
-	return kmap_local_page(page);
+	void *addr = kmap_local_page(page);
+	barrier();
+	return addr;
 }
 
 static inline void *kmap_local_pfn(unsigned long pfn)
 {
-	return kmap_local_page(pfn_to_page(pfn));
+	void *addr = kmap_local_page(pfn_to_page(pfn));
+	barrier();
+	return addr;
 }
 
 static inline void __kunmap_local(const void *addr)
 {
+	barrier();
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(PTR_ALIGN_DOWN(addr, PAGE_SIZE));
 #endif
