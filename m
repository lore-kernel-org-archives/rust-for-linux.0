Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4EB3F0A87;
	Tue, 19 May 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182186; cv=none; b=U04j5ffAovB1kF3/1M3xtI7WRUyzjUckgRmu9TvDFxeA8HSLa0OcfYBu41tN76hLerfnNRsj7ouK2e39CVnfneaMfS4P0weYWZl4H4d631oXPfCYbWfnGgU13jUSRd6keSAycyB8iJsjGK6fOUwm7CxI+y72FaZkn132ftylqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182186; c=relaxed/simple;
	bh=78drkdRMIH9lo173EU/J2fcxsEKihIcB3ADjWTP8pcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RYu48QzykMv76cN755jNeCfdRKnmVOsQyJ0oSCKwGL9Y1iH5xp2gqtPoAsOPqgTJvb8UqLls5TauCfwR8i/bYL1QVn2owaPMqS0mXddvkHIbFP6PYgieB2WiwM8jGDo95NRxOaI5wqo5P0EcSEDny+xLn/j2bLz3urGED2elTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lo0aKYV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lo0aKYV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BF9C2BCB3;
	Tue, 19 May 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182186;
	bh=78drkdRMIH9lo173EU/J2fcxsEKihIcB3ADjWTP8pcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lo0aKYV8pCUBOnVZtcYPScb9HKbi8czH0GGmQmRlSgoWNIMiUdj/Yghl4Edi+ohzV
	 fNf211abfUnDkn6DoPYcaZJ+45qRo9Ah3iC1onplt5sK9bWyiaN9yLj89Zc517OWX/
	 FxhuBYAnrYbwd1vyPtpeaactF+pOYLJJN2H7WnXwbHrXV4xpTba3P3/qTTzWtvmTjg
	 WbEue6OdMtw45YGzxuXv3ZgB01Lbb7nCTF4QqBhqFzye+iqisavTA636AadToOVVw8
	 pdUvRJbonxiiE0PYmPkDsHYElFIASmBF5C4icGWxj7M8haauO+C6Nq7k4wiAFLeN5I
	 rnLbHJghlOHcQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
In-Reply-To: <DG0ANMHJMJ40.3J7GZJ5H6WRMA@garyguo.net>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0ANMHJMJ40.3J7GZJ5H6WRMA@garyguo.net>
Date: Tue, 19 May 2026 11:16:14 +0200
Message-ID: <8733zn92u9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Jan 28, 2026 at 2:05 PM GMT, Andreas Hindborg wrote:
>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>
>> An example use case is the kernel `struct spinlock`. This struct is 4 bytes
>> on x86 when lockdep is not enabled. The structure is not padded to fit a
>> cache line. The effect of this for `SpinLock` is that the lock variable and
>> the value protected by the lock might share a cache line, depending on the
>> alignment requirements of the protected value. Wrapping the value in
>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.
>
> Do you mean `CacheAligned<SpinLock<T>>`?
>

I missed this in my original reply.

I mean `SpinLock<CacheAligned<T>>` as I wrote. The `SpinLock` will be
aligned to some alignment, possibly the start of a cache line. Taking
the lock involves getting exclusive ownership of the cache line and
updating the lock state. When the lock is contended, the CPU core that
takes the lock will loose exclusive ownership of the cache line
immediately after taking the lock, as other CPU cores are trying to take
the lock.

The logical thing to do after taking a lock is looking at the value
protected by the lock. As the winning CPU tries to do this, it has to
obtain ownership of the cache line again, assuming the `T` lives on the
same cache line as the lock state. If we align the `T` to a cache line,
then that line will not be contended. Only the cache line holding the
lock state will be contended. And then observing the T does not incur
the overhead obtaining a highly contended cache line.


Best regards,
Andreas Hindborg


