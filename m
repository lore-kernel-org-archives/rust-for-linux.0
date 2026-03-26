Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937753F7A99;
	Thu, 26 Mar 2026 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527679; cv=none; b=LMMnHsmHclmfIGpxJnV3slZuKtKiUbRWp4sEVQXlUiYchLIsxZV3gAC6ppdnv8QuzlHO06uJbU9eb/xs8gyXFM65vwp1X3Af8aALkQGM/syJB1lJ8NRDmG6gcbilMqjyAbslGuqD3o7FY/VQ2Os4JkOr/maB7DMh2h4KQKv9xsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527679; c=relaxed/simple;
	bh=2LTus6DX/DO1GOMPPeDvVOzvikK9nZsY9ARdiGSzj/0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t3xXZeVB4zWEBV/LbYOmDcy47wg0SnIg/J2zb2wQjfd3L02hagrmi65tmGJldD5dwBs9kxXd4h2K4JPZ2u/ndFgR4MutDyqr86NtHbW9FkMFxpSpoqJ4CcGO/OyZh2j19le7jn/09dWs6PK1EnF2ZkUfA/UmfglMxV3DX0oWoYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=cGPyV8jU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sX5FWcjs; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="cGPyV8jU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sX5FWcjs"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 9918D1D00065;
	Thu, 26 Mar 2026 08:21:15 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Thu, 26 Mar 2026 08:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774527675;
	 x=1774614075; bh=aOVimFAAzDLhewACqx8vFHk8q1cxHaqgPaywV2Mz09c=; b=
	cGPyV8jUgi7pOWsz77SkgVQJ/dlR1NLJ8eguwmg+idvGEnCXrIlYpJafJjqonxg1
	ViIFqdRFsBdrtFU+49NJnjJojrmqgYZGFb1bWr6lU/htLHlnFcp5Go7Uxrv8YLZG
	R9l7MC8cDEVm6jhiGL8boRt+7fAMhwDCuy8cZ24TyWTnqJqmXuiF396f2UVR73o/
	XRqtnweqpUw1EZRrPmtcN0XFq0NDnVwBqd4bShTaIOrEFg61pCdbM0xKh7z6jVHu
	2keJ7NjJmdPmdy32xzzFrliX4fPp2qPOuuFsqoh1RioaZkqhZi4t/Hvp1uPJ+2Cm
	rYKEj491TKwGHb25MQOzpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774527675; x=
	1774614075; bh=aOVimFAAzDLhewACqx8vFHk8q1cxHaqgPaywV2Mz09c=; b=s
	X5FWcjsuTn0YsdPCdWWo3lNDJcQPWmnGDqawjvS8ohB+xxpK5SW7lVv2OW2BgSpd
	RsSm3WZxEM+3xBYrVLWIpu5WEVKvRvpGhLN1BiN11YlnEQnhIGZxxcJq0/Eb3co5
	IvEn8G56IimJF+o6gWUBm82i1bOPCQOpSvabVWapquCZEiyFd/lZpoDPya5Am/+8
	yF4F5WK1We1c1o23xxJ5KGMrg8ZcbUgEIEooAjqqAX1mKJA+UMUlf201aQ3LFuB6
	9Ovw/prV50y2GLr51P6hEFgCxk7Y+A7SpLscJSj6e7rYvUPotZ4pp55+y+7A4nAp
	RmLhWHsbR3GrF7JEj5M+w==
X-ME-Sender: <xms:uyTFaT6-PzWc570MQPjXXYOP6hVDiuBMx7jurezlWcLiBrFopT3k4g>
    <xme:uyTFaTuIxvFSImTGV3JxSa7iaYCuOni1sAhYkuvWj_O_7UDBSGcbbpSTiWNgQV5fR
    Qlpibc7G0XmV2qQ41xiN8TiPvrina96gK01-0HoQpgcTugFNRE_PeuF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnheptefhteefhfefteffffffteevueejleeiheetgeehffeileev
    fefhkeegkeefgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopedu
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgrrhihsehgrghrhihguhhord
    hnvghtpdhrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    rghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghkrgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtg
    homh
X-ME-Proxy: <xmx:uyTFaaQdgow94ReTqPBduq5zOcwS_xXyBdYhzpdX_IfmoOu-syNFrQ>
    <xmx:uyTFafU1VuN9lUTLZLINq345z6ZK3zHbP0Dv49u7rvg0vvThY3-Uew>
    <xmx:uyTFacKqhlb1gcuV10TvGijSbpB_ONRsPGBZNoP6CWaGpR3hS4qrjQ>
    <xmx:uyTFaYiAebwILF8ACvURmEj9fdW_oNp-qZTLcAAMG53meUkAfaNqfg>
    <xmx:uyTFad761Vr-Z5NAFU0NTw83i9P9EGvqPT24GH-bfRGgUKaPi3kEKnam>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EC8C315C008C; Thu, 26 Mar 2026 08:21:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxEqGxP8ylF3
Date: Thu, 26 Mar 2026 13:20:53 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org
Message-Id: <061ea42f-bb21-4dc0-853d-fd2391309d56@app.fastmail.com>
In-Reply-To: <DHCNOY4GFV7B.3VGGZNT3382L0@kernel.org>
References: <20260326095621.846840-1-david@readahead.eu>
 <DHCNOY4GFV7B.3VGGZNT3382L0@kernel.org>
Subject: Re: [PATCH] rust/alloc: add Vec::into_boxed_slice()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Thu, Mar 26, 2026, at 11:53 AM, Danilo Krummrich wrote:
> On Thu Mar 26, 2026 at 10:56 AM CET, David Rheinsberg wrote:
>> Add `Vec::into_boxed_slice()` similar to
>> `std::vec::Vec::into_boxed_slice()` [1].
>
> Do you have a user for this?

Yes.

>> +    /// Converts the vector into [`Box<[T], A>`].
>> +    ///
>> +    /// Excess capacity is retained in the allocation, but lost until the box
>> +    /// is dropped.
>> +    pub fn into_boxed_slice(self) -> Box<[T], A> {
>> +        let (buf, len, _cap) = self.into_raw_parts();
>> +        let slice = ptr::slice_from_raw_parts_mut(buf, len);
>> +
>> +        // SAFETY:
>> +        // - `slice` has been allocated with `A`
>> +        // - `slice` is suitably aligned
>> +        // - `slice` has at least a length of `len`
>> +        // - all elements within `slice` are initialized values of `T`
>> +        // - `len` does not exceed `isize::MAX`
>> +        unsafe { Box::from_raw(slice) }
>
> Box::from_raw() is missing the safety requirement that the allocation made with
> A must have been made for Layout::for_value::<T>(), as this is what we assume in
> the destructor.

Since `slice` is typed, shouldn't this be implied by:

    "`slice` has been allocated with `A`"

There is also no mention of it in `From<Box<[T], A>> for Vec<T, A>`. This should have the same requirements, shouldn't it?

I will gladly mention it in v2, though.

> For this function we should call A::realloc() and document that
> into_boxed_slice() may shrink the backing allocation.

Will do.

> Additionally, can you please add a doc-test?

Do you want me to add a functionality test, or do you want me to add an example for documentation purposes? `doc-test` is a bit ambiguous in that regard.

Thanks
David
