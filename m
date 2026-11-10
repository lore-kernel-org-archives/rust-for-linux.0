Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298083;
	b=y4caMgtEsMeQGtii9szml+G3uvPcYqVmHESOSB4QvRYR/4vSwPQuibb3M7MhwmIzCtOs
	 V5fgm6Ew1s8C0iZacqSM+D3ZLvF5hKG8knHYTNRwWOjpJ2cuAt65aCqOpKZDfZZgAQnEQ
	 atWikoB6szUBE64tTdBHnngDfrJHLmvVPo0yv84iN70c4Hv0hFUbLU9sbw2JkUZs6n9mY
	 vRpdhY7dQiyBFraBHPYGsnmVtkj0wkcdXxhMiKE3JEQzRdSC/wpIo8L/FtG0Ie/HHeWM4
	 q6O1q9AWWDiQDGrmVWzA55hlLh+c4VjsE/Db5eKsKzCYQKDl+sJOJ+pQagZ5SpN3TfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298083;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=bumsT3247uJhgV6jVLN6Z+t5ji3XDdbkIBaiaUNDB+c=;
	b=rTNadG+chjWtSe8UIStayvlwh0nM6dyeKzwSlDbNNza6bj9U3RMXpz01auJ/uE+mMAC8
	 u93v3JbXAnDh7t2eCdpZjQqqOEvTPuD6szsApdDFn1ucQYdeATDAZfd2CClsPhjMMbv2n
	 TlOaiuThfYdSFoGFiv4ObH6sOR6SIeTTNyILLsawZ7ELlWVCdD0bpHLXeKZi4jA0mo3VN
	 NQafSoBKiKKsTNmy1z6191dbsP0vQ9toxJ6CdcR2MXuNWIIIBxROOwVFKKzZFx/gVZblG
	 v7iZKZCHg1nB8iW5IJRCi/UYrxGQYHDIx+OdaGbXegXXSEN2KGTfazRR+sJTiSqUA5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvX3GZoU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45970606A325;
	Tue, 10 Nov 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvX3GZoU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D2D1F008A1;
	Tue, 10 Nov 2026 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298082;
	bh=bumsT3247uJhgV6jVLN6Z+t5ji3XDdbkIBaiaUNDB+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GvX3GZoUV93UQPhoWyGuESc41gYkEOZkOWOPkt2N/TCeX4GgczNSI3xqsr8XJ1zQt
	 tbRFaqpzcPcdmsTsNz/BknBkdEY24nHzG45VVjF0OeZE2XD9tDsOWxvYDMPhT66zLF
	 5/VZ5o8CWlTS71V9gp2a9kqAC0mIEvzgDlLzjhXj54L/sK41lYWujjeXoS0xpOdl1N
	 lb3NBAQmBaqtPRJjHC+gCGfzP8r2ITacNL9qZuLFKFvJ7DF/XILH2yRgzMnOAa164H
	 ALuXCLmoDQyAc25j24mHm7wIR2uxCt/eQVAmwuu8KO3A1S/JrUX4VoFyulBmXV+FXZ
	 ufo2WK3zHNGTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: alloc: move `NumaNode` to the `numa` module
In-Reply-To: <DMQU2RZATGHR.1HI8FE2P58O7V@garyguo.net>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
 <DLSQY2IKU5IO.3BFLXTCTJ5I6U@garyguo.net>
 <878q3hopt6.fsf@t14s.mail-host-address-is-not-set>
 <DMQU2RZATGHR.1HI8FE2P58O7V@garyguo.net>
Date: Tue, 10 Nov 2026 08:56:32 +0100
Message-ID: <87pkwdqfv3.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Oct 28, 2026 at 2:36 PM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>>> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
>>>> index 164e622d325f..4a3a880308f3 100644
>>>> --- a/rust/kernel/numa.rs
>>>> +++ b/rust/kernel/numa.rs
>>>> @@ -4,12 +4,15 @@
>>>>  //!
>>>>  //! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
>>>>  
>>>> -use crate::bindings;
>>>>  #[cfg(CONFIG_NUMA)]
>>>>  use crate::sync::atomic::{
>>>>      Atomic,
>>>>      Relaxed, //
>>>>  };
>>>> +use crate::{
>>>> +    bindings,
>>>> +    prelude::*, //
>>>> +};
>>>>  
>>>>  /// Returns the number of online NUMA nodes.
>>>>  #[inline]
>>>> @@ -27,3 +30,33 @@ pub fn num_online_nodes() -> u32 {
>>>>          bindings::nr_online_nodes
>>>>      }
>>>>  }
>>>> +
>>>> +/// Non Uniform Memory Access (NUMA) node identifier.
>>>> +#[derive(Clone, Copy, PartialEq)]
>>>> +pub struct NumaNode(i32);
>>>
>>> FWIW the C type is nodemask_t and this should have mask in the name too. It is
>>> not an identifier. That said, this is an existing issue, so shouldn't block the
>>> move.
>>
>> What makes you say this? This is not a mask, it is a numa node id, which
>> is represented as i32. `NUMA_NO_NODE` is a valid id.
>>
>> I am using this to specify domain for block mq queues. If you take a
>> look at the allocation path:
>>
>>   blk_mq_alloc_queue
>>   blk_alloc_queue
>>   slab_alloc_node
>>
>> It's an id, named `numa_node`, `node_id`, `node`. Not a mask. Unless I
>> missed something?
>
> Right, I got myself confused because NUMA_NO_NODE is defined in
> nodemask_types.h.
>
> If it's just an ID, would it make more sense to have `Option<NumaNode>` and
> `None` to represent no node preference?

I guess we could define it as `Option<i32>`. That would be nice.

I can send a follow up once this lands. FYI there is a v4 of this [1].

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/r/20261030-cpu-helpers-v4-2-a8d840d34837@kernel.org

