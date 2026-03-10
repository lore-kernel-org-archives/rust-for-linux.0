Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6029AB1A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131082; cv=none; b=jbby6B9jOEMM9NcWQbhvyGJTAyyA5cxEgAFmE3Bvg1t7vBzpXZoxia3sJiAD5qiI2hUmFxJSKmn+2QwlqiGAwXoAXVfgiFns66U6eSckCOIOYgdASCdvVG2t/C1a+S/R8vdHvJTLr9FMk9Ksm9e/G0UE0tG3sdp1HcYlS5npO94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131082; c=relaxed/simple;
	bh=wcr4t1LlPHXTR5rGl0JHNsU6hh5CoJncENRu5n+8+xY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WOYNoRgA2cyvBQ7OqDdhu9ROCFRjANbPHm21sINKz4bi5UYUDumnw5msDI6zZDWxq6/6xn+6MG/19tr57Ga0/DXS1QRelMapUJ769rTRolQQnZ08vWgFrjY5xik0k/2M3yo+/RckBb6sX26ZXtZd/qwAyi5TIvnmhf4lmLJeMMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZMfAy4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZMfAy4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA5AC19423;
	Tue, 10 Mar 2026 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131082;
	bh=wcr4t1LlPHXTR5rGl0JHNsU6hh5CoJncENRu5n+8+xY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aZMfAy4Q8AIyx2nG7BTHO95U48i30qXyGToPlFuAervjMEV22Lti5yC8kEixyKvCd
	 5nTL4e3bm1kxYt96im9nRwcRiUo7J+vK8V97CoGvwwohk/SMR+Lvnif8d7apxKksGZ
	 yIj5GIe6nPyZWS1aRI+b2IpP4Mnp3aPepql8gvDaFxUtF7lqQbJCoAcD5DNKwnY2Bs
	 sSCpDNMJ116GA113wJBa9siEmEm47pAMtgBW1WMSIHPeHyCXxT9mgh+8Is7wpIHMnf
	 JQ+lhiXWQof5M+DT5v/1RnowVPr6Do7CRks9JGDjzxvvTVFKxVjk7lMdAkmsAyEiXI
	 pcBGXjwkhI5Rw==
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
In-Reply-To: <DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
References: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
 <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
 <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
 <20260228.102641.702865761508670909.fujita@bee>
 <DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
Date: Tue, 10 Mar 2026 09:24:26 +0100
Message-ID: <87ldg0m6rp.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sat Feb 28, 2026 at 1:26 AM GMT, FUJITA Tomonori wrote:
>> On Fri, 27 Feb 2026 12:32:05 +0000
>> "Gary Guo" <gary@garyguo.net> wrote:
>>
>>> On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
>>>> "Gary Guo" <gary@garyguo.net> writes:
>>>>
>>>>> On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
>>>>>> FUJITA Tomonori <tomo@aliasing.net> writes:
>>>>>>
>>>>>>> On Thu, 26 Feb 2026 11:42:39 +0000
>>>>>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>>>>>
>>>>>>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>>> >> index 856d2d929a00..78e2343fd016 100644
>>>>>>> >> --- a/rust/kernel/time/hrtimer.rs
>>>>>>> >> +++ b/rust/kernel/time/hrtimer.rs
>>>>>>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
>>>>>>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>>>>>>> >>      }
>>>>>>> >>
>>>>>>> >> +    /// Return the time expiry for this [`HrTimer`].
>>>>>>> >> +    ///
>>>>>>> >> +    /// # Safety
>>>>>>> >> +    ///
>>>>>>> >> +    /// - `self_ptr` must point to a valid `Self`.
>>>>>>> >> +    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
>>>>>>> >> +    ///   within the context of the timer callback.
>>>>>>> >> +    #[inline]
>>>>>>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
>>>>>>> >
>>>>>>> > I guess the signature of this can also be
>>>>>>> >
>>>>>>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove the
>>>>>>> > first safety requirement.
>>>>>>>
>>>>>>> Thanks, I've updated the signature to use &self.
>>>>>>>
>>>>>>> Andreas, this breaks the consistency with raw_forward. Is this
>>>>>>> acceptable?
>>>>>>
>>>>>> If we do this, we get to argue that the NonNull we have in the callback context
>>>>>> is convertible to a reference. Either way is fine with me.
>>>>>>
>>>>>> If you change this to a reference, then I think we should rename the function to
>>>>>> `expires_unchecked`. The `raw` usually refers to operations on pointers rather
>>>>>> than references.
>>>>>
>>>>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTimer<T>)`?
>>>>
>>>> I assume you mean `HrTimerCallbackContext`.
>>>>
>>>> Could it be a mut reference? We are supposed to have exclusive access
>>>> when we have the context.
>>> 
>>> If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
>>> `HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to the callback?
>>
>> During the callback, ArcTimerHandle still holds Arc<T>, and the
>> callback receives ArcBorrow<T>. Creating Pin<&mut HrTimer<T>> would
>> cause aliasing between &HrTimer<T> and &mut HrTimer<T>?
>
> This is fine from an aliasing POV as `Opaque` cancels the noalias requirement
> of `&mut` already.
>
> As long as we can guarantee that no method on `Pin<&mut HrTimer<T>>` can race
> with methods on `&HrTimer<T>` it should be okay.

Is this really OK?

struct Foo {
  timer: HrTimer<Foo>,
}

Surely it cannot be OK to hold both `&Foo` and `Pin<&mut HrTimer<Foo>>`,
even though the internals of `HrTimer<_>` is an `Opaque` field?

I understand that it would be OK if we had a `Pin<&mut
Opaque<bindings::hrtimer>` referencing inside `Foo`, but the other one
really breaks my mental model.

Even if it works out with the current types, if we add a field to
`HrTimer`, stuff breaks.


Best regards,
Andreas Hindborg


