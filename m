Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5EF86338
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 06:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753599137; cv=none; b=KTNSniMx63xvc8uap756CdunimrUl2Ry1Pr1m7eBC3IRDzhDGVJsPj8UUUCiMggcqYrz2EKxly7aayPqPZ5XwUh674gY0FCechrO01riRnFZlB7JwFcnyOmQvq4op1P0WAanHnE/wLRk4uGVz3H/BaCgtOlanZTJkhgDs/Cb9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753599137; c=relaxed/simple;
	bh=9PpkV4enf5TEkS23PH/SR14tNUZPKHoOap+G+AMjY34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K08mtidSt8JbOF72Dbq8c02lt2TBeSOZz2RuMcqUI2JsmT06HtTon3w2ZNtERyrsY6tm7wLBn/ux1AfPUCasQr7rMNMuvB3RJT2JjlciIJuK7Z2fJUvbpng1YodvALe7fhW0huvdtQMcRTAHf6O9ODXGe4zkRaJq2ue8NisHoJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IS75fva5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IS75fva5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1917803f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 23:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753599134; x=1754203934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHxzh6y8MXrb6J9PTI49jeC2fj1UoRizV4OaU4qLR0w=;
        b=IS75fva5pJ9zY1jF766/xsKpDpimm76zMHVfNEE30oqRzPmYKkfTy9PQo271fyQfr+
         WCgZaoDpdVsnMcf4TyPF9vYhaZWPcWtoXTaRAvDlSO53kvuAZ/snOjCVwYypK9gochwy
         vr1VEcT1OWBNGONyRJjYDvu2rGF7u6LBZQY8W0Ax/AlVqSwMUSEfp54WVXLxSrHn4tN5
         1sFfvk0o+nFMPyHMKeP5M4BaXMOLVOBPWMyawru1hnKNw8j0wguGQRO0ZGQ0BpOp25Iz
         2Pg65/PTXeBAeQ35KETxV3lQfb0ZOAng8y/rP8hQsJ5BnDtQLEmEXFEHiCIWQn/9cY9M
         YWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753599134; x=1754203934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHxzh6y8MXrb6J9PTI49jeC2fj1UoRizV4OaU4qLR0w=;
        b=kKNy01r4w2spwRZMasmvONWtGlJoJOWddPeuxv/tK0s132dt7gfyqZNZmVelm4nxnt
         LpQ7Sctdr2oXUbGZpOc87CCi0YPli4jsY+6uAUpJ3TRLQDdQT9pSxOSQ7uwB4IZs3Xc3
         x7so+oygjvj3bNlmxLVf2ji6MCkLHgUS+2nVKmscezoYRU7cBFrcre3uGu/so+spnxVE
         Rn6eCvyZp9YTkbrer+jzcbxmFE4F0SKxeWO1weTrt218IIvOcVFS/t570G2/MEW1Co3d
         Hp11HHC3/J39Pt279TLkENH/cxGKWV+CKAXJo07JXTuWm1RtvRW9VRpPe9szrVbY+sWe
         pGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV4/2IY5cXxG6M6wmt9wfw/XHAimVW/Jv5V3/bR9gVe4m45d/nOa6yyFcOxqhm7tzWNEAyijB00NlZoArqKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qmECMc8YZgE0uXSdbR9v+/PzYASgrDz9xlVIgJbF/71Rb6fy
	V1ooNTygsou8g+3ZJuz+VD4VRHGpIHzgmSVkC5Qd0gCO4hfRxxlNRZjwdLjaqc3s3441QPKYQMy
	flbq0hMWi4EaSFpa/i6Ct3mismr2V+VPDSpfM9kDm
X-Gm-Gg: ASbGncvwD685wmflLctj3gJRWv3aOK9uYVAuFoRcS2dxyWgHsqHAsiHfsUh6nbILzZF
	1ocASpA8DJYK3DOBknzUaKOlMqQEI8tkyJyl1RqjDFyrXu9pitO4NsfI9wGXRwoi3otHl6hh9ZD
	OLJnxw6sN3oGmyg7NpcdV8MhAw372FBOHC86Qo9wf6EGzBJpda52am+moAZ/VfxoonLLYple8zl
	VnZuYDD
X-Google-Smtp-Source: AGHT+IFzA3zIZL6grZHKyniaHmoKbqlVArhdIEEhaN9YkdDqsWFdOmboHL4q+RLBLQqCi398VjsEH/yX9hwu6iDbSdw=
X-Received: by 2002:a05:6000:40db:b0:3b7:79a5:3e53 with SMTP id
 ffacd0b85a97d-3b779a53ee3mr3062052f8f.45.1753599133715; Sat, 26 Jul 2025
 23:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-as_bytes-v3-1-eb7514faab28@nvidia.com>
In-Reply-To: <20250726-as_bytes-v3-1-eb7514faab28@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 27 Jul 2025 08:52:00 +0200
X-Gm-Features: Ac12FXzxAKuUJXT8WArPLUiJwTxk1R_0MtQGsAdqJVkVvCI7zkWTYx6de61yRlY
Message-ID: <CAH5fLghNDDo0HKupPXe8G6z2TP4TJE881Bd76k0LDjSm75KcEQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: transmute: add `as_bytes` method for `AsBytes` trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Christian S. Lima" <christiansantoslima21@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 4:47=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Every type that implements `AsBytes` should be able to provide its byte
> representation. Introduce the `as_bytes` method that returns the
> implementer as a stream of bytes, and provide a default implementation
> that should be suitable for any type that satisfies `AsBytes`'s safety
> requirements.
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> This is the sister patch of [1], providing an `as_bytes` method for
> `AsBytes`.
>
> It is going to be used in Nova, but should also be universally useful -
> if anything, it felt a bit strange that `AsBytes` did not provide this
> method so far.
>
> [1] https://lore.kernel.org/rust-for-linux/20250624042802.105623-1-christ=
iansantoslima21@gmail.com/
> ---
> Changes in v3:
> - Use `ptr::from_ref` instead of `as *const T`.
> - Link to v2: https://lore.kernel.org/r/20250725-as_bytes-v2-1-c6584c211a=
6c@nvidia.com
>
> Changes in v2:
> - Use `size_of_val` to provide a default implementation for both `Sized`
>   and non-`Sized` types, and remove `AsBytesSized`. (thanks Alice!)
> - Link to v1: https://lore.kernel.org/r/20250725-as_bytes-v1-1-6f06a3744f=
69@nvidia.com
> ---
>  rust/kernel/transmute.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 1c7d43771a37b90150de86699f114a2ffb84db91..69c46c19a89191d8a2abc5801=
564cacda232218c 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -47,7 +47,16 @@ macro_rules! impl_frombytes {
>  ///
>  /// Values of this type may not contain any uninitialized bytes. This ty=
pe must not have interior
>  /// mutability.
> -pub unsafe trait AsBytes {}
> +pub unsafe trait AsBytes {
> +    /// Returns `self` as a slice of bytes.
> +    fn as_bytes(&self) -> &[u8] {
> +        let data =3D core::ptr::from_ref(self).cast::<u8>();
> +        let len =3D size_of_val(self);
> +
> +        // SAFETY: `data` is non-null and valid for `len * sizeof::<u8>(=
)` bytes.
> +        unsafe { core::slice::from_raw_parts(data, len) }
> +    }
> +}

Let's also have an as_bytes_mut() method. I would require the type to
also implement FromBytes as it lets you replace the value with another
set of bytes.

Alice
