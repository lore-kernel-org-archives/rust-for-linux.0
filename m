Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3733F589
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083448; cv=none; b=Kvld0hoPSZ66hKz9ln5m2ncbCNVTIZmNganb6PqDDAFm0X7Cv/XOXnGFK/7sqUPw9ZCFb3SGs/1v4YsI5IlfMoycexdOoYYlc1sopQLDYD7Q9QK+J0jdE8oDYfkKwct1sBZrd/gMSri/UXh9/WJ4+Jf28k1NdQxyribKEfPF7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083448; c=relaxed/simple;
	bh=goK+VwBYaFB26slnzfkhTeD20csoO7Pe52oI3ggQEKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Du4gOms/5Y7g8Gojp47a+AeM9wDXdqCZLxE90dvelp8aTxJ6jyEKpOc/eo38yVai4APYRyoWeb8G11hhmOHnK6u6uGXfQVv55+qwbD277y459cMGvL1TZJPdeh/SfodTkisnbmKQdMbTZhUKsN+1fx5aD5KFKhsJw4hmN4wDxfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGj6iVUQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGj6iVUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704001F000FF;
	Tue, 22 Sep 2026 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083446;
	bh=owvdtntWuCL5Z4qH24aB6lebBigjOxwq4Wr+O7UhuQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FGj6iVUQJhokp/eF13lQNsUSYy0rOkFOOasM8H43Tuypv3OgApOV2NgRKKLwr5o9N
	 2IPYUt2NVsRgk81jPAF/n3c+lWTabaOc/Ee/NQyWLU8IWUMWjjegxfJbeoQx4yrE+V
	 qXJRhrVQWqtyvI2VMAvmMiRG2ZTf9wz6fN9uDmxv1On4f4dzlIY6cCH/XRMFTXeUgH
	 7zwcPuxpj+wTzWtfWCm8iKW0X1fRMXBd7ZPLOc0YkuG6YhrPVSzG1mk3yCWKpkNfsi
	 OyF9BF7R/rRUzY/Xq3PVsAzoaRqQFEsjK2sYgGoQJrwYpVVcedBcveitFzKC66+qjg
	 P6jXpXZn4TCRQ==
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
In-Reply-To: <20260824.200725.1646650851096110842.tomo@flapping.org>
References: <87bjaw7xqa.fsf@kernel.org>
 <20260821.185308.614720109603525569.tomo@flapping.org>
 <87se437q77.fsf@kernel.org>
 <20260824.200725.1646650851096110842.tomo@flapping.org>
Date: Tue, 22 Sep 2026 15:23:57 +0200
Message-ID: <87wlsd2zde.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Mon, 24 Aug 2026 12:44:44 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> FUJITA Tomonori <tomo@flapping.org> writes:
>> 
>>> On Fri, 21 Aug 2026 09:13:01 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>> FUJITA Tomonori <tomo@flapping.org> writes:
>>>> 
>>>>> On Thu, 20 Aug 2026 14:34:16 +0200
>>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>>
>>>>>>>> We discussed this at the call last night. We came to the conclusion that
>>>>>>>> we would like to experiment with the solution outlined by Gary, where we
>>>>>>>> inject `expires` into the callback handler, and the callback handler
>>>>>>>> returns a forward duration in addition to a restart value. Because with
>>>>>>>> that approach, we can avoid adding complexity to the Arc end of the API.
>>>>>>>> 
>>>>>>>> For the best implementation of this scheme, we probably need to change
>>>>>>>> some bits in the C code, add an additional path. Down the line, we could
>>>>>>>> also see how man callers of the C code can be changed to use this
>>>>>>>> pattern.
>>>>>>>> 
>>>>>>>> Do you want to send a patch based on this solution Tomo?
>>>>>>>
>>>>>>> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>>>>>>>
>>>>>>> The solution that we discussed before, right? It changes how the
>>>>>>> hrtimer core calls the callback. If the C maintainers take that, I
>>>>>>> will do the Rust side for it.
>>>>>> 
>>>>>> Yes this one. We don't know if C maintainers will like it. We were
>>>>>> discussing having a separate path on the C side just for just,
>>>>>> alternatively converting C side callers.
>>>>>> 
>>>>>> I think we should be able to reach some kind of agreement with C
>>>>>> timekeeping. But if not, we can solve it on rust side only, but less
>>>>>> efficient. We can grab the base lock again, read expires, then drop the
>>>>>> lock. But better to do it in the C code.
>>>>>
>>>>> The Rust side cannot take the base lock: lock_hrtimer_base() is static
>>>>> in kernel/time/hrtimer.c, internal to the core. So that way needs some
>>>>> agreement with the C maintainers as well.
>>>> 
>>>> Right, we would have to export the symbol, or a function for this
>>>> purpose. But it is a smaller change to C code. I would prefer we solve
>>>> it properly though, not with hacks.
>>>
>>> Could you propose the solution to the C maintainers? I will do the
>>> Rust side, whichever way it goes.
>> 
>> Not sure what you are asking. C people are CC in this thread. I think
>> the best way to discuss is to write a patch that can be the basis of
>> discussion. Do you want me to draft up something, or do you want to do
>> that?
>
> The former, please.
>
> This thread has a lot of Rust-specific detail, so I think a new thread
> with the patch would be a better basis for the discussion.

For tracking purposes, the new thread is here [1].

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/all/20260825-expires-v2-v1-0-90411c6217c7@kernel.org/

