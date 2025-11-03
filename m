Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06134D394
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 00:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762129129; cv=none; b=TiNWleFx39E8052nrnJ50y7CeVvu2kTWfv2sEThY3mO9eFraTglsk2Yykt2nLJNgjDX5AVYlrYy56CcL0QLqx0Z3e/NAp+noP1yYkDzkeTJKl+vl/6cHdDgK+i+icyeaN7Syu3P5EMN2cmaM7gI8J9IWFLAHv8v4RxmsEO+LVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762129129; c=relaxed/simple;
	bh=UhdjQQP93B6vmu1KrkGTVUK12Zh3nn6hyDInXpAyet4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1MOK4ugFCzcza2/UrAHqiOZf2LD/+ywrT/P22Nn4p6tJhjFsRGLiIKtsKm73nGxyKOdM2r2MjfcutuXj6tGMyUE/BirE+qam7e/uYSSMKJAOeG/vIIBX8Ib6SLFvHDTdCcavScKZxlcYZzx8/0w7xd1TKPlgl5LDCHAN4QYgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaDKXJjg; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaDKXJjg"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-43323420387so3271745ab.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 16:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762129127; x=1762733927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbukBbCI6fFMOGWwEkWiHxAZwAf/KbN3KB3I9KpMMx8=;
        b=ZaDKXJjguIVcCgX9HrhTMnV3zSTzHh4UhPQpFgVEy4ReIy3EQtVj7hjLttOk7g2ZDZ
         cn9KNwB7uorN1ktgjYZ8O5p29lXgRk2Ty3Q6ypFyuQ5zFhcVgB/q0cGekT/znLwcbFf+
         Xnk4VOQd0R4d8dozWKgVc2UYAc7NnnBoL4I2zTAb3U1uOiyNoq+Rv7LSzR+rsXEFLzpU
         GDleHsP6XtSIoE0x+H4r5/LD2d9J9gKJJTUNVUoSTKap5JAC75k6iUn1St7WKlCTqcMj
         N9mUUXSYfjLo93Ivzmw2N31Dpdq6yxHHFOuHSi6BKeF/me1HfLbZkKcIxVcYzlyIZChi
         D7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762129127; x=1762733927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbukBbCI6fFMOGWwEkWiHxAZwAf/KbN3KB3I9KpMMx8=;
        b=OqScOIrWCGITt071JAFUaw2I3GOteW9emFFbBuTrT/1HeSLFKee3cQlNuDXZKg+lWV
         EJ3cW/1ChRdvLKD7+4VQ7x21/NU4iDv3m0jgxb/2NUWuTHj0jAoTVp5YwYkKGxIEVi1C
         HNlIP0fpVUOCo7KQJi2mYqZyzNaL1dNMw2kCXmZsvXzf6YBoHEWJUu82xBTeMJvJuzQV
         0CmW5y+1yNowd1a08MJLWBkhY1Ibumpq8l0lpf+O1hsAMhy6JdKPvJ85D99Tbt+e/e4X
         54kbkt1e3qde6ym1HQTlRrLmMXyLbZ24sJra9z68joH+gBWWybhFN7Sx8vjQPj5GkGuq
         yH0g==
X-Forwarded-Encrypted: i=1; AJvYcCVMIjEy1HAt9ySuBnf5+V6KdES86rhiuCuuwb6q/5COT2UWaDUEKJlNi8tkWw9ymE6U6I80VYoVOBhIT6rLAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0c79Fx/3cYNz1Mbvq5SdPFrhFQGTpE+wN1jmF3bfNJqrGaCO
	qL5gUrU/4nWt1+3Ny/BlYNchMNFH3PUJ3uijKVGcITSNV3BHqggQAA6Qy4fjlnk+aH1bv2dQbSx
	hFIw3IWCvzmug/OPXA8GGFUbIAWKc2HE=
X-Gm-Gg: ASbGncsSvdOE6aF7l73wLtL4P/3Qjw11zVYbKweS6DlCcQ20oSg93qZUizlvAAO2Bv0
	n4dWmBoLuBehP0cXzz7Qzz5e2VdYy7m2i1AtnRRkcuJGGCmR47JOf76SRFffN+Miet60Rlu/Fzl
	hdXTwIeNnu2iMWjDr7KRJTvRBLLbbgkrNsFHkhXSowyT/WaSIyWa/kC91oCpBxpZ4uRpzA6jUrH
	20+UpS5sfGbPk5pwqQJDglMICY60rWYDoPhv08O1tCwHltt56kgLhgKIsTC28W8F4+upWIkun38
	QLw=
X-Google-Smtp-Source: AGHT+IEinxxKyGpY13CBZYEiEZRj5ZtrHLcrvHXjjmmISTFYSNVaHSlve6zbB1g6ISy0GNLADF79gcMJCySg/fAhlK4=
X-Received: by 2002:a05:6e02:221e:b0:433:2d0f:e95d with SMTP id
 e9e14a558f8ab-4332d0ff57fmr29075505ab.27.1762129127059; Sun, 02 Nov 2025
 16:18:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com> <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
 <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
 <CANiq72kE89ukxpf3L0_jFOdv51TDtjjj3r=1mjJzdGWJwmAbaQ@mail.gmail.com>
 <CA+tqQ4J7_z7_NmUNojJttF1e8GRR8Ua9w0Rap1t-U4gYPhQ1Yg@mail.gmail.com> <DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com>
In-Reply-To: <DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 3 Nov 2025 09:18:35 +0900
X-Gm-Features: AWmQ_bmjwfOG0Fsadhki6hbGrYasLvIYy1-mvKZIH8xEYEub_dTdviKWOD4hlxE
Message-ID: <CA+tqQ4+NY2zFJrr2omGqQcVG1N4cJBgYNO8qH=TFi5UG_vLfTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 14, 2025 at 3:35 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
[...]
> This might not be too difficult to shoehorn as there is an
> `is_in_bounds!` macro (which we can turn into a const method if that's
> more suitable) that your proc macro could leverage, but I can't help but
> thing that maybe there is a better, more general solution than
> special-casing this?
>
> [1] https://lore.kernel.org/rust-for-linux/20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com/

I've tried your `BitInt` series, and I think I can generalize (at
least the overflow check) even without the help of `fits_within!`.
Since I can retrieve the number of valid bits and the signedness of a
given integer type (including `BitInt`) while parsing the helper
attributes, I can use that information to check whether casting from
a value of type T to type U would overflow. Here's a sketch using
declarative macro syntax to demonstrate the idea:

```
// I'll write a function that returns equivalent `TokenStream`, which
// is suitable for procedural macros.
macro_rules! check_overflow {
    ($val:expr, $src_ty:ty, $dst_ty:ty, $dst_nbits:expr) => {{
        let val: $src_ty = $val;

        // For every integer type (including `BitInt`), its minimum
        // value always fits in `i128`.
        let dst_min =
            (<$dst_ty>::MIN >> (<$dst_ty>::BITS - ($dst_nbits))) as i128;
        // For every integer type (including `BitInt`), its maximum
        // value always fits in `u128`.
        let dst_max =
            (<$dst_ty>::MAX >> (<$dst_ty>::BITS - ($dst_nbits))) as u128;

        #[allow(unused_comparisons)]
        let is_src_signed = <$src_ty>::MIN < 0;
        #[allow(unused_comparisons)]
        let is_dst_signed = dst_min < 0;

        let fits = if is_src_signed && is_dst_signed {
            // Casting from a signed value to `i128` does not
            // overflow since `i128` is the largest signed
            // primitive integer type.
            (val as i128) >= dst_min && val <= dst_max
        } else if !is_src_signed && !is_dst_signed {
            // Casting from an unsigned value to `u128` does not
            // overflow since `u128` is the largest unsigned
            // primitive integer type.
            (val as u128) <= dst_max
        } else if is_src_signed && !is_dst_signed {
            // Casting from a signed value greater than 0 to `u128`
            // does not overflow since since `u128::MAX` is
            // greater than `i128::MAX`.
            val >= 0 && (val as u128) <= dst_max
        } else {
            // Casting from an unsigned value to `u128` does not
            // overflow since `u128` is the largest unsigned
            // primitive integer type.
            (val as u128) <= dst_max
        };

        !fits
    }};
    // Yes, we can also support `bool`!
    ($val:expr, $src_ty:ty, bool) => {{
        let val: $src_ty = $val;

        let fits = val == 0 || val == 1;

        !fits
    }};
}

// For a `#[repr(i32)]` enum with `#[try_from(BitInt<u8, 4>)]` and
// `#[into(BitInt<u8, 4>)]`:
check_overflow!(Enum::A as i32, i32, u8, 4);

// For a `#[repr(i32)]` enum with `#[try_from(u8)]` and `#[into(u8)]`:
check_overflow!(Enum::A as i32, i32, u8, u8::BITS);

// For a `#[repr(i32)]` enum with `#[try_from(bool)]` and
// `#[into(bool)]`:
check_overflow!(Enum::A as i32, i32, bool);
```

It is somewhat similar to `fits_within!`, but it also cares signedness
differences between source and destination types.

It might help if `BitInt` exposed `MIN` and `MAX` associated constants
in terms of its backing type:

```
macro_rules! impl_max_min {
    ($($type:ty),+) => {
        $(
        impl<const NUM_BITS: u32> BitInt<$type, NUM_BITS> {
            pub const MIN: $type =
                <$type>::MIN >> (<$type>::BITS - NUM_BITS);
            pub const MAX: $type =
                <$type>::MAX >> (<$type>::BITS - NUM_BITS);
        }
        )+
    };
}
impl_max_min!(u8, u16, u32, u64, i8, i16, i32, i64);
```

... but for consistency with existing primitive integer types, these
constants would ideally be of type `BitInt` instead of the backing
type, which unfortunately limits their usefulness in implementing
`check_overflow!`.

As a final side note: as you're already aware, breaking changes to
`BitInt` will also affect the `TryFrom` and `Into` derive macros, since
these macros depend on certain public APIs provided by `BitInt`. The
same applies to any future custom types that require support from these
macros. That said, I'll do my best to minimize the dependency wherever
possible.

Best Regards,
Jesung
