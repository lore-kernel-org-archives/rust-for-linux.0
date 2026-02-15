Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500292D6E74;
	Sun, 15 Feb 2026 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771198190; cv=none; b=PineqjZo8MHUDlcs5zl3Wfa8uIxU7y0WfDnPTJ3z55MrKm6fMiN0K2dKRDAVK8cpvTzMitzkjEgEuisEG/SMBh+2fpX5Dw9oseN6nBpxOckGhz83P76Jhqx1xfEuZNbdm+SpVG7gyGwjIFyA7Eg1JjgOl2glS9HSxMsgfriw4Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771198190; c=relaxed/simple;
	bh=ZyJz72d3omm0sfcpYeMyRHkraJLhp8ot2zTCeLlY+kE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WzbbtYATeb6+niNlzEI/KGsJGvDcbu66ylOhgfnQeu/ed073Nva0kBtmvge96clb85zQTknN3aCmMSSGPe/zL+i5OijDKpFnBx3oRRayxoWNbo0b5LyTITTFCzOeIqJ11PPZ+6hck4In2XqN0apMw1kiQO606KSCipQ1mwdtsHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvNlTZg4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvNlTZg4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE23C4CEF7;
	Sun, 15 Feb 2026 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771198189;
	bh=ZyJz72d3omm0sfcpYeMyRHkraJLhp8ot2zTCeLlY+kE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NvNlTZg4rfhHZjh25ReI8Usg0GHyD66mUGSS5xMqNi1ZrqV+xmgu7H2zn++54+hex
	 hyKW2/zTltefgrpoWM/b2hvo3dd8B/OC/hcuWUpM0nlMwY4GOl176rTxxlTZ442Rf0
	 XUV+TO/9X/fjbwE13Oauk/S2xx+yR124jOpJqflCEExWsGRPmAUulQYiICQFHal9DU
	 S8U/DpHlgtH13/aUUO/NhdikEDDWqaa7xh0VfhzvBEqpy7E4dDkRtBxvKVRMfLnLav
	 PrIclyGOqpd0kGPp0LT8Lpygm07lfB/WSNQAv6VgeBwU4IKo94tOi66i2ftU117dOe
	 u9CxUN+Gc2yrA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 00:29:45 +0100
Message-Id: <DGFXCTGFJM6B.34VDIFSAEIJWY@kernel.org>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
 <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>
 <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>
 <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>
In-Reply-To: <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org>

On Sat Feb 14, 2026 at 3:56 PM CET, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 3:40 PM CET, Benno Lossin wrote:
>> On Sat Feb 14, 2026 at 3:17 PM CET, Danilo Krummrich wrote:
>>> On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
>>>> @@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box=
<T, A>>, AllocError>
>>>>      /// assert_eq!(s[3].d.lock().a, 20);
>>>>      /// # Ok::<(), Error>(())
>>>>      /// ```
>>>> -    pub fn pin_slice<Func, Item, E>(
>>>> +    pub fn pin_slice<Func, Item, E, E2>(
>>>>          mut init: Func,
>>>>          len: usize,
>>>>          flags: Flags,
>>>>      ) -> Result<Pin<Box<[T], A>>, E>
>>>>      where
>>>>          Func: FnMut(usize) -> Item,
>>>> -        Item: PinInit<T, E>,
>>>> -        E: From<AllocError>,
>>>
>>> I think we should keep this bound and just add:
>>
>> The `Into` trait bounds are the idiomatic ones for functions consuming
>> things. See https://doc.rust-lang.org/std/convert/trait.Into.html:
>>
>>     Prefer using Into over From when specifying trait bounds on a
>>     generic function to ensure that types that only implement Into can
>>     be used as well.
>
> Yeah, but isn't this only because of [1], which does not apply to the ker=
nel
> because our minimum compiler version is 1.78 anyways?
>
> I.e. are there any cases where we can't implement From in the kernel and =
have to
> fall back to Into?

Hmm that's interesting. I'm not sure if that's the only reason. It would
be interesting to ask the Rust folks if there 1) is a different use-case
for `Into` today; and 2) if they could remove `Into`, would they? If the
answer to 2 is "yes", then we could think about doing that (or at least
document it for us).

Cheers,
Benno

>
> [1] https://doc.rust-lang.org/std/convert/trait.Into.html#implementing-in=
to-for-conversions-to-external-types-in-old-versions-of-rust

