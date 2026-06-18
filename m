Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E812E7F0A
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773671; cv=none; b=lJQc+CS2DROBbGpl6dKxY3qeczAwDZtuWGGdh9fk/krEQSQrsbmPYkY+jIICNJbzt+rPRCxCq/zw9fH3dovlvJsvmAwcx/r21EGza2aiDGrYNK/Vv2kGvOlUDRjRSKvbjtcFC8++RWwC+sCTW2bdNhveppwDBZHNPvsBfOQXoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773671; c=relaxed/simple;
	bh=QgtzE0ch9yHuMwVYlg+FgIVemtRUVYo4YZUm4G+OtqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HHHLIx7OrdwJwYxKV0hRShzq/sWYJqNie64UawzWoJ0bhPraGO7LWhAn7PhT+3jxBUsFOAA9svK0r6TygU6UvIN96VwHDEqcj/TypCz48bverS4nHRojRAKhG6Zn0uNMoW+YyYsfYgPWL1eT2z4KMjkmxCoNwn4R8dR3YMcXcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuneoGg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuneoGg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891081F000E9;
	Thu, 18 Jun 2026 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781773670;
	bh=MumYQ5+yxGMuWFz5NmxDASr+X4w1zMbXdVguvfH5NvQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CuneoGg63Y1b/BblmW37YtfKxlG0QlT39ibIqbBpitm+oJiL6mkj4D7ADA9mC0AnL
	 UaF+OU1r6Q0BCIicvEEV+p2FwrBVit5S7SlvhcTH7oqn9hE1UXEn+nLzFjKe4zZiwc
	 AzKcFs/gHbdvRmAoVb7Y4MjAbLD/0ju9KaR5PPqfl+BI8Uzsx0ZKeG99dP6YLgXVK0
	 kxY0GbzYKD61Hc28h9p8z8mmP1NlH99oGygQ7pplDc5jTLKpDSu8YY+chfF/3M+rQc
	 wcvZBDVxdzpSRW445EwJqJrAUzAYBR0TZGWk/0n+XYP02/zyHoBvCYCPiqwnz4+qX9
	 kk3D5/Pf9ZSOg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, FUJITA
 Tomonori <tomo@aliasing.net>
Cc: ojeda@kernel.org, dirk.behme@de.bosch.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <DHA643CROTOZ.X3N2KZKS8HB5@garyguo.net>
References: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
 <87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
 <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
 <20260228.102641.702865761508670909.fujita@bee>
 <DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
 <87ldg0m6rp.fsf@t14s.mail-host-address-is-not-set>
 <DHA643CROTOZ.X3N2KZKS8HB5@garyguo.net>
Date: Thu, 18 Jun 2026 11:07:38 +0200
Message-ID: <871pe4gqsl.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Mar 10, 2026 at 8:24 AM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Sat Feb 28, 2026 at 1:26 AM GMT, FUJITA Tomonori wrote:
>>>> On Fri, 27 Feb 2026 12:32:05 +0000
>>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>>
>>>>> On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
>>>>>> "Gary Guo" <gary@garyguo.net> writes:
>>>>>>
>>>>>>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTimer<T>)`?
>>>>>>
>>>>>> I assume you mean `HrTimerCallbackContext`.
>>>>>>
>>>>>> Could it be a mut reference? We are supposed to have exclusive access
>>>>>> when we have the context.
>>>>> 
>>>>> If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
>>>>> `HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to the callback?
>>>>
>>>> During the callback, ArcTimerHandle still holds Arc<T>, and the
>>>> callback receives ArcBorrow<T>. Creating Pin<&mut HrTimer<T>> would
>>>> cause aliasing between &HrTimer<T> and &mut HrTimer<T>?
>>>
>>> This is fine from an aliasing POV as `Opaque` cancels the noalias requirement
>>> of `&mut` already.
>>>
>>> As long as we can guarantee that no method on `Pin<&mut HrTimer<T>>` can race
>>> with methods on `&HrTimer<T>` it should be okay.
>>
>> Is this really OK?
>>
>> struct Foo {
>>   timer: HrTimer<Foo>,
>> }
>>
>> Surely it cannot be OK to hold both `&Foo` and `Pin<&mut HrTimer<Foo>>`,
>> even though the internals of `HrTimer<_>` is an `Opaque` field?
>
> It's not UB to hold both, otherwise you cannot write intrusive data structures.
>
> It might be useful to think the mutable reference that the hrtime callback
> receives is th same as getting a reference to mutex content, while others can
> still reference the mutex.
>
> We can probably have two types, where one can have shared refs (for starting the
> timer) and the other is exclusive only?

That is basically the callback context type.

Best regards,
Andreas Hindborg



