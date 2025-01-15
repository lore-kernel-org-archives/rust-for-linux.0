Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D366248BA4;
	Wed, 15 Jan 2025 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940115; cv=none; b=ObF2TEnbSRlqA12E1Nev7AmYYc1jON2SRUKXrER31Kytz/tP5kzOhizbNR8lUiKxGxsV8myo1oQn2UgSW3VHBonXKNXMwwwgab9ReLrYRiAcD7YiPQaT0RL8V4IFLWVywmYdaVOkxLSAwju7z0MQZVEsyBu29Js0ZrEtEg8d+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940115; c=relaxed/simple;
	bh=FRtbuhjiylr+Wbp99jFLw2Gd5DdCSi8t091xRzeScx8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cEBenwWMaxGE1pgpw0PlKh9cxlBxZGuAwE30NYEqMeNfOww3PiCzORS4nFJREnBUSbtW+6oPkRlhzlW+NCyBV+FwCCffbHfQWkA1xY4foFJFgRlMvo1gGf6F7ZQQ7b4vXi3SZ5pJUpM0vMIzC6QMmGfjK+o92RhGB0cpVyFk0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOzhjOHE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOzhjOHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAF6C4CEDF;
	Wed, 15 Jan 2025 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736940115;
	bh=FRtbuhjiylr+Wbp99jFLw2Gd5DdCSi8t091xRzeScx8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bOzhjOHETXDPA6ytUFLA1dj1pCpDfCAvA+3ZtpQosdMEq8+Beg2HNMQhev3V731KZ
	 glQxDqT1LYsUOkJ1NKi+VyogDpo/08e0whsCCW4oKKyPi99cWutQNTkQ7vi7en7gLT
	 ePzeWx7Jpx5g+dw4t590GcQLZ8rGPjzbtsPKQGyFvCKG6sXTtnBZ3/+QOxvd0WGTPy
	 ZJe6YRtPPj7WAI/NGmFlt/9AJTV2AyEjwyAwK2Ta7TG+BKJHATJ7SWudwLDmN6j7Ej
	 Gj8429rY6b23nhc/E9fle82mHOVNcs1cq4hKbWTaR/wA/3PXUMbVHXS5xJIj668+im
	 Xdo6WTLF9EoBQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Lyude Paul" <lyude@redhat.com>,  "Guangbo Cui" <2407018371@qq.com>,
  "Dirk Behme" <dirk.behme@gmail.com>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/14] rust: hrtimer: allow timer restart from timer
 handler
In-Reply-To: <CAJ-ks9=0HRjwqqrLZ2QjyjYw6frK=zu5_ZG5Jmb=fCRXefBmLQ@mail.gmail.com>
 (Tamir
	Duberstein's message of "Tue, 14 Jan 2025 12:32:45 -0500")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-5-f71d50f16482@kernel.org>
	<Qz3-uMYVmDmNuj3wUnPV5wK3iFA5J7TfKSByEYeFChySo0SY1m6hAIvqhxzFUD1Qu1QBmtm5DZffaJ4qKG4Bcg==@protonmail.internalid>
	<CAJ-ks9=0HRjwqqrLZ2QjyjYw6frK=zu5_ZG5Jmb=fCRXefBmLQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 12:21:33 +0100
Message-ID: <87y0zccog2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Fri, Jan 10, 2025 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> This patch allows timer handlers to report that they want a timer to be
>> restarted after the timer handler has finished executing.
>>
>> Also update the `hrtimer` documentation to showcase the new feature.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/time/hrtimer.rs     | 37 ++++++++++++++++++++++++++++++++++=
++-
>>  rust/kernel/time/hrtimer/arc.rs |  4 +---
>>  2 files changed, 37 insertions(+), 4 deletions(-)
>>
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index d0842c7c4c6ddffeef9a79cbf9727819060e4333..50e8c23578b5cf7196893ac8=
8d9547fc027f1f04 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -167,7 +167,7 @@ pub trait HrTimerCallback {
>>      type CallbackTargetParameter<'a>;
>>
>>      /// Called by the timer logic when the timer fires.
>> -    fn run(this: Self::CallbackTargetParameter<'_>)
>> +    fn run(this: Self::CallbackTargetParameter<'_>) -> HrTimerRestart
>>      where
>>          Self: Sized;
>>  }
>> @@ -262,6 +262,41 @@ unsafe fn start(self_ptr: *const Self, expires: Kti=
me) {
>>      }
>>  }
>>
>> +/// Restart policy for timers.
>> +pub enum HrTimerRestart {
>> +    /// Timer should not be restarted.
>> +    NoRestart,
>> +    /// Timer should be restarted.
>> +    Restart,
>> +}
>> +
>> +impl From<u32> for HrTimerRestart {
>> +    fn from(value: u32) -> Self {
>> +        match value {
>> +            0 =3D> Self::NoRestart,
>> +            _ =3D> Self::Restart,
>> +        }
>> +    }
>> +}
>> +
>> +impl From<i32> for HrTimerRestart {
>> +    fn from(value: i32) -> Self {
>> +        match value {
>> +            0 =3D> Self::NoRestart,
>> +            _ =3D> Self::Restart,
>> +        }
>> +    }
>> +}
>
> These are for converting from bindings to our enum, right? Why do we
> need both signed and unsigned,

Depending on kernel (target arch) configuration, the enum type will be
either signed or unsigned on C side.

I guess I could try to figure out what kernel configs effect the change
and then do conditional compilation on Rust side, but it seems overkill.

> and why do we hardcode 0 rather than
> using the generated constants?

We should use the constants - thanks.


Best regards,
Andreas Hindborg



