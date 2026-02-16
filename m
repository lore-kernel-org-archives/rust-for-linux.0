Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86442F0C48;
	Mon, 16 Feb 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771226090; cv=none; b=YeI0tnDzsAhyIDXRAioeuJkG1geIvI9RV3mjZukfTJeRR0is3Xeou5xlCqwzgcWb54xRCa2ojbqayh5/ewaDfIfc4zwquBZOy2Q1cqXPbVyMZRdBSEfydQ4a2Cmw8innJwKqXAlUhNYKxaTgb1TeJHb6m72UWdCYKgOMWi4pALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771226090; c=relaxed/simple;
	bh=yiisJwR1WUfD46dfKXy4ts0PKfWaOsEvZPePjv6OE/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KPErK1IaWEeVBWVuXG24pcF4bR9pgnxGt4YC/65hG0822TsOZQNnEajq4iBPBS1JtQSjrWnXqRatzZbzfSG/UM1tpY9WDZjwyRoY41NPWC5C+n9UyeAi/5ChB2qUqOjcf/d7FwIV3Gqav/g1twnBFnaCwFqu3zqY3gSTpiNLeQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjAJl54o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjAJl54o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D872C116C6;
	Mon, 16 Feb 2026 07:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771226090;
	bh=yiisJwR1WUfD46dfKXy4ts0PKfWaOsEvZPePjv6OE/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tjAJl54ozcmrFU/mUyc9D/sRUSR6Xqpd1ZMG0oaYQ0se8LNQhWQZaOk/S+aRNcKj0
	 CV2rjXo94FMJg5HVsJ3xEIlLZKdim5sowVmbXGEe+chHY5TJxCpADR2hrEoLJm76zt
	 hOeCFxsQIOl+Kt7s1Y/gnpg25KzOXiXguOLL3ca6GIrQAwtVgiFpJnIFclduGEPyw3
	 EcaJwxqFQOysYj22AKupXgodYpZNBq7NfGQVNfl1fp13YLmE6eYgWSiSihmrRuQAEZ
	 JMk28d8vodQCFPkKRvlsr5D1XvOEtAJisEVjb1+gp0drV3Gpl+WI3JPQytAMXB8MSB
	 hm3CjsAjIY/RA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Benno Lossin <lossin@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: sync: export lock::do_unlocked
In-Reply-To: <DGFX8MV58WLM.2UFDGEIRRYWLI@kernel.org>
References: <20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org>
 <BxsdI3LiC3yEHDsTew5ub3OiQyxjWc96V0V3r6yM2zIKD5r7xDUOXvvaLPxUHY9UHsy1jDZ0Y_yJjGHVo_RDgw==@protonmail.internalid>
 <DGFX8MV58WLM.2UFDGEIRRYWLI@kernel.org>
Date: Mon, 16 Feb 2026 08:14:42 +0100
Message-ID: <87bjhpdusd.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Sun Feb 15, 2026 at 9:15 PM CET, Andreas Hindborg wrote:
>> Export lock::do_unlocked publicly. Add documentation for the method.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
>> ---
>>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> index 46a57d1fc309d..f390cd7ba0762 100644
>> --- a/rust/kernel/sync/lock.rs
>> +++ b/rust/kernel/sync/lock.rs
>> @@ -235,7 +235,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
>>          self.lock
>>      }
>>
>> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>> +    /// Temporarily unlock the lock to execute the given closure.
>> +    ///
>> +    /// This method unlocks the lock before calling the closure `cb`, and re-locks it afterwards.
>> +    /// This is useful when you need to perform operations that are not allowed while holding
>> +    /// certain locks, such as allocating memory (which is prohibited while holding a spinlock).
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{new_spinlock, prelude::*};
>> +    /// # use pin_init::stack_pin_init;
>> +    ///
>> +    /// stack_pin_init!{
>> +    ///     let lock = new_spinlock!(())
>> +    /// }
>> +    ///
>> +    /// let mut guard = lock.lock();
>> +    /// let mut buffer = KVec::new();
>> +    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
>> +    ///  guard.do_unlocked(|| {
>            ^
> Spurious space.

Thanks. Code formatting in comments is a problem in my setup. `rustfmt`
is not much help.


Best regards,
Andreas Hindborg



