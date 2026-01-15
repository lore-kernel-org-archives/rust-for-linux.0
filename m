Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B476395D8F;
	Thu, 15 Jan 2026 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483929; cv=none; b=nzeAfRD0wrKPcdx9nADwMJzA/yp4igTUqNIZiezmIN0cvnM8R6pNaF9mD5FckUug/0ZdfaTZAe98XFun+VXd/2AS7GoEPHyFwqJlm/T1JHzx5iSFnOLv1gy0maE6hY8ciXqwIp67P15QVtGRgGBkkdoCwOipS2phBOfMsaax+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483929; c=relaxed/simple;
	bh=N2SthQoxcMX6rM0Y2aLdFhKs7OAO1VmKaPNUvErcFM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=feoIinL1+Hwf+gLSlxDDp3hCJwWua0b/kLaaoy737yUUk/0qdfNyn2AjKOwu7HBaOe6F1KQLgZ3xLcDJWzuolW235qaessuHyDPofiQ5HKPy90P0JaDQT+5t0V/+SHqFTjlw6ygnoWPDvfcJ/aYRuDDwSc5qf+Zx0CaBpSPq27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLIdz5Sc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLIdz5Sc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DCFC19423;
	Thu, 15 Jan 2026 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483929;
	bh=N2SthQoxcMX6rM0Y2aLdFhKs7OAO1VmKaPNUvErcFM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LLIdz5ScoBAStUkOvNhvrnws0oZFK9kb4lewOA9sU9VTYuv+6+ZVy+frQLySZR7RB
	 xkg/oboJEcNh6t3Y1VTiiCnr7nnKfJjSQc+1qgXKsZ+40l70dr03offEWW48to3zod
	 GTcAWfwNvtsh1ZdwuTNLnS2PU22atRhokhRgVPBVg6KKfAbcJdJCiKHRn3qh3zh7b+
	 zk3a29cgaXe/s8/JzQfb4G5HgI/Cw3N0aDeYjlDOYCwLj4PVWPhKp2HM5cqnxZ5qwF
	 XMltDW1fZcv/teLqyIns4nWtFkgaYnkdYgUuUF+BrO3tHjhd41FWGT0nU6DLmLxKIQ
	 WWx5G5nl3SOEA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
In-Reply-To: <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org>
 <MZi6e8MKF8-nD5v4xB_ojbUpQNW3t-VRA9mRg0FKP_XoSAw_HFWrwWECsKnN53lKdE_CqK1CbxKfo4oHd1Vo0w==@protonmail.internalid>
 <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
Date: Thu, 15 Jan 2026 14:31:58 +0100
Message-ID: <87bjivf1dd.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Thu Jan 15, 2026 at 12:14 PM GMT, Andreas Hindborg wrote:
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>
>>> "Filipe Xavier" <felipeaggger@gmail.com> writes:
>>>
>>>> We have seen a proliferation of mod_whatever::foo::Flags
>>>> being defined with essentially the same implementation
>>>> for BitAnd, BitOr, contains and etc.
>>>>
>>>> This macro aims to bring a solution for this,
>>>> allowing to generate these methods for user-defined structs.
>>>> With some use cases in KMS and upcoming GPU drivers.
>>>>
>>>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
>>>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>> Suggested-by: Lyude Paul <lyude@redhat.com>
>>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>>>
>>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>
>>>
>>> I think it would be useful to add:
>>>
>>> impl Flags {
>>>      unsafe from_raw(value: Repr) -> {
>>>      ...
>>>      }
>>> }
>>>
>>> impl TryFrom<Repr> for Flag {
>>>      // Succeed if `value` is a valid `Flag` enum bit pattern.
>>> }
>>>
>>> impl TryFrom<Repr> for Flags {
>>>      // Succeed if `value` is the logical OR of valid enum bit patterns.
>>> }
>>
>> Also bitwise operations on the underlying type such as
>>
>>   impl BitOrAssign<Flag> for u32 {
>>   ...
>>   }
>>
>> Not sure if that is possible with the orphan rule, but it would be nice.
>> I was trying to
>>
>>   lim.features |= request::Feature::Rotational;
>
> This is allowed by orphan rules, in a similar way that you can implement
> `From<Local> for Foreign`.
>
> However I don't think this is desirable feature? Why can't a conversion be used
> if you're using raw reprs?
>
> I think we should discourage the use of raw integers when bitflags can be used,
> adding that (or even `TryFrom`) can be a negative incentive.

In this case I have a C struct with a flag field. It would not be
ergonomic to read out the field, convert to `Flag` type, do the
operation, and store back again.

This assignment is in abstraction code. I could use the raw bindings
constant for the operation, but I would rather use the Rust type.

I do not think there is any risk by allowing operators between flags and
integers. What situation do you imagine where there would be a problem?

Best regards
Andreas Hindborg



