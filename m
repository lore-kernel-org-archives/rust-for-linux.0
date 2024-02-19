Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58328DA5
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708336164; cv=none; b=PB/us8apgHUaHiFWN4cIiBE5e0V1ge9uh/w6Agd4uC2irZv3GVjeIY/TmEOBYecSHVCUFj+ctdN2HJHfIc6djhIzROXgSvOYbB5qKxeDxF0AZ5EHnigO/QQNDov/Ro6ac3KZ+/7C7wFI5lEVuvJaPClBlPzptYCRAJffTsn6DWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708336164; c=relaxed/simple;
	bh=gtpYXxYGtM3e4fPuwEbZjCqaPmvLn/0mX4/8vL7z5Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp8Vo3yzyQmDqqU5mQXGHjxAQqSpCXUkgk6YBCw2gu6h/DJbMpJ+JizE+QqQxYp+9DTkVBoLWRgUEuDUsO8iozLLE1CPdfYBFuXKP4gmYdpaGQ6Xw+BtmrcLwAxeTrKsl09q3FKJR6hrEAf1+HM6Ze87hooDGAJcp4wrIHe+YXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r9uSwYIw; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r9uSwYIw"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d2e1a0337bso1825489241.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 01:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708336161; x=1708940961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+FOFFBAWMEtOMQ6LqezGtzdtmDgRLcs4ZYc/A6Yaig=;
        b=r9uSwYIw9u5CoxZQ9do78Muwm301yC4BMZmJB2vg1z79zXll+XiARgcbfUIaySrNty
         JRTlwWCXXHoe5OOWdRHm8Y+ZS6kU+62LPNujKEJo9pg0R/k7B+K1KMX3l/Xjz+1lsNTr
         1YYZWau0ocKQBTiUOQB3m2EhqGSI9DAjw3yaLeYzvVHAwaXy+ZuXVyUc680qAlGFQNlo
         rBLqSZ7qlMW6covLbeTXTdXv4hxFrtlRkokE4GWhSogZw8jv/9Xb9AkNtKS6nwmPd0V7
         iFDvOiy7VZmlUjZkE3x4LfB4rFMq9GtGBOYZDQqG1ZbIZVLajggiZdSmRV+khUe6hP1S
         oEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708336161; x=1708940961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+FOFFBAWMEtOMQ6LqezGtzdtmDgRLcs4ZYc/A6Yaig=;
        b=VDRieQpDI3rK4xyqf3+XilF251P148Pg1hSrwRw33gvztPrTDNjAmGaKMdsJvjRcso
         q460DMttPGViEdDDv1r7Dpc/jUJuBXskyInM+lwtcoNUg4uYMXs3iZOwyj+M7FX1XNKE
         9DHAfx2kYjYzvT4tOY/ompCcCgMeakuR/V3umQA71VJSntPDpBChdXBFLBbBMijxEl54
         PJXKUE9ktpYIOLPZOz0J3L7iOCmcX+cxii44J6gJ76Jftva7yECmG9I17jRUAuZb4MHZ
         9nK7q2b+zsn5O6MdHBuHLfa74hVkO40mbty1N5zb1nH4CKhM9fOk4aO/hpXcmKeEdtou
         6djg==
X-Forwarded-Encrypted: i=1; AJvYcCVebbuGX1fWf6Ey3/JmNvbAOCgI2EWYc4MQXWHPlLBXTvv1mUuoDSKxIyWCFrHh6NUtw9MSkw2pP8IeH0CCTJcHtSnXk+AIXiNbLfE4tXA=
X-Gm-Message-State: AOJu0YwKElMJhEpZFGCjOsk+YAUrYi/f1SlWabiAwI7eRIZKgaYxbu9D
	5mPpL3TSfm6z5vPfJJPEGjOYH+UBnMc5vTwJBEWam4AWwy+vfiHDTGxQ1yd8G/4LVz3hCb4WdGw
	f3qPoIXp/6eFToN6F7CIuQ7fcX3XyMNyWuZYq
X-Google-Smtp-Source: AGHT+IFrGjSg+GmBWhmAdppzRgzRK24Pn9sh/5Zatx01tjvIOPBFfAIj1k5LmOZJ+QFObQ143B5uQ0GDBHsO39WyBd0=
X-Received: by 2002:a67:ce06:0:b0:470:50ff:d9a5 with SMTP id
 s6-20020a67ce06000000b0047050ffd9a5mr1635765vsl.22.1708336161189; Mon, 19 Feb
 2024 01:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217153315.56128-1-mcanal@igalia.com>
In-Reply-To: <20240217153315.56128-1-mcanal@igalia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Feb 2024 10:49:10 +0100
Message-ID: <CAH5fLggPRcPc-5C8JY5FR7jQMbdNoc89EU0_QAqhG=6HiySZ=w@mail.gmail.com>
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Gilbride <mattgilbride@google.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	kernel-dev@igalia.com, =?UTF-8?Q?L=C3=A9o_Lanteri_Thauvin?= <leseulartichaut@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 4:33=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> Add Rust counterparts to these C macros. `container_of` is useful for C
> struct subtyping, to recover the original pointer to the container
> structure. `offset_of` is useful for struct-relative addressing.
>
> Co-authored-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-authored:by: L=C3=A9o Lanteri Thauvin <leseulartichaut@gmail.com>
> Signed-off-by: L=C3=A9o Lanteri Thauvin <leseulartichaut@gmail.com>
> Co-authored-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>
> Hi,
>
> `container_of` is a essential macro to build any sort of driver in the
> Linux Kernel. Therefore, we need a good and reliable implementation of
> this macro for the Rust abstractions.
>
> Although I checked the version sent by Matt [1], I don't really like the
> fact that such an essential part of the foundation of any driver would
> be an unsafe macro. Therefore, I propose this alternative to Matt's
> implementation, which is Lina's implementation that it is actually safe.

Well, the addr_of macro in the standard library, which performs the
opposite operation is also unsafe. So I don't think that having it be
unsafe is that unreasonable.

> `container_of` is a dependency for the rustgem driver and this is part
> of my current efforts to upstream the driver.
>
> [1] https://lore.kernel.org/rust-for-linux/20240205-b4-rbtree-v1-1-995e3e=
ee38c0@google.com/
>
> Best Regards,
> - Ma=C3=ADra
>
>  rust/kernel/lib.rs | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 5a8594d2f5db..7ae89c676800 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -103,3 +103,72 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>      // SAFETY: FFI call.
>      unsafe { bindings::BUG() };
>  }
> +
> +/// Calculates the offset of a field from the beginning of the struct it=
 belongs to.
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// use kernel::prelude::*;
> +/// use kernel::offset_of;
> +/// struct Test {
> +///     a: u64,
> +///     b: u32,
> +/// }
> +///
> +/// assert_eq!(offset_of!(Test, b), 8);
> +/// ```
> +#[macro_export]
> +macro_rules! offset_of {
> +    ($type:ty, $($f:tt)*) =3D> {{
> +        let tmp =3D core::mem::MaybeUninit::<$type>::uninit();
> +        let outer =3D tmp.as_ptr();
> +        // To avoid warnings when nesting `unsafe` blocks.
> +        #[allow(unused_unsafe)]
> +        // SAFETY: The pointer is valid and aligned, just not initialise=
d; `addr_of` ensures that
> +        // we don't actually read from `outer` (which would be UB) nor c=
reate an intermediate
> +        // reference.
> +        let inner =3D unsafe { core::ptr::addr_of!((*outer).$($f)*) } as=
 *const u8;
> +        // To avoid warnings when nesting `unsafe` blocks.
> +        #[allow(unused_unsafe)]
> +        // SAFETY: The two pointers are within the same allocation block=
.
> +        unsafe { inner.offset_from(outer as *const u8) }
> +    }}
> +}

The offset_of macro is already available through the standard library.
You do not need to add it here.

> +/// Produces a pointer to an object from a pointer to one of its fields.
> +///
> +/// # Safety
> +///
> +/// Callers must ensure that the pointer to the field is in fact a point=
er to the specified field,
> +/// as opposed to a pointer to another object of the same type. If this =
condition is not met,
> +/// any dereference of the resulting pointer is UB.
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// use kernel::container_of;
> +/// struct Test {
> +///     a: u64,
> +///     b: u32,
> +/// }
> +///
> +/// let test =3D Test { a: 10, b: 20 };
> +/// let b_ptr =3D &test.b;
> +/// let test_alias =3D container_of!(b_ptr, Test, b);
> +/// assert!(core::ptr::eq(&test, test_alias));
> +/// ```
> +#[macro_export]
> +macro_rules! container_of {
> +    ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> +        let ptr =3D $ptr as *const _ as *const u8;
> +        let offset =3D $crate::offset_of!($type, $($f)*);
> +        let outer =3D ptr.wrapping_offset(-offset) as *const $type;
> +        // SAFETY: The pointer is valid and aligned, just not initialise=
d; `addr_of` ensures that
> +        // we don't actually read from `outer` (which would be UB) nor c=
reate an intermediate
> +        // reference. The two pointers are within the same allocation bl=
ock.
> +        let inner =3D unsafe { core::ptr::addr_of!((*outer).$($f)*) };

If your macro is not unsafe, then this line is incorrect. I could call
`container_of!` with some random dangling pointer, and then it would
use addr_of! on that pointer, which is not okay because addr_of
assumes that the pointer is in-bounds of an allocation both before and
after the offset operation.

Alice
