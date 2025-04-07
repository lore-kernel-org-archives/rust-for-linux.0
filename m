Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A38224FD
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027806; cv=none; b=ZkJZ4iHD6ZmF8sa/HeMBZXfhMyFEc64tCRVPgzISW+bS+6q5u31faATEPRFfrSa6vvhvI9vXYy4yzWdFBLk3D6c99RlZedf9KpChJTd5rBKzxH6KY7LD+Ebbj+mbRclZI1fWBVOzD/n8bgrlP0d16TdKxPV5ZjAr1fbFPOnnNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027806; c=relaxed/simple;
	bh=pl1S5FSy3mzEpbC7f+1vGV7Eq+Qe8jqtLXn4cITaPUM=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJS5rJtw5UZ0x2AzmGGC4n5TWL23zflpPSiQ1tnaucBkGLLQfyYm4jwjQ8SJFBwUom7XDBZCQY92iDcrurLMpg2X0JvyXLgQFaQiwSOK8iYHPN1OFrWb0PKA/VVwypf2mLQlmPV0qMEpPLx1wCssi1a/IPgTqxwcWnUVkzISXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUPKt654; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUPKt654"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C08C4CEDD;
	Mon,  7 Apr 2025 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744027806;
	bh=pl1S5FSy3mzEpbC7f+1vGV7Eq+Qe8jqtLXn4cITaPUM=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=KUPKt6542swC2Ya+2LO2En/t+OtpDOM4/5VU4dSpzYVI0TvYxJTR+bxfUGTNWYD/N
	 xPNAlQBN+N9NxFHtzE7+z+MZQvSRB5N8/l6HVSlgxd4t96r6HMrmPBDTYukw1yEyKx
	 De+9/czgnVlRVJTJLlCYHUf+b1qHx7mMZjslWDphN7HAMFtEu3ooVAucducu9OQ4ZK
	 IJYFKBlXgYKffnbYDBnZGMl+t/KYwc9kk5CeE7q/WQ1kVjfg7rve31wWA7SRGnu80D
	 4GgJui4SYRYJGLCV6IrAeyr8fG0ufOCCJxjWcrmJGAzqiEvLsSBQdEvi77svkA+DFU
	 GCMToWF9i+ITg==
Message-ID: <aea538cb-2c76-44ae-b67d-2434d978e558@kernel.org>
Date: Mon, 7 Apr 2025 14:10:02 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: alloc: add missing invariant in Vec::set_len()
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
References: <20250315154436.65065-1-dakr@kernel.org>
 <20250315154436.65065-2-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250315154436.65065-2-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/25 4:43 PM, Danilo Krummrich wrote:
> When setting a new length, we have to justify that the set length
> represents the exact number of elements stored in the vector.
> 
> Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to rust/alloc-next, thanks!
