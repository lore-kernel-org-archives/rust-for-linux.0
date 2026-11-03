Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698548;
	b=NGAan3tdLK8V0YbMhDcROP7po+zlbG5+Xyeus0koqaYB8N3p+dQcfdpNPvtWV7s73HWk
	 ckvNZcCkUp2QX84mxrsmqWYBSE2ahUsGX5Vp1yvG5xPoBAl3bLhBibIJOq5lzNuIXTaQw
	 lMrQ6p8HJ73BTsTqbLt7cygnVOzrnST9ef7GmUFHQz/DdzNOAEKgfWL+J6KMymA02Fn0e
	 glkkL1c3tkAM/fo9cRIhov/yo3X6669SEf3sDmXQNNIKp7b3rwAGwNhOAsCkau2ftX9zO
	 1/zl2mjEd5VPUWWiX01bw7rPLMcIXhh1rEA5kXONGdJljmv7kcz19A2apmw+FGJno9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698548;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=gpFVu/yceB6Fg1msM9HwfwlY+GbM47kVog6XkWJbktI=;
	b=KGNEDpu5xGA6LAgr42hbjlsm8rL7P0uyj5PVTiquqRiZq7AfiWmTSEYHbYnBK3u+hNbS
	 ZjAjSvf/LHee4BEDXt9WiQ5CgF7oMXXHWFu5fBk9ZgAVCV0G96RMa31a3CG0B65W35QRu
	 8DlQyWEvvk+8ZIds6LcTkFD2y6ijWxGNKFtIdzela/Ud/YIiJ7uZxng2mNo+yMmm3fFpF
	 +MLV9G2AWFvIdJW6aq9SmhKO8JLT+LXJjoq1z4kCBJeR6IQXhLnaJalBMtKXZZ/WfuH7C
	 FkxMxgQhQ3pIb/v2ctyHK35bTZi9hbP00TMHxUIwxHIoPFkE0HiX955gkTK9h0flhWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bti+Ab9a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A69C606A324;
	Tue,  3 Nov 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bti+Ab9a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C181F000C1;
	Tue,  3 Nov 2026 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698548;
	bh=gpFVu/yceB6Fg1msM9HwfwlY+GbM47kVog6XkWJbktI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bti+Ab9a6dN2nh2HzxisPetb7FvTtwArwySmAxHl7McZmPCXFolymj2PN0wPB6tKS
	 vnSZAR3+O/D75GMf6VxMvz74diUySEnRT8MFiRvQUe76Pm5KQIBs7li55w9ArTQRBb
	 HDqRiaeTISgAL36Le/tI9VrIVTiUqfFpWcVFD9xK/DFHNLTTu4n0shUNPAvqQ5N4UK
	 0HP/gPy+xSQ3udf8QooSSvw9MrwyBBZg4HrZYsvIwlT+DbJKufp3ipgI26AXwPHHQN
	 UpG7lrl57LCV3NXEAQoJDB/lsEmxP53byc0VA0h5ELN+YewdH3KLb1no5OZhz+kLiX
	 w0dWtmosgNMsw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, anna-maria@linutronix.de, frederic@kernel.org,
 gary@garyguo.net, ojeda@kernel.org, tglx@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 2/2] rust: hrtimer: Use
 hrtimer_forward_safe_from_callback()
In-Reply-To: <20261103.111711.1426428689637198062.tomo@flapping.org>
References: <20261101232829.593680-1-tomo@flapping.org>
 <uqohX3cKDZh17tB-JJSkR4WV6BtvMvP4NMJC5JJoemnBUsIjS3tgB2c1emjwPLLUo2s0unyBH-LAcKmQkHedhg==@protonmail.internalid>
 <20261101232829.593680-3-tomo@flapping.org>
 <87se1jmhiw.fsf@t14s.mail-host-address-is-not-set>
 <20261103.111711.1426428689637198062.tomo@flapping.org>
Date: Tue, 03 Nov 2026 10:35:01 +0100
Message-ID: <875wyemf5m.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Mon, 02 Nov 2026 15:31:35 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>> 
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> Safe Rust code can start a timer while its callback runs. A timer
>>> started through Arc<T> or Pin<&T> can be started again from another
>>> clone or copy of the pointer. HrTimerCallbackContext::forward() calls
>>> hrtimer_forward(), which writes the expiry without the base lock, so
>>> the write can race with the concurrent hrtimer_start().
>>>
>>> Call hrtimer_forward_safe_from_callback() instead. It does the update
>>> with the base lock held. If the timer is already queued by a concurrent
>>> start, the expiry is left alone and 0 is returned.
>>>
>>> HrTimer::forward() keeps calling hrtimer_forward(). It takes
>>> Pin<&mut Self>, so no other reference to the timer exists and no
>>> concurrent start is possible. Narrow the safety requirement of
>>> raw_forward() to exclusive access, since the callback context no longer
>>> uses it.
>>>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> This looks good to me.
>> 
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Thanks!
>
>> While reading this, I thought we should expand the safety requirement
>> for the handle trait, because even though handles keep the callback
>> target alive, they do not own the target. The armed timer does. And so a
>> (future) &mut method on the handle is not allowed to mutably access the
>> target. This implicit today, but I thought maybe we should make it
>> explicit.
>
> I agree that we should make this explicit. It does not depend on this
> series, so could you send it as a separate patch? A few comments below.

Yes, I did not intend to hijack this series. Just wanted your input.

>
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index ab7c568b8855..84f45a7a3a17 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -771,6 +771,14 @@ fn run(
>>  /// is running. If the timer handler is running when the handle is dropped, the
>>  /// drop method must wait for the handler to return before returning.
>>  ///
>> +/// While the timer is armed, the callback target is borrowed by the timer: the
>> +/// timer callback can create a reference to the target at any time, and for
>> +/// some pointer types that reference is exclusive.
>
> The module doc defines the timer states as stopped, started and
> running, and does not use "armed". Could we use these terms here?

Yes, good point.

> The
> callback creates the reference only in the running state, but the
> requirement needs to hold in both the started and running states,
> because a started timer can move to the running state at any time.

>
>> +/// Implementers must not create
>> +/// a reference to the callback target that would conflict with the reference
>> +/// that [`RawHrTimerCallback::run`] creates for the pointer type in question.
>> +/// Deriving raw pointers from the target, as the [`Self::cancel`]
>> +/// implementations do, always satisfies this.
>
> Even without creating a reference, an access through a raw pointer can
> be UB, for example a write to a field that the callback also uses.

Right, but creating the pointer and using it for offset calculations is
fine. I can try to make that more clear.

> `cancel` is fine because it only accesses the `HrTimer` field, which
> is wrapped in `Opaque`, and hrtimer_cancel() takes the base lock. So I
> think the requirement should be about accesses, not about references.

I see. I'll try to rephrase a bit.

Best regards,
Andreas Hindborg


