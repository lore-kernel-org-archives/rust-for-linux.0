Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0BB389456
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772130820; cv=none; b=WxeckFG3L46pqtpIormz4J7n1CHOI4Y4nW5NC5YLIL+Dkd4OfvhmT5zeMOjJe34zOr8h0Ptph5lsoK+ACsI1X5n6IK75ntJaD6pd5JKw23f/uJv8To0/JjfkwRmcNZuxFDNlUxv06gqbecaDfoXKP80Tq8mG+6VBoEDblr24BAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772130820; c=relaxed/simple;
	bh=GE44E3J8r6gMM0CKLU5cL6GNGPifrw/dyXGVenYJO20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FjHK45CftBQEv5slXEagrNAIlxqQLuKPt39s2BG3te+z2wMfnQRcAGaaylo8e8ooMDERxLioYD/jjfrJ/GObdnSHK81rnkw9gfsylTrNpeXqHDiNWLH3Xn3V9BedNr30N3S/Qf78M9HHyZPE/BFnCy9Ybducp8z/SooybzBld8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK+uYY8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK+uYY8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB792C116C6;
	Thu, 26 Feb 2026 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772130820;
	bh=GE44E3J8r6gMM0CKLU5cL6GNGPifrw/dyXGVenYJO20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vK+uYY8NHRGJxt0wX7htzhyv+0xd415G81mezVsGZ44NyYj/Wl/tM7VlZA59hVEyC
	 NFzx4TKM6RRqRV1Y2WKa5IqdcsTrh30RNbX9zdK4Fza7As4Na9y8YNt5APS8p/SAxD
	 N7JafVzPQ/0iV9gx/r7+jJYOJI/BI8EpfexVqtxtaGK2viecga//Enht2P+FYYl0uS
	 1XaXGAc6b8VweXNXfXwnEAgRsMD/HbFT9vfuoQbO30QG2zGXr2Vq7+Y4lu/YXklybL
	 0gq/iUuTc2QcIlN0ZsgWUbYr84571kuZtYgb4sO5UmgrUgbyHT+6YiYbLSrC80gibG
	 g2kYA2Omalvdw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <tomo@aliasing.net>,
 gary@garyguo.net
Cc: ojeda@kernel.org, dirk.behme@de.bosch.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
References: <20260226.215052.2040587083248816676.fujita@bee>
 <1772111941.36504110-faee-4088-a465-c0faad81a43b@kernel.org>
 <6ZuBTDotWZ75XfiP0PdEZNqM4Xg1prviuRKstdR1zcM56HCe4_7IdUT0APcrVZ3RTSNHjVqI-sBXgWdE2qjI2g==@protonmail.internalid>
 <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
Date: Thu, 26 Feb 2026 19:33:27 +0100
Message-ID: <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
>> FUJITA Tomonori <tomo@aliasing.net> writes:
>>
>>> On Thu, 26 Feb 2026 11:42:39 +0000
>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>
>>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>> >> index 856d2d929a00..78e2343fd016 100644
>>> >> --- a/rust/kernel/time/hrtimer.rs
>>> >> +++ b/rust/kernel/time/hrtimer.rs
>>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
>>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>>> >>      }
>>> >>
>>> >> +    /// Return the time expiry for this [`HrTimer`].
>>> >> +    ///
>>> >> +    /// # Safety
>>> >> +    ///
>>> >> +    /// - `self_ptr` must point to a valid `Self`.
>>> >> +    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
>>> >> +    ///   within the context of the timer callback.
>>> >> +    #[inline]
>>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
>>> >
>>> > I guess the signature of this can also be
>>> >
>>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove the
>>> > first safety requirement.
>>>
>>> Thanks, I've updated the signature to use &self.
>>>
>>> Andreas, this breaks the consistency with raw_forward. Is this
>>> acceptable?
>>
>> If we do this, we get to argue that the NonNull we have in the callback context
>> is convertible to a reference. Either way is fine with me.
>>
>> If you change this to a reference, then I think we should rename the function to
>> `expires_unchecked`. The `raw` usually refers to operations on pointers rather
>> than references.
>
> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTimer<T>)`?

I assume you mean `HrTimerCallbackContext`.

Could it be a mut reference? We are supposed to have exclusive access
when we have the context.


Best regards,
Andreas Hindborg


