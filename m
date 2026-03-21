Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654338C415;
	Sat, 21 Mar 2026 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101262; cv=none; b=RwtOXw6OtsrAdk4ireIlLDm3Qr3kymJERHFX/u+bErXqnUY0J+3AU9d3eywAo/+N0hxdwN2Vkm2dWMAFT+ZkECjZ/AxX48F6QdgvREJPOm3H8o5gBFzN63u+9BTdqvb5Qr6KQFiLHYo6ff+6jJXVa2WK4e+8WKoDSz/CgbuRi50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101262; c=relaxed/simple;
	bh=sbUn1F6RmDrL1YnZMN4GH02puIFrMpAq636vcbUPIww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Se1JIAQUw+2tsVPhUmV+o2YVJX4KxN5qtdTZmLjl1b/sBmBm9LMmomRKu/QOHbrinaRddh3Ap0uCha/ytjggMDdQg94hZpof/gTM9LuFZorEV1feprGNQgLIubEof4sbIdo4hpj9RJxURVsb/dXpmTmaWy4xxBlofD0Z0F+4WSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaL9ovRU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaL9ovRU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49715C19421;
	Sat, 21 Mar 2026 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774101262;
	bh=sbUn1F6RmDrL1YnZMN4GH02puIFrMpAq636vcbUPIww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BaL9ovRUA6y0KRW3NlPMPYPGs54lj1hoEbBGJlDOF0aqPxj1atEohfx/kkUUAKwoP
	 /zCmvF10MXRpe/XvQGJ6Y6ndWK3sWdj/DeDnoULVV6HGuMwWDofbzS/MAO43di/Yrj
	 Ar+vekeMQwLCgWLcc97uM8WBJCGgCWXqNC+xGaU8bQQFiLVr/izOeQ+fiAAw/eTvWT
	 GAlooFynnIKtlso6O55wY68C6T7ehTRaOph4UIxhwLOdyXnWtfGDCZnxRUgbsXeQz4
	 pN63tTjq1HgWyXWl2rs4R91BiuMpGp9VYlF7JpCnlveiDYIg2yDj1mg+84vUH9YGvX
	 anILdFYSegWTg==
Message-ID: <d7353cb7-a9eb-4b1c-9be8-161f5f68095a@kernel.org>
Date: Sat, 21 Mar 2026 14:54:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: gsp: move Cmdq's DMA handle to a struct
 member
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260319-b4-cmdq-dma-handle-v1-1-57840b4a4f90@nvidia.com>
 <DH7MBMNV5WPI.E9TXUC279THZ@kernel.org>
 <DH8I59NUUWR2.3LOLJPY6SEABC@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DH8I59NUUWR2.3LOLJPY6SEABC@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/21/26 2:41 PM, Alexandre Courbot wrote:
> On Fri Mar 20, 2026 at 9:45 PM JST, Danilo Krummrich wrote:
>> On Thu Mar 19, 2026 at 7:00 AM CET, Alexandre Courbot wrote:
>>> The command-queue structure has a `dma_handle` method that returns the
>>> DMA handle to the memory segment shared with the GSP. This works, but is
>>> not ideal for the following reasons:
>>>
>>> - That method is effectively only ever called once, and is technically
>>>   an accessor method since the handle doesn't change over time,
>>> - It feels a bit out-of-place with the other methods of `Cmdq` which
>>>   only deal with the sending or receiving of messages,
>>> - The method has `pub(crate)` visibility, allowing other driver code to
>>>   access this highly-sensitive handle.
>>>
>>> Address all these issues by turning `dma_handle` into a struct member
>>> with `pub(super)` visibility. This keeps the method space focused, and
>>> also ensures the member is not visible outside of the modules that need
>>> it.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> Linking my note from the original patch series [1].
>>
>> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>>
>> [1] https://lore.kernel.org/all/DH60S91O053Z.1DDUJSL0D6NQQ@kernel.org/
> 
> Do you want me to add a `Link:` tag to the commit?

I don't think that's necessary.
