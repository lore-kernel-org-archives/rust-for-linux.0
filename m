Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389782;
	b=YfRM1ucGuCb2E3nB91FgoncylGJZbDZHhY5ZG9wmsca59ooMCCQOZbhXwqKFRZG2//o5
	 NS9XOUwd6nTtyNpY7uS8eF3IkLg4qmNiTg1vhegFi4HIN21RhSOYrFDtPuPFYnD93fMv9
	 9wLhp4b5RtBy2UBAed3S+SumSLnTY7vfU4iuyifOv7BihGGysfr9oiGM4q+WPSTCeoNLd
	 8Bduj4j6+c38rBC0o8tPxCKgCzaCo9snpdYkPnlob3ycQTWRTHVHKD2mv8f20VVXmUmEa
	 6E6xVsebyLOtc0K4d8kwAThbpxTsxOcW4EapWDdhul0zneBOa8ab/uroe8YHU+vb3hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389782;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ryiW4zH9J34Op1T7M/jybUvIxWnhFj/uyxoJlTyFHGk=;
	b=gN0xY4si0Mqg2jgMLtr6lW/N3LfyHph6DSdhQ2DXv+Ae9x//MNRk49glf+RqeA4KgCwy
	 NHXKLK4bUgHOB+8Ydvf5/TeStMiYNxLWjF7eS0zVC/k1FhWRCayMQUVrT3NyLHPNc0s6h
	 9U1VmK9NW0VajSNplVjZ8NSOTKpa73wqiUvl0t2rvr1OU3GAqv2Ozvc9TSiObkC3PKoUk
	 LhpaRnFlcyHXlStmdf6AHKhbosjT2USjj8VA+D53UtsJf/W6fot1j/ijw2r3lBGjYgQ3O
	 n07acz9GjqS6TAIjktUy+DVu3kBVOl0kYNGl6pOBaHgvjC5Gam+TgBg7xHQ33VsESHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQQf8zaO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82148606A31A;
	Fri, 30 Oct 2026 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQQf8zaO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0701F000C1;
	Fri, 30 Oct 2026 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793389782;
	bh=ryiW4zH9J34Op1T7M/jybUvIxWnhFj/uyxoJlTyFHGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HQQf8zaOQ5ARVD5gRs/xSRTJxWnixAe7wRs1Bhuc2vDcF8qPOkhndkHtgD8i4ReJo
	 GYi5KcC4pXVRKoWc17Bg1R8EXnWeNnHZh8gcg6WVkGeHjVmbL8dFc2YFzCMZN0jQnV
	 4lCxQ7nJo/rJYREkuWBOeSX08u1SqAtkvzbHTiup3G3AtekTrRArtgLc51rKq0TN3m
	 GzFfzwHpAh1EPQNmZb0XqCPHc3ZP+Q6PQ9LCcNftPj6+MbZWVKA0IJ4WrHMvIm/Ypo
	 4fgXQ9TdkM9a025PjCVZGjtk7sfyCyoCpYY2byBX7/PcaKynNpUwfeWoEqd1dgRofd
	 8kiFheiGmJBVA==
Message-ID: <9f17c3a5-5d11-4fe5-a8db-4ad954ca864b@kernel.org>
Date: Fri, 30 Oct 2026 20:49:38 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Please add the rxarray tree to linux-next
To: Mark Brown <broonie@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-next@vger.kernel.org, rust-for-linux@vger.kernel.org,
 GOST <gost.dev@samsung.com>
References: <f2df460b-bce2-47f5-97cf-d70773876019@kernel.org>
 <a692c537-cf5a-432c-81b4-372a6bfed69c@sirena.org.uk>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
In-Reply-To: <a692c537-cf5a-432c-81b4-372a6bfed69c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/2026 13.26, Mark Brown wrote:
> On Fri, Oct 30, 2026 at 10:22:49AM +0100, Daniel Gomez wrote:
> 
>> Could you please add this tree and branch to linux-next?
> 
>>   https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git rxarray-next
> 
>> It's for the Rust XArray (rust/kernel/rxarray.rs), a Rust reference
>> implementation of lib/xarray.c [1][2]. PRs will go to Matthew.
> 
> How does this relate to the existing rust-xarray tree:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/Rust-for-Linux/linux.git xarray-next
> 
> Should that be dropped and replaced with this one?

I see it may be confusing, but we should not. At least not yet. The 
Rust-for-Linux/linux.git xarray-next branch/tree points to the Rust bindings for the 
C XArray that Andreas and Tamir maintain.

The Rust XArray is a Rust reference implementation (experimental) of the C XArray. 
FYI, roadmap in RFCv1 for more details [1].

Link: https://lore.kernel.org/all/20260923-rxarray-next-v1-0-92eedf185649@samsung.com/ [1]

