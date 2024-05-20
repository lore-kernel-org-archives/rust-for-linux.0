Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D611E1CD37
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198029; cv=none; b=JtPKeIhkdWwjQoTwe2N2OS/Z/yjVHAOkmr5tSJVxhNTusQRy/8MAm0UEAPuLUw3Aq/QGh+JhMUjMaBYZpasRRFwbWiGzaNsheHk84XtJtZk0HiYIL5eT+If/70L0+datBD+H6efdsan0hibQ/hW4H0z2b1TTv324cIm4C9GQ4BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198029; c=relaxed/simple;
	bh=hlbB+kN75U9YScWnGXlfgm/HK3XeDX7QVEgtfCxUOBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThU33VYMM/lX4BlNi0dtTFrUElYHGuziAgTcGpsOIS2Jlz60XBm2gJyN3mV6+xxZBhhdH1mt+ZJjSTH/Tq3ykLqtR18wJB+gR/WJ7sZGCt2mFD7upqt5KgVdIqluo3ud/PBhGuJM3Yfd5Zkyksyon8CyZJodRUrQH1vWz2W7d/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmpE2Aug; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmpE2Aug"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7f63961bed8so960479241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198027; x=1716802827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWeEZYLQFowsoh5tWMf37zmjnQP8pREzFJH0TgxKuRc=;
        b=XmpE2AugI/3BFEc2tnmw00bRgcvxtiEKExQI+9wVi66HQBeRM6EZYxWQRXULA2LHNx
         cgeRykmBbYoLGBW2eW5SwiOx8hH9j1TJhMOao0yeU/m3Hi0Fitm6tqYqWnkKo4lXk5Nj
         v169mXgJ38jdSXJR/jhwW2cuLMVyrEKqyLCjAZ2whHvvvodHO9Kkcb+E3rTLEFdLTtjq
         Y4lC4XlvY0vfpDKDtnqOKX3C6lKD839o3X9vPerDyGOd2Ty8qfBRIbrRb7qa9tLETgKH
         BpfEEVAyCgRssg4+wcDeun59hmEx3wAXJICdOy5e7MC25NMtS4cxLbvyNIydCWkTStaG
         oDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198027; x=1716802827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWeEZYLQFowsoh5tWMf37zmjnQP8pREzFJH0TgxKuRc=;
        b=VGoY8Ogl6nKAo+xU//iTFPEcnNpbg+YvIxECqu22XFxWbPAq1R0qiUzgAhRb4KYhPu
         zxKOR3Yh4p0F9CNIXzy6ewpt29n7CX3lC7X1keNIOHSKig55+SAh/dxmr4PGU1btKH9f
         y2xtYqVd4Gv1hC0pZeax9B+G9dx6fYHtSzuamZPnLHivc+QH49y+SnJEEIjOEGbUCNgU
         x/OFRP/oetkubGZmm1LGwr5QUI+DRqlovn62m3laf+FLg2kCoKd3s4DV21uHtm+zInBu
         qeglqE029Ei9YHTISEToH5+zYbcpriaKEotgT6f4VChYB15gHOIdY37y4HEEAi/2BVKL
         hn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYiBtxveCgR2y2P7TYqFJqmiCA968zoNVFWh45gbv4PPc5kzyKGE36KV3CCnQqxKPJjQ2LmCS78IJBZZOlfeAL95PlGRfYDgIGs99I+JI=
X-Gm-Message-State: AOJu0YxBJn5XA+3QvLVN1pwC/0GLDSm6M18hbqv4YibgwfR5U6gGijn9
	ZcR+96LETB8Z7WYDlKFOHVNAVNB3l7eUcuMGji+nteaOmhKHSGj3WV+jgpe/jQB1T2wO4MXwhjw
	YpZt5hqvOasGlXwqCKl1WAXO/YRCsUytf6GFG
X-Google-Smtp-Source: AGHT+IGRslYvtPZVflT9H/QVdXO5/e6Xw9lf8JCxCi36VGobIaGTO31kcm2q5Iy/MccVAuZ4g5GXjchLPJr6wZYIugk=
X-Received: by 2002:a05:6102:32cb:b0:47e:f5a5:7f79 with SMTP id
 ada2fe7eead31-48077dce359mr29874881137.2.1716198025227; Mon, 20 May 2024
 02:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519210735.587323-1-ojeda@kernel.org>
In-Reply-To: <20240519210735.587323-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:40:12 +0200
Message-ID: <CAH5fLghTdgWyEQFLL8VVSFBNq1hgXPF0gqoM2KETD=Ubj8xV9Q@mail.gmail.com>
Subject: Re: [PATCH] rust: avoid unused import warning in `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 11:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> When compiling for the `rusttest` target, the `core::ptr` import is
> unused since its only use happens in the `reserve()` method which is
> not compiled in that target:
>
>     warning: unused import: `core::ptr`
>     --> rust/kernel/alloc/vec_ext.rs:7:5
>       |
>     7 | use core::ptr;
>       |     ^^^^^^^^^
>       |
>       =3D note: `#[warn(unused_imports)]` on by default
>
> Thus clean it.
>
> Fixes: 97ab3e8eec0c ("rust: alloc: fix dangling pointer in VecExt<T>::res=
erve()")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
