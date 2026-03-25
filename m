Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B43E9F7A;
	Wed, 25 Mar 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450025; cv=none; b=Cg7ldOKkv9BJkgIMe92i6qc+kZUPXDbElMTlvJaY3ZeeNrTz61U4ZbBnJvf7bVk1FyjXfBjz/MJrZyxwPGeMbrAuVnHtowColtMcV4RSAoWych7RGFgQT1e89HGR1aSTZZGOa12aKU+dBNrQCp32XaFNAUJRBxBqZOG/Jozwtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450025; c=relaxed/simple;
	bh=JCkHCcMSXx/SH5QNREKTXs5UKLFyI2shlYFECOVHDjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFqGh04FBRz3q+4RHzg4+Tmdh9JbyPz5x+/r95ScWnhQioE4aeQzIrfaNHeLfJ16Cxs40J/dh/Dijh73FsZ1NohAEneDkXGLaSIPhHDvW5RtvHY/s4F7QYroSFpc89cynj2tThUON6z5e0YEotBgtqGt4QhDfJByaTx+uRRD+lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACjLKRP6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACjLKRP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65550C19423;
	Wed, 25 Mar 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774450024;
	bh=JCkHCcMSXx/SH5QNREKTXs5UKLFyI2shlYFECOVHDjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACjLKRP6WLjmtHAUiVk6vUGQ8g4pcVYEy+cfD27z5i5FCrB5GOMtjuxiETqZGCgBC
	 d7WcctHAiUWcUUH0ERJEgJurResU9IJTn70DfWakzVF8TcZzXgMyVys3czZLoFSyVZ
	 EswJzzA7lry0SJGZGFQEzstvRxVixw5fToPLZ/C+cYOezjapKPKKpx13a11n/YgoDI
	 KWKjJ1b0qrRBEV8DmQt7IVlQ+P9uodoaxf6qwcbamMy0hMu03dwZEZ4blK9ruguDmA
	 LtkP8FvODGMcg4Un5llA/s0xq3CAcOe3XWLleTs/061c61euupBDiL8CbW+uVt/+jO
	 Eo8K06CPUdqGw==
Message-ID: <f3db51e4-b175-4f0d-b6d5-30970a57c173@kernel.org>
Date: Wed, 25 Mar 2026 15:46:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] gpu: nova-core: convert registers to use the
 kernel register macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260325-b4-nova-register-v4-0-bdf172f0f6ca@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260325-b4-nova-register-v4-0-bdf172f0f6ca@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 3:46 AM, Alexandre Courbot wrote:
> Alexandre Courbot (10):
>       gpu: nova-core: introduce `bounded_enum` macro
>       gpu: nova-core: convert PMC registers to kernel register macro
>       gpu: nova-core: convert PBUS registers to kernel register macro
>       gpu: nova-core: convert PFB registers to kernel register macro
>       gpu: nova-core: convert GC6 registers to kernel register macro
>       gpu: nova-core: convert FUSE registers to kernel register macro
>       gpu: nova-core: convert PDISP registers to kernel register macro
>       gpu: nova-core: convert falcon registers to kernel register macro
>       gpu: nova-core: remove `io::` qualifier to register macro invocations
>       Documentation: nova: remove register abstraction task

Acked-by: Danilo Krummrich <dakr@kernel.org>
