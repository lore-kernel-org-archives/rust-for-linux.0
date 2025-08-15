Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D9A1EBA0D
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 16:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273816; cv=none; b=IytwimvQnH+mhhVHiS7KHQb3WIi5hV5ky1lyv2CzNgoXLQWFTbBjzGYSrp/SX4dfYbY64ZMUn9ntGZJmJgqbPtPkgfRlVKdwK9e79WG18PhcsVj3sU4fqM40z1LFhSCdLXwx9S9n5Yp949MuPcrjFD502CrIc2ij4R+qnYTBPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273816; c=relaxed/simple;
	bh=br+rKR3p1moS7qc2F5Jd6C/AGO9aDxPu37XlsFaEoUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MikWkytUZOFZ/XgRVs/gJginUvkVU3In7AT5baMBAITl5oNQUkiM47O6a7A8ceZ5JKOLqR2wbSEwitBSXGImz0RI09UGNwbSpD4sItZRhVf2FDoxe8ZmuBICqzeEAlckwejbfL3XZ8yItgCaKkghgwddS8VUWud4jHNNkYIHD+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiAR+hHk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiAR+hHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F52DC4CEEB;
	Fri, 15 Aug 2025 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755273816;
	bh=br+rKR3p1moS7qc2F5Jd6C/AGO9aDxPu37XlsFaEoUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LiAR+hHknFiKwMQ7vW/rzRaCYub6B/v3KTAxyR9flDFoneookF6gLT4WCIutkTr8q
	 zM0eB/ghoRIV2nHtbvxBTaZ7AdmmJQwniyk0ajxai4AMHr47irmIZqGnLHgLN/bkDW
	 3YH4TByjCLrey6oBL5UAfwvyLoxcIiMcg0GR5gELMm1ttr7ZUKzrIwXzTstGESEtK8
	 3SyfOczrpDZkdtLx6ZqpyP9DOJQga7sO1WrxzWL2kAptEMAnvTsTwy9k4slLhea8AF
	 YCNcmV4t3Qys9h9WxzUN25DSIPUWZV2AGYzsKrU7jYGOKp0nZen132ohMwYK2stmPr
	 3ButylSdREPeA==
Message-ID: <909d0a86-16df-4469-aa13-1f248f0ce46c@kernel.org>
Date: Fri, 15 Aug 2025 18:03:32 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <CAG7QV93KGmoJ6+if-ZuwBF91x0BVDUKbOegspk2MC8r9OjvA9g@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAG7QV93KGmoJ6+if-ZuwBF91x0BVDUKbOegspk2MC8r9OjvA9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/25 5:40 PM, Igor Korotin wrote:
> Hello Guys
> 
> Preparing v4, I keep thinking if for I2C I should rename `i2c::Device`
> to `i2c::I2cClient` or `i2c::Client`. The reason why I made it `Device`
> for the first iterations is so it would be the same code as for
> PCI/Platform code for example.
> But the original I2C C code has other terminology. Do you think it worth
> keeping it in the Rust code?

I think the reason I2C names this i2c_client and i2c_adapter is that technically
both are I2C devices, hence just i2c_device would have been ambiguous.

What about i2c::ClientDevice and i2c::AdapterDevice?
