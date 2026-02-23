Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786D8142E83;
	Mon, 23 Feb 2026 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856447; cv=none; b=MApKexHbtAa9NKQRE63iEnVgjaEi21wwH28Q8YQOSAFwEbjj3bo9kvfjOkwJ+KYZ0ngs49h1f3fcQSEUBPgogA0G3nyQbYx7ArJ0kQDEujq+CJojbVggq5dI0oo4begVYdXJiwAg0GTx07cFQh4T/2qTLMMYgvLvu4cD1q29Erk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856447; c=relaxed/simple;
	bh=/x9RMS+FWJD5HbEDlZbYvRK9i6bZ6I+mSAtPXGc8dVw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Yd4GEqk4AqDqGDbEja8tdukY0f3wJQ2JSiddPj+3aAwYyztriiyqCmV/Kzh/ZKNqHMQyRNQY2FXgk9/DRWW+HMI0/W0OgGWyhYRbw14ymhLV0dfK3fkkyBBG8jiulmO9B4znJMKhwNtIsR0l3zc139XzSfSgske3Y7g3fBcCcLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdiU3uvT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdiU3uvT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE553C116C6;
	Mon, 23 Feb 2026 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771856447;
	bh=/x9RMS+FWJD5HbEDlZbYvRK9i6bZ6I+mSAtPXGc8dVw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fdiU3uvT9gCCYFh3XuLC/MI+zSvpcol6Q6vVBPiGycPt2uxiu1MN20AgGeRfu4eQY
	 qsvLryG3Lmg8TDaU+Mi0lTtKukbzQxzwCSBtu4/N06PYt9/K9zLUVoFWs6POWuajba
	 XE96+FfSO4lfCGBNSYiDP3bihfLQnmY3GTdGDYu2IsLSkJkYWWlTuy7RVFAjfnlK0g
	 C4EO4NQRqwuzB+JA7r6rfz4GuX/Bd0dUV7D6+yt75ysEe5KJYmfUuR7gCEESCMZ30H
	 bz5QBg4CTID+YtYooTYU6911bL89NMGEAFAA2Raa6q5q/D6aoyKRz6hiZe5E0Wi52W
	 By1hNCa1jzBVQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 15:20:40 +0100
Message-Id: <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
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
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
In-Reply-To: <ba7aec533e083622be9055e77c30fee0@garyguo.net>

On Mon Feb 23, 2026 at 3:16 PM CET, Gary Guo wrote:
> On 2026-02-23 11:07, Danilo Krummrich wrote:
>> On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
>>> On 2/21/26 11:46 PM, Gary Guo wrote:
>>>> On 2026-02-21 02:09, John Hubbard wrote:
>>>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>>>> equivalent of Alignable::align_up(). This uses inline_const to valida=
te
>>>>> the alignment at compile time with a clear error message.
>>>>>
>>> ...
>>>
>>>>> +#[inline(always)]
>>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usi=
ze {
>>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power =
of two") };
>>>>> +    match value.checked_add(ALIGN - 1) {
>>>>> +        Some(v) =3D> v & !(ALIGN - 1),
>>>>> +        None =3D> panic!("const_align_up: overflow"),
>>>>=20
>>>> This is wrong. Either this function is always used in const context, i=
n which case
>>>> you take `ALIGN` as normal function parameter and use `build_assert` a=
nd `build_error`,
>>>> or this function can be called from runtime and you shouldn't have a p=
anic call here.
>>=20
>> I think the most common case is that ALIGN is const, but value is not.
>>=20
>> What about keeping the function as is (with the panic() replaced with a =
Result)
>> and also add
>>=20
>> 	#[inline(always)]
>> 	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T {
>> 	    match opt {
>> 	        Ok(v) =3D> v,
>> 	        Err(_) =3D> panic!(""),
>> 	    }
>> 	}
>>=20
>
> We already have `Alignable::align_up` for non-const cases, so this would =
only be used
> in const context and I don't see the need of having explicit const_expect=
?

Fair enough -- unfortunate we can't call this from const context.
