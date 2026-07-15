Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DD2EEE63
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122658; cv=none; b=IG4ad3JaUxKdymEepdtwwHBTFooVUVAoAqvY2XI+7pF1fbqtp+Q21pxwKj38TElYSI+obchHfsBy2QsJHeMU1EBdn3heA8WAUq3RpPAHzq1Cr2hlDc7YmkztfzN461ODXGlIW8ClJwd7TrU17jnD2je5vb/ee4t9QYtVhc84KZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122658; c=relaxed/simple;
	bh=yf9XzCZFc5g7b2/Db0e2WgjDAv23QAStE2Dt3OzcWug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gYy2tm/NUrAqadxFYpGC49oO4AvAE987MIU38GoG2NktFR+54sA5Xzepbacna/9RWyEFgsekZoMFgOXu327W3rI79347KKnFB+BidN3JSiQQWjjFFOsZLnG99bMmI0UWkE85ASZjzewWR4PKqXLShCad6SlC0gSZ+9cAou5V8AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jcfv+pBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jcfv+pBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AE91F00A3A;
	Wed, 15 Jul 2026 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784122657;
	bh=vgtPuIR2nGutJO0rUN//ADPG8TDSUsS2cdfbbasNal8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Jcfv+pBuf5FLttOz7RVemSmzRUiVd+pKGQJeVob7Y4S2QmDCIisVXCfjVQYF+caO9
	 JIkFg9R/PA9qjfmduY7BJPpQQQi/OOmMV8ms9Whnt2v/aTqrnVnEWIhiyraZdELGTe
	 hSPDE/uDgr2bBGA01c2wVHo6DrM9LLsrqSJA7Cmar7x7l7mx+qMq4SymVJsft9JHRW
	 mvXunQWiKmjaWpC8uf3HoYnWEQmakidldxff/OLXxZiAtdfk7WYocnxYI/ZGXS2ZHQ
	 kaVN4FC4o+SAUDW90rCJqtJP6qguAO/HE/UEookMGC34jzJapBxLTbLru3ydhxbOxe
	 S9NhI+V9Chrww==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@aliasing.net, ojeda@kernel.org, gary@garyguo.net,
 dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260715.202254.38223441240127219.tomo@flapping.org>
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid>
 <20260303061000.73970-1-tomo@aliasing.net>
 <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
 <20260715.202254.38223441240127219.tomo@flapping.org>
Date: Wed, 15 Jul 2026 15:37:25 +0200
Message-ID: <87a4rsgyqy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Thu, 18 Jun 2026 11:56:59 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@aliasing.net> writes:
>> 
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> HrTimer::expires() previously read node.expires via a volatile load, which
>>> can race with C-side updates. Rework the API so it is only callable with
>>> exclusive access or from the callback context.
>>>
>>> Introduce expires_unchecked() with an explicit safety contract, switch
>>> HrTimer::expires() to Pin<&mut Self>, add
>>> HrTimerCallbackContext::expires(), and route the read through
>>> hrtimer_get_expires() via a Rust helper.
>>>
>>> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
>>> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> One thing I'd like to double check before merging this,
> HrTImerCallbackContext::expires() now does:
>
> unsafe { self.0.as_ref().expires_unchecked() }
>
> which briefly makes a &HrTimer<T> from the NonNull<HrTimer<T>>.
>
> This is only sound today because `HrTimer<T>`'s sole field is
> `Opaque<bindings::hrtimer>`. As you pointed out earlier, if we add a
> field to HrTimer, "stuff breaks".
>
> Should `expires_unchecked` just keep taking `self_ptr: *const Self`,
> like `raw_forward()` (and like v2 did), so
> `HrTimerCallbackContext::expires()` can stay on `self.0.as_ptr()` and
> never form the reference at all?

Either way is fine for me, but Gary seems to gravitate towards the
current solution, so maybe keep that? We can add a "// NOTE:" on the
struct definition saying that soundness depends on all fields being OK
with this caveat.


Best regards,
Andreas Hindborg


