Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80EE326933;
	Mon, 19 Jan 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825790; cv=none; b=fnSGi/Kg0CGDZSQmlvFQlxrtTLIBR87VRYwg8/aa9aE9tCgYZS2Q3iZqS+xqWpsBPxu2UQ0tWoi1EhZSlKnJn46aqToazYQ0Fdp/s83dwI7lPEAGVfhzMEBHCPH1Sz98jihGOjLKrT42377A5SaWPwv5Lz5sylpAnzBMiGG/qN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825790; c=relaxed/simple;
	bh=2YSiQ73r8YEpGMiR7HpY74qOHSqVwhEdZIWj+DwohEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AnM5Y0qe1us3UgHbVRW/HU0ZeohBHISh/K+vuHE77V0l1zeilYZptt3Pua6V/EzDX5M9QbF5n8yQYBkXh6Fm8zC1+JiNSTiveyU7e4oS7IoQ5s40zjo25z7xaRbTdMMcrLabBK9cYIWDep/s7Psgy4L9NRUfLpYIT8j0A+BCauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd4jiVjR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd4jiVjR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62633C19424;
	Mon, 19 Jan 2026 12:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768825790;
	bh=2YSiQ73r8YEpGMiR7HpY74qOHSqVwhEdZIWj+DwohEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fd4jiVjRZyEb3XhGamowDGJdTQI8+vVeydrIS2ipaBLIpBFlHf5bP9b1P3jsH1ASr
	 wuIvaZ0SYJ0yb9Qd3YkqI2ezliegitFpSgci4KV47zHnFY2PRUbcbHszIQ9SLIcw1c
	 nsSLotifoKQo3CIEOfWNGyTX3V7xGFfJcuVbcYQ7/gWffhNqA8Qk+1FhrE6L4r+npx
	 mZN7RtLDkr+E+WmRVXFOLndxULDGg9t8iyyZkfFwWhOR0omsvK7ELCo+nJvVYsbLYR
	 5Ke+/lDE0NcMgs5xb/n2+/GCTgRAJW3st3RFQsY4cPbBP/4PmpMN8IXW1X/F/mqYmY
	 7mMkK6mjrX5Yw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260110115838.3109895-1-fujita.tomonori@gmail.com>
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid>
 <20260110115838.3109895-1-fujita.tomonori@gmail.com>
Date: Mon, 19 Jan 2026 13:29:37 +0100
Message-ID: <877btdpyz2.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> HrTimer::expires() previously read node.expires via a volatile load, which
> can race with C-side updates. Rework the API so it is only callable with
> exclusive access or from the callback context.
>
> Introduce raw_expires() with an explicit safety contract, switch
> HrTimer::expires() to Pin<&mut Self>, add
> HrTimerCallbackContext::expires(), and route the read through
> hrtimer_get_expires() via a Rust helper.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Patch looks good to me, but I just want to check with Lyude about their
use case in the rvkms driver. I think that is why we did the racy
implementation originally. In C we have stuff like this:


    /**
    * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
    * @crtc: The CRTC
    * @vblank_time: Returns the next vblank timestamp
    *
    * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vblank
    * timestamp of the CRTC's vblank timer according to the timer's expiry
    * time.
    */
    void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
    {
      struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
      struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
      u64 cur_count;
      ktime_t cur_time;

      if (!READ_ONCE(vblank->enabled)) {
        *vblank_time = ktime_get();
        return;
      }

      /*
      * A concurrent vblank timeout could update the expires field before
      * we compare it with the vblank time. Hence we'd compare the old
      * expiry time to the new vblank time; deducing the timer had already
      * expired. Reread until we get consistent values from both fields.
      */
      do {
        cur_count = drm_crtc_vblank_count_and_time(crtc, &cur_time);
        *vblank_time = READ_ONCE(vtimer->timer.node.expires);
      } while (cur_count != drm_crtc_vblank_count_and_time(crtc, &cur_time));

      if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)))
        return; /* Already expired */

      /*
      * To prevent races we roll the hrtimer forward before we do any
      * interrupt processing - this is how real hw works (the interrupt
      * is only generated after all the vblank registers are updated)
      * and what the vblank core expects. Therefore we need to always
      * correct the timestamp by one frame.
      */
      *vblank_time = ktime_sub(*vblank_time, vtimer->interval);
    }
    EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);


Also, we got some new docs for `read_volatile` that allow us to read
memory outside Rust of any allocation that are not "valid for read" [1],
meaning racy reads are OK as far as I understand. So the original
implementation might actually be OK, although the number might not be
correct always.


Best regards,
Andreas Hindborg


[1] https://doc.rust-lang.org/std/ptr/fn.read_volatile.html

