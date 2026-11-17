Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923411;
	b=MXpZcdZ4hyXXF3LbRgZbU7q+QKBh0wqZrdA0A3IgJh/raBCjSulzDI5vIXHKerg0h4+U
	 Hh5sUFQiXEP4QvE7O2dLV3hNiHItLPhJ+o9Tw6rCoS5MavogRyc3m6g/+LuqNsZJzCcI7
	 qIEjIbqpg8lHnMPs4HghHg0oj3rSuJzRxLm8EOaRakyolouRJNvy2Ecif/Kng02j0TBnR
	 N+pCCgCUo/Q3LMZTAtUAlROcgJez4nBKB9Y+vyDDb/a76vtDknSFATTGJ51Z3blfawmDk
	 xQm9Wf/w5ks3YmifFTHou+J8gA3/23uboxhIWPgUDyEkR8BasaZaob0egVc/tsnzXIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923411;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=1o4o8OU/LTUKe0c4Pab57k6q3vQbpxxV5mCVPeRuL3o=;
	b=17c4Dr0xCVoC0AkH05BLirbBGGbC7EkX3+8yTt6Ge3MTp2WJGmzEmHGbwi7N1P5y5tUA
	 9JlFb5IxFNRKb9GBL6kPvDTuD++GY15jyg+uBL5Y9Tsef8TzrPKzULTZ662zCP6/juP6e
	 0ktlWAFByEPCu/a/k7ClZ4lppQApE6gDzokk/Wi3XbTaymxDEp0YivJTpY8AW0l2jirUh
	 flv6dY3Sg+jRKYDWr0FzFPHD67f7SbafncNl7OvLQvzNo7Gy7opeJXLy5EsQo6g2lXNbS
	 roYyzpuwpgEKQS/CpAxUuH9/Q5HPNTLVX4Ejbjt4ygtfoLcBFeFhrSQ4gSOQufuSwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mwj+1W86;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB0606A323;
	Tue, 17 Nov 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mwj+1W86
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711D01F000CA;
	Tue, 17 Nov 2026 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923410;
	bh=1o4o8OU/LTUKe0c4Pab57k6q3vQbpxxV5mCVPeRuL3o=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Mwj+1W86/Y/8v2cZtnYY838nYHLxs7WiSVqv6DjPWOE1U6N0KqyaklL1htWHwywyM
	 PZcfIRPuvPLY7+G+fxikiJAKqliw18DXBdIYcweVwkE0Y05KCwnKqUBtWjnsG0Sdk6
	 DXAGcG5mlbwK6JGHoWVR8y4ELSRQwIJkNDLxk8BpzjVh9YC74Z7x3llK9tV694CwMw
	 xXLUdjoQyBmqxtSBbGeOm+jZD1NQI2vOrr0DSBy+cVCNCnbOXoZJsngbITcbYWKP41
	 s0dEbuoU4VpRXfs7JGgyAc2e6aIxckWRpElB3t4Y1ZmWShAs4c+yq8ZL4V93tjKubX
	 z2A71PEF4BpfA==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:50:06 +0100
Message-Id: <DMXJ8TBSZJJ4.3HG0OJDI9URTT@kernel.org>
Cc: <phasta@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: DamFence: Remove warning about unsignaled drop
References: <20261112101015.528127-2-phasta@kernel.org>
 <5d466f7c-2e70-4011-be04-9ffdf877b915@amd.com>
 <49298d3a328c1695ea27993f714c20b8a1c05f32.camel@mailbox.org>
 <e2ec8a39-56c3-4274-91ce-60c273904877@amd.com>
 <ab99758408df682c68a3792cc3014b77d6e1c8ab.camel@mailbox.org>
 <c2dd46ea-94d8-4720-af37-897c91809338@amd.com>
In-Reply-To: <c2dd46ea-94d8-4720-af37-897c91809338@amd.com>

On Tue Nov 17, 2026 at 2:40 PM CET, Christian K=C3=B6nig wrote:
> On 11/17/26 11:54, Philipp Stanner wrote:
>> On Tue, 2026-11-17 at 10:51 +0100, Christian K=C3=B6nig wrote:
>>> On 11/17/26 09:24, Philipp Stanner wrote:
>>>> struct DriverFoo {
>>>> 	f: DriverFence<()>,
>>>> }
>>>>
>>>> impl Drop for Driver Foo {
>>>> 	pub fn drop(&mut self) {
>>>> 		// Signals fence implicitly & automatically.
>>>> 		self.f.signal(ECANCELED);
>>>> 	}
>>>> }
>>>
>>> Yeah, exactly that is still a bad idea :) See the HW eventually
>>> doesn't necessarily stop doing DMA if you unload the driver.
>>=20
>> I know.
>>=20
>>> So just signaling all fences with ECANCELED is not enough.
>>=20
>>=20
>> Yes. What I was trying to tell you as that you have no way to enforce
>> this in Rust or C.
>>=20
>> dma_fence_signal(f);
>> free_driver_resources();
>> // Driver forgets to stop the hardware. Memory corruption occurs.
>>=20
>> You see? Neither your BUG_ON() or WARN_ON() saves you if the driver
>> does it like that, no matter the programming language. You cannot
>> prevent it.
>>=20
>> The only one who understands how the hardware works is the driver. The
>> only one who can stop it is the driver.
>>=20
>> In Rust, the place where a driver drops its JobQueue is the same place
>> where it has to halt its GPU ring correctly. Enforcing this cannot be
>> done by dma_fence code.
>
> I completely agree that we can't fix things from the dma_fence code, but =
it is our obligation to tell the user that something very very bad happened=
.

That's the point, we can't infer that "something very bad happened" from
dma::DriverFence being dropped unsignaled.

In Rust we use the RAII pattern, and drivers structurally embed a
dma::DriverFence within the struct that represents the corresponding hardwa=
re /
firmware queue (e.g. through Jobqueue).

Consequently, if dma::DriverFence drops unsignaled it means that the destru=
ctor
of the structure that embeds it (which does the required HW teardown) did r=
un
already.
