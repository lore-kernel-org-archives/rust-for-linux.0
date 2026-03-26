Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423A1304BB3;
	Thu, 26 Mar 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521931; cv=none; b=sz+IZb8Gr+ZqjhNhfa/EqveW2AGB98noAMteWcQ9zN1aZH6z0uXhs5K/QpORXBlYSZzIEJ7JHgK/CQGcjaPtq4hS+JtXEnQKGVTtMzPx54felK4gIwiXCsp/xJP97YFl8eaI94TTm5VKQ7T3txmTyB3pXp4auh+l7NsEzXn3B7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521931; c=relaxed/simple;
	bh=+pePpThiHiyhtErEemgtaYW0m8qWx1Pj3b5W2BGNbv8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=D6B6BP4QD2b7mfWhpWmrX410JcoffBa2V1mij/aWiUuFWah9KpFTBQsDsaBLdDfDvQKvbH+3MJ5RYbNVCiqfCua9pXLZs0XHPCNXac/oSLO29wl6g+Mn4YMR8aHgDzQNbtGyihvVQnqw6i/Y05R9af1SguOps85i0DSavqaaf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=ESk7bgoM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DJY+Zu0l; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="ESk7bgoM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DJY+Zu0l"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 38BF41D00217;
	Thu, 26 Mar 2026 06:45:28 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Thu, 26 Mar 2026 06:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774521927;
	 x=1774608327; bh=b83YS47ctJDJItunGwKZgrgCYdWBOG7DJEMPcIqT8lE=; b=
	ESk7bgoMJMWDntsbzzy5Rog3MxH9ogUszPtSW2UEENGRRVxqWO8RbBUZm5LZxHWX
	PRu1Iuz1CtLqpaHnrCW38Zq5yuv9/ruzA8BbENBTHpBWtcWttqV0h8nzGxSvi8QT
	XLk847ToB6nslBwYvoBzMxAjKYFyjpEC1J2W+ODQjurQPyIvmweJdVN95mUq2Scx
	blu804InYDHGdP3W4W1FgVvy+MnpCEetCRbmf2cqLH4r/wJaWYe7L+S6n1KC84hZ
	ZuML85sk83WjpEH+zwbvh/NpAh+L3czk7Y3qWRsm6D48BeSl/rwU73wDdve612mD
	FVXHUXG5kB1PNfkJob+POg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774521927; x=
	1774608327; bh=b83YS47ctJDJItunGwKZgrgCYdWBOG7DJEMPcIqT8lE=; b=D
	JY+Zu0lcnpKzCkwZXZn0j1UXebbTAT4G50CDHxnQtPN8UQyNBAruH/ksPa56OitF
	8UcmBZP4gN+jheHG5+Ffec81EIefPWyY/KKAjRV/oAAaw8oOytgmWzBvx6zmvMfF
	svWDc0IC7YuKucg7eCu5TEf/jwdjE2M6J9zbCwl1R2BR+EHjvP8KlYt/+pcTB8BG
	DrSkPKlOB7emgI/TsYV20MoPhh9mz5pzBsY/KGrFeJX7ucEq+A9b4Joe7SFHB/Vh
	HRbcB6ZeMM8pS9rc9y4iQ2sC5LL2x15fo/NQd4h07NLq12oKLX1Ik8Sf8AWSlJqk
	ELrn+rDQoReeCNjhd1a6Q==
X-ME-Sender: <xms:Rw7FabcAR7Va8nLVuDmA6MbYlMuWcfjtu389onyjctfm9jIL6DpUHQ>
    <xme:Rw7FacCLIjDxkCPUHy76FPP8HMbb2eDzGPaka86DwMX_7EgDgJChh4sfQkwD9OVTz
    Su4f8QNwnoHucf2owWCzLBju6iZnAUUAnAfWQYgl-y4YdeRjzKmkfDr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnhephfeivdfhfeelheekvdeiteevgeefjeeiiedtgeetueejjeeh
    tdetleejgfehveehnecuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugesrhgv
    rggurghhvggrugdrvghupdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepuhhr
    vgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhooh
    hglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegsohhquhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurg
    hkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehvsggrsghkrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:Rw7FaWL4piNOhkFWJRudAFuxSj1oKx4SiA88zn2bH7H_lqmfuIpPNg>
    <xmx:Rw7FaSthEwoCoPlBKiKWwdb0a0QeyYYyLtGNiZPdcLvKLm6q2CM9BA>
    <xmx:Rw7FaT2BEdI49qwFiB9bQwSnzYjP73ZoRtbwHSjBuf_1ccrX1Lerqg>
    <xmx:Rw7FaSNmiHiGmDcRxMsQ5GhauaTg0tZ-wm9OFEKAWthSuqN_7YB8KA>
    <xmx:Rw7FaQ39L_ZQQc5af3wImgucIc_KKyMSC70rGptnx8NhcrbStm7NOSRp>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A36915C008F; Thu, 26 Mar 2026 06:45:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxEqGxP8ylF3
Date: Thu, 26 Mar 2026 11:45:06 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <afe9ff28-573c-4760-a310-87d4561bff8d@app.fastmail.com>
In-Reply-To: <acULYP6ejIQAIdX-@google.com>
References: <20260326095621.846840-1-david@readahead.eu>
 <acULYP6ejIQAIdX-@google.com>
Subject: Re: [PATCH] rust/alloc: add Vec::into_boxed_slice()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Alice,

On Thu, Mar 26, 2026, at 11:33 AM, Alice Ryhl wrote:
> On Thu, Mar 26, 2026 at 10:56:20AM +0100, David Rheinsberg wrote:
>> Add `Vec::into_boxed_slice()` similar to
>> `std::vec::Vec::into_boxed_slice()` [1].
>> 
>> There is currently no way to easily consume the allocation of a vector.
>> However, it is very convenient to use `Vec` to initialize a dynamically
>> sized array and then "seal" it, so it can be passed along as a Box:
>> 
>>     fn create_from(src: &[T]) -> Result<KBox<[U]>, AllocError> {
>>         let v = Vec::with_capacity(n, GFP_KERNEL)?;
>> 
>>         for i in src {
>>             v.push(foo(i)?, GFP_KERNEL)?;
>>         }
>> 
>>         Ok(v.into_boxed_slice())
>>     }
>> 
>> A valid alternative is to use `Box::new_uninit()` rather than
>> `Vec::with_capacity()`, and eventually convert the box via
>> `Box::assume_init()`. This works but needlessly requires unsafe code,
>> awkward drop handling, etc. Using `Vec` is the much simpler solution.
>> 
>> [1] https://doc.rust-lang.org/std/vec/struct.Vec.html#method.into_boxed_slice
>> 
>> Signed-off-by: David Rheinsberg <david@readahead.eu>
>
>> +    /// Excess capacity is retained in the allocation, but lost until the box
>> +    /// is dropped.
>
> We currently say that you should provide the right length when freeing
> an allocation, but this is going to violate that. You should probably
> invoke realloc here, like stdlib does.

Thanks, didn't know that!

`std` calls `shrink_to_fit()`. Should I add it as well? How about `shrink_to()`? I don't particularly need them, but I can expose them as well, given that I would have to implement those.

Thanks
David
