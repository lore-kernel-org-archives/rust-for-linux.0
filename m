Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49B3DD51C
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368499; cv=none; b=kiOirWuxFcIlF6G8MgLe6NKzER1MWgMtfJ1FXu+S0SEiUrVZHZseaEAHqXiZ50f0C+bgUkXdQgDe8Mf6wDPycPVK6/EcW2RZF3TI8oz0U15Yi4v9slJdnitUM9Sm6Z29XKSAsBK+OtGPC0IJOYkB2na67SKZGKiwsW6de/Ut6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368499; c=relaxed/simple;
	bh=n+Qtm6ucKJRmCq7/X8Wr+Q4KB3Brkz/w+fiNQlz65yQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZWV4YnDi2chqLSjtr4pCkF4RckV3zKqMKrDT7qsArJ6xr9Ox/+abWUr8TK4p8E4CEWfE3EHbWf0eE0nh2wjJzfvDWBZ5//NaGiQ91ttzBml76FckvPBggQ/iS/eCh+8aHuxfp1eYM/6brQp2K4vItm9O/oR6dYAg2i4Cup4JEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqpF4laE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqpF4laE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D371F000E9;
	Mon, 10 Aug 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368498;
	bh=3CsFlhEBnv5atXMEFmpywsUWJ8L5N6cZFTlYRYa5B5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bqpF4laE2xj6kfo98tt7Wi+EUGeyc34q7Y+cfKei1wlNtz6bWwKCYPvQ5IvPlpxs/
	 mnD8CCTsUfPYTJHIGeq/Fo/hPwUC7JiiUjseDf6tzDzvUaejgIopRdz8Yhgbrw3Ipr
	 UAmivUmbP0MCgjbK19JjcV2BpzW50rSJF9q2eGUuecVVXkhWYXPMVVP8wuo6/Dv59X
	 udi3+d/fObFW7kRDzB4XtkjcPAF5t3OSeC1jaD/Eihfq4ByKynOTqI8r6m23e4YHbT
	 sXA9sxycC/sR1rPPoI2jqoBOoRWl8IXzrmtQT2kkoGOK1FtAgY34W7596FpnzuSTQZ
	 JYEB2/k2h1B8Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, ojeda@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 2/2] rust: hrtimer: Make HrTimer repr(transparent)
In-Reply-To: <20260810.204248.1426065758894654964.tomo@flapping.org>
References: <SL4Oc1gdHsbIunyjsqaDTEU_0hKdwRG6rLiKtGHoNhTKHL9fEPrjgTi4J-lCGhm1vlN-5jp4NCZZmdDa5ndfZg==@protonmail.internalid>
 <20260807233039.1091842-2-tomo@flapping.org> <87jypy2pzr.fsf@kernel.org>
 <20260810.204248.1426065758894654964.tomo@flapping.org>
Date: Mon, 10 Aug 2026 15:28:06 +0200
Message-ID: <87v79i14wp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Mon, 10 Aug 2026 13:07:20 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>> 
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> HrTimerCallbackContext acquires a &HrTimer<T> from a
>>> NonNull<HrTimer<T>> while a &mut HrTimer<T> can exist at the same
>>> time. This is sound only because HrTimer's sole field is
>>> Opaque<bindings::hrtimer>, which puts every byte behind an UnsafeCell.
>>> Adding a field to HrTimer that is not Opaque would make acquiring that
>>> shared reference unsound.
>>>
>>> Make HrTimer repr(transparent), which prevents multiple fields, so that
>>> such a refactor fails to compile instead of silently introducing
>>> unsoundness. This does not guarantee the remaining field stays behind
>>> Opaque, but it rules out the likely way of getting there.
>>>
>>> repr(transparent) cannot be combined with repr(C), so drop the latter.
>>>
>>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/kernel/time/hrtimer.rs         | 6 +++++-
>>>  rust/kernel/time/hrtimer/arc.rs     | 2 +-
>>>  rust/kernel/time/hrtimer/pin.rs     | 2 +-
>>>  rust/kernel/time/hrtimer/pin_mut.rs | 2 +-
>>>  rust/kernel/time/hrtimer/tbox.rs    | 2 +-
>>>  5 files changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>> index 1db84cd4cbe8..04f47af3541b 100644
>>> --- a/rust/kernel/time/hrtimer.rs
>>> +++ b/rust/kernel/time/hrtimer.rs
>>> @@ -418,8 +418,12 @@
>>>  /// # Invariants
>>>  ///
>>>  /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
>>> +// `repr(transparent)` is not merely about layout. `HrTimerCallbackContext` acquires a
>>> +// `&HrTimer<T>` while a `&mut HrTimer<T>` may exist, which is sound only because every byte of
>>> +// this type sits inside `Opaque`. Being transparent rejects a second field at compile time,
>>> +// but it does not enforce that the remaining field stays `Opaque`.
>> 
>> Missing bullet. With that fixed:
>> 
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> This is a plain `//` comment, not documentation. Did you mean that you
> want it documented as one of the `# Invariants` bullets instead?

Ah, thanks for clarifying, I did not see that. No I guess it is fine.
Maybe add a newline?


Best regards,
Andreas Hindborg


