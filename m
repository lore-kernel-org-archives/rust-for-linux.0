Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2113BE172
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464606; cv=none; b=W0KYtrJ0rPHZ8bf/KY4GkNTgs4ud70Yj0nHA02e5/Y9mXhe6jOoEm8u6hT7swJk4u3osMnh6jSCic8RrL6U5LBVEKeMI1J/t/Bl7jkNocsmIB5RnLPCrXNIYBkIca8UbpiPmBQ0vfKcVNBWWERvr8KR/iExzKgffZJksEn1i484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464606; c=relaxed/simple;
	bh=VV3gLTRHa9pyvn61Kb+5EhItjb3/hRgnC/hX0SUJY6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MXhwBRhUmH3fRaOnUDfJPPGlUQEAHi4kDK/nJSbejt4hsKBI+cB7J9pg8b4txxW9qIC8VQqF4rgcS5xhRBeOyYiwqLn9HYHCQypWZwU+Y0MIXGopbFaHI+ARezVyuUH2cg8ns4IOWgDlLO/AFFPOVNGEKZGuy50QI7IiD5IXbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW/EvvWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW/EvvWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CF51F000FF;
	Thu,  8 Oct 2026 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464605;
	bh=SGGPpeQPnDJkHEciKcVt6lSLyvkk1F7BwAE03AHpf4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PW/EvvWH315Tmw2bGvXMrZxK5C0OFVpZeFSp+0uXCbDWy8gqKfqzFXq7i/qyIWqJ6
	 4AprFh5oK1+ulDxv6LWyT4KKs/6ZlzW5GpYtxyCorB/ZdfhHAgejbk1MhdbHP+nW9s
	 tMsJ1Nu0XcUXw7dhWmXbN1tiZVen0NREssgzG2ecX+O4PP0MnfMk2WGS/Cf21bTEiG
	 yCy08fGgM7NOYBmbvqK9d+1NmZIla7qTf9bSUHtJr24qvEqrmCKZ+9sYBID+OwcLV3
	 AP7odOzq9SsBTb9ZX+0yNsHkXTzHO4mZ2n1P/V9x3wjW/KPjAm6sdzOC2wpsnMzerP
	 CPrLpA6TmZRGw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] Rust timekeeping for v7.4-rc1
In-Reply-To: <20261007.225501.2303547436453055941.tomo@flapping.org>
References: <87ece1eirv.fsf@kernel.org>
 <DOzJmBcnnVm3wwaMPJ41CK0g_4XXYhk_umLH7Q1T8fR4l957fWjO1gJ9OQvY055xk4UMyyrpcah5B_gQdRy5Bg==@protonmail.internalid>
 <20261007.225501.2303547436453055941.tomo@flapping.org>
Date: Thu, 08 Oct 2026 15:02:51 +0200
Message-ID: <87y0c8cpl0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> Hi Andreas,
>
> On Wed, 07 Oct 2026 15:34:44 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> Hi Miguel,
>>
>> Please pull these changes for rust timekeeping for v7.4-rc1.
>>
>> The following changes since commit df2908090cda368b01ff43709f51890076c56157:
>>
>>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v7.4-rc1
>>
>> for you to fetch changes up to 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38:
>>
>>   rust: hrtimer: document handle based design rationale (2026-09-29 09:22:30 +0200)
>>
>> ----------------------------------------------------------------
>> Rust timekeeping changes for v7.4-rc1
>>
>> This time we have a few assorted changes:
>>
>>  - Warnings when passing out-of-range inputs to `fsleep` and `udelay`.
>>  - Rename `ClockSource` to `ClockId` to better align with naming conventions in C kernel.
>>  - Make `CONFIG_HZ` value available as `bindings::HZ`.
>>  - Add a conversion method to convert `Delta` to `jiffies` for use in timeout arguments.
>>  - Add implementation detail documentation for `HrTimer`.
>>
>> ----------------------------------------------------------------
>> Andreas Hindborg (1):
>>       rust: hrtimer: document handle based design rationale
>>
>> FUJITA Tomonori (3):
>>       rust: time: rename ClockSource trait to ClockId
>>       rust: bindings: set HZ to CONFIG_HZ
>>       rust: time: add Delta::to_jiffies_timeout() for timeout conversion
>>
>> Sang-Heon Jeon (1):
>>       rust: time: warn and assert out-of-range input in fsleep() and udelay()
>
> Would it be possible to also include the following two patches in this
> pull request?
>
>   rust: time: make Delta::ZERO generic over the time unit
>   rust: time: add Delta::as_jiffies_unsigned()
>
> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-2-tomo@flapping.org/
> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@flapping.org/
>
> Three patches depend on them: the workqueue and condvar patches in the
> same series, and the serdev patch. All three change code that is
> merged through trees other than rust-next. If the two patches are in
> v7.4-rc1, the three patches can go through those trees in the next
> cycle without a dependency on the timekeeping tree.
>
> Both patches are small and straightforward, and Gary has already given
> his Reviewed-by.
>
> If it is easier, Miguel could also apply them to rust-next directly
> with your Acked-by. That would work for me too.

I'm not taking any more changes for timekeeping this cycle. Up to Miguel
if he wants to take them directly. Otherwise wait for next cycle. Either
is fine with me.

Best regards,
Andreas Hindborg


