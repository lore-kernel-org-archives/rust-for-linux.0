Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685C216392;
	Thu,  9 Jan 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428815; cv=none; b=duLIfOCUnrMUp31qOnoD1aCwLKO9IU+l8+GDFLrM8hKuPpoRD5gQTxhGVLpizaHOehVIDnn2s771mTmUfINx29QwPPjGm2sNXI+xI7intKqN91EIhSkqE8MFTd39CzZKsZsz4zzTfXSb+qcEq4iJjbV8EfRG3iJUrv50fSwQ7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428815; c=relaxed/simple;
	bh=WiaDX3447fp5qxWtRY0TlYWTnbiHbBuIKDZfmfg7J4Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XRT+8pPAFzbgP7flfBPTfEW1Z0A2V/Lty9Q2AOEd60BDrYTnHhSzJaXPUWWAs69GIwJNBizNrzNU18uqguR9R75ali6s+Lj5SN3W2103dZ+xReCllJiPWB62jqt3ODScFKQze2YHkarN3x8tl0phbE2FUY3UzyQKsYBYoaqVuAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfpUsJo6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfpUsJo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2E0C4CED2;
	Thu,  9 Jan 2025 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736428814;
	bh=WiaDX3447fp5qxWtRY0TlYWTnbiHbBuIKDZfmfg7J4Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MfpUsJo6HmqRX1+ZIR86H5bQQq0AeOFpitoZYJ7/FLlLbnhSDqkfxFOzl0mhXWYR0
	 nTQgsWtO3dl8VhzeqYaIwrtopJ0JMQk1RpZqQbxZ8je7juTu7fLdKPOFnPvb+Te1aK
	 clPxP0S/Pz7COSOInbyjqTxuARkio4eVHZmXHlqjCJSkyIPacNe8v61HSkqmRCqksn
	 okMXMvd2/XSZNO+EcKoQWuTzkDMN2FDX2arG17g/gEzHmgYMHMmWM9H53HtQ34YXoL
	 ig7vyxU9jVMgdYxKgkhYNSQt3I/eG8udG3SJIiqOgcc754jEDRchTcO7bmv/W8KzMy
	 qR6jDjTy5VVHA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Guangbo Cui" <2407018371@qq.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Lyude Paul" <lyude@redhat.com>,  "Dirk Behme" <dirk.behme@gmail.com>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 05/14] rust: hrtimer: allow timer restart from timer
 handler
In-Reply-To: <tencent_74DA73ADC948EF2F933592E880CC09D35B09@qq.com> (Guangbo
	Cui's message of "Thu, 19 Dec 2024 22:50:01 +0800")
References: <20241217-hrtimer-v3-v6-12-rc2-v5-0-b34c20ac2cb7@kernel.org>
	<20241217-hrtimer-v3-v6-12-rc2-v5-5-b34c20ac2cb7@kernel.org>
	<H7fH3H6SrsqtETrWgmThmdGUchRyUZh6hQzk4lVMjEOiY_VfUAHbzIGuWZda0aPObsMSxSfyDxhAC9QSTmiPBw==@protonmail.internalid>
	<tencent_74DA73ADC948EF2F933592E880CC09D35B09@qq.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 14:20:03 +0100
Message-ID: <87bjwg9la4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Guangbo Cui" <2407018371@qq.com> writes:

> On Tue, Dec 17, 2024 at 04:17:36PM +0100, Andreas Hindborg wrote:
>> This patch allows timer handlers to report that they want a timer to be
>> restarted after the timer handler has finished executing.
>>
>> Also update the `hrtimer` documentation to showcase the new feature.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/time/hrtimer.rs     | 37 ++++++++++++++++++++++++++++++++++++-
>>  rust/kernel/time/hrtimer/arc.rs |  4 +---
>>  2 files changed, 37 insertions(+), 4 deletions(-)
>>
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 178e33c1f656d2f834e45b004486f6e5fe1813dd..38a8251ea6ba4d84dadad009ed540c150bea4775 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -167,7 +167,7 @@ pub trait TimerCallback {
>>      type CallbackTargetParameter<'a>;
>>
>>      /// Called by the timer logic when the timer fires.
>> -    fn run(this: Self::CallbackTargetParameter<'_>)
>> +    fn run(this: Self::CallbackTargetParameter<'_>) -> TimerRestart
>>      where
>>          Self: Sized;
>>  }
>> @@ -262,6 +262,41 @@ unsafe fn start(self_ptr: *const Self, expires: Ktime) {
>>      }
>>  }
>>
>> +/// Restart policy for timers.
>> +pub enum TimerRestart {
>> +    /// Timer should not be restarted.
>> +    NoRestart,
>> +    /// Timer should be restarted.
>> +    Restart,
>> +}
>
> If we restart the timer, we may also want to `forward` the timer. I tried
> this series, and wrote some samples, found that it's inconvenient to write
> a loop timer.
>
> This is not a problem, just my feedback on the user experience.

Thanks! Lyude Paul has some patches that adds methods that operate
within timer context, including forwarding. I think they will send them
after this lands.


Best regards,
Andreas Hindborg



