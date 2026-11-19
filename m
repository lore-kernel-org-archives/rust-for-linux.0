Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102489;
	b=0TX7bWkjXZoxSSBr4FD66ZaGwr87KlKtQG9LuA42BmMUOJwIx51eFXT50QV9SFk9VEdH
	 Y0FIQYcCmmbKPh8/OCawssmXCWi/9aKk097va/7ky3zvNE+d6wETm4qNKL01UarjKDz4G
	 B86h3mwYIjsoHGgJVxyI5QIZgMxGrReclrzjIqJ9NR/XsV3WoCJ8/qMAxQIMeDC1mSIos
	 +51u42EpBPP0bLCCPNPEUyd2vR7eRsbbEsLVkcTvHxExqVL/xvSmgpuhloVmHpnMqXEXn
	 wc4Ho3EbPDcviPMXRXp4pQh/1MLB6e2DimVzNY2UoO6TecEkSTDEZY2drKegg4Nigfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102489;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=ZlsTCsBICLBJ597QEBYNx8FtzkLGCbDoSLusHqWgJeM=;
	b=fvL5eRuXgF15syU8500zEueK+58w6Eu5bPKVviEMQAIvlFk4185hyIa6Q+vf2yHmMW95
	 4aRnI8wwGFNxkzg58VNXx8ge/cU3SI4icXk9yqPJM42iDzlyhyuxQGZADX8TiNarn28r0
	 +3PH73I2CCOeIEgK0HyECam1YVN9LM3DskD3ROABEZlZhqkcfM0OhUHkss00woFV2Nowy
	 FKJALxe3QP9Ei9D7TF7NmWY14Llj3+yMmTWGxyXyNs3/aZLHQu9xy8FNDLnWPWyiQYe+g
	 VaMsUTywFsd2QyuWM57O3iNJTRsK0Nf+wwGTpZZQfLJIZbR+8RpCxVcEXmD3VlL+OMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=em1S4iOC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5C606A320;
	Thu, 19 Nov 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=em1S4iOC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B441F0092A;
	Thu, 19 Nov 2026 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102488;
	bh=ZlsTCsBICLBJ597QEBYNx8FtzkLGCbDoSLusHqWgJeM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=em1S4iOCUTv7C881BZNPp9wI9EhYKy2Zy5dF8x8GynqYkmpnkGYDoojwjWSQJXHbv
	 hsLTQmtJhklrD2YeqpH2NLKbFPU85IJrKjPFQwjKQSBNdD65s5qxkQsyxNVmiR3rLp
	 9lkxzAG4wDEOSxYR1fCltUl7FYvc+NI7jLN5FS23KFXkCLR0mr75EYeqBr6ZIpnBYX
	 1XKJPPgQWisvjFNMyL+EMauFGFf3xAFDNE1XhGEPX83zb8VgCIBJcRSuJNLgAbQ4j1
	 U5jMLtfQ9wGBi9jKsm3p3Qmu3WD5qc5hoRTjXoaQe31EkAW3f21kzbT4QgWCIvTpOi
	 K/QtJpZrXDdyg==
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
Date: Thu, 19 Nov 2026 16:34:43 +0100
Message-Id: <DMZAQ0G6LTTB.1CRPNXSYB4QHG@kernel.org>
Subject: Re: [PATCH] rust: DamFence: Remove warning about unsignaled drop
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
References: <20261112101015.528127-2-phasta@kernel.org>
 <5d466f7c-2e70-4011-be04-9ffdf877b915@amd.com>
 <49298d3a328c1695ea27993f714c20b8a1c05f32.camel@mailbox.org>
 <e2ec8a39-56c3-4274-91ce-60c273904877@amd.com>
 <ab99758408df682c68a3792cc3014b77d6e1c8ab.camel@mailbox.org>
 <c2dd46ea-94d8-4720-af37-897c91809338@amd.com>
 <DMXJ8TBSZJJ4.3HG0OJDI9URTT@kernel.org>
 <8da4a8c0-1740-450c-9cf1-1a7b21d12997@amd.com>
 <DMXMSIQONGUW.1RRNS7I6LACD6@kernel.org>
 <a7f9e0f3-b299-4d40-9230-106003725dc2@amd.com>
 <202dd0c3d515ddfa77a8ec8751badadd31b8a7b0.camel@mailbox.org>
 <141892f8-180c-4157-8c59-6e69057334f2@amd.com>
In-Reply-To: <141892f8-180c-4157-8c59-6e69057334f2@amd.com>

On Thu Nov 19, 2026 at 11:47 AM CET, Christian K=C3=B6nig wrote:
> A dma_fence should *NEVER* signal because you waited for something. Inste=
ad
> the dma_fence is what is waited on.

In the end, despite doing it on behalf of the hardware, the driver is the
producer of the fence. And there are cases where it can't wait on its own f=
ence,
because no one is going to signal it other than the driver itself.

Assume you have an execution context that is torn down, and also assume the
hardware supports preemption. Then some of the jobs in the queue might stil=
l
signal, but some jobs are not processed anymore and hence are not signaled.

For those jobs that did not execute anymore, the fence still has to be sign=
aled.
So the driver has to signal them after it waited on the preemption and exec=
ution
context teardown is complete and no more operations are in flight.

The same is true for job fences that are in a software queue and never hit =
the
queue of the hardware execution context.
