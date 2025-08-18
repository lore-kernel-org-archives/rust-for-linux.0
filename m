Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E73275860;
	Mon, 18 Aug 2025 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549749; cv=none; b=e3nyioTRtDhmboDw2paDBO4pCtatjwgc5vs7+X1OzjGbt+x8MpBKJ3w0k3r1wVGvt8XD0HTW0qxO1rZS9KTIUrb1gM/8K0XKEznxVT8Xln7+YlxE/FmhwbHgMQBRWPNRtsnHC/7eS3QS9OsymbrOl7hawJX2t8m6xH3sZR8fTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549749; c=relaxed/simple;
	bh=ZCBj4rN8098GU0evaL9pJQyYLiiuZtlpD997+0FEYxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htmFR0xbOYpCi7dUgT6Lw2EAiAPfjUhq68neG3AWSzzz/M2hitXjpwdABcgiVKA/4inxYqz2tuQ9S7X9oG5NkbU+TFA64AIHOEq2EHLbbpxRqlWXO0Bw933ju0f+EuBnedkVXSar/eR7RZKe7/ODoABgAuSTpSlU3ry41ghx7Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUNUYSQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUNUYSQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEA6C4CEF1;
	Mon, 18 Aug 2025 20:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755549748;
	bh=ZCBj4rN8098GU0evaL9pJQyYLiiuZtlpD997+0FEYxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YUNUYSQ/fSc0aFpeltNrJnn+4bLq/I+stSSG2u2v5G0AeFZ8PbmnF1MTy6D9q45GV
	 41yUAHSKjzGV27FykX54TERlVDA1c9ggnSRunS8omWBNbcG7HKvx/mDaJZ0Ukl1H+r
	 rEW3ZLhrS1weVqlsvSU8b1jhJtYTrIgO6KsBQN4/oe7AJVEJvbrHsaTsXE1lzSTmB2
	 qcJTHO7rjj9mBLOWDatUyuXnbQsqDWWs19eebJoomUCQyQhx9CWyLZajo/AUHo1sgu
	 5ZnBq1DcC80gjU3jUzlce0iGXatM/g1GXgIQOOdAfSQQ5Kpnj3gamWSzgND87tA604
	 1h59bxp8F7Euw==
Message-ID: <dac09da1-7817-4f04-9723-482db67243ce@kernel.org>
Date: Mon, 18 Aug 2025 22:42:23 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] rust: dma: implement DataDirection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, akpm@linux-foundation.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 acourbot@nvidia.com, jgg@ziepe.ca, lyude@redhat.com, robin.murphy@arm.com,
 daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250815171058.299270-1-dakr@kernel.org>
 <20250815171058.299270-2-dakr@kernel.org> <aKLzrp0m00J6CCYz@google.com>
 <DC5INEG2DXU5.DM4JIICEQ2PC@kernel.org>
 <CANiq72ncROtm8Qkv_W95_Gigb1aVhq85zZ37itN-jHGDgTUJMA@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CANiq72ncROtm8Qkv_W95_Gigb1aVhq85zZ37itN-jHGDgTUJMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/25 1:56 PM, Miguel Ojeda wrote:
> I hope that helps.

It does -- thanks for writing this up!
