Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0E3E5A0B
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370470; cv=none; b=PoJKOQQV++biRn0CamNrXzNaR11Th0LQVp/OJLrqRUrom0A4uDxOYWA5HtD8yreBXn7QjbdvYxO+DSH5YWMSEH4JcojsH6NdlziXrxP0NviMMyQI5pv9lJXbE6SDsApMJvARtS1TVWrW1Gg+0H80fU0tsmZfuRWrj02SI/wSGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370470; c=relaxed/simple;
	bh=jtF8cixSVEfiN1qlDBll+/DNec27uhoQefNJuy9FM5U=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q7erV+pteHuZngYBlF7OYZAqm+ZU9hEgru5LpiNCgri24FFtgr/2ORqpqqjDkc379yW9S2wjCxKTonKYrKggmixAvL4WmxCkUYsFs3PPZgIo2/J31JXwP6mRGuPVQMXEBuvK01uby23CJ1wm+NSIUZZrz4yr+G96a2ox1y7ZAw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=I+zUz4qf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f7WUJIwu; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="I+zUz4qf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f7WUJIwu"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id D6250138028B;
	Mon, 10 Aug 2026 10:01:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Aug 2026 10:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786370467;
	 x=1786374067; bh=jcH/H/DZ3PiCew8KIq1Ay4yOUG5UoWMXnyvk49DKTQA=; b=
	I+zUz4qfaezV9CXH/qwsmKFslkQFIDA5+nR5+g647xdKPopRQmK5C55MC253ZekI
	5ywzciCjJzrqEl/HznD+39sEo/cBCvWDpgIAwy0//28rhS9VwNXW4gxPiS7DO1AS
	wNszbNAp4Z7zhZfpv+ck+HIzI2b8zROP2ck9Exo7GW5qJSSXzvuzdjD8thnbKvzY
	oBm3coJBdPUIKyRm11Oxjzy1m/5tvLH5hJL1zm+O72pummZLRIB6tZpccBf4WBDl
	lkRI5eRzd8OEk2/zSCDJ3Y5wyb0hDsWY0DntBaI2TCubaaTpKdgASMY/bN6HQ4ff
	uuSP6AmwlQUQ7vMNDujfuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786370467; x=
	1786374067; bh=jcH/H/DZ3PiCew8KIq1Ay4yOUG5UoWMXnyvk49DKTQA=; b=f
	7WUJIwuVppN/M95L1gk6h0pop0cA1ekS7fgl596en3ofcR2Ek5fazJ6s5oZWcxMm
	+4WyKfe15QxzSOBbS/GygigY432yRWk7MTconAHF8DV6zBfYwPEFk9FWYfm0XtL8
	Y6HNh6slN56De0hC6PwWHD1gkyQZEjY8KYiwRKONoVa0QOUv4cPI/6QuPdxs8jJo
	f4w+/PT+3+6YiaKOPN8B92dvjLilBbclaB46oeN4tJ8HSSKGwx1SgrTaVmiqb6oy
	m/SLH+Tp2jA8NHYLTaaLlg0ScZTmjojzQTnVok1StIpEwnBx3grHqUVqvFD4sGdj
	E+w4rOHKX9KYK5SidB30Q==
X-ME-Sender: <xms:o9l5av8nPoWXP4CDVHyh0vZcgJulTcfEzuf5LchgngJkX821J1pn3w>
    <xme:o9l5akgvNBPpJsfpNdnDu6vqt_hLKkDNhTzVNENixkS78hvizzEeGll3s4EU9xit3
    QJ1y7U8OZOu4nj9sy03tOweibH8aCb3KoZ1mQkvsX01Je-VtS3BU5O1>
X-ME-Received: <xmr:o9l5auWC5LPyWZj3gdHUfS26v4xexED7lGGaq11ZkfOIbOutESl3y48_b5aK7CF73I-_dlTPQdbis7hNa3LD5Z_s>
X-ME-Proxy-Cause: dmFkZTFB6MkdP5cMYVoAA3kgpPm/4zLM0v0RS98tXV8NAElATNyi/BcPdWreFskiKEbluH
    xhn1Huouu25+BmwqZE3JVKXzCg9CvvrPSrvefrTVS+zoOWpLNuhKBQnDKAr9vfCIJBMpWB
    GYck66xXEsqQZlto71BjPU3P5LIVbX//fj7oPcECYBQLgBCEPMuh89vb5+gH+648n2YOkc
    7J7LBk6DtOFrAICGlHug9vuPjAwazGJ30WvPK1TQrvimE3bPFxwMdQRATaG6R6xSMQFZ2o
    kxnNNL4XanPWwDqfQXosKcE/n/px2hZKWs7WTBTXLZWKpLR1o3l/FcxllamQvL6BJSRILx
    6nXwEycOQhE4Qo4AgqkI7iWyagPNUSbz22a7XIYcw+Mk78Wr+NoVIT87H6o2RiEQrT+jLp
    ij02//bBJV1D/TI3cd5Oibs29jumkeF6d5ecWPae+VEl0xz7LKWvCbFExcT4SPO1PoKlTt
    xTOqKpExdvAw94Wj1G74xegAq+8MPA9fqrOH7KXMO9sspHM+qhiOAN7lB6QLWdq1poRK4n
    V5RVrDVbT8aGG9hZhDa5E3VXEGZSR9WeDAT7OWdgRnZF22MUBjTFI1AV6dWHk38a/18rFF
    ly2RtDdPvI5wKa4wrdfb7yQgI9aCQqaXqvTme7PjsNLLc+j3X8VosR65pTew
X-ME-Proxy: <xmx:o9l5agt-MML3qpG4oLsFGIewx6fyfvkYNEMwSLLqUU7-jyzSaNLZ6A>
    <xmx:o9l5an80w6ZTbf_42dgIeuEK0fq3G57RFFwrN1PxK92w1YvhZg7fZQ>
    <xmx:o9l5aosRgS-phOM0gVJihb50iFerZ6rTsbSInusFcTQ3L-3fsDRK2w>
    <xmx:o9l5al4hSAG9pBnWFrcz8pwR7XsRs-b5_t8eWcDsYwyT9y6mm6PJUg>
    <xmx:o9l5aqj50SkPQ-AP_Z6sMQe-GzxmMbkxFGzPK5JZYROsUBF5wfY2Zlht>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 10:01:02 -0400 (EDT)
Date: Mon, 10 Aug 2026 23:01:00 +0900 (JST)
Message-Id: <20260810.230100.1885262719043300345.tomo@flapping.org>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: tomo@flapping.org, acourbot@nvidia.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 2/2] rust: hrtimer: Make HrTimer repr(transparent)
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87v79i14wp.fsf@kernel.org>
References: <87jypy2pzr.fsf@kernel.org>
	<20260810.204248.1426065758894654964.tomo@flapping.org>
	<87v79i14wp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 15:28:06 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> On Mon, 10 Aug 2026 13:07:20 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>>> 
>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> HrTimerCallbackContext acquires a &HrTimer<T> from a
>>>> NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
>>>> time. This is sound only because HrTimer's sole field is
>>>> Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
>>>> Adding a field to HrTimer that is not Opaque would make acquiring that
>>>> shared reference unsound.
>>>>
>>>> Make HrTimer repr(transparent), which prevents multiple fields, so that
>>>> such a refactor fails to compile instead of silently introducing
>>>> unsoundness. This does not guarantee the remaining field stays behind
>>>> Opaque, but it rules out the likely way of getting there.
>>>>
>>>> repr(transparent) cannot be combined with repr(C), so drop the latter.
>>>>
>>>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>> ---
>>>>  rust/kernel/time/hrtimer.rs         | 6 +++++-
>>>>  rust/kernel/time/hrtimer/arc.rs     | 2 +-
>>>>  rust/kernel/time/hrtimer/pin.rs     | 2 +-
>>>>  rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
>>>>  rust/kernel/time/hrtimer/tbox.rs    | 2 +-
>>>>  5 files changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>> index 1db84cd4cbe8..04f47af3541b 100644
>>>> --- a/rust/kernel/time/hrtimer.rs
>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>> @@ -418,8 +418,12 @@
>>>>  /// # Invariants
>>>>  ///
>>>>  /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
>>>> +// `repr(transparent)` is not merely about layout. `HrTimerCallbackContext` acquires a
>>>> +// `&HrTimer<T>` while a `&mut HrTimer<T>` may exist, which is sound only because every byte of
>>>> +// this type sits inside `Opaque`. Being transparent rejects a second field at compile time,
>>>> +// but it does not enforce that the remaining field stays `Opaque`.
>>> 
>>> Missing bullet. With that fixed:
>>> 
>>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> This is a plain `//` comment, not documentation. Did you mean that you
>> want it documented as one of the `# Invariants` bullets instead?
> 
> Ah, thanks for clarifying, I did not see that. No I guess it is fine.
> Maybe add a newline?

Documentation/rust/coding-guidelines.rst gives an example where a
comment follows the documentation with no blank line in between.

The existing code follows that too, so I think we should stay
consistent with the documented convention here.

