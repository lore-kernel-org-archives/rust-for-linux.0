Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109E27FB03
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670505; cv=none; b=MBv9kFZMd6fFPsBcl6zADKtHahXbHIWO4HQD4ZFY2IA355T4ywxuekgCG0S8XFxPI2m5tjdMpnTVnt81Bm3p38sMr4Q7vymmMcVOcqrg+Zn+GVu7hrNszbCKrbrSdcAYtPdsg6w+ScxjqPwaOUjcTHYOZd4Cjvl1LYET6uLuiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670505; c=relaxed/simple;
	bh=tluCUMdbZtzI70MpMNxT6XbTimg3FvfG4a7kkBpBftI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoTzV8dYGgK+MeMSB9HOoVFhNLk0o+unTo/qzdXGlmOGe5XT8lta8JN8/J+02Vobw5jx6R2NbqWcq0Ezqg/sDWKv4kWnzVgEhrD+pCYzEtw5cGknK3DYziqzm6mKKM+djYEGyWrsKhEyz6getbvPKGptLv8YUV8OhBjvuRpML/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ic6jN//l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ic6jN//l"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47796a837c7so37397575e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764670502; x=1765275302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj/gqbMEvC2U1EurKb6UYz7u2S6QJAk3SBUPxA7BZ0k=;
        b=Ic6jN//l6u8CV3nf+ShALrI0NZPtmGhd0SF3XhXrm/DTRp/WvCFHYh34Tno3H7KAx1
         XgA8LnPNy702J4zs5sVyBYfa8lu1nfLjnO1HZEYddbPvEueMLzH+XLTTUWmNSWjKGC0+
         82bYaK5fMvbS87p+Jv8W95K88InGGZxULVgWgJ+C+C/xDihbtGaUPE91swFviLk/LV1B
         18U7y9MaY9GYMwO6KbfyfHZQAaQsY0MOc03eo6ywxw3muSOln2Ac6KAwuAkbjgbJRVK3
         tEnbld4TVL5wfTDupW1vBMC04x4pcNq4Y7L8oxt+cSVyre7JZQVRF8MlQ8+6Wpe6VVey
         u9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764670502; x=1765275302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xj/gqbMEvC2U1EurKb6UYz7u2S6QJAk3SBUPxA7BZ0k=;
        b=hAgJvolabFiI1La8+uk0eKS5to9MVA9W1rqmlTPoQDdMKCF+a5K3ZOnj6f67YvGtVS
         QsZzLdzXmqC8Jz5LZ3tN5QyQiaq1DANmBzVpWYV525U9fiiy4OVNPgYEH6W86opPT1aE
         2q9ZcztNxstldrXpGyRr/HP52yu2Ut05f8WSjP0H30/5pjpVEOzFVMahP7d3x5b1Bnb7
         84XzfKPOdP178sNp+cswyvoujfz7VH4a5TZRLQlkvdkJGkFSxSLt3Gt4vloPhuE1PZea
         6MEyhxUA196dnHlRoQHkJSlna9Yfj1bXXj2ABgEsIlNS1hKhBg+JjaSMNNECQBbtaZVe
         2Zng==
X-Forwarded-Encrypted: i=1; AJvYcCUxEHS3Oc/KsfiXm53mCOVG3fzpU7TjL3dWBRIWF+CmVGYpLQDkfdvKbY0HpGxgpScsIBWkmmg7sd1p/oK4wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQzck94+LFRDRmtByXbl+h/ftNW4ScwhY7ZphzNbaRaEpq19Nn
	OyiIqlvx9NL+sP2iRg1o1SAohrWc3bc/Iysn3V0QCmgAeOIXf5PhSP1LtvyQaRZTBztmK+1DDA/
	gz6lf0p/EYSYnR5LJgOCuvAGd0DaftLZQxYrerKse
X-Gm-Gg: ASbGncum9k27WE1J+65Hu+9M2o15PO8ZZcmhnx4pPueehIXgHzKzuy8Bijx5gNFJP6c
	ljeAldbSMHyNQR7+RT63AXBpqVyBLPwic/d7kyIV0tdTbDawt8QtG4HeJoGKrzFvLeJHY9pCOBw
	S6/AFeONyUQzlFQK20OOOtcjxAPMdcdfr+o+wn9woQbqftMVBUMQ0k0hk0GkrggaacgGynmdgiV
	AVAw4jwzdlOimzdyhNNKRrsohSImpS/P4GMsxHAahEm/fszCN2NE0Irj8Y0MccaO6WR5ONNGc0w
	yU+fVBkD/sHqOULLpELEIWxXCcqedJ1V2qj6mR4vTNkWW598Pnn5++jeXA==
X-Google-Smtp-Source: AGHT+IH41ppbKo2ntsTFFVkqDJyv15OsfwqRLDbKCfbp32OEMtJv+7r8A3+XIAbI1BpBDvsTQpoln+8HEetvbhddqzA=
X-Received: by 2002:a5d:64e6:0:b0:42b:36f4:cd20 with SMTP id
 ffacd0b85a97d-42cc1d2e292mr45860682f8f.27.1764670501670; Tue, 02 Dec 2025
 02:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-2-a9ea9ce7d45d@nvidia.com> <af76b544-a7ee-43da-878f-cadc1599d7f0@nvidia.com>
In-Reply-To: <af76b544-a7ee-43da-878f-cadc1599d7f0@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Dec 2025 11:14:47 +0100
X-Gm-Features: AWmQ_bncCycjJtLo57Ks_3lnLDfKrcsh2eIAuKqvMlje8DUUWqYWLDIlb5gTms8
Message-ID: <CAH5fLgjNXcWgCLp=GkOiycPtcR9dpSn-wZ0HK6YnQC9z+dWyTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] rust: io: always inline functions using
 build_assert with arguments
To: Edwin Peer <epeer@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 9:07=E2=80=AFPM Edwin Peer <epeer@nvidia.com> wrote:
>
>
> On 11/27/25 18:11, Alexandre Courbot wrote:
> > diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> > index bea3ee0ed87b..d9851923562c 100644
> > --- a/rust/kernel/io/resource.rs
> > +++ b/rust/kernel/io/resource.rs
> > @@ -223,6 +223,8 @@ impl Flags {
> >      /// Resource represents a memory region that must be ioremaped usi=
ng `ioremap_np`.
> >      pub const IORESOURCE_MEM_NONPOSTED: Flags =3D Flags::new(bindings:=
:IORESOURCE_MEM_NONPOSTED);
> >
> > +    // Always inline to optimize out error path of `build_assert`.
> > +    #[inline(always)]
> >      const fn new(value: u32) -> Self {
>
> Does the build_assert problem actually manifest for const functions?

Yes, the const marker only allows you to call it from const context.
It does not change behavior when it is called from non-const context.

Alice
