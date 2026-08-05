Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0645D1B1
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934107; cv=none; b=IiNnGlzqPGsJu09zebJ13Bn6QDphWBcd1mI7i2O+RyhgxXrkfo8WD4CVR+odZZpnZJzZkrhMT/rDxoZfAkAv0gARyvmBqKN+w0Sc0Ry/7hjNQx7NJO2OraKOajiGtiY/21JV3yzwbcM4y9ms4PQuiR9jxem6wWKX4SWrerGCL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934107; c=relaxed/simple;
	bh=HqtdBpUrJivtUkiWVx6Xlzlqa92WtZ3QFGgQL4NxEsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=itgpg0mNMeUjpcXGG4sHQS7rcS2K+KP6rXVr9aguqUHnF0PrA6MFXuOJ426ySsFYQVPyXcHuWvGM+Hbpqdydj/UzuhYOkefc9YL2Oh8EvX4i7bjFWT4PDydQOMAd1UJ/tr1ZZ54JNQsS2e74301c6NHdjkaYKUkCXPKGRjalzDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNIun0cR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNIun0cR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45321F00A3A;
	Wed,  5 Aug 2026 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934104;
	bh=HqtdBpUrJivtUkiWVx6Xlzlqa92WtZ3QFGgQL4NxEsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iNIun0cRrBIfE/e44BIEM7mP/w7vHI+ngpxxmPY/6CqFYCUxSJm0g7GfH3S/oaeeO
	 rZuAxAbPxdBh7f+Sl433aLtHmiSBVeWlnoQ1RKSuU4z6+5uekyksHOXIg5A4gQ1xMV
	 u+H7dtgNke6ldcA3iyTymYr7cypHvFuAMf/vYvW9ovMO6/+7aU/mJUfL62UA0ll/J/
	 jw+W7X8wRjooyIbYd+PevsicOY5dfTtzlYA9p54mneRw+5Ib9zDJXJ0LwxH8LgEeFH
	 PpOSays9Kp4ALT30oflFGyRLCojXs7yDtS/zUpw63cVwhGp06yaKf6rOU2BEY7vgM/
	 36f3KHpJaWCiA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com,
 acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
In-Reply-To: <20260731.224825.536098581345512332.tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
 <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
 <FenzX1BbXwDwhxl2RJ8sf7OnFwsAi3prmxcHhYKtfyXwJ_l88xtj5rr-z8T90Dqj1Em0RGPwvxQNqlo0pl2e8A==@protonmail.internalid>
 <20260731.224825.536098581345512332.tomo@flapping.org>
Date: Wed, 05 Aug 2026 14:48:07 +0200
Message-ID: <87v79o7myg.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> On Thu, 30 Jul 2026 14:09:59 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Wed Jul 22, 2026 at 10:49 PM BST, FUJITA Tomonori wrote:
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
>>> a raw jiffies count (a plain c_ulong alias with no type
>>> safety). Callers have to know on their own that the value meant
>>> jiffies and convert to/from it themselves, which is easy to get wrong
>>> (e.g. passing a millisecond value where a jiffies value is expected).
>>>
>>> Both APIs just take a span of time so, they can use the Delta type
>>> instead.
>>>
>>> This series makes Delta generic over its time unit with Nsec and Jiffy
>>> types, switches CondVar and Queue to use Delta instead of raw jiffies
>>> (updating binder's ioctl_freeze(), the only caller of
>>> wait_interruptible_timeout()), and then removes the now-unused Jiffies
>>> and Msecs type aliases.
>>
>> There are more jiffy users being added so we should take this sooner than later:
>> https://lore.kernel.org/rust-for-linux/20260726223613.1242940-1-dakr@kernel.org/#t
>>
>> Andreas, any plan on taking this via timekeeping-next? I suppose Boqun
>> could also be taken via rust-sync tree if you give an ack?
>
> Agreed. Getting this into the next merge window would be great.

I was on vacation, back now.

Getting this in the merge window for v7.3 is probably a little tight. We
should aim for v7.4.

I will take closer look this week.


Best regards,
Andreas Hindborg


