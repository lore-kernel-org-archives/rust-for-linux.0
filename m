Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831302BF3F4;
	Sat, 14 Feb 2026 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771070392; cv=none; b=WM69rOi3FsSbKac51vUI/9lvsolYHNOKnkRjHg41mu3OWir6fm1T2Hmk2EDY34KojHrpT+PEbyJ0775/3DbNWp69Wb/NRES5rBS5u8ovsCNMjwT0YsjAWSXyjliRqPOuvY4LrlNSxs96EiceHIs52Qx9+w/guGAwwtAl5XGD69o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771070392; c=relaxed/simple;
	bh=t7T1HWue7wsa7+cPV3BKvXdYMX8YMv5h2V3h8xdT2JM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fqhYP9RXdGFC/NjIwynLvgruOpKXNr9bqYyG6BbUPzigXWRjSZbEKo7S8Egzz9d+Mx9wfD1p1h7UrdIbxQXp412nt10EbtO4i84zjT4zV1TqKIwykpP0PRO++lOFsYEQpcoED/4oHL/SVR9vr6HO/hqo7Y1MB8v8u59xWrIwdFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6OIDI7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6OIDI7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F18C16AAE;
	Sat, 14 Feb 2026 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771070392;
	bh=t7T1HWue7wsa7+cPV3BKvXdYMX8YMv5h2V3h8xdT2JM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z6OIDI7tWEXZJgt/d2eznSxrTGFHikHfcx0Jn9L+tih1xSzWA9PrRmgsBdruV/wOr
	 Ux0KyYfw49YDP/C+D2KT+DlYpEN43KNJikFtaO/EFSmxC+To66FKBR/e+bSMCMEc8+
	 Ona70kr7cieIApVAQEnKp6Kz65GkjMadScI9ZfPyRKl+BI3/dI3wGMSRpKEtjqfKYK
	 dDaH0GQRJtaOflKOqNxphtkrtjRKTRewdgmU1k5wt5ej+LY9Nl6wS3u45nwHgf/tNr
	 xS73aKUH7AA1w9h2Sormc2YjCqnz7XIybEhBD6PCiZmZ4oxyHifWEObf/SIo8rI68v
	 eERaT3a1k+uKA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: impl_flags: add method to return underlying integer
In-Reply-To: <5571a8bb387ca68b3f6f50d52509da52@garyguo.net>
References: <20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org>
 <b3388ec6cbd8f42532e876737e015e15@garyguo.net> <87zf5bsqfi.fsf@kernel.org>
 <lgW-ukttSyJnrR0xPCEXr-X4JkNUdL1O3bL--8Tp83OP2Dhas56_2Aow3Kiuf9MFURBm_Eh24M7pSzg9XBm3RQ==@protonmail.internalid>
 <5571a8bb387ca68b3f6f50d52509da52@garyguo.net>
Date: Sat, 14 Feb 2026 12:24:43 +0100
Message-ID: <87o6lrsh38.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On 2026-02-14 08:02, Andreas Hindborg wrote:
>> Gary Guo <gary@garyguo.net> writes:
>>
>>> On 2026-02-12 16:02, Andreas Hindborg wrote:
>>>> Add a method to return the underlying integer used for flags. This is
>>>> useful when using the flags with C APIs.
>>>>
>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>
>>> I am not sure if we want to actually expose the underlying representation
>>> for all flags. It should be something up to the caller of `impl_flags` to
>>> decide.
>>>
>>> Would it make sense to add visibility the wrapped raw type so that you
>>> can do
>>>
>>> impl_flags! {
>>>     pub struct Foo(pub u32);
>>>     ...
>>> }
>>>
>>> to make the inner accessible?
>>
>> I don't see how that is better?
>>
>>                 bindings::blk_mq_tag_set {
>>                     ...
>>                     flags: flags.into_inner(),
>>                     ...
>>                 }
>>
>> vs
>>
>>                 bindings::blk_mq_tag_set {
>>                     ...
>>                     flags: flags.0,
>>                     ...
>>                 }
>>
>>
>> I would prefer the first one.
>
> How about we expand `($inner_vis:vis $ty:ty)` to be
>
>     $inner_vis fn into_inner(self) -> $ty {}
>
> ? This way unless you explicitly put `pub` there, users outside the module
> cannot query the bit pattern.

Sounds good. We might get some dead code warnings maybe?

>
>>
>> We are going to need to be able to pass these flags into C APIs. I feel
>> like adding a method to do this is the best way to go about this. We can
>> call it something else if that communicates the purpose better.
>
> I think `bitflags` crate call this `bits`, which I think is indeed
> slightly better than `into_inner`.

Sounds good.


Best regards,
Andreas Hindborg



