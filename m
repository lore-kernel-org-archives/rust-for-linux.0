Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D6DDCD
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778348657; cv=none; b=gK2kkkd4nDLNcfG2VPWotzo14x/y58Hjj/7Bffd3JR+rRCFy/vvBi7fvgUb7Q9ZWlX4ZvQp5cnko/AVb20N3pETfiosqUi0QJ4VDxEmmgmDEakiZdYQGOFj3v5/m8U7uaCk69/0NkNb196heb+gcba5gi1H7U8/qJKRWQnfWC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778348657; c=relaxed/simple;
	bh=3OGYFFkLPKPx+C2x8CQiJxfgh9dTnfycCSQF5w7x5TQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ii6TUuezyTLC6QuS4TQX862XtrMnaWM3o+F15rpAQIiisMt8ybdzPvCWkMiYMZ88GI3lT+TeAq4YyVa/ZKQxnYubE/IeOX1rda3sZPRNelh2iXnBAMQXRNby0eq9kLsjAwWR+5Qe7bKCV7hT/fx6Ic1ZDTTvDkWDXHgmEjp/N+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaznswEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaznswEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B782CC2BCB2;
	Sat,  9 May 2026 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778348657;
	bh=3OGYFFkLPKPx+C2x8CQiJxfgh9dTnfycCSQF5w7x5TQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WaznswEJQqHlftgg+TWh/toMUVrBaFJGl3FvIkQqwkzroznfX3qIm8AKBnvknFOLq
	 hQeECbVhCQKPv3ssPX/UczqsiGK82SE0AJaUKppn+VJ/J6/Pu+ShCbfWgLhwWmK1aA
	 hZv4vNkpSnJbir1UHkuEgiY/zsLsoaJ8wYx3n5Fr9cI2pIF7srJ6FXHatf8/hyribr
	 UtiYjalVdPCaqL/U5AZ/OV3bKHwV7UOdj+Qm3fMHgWrA4TgRN25i/XgMzLxdj04ssA
	 GNS1E24dzab1B8l/Ei2b1bg+sKNvT+8OVevHxOrVvt9FCsneZfPZx3bPbcz2AZlzmM
	 n5x3LNF90JVNQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Sang-Heon Jeon
 <ekffu200098@gmail.com>, boqun@kernel.org, fujita.tomonori@gmail.com,
 frederic@kernel.org, lyude@redhat.com, tglx@kernel.org,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
In-Reply-To: <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net>
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com>
 <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
 <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net>
 <87pl346466.fsf@t14s.mail-host-address-is-not-set>
 <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net>
Date: Sat, 09 May 2026 19:44:04 +0200
Message-ID: <87mry85vh7.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sat May 9, 2026 at 3:36 PM BST, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
>>>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>>>>
>>>>> fsleep() documents out-of-range input as a bug but does not check
>>>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>>>>> debug builds.
>>>>>
>>>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>>>>> ---
>>>>> Hello,
>>>>>
>>>>> I found this small inconsistency while reading the code. The same
>>>>> check was applied to udelay() [1] but does not seem to have been
>>>>> extended to fsleep(). Please let me know if I have misunderstood
>>>>> anything.
>>>>>
>>>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomonori@gmail.com
>>>>>
>>>>> Best Regards,
>>>>> Sang-Heon Jeon
>>>>
>>>> Looks good to me. Could you add the warn_once and remove the todo as
>>>> well? And add the warn_once to udelay as well, so both functions have
>>>> same shape.
>>>
>>> If `warn_once` is added then the debug assert would be unnecessary.
>>
>> It is different mechanisms in different situations, right?
>> `pr_warn_once` prints a warning once (and a stack trace depending on
>> kernel configuration?). It would be enabled in production environments,
>> and it allows the thread to continue executing after triggering.
>
> The existing comment and your message says `warn_once`, not `pr_warn_once`.

I actually mixed these up, thanks for pointing that out. We do not have
`warn_once!` yet.

>
>>
>> `debug_assert` panics when debug assertions are enabled, otherwise is
>> compiled out.
>>
>> I don't think one makes the other unnecessary.
>
> I don't think there should be two checks of the same thing. Even if we want
> different behaviour depending on if debug assertions are enabled or not, it
> should be a single macro that switches behaviour based on that config.

Apparently this was discussed in start of April [1] (I somehow missed
it), and as far as I can tell, consensus is that we do not use
`WARN_ONCE`. Instead we use `debug_assert` with `pr_warn_once`. That
sounds reasonable to me.

This can be a combined macro or open coded, either way is fine with me.

I think we should add the `debug_assert` as suggested by this patch, add
the `pr_warn_once` in the not taken branch, and remove the TODO about
`WARN_ONCE`. We can bike-shed a combined macro on the side.

Sounds reasonable @Gary?

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/r/20260226120848.82891-5-adarshdas950@gmail.com


