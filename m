Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B9374178;
	Tue, 17 Feb 2026 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353840; cv=none; b=SZaWNHp30ebHrm6HJUNlgiKV/JIqESYOQxuQniIVn7I8uPvvBI42Yy6klOQQyzuGojZw+xirI5PUk+TZHi9PKDlq7Ns780L5fRdBp5x1lq+IQP6qn1OTAqSF4ZcAX067fR9TLTWaDmJIk4Ua6H1mSsiW66833qGFctpDnMINHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353840; c=relaxed/simple;
	bh=Pk4Dgfnl0LTSh5k77thtI5cjFrYaqlPjl8PNswtEoZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cBBwYAgWlcdyLCFtDlNyfYVv/kJCydRh1AnvURhiQv9EwHY+sz8EgwLTqc8qVPOHg8qL308ejDsKzjTr2kXGQF9AgdIpJtS5ZxwBz1pT8rrX4G7RxoPjvWSFkipkm3ReOGVlzDJc4sqsJBHfdTBUXRQUhvU/+8NgwyJDZgul3KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUEKmHZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUEKmHZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B1FC4CEF7;
	Tue, 17 Feb 2026 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771353839;
	bh=Pk4Dgfnl0LTSh5k77thtI5cjFrYaqlPjl8PNswtEoZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aUEKmHZ5aDwTgKs9nkuh+SBwV4UKqULNKl4BeI1JG2BbWs5fTGwFdfFLVwmb/+haf
	 iRyj6ub4Emg6ti9hngP6J3kHBGJs/SP33wwdJC9BheIfaxPf4GJ3wF61N59XqdLkpQ
	 5cG2XKO6fIjX6jAMNzM3Ob2ukkjzPJtoSdbyHesj2nNvsWxpKgR7HMZPKRdl4QC3An
	 GPC4K1bEhAsG/cTKbiaIX+aukwBTaBYMqO7srG3bdjEl/YYlL5u5Bk5VthTTF/E5cn
	 ZI6Zu0Hmt6mjWD0v96UoHzBuDzXRlMMIQC5vZXEpczapcjoHvmn6QN07Glw/V/YLU4
	 tPrPHwEs4gBAA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Jens Axboe <axboe@kernel.dk>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Greg
 KH <gregkh@linuxfoundation.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <20260217160451.GA2995752@noisy.programming.kicks-ass.net>
References: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <kkmXYWYC07oImDD0FJFVCCWl45alQdraRLHoLr7zowZfE0tMz0MmPIpuyEYQRSLjBQqrp_Ch0iR2Rix_g49lNg==@protonmail.internalid>
 <aZRWOIPThLfIZ1Ph@google.com> <87ecmjcw2v.fsf@kernel.org>
 <Ubu-HoF6Epp0EBvoi1HO6Q9YgTbAxfjfziFD3wsuTop8XLAXSvW2ZkzmMfb0gA2zCfn1XjwuxBSpyx-lexty6Q==@protonmail.internalid>
 <20260217160451.GA2995752@noisy.programming.kicks-ass.net>
Date: Tue, 17 Feb 2026 19:43:48 +0100
Message-ID: <878qcrcisb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Peter Zijlstra" <peterz@infradead.org> writes:

> On Tue, Feb 17, 2026 at 02:56:40PM +0100, Andreas Hindborg wrote:
>
>> I'm processing disk IO in the Rust null block driver. The pages backing
>> the IO requests may be simultaneously mapped to user space, so there is
>> no way to guarantee that there is no concurrent memory operation to/from
>> the memory area. User space programs can do whatever.
>>
>> I don't have any control flow depending on the data I copy. I just store
>> it somewhere and return it if a read IO for the same sector arrive.
>
> Right, so IIRC the old DIO code used to have this problem. We'd end up
> writing whatever random state to disk if you did DIO of an mmap().
>
> And if IIRC the current state of things is better in that we ensure the
> mapping becomes RO and we have writes fault and wait until the writeback
> is complete, ensuring things are somewhat more consistent.
>
> But you'd better ask Jens or someone that has looked at the various IO
> paths in the past 10 years or so :-)

Oh, this is a really important detail that I did not find while trying
to follow the code path from user space.

Cc: Jens Axboe <axboe@kernel.dk>

@Jens is this so, are pages from user space that are part of a write
request mapped RO during the IO operation?

>
>> Let me add a bit of context as to why I sent this patch. I am not an
>> expert on the finer details of this subject, so I rely on available
>> expertise in our community. It is my understanding that copying the
>> memory in the situation outlined above, without special consideration
>> (in Rust) would be undefined behavior. Such are the rules of the
>> language. Of course I don't want undefined behavior in the Rust null
>> block driver. When asked how to solve this, the experts suggested
>> defining this byte-wise atomic memory copy function, A function that
>> would have well defined behavior in this particular situation.
>
> Yeah, so being a C programmer, stepping in UB and tearing up the spec is
> what you do on the daily. Its called reality :-)

I see. From my observations, "Rust people" in general have a somewhat
different approach to UB. An approach where we avoid it. We would rather
fix the language so that we can do what we need to do, in a well defined
manner.

>
> In reality it is *really* hard to have memcpy() not be sane. And if the
> Rust spec doesn't outlaw out-of-thin-air, then the Rust spec is wrong.
> It really is that simple.

I'm at the far end of my knowledge here, but I believe that I read that
the theoretical model allows OOTA but that this is considered a bug of
the model. I'm not sure what to do with this information though.

>
>> That seems like a reasonable course of action to me. I don't understand
>> why this is such a big deal, and I don't understand the need to use
>> aggressive language and swearing.
>
> Feh, there hardly was any o that :-) Call it cultural differences and
> show how inclusive you are by being open to how other people have
> different norms, whahaha :-)

Touche.


Best regards,
Andreas Hindborg



