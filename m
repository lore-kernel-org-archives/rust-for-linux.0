Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7E260569;
	Tue, 30 Sep 2025 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238989; cv=none; b=LLls8KWWjOvsxXdK6njNYm6W2rDfYxPGqLEmrDVcBVev3QqqbgYvOyRvIn6mEVknRVifstwx6S473vMrwRqqyhM++taCGYd8HLVIhMMwYONayKAjjnPE5NGryG8KI1TYUTCm4ZgOp86tWvEcMtp4trBvHp+Au6XGx90uTttIGFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238989; c=relaxed/simple;
	bh=2mNRkO9895KuplaO7v8bPeKZOuVQGEIkzl/k8sMNe6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUflAHB371FchaBwTw4jdiZCqzaCK7+2Hg3D8IwmaybDM1yyf6e+B0GdSdfgZxfvDYuegB72FIOgmyox99YzuGXZl7fnPeRBDXbGIyO/WChoPzuS0RixEQq41cJY4rjGAiEL2X6oFmXqxXLhd7rfMYrREIsKNIlGXUxyJhNLNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9x7ZUq5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9x7ZUq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855C9C4CEF0;
	Tue, 30 Sep 2025 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759238987;
	bh=2mNRkO9895KuplaO7v8bPeKZOuVQGEIkzl/k8sMNe6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O9x7ZUq5o9iok8ZSoYSD3MeFOL8wFGM/+3o8IGsH8vIbhMoKyXUbAvCkPohxzsPMe
	 NAX9a/Ri6mfQYXWz3e7T3qAWjKWvNlTE/f+zRWgIT1arWSYmBSP7n0lryE9UskNAhy
	 lUyj0VM5/dnhReNfmz2Hj4nGA+5bNExU6rOTeL4Mw0cuUuD7HpAacW0BV3kDV+LSQG
	 JyZIjIacD6YZ+JfRw03VvUdjrnEaZU3IWXvOAHMIwBrldSUQvTXJmsXL2McDqb7O9N
	 dVoFCukBipxWDvYRSNP6Rx2+KXVqUVrKwYqF789RAbds5fifyRyhfXi2yZhtXnTcPl
	 jGGvxvHqPjvsQ==
Message-ID: <94bbd268-efbe-4ff6-ba09-e6254709d981@kernel.org>
Date: Tue, 30 Sep 2025 15:29:41 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] gpu: nova-core: Set correct DMA mask
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-2-apopple@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930131648.411720-2-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/25 3:16 PM, Alistair Popple wrote:
> +        // SAFETY: No DMA allocations have been made yet
> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };

I think you forgot to derive the value from the relevant sources, i.e. physical
bus, DMA controller and MMU capabilities.

I assume not all GPU architectures / generations have the exact same capabilities?
