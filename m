Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBE1F4170
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742054839; cv=none; b=i4E0jmZ5Wh8zJGJgXZeH/VJfu2xadVBAYAzjGVVddFHVdAyjxk+zE/LiD+PCme6p0Au2EOcGu4arYA8e3a1sbizKf6x5lek+7whpYnig8OY6M58jtkp8RoozYv5ycw0vx0xftfkQIeZtddbi1XxYqbM/sCLSJYoq+WjaQ2YVpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742054839; c=relaxed/simple;
	bh=xTyWCh2A6otWR5zbCZJo8IUfB9rRPdKktJ3i9+qoYQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbpEED/kKZBc89RNvHkPvfZm3oBsdFvk3Yn7Nqyds2+/sCYRB7vv+KdxZkLEgwMursjjYuB0JxSUBG5oncfETKMDjp9wqk5GDrwgqmnAXq2FDAzDphfdY4RJ2lGK1CW/L72TvVr6eWJB6+dl58uitQliKR5smlXhibKqMmP6KKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIDpgVAN; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIDpgVAN"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a04so33876681fa.2
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054834; x=1742659634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DChenp/oAVMvSpkCbblCv3dXFqGdscdkp5di1OKHTCM=;
        b=GIDpgVAN7XsRnFmWInqvuDKpHyc2OuYzid4NIjeblB7vHfMvk4arZ3Hm4ncjNW/rhN
         5XCa9ARTNAa13iRRSaimB17OpbVaq8FxFZmn+qdFBnk8I7F2KUY4RZGDNbSpTqhpcqoh
         cu3Bm8unEKnNZzgG9I8+uh69Hxz5KCxAjjwDCTZhaftEiLRXHOgXvOmcsOpZFr52ngaF
         Iz62hLltzAmi9fNP7zfTMaK6iwlMxXro/fR1chwSmRIFrDsm0zANjFJh3H/96TsDda9f
         BOoj9K8ehJqsQg2B3zoeCd9GELQfTA34F1DIQ6Ow6EyiUkRpjTMWUQrJFTsbagthnEX2
         /IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054834; x=1742659634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DChenp/oAVMvSpkCbblCv3dXFqGdscdkp5di1OKHTCM=;
        b=CaFOAWI7QVxsQhXlUZFJe5R7AIEJ3JqH5fHT3vDhEe2UZkbUUmGsA8r7YK8W8g0lIb
         7DO2bVTgPh1bxFG5B9cKYYqvSXjgZHjvYJKMYCh+gUlc8sw0X7dvbr+o7gUnEaLDRqvQ
         Pl9FrsS/WuwZlKQN2Lm28Updc9LLdbYd7WJ849iG769NYiMXIGSYkFMOHPtc8HOp2Qdp
         IL8eMGp28Ia/Ym0ZrLxlQjohnsDhWDhBWq7ARLDZmUuyIZAkFebNR//bRt6bpFg3+2Xr
         CRSGbrgvxDPWIpKd070GxYvomrIl/PqmQsMUvYbxxL8nLPHFKnGWtAI+Fd7Cydckoktg
         I3ug==
X-Forwarded-Encrypted: i=1; AJvYcCW+DJGmGiSzPFrvoOLnjihdaGInq4xDRIr+Ll3UAYLHD4E3Dw1oH5DYibjNbCQwceOzRyx4MlnVwfm8KIIRfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA9MFJ9EuF73QSG3I6WuvOnu2KmmL+85ylnRyZSn0dF9IdaExG
	epT1uX9l2YX7PrbIgMwKo0HhdeXbiGBQDNJZvYSfgGyzsWo03NhKhQpIfHXopdED53JYKVO0dq4
	XRp5Vvn0gAjMXFLzvk+tl0IEcdy0=
X-Gm-Gg: ASbGncsypJ+5M1dOXB4EQbNA+kh/N4wRhTphA7bd0nqdCWqXlyTFffOQT4H6Or0wIJl
	M0nnpVEpxlB0MzNIa6l3nBgpvZHgvedTE6fDpuNHbPf/P9iY9h/7nvMyOWR1X8fl3rNmyDN0nOM
	Feu6ESeD2n5jk3zLvjUfalxEcvdekHsL4LtlTUaEb4zSe0sqH1qbZFE7YNONwv
X-Google-Smtp-Source: AGHT+IGHjQl+mEiNeT0hcdP28GXJ+36MBgk/9CU1Wo8XvW1qCQM6kAtT+AVeUMGhqVWqMfGOG0LVy73Dn0u2fpDDRFE=
X-Received: by 2002:a2e:a547:0:b0:30b:b00f:9507 with SMTP id
 38308e7fff4ca-30c4a8e1231mr26374591fa.24.1742054833456; Sat, 15 Mar 2025
 09:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315154436.65065-1-dakr@kernel.org>
In-Reply-To: <20250315154436.65065-1-dakr@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 15 Mar 2025 12:06:36 -0400
X-Gm-Features: AQ5f1JolqxPTgnNGqfRexjlVTfe76E-JqgO2XXpfL-hJGk3DTxhFf1hyITm126w
Message-ID: <CAJ-ks9mh4rsbQkg3ZSmfzR+j1tmrRcmZqqhk9zW8XyhYbLpVMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 11:45=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Extend the safety requirements of set_len() to consider the case when
> the new length is smaller than the old length.
>
> Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/kvec.rs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..8540d9e2b717 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
>      ///
>      /// - `new_len` must be less than or equal to [`Self::capacity`].
>      /// - If `new_len` is greater than `self.len`, all elements within t=
he interval
> -    ///   [`self.len`,`new_len`) must be initialized.
> +    ///   [`self.len`,`new_len`) must be initialized,

Why a comma here? There's a period on the previous list item, and a
period seems more appropriate before the next item.

> +    /// - if `new_len` is smaller than `self.len`, all elements within t=
he interval
> +    ///   [`new_len`, `self.len`) must either be dropped or copied and t=
aken ownership of.

Nit: I'd argue that dropping is a special case of taking ownership,
and that such phrasing would be clearer.

>      #[inline]
>      pub unsafe fn set_len(&mut self, new_len: usize) {
>          debug_assert!(new_len <=3D self.capacity());
>
> base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
> --
> 2.48.1
>
>

Minor comments.

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

It seems that the standard library also lacks this language, it would
be good to send them a PR.
