Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA254EB45
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001435; cv=none; b=cr1X6E27orc8xaibEyvfqI/C7DqOsnJVFniOURuC/lchOVPgk1VsNmNNmBVu/VxTBu3wHH8YHz0kdDXnCZhxpX7xCTsp5I5ev1ZAq5s+amQbr46dhWqcSCuulPpKIS0w3EfYCtvvF7cuZA7wl2pU+wmX+4YmXMkRNPq0nxHnBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001435; c=relaxed/simple;
	bh=He68NyH4gZB8lAWcNRaOvpV13vQ1JU/mRr0dPmvCm1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AaOUIuCpz7Fw+VPaaYyBJ3+F8+5q4E2LHIbGOGbIq63OAti6LHTuNXESeu37FW0NdnzkDy6nOAEW2F3VwR9G2vvyc1zUbTpoGv6gesCNfhwdDBObUFCdg0H9PtPZSY/4pyUTz3/wQhbjTjVzA8oLNSxSJhNbN52oNbf0Gnx606w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3yjoz6o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3yjoz6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715001433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvjmFEUBS+8Te2mZn5of6jMIjXDqCtnf2GqFs64N36A=;
	b=R3yjoz6o9aoFG6i7uenLbc6MEO/h2E1d6+q5Rt1a4JOT0Ce+Z7JNZmWiyvyryt4Oq3ZipR
	iHSw3hDrgziqwCJlUFfcvBNTygc09sZpTZpDTax8NzN7QxI4furTw2C0CUB7FfTta6Bk+K
	cAtd6FgcMPDrF3uLsJEB/AggJapi7b0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-DwwOpCufOB-CuVmENtF0sQ-1; Mon, 06 May 2024 09:17:11 -0400
X-MC-Unique: DwwOpCufOB-CuVmENtF0sQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2e32c301353so6428141fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 06:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001430; x=1715606230;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvjmFEUBS+8Te2mZn5of6jMIjXDqCtnf2GqFs64N36A=;
        b=CMCAwKD9YqCaihn6t40Kjftx+26uBqCXnBfkv1HBgvxGqTqTuF725jngsQ0I+L+GG8
         2diQwNYEvu1tnZhBjyZCeNza/ln1Qd647BPSC1gEsnNYS0T4YHMYpgWVrCwg3gLOj3OH
         sSksxg202L+NyzsWhtJqCyq8Cru8dGaGzO6v5sOeucYwZ9ygnlt43LBnv5GKimy3atRW
         hASdMldjqVot5iRFw5JXUu70ECK6tVupqLP+0N8zNwZBZ00JrzmuNHtPMcKijkLnjqo8
         yeV7Z93cYuqfdvadHNy+vq5FwdJfvIRwELEDMjb7z1p690c0B9x3xCqX7m4CoE/4knL/
         5iJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOnFaWvXbEzmfjcc4x925j7Xffj83/slmiWLu8zmS6DHfjkKuSgDL+0ibplsek8xP3xHbr7XBtbcrzCw+HBlJbOqpPakZfbQJiOjhnvpM=
X-Gm-Message-State: AOJu0YxPvhpOBNr0fBEmme1SQNfgXCBqRxRNQLBIYwSICMeIlWFB10p7
	yQ1ssMctEhZTwbam3P3rYY6+eV8r5u2teqUfm+zw+MACqyQGXfThtWLPEPgzZCdQFC7B2f2QM2p
	vjYwkW6Is8hkzLW/l4ff+bGBc1SrkY9LcbwAdKgYYpHCitperzr8zd5xOPQy/4FJZ
X-Received: by 2002:a2e:b4a8:0:b0:2da:49f2:d059 with SMTP id q8-20020a2eb4a8000000b002da49f2d059mr4956601ljm.27.1715001430391;
        Mon, 06 May 2024 06:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN3fQx6wJmnIGsqyZChqAPbpzHdHhLpAqHceOISPdmNQOWJ3iJ3puCiOkIsGlv9C134GoziQ==
X-Received: by 2002:a2e:b4a8:0:b0:2da:49f2:d059 with SMTP id q8-20020a2eb4a8000000b002da49f2d059mr4956584ljm.27.1715001429814;
        Mon, 06 May 2024 06:17:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b00417ee886977sm19966274wmq.4.2024.05.06.06.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 06:17:09 -0700 (PDT)
Message-ID: <ab50e6b7-b6a0-488c-a225-d71bc626ccc2@redhat.com>
Date: Mon, 6 May 2024 15:17:07 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com,
 ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
References: <20240429201202.3490-1-dakr@redhat.com>
 <20240429201202.3490-4-dakr@redhat.com>
 <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me> <ZjI6k4YUsdUA_LaF@pollux>
 <20240503162714.67188a22@eugeo>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240503162714.67188a22@eugeo>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/24 17:27, Gary Guo wrote:
> On Wed, 1 May 2024 14:50:27 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>>>    
>>>> +
>>>> +    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
>>>> +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL) }
>>>> +    }
>>>
>>> Why do we want to have these functions? I think that it would make sense
>>> to forbid all other ways of allocating memory. So only allow allocation
>>> where the flags are explicitly passed.
>>
>> I agree that we should forbid allocating memory with implicit default page
>> flags.
>>
>> I added them, since I think we'll always need some implementation of the
>> Allocator trait. And this just was the obvious generic implementation.
> 
> Ignoring Benno's point about enforcing explicit allocation, these
> functions still shouldn't exist. Given `Allocator` is a super trait,
> all implementors should just implement their default allocation
> behaviour in their `Allocator` implementation rather than calling into
> the `default_allocate` function.

Well, most Allocator's default allocation behavior is likely to be the same,
which is calling *their* realloc_flags() implementation with a NULL pointer
and GFP_KERNEL for allocate() and with an additional __GFP_ZERO for
allocate_zeroed(), hence the corresponding default helpers.

However, it doesn't really save a lot of boilerplate, hence I agree we could
just omit those.

> 
> - Gary
> 

