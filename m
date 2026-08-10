Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABE407575
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373350; cv=none; b=i33Uco3kgO53up+j7u6tXLkKXOy83kGi1FJpI/SJsxnX9p3zCH7lI+EH+FzzXws66TYL/v61DbG1WNjl7YrFrMlA+5YSZqHToZ+687SexF7raHVlUyARdXiCTlDjvIVNmqy83XKLEt0oLUA4OE4+pweEfuTI2lxmcLRnzkiDavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373350; c=relaxed/simple;
	bh=oDLofJ2NSemdu3yNWuDNcoVTKjG0sFk+Z9wlScomtXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=is1cnw25ZGiYN5mAYR2mKbH5BHcnYG+rxO0Tixa6iM6auqVCcT493zDIQ1L5oX/9T40MjPdtFzC3RJDdsTebxZufU3S3Wf9yFvWv+amAw0TTfUXiu4bVNHlnH8fnyv892ten1k7O+4dITebXw++/KfummDhL8GO/0MHTtJlQFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1jKZhLJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1jKZhLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A38B1F000E9;
	Mon, 10 Aug 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373348;
	bh=rzLqoea2Zv/4ROBIOF5+GgbBjYDMc8SvB9khW87KdI4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=F1jKZhLJWJNapgYcBkQj7cqFepuctqiImg1Z4Nn5lrJeS9pCoxwDeMeleJguRmzml
	 mq2FJSqJqRxUn16Nt8IkBO/6j2qffx08cFaggjy3QLWZepoLnvqlIh4uAt0N2s++Zm
	 mD08hYDPv9oyVLofumCFgGFMLToYRxmsXextr5IVHl6fIUVfnX4UBJmXXc2ZDkkTRs
	 yXCDrr+BVWQjWghq8J0tqZAf3CJRD6jRHk2/uJz+tiPzffMmhGbkRY8lfhECljbXRl
	 IfIk3rHmg5W4Ed3P5PdE4idx8muDaUYXGJomawAEHwRE+9Wt+Y4kFtfutewfmJeeiD
	 AZ2+MnzviISog==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: tomo@flapping.org, acourbot@nvidia.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 2/2] rust: hrtimer: Make HrTimer repr(transparent)
In-Reply-To: <20260810.230100.1885262719043300345.tomo@flapping.org>
References: <87jypy2pzr.fsf@kernel.org>
 <20260810.204248.1426065758894654964.tomo@flapping.org>
 <87v79i14wp.fsf@kernel.org>
 <20260810.230100.1885262719043300345.tomo@flapping.org>
Date: Mon, 10 Aug 2026 16:48:48 +0200
Message-ID: <87se4m1167.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Mon, 10 Aug 2026 15:28:06 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> FUJITA Tomonori <tomo@flapping.org> writes:
>> 
>>> On Mon, 10 Aug 2026 13:07:20 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>>>> 
>>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>>
>>>>> HrTimerCallbackContext acquires a &HrTimer<T> from a
>>>>> NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
>>>>> time. This is sound only because HrTimer's sole field is
>>>>> Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
>>>>> Adding a field to HrTimer that is not Opaque would make acquiring that
>>>>> shared reference unsound.
>>>>>
>>>>> Make HrTimer repr(transparent), which prevents multiple fields, so that
>>>>> such a refactor fails to compile instead of silently introducing
>>>>> unsoundness. This does not guarantee the remaining field stays behind
>>>>> Opaque, but it rules out the likely way of getting there.
>>>>>
>>>>> repr(transparent) cannot be combined with repr(C), so drop the latter.
>>>>>
>>>>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>> ---
>>>>>  rust/kernel/time/hrtimer.rs         | 6 +++++-
>>>>>  rust/kernel/time/hrtimer/arc.rs     | 2 +-
>>>>>  rust/kernel/time/hrtimer/pin.rs     | 2 +-
>>>>>  rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
>>>>>  rust/kernel/time/hrtimer/tbox.rs    | 2 +-
>>>>>  5 files changed, 9 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>> index 1db84cd4cbe8..04f47af3541b 100644
>>>>> --- a/rust/kernel/time/hrtimer.rs
>>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>>> @@ -418,8 +418,12 @@
>>>>>  /// # Invariants
>>>>>  ///
>>>>>  /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
>>>>> +// `repr(transparent)` is not merely about layout. `HrTimerCallbackContext` acquires a
>>>>> +// `&HrTimer<T>` while a `&mut HrTimer<T>` may exist, which is sound only because every byte of
>>>>> +// this type sits inside `Opaque`. Being transparent rejects a second field at compile time,
>>>>> +// but it does not enforce that the remaining field stays `Opaque`.
>>>> 
>>>> Missing bullet. With that fixed:
>>>> 
>>>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>
>>> This is a plain `//` comment, not documentation. Did you mean that you
>>> want it documented as one of the `# Invariants` bullets instead?
>> 
>> Ah, thanks for clarifying, I did not see that. No I guess it is fine.
>> Maybe add a newline?
>
> Documentation/rust/coding-guidelines.rst gives an example where a
> comment follows the documentation with no blank line in between.
>
> The existing code follows that too, so I think we should stay
> consistent with the documented convention here.

Ok then.

Best regards,
Andreas Hindborg


