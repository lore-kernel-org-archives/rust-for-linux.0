Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF213E8C68;
	Mon,  9 Mar 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081726; cv=none; b=ScyBO5yU6MlIQyrXZHBNcU8kjnUdhxFKCXxRrVTxTLijFsZgJpjXyRduaJ35LrfKe5BWrJAnK+WYfOY1Ap2Ih/cx9d+EQIQgDKMR2FENDffccCgWJ2Jshd3Oj7GvCiAk5TmcZBN1b1xIG+rletcMIPiCYV+U1PTkBGhNOYBVEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081726; c=relaxed/simple;
	bh=r/cU1KShruG6ecs9A5kxfJ1Mq4uP7CrBfYEwXpSlHIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=f98adgXonYOB5nUhCxQYRSIRkIzAPAWvcnBLHoYTm4MTDFg+ux4FXKM6/MYcdive7vasnvTRBSMN0CB6agPcVl897rhdanheHowO+GQTRwHO0H9K/p3puUsQy0dDZuvnEm8OV6biVUs9aFaywDQN3tOqPWJUxM3xnZEmtHMMSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guXoeHu+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guXoeHu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B7BC2BC9E;
	Mon,  9 Mar 2026 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773081726;
	bh=r/cU1KShruG6ecs9A5kxfJ1Mq4uP7CrBfYEwXpSlHIA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=guXoeHu+x1iH1aF8sz8pPaIk1r90eu9vLxq0pXld6++8vTk6WdDCYx+2lqraqVQ99
	 VggOETnphOoJoEm+VTCohTtbDUpGMtDt1kOSaJ+V8fBzkiGtSCxu7Nq1UA3WhMKdu3
	 cAVxi3+lAjmfBorBVllh3XZADbvNtD+pExXDsbfr5SVXl3e4pomjI0BXaiBJq+dXZj
	 fjdCHOGnxZs9AS6ytnqVokZV3Y44Tu702BlZKYYsq5FtRu+UkgwRkvyYa8rYqmgCVc
	 rA3turEIbL5LT42BFA7380S/Rs978frimAPejQ9MXo3uLKr54zVHS5/aGQArHfJsUY
	 KXUpUaq1N8tUg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 19:42:00 +0100
Message-Id: <DGYH0HGYXAHS.XZ9FXJCXDZ0Y@kernel.org>
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
Cc: "Gary Guo" <gary@garyguo.net>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
 <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
 <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
 <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>
In-Reply-To: <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>

On Mon Mar 9, 2026 at 7:34 PM CET, John Hubbard wrote:
> On 3/9/26 11:28 AM, Gary Guo wrote:
>> On Mon Mar 9, 2026 at 6:01 PM GMT, John Hubbard wrote:
>>> On 3/9/26 10:51 AM, Joel Fernandes wrote:
>>>> On 3/9/2026 1:34 PM, John Hubbard wrote:
>>>>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>>>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>> ...
>>> What about this instead (*very* approximately):
>>>
>>>    // set up or construct NV_PFALCON_FALCON_MAILBOX1:
>>>
>>>    let reg =3D NV_PFALCON_FALCON_MAILBOX1::zeroed(&bar);
>>=20
>> This doesn't really make sense. What does "zeroed(&bar)" even mean? You'=
re
>> neither zeroing the register on the bar, nor constructing a zeroed value=
?
>>=20
>
> The idea was to separate constructing with a zeroed value, from
> the actual register write. I am not surprised that the syntax
> is All Wrong at this point, I'm just hoping to spark more ideas
> about how to make this clear and nice to read.

This is where you would use write_val(), i.e.

	// Construct with some custom constructor.
	let reg =3D regs::NV_PFALCON_FALCON_MAILBOX1::new(...);

	bar.write_val(reg);
