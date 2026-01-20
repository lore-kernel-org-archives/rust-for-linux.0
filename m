Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D593B3B8D56;
	Tue, 20 Jan 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768897396; cv=none; b=doI/TVbjPO1qR3LujNFL4muKMBAaQaoJFYL7qXoX2L+bju9XHn/1143VmlShkOKoeWw/i+xvh2p4B2YvJKrwxq1tytUOzjOsT1CXvq5hFeidP7Nkfhy8G9oEffHHEW9kb49UTVc2HjXvZmvuNpKsB/qmkPs1j/W+xLZGtBxtrQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768897396; c=relaxed/simple;
	bh=QdQWnSnN+umjKdCrKZk6xPb1oM/GCv4hPjfJvw/M8AY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LSOt0ZzDnjKmwbv0WkT8KgKfihd6zEUQFS2eBfhIzpMvUK402fWCz2oScN/CvJ2bNtM4zuGx2/UmNxkiI/0ODwAQfh/UKf/uAyDcC3q6jD2xM2sz4FeczSvjwD2MIACqJbQ+D8sD5OZelUXPgHvSRa7aqxdNAfTuQxma7Hqwf8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt7cGTJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt7cGTJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAEBC16AAE;
	Tue, 20 Jan 2026 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768897396;
	bh=QdQWnSnN+umjKdCrKZk6xPb1oM/GCv4hPjfJvw/M8AY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vt7cGTJnwLb5Gfk/A8/ur3OGOIAyRIrcmJUzQeWUN5yk+zlBTMGnTZU97j9nlGEED
	 KoapKlMik27lTh5QEUClwp93iE8KvSNSKKhSyKpCFlAE8AzS5xOE4T/VRMieoFL8pD
	 HSU8VeTjQiE2WuC+mm4Nzmlz8NBB067bD2p4An3bgLHEiBSYYNQQgEejTcb5QT0cD4
	 lABn2GgcK96nP3L6RMwTwC9PW01W6q8yVJtpBM4DDLH1WSMAQp/c+5PyxsS4caVYK7
	 3iTY6gZ8NzB92UfzUWvRyfMGDgINq5p7ocGRl0T6Sp896Zu6EtWWnroHD8oV+rizT+
	 z/JWRpQ+3sITw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <DFSO4J9WM5BX.1H0OSQEII0KRB@garyguo.net>
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid>
 <20260110115838.3109895-1-fujita.tomonori@gmail.com>
 <877btdpyz2.fsf@t14s.mail-host-address-is-not-set>
 <pDwjG06OA4rlC4rEeo6eo5jUcleIUV5jT_SGHgMmJumfm1YpZU6tXdsLV6UgaSBTvJFSVmPCgTju09jyU7Ih0Q==@protonmail.internalid>
 <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net>
 <874iohptem.fsf@t14s.mail-host-address-is-not-set>
 <UWfowIYPYvjnylDlpyIzDvlnBLndFcpoYhkhjPT9aG7ynMqREHY8uigXm16cP6991vx-bEEAVgAVkA9lSGEK1Q==@protonmail.internalid>
 <DFSO4J9WM5BX.1H0OSQEII0KRB@garyguo.net>
Date: Tue, 20 Jan 2026 09:23:04 +0100
Message-ID: <871pjkpuaf.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Jan 19, 2026 at 2:29 PM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Mon Jan 19, 2026 at 12:29 PM GMT, Andreas Hindborg wrote:
>>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>>>
>>>>> HrTimer::expires() previously read node.expires via a volatile load, which
>>>>> can race with C-side updates. Rework the API so it is only callable with
>>>>> exclusive access or from the callback context.
>>>>>
>>>>> Introduce raw_expires() with an explicit safety contract, switch
>>>>> HrTimer::expires() to Pin<&mut Self>, add
>>>>> HrTimerCallbackContext::expires(), and route the read through
>>>>> hrtimer_get_expires() via a Rust helper.
>>>>>
>>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> Patch looks good to me, but I just want to check with Lyude about their
>>>> use case in the rvkms driver. I think that is why we did the racy
>>>> implementation originally. In C we have stuff like this:
>>>>
>>>>
>>>>     /**
>>>>     * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
>>>>     * @crtc: The CRTC
>>>>     * @vblank_time: Returns the next vblank timestamp
>>>>     *
>>>>     * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vblank
>>>>     * timestamp of the CRTC's vblank timer according to the timer's expiry
>>>>     * time.
>>>>     */
>>>>     void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
>>>>     {
>>>>       struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>>>>       struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
>>>>       u64 cur_count;
>>>>       ktime_t cur_time;
>>>>
>>>>       if (!READ_ONCE(vblank->enabled)) {
>>>>         *vblank_time = ktime_get();
>>>>         return;
>>>>       }
>>>>
>>>>       /*
>>>>       * A concurrent vblank timeout could update the expires field before
>>>>       * we compare it with the vblank time. Hence we'd compare the old
>>>>       * expiry time to the new vblank time; deducing the timer had already
>>>>       * expired. Reread until we get consistent values from both fields.
>>>>       */
>>>>       do {
>>>>         cur_count = drm_crtc_vblank_count_and_time(crtc, &cur_time);
>>>>         *vblank_time = READ_ONCE(vtimer->timer.node.expires);
>>>>       } while (cur_count != drm_crtc_vblank_count_and_time(crtc, &cur_time));
>>>>
>>>>       if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)))
>>>>         return; /* Already expired */
>>>>
>>>>       /*
>>>>       * To prevent races we roll the hrtimer forward before we do any
>>>>       * interrupt processing - this is how real hw works (the interrupt
>>>>       * is only generated after all the vblank registers are updated)
>>>>       * and what the vblank core expects. Therefore we need to always
>>>>       * correct the timestamp by one frame.
>>>>       */
>>>>       *vblank_time = ktime_sub(*vblank_time, vtimer->interval);
>>>>     }
>>>>     EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
>>>>
>>>>
>>>> Also, we got some new docs for `read_volatile` that allow us to read
>>>> memory outside Rust of any allocation that are not "valid for read" [1],
>>>> meaning racy reads are OK as far as I understand. So the original
>>>> implementation might actually be OK, although the number might not be
>>>> correct always.
>>>
>>> The wording is for MMIO and should not be relied on if the accessed memory is
>>> C memory. Also, `HrTimer` is going to be a Rust allocation.
>>
>> Why do you think the wording is only valid for MMIO accesses?
>
> Because it is intent for this paragraph, and is mentioned in the text. This
> specific text is introduced to allow hardware MMIO access and the need to be
> able to access otherwise always-invalid pointers, such as pointers to 0 and end
> of address space.

The text does not say "only valid for MMIO locations", it says "intended
for". It also would make no sense if it did, because MMIO locations are
not special in that sense.

>>
>> I guess you are right about the allocation being a Rust allocation,
>> since it is allocated by Rust. However, the value we interact with is
>> behind an `Opaque`, so I think treating this as a non-rust allocation
>> should be fine?
>
> No, it is not. Opaque cancels out some alias requirements but it is still a Rust
> allocation. Everything that Rust code interacts directly, and this includes if
> the allocation is made from C side, must stay follow the usual rules.

As long as we are not ever making a reference pointing within the
allocation or doing non-volatile operations on it, it we should be able
to consider the region as a non-rust allocation, right? If not, why not?

I am aware that this does not apply for the expires field, I'm just
asking for the sake of clarification.

>
>>
>>>
>>> Even if we don't treat it Rust allocation, it's also only "fine" in a sense that
>>> you don't get UB for doing it. But the value you read can still be completely
>>> meaningless if the updater is not atomic (it would be valid compiler
>>> implementation to, say, turn a non-atomic write into a write of a garbage value
>>> and then an overwrite of the actual data).
>>
>> This is exactly the behavior I expect. In case of concurrent writes, the
>> value might be garbage, but in the absence of concurrent writes, the
>> value will be correct.
>>
>>> I think the usage you quoted is just wrong, as on 32-bit platforms this could
>>> well read a teared value.
>>
>> Referring to the C code above, it seems like what people in C land will
>> do is read the value until it seems to be stable yolo ahead with that
>> value.
>
> It is non-obvious to me on why this code is correct. The updater seems to do a
> hrtimer_forward_now and then call into drivers to update the vblank count. So
> in this sequence:
>
>     CPU1                 CPU2
>                          first drm_crtc_vblank_count_and_time
>     hrtimer triggered
>     hrtimer_forward_now  READ_ONCE(expires) <- racy read
>                          second drm_crtc_vblank_count_and_time
>     store_vblank
>
> you will get a teared read of garbage value while the vblank count is stable.

Right, that is interesting. And it will not help them to flip the
operations on `expires` and `count`. I guess they need to update `count`
twice to make it sound, effectively implementing a seqlock.


Best regards,
Andreas Hindborg



