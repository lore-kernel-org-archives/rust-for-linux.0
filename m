Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF5188CAE;
	Tue, 21 Jan 2025 21:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737496057; cv=none; b=oOh/5+RMKJJq1esMngOxfTSJgBCqnYJ6Bwqlt5Az9uOvFcBxFA0iGzp08v7liw5eae/lnlEvi+9dQW+7VJ0J9UA2Ii0wIFVCQRXG/dd+nllow871Rq8zr/K2+II3qAXe7fUtzxdS9dvaLRZRvPTqCQP32zTxef341LgeO5v1fZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737496057; c=relaxed/simple;
	bh=SFQdO87KU6rMmmKG466+pHg05L5s4MNtWbHODZ2EOyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVmv31g5iwcD4vuIASvMuOsg4NDiUPsJVqkHmGPf113pCvxm5L+0kR9BFwF0oCyr4SSXYC3IBvhQXaUlEzjaBlpiRRrsK1VuD43bzy5VdBmNXSh+ElPgEUa9p9eZgBA55UNnP9p5V/Fwb4SMuTvzD3eV2P5V22wcD9hC3TaTh9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhvlPJEN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhvlPJEN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216513f8104so9864245ad.2;
        Tue, 21 Jan 2025 13:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737496055; x=1738100855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7o+9JshcrBofeKTB9tW09tsPDVhMqj/3ufOD6DtXHI=;
        b=QhvlPJENJn1+l6mhxDrp1PG4BQ1qeFApV+3XOx14lprQlJRNBpyPGzhtjy+OaAj+RC
         W1jpXUMRaVsje2JldXkUXDv8TcHS541CbL6qmoiphwBFaEGzcFt43S9/KQ+56r6sTsEc
         9dNqNPkZq46DCysmezNeOVSzw0N2BixRzHioLMfyROlHDw1BPJEExcdhEM+yVywAzcHE
         Z3aqWQlDosD07SFaTt95miEfmdLfOWvjA8TPw5fgH5oKnTWX71sCpooCmVoGgs0c9xgM
         4zBPyHcJgrt2+iI1tZGN3hKMbQEA4WZhOUnIBUnfdWiAtDzrDMATUFBs0LqvbALU7q9e
         ULGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737496055; x=1738100855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7o+9JshcrBofeKTB9tW09tsPDVhMqj/3ufOD6DtXHI=;
        b=K1556w1AE3kLir4Z8eAE+FQcQFBEvdd+AlKEFQzY759F9GEXBHJGXRm/Ip2oN9QK/9
         oncWAUCIrHn1jA+TW+u8PxnaA0/WTBePrb1BGEY03NluG667sA7pM5M1fz4dwpm2U2yk
         EBL5jW2m1yL6XFJg2TEx/S/57ByJDTSFzA6hpc+FGG2KBpHRzH4Ho4Ut7zkJOOBfPDHs
         7jt5sX6HaN+mHxQmkl/PhHp3kF/vfqtC2cIhEEiABvtFfWkaF/swRgfWl/jPLgDNU4f6
         aRkxA7IW0WIJlMYtXCoyPz2Xe7IgKsoK5Ija5et1RKyTJubT3jEN9Y7m7WCsHvdEH9b8
         7ILA==
X-Forwarded-Encrypted: i=1; AJvYcCWZb3Zr6Zc+IR7EDCoDWwM228VDSmKUj2nQxzU22xB4LVFxqojRK5n6RB5natiaeORKXthgpF1hfD3RPYQ=@vger.kernel.org, AJvYcCXpoHhK2JhVOy32FCoBR2dn794RxECzdyIlaEI1B1Jl/cAVBrpA14OAtF5cxSWVwhlFGkJZ++ZVTUa6Euffyqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgGqdd9Nh/XaPdabFZQH4xSMieGPFE10cvKY4xSogcaJRO3F6O
	S2z35j3YLVzC6w4zVP8H+KNyMFbLeZ/XCmTPbzWWQqSwU47/E4P1WrztrS4vUZ71o/BMfpEKQvk
	mBwz738hD2qcKKE2FXLnSiwWF7YA=
X-Gm-Gg: ASbGnctgb0tCFetpSUVViUZzbvnZYq/fmjm2GRRu+jr0DLMbaM4Ryj4Ey6Z62WZg6hu
	bjd8o1jDr4OWonuqGEuAnqSVU3NafQA/hJuFSQmA/mlNfN7EscAM=
X-Google-Smtp-Source: AGHT+IHRk2ZLyf0ysaNReOYuyZFvxKpMP3e7AM7p3wxJojsGYuVF9Jzwo3/st9jP2UCgo7y6AAVXBGJVBhXdH7oeheE=
X-Received: by 2002:a17:902:d2c2:b0:21a:8ce5:10f0 with SMTP id
 d9443c01a7336-21c355869a8mr97456405ad.9.1737496055410; Tue, 21 Jan 2025
 13:47:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121200934.222075-1-ojeda@kernel.org>
In-Reply-To: <20250121200934.222075-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Jan 2025 22:47:23 +0100
X-Gm-Features: AbW1kva6Rn2sOfmf9JeN8H86I4Id2gUtstZTDCg6KdGBDAiqPupe7dqT1tfE2rE
Message-ID: <CANiq72=mL45_xJBmQNzaXtP3v317ZbQthH2g5rAH3tw3U6uovg@mail.gmail.com>
Subject: Re: [PATCH] rust: init: use explicit ABI to clean warning in future compilers
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 9:10=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.86.0 (currently in nightly, to be released on
> 2025-04-03), the `missing_abi` lint is warn-by-default [1]:
>
>     error: extern declarations without an explicit ABI are deprecated
>         --> rust/doctests_kernel_generated.rs:3158:1
>          |
>     3158 | extern {
>          | ^^^^^^ help: explicitly specify the C ABI: `extern "C"`
>          |
>          =3D note: `-D missing-abi` implied by `-D warnings`
>          =3D help: to override `-D warnings` add `#[allow(missing_abi)]`
>
> Thus clean it up.
>
> Link: https://github.com/rust-lang/rust/pull/132397 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Cc: <stable@vger.kernel.org> # Needed in 6.12.y only (Rust is pinned
in older LTSs).

And while there was nothing wrong back then with the commit, as usual:

    Fixes: 7f8977a7fe6d ("rust: init: add `{pin_}chain` functions to
`{Pin}Init<T, E>`")

Cheers,
Miguel
