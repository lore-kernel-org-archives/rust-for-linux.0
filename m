Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F637328B56
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929730; cv=none; b=IVX3TrdSv0NZX1apfULa9+1hkjYnUF6U0pw+R4svt0lsgcMtI5LayNYF9grpY1U3bc026IXM0babugUr4nEJDoBdsBD+z8N0XMuET3DUOdrGmCfIyQINJGb8/Z98HqfFv7Kpzb8L3bbZ/a3p3Ax/9ew6SdCZ8FeKbsjH4ueiHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929730; c=relaxed/simple;
	bh=GFd9OX1E0ttnKDBk7lEXaYdIxkvaDPofJurI1ez2jZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jin8rCjpcQauo//uapzt/om1QeHDJ6OxoA2kTxy5ofFZ6N6qU1SYQMZ8O9M6oXyiZHGaRN7V1ZlAwV4W8eonfeZPZe06//yv16GcYRCUfFDOs67G2cgSGv/l8/1Y/XlRymdXUqoxUS2/xJkq6xIUr5v5Qvq4P6MXmMiNK9GhnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpYV6Vxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpYV6Vxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E55C2BC9E;
	Thu, 19 Mar 2026 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929730;
	bh=GFd9OX1E0ttnKDBk7lEXaYdIxkvaDPofJurI1ez2jZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SpYV6VxqvyFEJryAOv1LOBOvevmheztsRq7b8T2jNYu6ecXm47jsmrf7ySuMnOd6/
	 EFsnefLI3lAXc1THEfOMoGbNZdN+ZfLHIU59SFlcC5c7Jwpe+LHEKK3B9tGjFQeg7f
	 Mbks1whJN4rQhOraB73wwBQwFXLBShI7YhZm95CDkRiHugpvwN+W+xN1NY8LN9u2s3
	 D95j8FwGao0NSeHftmHg2wQVwBwNWOOte6b+cW4DcaqjpNwPj/bxsgdTJsoWf3f9pO
	 7TH4r99Ys1yINSgeO2e8gsce7lwXJWZJhGP9BZG5bnOjU5Df4JpCt8X/TtxcCSh0NU
	 WI+1bFjnLdtdg==
Message-ID: <485e483d-7891-4afc-a54f-ede43ca61505@kernel.org>
Date: Thu, 19 Mar 2026 15:15:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] add `const_assert!` macro and rework documentation
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org
References: <20260319121653.2975748-1-gary@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260319121653.2975748-1-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/26 1:16 PM, Gary Guo wrote:
> Gary Guo (4):
>   rust: move `static_assert` into `build_assert`
>   rust: add `const_assert!` macro
>   rust: rework `build_assert!` documentation
>   rust: make `build_assert` module the home of related macros

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
