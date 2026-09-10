Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25AC48AE20;
	Thu, 10 Sep 2026 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046672; cv=none; b=tC5Zw69y042WwnbzkjHghLplBuDSPE6/v1lHz8daIvDdCXZyip6Mix0aXMk+98hIpdyXEkoVnMDP0dgzS/wRZohdYVQIgUUScDy/aqLajoSnyRTaDZmhAK/vvZ+tQQI+rgAOAkBqtMU9NgmUKo7UD1u70qMtmBAHGjQQcbblExw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046672; c=relaxed/simple;
	bh=+VbvFGXiK89TFpoWtiLNX+IaqJLiERKN2CC6vh99MJw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YxvrOCXrY1rZA3KiAa9WOeBWILfQWYSx6ZC8yUxboIGvHvaStWT7h+InuqPzDSwm2MSaFcj+ayjykueXq0WGko6Wn/VqSwQs38aWG81vX7J9/y6OCT4mnsU394mKJw1wlAm2xHfAcUgP2nEySSElAL/776OZxf4ZOLmQvG8vqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=gA7IDNQ5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nY6v7Fp3; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="gA7IDNQ5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nY6v7Fp3"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 755037A00BD;
	Thu, 10 Sep 2026 09:24:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 10 Sep 2026 09:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789046668;
	 x=1789133068; bh=pPNVfymHR2XC9ByNjrUYouH52ihzMf/+u8o83ywFdQA=; b=
	gA7IDNQ5qcGQ9FpoVUXx9Rl3euUYNZXCVvMUXllrij8BbixGwlvEoz+9AmV/oe8F
	klwFza6v+Hvs7i9T/PobFxsBaXSh8CpcDBbQfhD81HBahEPDTNRiXueurK9nM/Po
	fCbADRszzAEoYA4tnSUBJfTiyPpEUGJVfqpiVuus1c8nzILjIIk6+BqdXh+88b4H
	LTnHh0eG7dRkS48byEoYQyFw8+Chf2ptYiq2yadDL7LyRsU7iepSJhVPZranDtCL
	vu7ZHtkVKQZ5vWU9sZCJCQh447z+hKgU6g/R2aTx4hVmfei0kdAqAP5QmrLDj+Tp
	eiZ6RgAcdMkjLEKeXrVcaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789046668; x=
	1789133068; bh=pPNVfymHR2XC9ByNjrUYouH52ihzMf/+u8o83ywFdQA=; b=n
	Y6v7Fp3DIuBnH4qWqWrhvgGn8EpZdyXTxR/TVEn5qpH+MBLay5FShFAcIVqrh868
	os9oa0fPPAKtyKLOZ9H3qvO70CPLiFTXfE2/q4qO3eVN6BZQ5rZAyyyfk6pdcX1u
	wGbfu/41czlwRjJMnwu+8FQtQ4M52XftYOe1xViiXZjUZ207rGQPFLKxkQwvN4+U
	p10s39b0WMEwLx9XaEl5sUlhawoblXVzSnY2DlobwjdD2eYfdFcuxll7d7pxC4PL
	/BKogLV3SXHDZjLAZrhDwY63kBkJMRutj2CnW3l1nLf62WwxNnhw40F7GxKfmpyD
	99IsnV93FfZSImJPgWyfA==
X-ME-Sender: <xms:iq-iau1ZCqh3xeTm8AsCTDDwXElvTfmJJ8FPc5up_wuHJVzjvusHCw>
    <xme:iq-iaqu7-sHbm7-NYmO4UD99rGyGL7EXy2NIPADQS3IL1bz52ihG0_0XhxHiX9ql7
    5kUH6FCyMy7smka-K_qc2gyNkGDyG0gmZW4h7O5KIW9_M4CsuxsGfx->
X-ME-Received: <xmr:iq-iaqXxZlRXMG6Q087BNmElwkwy7c5kMjQNNG2N3bl1LoUM5cRlkWyQxQK7RJwPA3Syt0_y8nQFYmzTRdUhfIKg>
X-ME-Proxy-Cause: dmFkZTGW95mqvfGMGPYTEqTrjHWUVhcvA5HTKwj8urM2KImtx2Iw9C8bH169hBTFRhfrF5
    EXeXd9fEyRmAWq9C2AqmFUuIGYg/rCdWRGD5tqrtc0m9Lhzfe+klqthxkpugjTTbNWrHfM
    wKkmWGL6lweONGEbJlksgvzcsa+Runt4ZT+UhiucVixdhhbKgwMLrxvwWBsqhNctodDxiX
    RhKdnuGYmxMwDpUPut0kWqIpwpWh7wFiX1VHnz9y81TIP16Sm/ODsJnLE1VbX8czDGZ4cV
    VnrFvtCSTjzb5GUj2Kwvm+WTy0Y9CC7bnCVPt9Yjp5Hb63szP80RltNxaT8GmrQ+7bzToH
    uSAMr6O8uIM9PgHR8wHhCKsDgQsE6NyQ1Akb3s20XBOFhVNDLkBuA4DZcr370TyYkPfOJm
    idUL8lrxcn1/Sg3PMKZS5IEdNXCiCkFwoBsMwXsuADlEPM5EpBFyRygH/ylWjEFcO8GDl8
    onCEtXKyRX/LiKCWmfFxf1w9g3MflXjTVaKzS/1OAvttW1MtnRg/TmGkIcX2nOVWw6UZP2
    Ei2H8MjjdY+Oh2vgIwjyANe9Y7D0h6S8wyOjp+AYfGS0gC+p57aNyKjXSSF9gwhm/tRL0y
    kmVdqVgottQbPVU7s/CzACugOVlyd6HNA+WS9TMNI1LjAFOvUdosxnB7yOaQ
X-ME-Proxy: <xmx:iq-iamsBE7VFp0yC1usqqOlKq6NWZOi2YZ7MMOpPyHX_T1aba7SUvQ>
    <xmx:iq-iasMa2D8EhXge6o50AOreJAAV5d8ekGHgPXI7vUp2CxdepWUmXg>
    <xmx:iq-ialnWx7C9_Bx9AM9fOxw6XPc4d9fM1jjtkuxlA5WQbsbeKZ1WJw>
    <xmx:iq-iaizoz_Gdf6XyKAvKLqi5mCun_CYzbYMm4UqE_B6Y6IZ310BXgA>
    <xmx:jK-iajLKynxfVMAs1dc03eCGD-yBdoLJ1PdVyg3mE6-cAJthBQ0IY_9c>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 09:24:20 -0400 (EDT)
Date: Thu, 10 Sep 2026 22:24:17 +0900 (JST)
Message-Id: <20260910.222417.2048885189565815846.tomo@flapping.org>
To: gary@garyguo.net
Cc: mkchauras@gmail.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 rust-for-linux@vger.kernel.org, tomo@flapping.org
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
	<DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 13:05:27 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Thu Sep 10, 2026 at 11:08 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
>> The Rust kernel infrastructure generates inline asm for WARN() via
>> ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
>> preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
>> arch-specific asm template string for use in Rust's core::arch macros.
>>
>> powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
>> Rust builds to fail on powerpc with
>> ```
>> error: no rules expected `ARCH_WARN_ASM`
>>    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
>>     |
>>   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> 
> I think we probably want to catch this earlier by have something like
> 
> #ifndef ARCH_WARN_ASM
> #error "ARCH_WARM_ASM is not defined"
> #endif
> 
> in generated_arch_warn_asm.rs.S.

Good idea.

One thing needs to be fixed first. arm and loongarch do not define
ARCH_WARN_ASM. rust/kernel/bug.rs uses bindings::WARN_ON() on those
architectures, so it never includes generated_arch_warn_asm.rs. But
rust/Makefile still generates the file for them. With #error, their
builds would break.

I think we should add a condition to rust/Makefile to stop generating
the file for arm and loongarch. Then #error can be unconditional.

Does that sound reasonable? I can send patches.


>>  arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
>>  1 file changed, 20 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
>> index 0db48977c70c..df2183c35945 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -32,34 +32,38 @@
>>  #endif /* verbose */
>>  
>>  #else /* !__ASSEMBLER__ */
>> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
>> -   sizeof(struct bug_entry), respectively */
>>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>> -#define _EMIT_BUG_ENTRY				\
>> -	".section __bug_table,\"aw\"\n"		\
>> -	"2:	.4byte 1b - .\n"		\
>> -	"	.4byte %0 - .\n"		\
>> -	"	.short %1, %2\n"		\
>> -	".org 2b+%3\n"				\
>> -	".previous\n"
>> +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
>> +	".section __bug_table,\"aw\"\n"			\
>> +	"2:	.4byte " label "b - .\n"		\
> 
> "b" is part of the label. "1b" itself is a label and "1" is just an integer.
> 
> If the code uses
> 
>     _EMIT_BUG_ENTRY(..)
>     "1: ..."
> 
> then the correct label would be "1f".

Agreed.

I think keeping the label fixed, as v2 did, would be fine too. x86,
arm64 and riscv all hardcode it. A comment that says the caller must
put the trap at 1: might be enough.

