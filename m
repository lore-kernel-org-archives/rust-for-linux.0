Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8113635E
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662762; cv=none; b=MR+ybMru944O9cZVuubxoNeHU1frq8ewnQdhximF6U4urqwoqBRLQoKNUgs82FA03Kv1jNHL9KCkjApFGw+JTiMM55i+nb3sRBDqIpwq7TjucOf3J9sFna/f3Vcr+x1ANsHmfwSpajNKnD6J1+q4hu3OBsVEqt+fwhLDPLJPNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662762; c=relaxed/simple;
	bh=Q3QENN6FeCfhFsoNoHhMZfljsDx2B+bokVmwUodOCKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5Rwj1lyZ12ROHHQ3UcsRiyUF+OatQXU1TXIZbJuGVIMM8Lhqng/8K04DHcIrCIgBG1ei7EegEiOhVSpGp8NYYdO67HlVGU6XbuE8Ru7V+4EBwbelGcOJmjTDK5be54BkMUzej4HETD/sRPhoYRJhmprFHD9ugQ00d69BKoJr6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Do3c/zBK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Do3c/zBK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b67cd5d88ddso256492a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761662760; x=1762267560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcaJkvlevrlFiqDWQaxlxV75MgJ3OQA9Phd19FF0hYw=;
        b=Do3c/zBKZh458wkZaRsoJWAmRrxnKKPJP0GE8M9de2qwyfPv8mJNwaueR/6HQailx5
         /trsT1SZgWjWx+HnaSkkL8b0OyX21tisd8l3O4oSTJwcz1agihIvJlaKOP3ebQ86JhBD
         RcvMVtEJjPwio9f30vqsiUMZH0B53/NpRE0xe0ddF56vxn6hDFYnQjLvSrFpEaUPb7AP
         4dzD3/gpYD0lKVDdod8dOq5ayV7BQklJLbfduVSFhdZWnfARlH61kcHUHdbzy+aeq8Wq
         DdXFSPB8fJzm0y5oO3gJO9T0pRKguxApqptvQhsWtMotgMJBjLPPl/sVNTnAH3S6giwg
         42vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662760; x=1762267560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcaJkvlevrlFiqDWQaxlxV75MgJ3OQA9Phd19FF0hYw=;
        b=IM2tyKiLoWazCocWa7BbE+cbJPq/eulNmLzE0bV6420a79Jdqi2ECJVk+SNqbofDMe
         NZ03FlTDFUR62AtZyv187M2huWSnOP85865SACtmflkaRaf2U6K4427+Mm70KbsrNiiS
         kHaE/3sra8Rf4FqonZ9oYYkSy6aruqvMvzKUTlLVv+ejL97Gcp1jcobuaagClDPPgFWF
         haOErByOiVz9TspESP42kjAa9xRUJ+IbkWu97RLm7+NGN5ivmNs1Pz5mjHMaNXoLwBhu
         neKguNjKbZVcf0hd2Eq+QdTYwo3hbDp7d0OXNmakDUpsawxcPO8/Z31tNtit6kSrAJhK
         5ZGw==
X-Forwarded-Encrypted: i=1; AJvYcCUuP5KEW2DmZ8ZDE2v3aA8V8iJi7hnCvQlDMx3d3KtOcy11VlmfTU9fvkkcUI0yNVMWc2tmoagu90RPI1krZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVt46dkbpVv+U84N9GwIOa++C98T75YzkljWAzP3wajQ8O23z
	1sOWxQo+8KNpnlR1rH5Lgb7wbfgn3JjCHhlrnvCvxud3p0JIL6btmDPgP3OdBy09Xfo0Z0wFR/K
	MS7Yi9F3ZhPLikK7/tM3r+3BlN1OiF2E=
X-Gm-Gg: ASbGncvYMUocMdL6EPXuqs0GPnzdlE39WBbpieYDAjdjNB0BpBHgyTxQ5qwNEltnhL/
	f6NaM9fQP8ADzL5TLB4qSZ2MPFIYIDgVlj1atlmg+6EbKG7/C78lP6os4sYQPSD0ItXaUUf5wGu
	QTJFy3p8DeSV7y11hH9lvU+mV86cY+AM+N93JqC1IJc0/Ao3c9Sw4/R1Wn56d0+KK13OiYR0HOO
	y594I2ffKcFjv3OAaPMj3xB4zHbhOOMuLsCopkZunsuy3SH3J/eCq29lxLF8NuxP6Mds6YOtYLT
	8hjQKUdsEpR1Jor6AifexxR//VmcRnx6nW4G5IcJTk8N/L/LMUFg4aCp2vbQ1fFlq1n8Dp0vznp
	REJ6ekxpo5ck7+g==
X-Google-Smtp-Source: AGHT+IFfY89QqiTl3UPAk6WKNc6WSfg9maX4CslBrwsb+ya7LyhSlvq0HWbjx5qGqAFL/1tDdaDG4249vNygIfHTzN0=
X-Received: by 2002:a17:903:3c4d:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-294cb3e8bb7mr26098245ad.7.1761662760526; Tue, 28 Oct 2025
 07:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-7-60c78726462d@nvidia.com> <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
 <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
In-Reply-To: <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 15:45:47 +0100
X-Gm-Features: AWmQ_bkouzgy_TlroPyjfTyhvmFTe0497ZQoaOPqA8hULwK1yxqY9ku9pkOIYX4
Message-ID: <CANiq72kUDtc+6hrJ_=bbVfAjsWOYzSjVvUiT_GOBKHWQRaLDMA@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 1:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Sounds great, will do!

Thanks!

For reference, the other day I opened a couple issues for this on Clippy:

    https://github.com/rust-lang/rust-clippy/issues/15963
    https://github.com/rust-lang/rust-clippy/issues/15964

and added them to our usual list:

    https://github.com/Rust-for-Linux/linux/issues/349

Cheers,
Miguel
