Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEB1547E2;
	Thu, 16 Jan 2025 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054376; cv=none; b=QNE3dXWmXBXWKhtZkUbTWCqBZ0h2L037GTcSH9fCBBUoJxQZTMM6R7uR16kieesOhrxYTcq9mXt2lAgSJdsHXSqGZ220G50vFV5hLEg85FR4/RWWwDY/XSM78+z7w2UWk0v/gxmw6y5cvF5CgLcrPXI8ZkvZVx1fM87u7D32IZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054376; c=relaxed/simple;
	bh=CM/h96uW0N2qUVdMNQnx8bxCK/lhyuO49yuVpGe0NDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kBAvUOdB/GFjP0tBn2n1JY2f36lnAqZWDXMw8d2lwmFfyHy0Zhb0geDluvbN+KHE6tPcy6zUp4XjbxItdW2HiTtTKMl2TUYenFtPEWzxMdyHasXBcvTzqbVEwY+e6YxLS/Hx+POjUZMb7LZhPl4hOvcJaUBtLWpuMfq+HhDithE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MItshAp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MItshAp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D76FC4CED6;
	Thu, 16 Jan 2025 19:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737054374;
	bh=CM/h96uW0N2qUVdMNQnx8bxCK/lhyuO49yuVpGe0NDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MItshAp8fDF/Ayd1VtR9UjuvXG4GzXKWTrBAS6JbNxj0iuNgK52ODSctx6JIWpW72
	 QEN/Q0iGT6LCFJvhXN3k3lUNtwsEcr/iUzHGFmchLu2cUvdVLTOiMzv5liBYgyjgo/
	 FnMeOz4QrJ1LpKc1wmMWJGONFJlGd4GeW2yqIqS0N+JKFAg8O+y0XnKVvV9sI1XQQh
	 AoOl+kJ3hw9OXDEG6A/KJUdjanFbe5nDXs31ZpUkZCcFSXS85yqVna4+euvnUwO6Aj
	 7iHzPsXNOuSpPFfF6Jjp7ki4A47gzacHQK0g0JrWGeQrbINkVFdRF885AaSph1kL9X
	 +1/hmMpUKTdxg==
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
Subject: Re: [PATCH v6 01/14] rust: time: Add Ktime::from_ns()
In-Reply-To: <CAJ-ks9nwiWo0T5rQdQEMGg-9X1oEQVfTa6HY+Jan6aTwtsuSFg@mail.gmail.com>
 (Tamir
	Duberstein's message of "Tue, 14 Jan 2025 12:04:10 -0500")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-1-f71d50f16482@kernel.org>
	<M6B7B9BovJ0XnaadV9NjZwQ0hwUW7LMrvp_ipuTKJFE6dgeh0X_yhm0iv8ZAnPLHQaAb7SBX5_ZwOuPpbhFYmg==@protonmail.internalid>
	<CAJ-ks9nwiWo0T5rQdQEMGg-9X1oEQVfTa6HY+Jan6aTwtsuSFg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 16 Jan 2025 15:11:38 +0100
Message-ID: <87msfqdf1h.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Fri, Jan 10, 2025 at 3:20=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> From: Lyude Paul <lyude@redhat.com>
>>
>> A simple function to turn the provided value in nanoseconds into a Ktime
>> value. We allow any type which implements Into<bindings::ktime_t>, which
>> resolves to Into<i64>.
>>
>> This is useful for some of the older DRM APIs that never got moved to Kt=
ime
>
> Missing period.
>
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/time.rs | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 379c0f5772e575c9ceacb9c85255b13501db8f30..f59e0fea79d3acfddd922f60=
1f569353609aeec1 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -8,6 +8,8 @@
>>  //! C header: [`include/linux/jiffies.h`](srctree/include/linux/jiffies=
h).
>>  //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
>>
>> +use core::convert::Into;
>> +
>>  /// The number of nanoseconds per millisecond.
>>  pub const NSEC_PER_MSEC: i64 =3D bindings::NSEC_PER_MSEC as i64;
>>
>> @@ -63,6 +65,12 @@ pub fn to_ns(self) -> i64 {
>>      pub fn to_ms(self) -> i64 {
>>          self.divns_constant::<NSEC_PER_MSEC>()
>>      }
>> +
>> +    /// Creates a new Ktime from the given duration in nanoseconds
>> +    #[inline]
>> +    pub fn from_ns(ns: impl Into<bindings::ktime_t>) -> Self {
>> +        Self { inner: ns.into() }
>> +    }
>>  }
>
> Should this be called `from_nanos` to be consistent with
> `core::time::Duration::from_nanos`?

I am OK with that. @Lyude you OK with me changing this?


Best regards,
Andreas Hindborg


