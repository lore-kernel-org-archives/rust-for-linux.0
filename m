Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD174E1C
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Yyd+/Wg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702921673; x=1703180873;
	bh=kWoPrvQBKwAi266j+G1U1GXzd4+9SxzFGBqgXoz6f0s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yyd+/Wg+Dy/TKDp06JYVsaH2QBQ2MJY8/rUWLjTkOHhENDcOukl9LIwicPsl3V4Td
	 R9JrmNoCDBlcyUyPZ+t1t7OPKV8fUl9S5+M5rvqp9z+a3z81WMIYirRwpPcTKM2dbJ
	 1v8/hOi6VFtGaKt9n7+Ggm2tR/HePFXlFXpd53MAesdwrfIdIS3Nz1j5PFph2KT8vD
	 ARwlrh/WBe3PWdlyaqoQzBdOAdpIIWu8Gl3uj1X7FEIJckQvb7kJlkbqYiV0vCD5sD
	 D4vym2dV6ue3jZkwrg96UuE6NqP2R/5h1cFguwk/MWpUMlaDHh2K1dESVmpJZWVGh+
	 /SL5kYUgPgbGQ==
Date: Mon, 18 Dec 2023 17:47:30 +0000
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Wedson Almeida Filho <walmeida@microsoft.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rust: workqueue: add `#[pin_data]` to `Work`
Message-ID: <cf36ec44-466a-4c00-afd6-8387dd1ed1f2@proton.me>
In-Reply-To: <05fa58f3-f351-4119-9c07-1f5bb04503d2@gmail.com>
References: <20231213220447.3613500-1-benno.lossin@proton.me> <20231213220447.3613500-3-benno.lossin@proton.me> <05fa58f3-f351-4119-9c07-1f5bb04503d2@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/14/23 04:13, Martin Rodriguez Reboredo wrote:
> On 12/13/23 19:09, Benno Lossin wrote:
>> The previous two patches made it possible to add `#[pin_data]` on
>> structs with default generic parameter values.
>> This patch makes `Work` use `#[pin_data]` and removes an invocation of
>> `pin_init_from_closure`. This function is intended as a low level manual
>> escape hatch, so it is better to rely on the safe `pin_init!` macro.
>>
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> ---
>> [...]

Did you mean to add your reviewed by? Because I received only
the quote.

--=20
Cheers,
Benno

