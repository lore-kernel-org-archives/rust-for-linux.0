Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124B8F7D
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761498261; cv=none; b=renU6pZiEPe1pIdfuqBYzUPpbDIoHz0G5KaBkc4KL4odlkS+sxLl0bjghfN568Z6LJU/iMDCy+VKRnWw8NWZhZ9FU2nP6NAzxLpNfSjeegm2D4Yr6AHX2AUgfMhyH5II1hn1rvmu8KrM/OETaXqR1gsN8bgvhAKcWSXOGje3q8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761498261; c=relaxed/simple;
	bh=Y1UMPiK8P+mk6WWxCS88wB0FuR6Q2XQA20IagD29o3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NX8W3g4tH7QB/ImeDtp29wbc7gHU7MdVtkPfYFZdpjGiR0XoMYJ3lDVQNwA72/BzCstkRFdGtRKflLYVEgfS7BWtK/BVfoNYuM79tf+vJGJK0ak5D4w/RiyoXO8+NNIZ+iN+RYHwMBSa3tOHkjJEKZxlqkKmee+RYoVqiEmMiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGbPks/3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGbPks/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285BCC4CEE7;
	Sun, 26 Oct 2025 17:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761498260;
	bh=Y1UMPiK8P+mk6WWxCS88wB0FuR6Q2XQA20IagD29o3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aGbPks/3Jf+dZBVbdv+q/+cC1gtD3SD6bOxgWAI+uIVHpXvAMuDoYOVU1AwqOEpog
	 WhJKaj4JzS68x2Za3FPMuoAaaCEi/kfrv36HE2Btyt6gquePeduBQlAI8HaSJa+/1i
	 Sl4a0KrJ8XuB16FLUOyX1pkA6rJW9WN6SzGExPYLSWIistiEvO+cDGb5UrsgkGdhxG
	 Zdk0/Jh/T1CKXBnEaPvDBrslqqP1AGE+6eHe3lmjJd0+cYavPi3naEF+gDQ4BNvq3p
	 gLZvQ9OvrInwK56+jKruiu0ZEXteYm5dWTYEBS7FqX4gHO7OD/PmigKtLXbQIXwWvs
	 0hGOAfBCRi/Ww==
Message-ID: <9c2e2e8f-ac61-4d7a-90be-7d9a7d2169c9@kernel.org>
Date: Sun, 26 Oct 2025 18:04:16 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rust: simplify read_poll_timeout's example code
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
References: <20251023061124.2582749-1-fujita.tomonori@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251023061124.2582749-1-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/25 8:11 AM, FUJITA Tomonori wrote:
> - Drop unnecessary Result's '<()>'
> - Use '?' instead of match
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Applied to driver-core-testing, thanks!
