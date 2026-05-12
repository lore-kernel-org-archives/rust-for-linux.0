Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24511481FC7;
	Tue, 12 May 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573270; cv=none; b=Nr1o1wHBIxNy7cvfS9fd3C0SlRkk1Zq537bPc7RTVxh2hBVABI/cG2C0fOTufq5CdGqL7erY1kcTXhV0BuIEcKHzu2U3bEl5WYQJb75HIiF958ze723/VykOj1JWhW+RxAuzR8P4vXVOE6TGeUDPUoubTt2VGMADj494fcKfoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573270; c=relaxed/simple;
	bh=ZH4BeVa0akY1lqcwVz0JYLTVG+Py2EFvv5/92UteYeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AudDXK0AAgVotmesbCWjkq84A0W5ESHSw0RPMbi/7q1BJFi8ei8x98j3zPPfuALFVxm6pcXSYY1pxLShlGOS3yuTBYh4flg00jVKzQgoKcGb07mB6OWNXDGO8JrnygR8NmtDteSHPH4DJczBmJYHbnmw1A8OTSqKsMMkM35lUd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPG4s1NA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPG4s1NA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D29C2BCB0;
	Tue, 12 May 2026 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573269;
	bh=ZH4BeVa0akY1lqcwVz0JYLTVG+Py2EFvv5/92UteYeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UPG4s1NA/m/nSs1diecf6GQ2YgCJyPkzHwou6/vCFQ8L1Mb5HiuWIygbf1WPFU3Tv
	 sSpm6rZNMlC/18QoSAwrYRaEZLOQxUWOZj+/8fSLTBcQjaKEi0bmWLevKUTFdwjs1w
	 pkMxObnEBW2KNDs+Elos26ACcXy5BRhoqV4qNt/3rqRe2zJiGm78vsnSgkVh4Vb5Vj
	 OPL8ghJ8ffSs5VMHDviU5XNWEIwrXvQg0H0XomQWuT+wdTQt4XxTDHywCLrpbA9aJg
	 mna2YxKXDqZhp0+vEKC2T6GqFe4fpAvq4KqvtvxiE5F7fsnqixKa11qXmKxUjnYIG2
	 VRgXentFFqvMg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <87o6laatg0.fsf@t14s.mail-host-address-is-not-set>
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <NEEh9XY18Nk7vKZB-Vz24V-2y3HYettAoZbomSB_Ml5KPx7kzR7hsLBSfRZbDRVM7XM3rowqFh0X0IIeuesa4Q==@protonmail.internalid>
 <DGPTYBO26YBT.3S14I9F5YT1PW@garyguo.net>
 <87o6laatg0.fsf@t14s.mail-host-address-is-not-set>
Date: Tue, 12 May 2026 10:07:38 +0200
Message-ID: <878q9p59v9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Sun Feb 15, 2026 at 8:27 PM GMT, Andreas Hindborg wrote:
>>> Add methods to get a reference to the contained value or populate the
>>> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>>> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>>> allowing for lazy initialization that may fail. Both methods spin-wait
>>> if another thread is concurrently initializing the container.
>>>
>>> Also add `populate_with` which takes a fallible closure and serves as
>>> the implementation basis for the other populate methods.
>>
>> Hi Andreas, in an earlier call I mentioned that I'm working on getting SetOnce
>> to work with pin-init, the capability of which I think is a superset of you have
>> here.
>>
>> The API I have is
>>
>> impl<T> SetOnce<T> {
>>     pub fn init<E>(&self, init: impl Init<T, E>) -> Result<&T, InitError<E>>;
>>     pub fn pin_init<E>(self, Pin<&Self>, init: impl PinInit<T, E>) -> Result<&T, InitError<E>>;
>> }
>>
>> To achieve what you need with a function, you can simply write:
>>
>>     set_once.init(pin_init::init_scope(your_fn))
>>
>> The patch that implement the API is here:
>> https://github.com/nbdd0121/linux/commit/4aabdbcf20b11626c253f203745b1d55c37ab2ee
>> in tree
>> https://github.com/nbdd0121/linux/tree/lazy_revocable_nova_wip/
>>
>> which I haven't submitted to the list as the user side of this API isn't ready.
>
> I probably evicted that from cache.
>
> It looks like that could replace the `populate` in my patch? We would
> still need the synchronization in `as_ref_or_populate`, right? (or
> `as_ref_or_init` if you will)

Looks like this is not ready yet. I think we can move forward with the
current suggestion and then wire up pin-init when it lands.


Best regards,
Andreas Hindborg



