Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D91410D13;
	Tue,  9 Jun 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007929; cv=none; b=O0RvVSdjKVSrGjeGm8CGMmVCU+tnh7QWq9CjUIbRpXauS6V2TQCqlPzN/roxxvcoZJGlBkI6agfZVpa839fJHlyp+tFyMUAGGiz4sNB/ypcAso/3NBcT2bLRpjq8V2U1kvlQrc6LCxYVS1zasw4HNZUmR67MPBK2cehOORlB/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007929; c=relaxed/simple;
	bh=CuOLTi47UYA7lh5RdbgwZEUGC3GsCT+wTbvUKwVuTXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bN1URFhh9m6FjBqdMNKw2NHhBxo+AQo6fDvNSAlm8wAJ0Np7TrgpG+CxXHiEUuCZbpaYh4VK1BcX51/yLSeyevfnTdaegR27TbMrZDC4UDnb6qXmc1oE+WsrLeyoD+AERE6YjgO0AZvh7vANs+v04jywH4YZQSS4cZGkiOWJjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPFMXZY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPFMXZY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29081F00893;
	Tue,  9 Jun 2026 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007927;
	bh=WWXHBJOQMjUBeSyI1mHAhmNvwI0hDD8KYhqys6pBfOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aPFMXZY4eQaWHXIWn47NKIexmELfhENL9lzWVSx1EmCv+OASp9VEn2BTJo49gBJxF
	 2EgXhiyT0MJWoqwjpXbSKrdoW1GgohpClWOk4TAXyhi10PvALbIGyh5dX/D67l1EBq
	 Pe2I1BzP7F0ROgz3LGtbrNhC+3YHv/kPza5Rk+ZqF2FnmLfCrGcxYJc3/KdSkZvO8b
	 g5wcsj/hNqTGqY+MwuewmrSHO6eHIAUisRX+wsdbWPslnFoWzakwakGKCi44UDuUJc
	 tQ3lKdZH/ltgDvugXk+XsTD6qEdOrGoyrmLCqYkGmm2Km7YAQZ9+DIi8KeI6OyIpT7
	 a6Wg6BGcIXiDQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: ojeda@kernel.org, sashiko-reviews@lists.linux.dev,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 01/11] rust: xarray: minor formatting fixes
In-Reply-To: <20260604201631.450B51F00893@smtp.kernel.org>
References: <20260604-xarray-entry-send-v4-1-965f6028790e@kernel.org>
 <Yb-tTMBfsrAuBw9NXgUPl-MY1hGnE7OrQD5JOEwzYuL2Af2BZYrfDg5FzWfVfmulrnBeioLiEacxVMKrswog9g==@protonmail.internalid>
 <20260604201631.450B51F00893@smtp.kernel.org>
Date: Tue, 09 Jun 2026 12:57:35 +0200
Message-ID: <87fr2wgew0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] `Guard::store` temporarily drops the exclusive lock, violating `Guard` mutual exclusion semantics.
> --
>
> commit dd1e562319819f32e9d1d6de7db886673c5422d7
> Author: Andreas Hindborg <a.hindborg@kernel.org>
>
> rust: xarray: minor formatting fixes
>
> Fix formatting in xarray module to comply with kernel coding guidelines.
>
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index 46e5f43223fe8..b80fb7a262d0c 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>
> [ ... ]
>
>> @@ -44,7 +63,10 @@
>>  /// *guard.get_mut(0).unwrap() = 0xffff;
>>  /// assert_eq!(guard.get(0).copied(), Some(0xffff));
>>  ///
>> -/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), Some(0xffff));
>> +/// assert_eq!(
>> +///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
>> +///     Some(0xffff)
>> +/// );
>
> [Severity: High]
> This isn't a bug introduced by this patch, but since Guard::store calls
> __xa_store which explicitly drops the xa_lock to allocate memory if called
> with blocking flags (like GFP_KERNEL here), doesn't this violate the expected
> mutual exclusion guarantee of the Guard?
>
> In Rust, a lock guard is fundamentally expected to provide strict, continuous
> mutual exclusion for its entire lifetime. Temporarily releasing the lock while
> a Guard is held breaks this invariant. Any caller relying on the Guard to
> ensure atomicity (such as check-and-update patterns) will be exposed to silent
> Time-Of-Check to Time-Of-Use (TOCTOU) race conditions, as other threads can
> mutate the array while the lock is dropped.

Should we rename `Guard` to something else to clarify this, or do you
think it is enough with added documentation on `Guard`?


Best regards,
Andreas Hindborg



