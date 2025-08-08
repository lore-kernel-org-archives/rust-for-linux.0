Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8CC266584
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644125; cv=none; b=RmgGeAmS1SdFIGoYY44ow13JY8lGRSaqv3XtUKu0L9DrTqbiVz04BOrknImT/ax6Hev+MND2hMmZyvYa1O3qB7+E/bJkU/NmTJQymflR0ggNqBXLc7yx1CUZ4YOER9CughdpCfZn0gNzD7RvGusYiEuS8RgiF3vraowMdiVbOIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644125; c=relaxed/simple;
	bh=orqIRV9M83QzLlKk7w75UzfOFflBzRO5k7suajlGkcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ1D5NxpegQmHsSK0nKZAJWzavRDaIXAF/7k3c9dU2tw/cwwpcFoHtvF7+rIWejyoTePm/u2nwF1VqSUA45RZkCqY+OdoaOeoyCsvQSiyR34PvtMQvIrAGwLCyT3AKdzKBMt63svjMciIdyxSw1N8jvLhlko8PaO5/j6QWHmJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbjZs7W0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbjZs7W0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A94C4CEED;
	Fri,  8 Aug 2025 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754644123;
	bh=orqIRV9M83QzLlKk7w75UzfOFflBzRO5k7suajlGkcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BbjZs7W0whz3ZBIZpXRym/HxOgj7y97HL0WaW+XvMBsnFz7PR6dZz3iegducjRasM
	 LRBtzWu2ZEIvw3EUya6NQzzmKtRQ6gftHZS0jiapIWKHx9dctkbU3oiUg6oqIW8N+m
	 VZHPlgQ34ccNa3S4KkWnIAY6wAcVI2dohJLMWMxaOjOvNgke3gXvry9nbIbQiQMTB+
	 rn0LFyzceJP6nfD0CNGfp8ntrddWDU03D6yFAHKBqlcjHvb6drSPbmMMTik38lllNC
	 pfIvBqaZseoRgxgQGaMjVAEoqGsTrCcUnMIf3oVpGevI/OCAsvEHVkjdJ7DkVMMUUB
	 MU5QjIII2WycQ==
Message-ID: <b194c9e2-7140-4808-a230-fefa2baa97b3@kernel.org>
Date: Fri, 8 Aug 2025 11:08:38 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] rust: page: define PageOwner trait
To: Alice Ryhl <aliceryhl@google.com>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-3-dakr@kernel.org> <aJW7WnWWfCDbGsWp@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aJW7WnWWfCDbGsWp@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/25 10:54 AM, Alice Ryhl wrote:
> Either way, I think the implementation of VBox and VVec could be merged
> to some shared VmallocPageIter that iterates a region of pages.

I really like this idea. A VmallocPageIter type allows us to make more
assumptions about the pages, e.g. that they're (contiguously) mapped in the
virtual address space, which is useful as well.

I'm going to drop the PageOwner trait for now and provide a VmallocPageIter type
instead.

- Danilo
