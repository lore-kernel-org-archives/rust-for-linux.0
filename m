Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB82F8BEE
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942960; cv=none; b=WwHxGr62j4ESq71dD9d7xbLL/0diXwtZgxT516FZKguI08uPqmrWcpHif7oKyRdLuLjoUHghu3NqsRgSpH1NGuU7dMl4Cf6Lr1OecDI7IHsM2PHTNjVTdhmkku1orJvFhAtVsUnWY318b0NTFL/I9ouy5rCFY35t9pFmU6Q3L4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942960; c=relaxed/simple;
	bh=YPNEHX5E1EAY+3JT9FxU7dtFxSUrM3ua4vlSvyYLYVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyzTVB9q0NsLFE7y8j72PEC0uZjPdVG7gZF/XgXWTC43jhUlCHQgw13KzW3wU5ssjZiznEaQ+vTTF0zObMWPzoR8DL/y9DNz/eCGN9Eiy1Q1L5MTn92apxrn4Xe3yjWxMRG7uzVYleuSjnwRXJEMumHYhN0kdbgrKaT2Q4SkKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irVTe6IW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irVTe6IW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b8f70154354so90747a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762942958; x=1763547758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0B276sCmGuKPqViJUBQ4DCZOBYFMswfLTqrPr8TLG8=;
        b=irVTe6IWHxqBKPgIas1Zkm+IxkM3V/6e/25RcdG8xk9VoJc4nf0Xy9xsP7/ZxKJNRD
         304wflt3AHsL4xGOLr4SoLkUCCTvIgygy8ma7fh7mWqo4yx0lNaSbNZWlqobsR3rQ9AO
         4Cp9ImIBrmxFXUvuQTLCLeOCRNzNRT+j+bwWdDGiXdw6FqqW7UgGy/ie92pMDjHaMp1H
         6BPLqf+ZeOnOH+dB/ldEMD2TUM8qicoFIFzdwOYyFD3+opy7M59K49FDzZAUqKeDQ734
         0H3SOEljD4Il629Ssk07dxbKi6Wp2fAsA03cjYys0T++Wj+l/YTeEUQAcyxFUBVsbhIi
         7iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942958; x=1763547758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0B276sCmGuKPqViJUBQ4DCZOBYFMswfLTqrPr8TLG8=;
        b=R61Glcz/PD4hWT0i1FVt0NVEgjmjbUAwSJZmRuzx0vQO+7WBzTeTlmZsPV9lIawaok
         QhSeTvyAcnWzakTGbPG6tU0s1HOzMaxzO+6a2rDW/3fEDFnYI7yaw73X/f0x42acVol9
         xgfgDddCKGR6tl9y6NvlL5jrrXuzNdCP4H1lRdKf6KHaqCIa3AD1z9dvuH568ENAmJaQ
         tz2LXV79arMcMXTQ6U+n3bB7UvdhVHK+CltO4qWmpWtv9ln5RkDIvR8zQw7bjMo86LaL
         u+x6U1cVY+HXfTG9KVFNRDdGA7wDnXkzpUVnqH745Ildw9agSbcbdw4f17a4NKvWTEUx
         n7EA==
X-Forwarded-Encrypted: i=1; AJvYcCWk2MH+YTcE7kMLz/G5YY0Hp6MNg/3C7xFoW29qF3UT+hmXoudTkBlaGC8FOFhZfhiSxST5LmNFMlWZfh6vBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfsWJlRednYipYRkN/CFguAMFOkM/zvkf4CzJGb62l8qAS9DqO
	db0tdKJ8y4N6T7/Jdo+Xs5dUyy73xs79gExLX+MovogZ2UOMmOlyjrx3wGiRlTqAiJgDjIZA0d5
	hO5h3ep7AACgYfZWulqr9kn9/j4w08dw=
X-Gm-Gg: ASbGnctzz1ksq7MkFAqBICpw6+fXvDEa6F9wSktO9X6GsyIrL04mVsnnC4KBpRm10GK
	6qeHN6D2AbU/yRfgZ26Ph4+FqJ1zapna30Xb+CB4Xf4Q12VWteddvezHBAjiQZFQ+NnGLDnV57z
	Un0kB57dXLzeIy7me1pbW/uslSz2PDSkX+Bng/sZ6h+fKvWqLQMHngrfBF8l4dYV6NdC0Uxwat3
	0N9PPZ6m/tO+lSHRQHS7YLUK2ZhWwRhZNd+lA7fA+OSNmc4D0g38SdRNudSs66NWomCsrrCZwjG
	xR8y9bEHkNZ7rL/UltMRi5WjeyRHWftZfaewCtNPHe0Uq2pyGVroO8TJaAI9+5uY+RmCZhVLX2H
	0U3t8D3iB5pPGNg==
X-Google-Smtp-Source: AGHT+IEZoSqjm0t6zN10oagsZyaGUA55TrpgWglstnMOybFlUdjZoMdhp86GzVPanaCUu6r0dqbnhK9HIk5xK9dXxsA=
X-Received: by 2002:a17:903:18e:b0:297:fe4e:d368 with SMTP id
 d9443c01a7336-2984ee3ba7dmr18188305ad.11.1762942957656; Wed, 12 Nov 2025
 02:22:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com>
In-Reply-To: <20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 11:22:25 +0100
X-Gm-Features: AWmQ_blKg4cu-v3P781ZJkYF9Gq3eqlBz7dX5cAIvvyUp8LMI-DCXNtY1gWIHsU
Message-ID: <CANiq72kCxh=Zen_fRrU8dVffGpNtsfNwMO1agC+muHd8ixMTpA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust_binder: fix unsoundness due to combining
 List::remove with mem:take
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 3:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
>       rust_binder: fix race condition on death_list
>       rust_binder: avoid mem::take on delivered_deaths
>       rust: list: add warning to List::remove docs about mem::take

Greg et al.: please let me know if you are not taking the last one
together with the fixes (so that I pick it up). Otherwise, if you do:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
