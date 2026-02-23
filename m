Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20634D4DF;
	Mon, 23 Feb 2026 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771844840; cv=none; b=BqvpWNZmUU/lo79xjvnsPuWVYyYXbr7Y7YxNl+/XT78gGAQ8KTaRXLB1Bku5FwxjKwlGsU8LvRlRuI/VmDNQ9F4Uj7/Y4dhUZ0w65cq3tbx68o5QTYYVfhAHDZUdderI5DlEhB0dU6+dldrI2H9wZ+C8DK9WorQj62UYFtCKC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771844840; c=relaxed/simple;
	bh=9THcSknWxFekpDxQRFCSKZzyrfb8YlQHG6tgRXaASYU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=idJV7ke4ZKMSxPXz/AjNb7ErcOU5/krGrog2XI3FfB7jw0VmSmqnOcdr+4MveWbNPWtHBgP8hmnfa/8p+HLNYRSsUaAgFihv3bD1Hu31hS8BtO1663ZUEu5/xc5XSS3Icq2sLr5YOI6gIbQz+oXTrkJAmoLlw9GrtVPQC270kNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tv5puIZf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tv5puIZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9AAC19424;
	Mon, 23 Feb 2026 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771844840;
	bh=9THcSknWxFekpDxQRFCSKZzyrfb8YlQHG6tgRXaASYU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Tv5puIZfMAco9XypEYh9cgeD64pwjXw4pW7HW8k3tyc5g9CEWbtdOIlPg2tmLk4OC
	 Tm5Tgu2pn6se/M5yc71749ytXjU6mTorr0vL//AKbEZRpmJnyRTm0q2zgZ2mYLDyWS
	 8cZdnuM1tvHdL+rVFNix0MTL7qNlXPyBvpjbAqF+JrndO5iYg5Ydx8UjLT2Ve3mYRJ
	 ohilm+oYVdtWakc5UEmLjuZD+KlBh8Pd+qJKiM/Vw3mZtqIrcjDTNzHeD3289oShzr
	 Oj7ayfFH+Pd2CnKuC+Zid0tGWqCWAE/MlpKh6+pxU+33ny/UtzQr8BFTNC0Ewrqhri
	 znnQCFGnI0pbg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:07:14 +0100
Message-Id: <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
In-Reply-To: <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>

On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
> On 2/21/26 11:46 PM, Gary Guo wrote:
>> On 2026-02-21 02:09, John Hubbard wrote:
>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>> equivalent of Alignable::align_up(). This uses inline_const to validate
>>> the alignment at compile time with a clear error message.
>>>
> ...
>
>>> +#[inline(always)]
>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize=
 {
>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of=
 two") };
>>> +    match value.checked_add(ALIGN - 1) {
>>> +        Some(v) =3D> v & !(ALIGN - 1),
>>> +        None =3D> panic!("const_align_up: overflow"),
>>=20
>> This is wrong. Either this function is always used in const context, in =
which case
>> you take `ALIGN` as normal function parameter and use `build_assert` and=
 `build_error`,
>> or this function can be called from runtime and you shouldn't have a pan=
ic call here.

I think the most common case is that ALIGN is const, but value is not.

What about keeping the function as is (with the panic() replaced with a Res=
ult)
and also add

	#[inline(always)]
	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T {
	    match opt {
	        Ok(v) =3D> v,
	        Err(_) =3D> panic!(""),
	    }
	}

for when it is entirely called from const context, e.g.

	pub(crate) const PMU_RESERVED_SIZE: u32 =3D
	    const_expect(const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K), "...")=
;

> I will have another go at this, and put it in nova-core as per Miguel's
> comment as well.

I think Miguel didn't mean to say it should not be in this file. I think th=
e
current place makes sense, let's keep it there.
