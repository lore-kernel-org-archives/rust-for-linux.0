Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D383A1E8A
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 06:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990707; cv=none; b=Zjc56eqb6OMcevdSLcHXozul9k8r4axD1FfFz4qTHRjpVCqAvYPVNhUno7LvxO9/Gczr5zu+vNdHFGYxmYEY6z7ZU80izBODfQLG6f2MMfSig01iSG/SVw0zHwAwARTgnSwi4Ar33Y3hwNz3kzhrygR4vP2f1MfD/rMv2urqOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990707; c=relaxed/simple;
	bh=OU/4/6jK8JjPw2PZ2AdxJNCg3I92yzv1WCmuQEEO32A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCKlD7PaIa2TrkRJzim5LGtH6j2a76i9nbEcvi8YDAoQ64VT4BrR7rZjuRQZ0OGbs0osLGuXcHsQAH+QmHZBPZhxE8MeWYJWrQ12ac+AxF11vFUqIgzv8wdtrEM7BW5HYfzPEQ+TOX61Y/OMYMl+7NuEDeQ6IZfJLJHk7p2E36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyXJMZa6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyXJMZa6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so9731154a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 22:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766990698; x=1767595498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEB4quEKwp7b1uX1Hk+prNvgmvN7ghEoP/jjgLd9wFg=;
        b=OyXJMZa6fv025f7noWMNQF9xWjRAI04eKagvcD/AevllLYnXKCCx1jVicqVZM5b1oj
         PbRcS1qmRqcosbFVsfolKnfHKc7FKED2mCSsaolk+9djcyEr664zFrHx9GAWODX2xys5
         wj2kTyMRlvA+toeD4q6f6bPgTHVNEY9kSg74NO9spgiBbvxns75swaBnU0C0bS3vKtoc
         QGjjtr7UKd2p38YWd4jST0D6ntvOTynksvLsMZzKxKnhbXoL4fVPjpVPF/FvGDR8w+h7
         25aZUjT7AEfPinGo+4lW7foaC0hCuphmu/C1avHJ/luBN25SIJuFx3gZwHo0MMRbe1Y0
         lHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766990698; x=1767595498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEB4quEKwp7b1uX1Hk+prNvgmvN7ghEoP/jjgLd9wFg=;
        b=jE/ij9BDcb1tV0njH0QUAgCMyb5/Fvg0B9eDZPaIaUkdAqItwfXXOVVEA2ZO+WlK32
         3U8rseG/nCA3U/jQayCmrMSICpw1fOW10kKUZxWdyEzFIsvzSzJW4fYzjII3Dxg66v61
         mY15F2s0+6k9HdpyR7hRlJvqtc18tP6BC/O38g+Pha2Vl2s8KbSKW9YH3V8mpmqaORWD
         d2VWE5bhhyjk2hl3bnkFuEkiKhxyDPYmjizyG5678sDwWuY5ZzLqwsAnZ0WSWw7uqY5J
         EMfpccyS7q3rNzCHFslqI/CtruMlYKz7NixJDJsVLbfWDk1j3pzAq/D4YvZIX8axjgz8
         Nr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKv26WlOb5aUd4yww1i4WqFSlLU28dDqPN+Kkyp76fIJeU+3jCA+pgMKMOg0gfVRv8I9l4QpfLqumQgQdnYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkKBiSxpB6y00JDI9r05YbQ7bCMZeUiA2vuQUySbyjSQ1yCjJ
	R1K0gsQl/9tBMqkawn8FOiVOobkoUpSMxmbh7Ok9N47unqORgAlYDObX
X-Gm-Gg: AY/fxX5l4eSapeKXNt7mPQ8bC4nZug0QfuPTV2HBQyCJ6RER+0fmnCqRJkG0n0jJVMh
	+7VlV67SEXP7J7U519siJb+xJkZZjYk8MM2b2654mBcFEa7zv/78CnjhvR68hIYreicZuubsy62
	b6IGvPbWRoljataMyv4wy7BAeXC/c2++Ip/59iJl1sGeBjUTQUwsjmDrUuwvYLZ5Dm8EHQ4hOwI
	ixQoVSq22beDIzkHIf8OvqaKViUeT2zT3Uf9KkvtimQqnMcYf7AlLjuMMi9M4v2vb/QlV+s4/Ho
	KJ9ogFiJi6Y9sMdBh02Tcb+6eeMM4DKmFMmc4xbdrRHltwOXeAydypXNF7RxZl30FDWBhIqXwZ6
	ENj4bklYQgpGmpGSbo2+hy6trIibN35o+/gaSxUJrdSQu+zFG0NqpYbJch4haW1UOCoQcVIBS5o
	4PUEEq4qGqbhebqRfVSXuNjmJM7b3tgOmqrI5Yy9dbIMmRKpaTP+ZjTeun5/XJhSVXxSEuRTPwh
	u7w3dRzTRdkFst+yL/7sHJfJdFcPREQzww25O1OH38K9w==
X-Google-Smtp-Source: AGHT+IFPqrXb4N91KoAh/LKUQwLUXLMJffcVevS18VnYy9zikjrt871Z1cAj600KD/vOPfsvVqlp6g==
X-Received: by 2002:a17:907:2d0d:b0:b76:d4fb:c30b with SMTP id a640c23a62f3a-b80357b9911mr3423035266b.27.1766990698183;
        Sun, 28 Dec 2025 22:44:58 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:65c7:1f11:be99:4653? (p200300dfbf2de30065c71f11be994653.dip0.t-ipconnect.de. [2003:df:bf2d:e300:65c7:1f11:be99:4653])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60574sm3307735966b.2.2025.12.28.22.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 22:44:57 -0800 (PST)
Message-ID: <faeb6601-de91-4c40-af33-9f081d2b7f6a@gmail.com>
Date: Mon, 29 Dec 2025 07:44:55 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 Ke Sun <sk.alvin.x@gmail.com>, rust-for-linux@vger.kernel.org
References: <20251227033958.3713232-1-sunke@kylinos.cn>
 <20251227033958.3713232-3-sunke@kylinos.cn>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251227033958.3713232-3-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.12.25 04:39, Ke Sun wrote:
> Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) to
> rust/kernel/ptr.rs that correspond to C kernel's printk format specifiers
> %p, %pK, and %px. These types provide type-safe pointer formatting that
> matches C kernel patterns.
> 
> These wrapper types implement core::fmt::Pointer and delegate to the
> corresponding kernel formatting functions, enabling safe pointer
> formatting in Rust code that prevents information leaks about kernel
> memory layout.
> 
> Users can explicitly use these types:
>     pr_info!("{:p}\n", HashedPtr::from(ptr));
>     pr_info!("{:p}\n", RestrictedPtr::from(ptr));
>     pr_info!("{:p}\n", RawPtr::from(ptr));
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/helpers/fmt.c     |  65 +++++++++++
>  rust/helpers/helpers.c |   3 +-
>  rust/kernel/ptr.rs     | 241 ++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 305 insertions(+), 4 deletions(-)
>  create mode 100644 rust/helpers/fmt.c
> 
....
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index e3893ed04049d..8b58221c2ec4b 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
....
> +/// A pointer that will be hashed when printed (corresponds to `%p`).
> +///
> +/// This is the default behavior for kernel pointers - they are hashed to prevent
> +/// leaking information about the kernel memory layout.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::HashedPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = HashedPtr::from(0x12345678 as *const u8);
> +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 = cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]


I wonder if the `Debug` could be used to expose the raw pointer where
it shouldn't?

Dirk


> +pub struct HashedPtr(*const c_void);
> +
> +impl fmt::Pointer for HashedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers - print them directly
> +        if self.0.is_null() {
> +            return Pointer::fmt(&self.0, f);
> +        }
> +
> +        format_hashed_ptr(self.0, f)
> +    }
> +}
> +
> +/// A pointer that will be restricted based on `kptr_restrict` when printed (corresponds to `%pK`).
> +///
> +/// This is intended for use in procfs/sysfs files that are read by userspace.
> +/// The behavior depends on the `kptr_restrict` sysctl setting.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::RestrictedPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
> +/// pr_info!("Restricted pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 = cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct RestrictedPtr(*const c_void);
> +
> +impl fmt::Pointer for RestrictedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers
> +        if self.0.is_null() {
> +            return Pointer::fmt(&self.0, f);
> +        }
> +
> +        // Use kptr_restrict_value to handle all kptr_restrict cases.
> +        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
> +        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
> +        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
> +        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
> +        let restricted_ptr = unsafe { bindings::kptr_restrict_value(self.0) };
> +
> +        if restricted_ptr.is_null() {
> +            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
> +            return Pointer::fmt(&core::ptr::null::<c_void>(), f);
> +        }
> +
> +        // restricted_ptr is non-null, meaning we should print something.
> +        // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
> +        let restrict = unsafe { bindings::kptr_restrict };
> +
> +        if restrict == 0 {
> +            // kptr_restrict == 0: hash the pointer (same as %p)
> +            format_hashed_ptr(self.0, f)
> +        } else {
> +            // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
> +            // This matches C behavior: pointer_string() prints the raw address
> +            Pointer::fmt(&restricted_ptr, f)
> +        }
> +    }
> +}
> +
> +/// A pointer that will be printed as its raw address (corresponds to `%px`).
> +///
> +/// **Warning**: This exposes the real kernel address and should only be used
> +/// for debugging purposes. Consider using [`HashedPtr`] or [`RestrictedPtr`] instead.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::RawPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = RawPtr::from(0x12345678 as *const u8);
> +///
> +/// // Basic formatting
> +/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +/// let formatted = cstr.to_str()?;
> +/// assert_eq!(formatted, "0x12345678");
> +///
> +/// // Right align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
> +/// let right_zero = cstr.to_str()?;
> +/// assert_eq!(right_zero, "000000000000000000000x12345678");
> +///
> +/// // Left align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
> +/// let left_zero = cstr.to_str()?;
> +/// assert_eq!(left_zero, "0x1234567800000000000000000000");
> +///
> +/// // Center align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
> +/// let center_zero = cstr.to_str()?;
> +/// assert_eq!(center_zero, "00000000000x123456780000000000");
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct RawPtr(*const c_void);
> +
> +impl fmt::Pointer for RawPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        Pointer::fmt(&self.0, f)
> +    }
> +}
> +
> +// Implement common methods for all pointer wrapper types
> +impl_ptr_wrapper!(
> +    HashedPtr,
> +    RawPtr,
> +    RestrictedPtr, //
> +);

