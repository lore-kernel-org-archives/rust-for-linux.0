Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65835374178
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771360338; cv=none; b=DY0Dl/8vOl96AoH0dy0RW++6HpEg2EN38XcZd7taV95sOsYkAtWmKvCJvo32aG+h9J/W5n/v0dt1CJVKfm7TTkHWdliyMvjBF2Y1fjCokdwJ4l+bwTAEeMPMgTI/1ZgFvS9UceGvGVvItuA61kufSPHQV4gCIXlLCmj8lZ4vcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771360338; c=relaxed/simple;
	bh=pe+I2F9ucO2XVDzx6psZJFYMTeglmSqaEEIYkf4h7vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDR3rN+8jabqmhlZBrnlZISRSXjUpvFC/13XP28AsKr9e6Cnq/9mCVdm4fuLldpKtfJGHGsV+iiV7E6G5ujpBhF9eGYWnnSm/bNwOB431TCqyJlaUDeALOyY4l7KpR2EDTGElD4k6JQ2zA0RX+FJ4PL57UUGU6fg1Z4N01k9T18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Nr+f8CfH; arc=none smtp.client-ip=209.85.167.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Nr+f8CfH"
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-45efd53148eso1450443b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771360334; x=1771965134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTb6I/Y6Yeg69YIr2bHQGlJl+Mkv02foH8/PpQiTI8w=;
        b=Nr+f8CfHc7wpen03a1iuQ0xaKiHN4ozXHOCHi7X9aiP+eito5tnoX6omFWexF0v5Hn
         s8Mv77lXh7KZoioNloih0XMe7Eq+qgWymvJLTO/ekuLbxLO3ITnNmUR7qd49j4QWwT9K
         BOFhjPv+JFfW+C3mi/ivYooG3HDCU4xWt8fMPSCRZAMZXFk3trtu0AbT437UOXG7l/LO
         0sMh0tRk0n/W/Pf0WfmCfmkj/6S3cZJs+JHMcprGJ0ELCYnSNCa7JC2eYRI8Wl3w1vZ4
         e8+ZTIsKFL9tVrc5EdvoggeIfp+aQQ+85yPYD6JxuWB5Yk8gzPAga/zYem4xw0HuzR92
         PGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771360334; x=1771965134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTb6I/Y6Yeg69YIr2bHQGlJl+Mkv02foH8/PpQiTI8w=;
        b=Kq/d+g35Wl/5YkYTzSnePO3jgyKBOIZv38DdlC62QdwHSxCqF7SENe5THCPbfDteaU
         nwwOUdhl46BCY2UnTqCtLMkynQlRwGjyv91Mzo8o2O5j841HfRQi3YTvi5xuwPL15DHm
         35pUbZ+kZg4hL+jOi1AdEj995tt+gh5CPXCP16a/tVB4N5G/UqcTR6EHj4c0uXVdIUou
         ZvJ0i65FNj6ORDuPcdKQaMRvcDhG4WRHu9aq7HvvSsH/dOWYjRBmSu1iiR6RqKHvtEXA
         YclYijFIN2liPwcnvwsQ1G0b5tC1LDBP/lKCU2t2G1Vs5+5IKsbi14NSEH0F5ePBmcY2
         su0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+h+a0SAOrcxDoXvE86psJ9BEZmmlUsMDQE9dZ2xOUmcloD0AFLkbBzWOzrpR5m+j5kTuOpFw6DLVWGoGRfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGG0f2++z9gfQGgiwEa4z0aSnyJ9TbAJKNol7DgXSi/hfW+Dh
	jUi+5WD9B7Xfr52bGyPcr8wiHRiHBz1qBJEUwyNj9VspNZ3P3FOW5e3o+Cwxwfl19cY=
X-Gm-Gg: AZuq6aKBggx5CqCyh0Oj9a5vU8kZIy3y2xEoIfAMb1bEyRm0rHmJKjUAWpXhmHe1Pwq
	KR/ecIzKwYX0vP7z4hxNxXGnNlVOpKCEFPLQ1SniE2XtyCqA61BpssuOXeUMSMCjxgxjYCiUj73
	UqhlCypINldMFpOdk+1/++RIndK2DENE2mUg8ja0lVharffWRCPwvcDMiSLpJ+zqdUfe4OmCWsu
	BMcIC2w7rWeQgGffonB/u3uxKfXfi9dA4FDaLROUKpLW+OxmL4pxN/ILzvX3BQU1HLpvmSP/ww/
	4c4wmdsH4Qp2Dxell1mFXeUVHhTIyMGYXxS4cWb2jGfdQJCKU7rGq8CoQAxvRdLJgonJ+hBtjrD
	BmyLpjwnz9FhzqKIvyWKXudEv2HwgcRh4RjLwprmg4CEUp5TtZnT0RaDR5IS1LpMwiB3RdNheNl
	rJ1S69ff2jZ1eJLe28HMOg8240dq/QphAdZxR1Mv/LZajfuiM4inUXo42MqYQfzFL++PeMpYdww
	3/ZcKsv
X-Received: by 2002:a05:6808:1793:b0:45c:96bb:1202 with SMTP id 5614622812f47-463b40b7374mr6464117b6e.58.1771360334150;
        Tue, 17 Feb 2026 12:32:14 -0800 (PST)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636b065d5csm13412550b6e.13.2026.02.17.12.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 12:32:13 -0800 (PST)
Message-ID: <abc66533-063b-4cf3-a683-d7c15ffa1c05@kernel.dk>
Date: Tue, 17 Feb 2026 13:32:11 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
To: Andreas Hindborg <a.hindborg@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <kkmXYWYC07oImDD0FJFVCCWl45alQdraRLHoLr7zowZfE0tMz0MmPIpuyEYQRSLjBQqrp_Ch0iR2Rix_g49lNg==@protonmail.internalid>
 <aZRWOIPThLfIZ1Ph@google.com> <87ecmjcw2v.fsf@kernel.org>
 <Ubu-HoF6Epp0EBvoi1HO6Q9YgTbAxfjfziFD3wsuTop8XLAXSvW2ZkzmMfb0gA2zCfn1XjwuxBSpyx-lexty6Q==@protonmail.internalid>
 <20260217160451.GA2995752@noisy.programming.kicks-ass.net>
 <878qcrcisb.fsf@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <878qcrcisb.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/17/26 11:43 AM, Andreas Hindborg wrote:
> "Peter Zijlstra" <peterz@infradead.org> writes:
> 
>> On Tue, Feb 17, 2026 at 02:56:40PM +0100, Andreas Hindborg wrote:
>>
>>> I'm processing disk IO in the Rust null block driver. The pages backing
>>> the IO requests may be simultaneously mapped to user space, so there is
>>> no way to guarantee that there is no concurrent memory operation to/from
>>> the memory area. User space programs can do whatever.
>>>
>>> I don't have any control flow depending on the data I copy. I just store
>>> it somewhere and return it if a read IO for the same sector arrive.
>>
>> Right, so IIRC the old DIO code used to have this problem. We'd end up
>> writing whatever random state to disk if you did DIO of an mmap().
>>
>> And if IIRC the current state of things is better in that we ensure the
>> mapping becomes RO and we have writes fault and wait until the writeback
>> is complete, ensuring things are somewhat more consistent.
>>
>> But you'd better ask Jens or someone that has looked at the various IO
>> paths in the past 10 years or so :-)
> 
> Oh, this is a really important detail that I did not find while trying
> to follow the code path from user space.
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> 
> @Jens is this so, are pages from user space that are part of a write
> request mapped RO during the IO operation?

No, there's no such thing. It'd make O_DIRECT writes much slower.

Also see the recent stable pages merge that went into upstream this
merge window:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4adc13ed7c281c16152a700e47b65d17de07321a

which only really deals with the checksumming problem, but regardless
it's in the same area of "userspace modifies page(s) while IO is
in-flight". If you don't do checksums, and you rely on bufferA ending up
on stable storage while having it in-flight and also modifying bufferA
simultaneously from your application, you get to keep both broken pieces

-- 
Jens Axboe
