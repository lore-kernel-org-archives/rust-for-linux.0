Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10E2F616B;
	Thu, 19 Feb 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508148; cv=none; b=ti0JSOqtIXqD+SytzYCrXjxn/TW0b6RfnajGhvujHfTURVEzUIIsw9ewYuw/VbPkmHUpV+OtCDJOa2IAoDzcNFVKj/Ae5SiE023aa4xysQWdbSJ6wSuGrrR33ppiv1bIRmbdZBlq50wZZXiAQpUBvwTJSy+mRKLeSOydqUMFzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508148; c=relaxed/simple;
	bh=mfKzZg0pxUPaZA5nEFIBaRUHWFTagxHwCutdgmHwm8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gMd59TvRJOOLkbBBLdJHZdCUb2wfgby6z/GxJCr3h3z9t/Fd4Na6kxVQQ7MZQbiA9VqwPx/6NR/iuiFm61mMMySkCnbk2fensMIo/wteBs1xjUAHFD9KZ2vMj0Cfmpe7HBUqsLkyC4o+GQ8ecouVtABzXk8ox4Zz8kxHRBs4BRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4tV8TTD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4tV8TTD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDA5C4CEF7;
	Thu, 19 Feb 2026 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771508147;
	bh=mfKzZg0pxUPaZA5nEFIBaRUHWFTagxHwCutdgmHwm8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n4tV8TTDUjJ0Z3jaLcmOGA81nFLXTm3s8oYGr+j8ifUmu4qxBdfuOQc205VyL5I4P
	 xsI8tmijdWh6g0tUL2L2/feregf3zzqIRhex/V0XBYIozzdwni0uwvfGMm05fsOF9Z
	 DjWIyAhf3DmiXYVkhOD5qmoGc/ONXRGKT9lx6RJVW28ctwI7ErNeBfxp3UZt1FtfrP
	 xdeyOvL2MOa9axlx8kqsgzSOyxWFp8voxgEqYqgo2sRf+56gBu0dMeHB0A4oL483BI
	 PqOvfRr5px/9gJJZkhBHQMORvYUEMmezpzb/523Hy/+ELBK0AMBVp4BVgTUj0rqKuf
	 XP9nIUfekExoA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel
 Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] hrtimer: add usage examples to documentation
In-Reply-To: <aZcChDe_Y3eyLuYS@google.com>
References: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
 <FjU46Lj_VkBzcrM_lgxJ5yKxckcS_Mn_BmlpYOBGilyRIAmNQgbu5Sh0hxLkTzcazazZr9j6ZhD0dg9Djz3Iuw==@protonmail.internalid>
 <aZcChDe_Y3eyLuYS@google.com>
Date: Thu, 19 Feb 2026 14:35:39 +0100
Message-ID: <87o6lkamac.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Thu, Feb 19, 2026 at 12:57:45PM +0100, Andreas Hindborg wrote:
>> Add documentation examples showing various ways to use hrtimers:
>>
>> - Box-allocated timers with shared state in Arc.
>> - Arc-allocated timers.
>> - Stack-based timers for scoped usage.
>> - Mutable stack-based timers with shared state.
>>
>> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
>> ---
>> Changes in v2:
>> - Sprinkle blank lines for readability
>> - Change heading for Arc example
>> - Fix error handling.
>> - Link to v1: https://lore.kernel.org/r/20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org
>> ---
>>  rust/kernel/time/hrtimer.rs | 336 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 336 insertions(+)
>>
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 856d2d929a008..2d7f1131a8131 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -66,6 +66,342 @@
>>  //!
>>  //! A `restart` operation on a timer in the **stopped** state is equivalent to a
>>  //! `start` operation.
>> +//!
>> +//! When a type implements both `HrTimerPointer` and `Clone`, it is possible to
>> +//! issue the `start` operation while the timer is in the **started** state. In
>> +//! this case the `start` operation is equivalent to the `restart` operation.
>> +//!
>> +//! # Examples
>> +//!
>> +//! ## Using an intrusive timer living in a [`Box`]
>> +//!
>> +//! ```
>> +//! # use kernel::{
>> +//! #     alloc::flags,
>> +//! #     impl_has_hr_timer,
>> +//! #     prelude::*,
>> +//! #     sync::{
>> +//! #         atomic::{ordering, Atomic},
>> +//! #         completion::Completion,
>> +//! #         Arc,
>> +//! #     },
>> +//! #     time::{
>> +//! #         hrtimer::{
>> +//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
>> +//! #             HrTimerRestart, HrTimerCallbackContext
>> +//! #         },
>> +//! #         Delta, Monotonic,
>> +//! #     },
>> +//! # };
>> +//!
>
> Either do not hide the imports, or remove this empty newline.

This got me a few times already.

I'm undecided if it is better to hide the imports or not. What do people
think?


Best regards,
Andreas Hindborg

