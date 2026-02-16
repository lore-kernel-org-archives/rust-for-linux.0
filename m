Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE02475E3;
	Mon, 16 Feb 2026 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771226016; cv=none; b=LVhPv8Z7eLuaqrYswNnlZDcHghKsL60/u6mWM4Uftf3TP5odrDPuP9yiUbPDJn2JG9dtsuhiJL4VSF/nKdwC1z7s2l5t/7LzQbZPrQoot+ZfObu7iojqio6QwSEIFLbAgBhOT255AABXlB2tg9X3qzbCsg0Jjadu/G7sLIPC8rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771226016; c=relaxed/simple;
	bh=rIjgNJ+xVSUM3/+TyrxX+jdQzxJqGR+EyvgW7fXKikM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u+EP/KXlmXJ4VwkZAeFArKUaxTeGxv29RoY9NxI2zGxWNgvy/f2WxpYgqSD7TMqh+XoI6dJtbeWRQTJJq0zIP4V1dxiOB7vWRWMa9sGGEgOTOIgqr7LtHc1EXvaJyi3swmOtlwv5KswzX06Vesg/6RuY3USY2Q/PyNePcd2ulKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxKVtxCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxKVtxCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56396C116C6;
	Mon, 16 Feb 2026 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771226016;
	bh=rIjgNJ+xVSUM3/+TyrxX+jdQzxJqGR+EyvgW7fXKikM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CxKVtxCVMuHtW+ibjaYYlyGKmKLZdTqyb/1xgXcEXRNQsWJWo+kf3dURh4Taz5t/Q
	 91iWBrviDrFSqV1ms/VZhfCnqjhcaojtSsgwz2ZKLlSMe5P+4buX75RGiRlZ1h8p7k
	 UkQtV9t9dgXpNjSRdhYx7BWGc94e+u0X1eA6KeWIqdTz2lpZIuuMiLNOFzv96vk71n
	 HuACEkefyszETjraxqYG+0T7KEdIMl10gsCJQKDQXIFtR+KgR76yO7EKm/+BOw/Dg6
	 4qRP2/qnOZSZCw4q46XBPlKdzkeVvdlrp04W9aOvq6/NSfL/DtvqcVHRUYpADkkSfo
	 2HSarVOQ4mVSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add `UniqueArc::as_ptr`
In-Reply-To: <DGFXA113B8XT.2IPBLCLYT1X5O@kernel.org>
References: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>
 <ruWLPybrInMfRz5QD44emTcz-K3W4N_FWZx5qBX2NS9wK_Qrraeve1Qmgv7R47TD7IdO9aZorCQS0B03KCCstA==@protonmail.internalid>
 <DGFXA113B8XT.2IPBLCLYT1X5O@kernel.org>
Date: Mon, 16 Feb 2026 08:13:05 +0100
Message-ID: <87fr71duv2.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Sun Feb 15, 2026 at 9:38 PM CET, Andreas Hindborg wrote:
>> Add a method to `UniqueArc` for getting a raw pointer. The implementation
>> defers to the `Arc` implementation of the same method.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/sync/arc.rs | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
>> index 289f77abf415a..9c70fdd39bd2f 100644
>> --- a/rust/kernel/sync/arc.rs
>> +++ b/rust/kernel/sync/arc.rs
>> @@ -770,6 +770,11 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>, AllocError>
>>              inner: unsafe { Arc::from_inner(KBox::leak(inner).into()) },
>>          })
>>      }
>> +
>> +    /// Return a raw pointer to the data in this unique arc.
>> +    pub fn as_ptr(&self) -> *const T {
>
> This should be an associated function instead of an inherent method.

I think this is so that we always call the function on the intended
object rather than going through Deref. Could you please clarify if this
is correct?


Best regards,
Andreas Hindborg



