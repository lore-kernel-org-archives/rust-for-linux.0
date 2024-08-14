Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C71B9B5D
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652893; cv=none; b=EhIQr36hmJbcAGAmPEC5V21I/2mjwLPEh54IRg6FuaLAMnpXQbZhPIWz18didx5AaBOwIFojQpUJHNb0hq+ipgTP0IUzxOCygZjDQ9EzmXj8I3wGprQG9+D50Fep7lolV/zLi97sq2lU+xfeDd/iaZHNc2SNnde52ks2nIfN3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652893; c=relaxed/simple;
	bh=BCF631W1Ro9Qz7XCjmHPFII2HSDE5iVITaN4S0vTNpc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYInbWTATUed3ZqaAAvTlP6Pc/AYP934GTL3ob4UmpAAVX5QQsGo2CHIFRBtAEfGbDRiSW5/x32FJyzNYcp9eXU+hFhP9tm7N7riQsoLLRWMl9pBbHKTdMoJiK5zuXVO5c2xE50+UsFMI9WWgE5VYih07WHL1p1eaaMVeuvFWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=QQsAdwZs; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="QQsAdwZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=izgnb2xml5epbownengd5anrua.protonmail; t=1723652889; x=1723912089;
	bh=NDeEv674K9CkcHgDcHkn+qiS/pKjJ9GtImDj4uiP3aQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QQsAdwZspwhYXiBTOLgkyaYacs88TeDdy2W62teQVW1o3zcV47SasonfXnROSt1DY
	 HiPafgcGhh2U0OVBrOjQxozFaI9lsSRSa3gR3HDfHsMEQ8weTXufXdfLN7boi8xwzS
	 dqv3vdBpyhgExQTSXLaweXFQjoGZYItymUpSvyfKla3vB/+g9Qsnahi8oSx9iVc/Tv
	 ya4+0gY39dODpqe3fSTDT1KUjDxT/ZBp3mPKV+lAWbv9HgCq8sToVCeDVg79ZZzBbP
	 1ZdoeVYvTkDq8jrk1rCto8d+lPv1D6fwn/iSz+4kLZvxPvsnk8JgMuJ0ONGXF50DqX
	 Mm+QL2FHmN4wg==
Date: Wed, 14 Aug 2024 16:28:04 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 04/26] rust: alloc: implement `Allocator` for `Kmalloc`
Message-ID: <04b0fd96-c91c-4f38-90e9-8acee31e8445@proton.me>
In-Reply-To: <20240812182355.11641-5-dakr@kernel.org>
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-5-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 88f8c24039c7706740f395f5716dfb216a4a06aa
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.08.24 20:22, Danilo Krummrich wrote:
> +unsafe impl Allocator for Kmalloc {

There is a missing SAFETY comment here (and also for Vmalloc, probably
also for VKmalloc then).

---
Cheers,
Benno

> +    unsafe fn realloc(
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        // SAFETY: `ReallocFunc::call` has the same safety requirements =
as `Allocator::realloc`.
> +        unsafe { ReallocFunc::KREALLOC.call(ptr, layout, flags) }
> +    }
> +}
> +
>  unsafe impl GlobalAlloc for Kmalloc {
>      unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
>          // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero=
 size by the function safety
> --
> 2.45.2
>=20

