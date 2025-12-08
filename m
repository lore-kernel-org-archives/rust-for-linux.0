Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEDD2D738B
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765235713; cv=none; b=Frimoq+JXI8dfuvqF/TNP8RQzUxv1rZOL+4cI/rKkaI6u3wb6hq+EMbyZFuijaU7k5WFan+c2h0IkK2+w1JmMJz8db3IFCLnjjl75apz7JS8Xh6OZ4DqLCPF1Rqh5dwFd7LNX0J0F6ksPbrUDW7V71nH8wjNjcvYCBclaDa6z5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765235713; c=relaxed/simple;
	bh=tr52Y/aVIwMrybDJ3OYoXS9VdA4cV0jRDiLbVaNYDaI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hXCm75c+9RzJoL92a6iEzAjBSzlZIhVk0J+iPLu4fYNFnF7cUrDwR2/Ci+HHGnAftmlNcXN9/KYk5TAc0e4T8SuiNkiKXlNXOSV7oY9vJWN6YMNrrSB24avSwx2IHhFt50XfOwrdempVVAIxzCuj09kyErEVyEablQhxew2IzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grMz1fCS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grMz1fCS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29853ec5b8cso63854275ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Dec 2025 15:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765235711; x=1765840511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNnaSWznyqvaeVqfKL45UBlZBfWJ1vAw48NYrBGGw8M=;
        b=grMz1fCS6e4EA83SFUiGbSxIH0gfN0SfNgwHrAvSknHFMX4X9FjQzI8Q5UYbN0PjPR
         Oib6WqekMXXF+LhzVQGjDtUw3dSYenRXBZSOphtViH/nCYVz4oqPT4dIelolaAneGox1
         /ULP270MVq14WHGfShb8dDHBwtcmgF+g4tJVBZtY6R8KyPdtIcGwbQhmRoxnRbUC6wcF
         qFY3rNc5OCwwat15p01icwAcT+VCLdT0F8ocKXG8batfF886mPpVauI1+hAuNQNVmIjF
         m6Tt0EVSC5Z+5QuIFu82K9PZ0+Z5CaBZQYPYBKl8nEDCoVk0C+JfLbthPmGb0x6nVA+w
         issg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765235711; x=1765840511;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNnaSWznyqvaeVqfKL45UBlZBfWJ1vAw48NYrBGGw8M=;
        b=Wv0es71pOK2dn/+JSrwTRud942cprrHKN8hyszNxYiMFJgzLB6wfB0E3Rnh2Vcte+o
         AwySZhzOB546ju85NqP3Vn75W1UI1Q3z3SCscQlzceymNUz+1w8NdTVzrnadovYagiTC
         CU0sncL8E4n7kkEwHs+WJQ/UeAw6crl5YThYwkoELIqx8wSBGfXPtmv70hIla7SJa+u3
         qbzHKayVyaQKdl7b5rgnWbylSXMqOPKMUL5M6i81mvbjpJ0IZyvvX0Q2RFlVUiG2HPVw
         A5N24yoVTFSUZXZho40mlJjeq53zJTBV+F+KKcKDrorruk41++bayhfUOv0zOJkQ6UDu
         cQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6ArOTwu5/ScpRmvjxp6VxUBOt7YRWVVU6eYyv3eCIog+tLHgEc9i1nO4Vvyvby6Sh5SmU8TOk3bSlGvjUDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydwrOMcr0wR8QiIsJgOHJnxlR1AXux7cQf9dF0GfMaQ6eTbyVJ
	UZW/Hyty/+Z2KTqfTFLEiBP5+Cwx7j5pf+vAkn0eK95nIWQ4CxAKcaUz
X-Gm-Gg: ASbGnct/rIpOuM5MrjFbIj+lfrhRSXvKcHXZ4199qy8Rwa2j9OcMTXQ8OM3acz3OdcL
	ztwsa0AZRanuqWM/HFVaki5mY2IieaK10S9A1LG0TWaK9zMjodE01o/1eGDwprZRksxy7Ou9Dsb
	FLd3YGZeK5/WTnYyOjW1Z8eLC7D3OTWSDqYKN+rYlhtbzc3mBl871wVtQivvFy4RbE4n5BSzCfv
	uhvo3zQMTdvW0PCLsaNkI+fi1VwtUl4tbKv/sLg1fiKNiqplEty1GOdkwverO4B7dgZIfAQ8naF
	8QlCt4jbfZooD7ej/wiXT6tbl717an1EQ4fMjWYsczTBRKqENqYI/B2TUnpojXONpgLuNZr1TpJ
	npPrW7Owv/jbf1kkwaTBTCQ+IJvBiCDNUGesLkT2DrQRphhg5nhcffxOGeohI388L1CFE1q0FiC
	4TJrtHEvQ5p5m3RhZjGXXq8exAPLWzzAXmovQnE3UH4MsDJG+7HZZ1R0Izo8bNZFHZ717ad79Vu
	a5q
X-Google-Smtp-Source: AGHT+IGRMO0+uXb+9bEpObzvqQ1QPiBVkboxtB5QyUEvN9V9cCaQss0sxRkV4fybY3xfZkzAMDv/Ig==
X-Received: by 2002:a17:902:cf0f:b0:295:4d50:aaab with SMTP id d9443c01a7336-29df55773abmr69134145ad.20.1765235710869;
        Mon, 08 Dec 2025 15:15:10 -0800 (PST)
Received: from localhost (p4783053-ipxg23301hodogaya.kanagawa.ocn.ne.jp. [153.209.99.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf9asm133451275ad.83.2025.12.08.15.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 15:15:10 -0800 (PST)
Date: Tue, 09 Dec 2025 08:14:56 +0900 (JST)
Message-Id: <20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
To: acourbot@nvidia.com, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
	<20251117001035.4068507-4-fujita.tomonori@gmail.com>
	<DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 08 Dec 2025 12:08:23 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
>> Add atomic operation support for i8 and i16 types using volatile
>> read/write and smp_load_acquire/smp_store_release helpers.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
>>  rust/kernel/sync/atomic/predefine.rs | 14 +++++++-
>>  2 files changed, 61 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
>> index 6fdd8e59f45b..4c9f4f76dbdf 100644
>> --- a/rust/kernel/sync/atomic/internal.rs
>> +++ b/rust/kernel/sync/atomic/internal.rs
>> @@ -263,3 +263,51 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
>>          }
>>      }
>>  );
>> +
>> +impl private::Sealed for i8 {}
>> +impl private::Sealed for i16 {}
>> +
>> +impl AtomicImpl for i8 {
>> +    type Delta = Self;
>> +}
>> +
>> +impl AtomicImpl for i16 {
>> +    type Delta = Self;
>> +}
> 
> I'd suggest putting these next to the impls for `i32` and `i64`, for clarity.

I'm fine with either. Boqun, what do you think?

The reason I didn't put i8/i16 next to i32/i64 is that I assume that
i8/i16 won't support all the methods supported by i32/i64. I thought
keeping them separate would make that distinction clearer.

>> +macro_rules! impl_atomic_only_load_and_store_ops {
>> +    ($($ty:ty),* $(,)?) => {
>> +        $(
>> +            impl AtomicBasicOps for $ty {
>> +                paste! {
>> +                    #[inline(always)]
>> +                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
>> +                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
>> +                        unsafe { bindings::[< atomic_ $ty _load >](a.as_ptr().cast()) }
>> +                    }
>> +
>> +                    #[inline(always)]
>> +                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self {
>> +                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
>> +                        unsafe { bindings::[< atomic_ $ty _load_acquire >](a.as_ptr().cast()) }
>> +                    }
>> +
>> +                    // Generate atomic_set and atomic_set_release
>> +                    #[inline(always)]
>> +                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
>> +                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
>> +                        unsafe { bindings::[< atomic_ $ty _store >](a.as_ptr().cast(), v) }
>> +                    }
>> +
>> +                    #[inline(always)]
>> +                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Self) {
>> +                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
>> +                        unsafe { bindings::[< atomic_ $ty _store_release >](a.as_ptr().cast(), v) }
>> +                    }
>> +                }
>> +            }
>> +        )*
>> +    };
>> +}
> 
> Can you document this macro a bit, in particular the motivations for not
> leveraging the existing ones (I guess this has to be with the new
> helpers, but following the code through is a bit difficult without
> comments).

// Since i8 and i16 are not expected to support the full feature set
// of i32 and i64, using the current declare_and_impl_atomic_methods!
// would require refactoring it to handle specific types or splitting
// the definitions. Furthermore, supporting Atomic<bool> will require
// even more significant structural changes.
//
// To avoid premature refactoring, a separate macro for i8 and i16 is
// used for now, leaving the existing macros untouched until the overall
// design requirements are settled.

makes sense?
