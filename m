Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF859245014
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852369; cv=none; b=je2BoDuMtg293FdCAtdax02kFB81mVDShVJrmWXik25C8/p38wc8dEzXtgoa+jO+3Lf1izpVQiFMdfLBtqUgmP93mSLmtzXY5THRcqKncBT70z8JAk1PrXEQbUozZ7v7yIEwAlSEbAh/dnoQrqlHUAZyzf2vlRThi6sCByRreO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852369; c=relaxed/simple;
	bh=RTpSblbz8pmvukHekzDHgK2gwTmmjE/tC8aNOtvEJ3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LGG5Af81s+hmJ/Tk1wEI3dSWYobU9dQ9h1lrglQ2dl0Q7afi2LMFUa3ZT851unE1eBqCwS9u5v3EWc7NCchly3SZwZZRyKcvRFnPYcZ7ytP4ay+I1GTDdoobr7eEtDUiFT139VKlZ22KIELYW9BSIdT7OAAmnjsVPYfE1SEAvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+FkYDX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+FkYDX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BBEC19421;
	Tue, 11 Nov 2025 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762852367;
	bh=RTpSblbz8pmvukHekzDHgK2gwTmmjE/tC8aNOtvEJ3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f+FkYDX7AUmd2nT3Gc8huW1BL6BPKkE1fOr5fT0bwN2N2cnxMsOgrUOIFgozo9ph+
	 ZXnmqFZxa0yjw1S4zJsiWUcKcdHvmHD2ZG6/oe2rJRcEyj0DyVlTdGuFARXp1biDBI
	 95XcZPqGxWItemfopmCsSRyHKAKTPd376328y91YNeyHXJVj/57zo26e++AUXDDujJ
	 pKym9gsvSU9/NhJWRJ+m5M9bSovLlUk3uJ8YpvaKtPGInD+4nu/j6MxFA/jRxvYLjZ
	 DVjGwdbQSgJ/t+rjeoEr7/gn83TyKzMsNpcyaCJX5JaRuHrGLSNEaJ6oXkh5IS0ABB
	 sBbRGzsAdjLNw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
In-Reply-To: <aRLG1Ofr5QpJGFaB@tardis.local>
References: <aQ21xajAygTbi582@google.com>
 <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
 <aRIPgOPvi4uhGQcM@tardis.local>
 <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
 <aRLG1Ofr5QpJGFaB@tardis.local>
Date: Tue, 11 Nov 2025 10:12:36 +0100
Message-ID: <87h5v16igr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun.feng@gmail.com> writes:

> On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
>> On Mon, 10 Nov 2025 08:14:56 -0800
>> Boqun Feng <boqun.feng@gmail.com> wrote:

<cut>

>> Anyway, I tried and got a following compile error:
>> 
>> error[E0277]: `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>>    --> /home/fujita/git/linux-rust/samples/rust/rust_configfs.rs:109:9
>>     |
>> 109 |         kernel::pr_info_once!("print once\n");
>>     |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>> 
>> 
>> We need Sync for SetOnce? I haven't been following the SetOnce
>
> Yes, I think `SetOnce<T>` should be `Sync` if T is `Sync`. So good
> finding!

@Tomonori you can include a patch to add the impl, if you end up using
`SetOnce`.

> I would say it's actually the effort of trying to reuse the
> existing solution makes that we find places that needs to be improved.
>
> @Andreas, thoughts?

Sorry, I did not follow this branch of the thread yet. Please see my
comment on the other branch of the thread tree.

TLDR, I agree we should reuse if we could, but I am unsure if external reset
would violate some rules. I think we should modify `SetOnce` to support
this use case if we can.

>
>> discussion, but I wonder if there are use cases that require Sync. If
>> all access goes through its methods, it seems safe to add Sync.
>> 
>> 
>> I personally prefer the OnceLite implementation of not using SetOnce,
>> however since it's not directly used by users and can be easily
>> changed later, so I'm fine with any implementation as long as we can
>> reach an agreement soon.
>> 
>
> We should always try to find a unified solution, if there is not much
> trouble. Otherwise, we will end up having MyOnce, YourOnce, HisOnce,
> HerOnce, TheirOnce etc in our code base.

I agree.


Best regards,
Andreas Hindborg


