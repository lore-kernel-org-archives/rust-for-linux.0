Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C91C5D7D
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 04:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784866143; cv=none; b=ZbAXvntScCHMWXCJXbCmWTg5dDbOp+yJfa/aWI92spmFHi3iilavFQBbQ9Vq6XHg/U07QQ8GI82iRbscc0NTqtFZmNwyCt+ArEvtJQRm1CgPmU1s4gC+IqI87TUGuBMrOS8HG7bqSG4lS/lrWajq3D8u9iMPh7Oo+QXn7dkOAP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784866143; c=relaxed/simple;
	bh=lCot1/K9G1s7zCTxWRlOJCyioFiarcg/8ENRIUOGFN8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=a/JIB3i3p29uL8gOvMkGuWMyJ3TWaZ44Tt5Vd3a3delH2KZef3TdsW/MOFLLRFD0QW2aUvrxoLu4LPz7zW4IktBrb0Wj8NlUPmkAwWyWRAKsODwebQguzVWTLEgSaIW650WzmZqgWQuKIrzYZbs6KBdTqKjXhQP3Mw5zO3OIQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=fBQCgD2T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Brre2Ry5; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="fBQCgD2T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Brre2Ry5"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id CDD9713801BD;
	Fri, 24 Jul 2026 00:09:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 00:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784866140;
	 x=1784869740; bh=gktvss8Nw6gWCwRMUXQNEfHkQ95oubJrjuB/dtEsxD0=; b=
	fBQCgD2T8woJGPX3vXzqYjEQNdMp4CKk5OFbYqyXCWjttnl2wDQywopXW2WjoNLi
	Ru6EbEO2y1NHuj8W69iCkl7vGWigxlJbebUkt2fawz0DIVTR1u70jTMPp+anQqwe
	9SOfkYXMznUgy2CJWwSyROHJYCRQRT42uVcI0gBwfLtdK8L4Rfzobggii/6Dy0bQ
	daFuv+3sNsMho7xVYXWW3OA6lQ3g041tC7//h29dwFq0EZaHbhZqzLUkzkbGN5/p
	HR2VKlA07vYnrFcK9k0l+tYstmIFRG9XvqDuXR4BsYL5qkwLqkD6rU8cDA1RjCMr
	KIGEaf+A56MjetoMnjJnPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784866140; x=
	1784869740; bh=gktvss8Nw6gWCwRMUXQNEfHkQ95oubJrjuB/dtEsxD0=; b=B
	rre2Ry51b+n0ayzhDIjAfJIUCtWQ69uneC3wmgChGhmRUAF+p2639n3jwEWZ4YSH
	0hepV4w+4X2MN88GYxldyk/u17Q4yONwCcLroBQtXuoRkyO1E8m1BuGdykZm1FEB
	TB00UQlS+LjwIE6BhYCoyAcB++/p2lnZB75powah7shu3oRtPtNJM9yM7R4o8K6C
	iDjuWswMtyyReaCQJA5iN1ssDZfYrr8n9BYdAjos/aeESPWpITk+pbnzym0kjLtL
	ddPNqRlScSb0AxUvAzFKrPQeqYRAlwNcAbwQQdxiPEpSNdowjoJNmRbGS8165aeW
	sd1Nc4kEqte4E3y76D/iQ==
X-ME-Sender: <xms:XOViasZshd1nlGKQ3detvHbi3b1xOyM6dbmTzUZ7Me7C6pc1FykaCQ>
    <xme:XOVian2nu1_o3IJCC1X1fk5WZYIMc3xfnGxXE0ftJsd23MbvFET39q3u7tsZbSP4c
    6TEOirFa5-2MFUEdY_zTICRiZVU84CBOGIC00mpDGyWMkPxq_0VWu_Q>
X-ME-Received: <xmr:XOViamsOgIlLZP6ncNh4RFypZg5WgwLNNEEUI2nkyg58FgIsV51hI2CajjDkgJ5y9XEu--u-bWllrxgwRxDsjIgm>
X-ME-Proxy-Cause: dmFkZTF06f1koHXtEpswqSzrvzLSi5gsfKm2UnvXrcDrQE5m6sfqvzqXbnu4CaLgyZST/l
    Hx42YZ2ZAwXrVvBlw18dIRRa2xzrqUt9pxfvS9naELpa98GstydjMxfVRWaL33DJ7i/9GZ
    dD4szRbvuF3r1oP3Yc4ktzcy67TB/u37JxmC8noh0L///NQ4kV26t9pH2ETrlaQOrUHIPz
    HojLMv42S7VpQu8Y6qVX6nPXxs8nfMNeXXTiWsSZGw2EuwDsvCtz93DFC3bVJ+i7153L1H
    ZR8nQyg9VIxRKHN+24yho19o5pwjLkj7UYOtU93+BxKVJDjqZfQntAbZ9U8sNOluNrXWCb
    z4TM8Q+L/BGcyZhtisQfU/CU+iNHv09eDcZ2v96/4Upox3QQMsVdz4JqSaIGrZbkvg6jYs
    pLVRfg9anq/+pPn3GTFcDew2e5QkiuBayoX9V5aLMDYAbX+jUbmnn1OhmtlbKOruTJ6Otw
    PClV660tUe1qAJpV4F6gkVNV55wqsGMvZFYnq1jxxIxEb1ErBxJpp9U2Uk4sE02lIOiazZ
    NIA38pljbxvzkk9WUjri/p4SslV9t9hjoGJu4nkHPSVbPHeba4BEFdukqcNHPhTWC7dYMF
    eaCGGoA7dbSQ3bmK4Dsn0+zzBu07kmXd9L2GbepFJdB814EPisKU3qoD+muQ
X-ME-Proxy: <xmx:XOViajAVsAOwmwvq0fgUCOdI3khQAxgsp7sPhywDlOfSz9mww2smQQ>
    <xmx:XOViahYw7Qe-_u9CPVNGxrlAqP9_KRKKdn0pqv5auapuBs6-FsKhiw>
    <xmx:XOViat-cLJXBQVnpEV1pmHn_KIM9wD0NaiSz_i0lI_1X2YWcAZsVUA>
    <xmx:XOViatis1KwMGrN4DVaqs8Sf1lBNk6Puu98iHac-gjAX_OfSimzk-A>
    <xmx:XOViauUiYbJB8QAQZb5MAAQHMp7aIIFSgaK6C6lLU3BRuODDlnQj6GC->
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 00:08:56 -0400 (EDT)
Date: Fri, 24 Jul 2026 13:08:53 +0900 (JST)
Message-Id: <20260724.130853.1719089301624801198.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, ojeda@kernel.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from
 warn_on!'s flags constant
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
References: <20260720035510.4048145-1-tomo@flapping.org>
	<DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 00:40:04 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
>> index ed943960f851..2fd7ee25abcb 100644
>> --- a/rust/kernel/bug.rs
>> +++ b/rust/kernel/bug.rs
>> @@ -123,9 +123,9 @@ macro_rules! warn_on {
>>          const _COND_STR: &str = file!();
>>  
>>          if cond {
>> -            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>> +            const _WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>>  
>> -            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
>> +            $crate::warn_flags!(_COND_STR, _WARN_ON_FLAGS);
> 
> Hmm, why bother adding a const for this rather than just invoke
> 
>     $crate::warn_flags!(
>         _COND_STR,
>         const { ... }
>     )
> 
> ?

Ah, `(const { ... })` works.


> Also, the proper fix would be to mark it as used in the `warn_flags` macro
> that discard the expression.
> 
>     if false {
>         _ = $flags;
>     }


Yeah, having the callee that discards the argument consume it is more
logical than working around it at the caller. I'll send v2 shortly.

The same reasoning applies to `$file`. Since there is no warning right
now, I'll rename `_COND_STR` to `COND_STR` and consume `$file` in a
separate patch for consistency.
