Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298E1E5B9A
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754320641; cv=none; b=dIwicwjchWu6BZHqfJdgYGsSGUU3Rz1sGieIHwM6lhylXFGpjF4+plbYYy0jodVraLyMbZFPDpPf1q46kow7mtonZXVCmdJIk28LEeXrCwde9o/ED55nIZDo8cNa8P6kKMFTukFvff4RPWtGCn2dYDYn4NFfoFFhyH4w0E2Xv6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754320641; c=relaxed/simple;
	bh=GXCowVLWdFbKLFB6oEN7V2uuqmaTwlrFtDBsL1NXUhU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=dqE02PC1xSdSzd41lm79dNt2JlUEQOBk93FuKofnT3clCG+O9jtyhrlO0b7IG2sp+lK94WZMh2v2NfYlkMD3F8OlQOarg3pNqqmqCabWoYK3iz9SqD4KGXDxz5t+dkbhOgKcdTo3VCyp0uJNma/aFoOYpcrbrfPLCkXGyE7urv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edWbKBPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edWbKBPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC45C4CEF0;
	Mon,  4 Aug 2025 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754320640;
	bh=GXCowVLWdFbKLFB6oEN7V2uuqmaTwlrFtDBsL1NXUhU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=edWbKBPOUFI5R2XEhs1JEX+bmy1WBvGGMR96cvwR8ZPf6Tk18SPMbtKbAyXAFWfKw
	 bq0IrEFun74/J+cW6Hqv44vvL/QIKzVInxlDOPMTW38Xarxacy0A++E25iWCGrFQ5i
	 Eru9/4j3skVY2zj2koiv1z+zVv/oojl2HpuypaMTF3oLeqokNWRV4wZq+pzjaKrRrW
	 zfQD0gMqCZ8JpnkPGi/iskHcLVckrwtGOnMy+lA3xreJe4KfVDs0b3noe1zu8VrryM
	 E8q8ffyRH2XV0P+qwnUdYH6+SqSCereA44B4x3C4gVKB2/3ODOjOcR9uEhOICbv0er
	 wos/VNMPlLpyA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 17:17:16 +0200
Message-Id: <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
In-Reply-To: <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>

On Mon Aug 4, 2025 at 4:58 PM CEST, Igor Korotin wrote:
> On 8/2/25 01:00, Danilo Krummrich wrote:
>> On Fri Aug 1, 2025 at 5:40 PM CEST, Igor Korotin wrote:
>>> +M:	Igor Korotin <igor.korotin.linux@gmail.com>
>>> +R:	Danilo Krummrich <dakr@kernel.org>
>>=20
>> If you'd like me to keep an eye on this as well, this is fine with me.
>>=20
>
> Yeah. I really need your help if you don't mind. Thanks.
>
> Could you also briefly tell me finally which tree for patches should I
> use, how do I do it and if I need to represent it in the MAINTAINERS
> file somehow?

Given that Wolfram said that he prefers you to maintain the code under a
separate entry and send him PRs, you would need your own git tree where you
pick up patches, which you then send as a PR to Wolfram.

The link to the tree should go under "T:" in the MAINTAINERS file in the en=
try
your patch already contains.

I understand you haven't been a maintainer so far and haven't picked up pat=
ches
and send pull requests, so it can be a bit much in the beginning.

A good place to start is the "Kernel Maintainer Handbook" [1].

Additionally, if you're willing to pick up this responsibility, I'd happy t=
o
offer you a call where we could go through the details of applying patches =
and
send PRs and clarify questions to ensure it's going to be a smooth experien=
ce
for everyone involved.

Once things are in place, you should clarify with Wolfram when in the relea=
se
cycle he expects you to send PRs, i.e. until which -rc before the merge win=
dow
for new patches, and if he has any additional expectations.

I know it may look a bit complicated at a first glance, but it's not as
complicated as it may appear either. :)

[1] https://docs.kernel.org/maintainer/index.html
