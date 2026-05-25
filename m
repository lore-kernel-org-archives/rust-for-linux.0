Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF63330B14
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779745093; cv=none; b=nXsO8sJzAqnmE2RmzuttS+NLtOfnqrwRT528T562foZ9DK/hTwgDdscduf2brbB+Ayve1JLpMU/rA2SiVzLz8wyy08b/yDYQE+aTHeKoa5CszpS1Pqb04Nbfy4dclTCljacXAiAaP+USRPBgvkpLd1HcUFYB4bvyoXLaU6tR0yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779745093; c=relaxed/simple;
	bh=0o0ZN1N5cdO6L8nwvbGKrsIW5eyk9xrT8EaQa9ZP+NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=TIuGvyU7ME38eEdJJUbbkGmm8AK8EK3xcyNQQoB5NREj4wZs8dmwdFFAHkqkTjV9WDcI0zhJQQrYk73dfRhOWG05NQsI7m/UKqasruzr4uHHg81mQ3s6jjo5+pOUUC3FqTfizjHle/pTrF74BdL8NHWUYLzsrZdPmNMexrY4amw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WBHeBCer; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WBHeBCer"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260525213808euoutp014edea2f0997f7be61fda3943fab7f67f~y7LqOHcXa1695316953euoutp01i
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 21:38:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260525213808euoutp014edea2f0997f7be61fda3943fab7f67f~y7LqOHcXa1695316953euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779745088;
	bh=0zAzb+SBaqshUeBbHDXG9ssb7rtPUCjTfo5KBdrF4y0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WBHeBCer/TMXLmOp/0xMC5CrppofN7AT8AEuIzqC1DkMFfEkhYrhUA0lOjVwJdST5
	 Q5y/hdhoOpPdPG5teLDtzAKzNeVS2QuY4mjPvzYS1NKQhwHsZeYcphfXkegYnWT+5p
	 h1NxZ1mmeh8A4XoL9gW0iLKgT77ynRuj+9MKGMg4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260525213807eucas1p297d843b9d4e24701b2f6687161b810e8~y7Lo9OACg2594025940eucas1p2Y;
	Mon, 25 May 2026 21:38:07 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260525213806eusmtip209cf2a762ef7e89bdb6b780de832be7c~y7LoQfLL90048200482eusmtip20;
	Mon, 25 May 2026 21:38:06 +0000 (GMT)
Message-ID: <58245ce0-7271-4b07-b866-0037ff68d92c@samsung.com>
Date: Mon, 25 May 2026 23:38:06 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
To: Maurice Hieronymus <mhi@mailbox.org>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260525213807eucas1p297d843b9d4e24701b2f6687161b810e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
X-EPHeader: CA
X-CMS-RootMailID: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
References: <CGME20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec@eucas1p1.samsung.com>
	<20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
	<8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
	<1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>



On 5/25/26 17:51, Maurice Hieronymus wrote:
> On Mon, 2026-05-25 at 16:36 +0200, Michal Wilczynski wrote:
>>
>> To move forward, we should fix this by implementing the proper
>> generic
>> 64-bit math helper in the Rust abstractions, rather than narrowing
>> the
>> types here. Are you open to looking into adding the Rust equivalent
>> for
>> mul_u64_u64_div_u64_roundup instead?
> 
> I would be definitely down, to help with that.
> 
> Before I start working on it, a couple of clarification questions.
> 
> Should I implement this as a thin FFI wrapper calling the C-Functions?
> Or do you prefer to have a re-implementation in Rust.
> 
> Since mul_u64_u64_div_u64_roundup is a macro: Is it okay if this will
> be a small Rust function or should it be a macro as well?
> 
> Thanks a lot,

Apologies, I have to correct my statement from before after discussing
with Uwe. The reason the macro was used in the mentioned driver is NOT
that PWM controllers have 64-bit registers - Uwe isn't aware of that
being a real pattern either, and I was inferring it from the code rather
than from hardware reality. The actual reason the macros get used isn't
unified across drivers and we should pin that down separately rather
than block your patch on it.

So please hold off on the Rust helper for now - your initial patch might
be the right direction.

> 
> Maurice
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
