Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D03238171
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766993673; cv=none; b=EsFKVL7HaUvzNmOngUiUM52F9NSyhqCUhQCRxSelKT48us1OhesPJzhdiXYu3u/IdeN18j3RnM4FVkNXDufXVeXLCPP0PKvyo103/4Ahi/ZxHJm42ygHegYpgoGoFuj2H1mgIw24bCkI97s4a1gCMveQF/Btxp9G02jNJ2Y8vB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766993673; c=relaxed/simple;
	bh=IX353M5a4xfMbhGZICv5YbNyFgrjYeNXaNEWbUJFedQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JE5X1DoWEuHP5SpMQM/bWZYrIMknNAZtuqm3pLl3jYqadQLzRW7jrKC+pHZOCMMdpm+JYV1blBwDxnR5VMt8svtBggiZB+GIP+AiOlVOsBW8BBH5Y84XjcBM4XYRa87HfwOZTE3FioAo6m1nYFhEebEDDgEfTWdU+FHw+Ozryew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYkNncDI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYkNncDI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a1388cdac3so82463995ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766993667; x=1767598467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGeZTK6rslNSwgEZnXUnSUvszvuKUpwVDQazbF2Bzw4=;
        b=DYkNncDIg01kDkh+G4heXHVQF4ZJoEBp0LfRHlvh0tKUdV51Qz6AgwBLlhvVowR3Fo
         E2CIqy2w+D8tHyHxeCFPvnBEJdwtv5kPkgY+c/DniG87nJzv1qaN59J6L55jWllsfcSh
         lSHHQtznlNKVnioa66GL7T5tFBcDsjSaVx6hOgS1HFmH9Ud/uY0+6vyjr35n7w6vWF2J
         zQxgNJ/7U1Jdf0IxbiFhKGCyRYNv9WvvYHnsvPxt+zp2YTF9lOlqwODr+u+WJButbgdt
         pcJG4O5NzcdYnHq88njMcu9w7fc0RRnrhBKi0My/l5VqmHNIA0cjQA2z4pSNOMJ6kbfZ
         iyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766993667; x=1767598467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGeZTK6rslNSwgEZnXUnSUvszvuKUpwVDQazbF2Bzw4=;
        b=KYXQFCfMNO24C+jrbtRQVWy6mI5hufM8DmcxZq34v3AZg4MeuMo6G0UM56kc7V4cnD
         4jSuaySWYD1Mhywbm9wkSdRs4PUmlFfoXEsfWZnW2iJiL3XcyGyEiWyDa8yk6P2Sm0Dg
         l2KAUK20ei8gbGj/7lrlWLzr5PlREI8uYGfkgNUJI6jwaHKo76J1G/XzRg8HGVzdJ9+i
         WWfgLcxRnarJQgUB7wqt30AOQJ9swF1ZWXD9kU6HeFUOjQ7KNhktg4tOH/1N0/z1FJGD
         c5tYPTak2uMllh/j3y2ay+mB00VsHSIpUBQRPgJFZmlXPRAQiHeNuA26oZcTEnwbRMo4
         Q9ig==
X-Forwarded-Encrypted: i=1; AJvYcCVRgAUBxEfTmUvPa3nkzse2SCxfcMpM95+W29un8amNpd7Ahos2eL4ek5Lfaef2PhgGqKYtYrBk6aPhyZwSGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzV0P0kL9W00en8HUxQ6ThDM6W+9CGTkSNc7ACNfSCafnLOwfB
	XHSZQsmW0wFJlEDMVCC9iOuZmmGqMalch6gFoB6qQnsSJDvybs0UjzlT
X-Gm-Gg: AY/fxX4oipAHvCEJDbvTFP8Jl/kibccfgHLjRMpOPbfbJjRr3q1wZsZCI/i/rlLkUgt
	BBTQd5iY7eDRp1/UYKeff1YH0nGz9rArZ0eR6l/v7eyPoR77wKPWSJARz28F1kjSOR2BFLPWnZK
	0CQsoUU/CK7VG0GI/pdruoJg0CyZYK9WorgIIYi5/hJRRmZFkYQoYp/twZiUpy9sLtK8n22oUUq
	dvis6Di1u3K4mL033KjaPX49bCTSrw7EPoqxVSFohLL20RJZK3lHifcuK0Yhfb6kZ/z/4SaikQO
	9/J3f3OvQ+LMM75Yw9SSR8X0Kmmm3qyHPVcaT2p7YyL+AY1eSXtTifhrp7lz3uziCPPhAOw9Vii
	v+IN3GAFN6utx+ejaePkZ1lshh9DWppC8tkxTWRvK9/6HPrmBpmMiKpUroo92Z6QqVaIBiEq92A
	HIQUFvoQW/L+Cyt1EtPqLDJUkWBc3auDO0sqnkj4FyGANcB+I=
X-Google-Smtp-Source: AGHT+IGopB9MIMetvzkpgoMB27AzP9u3Ss8dKVxYRaBdPR3A4XRnILJDgX/nztedz7idSjI8mwlc9w==
X-Received: by 2002:a17:903:2a8e:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-2a2f2426c79mr299745415ad.14.1766993667240;
        Sun, 28 Dec 2025 23:34:27 -0800 (PST)
Received: from [10.0.10.3] (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a9asm267230995ad.30.2025.12.28.23.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 23:34:26 -0800 (PST)
Message-ID: <97efae81-bde6-4ebe-a650-495676716248@gmail.com>
Date: Mon, 29 Dec 2025 15:34:19 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Dirk Behme <dirk.behme@gmail.com>, Ke Sun <sunke@kylinos.cn>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org
References: <20251227033958.3713232-1-sunke@kylinos.cn>
 <20251227033958.3713232-3-sunke@kylinos.cn>
 <faeb6601-de91-4c40-af33-9f081d2b7f6a@gmail.com>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <faeb6601-de91-4c40-af33-9f081d2b7f6a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/29/25 14:44, Dirk Behme wrote:
> On 27.12.25 04:39, Ke Sun wrote:
>> Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) to
>> rust/kernel/ptr.rs that correspond to C kernel's printk format specifiers
>> %p, %pK, and %px. These types provide type-safe pointer formatting that
>> matches C kernel patterns.
>>
>> These wrapper types implement core::fmt::Pointer and delegate to the
>> corresponding kernel formatting functions, enabling safe pointer
>> formatting in Rust code that prevents information leaks about kernel
>> memory layout.
>>
>> Users can explicitly use these types:
>>      pr_info!("{:p}\n", HashedPtr::from(ptr));
>>      pr_info!("{:p}\n", RestrictedPtr::from(ptr));
>>      pr_info!("{:p}\n", RawPtr::from(ptr));
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/helpers/fmt.c     |  65 +++++++++++
>>   rust/helpers/helpers.c |   3 +-
>>   rust/kernel/ptr.rs     | 241 ++++++++++++++++++++++++++++++++++++++++-
>>   3 files changed, 305 insertions(+), 4 deletions(-)
>>   create mode 100644 rust/helpers/fmt.c
>>
> ....
>> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
>> index e3893ed04049d..8b58221c2ec4b 100644
>> --- a/rust/kernel/ptr.rs
>> +++ b/rust/kernel/ptr.rs
> ....
>> +/// A pointer that will be hashed when printed (corresponds to `%p`).
>> +///
>> +/// This is the default behavior for kernel pointers - they are hashed to prevent
>> +/// leaking information about the kernel memory layout.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     ptr::HashedPtr,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = HashedPtr::from(0x12345678 as *const u8);
>> +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, Debug)]
>
> I wonder if the `Debug` could be used to expose the raw pointer where
> it shouldn't?

You're right. If we implement Debug for these pointer wrapper types, 
using {:?} would expose the

raw pointer address.

> Dirk
>
>
>> +pub struct HashedPtr(*const c_void);
>> +
>> +impl fmt::Pointer for HashedPtr {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        // Handle NULL pointers - print them directly
>> +        if self.0.is_null() {
>> +            return Pointer::fmt(&self.0, f);
>> +        }
>> +
>> +        format_hashed_ptr(self.0, f)
>> +    }
>> +}
>> +
>> +/// A pointer that will be restricted based on `kptr_restrict` when printed (corresponds to `%pK`).
>> +///
>> +/// This is intended for use in procfs/sysfs files that are read by userspace.
>> +/// The behavior depends on the `kptr_restrict` sysctl setting.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     ptr::RestrictedPtr,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
>> +/// pr_info!("Restricted pointer: {:016p}\n", ptr);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, Debug)]
>> +pub struct RestrictedPtr(*const c_void);
>> +
>> +impl fmt::Pointer for RestrictedPtr {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        // Handle NULL pointers
>> +        if self.0.is_null() {
>> +            return Pointer::fmt(&self.0, f);
>> +        }
>> +
>> +        // Use kptr_restrict_value to handle all kptr_restrict cases.
>> +        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
>> +        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
>> +        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
>> +        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
>> +        let restricted_ptr = unsafe { bindings::kptr_restrict_value(self.0) };
>> +
>> +        if restricted_ptr.is_null() {
>> +            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
>> +            return Pointer::fmt(&core::ptr::null::<c_void>(), f);
>> +        }
>> +
>> +        // restricted_ptr is non-null, meaning we should print something.
>> +        // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
>> +        let restrict = unsafe { bindings::kptr_restrict };
>> +
>> +        if restrict == 0 {
>> +            // kptr_restrict == 0: hash the pointer (same as %p)
>> +            format_hashed_ptr(self.0, f)
>> +        } else {
>> +            // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
>> +            // This matches C behavior: pointer_string() prints the raw address
>> +            Pointer::fmt(&restricted_ptr, f)
>> +        }
>> +    }
>> +}
>> +
>> +/// A pointer that will be printed as its raw address (corresponds to `%px`).
>> +///
>> +/// **Warning**: This exposes the real kernel address and should only be used
>> +/// for debugging purposes. Consider using [`HashedPtr`] or [`RestrictedPtr`] instead.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     ptr::RawPtr,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = RawPtr::from(0x12345678 as *const u8);
>> +///
>> +/// // Basic formatting
>> +/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
>> +/// let formatted = cstr.to_str()?;
>> +/// assert_eq!(formatted, "0x12345678");
>> +///
>> +/// // Right align with zero padding, width 30
>> +/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
>> +/// let right_zero = cstr.to_str()?;
>> +/// assert_eq!(right_zero, "000000000000000000000x12345678");
>> +///
>> +/// // Left align with zero padding, width 30
>> +/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
>> +/// let left_zero = cstr.to_str()?;
>> +/// assert_eq!(left_zero, "0x1234567800000000000000000000");
>> +///
>> +/// // Center align with zero padding, width 30
>> +/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
>> +/// let center_zero = cstr.to_str()?;
>> +/// assert_eq!(center_zero, "00000000000x123456780000000000");
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, Debug)]
>> +pub struct RawPtr(*const c_void);
>> +
>> +impl fmt::Pointer for RawPtr {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        // Directly format the raw address - no hashing or restriction.
>> +        // This corresponds to %px behavior.
>> +        Pointer::fmt(&self.0, f)
>> +    }
>> +}
>> +
>> +// Implement common methods for all pointer wrapper types
>> +impl_ptr_wrapper!(
>> +    HashedPtr,
>> +    RawPtr,
>> +    RestrictedPtr, //
>> +);
