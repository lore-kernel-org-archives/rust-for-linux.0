Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B236493E;
	Mon, 18 May 2026 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111733; cv=none; b=jJ71DELbrwXdT3Ypy3yC5tATFeR3iXCcA/qWxBtAmj9HjrthPrGJXosp7gK/Jvw8nQG89hX5eLY7t1ApygNHrNPaQ/Py7f2oGjMFTvGNjA2CUvdIslVwxjTUsEmBf1TfaY8IuUKnP9/Fis4zyLbVOY9eSNK/0AUHnsXOCEvCot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111733; c=relaxed/simple;
	bh=ccmF+cfY2cr1wp+wdVuAlINyOVRxhzb7TR2hBrReL5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bZ8mQBPS+wvAidfebtZCzZKVj0TnlsmA1QyqUkKeX5WOIj4JBSMn+CQ/AzDyinRQcvSxlqwhsDx/Ukix0N4wZEVfCymLZlebXqvuoZocReYpokpp8K6ujjRDf4Hzyy3N9ueV7ErLYf1aoSzkPJUReRdwSA9V1S5tO1wtEXV6jEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1TjaioX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1TjaioX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D121CC2BCC6;
	Mon, 18 May 2026 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779111732;
	bh=ccmF+cfY2cr1wp+wdVuAlINyOVRxhzb7TR2hBrReL5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T1TjaioXCLKTnoiTQaB418PjLoDWaLLarerLZJV+sQqbD4mFYTjfCISQsMCU6eNyZ
	 FqGFAMya+F2b+xQ8uNMaQfO7SP/+e/B2Xv+yQ/TD3NaFGyclFbK/cMvrg2/9MXv8io
	 X6xl7qFJRC92FkETQ2UBU2Gl7T92tm6l6njIPfjznyUgr8ZxIreg168bklazKnP1f6
	 Lp5adDhgLP01gkWGi8XuVRvaKenszpuKj3oGW/CZ8alSDm6U28trNVl+s6tX4q+5aR
	 bqWEVsSNovFnKl39g9MjDlaDLb/AmJc69qvLKr0I+F2YxmndKWDlU88DXX9kPePRte
	 73Q/LLk/fB1mQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
In-Reply-To: <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
 <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
Date: Mon, 18 May 2026 15:41:38 +0200
Message-ID: <87bjec96nh.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
>> On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
>>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>>
>>> An example use case is the kernel `struct spinlock`. This struct is 4 bytes
>>> on x86 when lockdep is not enabled. The structure is not padded to fit a
>>> cache line. The effect of this for `SpinLock` is that the lock variable and
>>> the value protected by the lock might share a cache line, depending on the
>>> alignment requirements of the protected value. Wrapping the value in
>>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>>> ---
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/cache_aligned.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++
>>>  rust/kernel/lib.rs           |  2 ++
>>>  2 files changed, 61 insertions(+)
>>>
>>> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
>>> new file mode 100644
>>> index 0000000000000..9c33b8613c077
>>> --- /dev/null
>>> +++ b/rust/kernel/cache_aligned.rs
>>> @@ -0,0 +1,59 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +use kernel::try_pin_init;
>>> +use pin_init::{
>>> +    pin_data,
>>> +    pin_init,
>>> +    PinInit, //
>>> +};
>>> +
>>> +/// Wrapper type that alings content to a 64 byte cache line.
>>
>> nit: s/alings/aligns
>>
>>> +#[repr(align(64))]
>>
>> While 64 bytes is the most common cache line size, AFAIK this is not
>> a universal value? Can we expose and use `L1_CACHE_BYTES` here?
>
> Unfortunately `repr(align())` does not accept expression or macro invocations.
> It's still possible with code-generation, but it'll be more tricky.
>
> On all archs that we do support today, I think the value is always 64. However
> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new archs gets
> addded where this isn't true.

I was looking into how to implement this properly. Apparently, we don't
have a config item that specifies the L1 cache line size for all
architectures. Each architectures defines the cache line size as C
define in a header. For x86 we have

  #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)

and for arm64

  #define L1_CACHE_SHIFT		(6)

and so on.

One thing we could do is run the C preprocessor on a small snippet to
expand the `L1_CACHE_SHIFT` symbol at some point before invoking
`rustc`. Then we can pass the value to `rustc` via environment variable
when building the `macros` crate. This is similar to how we pass
`RUST_MODFILE` to `rustc`, sans the cpp invocation.

Otherwise we have to convince all architectures that support Rust to
emit a config that we can rely on, like `CONFIG_L1_CACHE_SHIFT`.

The latter options is probably the better one, what do you all think?

Best regards,
Andreas Hindborg



