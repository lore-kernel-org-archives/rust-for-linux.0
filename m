Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EA11DE4F1
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122454; cv=none; b=CKOkjW/+kxM8ufJeet/z7fiWLLL0jxPVFhKl1zx2i9LWHP83BaZhSl1DLrWOt3z4mtx1N8tkHU9s7i7l3bD3JXngh79X8sbJqRfHZUqiqQU7UJ4lJvgDygIp5hGIi4mcIGQ2zwAZkJgYdDQO1cyaPLeWoxx38rm8VYB4r+EjfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122454; c=relaxed/simple;
	bh=WicUkYcnfqsmeDqktuOSbN/9omsJ6ynfarTG99BrouA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AmFqCLhp19fBpdUjzDT5UBG+klhctrteBN6oJEfMnVCCPryw3kencIaS7rluLrrBfazsTdSDxA8It5lQc9kVPwSCJJ1Nu44jjtWjc8PgSIqat3ZBfsFn1uUdvlxI7aJ0wkyU5Xq5JfiuPb5Kt6tQEt7z5j8vSuf4Sb8YvI3a9Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0DLNPqk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0DLNPqk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448B81F000E9;
	Wed, 15 Jul 2026 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784122453;
	bh=XmdICwKCxqQc9yRNGlXZxOHfGZUHHeNQ8Xhx7cbzLzk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=K0DLNPqkiulnLfNCMRafJ21lk+JVtEG1nwQqkNL+uZMOImtw61snSUCleNJFXH2B7
	 E0qcv+1vGH2xuhYf4Do4gW5BlXWdg3FApgvIlCMBQHmpjA3RTrScIFt++G9Y4+89F1
	 C8tlGZ7XRXIjsVBX6C23JbArAR06kQphfm8H7eAZa5/smI3NNiErceZkvhK/OuA14m
	 +vbF3xqT6KMqdmXyCKN3TvVG3+OJRjsp+PmFt9XAHPHXmGZ8LsahFefVBs2PiGXo6C
	 klifAXQdjKqmx5CMUkHn8ymIvaz3ZI8BjB1SWrt7G55vZSeHLW5cKira9jLxA85UhN
	 7juPhvPwnGxLg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to Delta
In-Reply-To: <20260715.212021.485543459172925773.tomo@flapping.org>
References: <qkuR2hizBbyuYmC9pigSGc_wAIN33sdtqV2v9CS9TjAP3UsxypcGi7F5_XXauq7AtTNawHIM2zR6awW7O1LsCw==@protonmail.internalid>
 <20260712235246.3069713-2-tomo@flapping.org> <87ik6ghha8.fsf@kernel.org>
 <20260715.212021.485543459172925773.tomo@flapping.org>
Date: Wed, 15 Jul 2026 15:33:59 +0200
Message-ID: <87cxwogywo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Wed, 15 Jul 2026 08:57:03 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>> 
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> Callers that hand a timeout to some C APIs need conversion between
>>> Delta and jiffies.
>>>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++++
>>>  1 file changed, 30 insertions(+)
>>>
>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>> index 363e93cbb139..cd054ea5df02 100644
>>> --- a/rust/kernel/time.rs
>>> +++ b/rust/kernel/time.rs
>>> @@ -377,6 +377,20 @@ impl Delta {
>>>      /// A span of time equal to zero.
>>>      pub const ZERO: Self = Self { nanos: 0 };
>>>
>>> +    /// Create a new [`Delta`] from a number of jiffies.
>>> +    ///
>>> +    /// If `jiffies` is large enough that the corresponding number of nanoseconds
>>> +    /// would overflow an `i64`, the result saturates to `i64::MAX` nanoseconds.
>>> +    /// The exact threshold depends on `CONFIG_HZ`.
>>> +    #[inline]
>>> +    pub fn from_jiffies(jiffies: u64) -> Self {
>>> +        let nanos = (u128::from(jiffies) * NSEC_PER_SEC as u128 / u128::from(bindings::HZ))
>>> +            .min(i64::MAX as u128);
>> 
>> In general for this patch, why are some widening operations using `from`
>> and others use `as u128`? Is it not possible to use into/form for all
>> the widening operations?
>
> When NSEC_PER_SEC % HZ != 0, we need to multiply jiffies *
> NSEC_PER_SEC before dividing by HZ.
>
> What the C side does is:
>
> u64 jiffies64_to_nsecs(u64 j)
> {
> #if !(NSEC_PER_SEC % HZ)
> 	return (NSEC_PER_SEC / HZ) * j;
> # else
> 	return div_u64(j * HZ_TO_NSEC_NUM, HZ_TO_NSEC_DEN);
> #endif
> }
>
> We could replicate this with a cfg/the C side's const-eval
> computing. But I think using u128/i128 is simpler. What do you think?

I think widening to 128 bits is fine. My question is why `NSEC_PER_SEC
as u128` instead of `u128::from(NSEC_PER_SEC)`?

Best regards,
Andreas Hindborg


