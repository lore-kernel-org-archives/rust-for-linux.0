Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484FE369988;
	Wed, 21 Jan 2026 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769026672; cv=none; b=EqytK8JE0yAEC6L+5dgJ8RKgFYnbJziszf05aZfVfHCjF8jGi5LOM+srX/n3IcadmjS2kXIzhdm0JRnetrVwJ81lt4+lo91ZenDTlC+w55FyZOnb0yMX7SEIbvYP8wmstpt0BPz35DmcbRoOb9/T1GsosGL5eZG1T0sQZNx6ITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769026672; c=relaxed/simple;
	bh=PrJnvgh2eQv2CfhAQyXKnyUcd5w9+7LsGiPHRElgqKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bsTP0RqdQQpXWjSNYC4K1b1wtqnZU0qOOd46cS926c2UbxSMtBu3YZz/UTY5SVvJiAeyqjjOcKx51BzH83jckuMsztXkPDnAjR3x7/voOYxr27T5Ey8Rk7fHT2mjJEzlyqdOV99F/BBRMWMOGGUw6/UmGkOA2Zl4bTahl1+3ghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG0ehvkS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG0ehvkS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C92C4CEF1;
	Wed, 21 Jan 2026 20:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769026671;
	bh=PrJnvgh2eQv2CfhAQyXKnyUcd5w9+7LsGiPHRElgqKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IG0ehvkSYjnN5iE1mHwY3KLbAHq+DNILnccE4t0kiZUzhm8a1JwGU1oAXRoSlpgjZ
	 bYZsd8S6kaZvG0kPtGh5ahyg+Z3ZjCk6rM+O757HAT5A4w42+TmIh9WiFWmfrwPzKZ
	 +rwL3AXVKJWVtEZ0PLWXw97VPzZ42yFAU/1gdFLw/i/J+OlfQxV1ymyGJqXHYvnokD
	 yR0/UVIHCJd8k18k4RG478gnNmqEkZG9KmtPleBJ7FRWn+nHCJ8skbm+lvLgOAClQw
	 zk8ky9Xt5yUjsksC0+yzUl6fJDyj1jrZz/ge25r5nOblrrf45pCBiiNxCiiJobm1kK
	 GaiVezO7NZj5g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Tamir
 Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
In-Reply-To: <DFUI6LMASTMK.2WI00LMY5FTSP@garyguo.net>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
 <L-BdidfnzrZLOC35Y3KX2Y4TUkcBRy3f70o2nc8XRz2yHxUR9D1O_ECPqnfScNWnrN6sHRQNdGbZEspB39xTEQ==@protonmail.internalid>
 <DFUE4FBOIF4Z.22DLDSQS06LO4@garyguo.net>
 <87fr7yu6x8.fsf@t14s.mail-host-address-is-not-set>
 <SwOx1m7_yc4GbtnJMI6njc6leO_v_cQzIMVMtLaov0n7wxwggwHBHLsmkA8l-9Drr7T9D5jqilzAQ_9jGqpt2w==@protonmail.internalid>
 <DFUI6LMASTMK.2WI00LMY5FTSP@garyguo.net>
Date: Wed, 21 Jan 2026 21:17:41 +0100
Message-ID: <87a4y6u3dm.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Jan 21, 2026 at 7:01 PM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
>>>> Replace the `xa_init_flags` helper with direct initialization of XArray
>>>> structures using `__spin_lock_init`. This allows each XArray to have
>>>> its own lock class key for lockdep, preventing false positive warnings
>>>> about lock ordering violations.
>>>>
>>>
>>> Isn't this potentially a problem on the C side as well? `xa_init_flags` is a
>>> static inline function, which means that the lock class is going to be the same
>>> if a single C compilation unit initializes multiple xarrays -- unlike when you
>>> use spin_lock_init, where each callsite gets a different lock class.
>>>
>>> Best,
>>> Gary
>>>
>>>> Add a `new_xarray!` macro that automatically generates a unique lock
>>>> class key for each XArray instantiation site. The macro accepts an
>>>> optional name parameter and uses the `optional_name!` and
>>>> `static_lock_class!` macros to generate appropriate names and lock
>>>> classes.
>>
>> My intuition about this was that when the C static function is inlined, a
>> new static address is used for each place the function is inlined. Is
>> this not correct?
>
> No, the static inside static functions still have the normal static semantics.
> There's a single copy regardless how many times the function is inlined.
>
> So you have a unique copy per compilation unit.

I see. A any rate I get into trouble with lockdep when I lock multiple
different xarrays concurrently in the same code gen unit. I am not sure
how they solve that in C, or if it will also be a problem there.


Best regards,
Andreas Hindborg


