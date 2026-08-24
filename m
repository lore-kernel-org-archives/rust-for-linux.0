Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C780407590
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568295; cv=none; b=VfRPThXLuNhMPFVhJZZ0/Zh9jFoHX6hyJBCD1LMEBulZyOuivRcL69RFH6aVzbgIZEqh3Ba/N1SLtgJrrTo1AvmRGwM7RIrq0q3trMgrtXVkIwrAM1bZ9ai+AkNoIoOnMTFDsmoqfb5FZfg9XHFco3mih15l2iUsF7mMN6MiPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568295; c=relaxed/simple;
	bh=VbaUHbv+vjP/XTf6bKB8wgeLyDHy5UXB+0YCSI0Oars=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RN0rRay/d09bKJ2LmsXkeWzONxOOdY9Xn8oeE4LMtOUHhcDiLMiBYcoHIrjJAlKk0LAFghrzUP4FtdmXtoOR5Xl1YriPMMDOiQ2wPKjGsJywoxliyGPIyXppBGAY3gnyA+ybuenMOhIJpcBQUIwc/zLjcypSlGwU+eLkNYNhy+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/1UN/jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/1UN/jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5859E1F000E9;
	Mon, 24 Aug 2026 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787568293;
	bh=3UPLtdxHr80ZGlygfImGy1qUmYpBkNsDVOUeburvoH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B/1UN/jhL6eTzfDuTPcYCxBPu5GGKokVnVgHWBKb3MBBTXwhJnkiRZFjxTS9+EHTf
	 o0V2tz1zwRFs3YgLsht0cSNbmDwov+jHSPpWuYn4cX5LTmZd8OPGDM9VLSWS0A2Y4Z
	 0vxrnNbHUhHbg6oOwwaH9bSCzA2J7ZXrC/r65DSgISN18F0p4hz9jCxkBR3JP++xlg
	 I6GUk3O/tKyK6Mogcs+Nrs41wG+baefDtfaQtqDU9n8bQnnd2btba1BSW8FMMyny9Y
	 +LajDNJ+JoFcBkvr0OlDURcjz06hkGIsOQXnVxvxc8xEascDtVo1cyiaXoMACv1WVk
	 3xyHGHBAuI6Zg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent arming
In-Reply-To: <20260821.185308.614720109603525569.tomo@flapping.org>
References: <87ecft7yyf.fsf@kernel.org>
 <20260820.215332.1257209020327006274.tomo@flapping.org>
 <87bjaw7xqa.fsf@kernel.org>
 <20260821.185308.614720109603525569.tomo@flapping.org>
Date: Mon, 24 Aug 2026 12:44:44 +0200
Message-ID: <87se437q77.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Fri, 21 Aug 2026 09:13:01 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> FUJITA Tomonori <tomo@flapping.org> writes:
>> 
>>> On Thu, 20 Aug 2026 14:34:16 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>>>> We discussed this at the call last night. We came to the conclusion that
>>>>>> we would like to experiment with the solution outlined by Gary, where we
>>>>>> inject `expires` into the callback handler, and the callback handler
>>>>>> returns a forward duration in addition to a restart value. Because with
>>>>>> that approach, we can avoid adding complexity to the Arc end of the API.
>>>>>> 
>>>>>> For the best implementation of this scheme, we probably need to change
>>>>>> some bits in the C code, add an additional path. Down the line, we could
>>>>>> also see how man callers of the C code can be changed to use this
>>>>>> pattern.
>>>>>> 
>>>>>> Do you want to send a patch based on this solution Tomo?
>>>>>
>>>>> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>>>>>
>>>>> The solution that we discussed before, right? It changes how the
>>>>> hrtimer core calls the callback. If the C maintainers take that, I
>>>>> will do the Rust side for it.
>>>> 
>>>> Yes this one. We don't know if C maintainers will like it. We were
>>>> discussing having a separate path on the C side just for just,
>>>> alternatively converting C side callers.
>>>> 
>>>> I think we should be able to reach some kind of agreement with C
>>>> timekeeping. But if not, we can solve it on rust side only, but less
>>>> efficient. We can grab the base lock again, read expires, then drop the
>>>> lock. But better to do it in the C code.
>>>
>>> The Rust side cannot take the base lock: lock_hrtimer_base() is static
>>> in kernel/time/hrtimer.c, internal to the core. So that way needs some
>>> agreement with the C maintainers as well.
>> 
>> Right, we would have to export the symbol, or a function for this
>> purpose. But it is a smaller change to C code. I would prefer we solve
>> it properly though, not with hacks.
>
> Could you propose the solution to the C maintainers? I will do the
> Rust side, whichever way it goes.

Not sure what you are asking. C people are CC in this thread. I think
the best way to discuss is to write a patch that can be the basis of
discussion. Do you want me to draft up something, or do you want to do
that?

After we submit the patch, if they do not respond, I can see if I can
find one of them in person at LPC. But I think they usually respond.

Best regards,
Andreas Hindborg

