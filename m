Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9E2F9C24
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755278178; cv=none; b=isPtMzA72FPZkRlQilzi9//X+ZTaeaov8NkOEG9Gi+G8mRdkPnE7Q4ASE55IaKzEmRhEjBjKG1m3vJh11UtCiNsjVA8zWU1i5HGafcAQuNXjdQyN47JA87TRt8T6eu1W6KnyQbgX76En6j9tKD34tufwzDVmH8P8SM+D162MtJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755278178; c=relaxed/simple;
	bh=JWsmt4TorwLFKfu+JFWU2wi8NjOnUSzauS43YdJ+PJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRB0m93AMsRMe2DeWGCfqp5LLbRmUWlLvuk3U4Gsgcuoqp19l/kqEuX0fmjGyWDjF46qVzIRYT/E2XmHCrVOHkjK8tDiqZIxeyy1FhB8tmDvkLL5XWpUX07Xf/DyZUqChlrhi5iVwxDg195c6m0ma7Aq7oqmElFeju2jOofNR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajUmQ7Mv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajUmQ7Mv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0E4C4CEEB;
	Fri, 15 Aug 2025 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755278177;
	bh=JWsmt4TorwLFKfu+JFWU2wi8NjOnUSzauS43YdJ+PJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ajUmQ7MvWnng6Eg1LOGTGPDCrF6/UGB2cGleUfwnJFxkxtAiYG7Z/VhQ7zJtICRxW
	 7I2Bckdp1ZBy3Dk++SAFOXZC29+mVkqoXyy+CG0MxxznYveKVdfTVXbYCUbLlH34H/
	 cc8KmsUAn9rV592hBy7cc2Sssza3jsd+gLo2iKXSX+WUDgmfaItXYNoaM8Fxz/SqMB
	 qHhejKI6B67kBeIW0dt1KxzT5INfBXxn0LLzW0+NEC0A9lAv2AxOiH2PYWaMSZnTee
	 Q4sDJgr5SNp1fkmvqy077pl2K6GDhyobk8Qy4CnZcS2arOvCkFkIzT2GGh9b1iB13x
	 92eYWoxO/qOiw==
Message-ID: <be2b524e-4b1d-451c-b2f6-999ef0a368a5@kernel.org>
Date: Fri, 15 Aug 2025 19:16:13 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
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
 <909d0a86-16df-4469-aa13-1f248f0ce46c@kernel.org>
 <2025081514-filter-unfunded-e312@gregkh>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <2025081514-filter-unfunded-e312@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/25 7:04 PM, Greg KH wrote:
> I would try to keep them matching the same as the C side, as
> i2c_client_device and i2c_adapter_device wouldn't make much sense there
> either.

Another option would be separate modules, i.e. i2c::client::Device and
i2c::adapter::Device.

But I guess just i2c::Client and i2c::Adapter are fine too.

The former would fit a bit better into the existing Rust naming scheme, the
latter matches a bit better with the C code.
