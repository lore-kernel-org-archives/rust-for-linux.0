Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657D305040
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781301; cv=none; b=kPFHb8QGa1zfbV3DMZQAba1UqZUJ8zWWYxrzQSEsIAFWx6R4GBDQ5RtRheUKsEJoDgvNvG0IcvFE9oO36mxHYJLlHWEnCprMiZJhmjFMEzuRsm3D5STehkcBOLbpnlLg6VgrYX1/rZTr2n8au169wcpRz8KETLDbtD7J/kfLg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781301; c=relaxed/simple;
	bh=bjfTI5/MNKD9oHiCRC+m1AgyC5/Ghs09FtZxTOpiKMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyLp25AZkfdKfseqvkif7RVZM7LDVhHnWvV33u32b0ttkSfpnj8PjyxFp5KhKjSAO1BgM+8vFZTDN2H1qIJ+UuHCOmUj8auSNMJ6BltAPnFMovFwDcAscC4GQMktPYFBUynr1RMmU9GejQv1ooeWNtV2UvZYsHmLWDTRANbYp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgDY+v7W; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgDY+v7W"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297f5278e5cso3699895ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762781299; x=1763386099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjfTI5/MNKD9oHiCRC+m1AgyC5/Ghs09FtZxTOpiKMo=;
        b=SgDY+v7WcGKDmmW3A0PrFB85FWWC1Ak5z9CUqCF5j3FqACjhmT8JJ5tJeZ0fO4KVzy
         vqVTT1t/mwugT+hjIfMRxfFCWqGB5Zyc4DrVXoveMdLIsZQXgBm3xkf565sntin50hA1
         xwva0sIkNBm18lEP0K+Ayo5+p+kbjSJocHlRKZr2vCa/H3e55CUXtlxS29y6/J0RXT1b
         nnkHm6k5xH3e3Ca+vW8pmqMu6I4+KdOLomrkzi/FT6zl/8xNFHh2CwpNIVK2KiNUpJXi
         R63+V+c/44vT0UCqbigCNMOlJ4Zr7KtHw946ISaV0TRNba6ywdivWHDBO/IgU4BY1wh7
         BEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781299; x=1763386099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjfTI5/MNKD9oHiCRC+m1AgyC5/Ghs09FtZxTOpiKMo=;
        b=FfiaViwP12PJPvdJ2n2OVN+1Ww79jqI1hxv6NrGv7xmGbvlniycgst9I3CsHIV1Nlr
         UtUejWH39A8Cv92gdnmkjM6X1N/FW8wI2oOAcwpcszvOucP1YWAfH+ynzSDfypMGu6Cr
         BqNtbCT4SCcizaCvLiZicDR0Ner/LTq/oONzVOC8hcViRtTp/K5vLlALUvgq1VtinuLg
         1plZZ/URwXnzt9SpTgFOZ0qYheVrasF1RTLwsSqR8i+fOxjDCa0G68Vr88bQkPgR19+h
         HUw/hGFrMsfLIEbzwKkEB8Y0slZBeE3rnL1sfMzFbPMEtoCqk3co/LQ5NifZtesphXtK
         gGtg==
X-Forwarded-Encrypted: i=1; AJvYcCW9IWFvlyJN0aLsFKZQc7gXE2dmKH1JdMV3vMwdBewMRuxRARtQL9LcPuoFrfxeDhefvgCIkjgLa6AKDurIuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPj/kSSxtbKHQ53xb94lN5t1/zrWLTN27SrDNA1f5527mAYYO
	KtDEnlNbhGYPOrVP6lOak742mv+oQqxdWimLbvAy4TvEFmcCLGlRkqVuhRBkeUmii26fK+EtQOw
	neMzwvArg7SV1aodHVFRIxmMpA/xOrqpyzxT3
X-Gm-Gg: ASbGncuNyI9j/fwL7GhidzT5FVSUXheUTkt1Vf5mR2jbK/BEk8QmtENokgvkiFjfn8l
	YnXXjlwCzfbbmz718o3plsWxXp+Jdkcm8LgEIur9exuM9Z3PG3AqS8EKKe+AWcFfcILSxoLZoX8
	44yKX84TGEUvMw5Mwvo472ArUS1NVbK+fLd5l3Tj+PnYK4ne0nrBaitChdnVApoOp7gqYwl5qoE
	5ZIxREsgj4vHvg6vJHou6R2U5sv4NGKpcLuwrc6+zy8RPC+zrazz4iOS+KnBQ+k3RbTtG/qRMti
	xBnDOCRFn+09+y8BNLRp6c9bmf752lZTz3gK7D+Bv3SOy2sEpQJstMuLaopxlSHswsILzmQ2IxG
	Lpau0zNvBg2eb0PD/VnF1peCe
X-Google-Smtp-Source: AGHT+IEyNd/CIr3oQh1rXjWGYDIzhBKFEX331S9clDMfX3PRs9JtaBsmWUbizR9ZvdnMVpJ2wUh49e65b06MdwUpBx0=
X-Received: by 2002:a17:902:d4cd:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-297e567be2amr59101785ad.5.1762781299138; Mon, 10 Nov 2025
 05:28:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <aRHOnGyLx-bEVqcY@google.com> <20251110131049.18e2f5c9@eugeo>
In-Reply-To: <20251110131049.18e2f5c9@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 14:28:06 +0100
X-Gm-Features: AWmQ_bmiU7DKmjn-tBgMdy06u7eyya-M3TMlTQsJq9SC-BFptX9Vc5y9iKMzXvs
Message-ID: <CANiq72mGYKYZmQ8g5AbXCsRS+WPxbeaSyngR69jsEpY8akouog@mail.gmail.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:10=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> So I think the implementation here is sensible. I believe Miguel's
> patch is also pretty much replicating the logic in proc-macro2's
> build.rs.

Exactly, I was essentially following what upstream does for stable compiler=
s.

(More generally, even if a feature may work, if upstream doesn't
usually test "older nightlies", then I wonder if we should enable such
combinations/setups anyway, unless we need them for a particular
reason).

Cheers,
Miguel
