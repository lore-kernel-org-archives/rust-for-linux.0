Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CE3B0AD7;
	Mon,  8 Jun 2026 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907667; cv=none; b=Jw/fOiyvaZP1tM8Q4+k9x8/wUTiGOEFmlp0aDkbZRORSXUdwQrut1RrX7dW860G5TSJfgKEYZ0Za7cz0XIe3TdSKf0bHI9m19G2b5lF9U8nGA8JP7vHTo58wBG6EIarSCA5yB1ykOJBRuwEpUQrfDziMiAYKsKjitqD9tx/3IKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907667; c=relaxed/simple;
	bh=D4g5eDSJXC7cVyGppOZyxIn30y1UfKmDU6tKqF8yj7Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ktU8jH94Lsn+KR5yoqE8o1omV3N0YylBtl98A+Zp3u//xLy+IF60RMgJMEFrrLGR7ETgIXVT8wEl1ydaiU08LM2Ct1R1SmVmd2ABKAgatcAieTAY5MLnwVBmNHJvUw+evaHUBc9d7rslcU/N+U0NQE/CULKzkExMZU8MfWB8q6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6qFc6Jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6qFc6Jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053541F00893;
	Mon,  8 Jun 2026 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907664;
	bh=q+53OteJ2E4IuAiqji5VA+JK44hJry6UkrYtB2IY510=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=k6qFc6JdoZBZr+E7Es4fNL5mfd4yW805VTwKYf0fdvrmvET3a8ZQ9hMFp9fkjc0D6
	 Lp2Qio19y86eCiQacafHNrcWGx52Wn+X5ZspuT/jKTbhfHdr5xWlz4UqwPLs8xHLEt
	 LbjRLJSG1ZY94CU6BQPCAnTiUyS6xFs4PW32/YuoaVz5J08TfFb1tEcP64VF+6JiIe
	 MzujJEacISKGmgy0XAfJ4XsHM0oPIFMNzSAaLzXQDF2kNAsoSLbDYPiddkaZryNFhJ
	 Zx+71oE8r3SM9XTukPFYGvMBO/wtkeRKrQB01WxgtvRSOPXrOVrQQeZFZmNgdX6C3u
	 hdqE5gw6+3P/w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Miguel
 Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng
 <boqun@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: export lock::do_unlocked
In-Reply-To: <aiZvbCad0DeRu60g@google.com>
References: <20260605-export-do-unlocked-v2-1-e23001390231@kernel.org>
 <aiZvbCad0DeRu60g@google.com>
Date: Mon, 08 Jun 2026 10:34:12 +0200
Message-ID: <8733yxig6z.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> On Fri, Jun 05, 2026 at 02:57:07PM +0200, Andreas Hindborg wrote:
>> Export lock::do_unlocked publicly. Add documentation for the method.
>> 
>> Reviewed-by: Benno Lossin <lossin@kernel.org>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
>>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>> 
>> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> index 10b6b5e9b024..9c549e469785 100644
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
>> +    /// use kernel::{new_spinlock, prelude::*};
>> +    /// use pin_init::stack_pin_init;
>
> I think the prelude is imported automatically.

Is this part of our kunit harness?

Best regards,
Andreas Hindborg


