Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924413;
	b=zcBdd2cOd9UTh7gYAhlr8FQJ+vVPa1wyrM5stOvwKJSqTiTNRHxcHUbWu7Z1cMD7kob1
	 K2RMitB+8pskxaqrp8HOXAim2wZdoE+lG6LfYUQVkKSkI+riWDiT5xgksEfn61BkrwaqH
	 UkcVhkJ5y9S0LCYpqCwH1LUqJOS3S+T2y6I2lr/bpSuH3BZNfV5W0dioIysUASbVlED0R
	 5TltRJSSf33f7FIdwujzEm9/tfEDq19D7vWX7pOdgOUfazjIbpaHZURlsk8Ofrs+USEz/
	 UyjgKOu8+TEDs9KspT1cCPjzrUYNk5TJMQnP6FaMKuQdKKaJj49CXWMLCKeUtPiGrpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924413;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=ns0XAWcR6vSuKym0Hs01xZbTwbw63jJg9r2AMFjb7Cw=;
	b=IRyZN7wq9jr0sGmmNvGaCKYfdLtVhvke4mZEOOg4MyyNq79OKQGyfoxz/IsrHY59gkhq
	 J7cKk3l8i8XVN6Ed85uaLQjMXICRNK6vqKiy6YaTC7YRhqxFf4wWUh51IZDmg5E+2EtR4
	 uxZvZN8xbG7dqwlmJYCKa4oroZWeXW+qByeh8MfzSvT5rXFLrXWnLtVx6KtN8TRnkR/sS
	 sV/gh0Rgmgx2noSdKVwUKnwEwcGhqgZlEKZhzrvoYhl+DQMtf4bVrqp4T6JFBtab7pUHs
	 PaOpXXW6jjt0WJxH6OivP7F74EUafaD7c7dBbbjkpFerQM4oa3N9PdXSD/BSRcAIC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjUyc13v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29B606A323;
	Tue, 17 Nov 2026 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjUyc13v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7F41F000C5;
	Tue, 17 Nov 2026 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924413;
	bh=ns0XAWcR6vSuKym0Hs01xZbTwbw63jJg9r2AMFjb7Cw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=fjUyc13vnFbVpz4NMzIZg5RrMb+xNBv9KzK0pDNPSS+YMxxRFiAjzXos4A2Em8Cfn
	 iWKgZHCxvUlB64mRGhTFIl64tRm9FoXFWAAOvn6xrr2QgRoBZy/9Kw1s71JiKeUX6f
	 Ur32BhNHpuNgmKtzc/EA1JcLHacHMSPXxsnRa6Gw3Ez1W6vG+ds5BBJA8M1UZVGslo
	 rfoy8hvcBsOoU6Asqae+ak9Hp4Y9nrqBZQIiixUTfZT45hDDLuSS3Hu1HUiPQUrd1z
	 d4VmJaEqqX1m3yRPAiYfwqVJHqw0dsDk2Hg0qT4cABWwQNZckZ3yRSDIrlhFZ5kF5J
	 4DLM0ECaKdaVA==
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
Date: Tue, 17 Nov 2026 15:06:48 +0100
Message-Id: <DMXJLLR5G071.39YELPNJSLNZ3@kernel.org>
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
In-Reply-To: <e2ec8a39-56c3-4274-91ce-60c273904877@amd.com>

On Tue Nov 17, 2026 at 10:51 AM CET, Christian K=C3=B6nig wrote:
> See the HW eventually doesn't necessarily stop doing DMA if you unload th=
e driver.

No, if you can't stop the underlying device you must not unload the driver =
and
leak resources. Device resources (such as DMA mappings) are not safe agains=
t
this and it can cause UB in many layers of kernel, e.g. IOMMU.

> I even know about one case where a driver fully intentionally leaks memor=
y on
> unload because the devs couldn't figure out which FW keeps writing into a
> buffer.

Again, please don't finish unloading then; everything else will cause UB.
