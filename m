Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F0236BCF7;
	Tue, 17 Feb 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336476; cv=none; b=HdxJjRv5CivgpCH79qDWH/KGH3YSGbDtd/ljfZH2NzkzOyNux72RSCiw9LwuxHyb/KKfM7E3QOthKlys3xWdeE8NckhFotYjk8KouA5QtBZ3vgLBqloa3KjWwmRJNQma4jiOC0TS0n0MMawULanZJjnh4XMcUTooUnL8vJXMeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336476; c=relaxed/simple;
	bh=99T2HooY6pHq1rrH01nYWNcwZJswC2L6NO6HuF4Ryf8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tcV81rsiJg36sFzJWxPWRv4+OpYf9uEriJTGTvLlJSYB00CAEctXDUXJlXzrBVf6j3djOx+cUfdP9+mBynGVhC30+/LxMyEyITPqXsSksl6c7xTWiWQ0PbnH3XfiM6HMDgXPo9EG6flLJ7JSZ69/iBOyDfEigWUzJlrCqiK4tPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqzRAMb0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqzRAMb0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F8DC4CEF7;
	Tue, 17 Feb 2026 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771336476;
	bh=99T2HooY6pHq1rrH01nYWNcwZJswC2L6NO6HuF4Ryf8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uqzRAMb0BCJaq8960HcWza0oi2vVJBkyDMIUkKR0iuckj0mSutDZyRt10QQP8QTE8
	 q822EpYMoJXD5F1hl9OKJb3qCA850FkbAgiTX8tkXuIdbH/NGHn8HZot7aXF6SmeaB
	 wHQ2P0FhUo3Eh/MANiYYI1Oblw8XOaUOJWIAfDzqXv6Q32soh1Uwx/Efg0alJHvV6N
	 9Mk+cz/gVFaY9/NHIhHZO79R3XmVmxwtB1RaLhkUy0IKyXyAjX6ocV+3es+/tCU7if
	 FESBLLhCi7o+oA6OvxwgOLSGq3sELl6n/g9DbNgfZ6xUVUs+Ijw/+vSOEqND4QMGRF
	 a2CHJesmz5ZgA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 14:54:30 +0100
Message-Id: <DGHADGXGWS45.1A6EHNMKM4SRH@kernel.org>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>,
 "Greg KH" <gregkh@linuxfoundation.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, <linux-mm@kvack.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Peter Zijlstra" <peterz@infradead.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
 <20260217130024.GP1395416@noisy.programming.kicks-ass.net>
In-Reply-To: <20260217130024.GP1395416@noisy.programming.kicks-ass.net>

On Tue Feb 17, 2026 at 2:00 PM CET, Peter Zijlstra wrote:
> Anyway, I don't think something like the below is an unreasonable patch.
>
> It ensures all accesses to the ptr obtained from kmap_local_*() and
> released by kunmap_local() stays inside those two.

I'd argue that not ensuring this is a feature, as I don't see why we would =
want
to ensure this if !CONFIG_HIGHMEM.

I think this is not about not escaping a critical scope, but about ensuring=
 to
read exactly once.

> ---
> diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-int=
ernal.h
> index 0574c21ca45d..2fe71b715a46 100644
> --- a/include/linux/highmem-internal.h
> +++ b/include/linux/highmem-internal.h
> @@ -185,31 +185,42 @@ static inline void kunmap(const struct page *page)
> =20
>  static inline void *kmap_local_page(const struct page *page)
>  {
> -	return page_address(page);
> +	void *addr =3D page_address(page);
> +	barrier();
> +	return addr;
>  }
> =20
>  static inline void *kmap_local_page_try_from_panic(const struct page *pa=
ge)
>  {
> -	return page_address(page);
> +	void *addr =3D page_address(page);
> +	barrier();
> +	return addr;
>  }
> =20
>  static inline void *kmap_local_folio(const struct folio *folio, size_t o=
ffset)
>  {
> -	return folio_address(folio) + offset;
> +	void *addr =3D folio_address(folio) + offset;
> +	barrier();
> +	return addr;
>  }
> =20
>  static inline void *kmap_local_page_prot(const struct page *page, pgprot=
_t prot)
>  {
> -	return kmap_local_page(page);
> +	void *addr =3D kmap_local_page(page);
> +	barrier();
> +	return addr;
>  }
> =20
>  static inline void *kmap_local_pfn(unsigned long pfn)
>  {
> -	return kmap_local_page(pfn_to_page(pfn));
> +	void *addr =3D kmap_local_page(pfn_to_page(pfn));
> +	barrier();
> +	return addr;
>  }
> =20
>  static inline void __kunmap_local(const void *addr)
>  {
> +	barrier();
>  #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
>  	kunmap_flush_on_unmap(PTR_ALIGN_DOWN(addr, PAGE_SIZE));
>  #endif

