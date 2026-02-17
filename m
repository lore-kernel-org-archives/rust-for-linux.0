Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A736E496
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346148; cv=pass; b=A9oElTnJNqCbYNAxkKJna6f2O7h1jAt+C6A+48JUKy6CA1gfFRJ3Qn/axMlM+7T+NKlj0q1EGDE66jjZQD89n8VjBrmwQpveWECvCU/WK894MxWKg+XduLiLMJfIMwM6cI7+UYuHB8NpkJ2Hz9gIJIEakFiDcqbGnZteR3TyV7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346148; c=relaxed/simple;
	bh=EfoWbO1N2K5lxt2kPsEb/kyin+BYy7b1ZYySAlSqij8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph5b8QZk5YzzSLl6T1iUwD/XwfJcsT0DbMz/vCFKdO2EFw+SxhJ8yNpgrJcRGA2AlqBbSKrySXsVuqRAkHF2s/m5NdAz1fsRH5BMfTot9i4okRtVRHv5pZawkBAriB2V7QMbbQKOpcAMh16cR2zY9B2C/cvwWYsg5SiQ6l9dS3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1kcI3rz; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1kcI3rz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso22680a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 08:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346145; cv=none;
        d=google.com; s=arc-20240605;
        b=cREMxoEXgsZB4Pw0vw3AHStKJXKGWle4djHdRfonBgnzWlGUrH4qQjMVxxg6fezGE1
         igPEgCWdHxjfhCr5glFGaY/nrRTS2Jas2M9xcSDJELwA9wrllKRRjnJMkN15HDOEM4eJ
         OqB6/xMba6kDlshRmzt559tcti6i5NR3qfW2y/H7RDGiapm40wAsi4ndqoMcYV7ys7EY
         XzSjyfZSx4lN3eGGrJGmLUib339jS8nqWgwDzDDg02qRsqadRyE1ll4ZRmZWVyPoVc9a
         wpWdt42sqE+rprQaO8gDCrAbeZ55dKNB0XbY7utAjD2DSIWZVAXQVcXGOXQqoW5VhAWc
         LG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EfoWbO1N2K5lxt2kPsEb/kyin+BYy7b1ZYySAlSqij8=;
        fh=gIRDBkDVttoVBbA1jMDZmDopoI3D60FJCir20cwymew=;
        b=KBDc+CxqfDgETbf7gJ76BzTvtKLvcSAT9mVRdFSOVb4a09QEaJAnZnznIKpzLP10Px
         MGIO1BLfpbGmllhtlhzzUXSiCicB25QoqAoKRIJ82conVtgZRJd4ocImjbkzFQL6ATK2
         iv6oN/ZYYf3mbX2FYw3ew2iX0p7/4y2YcbPs2BmFCdwNHia7zcoyR/X/3SWpfbnfGok2
         byO0npA5fYpXSxLxAcfL5OHZXqNoSWUuDwdXPx0aNhxUpGYLSIcNaygzPFpe2bGuNyqO
         z4rgqkTIQnHGnP4JoY4NubcYF16PHUVlA74aLuHoAdrEKKGOJv6WSb1jXnUxmrbJI9sn
         pRfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771346145; x=1771950945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfoWbO1N2K5lxt2kPsEb/kyin+BYy7b1ZYySAlSqij8=;
        b=k1kcI3rztilphrQZoxiD1DiyZDUUqszrgfS668E61dgXUFiUa2+lNWqNjzd7TzNA0j
         YMQbOIxzEhlCQkhcFC5beYHilOSRhVY0YDg4OJL3JTej4FRBPJbMVtQxYbsIXQ+WjH0a
         vycBol1w+Q0YXEQuMm5kdEImKlgoHRwN/HPatVztmUN1/2x63FWRlqjQL5zE79iuGp5k
         UORnUFSCTT3zVVoQbhGIEdMjddcbOa+WH4+d9YYYQ0U6ounOnfkPXkTjg67YALadc54X
         Ofgz4gnVDID360l9P35J0B9MdoYuPFPrFlGtQeug2HE20mloyRfN0bpjDOCiQnlvolfv
         E56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346145; x=1771950945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfoWbO1N2K5lxt2kPsEb/kyin+BYy7b1ZYySAlSqij8=;
        b=aZl1734VF8+dRMPo2w4gsiO5KG00X70O54Du1UkcBBnK7Xh9eA0MkuPUAcO//lPlDr
         NoupLAvfZJydSdaO0QsZTyqnZwPv1D2F3yID33wcTyEuL9ykZ2KygqkPhhrLBuocv/Vm
         AOCM9VYymj1ojuZoEEb8H7ujJhwABiUZlQriYsSV1vtCgc0m5ELPLEp05IZyyCdnyTxQ
         mtzE4KofOLgQHH11NdhQ6eEjC4TuU4AWLLRbNEbjDvhFtMQ3NWTznW9MNoYduY7CzMSA
         MJhpPCwDW6clQ6UIdV/Um9xwt28umpcpPxn1UsXyGXiVniayyrssfUEaBVSbiGYAszkV
         HOKw==
X-Forwarded-Encrypted: i=1; AJvYcCXZa3xnyeI24VDdJLD5zK5VBboA2Q/urDyn9557U1f0S7QD6KC7VNGQtVUWyXsE207YuOJMwZtk0LU6KdesKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ihRtxBW6AQqX1jbW22Yw0VvxaBYAxy0wSc/DVcWB2iXopAEZ
	igKmEly152ysoc1xzoK9qLH3bWjObtgLqsdKO2oL1INqV4f44oxRG8/smtdTmo9vm4Kyf0EZeWr
	2FVZFzcVlvz4pDKSBFTAmk4OVB2PRTBpLk7pyJaJL
X-Gm-Gg: AZuq6aJ7/UMw0nBm4R7c1S1Mr2VhvlF2kR1rnq7dlGbiiPDlU+cDjnUgpKESUDRJHL/
	hlS+J3vHKjH5Nwb24il0B+dxpILzzRZk332kOWta3QlWbdDUoCqod4emiufDEVG9MB3rcQOoiXx
	GUv1VuBHD5OpOGkrZpRsDYrNaY/m0JMQ9FPc31eZevUVmxlY3Ddp9e1P8mgCXg1tZDBXbsHV4DV
	ykuIBnvTkQ0AbtJFdWjgUGVcvcHgY8ezIKusHU35IYrCbgY6RVI1pmeZEcF/RcvAIHbEqdBpPh8
	QfHudlQBGI2DOuSOj+4kWz0gmLF8JSh83KoIVCh2d7rqW8Nt
X-Received: by 2002:aa7:d454:0:b0:658:eee:f21a with SMTP id
 4fb4d7f45d1cf-65c149a703dmr56554a12.10.1771346145107; Tue, 17 Feb 2026
 08:35:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com> <20260217-binder-vma-check-v1-2-1a2b37f7b762@google.com>
In-Reply-To: <20260217-binder-vma-check-v1-2-1a2b37f7b762@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Feb 2026 17:35:08 +0100
X-Gm-Features: AaiRm52oKTHP34zclQj7ezY1ha5t7IvLtrRKqEuUAhNd2ttiDd3hEDLvSQutZtc
Message-ID: <CAG48ez2O=_Hd7EjjLSAh36xtOMyX5MZ47xodWkU3FyEar63TnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: avoid reading the written value in
 offsets array
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 3:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> When sending a transaction, its offsets array is first copied into the
> target proc's vma, and then the values are read back from there. This is
> normally fine because the vma is a read-only mapping, so the target
> process cannot change the value under us.
>
> However, if the target process somehow gains the ability to write to its
> own vma, it could change the offset before it's read back, causing the
> kernel to misinterpret what the sender meant. If the sender happens to
> send a payload with a specific shape, this could in the worst case lead
> to the receiver being able to privilege escalate into the sender.
>
> The intent is that gaining the ability to change the read-only vma of
> your own process should not be exploitable, so remove this TOCTOU read
> even though it's unexploitable without another Binder bug.

With this, the only remaining read from the ShrinkablePageRange is in
AllocationView::cleanup_object(), correct? If I understand correctly,
that is fine because it can only drop references on handles (which
userspace could equivalently do via BC_RELEASE/BC_DECREFS) and on
binders (which would probably also have its influence limited to the
process)?

> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Jann Horn <jannh@google.com>
