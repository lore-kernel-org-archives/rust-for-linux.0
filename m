Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4F223DDF
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Sep 2025 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758364280; cv=none; b=sdpRlCuQeW/pbzmgsvseBunO+L3MO9Y8u32MGalrtRxk0hZp45dROgOiP3kgbN44XaD47TmxXqpT8BxT0mnqhjvaPrAE5EWv+sqeaUfrQJ/B7pSqChzVGLIflOfTJgVuLstXQScIuWDB8w6eXcqIYiw7KBRhSm1YGYWpBIYkUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758364280; c=relaxed/simple;
	bh=xq5S8xWIcoToAzAfm3QLkK17TuSrN/uIGEKbkZCZ/X4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oMrdHpQQvgP/IliDkTFk0e/BRqF8yS2ggUBpcwqFz3c77yAmTd+eXU1k7+s3IVrLtql/pULKQSiluzE0hPhXIWLmQmTKjcRJ1/EzEz1nEwSQr1Xb0IsW57UwJW7q+xbuaUE5vMp6/RUjZAGDR2n6jPQYyFpbvFu6S8Lyut7i5ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIik1xKr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIik1xKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1142FC4CEEB;
	Sat, 20 Sep 2025 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758364280;
	bh=xq5S8xWIcoToAzAfm3QLkK17TuSrN/uIGEKbkZCZ/X4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=aIik1xKrLH+tmh5M4dYxmc4aQy5PIHmNJjztv4fHrD8m7RXBAiU+pgNQiEU8lmO8v
	 Qkm0wV4pxcxahwb2PwG5e/dyIyZhRHsC6vxyQ3Wp3uQLtRsKFLZHws9t7Cne1jPsxK
	 LktVgMWHinIrfOsffCQwxEPmswLbrtlYm8CT2Y3nfW/DaYlCM33xzBF3+CiDjAHO/o
	 3J/OWl/NXt6r8TbP2C7IKqdbh1nxVyOo+7kFAzD9PPNyv1YB0ODYxpsNS2PlALCABR
	 TxZimo4wocWEmgpcSAezMYKDS58JiZTOhLzdLXMvyjE4OvnjeF47MjwwY443SdJfC6
	 QeK2MYTfeemFg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Sep 2025 12:31:15 +0200
Message-Id: <DCXK44UDI16B.1712QRUMDAIFT@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] `Zeroable` improvements & bindings integration
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20250814093046.2071971-1-lossin@kernel.org>
 <CAH5fLgiattq7gQNStyW2J651EqOnVOoav7uviNvA=xFu0ZSxXg@mail.gmail.com>
In-Reply-To: <CAH5fLgiattq7gQNStyW2J651EqOnVOoav7uviNvA=xFu0ZSxXg@mail.gmail.com>

On Wed Aug 27, 2025 at 7:19 PM CEST, Alice Ryhl wrote:
> On Thu, Aug 14, 2025 at 11:31=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>>
>> This came from a discussion at [1]. And I added some more useful parts
>> to the original idea.
>>
>> I'm not sure on the impact of build times and rust-analyzer. We're
>> adding a derive macro to every struct and union emitted by bindgen.
>> Building using my test-config took 27.7s before and 28.2s after this
>> change, but those are only two runs on my machine with a very reduced
>> config (that enables all Rust code that we have at the moment).
>>
>> Maybe we have to reevaluate this when more C code is scanned by bindgen.
>
> Imo we should re-export Zeroable from the ffi crate and use it via
> kernel::ffi in most cases. I don't really want to see pin_init here:
>
> let mut ctx: bindings::lsm_context =3D pin_init::zeroed();

Yeah sounds sensible.

---
Cheers,
Benno
