Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E2F1A2545
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754338103; cv=none; b=LuwSBUZVr7Ziy1I0Q4gP9EdApTHJh4oJxhWguFw/6WSS/XP8Q7GU58XhJ9JUBbS4BXI8uW3LNLQw5Bg585YBuvmE/S5TF2TFRZ1r7wcfFGrv9O5luyD8Qx0+1WoXDwjGIDibZ9BpoWsbPcXg8Th67GebPlLfKiWjmgt72if9cHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754338103; c=relaxed/simple;
	bh=MoQEhbbsrxR++kwMmrIh78UNKttYdqX3KBgq+SjawmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smFiAGSaDsCBwrSvit4C5oZabQFz1kMy2P3VVD7G+TI2XS2aS9cqetU3Ur446GLB0x8LT5LfAXum+0ZfwE1Kqp2z2KMFYXug/mnYbXzoL/rmcNB06GeO2PW9pzX9lMwXY2U0IhrECU2uzUu6ep0+Kd8MYrN+TW8xZESPPlh1XBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrEqBV4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrEqBV4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACCBC4CEE7;
	Mon,  4 Aug 2025 20:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754338102;
	bh=MoQEhbbsrxR++kwMmrIh78UNKttYdqX3KBgq+SjawmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qrEqBV4xaCHaN1j5sgkWhk0YMzELlG5DNKyR+vwjokgLPx0XzkaqGhnMn1hG5kXR9
	 JdA5tKeSZe0aitwHmXErNiU1bD3AEFJTq3jkhHYPu1J57zEeJ4zNaqRwTX/JYvrBLC
	 9mq0lmITzrCk/mwbZUl/7WIj5MWthyBaCsU0rA3cS4sR5/yi1MNO1WZXFCw/sVpfUI
	 3rcoMCG91EBENy1jdjLEIfX2hUTu4JHLwoxnzaj96whllE7gL0FZ6V698ee7Mw7ctM
	 7HVwxOYB8/WQKFYyyaw0oGu1Hdna8e/C1BcP4B4eC+y5bCReaTULIMegTGefqsLD3Z
	 qFDml9IAlJMrA==
Message-ID: <37d64b29-6ad7-4253-a874-4d7702078ff7@kernel.org>
Date: Mon, 4 Aug 2025 22:08:18 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: page: implement BorrowedPage
To: Benno Lossin <lossin@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org
References: <20250804195023.150399-1-dakr@kernel.org>
 <DBTWTWOURECI.1I8XPYMDDIIBZ@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DBTWTWOURECI.1I8XPYMDDIIBZ@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 10:02 PM, Benno Lossin wrote:
> On Mon Aug 4, 2025 at 9:50 PM CEST, Danilo Krummrich wrote:
>> Currently, a Page always owns the underlying struct page.
>>
>> However, sometimes a struct page may be owned by some other entity, e.g.
>> a vmalloc allocation.
>>
>> Hence, introduce BorrowedPage to support such cases, until the Ownable
>> solution lands.
> 
> Are you going to replace it with `&Page` once that lands, or will this
> stay?

Yes, I think we can then use &'a Page instead.
