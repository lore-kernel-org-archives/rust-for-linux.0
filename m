Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770537AA9C;
	Tue, 29 Sep 2026 20:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715371; cv=none; b=rS+FivgxjgPYkgLKz5hgRIx9J+6eXM/i7AC/KG7Ogs1AifpED9mOBbmpELd8vXNGSYX1pO1MJSSG04eWA2E73BgM/JwYfylPvY6VAW3pVNWTcnBzbUMSDcWMZbiRBm3ZSALrOF+rItPl8BsKFpGqx6Zl+H5WQ3pxxMNtX9mcQCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715371; c=relaxed/simple;
	bh=Y6tLZ+MWmEK3aPAI7iP6Dz2kbWCHr5Co6SSMUqBltJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dZUyz8jCQ6XUAm1v73HIeYY5f+Q6AIQlI2f8I2Esv0a7OHoQViMMHTFbrDDIdSraZjjAsiqTKdLIsrRhaalrQgbcmT7Ee2jyMBLtRpL20fuPa9fgHMZUZaUASf7dZ3wcj9TKA5r58R7gEEwC0pDEmKfrGaC7TtwWxvx5QuArDzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs6W0L7O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs6W0L7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A3F1F000FF;
	Tue, 29 Sep 2026 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790715369;
	bh=egeJiaAABQ6NN/KxfVE7y0aHVwqQk0f06ablB231vIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Qs6W0L7ODxRwl5KzB9FwrQyINYr7k7hSASbeNZeaNn4oxg0yzRCDjlG9vXh0oElPm
	 TU+mCK4lsMfk+TfBefehlWEG6IgNuMEYzooCzfFfArRmnb0mp/TkIvngqEhE6tgHfX
	 Zf7cS1AMMJXpwlhr1h7CKunFIKV59ZYgzgvZ5I0Hdh41+VDUQaH+bInjD+zUBpVoUZ
	 TNsXvzryzPY7A0CuvQtvp15dtF39kDHIXqqocxOGE1TRC8UGj/FcOVaPwKqL1RCuBF
	 jLkCysPHFFC4NYiVswiXu98R5V8B0zFrU2CYDYcMlpvzEsqHrVZv1Z6bH0ncQZW2CC
	 toY5jIwNFu/yA==
From: Thomas Gleixner <tglx@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Andreas
 Hindborg <a.hindborg@kernel.org>
Subject: Re: [PATCH 1/6] hrtimer: add expiry injecting callback variant
In-Reply-To: <20260825-expires-v2-v1-1-90411c6217c7@kernel.org>
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
 <20260825-expires-v2-v1-1-90411c6217c7@kernel.org>
Date: Tue, 29 Sep 2026 22:56:06 +0200
Message-ID: <877bk3ixp5.ffs@fw13>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Aug 25 2026 at 14:16, Andreas Hindborg wrote:
> A hrtimer callback may modify its own expiry with hrtimer_forward()
> and read it with hrtimer_get_expires(). Both run after
> __run_hrtimer() has dropped the cpu_base->lock, so they race with a
> concurrent hrtimer_start_range_ns() on another CPU, which rewrites
> node.expires under the base lock and requeues the timer:
>
> - The unlocked read-modify-write of node.expires in
>   hrtimer_forward() is a data race against the locked write in the
>   start path.
>
> - The is_queued check in hrtimer_forward() is racy with
>   a time-of-check-time-of-use bug as well: a concurrent
>   start can enqueue the timer between the check and the expiry
>   update, and forwarding an already queued timer changes the expiry
>   of a node inside the timerqueue without re-sorting, leaving the
>   tree unordered.
>
> Timer users which both forward in the callback and arm from other contexts
> must provide their own serialization, e.g. perf's cpc->hrtimer_lock plus
> hrtimer_active flag, see commit 4cfafd3082af ("sched,perf: Fix periodic
> timers"). The requirement is subtle and not enforced; i915_pmu and taprio
> currently get it wrong. For the Rust hrtimer abstraction it is a soundness
> problem: safe code can arm a timer whose callback is running, so callback
> context forward and expiry reads cannot be offered as safe API.
>
> Add an alternative callback variant that removes the race
> structurally instead of requiring serialization. An expiry injecting
> callback receives the expiry snapshotted under the base lock by
> value and, to restart the timer, fills a struct hrtimer_forward_args
> and returns HRTIMER_RESTART. __run_hrtimer() then applies the
> forward and the enqueue with the base lock held. The callback never
> accesses live timer state.
>
> If a concurrent start enqueued the timer while the callback ran, the
> restart request is discarded and the start wins, matching the
> existing "restart == HRTIMER_RESTART && !timer->is_queued" handling
> for classic callbacks. The is_queued check is reliable here: while
> base->running == timer, hrtimer_try_to_cancel() bails out before
> remove_hrtimer() and the timer cannot switch bases, so only a
> concurrent start can enqueue it, and the start path writes the
> expiry and is_queued in the same critical section. Thus !is_queued
> at requeue time guarantees the expiry still equals the snapshot
> handed to the callback: the deferred hrtimer_forward() cannot hit
> its concurrent start check, and an overrun count the callback
> derived from the snapshot is consistent with the forward that is
> applied.
>
> The new callback pointer shares storage with the classic one in an
> anonymous union, discriminated by a new is_ext flag placed in
> existing padding; sizeof(struct hrtimer) is unchanged and the
> classic callback path is unaffected. hrtimer_update_function()
> rejects timers with an expiry injecting callback.

Aside of the horrible name (what is "ext"?) the whole mechanism is
creating a false sense of "safety" as the same problem exists when the
timer callback simply sets the new expiry time without invoking
hrtimer_forward().

Also why is Rust special and wants to delegate the external
serialization requirement to the hrtimer core code and thereby adding a
boatload of extra conditionals into the hotpath to distinguish between
the two callback variants?

Yes, you found an example for the downside of this design in the i915
code. That's not surprising because i915 is generally known for ignoring
documentation and making up their own rules just because they can. So
I'm not accepting this as an argument at all.

I agree with you that the lack of enforcement of that external
serialization rule is suboptimal. External serialization is hard to
validate/enforce in general though it's not impossible.

But let's first take a step back and look at the larger picture.

The obvious question is:

   Why is the base lock dropped when invoking the callback?

The answer is simply that the callback might and in many cases will
acquire a lock which is used in the reverse lock order for the purpose
of external serialization.

If you think about that then it's pretty obvious that you can introduce
a safe variant of hrtimer_forward() which can be invoked from the
callback:

hrtimer_forward_safe_from_callback(timer)
{
        base = lock_running_timer_base(timer);
        if (!hrtimer_is_queued(timer))
        	hrtimer_forward(timer);
        unlock_timer_base(base);
}

That prevents the scenario you described in a completely safe way, no?

Coming back to validation/enforcement of external serialization. That's
a problem which has been solved in other places already. Look at the
seqlock code for inspiration.

Thanks,

        tglx


