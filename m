Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C830DD22
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291637; cv=none; b=u/IrW5sGyGjq+bAFOXP58CkWMLDksRu628tA7UcT37XVoMilvHCWmgMPReTIpNfS8+F9Zt9ajqJcIum753e28ML3t3G00JQ02iUnZvwAzG5O/M6eCMrqrwCAqR99w44R5ASqjEnIJ6HRUVLt/ryi/3aIyNsFSBDjeK+OUGJMyJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291637; c=relaxed/simple;
	bh=TTHTXJt83ALxjr+yUzHti+FoTuDBvG/pqILAXGGeGlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLI67EQxzN/lH1mf+o/BbYMw2MAsdAICHIgcVERkxoHgYnwMeXeO0kotHMqBeByZTGbNGO4cqDEQX3/7Bcl3Gcu3r7Jv3HAJXJS4JJb82CDVGYmL/IlgRkQHj/0d+WimjztQ3BU0sBoyd9YBm7WaBLFGhfNdKmKV11nzkmmT2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nRlW5aQ9; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nRlW5aQ9"
Message-ID: <90810e54-3324-4100-9f04-1d4d07b20ead@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774291634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g04j2l5AnklBvTNbVGTOahoaCezXLNLq2ZFE/SIOGNo=;
	b=nRlW5aQ9s/fVxNfoe7rpN1GBdJlSMpftYsAWg0hhn5nyJogfmgpKZvcmJcoal7qoGPjyYH
	ID5Hm9Xiq9q3RkxoY3uxRjmaWVWpOi15hpbDxUtpa02BJ5EUeUs8NHQSM/iq0j69ec4gmO
	of27cQBzU56ro9X+QbBT2SmKs5iFKsM=
Date: Mon, 23 Mar 2026 18:46:55 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
To: Danilo Krummrich <dakr@kernel.org>,
 Igor Korotin via B4 Relay <devnull+igor.korotin.linux.gmail.com@kernel.org>
Cc: igor.korotin.linux@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
 <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 3/23/2026 4:31 PM, Danilo Krummrich wrote:
> (Cc: Wolfram)
> 
> On Mon Mar 23, 2026 at 5:06 PM CET, Igor Korotin via B4 Relay wrote:
>> +T:	git https://github.com/ipv6forever/linux.git rust-i2c-next
> 
> I assume you plan to send the corresponding PRs to Wolfram?

Yes, I plan to send pull requests to Wolfram.

I’ll make sure to include Wolfram in the addresses next time

Thanks
Igor
