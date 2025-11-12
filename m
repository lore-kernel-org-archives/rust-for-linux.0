Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98F215F42
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131723; cv=none; b=F0zEQdGm6ojUzSH2g+OY7Q82JjyRLBPitxkD5rik6RciC5q7z1hHhLW3gwfUjkE8+ZG6zNdi42+HHGjn/tVJtOcedV3kYGgXWy8BYKsRJyzceFxVesfqW02RYORVZdzcxmR9oWjgvxskIKDhfUlHJp7yJ6oGmtKkoCQVMDU+Qn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131723; c=relaxed/simple;
	bh=EKRllaQXe+8U4aHELce7pZ1C5RlV+JXBCAy7e6EQxII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oLl55Uot8R69dKT3wAAyXDEdMOp5ACkHduOW4CYoconpyScMlHcgOK3tUyy8Rlc/SggIZXbJtLJAs8DqvqUlsBCFQYBG8jNsegFIcHPT+cMf/o8q2BVPbZddh3atMU47zlaBs9xIu19+8zjA6tj0l1JctvB9xPtW2tuUjUJdbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gv8kgCtV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gv8kgCtV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B434CC4CEF8;
	Fri, 14 Nov 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131722;
	bh=EKRllaQXe+8U4aHELce7pZ1C5RlV+JXBCAy7e6EQxII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gv8kgCtVAJiH9C/gbPXy/TXJK4sp2l884O6mONW8KaBqIkDbCFE5oTDmIQ2+sq7JM
	 Qf62FeUOawTd7WJyrsSILsnqX6hClG+uGEaFnRs8Z5tZNzidihVbndqnoBSMgj1B6G
	 7nv08qJeYH+oHUf4iXym52/tlzYmCdC0npSdqAcRyn6w8/gE1Oce/cRLXZZW30f++e
	 pO8OHjCA8oeYkAHiMalIaQbUCnL5CxqAhuxYl5y2ba7wPoew4+kOYOuGpLh4NmRH4E
	 O2HvQ/IxqJ/B1IKk+r3mElqP6nA6jVfeXQMJjcsAuq0c3p8pjXed9UkqnIqv07suVO
	 we3mWUkAI2s2A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, aliceryhl@google.com,
 ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
In-Reply-To: <20251112.083810.193018002393490094.fujita.tomonori@gmail.com>
References: <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
 <aRLG1Ofr5QpJGFaB@tardis.local>
 <87h5v16igr.fsf@t14s.mail-host-address-is-not-set>
 <20251112.083810.193018002393490094.fujita.tomonori@gmail.com>
Date: Wed, 12 Nov 2025 10:04:15 +0100
Message-ID: <87ecq37hbk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

> On Tue, 11 Nov 2025 10:12:36 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>>> error[E0277]: `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>>>>    --> /home/fujita/git/linux-rust/samples/rust/rust_configfs.rs:109:9
>>>>     |
>>>> 109 |         kernel::pr_info_once!("print once\n");
>>>>     |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>>>> 
>>>> 
>>>> We need Sync for SetOnce? I haven't been following the SetOnce
>>>
>>> Yes, I think `SetOnce<T>` should be `Sync` if T is `Sync`. So good
>>> finding!
>> 
>> @Tomonori you can include a patch to add the impl, if you end up using
>> `SetOnce`.
>
> I was planning to send a patch for adding Send and Sync anyway,
> regardless of whether I end up using SetOnce for OnceLite.
>
> Another change I'd like to propose is to use an enum, such as State,
> instead of u32 for the init member, as I did in the OnceLite
> implementation [1], something like:
>
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +#[repr(i32)]
> +enum State {
> +    NotStarted = 0,
> +    InProgress = 1,
> +    Completed = 2,
> +}
> +
> +unsafe impl AtomicType for State {
> +    type Repr = i32;
> +}
> +
>
> I think that this would make the code's intent clearer. What do you
> think?
>
> If you think that change sounds reasonable, I can send a patch.

The reason I did not do this was to avoid the unsafe impl. I don't have
any strong opinion for either way though.


Best regards,
Andreas Hindborg


