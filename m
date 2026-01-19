Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD91313E38
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824630; cv=none; b=LWnrabMtV1s3j0b3Mz/zVgq9XxVLOtHW424OP58j/PvFre1CPLh7D26Oi/bXAVDtbBEJijG56Fv8o+qVRB/kFJcDc26+c9JwFgcdXVYO8hsM+3BRmJ05d9GFs0DVTvmrh4dCJcRUAkKKw5m0fZrPNsjQJE4y9ZHethqQlBf00Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824630; c=relaxed/simple;
	bh=2kRlzAd/WAP34dcofU0kP9Gcvhk6TtAlZ+54xEeHKKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLLWcRYOhPmZz/22F9KSzuKOCXshnasK0VsEWhItgwx+JnimlfqrHTJnAuqp2MQ/2vu6HnzTr/0kJXEQDxmGyw2ZeXFEMZYCio3cCs5bu5MfcEHFLKJFgySSQGFXHsU1xviU/5Xs9FZruRVWsmXMNj6LABg9n/MGQMc2T/vDihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzugFi0I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzugFi0I"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0c20ee83dso38659495ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 04:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768824629; x=1769429429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gjfEIhmjLR2s3MX8KeaolRjaW9wz8un6cQRSAfImOU=;
        b=PzugFi0Idx1VaKXLUEsveU0WM5QMJA1USJ8/MsHYBfW6GCwzLNfIJMj/D2sJxd98Ez
         JD5CjZR3rVkuUvO33zvkyB+NUj9OQXFRNWEuYgnhF190zmvF6nHYxZ1UpS1xJ+0dN/QP
         jYls3ma6W7vZKK2T0LQNrByF+g025Pp/vxOg740O3YBCjjMBACLTWXZW6CWTdq71NsVA
         k9dLnhrRlMMO2tUumwc9daBuLKdtyGaa+BXP0vPO+LG2QKLMcGJSW40KOas6Re6EOfds
         FJ3W2b9UNOybAFRQu6lR4X+ZR9sNx1RhwSH9EKxxYX/T6hImtT7pPd+ZS2SB24siw/hK
         Hpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824629; x=1769429429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gjfEIhmjLR2s3MX8KeaolRjaW9wz8un6cQRSAfImOU=;
        b=TmrCbCmlIhPiRiNW+A2uFt5sDXwCYrAKi98NbD4n2x2Jf5mE9O0e1QGrZ/eBzaPP+D
         VeLEKBNFv7SzrYYxYQnLfWgUzperCHwuGoEwtjTkWLeReTlf0BrGecIqtcoWfv37pwIO
         fjN0y9HEOW+6hmBeDOegz+COjbXumN5YbuhP15vdUuE+dXnMpP4R4c2QOe2pcInAZgLR
         U9c6kKaVdPSH4t0rfbyPGRPNnkRMqHRpg1nSsZQgKe4VOyTyfI6zypXq2GwyTkb1XABO
         9KFzLPN7eAbycCjHCgiayiguNOiJpJzBs3N/DDLxNr4mSK9xtVAgCLreQ+VW8wLNRnOi
         ItzA==
X-Forwarded-Encrypted: i=1; AJvYcCWDdY+L4pA6GS1sDLorAbLOkiq4ZKb/1pqbdNBjxR5M6ROdce9sFVDQ4v032/cIJsnYRE/xksyllgz04kH5Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDetUL9j6hVB+oXyX32u+Kwq0Py4HhuArcBQLN4ts49i9+iNH
	nsHMwvPtpjGNK5AXr5bVQOT8q7jpHiF0Fia1kP5Mm9d4yRa24bkelB7R
X-Gm-Gg: AZuq6aK1FkUH4C/IMjc5tIWn48jL8kmt51JM09A1/yf6K06dstXfYEfOQG69aUaUNTG
	DwXzrJUXPCeyDQ7nebJ1+UOKWcO7yzJFqH8RYdJP/vk4aMiE119RP3iMLOW+wBqVyWHpgaj7z9o
	iojtE84fKztdzpUwT26uNVfooifTxv4XsmwI1Wo4bbbQwi6wNVWZ82l1qXINL2tEi7AtTCD/zL5
	R6mfxs2O/Y6K7v+96htIQCnlMG03ueNx1aQrSGxnoTxZoEImEF9n0cfUm6QH9uokwMiH74hKLGH
	4/1sSThROP8d5CQJgCrZjbfR5KwHRdYfVGFwaP4OvYQ0gcn6vQjF0hE4LUzNVY93WTIf0iwHlfJ
	rUrkV9aOO39GleNBTlk5GJkGunCLGLYJMI3JEfTJl1hjDprdR/40pgtdISaoZGi+sn/n732xK1E
	C04N9QeI+dvr0g5k1PDZSC+7mWExmwE4kqyLqU
X-Received: by 2002:a17:903:289:b0:2a0:8966:7c9a with SMTP id d9443c01a7336-2a7176cd9c9mr115057695ad.58.1768824628656;
        Mon, 19 Jan 2026 04:10:28 -0800 (PST)
Received: from [10.0.10.3] (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941c088sm93871295ad.91.2026.01.19.04.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 04:10:28 -0800 (PST)
Message-ID: <5d4f3e62-a0b5-47cc-ab03-ea18e1d72257@gmail.com>
Date: Mon, 19 Jan 2026 20:10:21 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] rust: block: mq: use pin_init::zeroed() for
 queue_limits
To: Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Ke Sun <sunke@kylinos.cn>, rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
 <Z55sb2ThC6nBqfAaJu3YNGj3bYMrT9XHy63LEXLGqzPUsAFp-dS0O_usawylT8GR8QrXk8BazrYsOGXe1ax6qw==@protonmail.internalid>
 <20260119065859.1914178-3-sunke@kylinos.cn>
 <87jyxdq2xu.fsf@t14s.mail-host-address-is-not-set>
 <DFSJRCM1F247.212V4MUG0JNR9@garyguo.net>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <DFSJRCM1F247.212V4MUG0JNR9@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/19/26 19:59, Gary Guo wrote:
> On Mon Jan 19, 2026 at 11:03 AM GMT, Andreas Hindborg wrote:
>> "Ke Sun" <sunke@kylinos.cn> writes:
>>
>>> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
>>> queue_limits initialization.
>>>
>>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>>> ---
>>>   rust/kernel/block/mq/gen_disk.rs | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
>>> index 1ce815c8cdab0..4620a86a88dd8 100644
>>> --- a/rust/kernel/block/mq/gen_disk.rs
>>> +++ b/rust/kernel/block/mq/gen_disk.rs
>>> @@ -107,8 +107,8 @@ pub fn build<T: Operations>(
>>>               drop(unsafe { T::QueueData::from_foreign(data) });
>>>           });
>>>
>>> -        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
>>> -        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
>>> +        // `bindings::queue_limits` contain only fields that are valid when zeroed.
>>> +        let mut lim: bindings::queue_limits = pin_init::zeroed();
>> I think we can just drop the comment now that this operation is safe.
> Indeed. I had a look at all the patches and I think for all the comments about
> zeroability can be dropped as this is now checked by the compiler.

Thanks! Will remove those comments in the next version.

Best regards,
Ke Sun

>
> Best,
> Gary
>
