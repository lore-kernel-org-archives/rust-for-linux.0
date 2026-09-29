Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E273DFC74;
	Tue, 29 Sep 2026 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709459; cv=none; b=tZ2s/CLFmU+b9GUWQa48rWfITa89CpaY5QnltIMTlUUk5GhSmB1Ltd5AXlwQCXwYy9JQ7p8HnvFf2XA+AqNW/CevzttSvkZMqopAnGvjbsxfbnHtPijZcseFzge6svBgpDBAkPVpBAqkXQpjvmCTyW27W0wU/dNd/eJnzpaiC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709459; c=relaxed/simple;
	bh=VCBKCttqeOdFeuIcNpq6nY4WBNtkUAZhKVDYxuWIoOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqYgFunJI/5e0ucd8MdQ7xZ/gk0lmlJtTXL47din/gE6Hr0Oj+PhtNxCpL9Mu0iEl8cEHuEHg0kAUVNFsCJU3iIDkZO0CGcLOSJmlwa3nYKX5PDBzegR8fKz/N3KNStAoZtGwi0Zyzqa0CqOWvlGk/CUsylfL3fEkj3egDGBrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7bRnt5N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7bRnt5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E33B1F000FF;
	Tue, 29 Sep 2026 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790709458;
	bh=Sj7mNn5u5Nq1jHVdJ0dFTacFxEkvlX0Q/cUx3s3Y2Hc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F7bRnt5NZoU5lZnFdpA/DvFcSWSleQ09E61MguQN4KByzu+96wdklm2PYYU7PrXqA
	 F7xFQLZAa9r8tpw/f4iA80gsh8UL4hPLo8w+umx7lok1y9nzfEumHM3zWasoLO47YE
	 7KLQdN/Uw1fsp7b/C5NnXVxfxre5rDwP4kM70kY51bMEouOBR8aPJfvoBVHnb0ljqW
	 /iv4U1qNyUFWUa5PRgG40M42UtbCfqPzc+UyUCkL5dPraC8C+3/JogkXhFgk0L4BaZ
	 IThu01uQ/45Y7G0FIshbXirp7fc8yZXjt2KFsA8+HLCKzVaNG1lqSqUE6IbRkJ2oJ1
	 lIP/MeS3k9OEQ==
Message-ID: <ed541068-ac4b-4bb3-95f2-02b3a3a1e62f@kernel.org>
Date: Tue, 29 Sep 2026 21:17:33 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: pin-init: internal: init: allow reborrow of
 `Pin<&mut T>` bindings
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
 <20260928-dev-pin-init-sync-v1-1-e591c8e9cf0e@garyguo.net>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260928-dev-pin-init-sync-v1-1-e591c8e9cf0e@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 7:32 PM, Gary Guo wrote:
> Use `let mut` for created bindings of initialized field, so `Pin<&mut T>`
> bindings may be reborrowed in subsequent initializers or code blocks.
> 
> Without `let mut`, attempt to reborrow can produce error (and also a
> confusing fix):
> 
>     error[E0596]: cannot borrow `gpu` as mutable, as it is not declared as mutable
>        --> drivers/gpu/nova-core/driver.rs:129:17
>         |
>     129 |                 gpu.as_mut().run_selftests(pdev);
>         |                 ^^^ cannot borrow as mutable
>         |
>     help: consider changing this to be mutable                                                                                                                                                                                  |
>     119 |             mut gpu <- Gpu::new(
>         |             +++
> 
>     error: aborting due to 1 previous error
> 
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Closes: https://lore.kernel.org/nova-gpu/DLQXWXRP3P1J.28SLFOJJQ2EDK@kernel.org/
> Signed-off-by: Gary Guo <gary@garyguo.net>
Tested-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
