Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7411ACEDF;
	Mon, 19 Jan 2026 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833006; cv=none; b=rcW2sbwft5KWBWzrIuet0cUzWt+tAakykfWNDLupQ0vLWmfFmUAD/oMdlN5j4HA4k4xTydmRzhACfZDS94SlrgvSJhRYCoHGxbvO9pzQQToJ9juXkyqUC58/llX2r5FBR7nK17FNSmsWIUHkkTfhxc4yQf794qUChSzjEVWdJ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833006; c=relaxed/simple;
	bh=4j73rl+aFT7PoJmEe7s37pq8L3vOdTCsD2siReuoN+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hJ95TX5hXsLyrHGkcMzUhEq1mK0ZOWMXF0qj9UdYN17Vb+NZMaeKYmZtgamJkuIAP58HBViLDubmP6IRj0xjVHQ+6hQh4PLVD6mPAX098UCGoJiPh/ms8Io1EqKy09bW74GeJHOdZxQHdZUkanFhXYTM93DeFwXWTenM7W/yxlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvJsj6PY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvJsj6PY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97A1C116C6;
	Mon, 19 Jan 2026 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768833005;
	bh=4j73rl+aFT7PoJmEe7s37pq8L3vOdTCsD2siReuoN+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IvJsj6PYd4YqPHVvwoCsZwsajcvoWHb+b9caG+XgpAcCPF+8L3z1gZv3DxJpoCiB0
	 nvA0vtESo0lfv3R7+0hGp34b7ZhPiU9rs8wAPBArCycS32rr3yjxXsDL24Es3q7uFc
	 rYBj8wqk9xNb5qO54G26frAHfNWhSnkQbSh/v3SyKH9nmw4ehCMkVNtnVm+cFew2sV
	 Eh35UYcCtg424mIaHaB4NrzZaQPnVn8lMtA7hZTF5NwUYz2o56pVDtDP6wH1SD/tii
	 wJcqXhDOSJHQeC0l0PXaQ6xYs7Qjr3DwBMgYNmVojq1Ef4fggXPhtiLoUoOwkAERPM
	 2mT6sMR4iHxZA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net>
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid>
 <20260110115838.3109895-1-fujita.tomonori@gmail.com>
 <877btdpyz2.fsf@t14s.mail-host-address-is-not-set>
 <pDwjG06OA4rlC4rEeo6eo5jUcleIUV5jT_SGHgMmJumfm1YpZU6tXdsLV6UgaSBTvJFSVmPCgTju09jyU7Ih0Q==@protonmail.internalid>
 <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net>
Date: Mon, 19 Jan 2026 15:29:53 +0100
Message-ID: <874iohptem.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Jan 19, 2026 at 12:29 PM GMT, Andreas Hindborg wrote:
>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>
>>> HrTimer::expires() previously read node.expires via a volatile load, which
>>> can race with C-side updates. Rework the API so it is only callable with
>>> exclusive access or from the callback context.
>>>
>>> Introduce raw_expires() with an explicit safety contract, switch
>>> HrTimer::expires() to Pin<&mut Self>, add
>>> HrTimerCallbackContext::expires(), and route the read through
>>> hrtimer_get_expires() via a Rust helper.
>>>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Patch looks good to me, but I just want to check with Lyude about their
>> use case in the rvkms driver. I think that is why we did the racy
>> implementation originally. In C we have stuff like this:
>>
>>
>>     /**
>>     * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
>>     * @crtc: The CRTC
>>     * @vblank_time: Returns the next vblank timestamp
>>     *
>>     * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vblank
>>     * timestamp of the CRTC's vblank timer according to the timer's expiry
>>     * time.
>>     */
>>     void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
>>     {
>>       struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>>       struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
>>       u64 cur_count;
>>       ktime_t cur_time;
>>
>>       if (!READ_ONCE(vblank->enabled)) {
>>         *vblank_time = ktime_get();
>>         return;
>>       }
>>
>>       /*
>>       * A concurrent vblank timeout could update the expires field before
>>       * we compare it with the vblank time. Hence we'd compare the old
>>       * expiry time to the new vblank time; deducing the timer had already
>>       * expired. Reread until we get consistent values from both fields.
>>       */
>>       do {
>>         cur_count = drm_crtc_vblank_count_and_time(crtc, &cur_time);
>>         *vblank_time = READ_ONCE(vtimer->timer.node.expires);
>>       } while (cur_count != drm_crtc_vblank_count_and_time(crtc, &cur_time));
>>
>>       if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)))
>>         return; /* Already expired */
>>
>>       /*
>>       * To prevent races we roll the hrtimer forward before we do any
>>       * interrupt processing - this is how real hw works (the interrupt
>>       * is only generated after all the vblank registers are updated)
>>       * and what the vblank core expects. Therefore we need to always
>>       * correct the timestamp by one frame.
>>       */
>>       *vblank_time = ktime_sub(*vblank_time, vtimer->interval);
>>     }
>>     EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
>>
>>
>> Also, we got some new docs for `read_volatile` that allow us to read
>> memory outside Rust of any allocation that are not "valid for read" [1],
>> meaning racy reads are OK as far as I understand. So the original
>> implementation might actually be OK, although the number might not be
>> correct always.
>
> The wording is for MMIO and should not be relied on if the accessed memory is
> C memory. Also, `HrTimer` is going to be a Rust allocation.

Why do you think the wording is only valid for MMIO accesses?

I guess you are right about the allocation being a Rust allocation,
since it is allocated by Rust. However, the value we interact with is
behind an `Opaque`, so I think treating this as a non-rust allocation
should be fine?

>
> Even if we don't treat it Rust allocation, it's also only "fine" in a sense that
> you don't get UB for doing it. But the value you read can still be completely
> meaningless if the updater is not atomic (it would be valid compiler
> implementation to, say, turn a non-atomic write into a write of a garbage value
> and then an overwrite of the actual data).

This is exactly the behavior I expect. In case of concurrent writes, the
value might be garbage, but in the absence of concurrent writes, the
value will be correct.

> I think the usage you quoted is just wrong, as on 32-bit platforms this could
> well read a teared value.

Referring to the C code above, it seems like what people in C land will
do is read the value until it seems to be stable yolo ahead with that
value.

Not saying that this is what we should do, just saying that with the
updated docs for `ptr::read_volatile`, the original API is not UB. Also,
I want to confirm this change with Lyude, because I seem to recall there
was a reason we made this race possible in the first place.

If nobody has a really good reason for this race being present, we
should of course just remove it.


Best regards,
Andreas Hindborg



