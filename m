Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32263A257C;
	Tue, 29 Sep 2026 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705017; cv=none; b=JuUiCZrWPlp921M7GXahvybHhxLxqAUVii9FxU4Z9bTy2GmfBplVdf+2exM61FKsT62Gawbeq5SeVTRU63gvFte7TT83mZnxBTTldB+KRsc9LWYLuGTxS+FXPpx4xjLEHwFf3Ihni3IXmFpxj4PvyfWlLWoivTsIhMd27FVbOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705017; c=relaxed/simple;
	bh=zD2doWgwT4bqf0agVJ3k3ZxPe3/tpjLSFfMmmwoa8gQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VJrt0Je1DoDdfhdRA9O2joNcUPkMx6VCj4ri3/kkd4M5Zqa63g9QzXAPEA99Vdmx+6Su5k1L7rqTIATqenNtQNugG4ArRfY/dHSY66tkgGBcxnDYktl3Q1nXd3Z+6yD9pKfiYEO9ghPHLWgieDtsztwmpF5elon9eIW+PPss1uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGEcYizF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGEcYizF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2CD1F000FF;
	Tue, 29 Sep 2026 18:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790705015;
	bh=+veBZrMyqc9eVw5PlMkjRSIdNfyxwGCV+zfaborpVQE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cGEcYizFp/IOrwtKIyznQVBLJq8EXnMUrH9RMR4kcU0Gf04x9UUYDUUfJPJuAZ5N4
	 1UDmb1JOfsdHFEO994JvteJoBA67KjBYDm10dDc9IJX+TePb8AOpkOUg4hIrBGq5pO
	 mwowKZBNoQPt1EutZ7Q7bTTVy1zkXL4JyWCsluSOniPTY2suW8Pm7Ji6dqnVyDzne5
	 512Lf7p6b1GC2TKBrTRG51fLmY/qy9oMk0HUfgiZWciVMW9RlCH4RZ7l9p6HvHiCIG
	 otcmaCekPszO/ftVsIWh/DAwiQoY1BAyM8r44OIGy+ccc3d70GS3i8GhGvr3lpyT9W
	 2N8Km/fBLd2vw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Gary Guo
 <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Lyude Paul
 <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Onur
 =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>, Miguel Ojeda
 <ojeda@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: sync: export lock::do_unlocked
In-Reply-To: <DLRXW31Y0IVK.3A3NJVS2BG39M@garyguo.net>
References: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
 <N1IBV5ko8VdO1uPeg7myJ5jVnnfJI-s5phM0IuhjOxWo1AvKFtlvojnvOBY1fnhKJpl9GKVkN0dD6GEM3f1FKQ==@protonmail.internalid>
 <DLRXW31Y0IVK.3A3NJVS2BG39M@garyguo.net>
Date: Tue, 29 Sep 2026 20:03:20 +0200
Message-ID: <87zex0rl3r.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Sep 29, 2026 at 3:45 PM BST, Andreas Hindborg wrote:
>> Export lock::do_unlocked publicly. Add documentation for the method.
>>
>> Reviewed-by: Benno Lossin <lossin@kernel.org>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> Changes in v3:
>> - Rebase on v7.3-rc5.
>> - Do not import prelude in example (Alice).
>> - Link to v2: https://msgid.link/20260605-export-do-unlocked-v2-1-e23001390231@kernel.org
>>
>> Changes in v2:
>> - Drop spurious space before `guard.do_unlocked` in the doc example (Benno).
>> - Un-hide the imports in the doc example so the rendered docs no longer have a spurious blank line after them (Alice).
>> - Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org
>> ---
>>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> index 10b6b5e9b024..edfff9e10199 100644
>> --- a/rust/kernel/sync/lock.rs
>> +++ b/rust/kernel/sync/lock.rs
>> @@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
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
>> +    /// use kernel::new_spinlock;
>> +    /// use pin_init::stack_pin_init;
>> +    ///
>> +    /// stack_pin_init!{
>> +    ///     let lock = new_spinlock!(())
>> +    /// }
>> +    ///
>> +    /// let mut guard = lock.lock();
>> +    /// let mut buffer = KVec::new();
>> +    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
>> +    /// guard.do_unlocked(|| {
>> +    ///     buffer.push(5u32, GFP_KERNEL)
>> +    /// })?;
>> +    /// # Ok::<(), Error>(())
>> +    /// ```
>> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>
> Do we want to keep the name `do_unlocked` now this is public?
>
> I think we can drop "do_" and just call this `unlocked`, consistent with popular
> Rust ecosystem crates like parking_lot and spin.

If this is the established way, I think we should do that.

I don't think we need a new version of the patch, just fix it during
apply?

Best regards,
Andreas Hindborg



