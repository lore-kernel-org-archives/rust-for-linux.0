Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0B189BAC
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525753; cv=none; b=Lbv9kIaQ6oL2MAOg4/MOuV2n3ZnM1b52YAmoI6ve0lir0fc+gXeCNwjAutpkeLXWALJUYyiCrQdDdsI76oBIY0sZ3kLxsE6bpvmLa3j+bPKJQjk979XeD4MNpswMHmfkcE0o/bcujWToPwgvdPIUwAD1dbbZgfmeeKW8ZINeyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525753; c=relaxed/simple;
	bh=PZjr1Yu0Ay9y016nTeQBXSJo1HOEMk7mulrM8bVslrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tmhb1vCvQH4ipsvsTMgUPQD/Bt4l3+Oar7RZSPF3MCk/hc4gIkOyX3TZdaApAPW/A7XZ0sHvmrVMinFcqV9IL4z5uObKi9sYFHGTrgbwiDfUJJFUHPL2LAhPfsBJKGmBlo900NuoBDKu+fjFqoDwyjDkPSkPC5IJArB3x2Wkkpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=14odxsV1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="14odxsV1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-432d86a3085so38647875e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525750; x=1733130550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZjr1Yu0Ay9y016nTeQBXSJo1HOEMk7mulrM8bVslrk=;
        b=14odxsV12Kd1R4272NNhsYLdRMyUVb+AZbTQGXjm2xFdeozOl/rlDvFKpgUviGsR+E
         tFe5xQj1BVvIqIQH1UPFeihUSdj/+X6dzmNLWhfmSRY4qeoL/C5gaDYsfSCLiCBqHbLZ
         TIMo4h+3+V3o66AEOlVuT+e97ozmp8gOouCPJ+WQLjpvupF25OpnWM2zVDZu0G4f0IhK
         KM23HsFLgg53i3XqM31uSG9Hvhb1h/eHEdaHozZmMJdIrS4OjPr9PxJ1rLeyP3AMJyKr
         zdwxmd7ApaQ5xH7bgROPFD95q0wOONlZ+1mHwxCHQtm20l7jjy1snyyPvr9qYZ004U3W
         l8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525750; x=1733130550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZjr1Yu0Ay9y016nTeQBXSJo1HOEMk7mulrM8bVslrk=;
        b=HJ7NZizMwilAE1jPpWLXDjZWADOT7cxQ1gWIXbKmPA7Xh4Dz2Ut25ElYF1tbUNv8nD
         B7Ez7p4vCnuQEWPP8rPCbDy0t1U0e4AZoHGk56KsaaeM7JMNBOqbd11ziBkrFllJzLe0
         smvuvHpY5XI3r7ud8HQ+Wi9tr/Z3tufLQ0xUMukoLyXp4qu6WTxEWY7mrDbd8qpjCu8k
         LKNk+ALxq5Xz1GTEMogphX0kWZKZP2nceAS3oIXPdnLnCxzw77a1yNsIgqEE5tMRT5yH
         k43mfXk1VQ6bjVWzxIIydanYtrSGF2dgxxLut2FEMR1+kpBXqBgwzUDE+TiTFOD+dwvV
         eRsA==
X-Forwarded-Encrypted: i=1; AJvYcCVqD5CsdmpHpYIwqsavMTaJUL2pvaVavLRb7QKHhWJmSuogUGRDM4f0a8T+0jlBzHyqFD/qEb8iRvzJDHxkCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5og68FtX26uF2BvxkZcFPDMHF7ORSRo/WWfZwPGFZPSY5Udbi
	DnqWP8cLuGLQAaekv8F1/dfhk1KTwBY6UzlsmmP0knM9oNArOPTIJIubn7SkwJmWvKUmtLDP0+e
	m+SAIJthIT99QCEVuwHxv8gyhiMRXmkivxBP6
X-Gm-Gg: ASbGncsBdh9/5F3XZdUjq8gisu4+Kw7BKRT1dqmiQQw69Hdxi7fs9VvfvN9ygOXmCAS
	+q4QBvdEPU1HkAeF7bkrLDXdqz3/IeoTWro1sS6eizUL1ez6taQV7Lk/Mv8uPKA==
X-Google-Smtp-Source: AGHT+IE7Fba0mueXQruBT2O1+P0k/ZOupdomBzRzh1mSpCPpLePxV1BgowFf14yqcxgVhzpT4h9Z8LLvXCth5luslj0=
X-Received: by 2002:a05:600c:3aca:b0:431:52f5:f497 with SMTP id
 5b1f17b1804b1-433ce4253d2mr111486625e9.9.1732525750068; Mon, 25 Nov 2024
 01:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123180639.260191-1-ojeda@kernel.org>
In-Reply-To: <20241123180639.260191-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:08:58 +0100
Message-ID: <CAH5fLgjdbyFADFZQqjFP0o2eohKjtrbVq_-_d341-TU7aPtw2w@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: run Clippy for `rusttest` code
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 7:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Running Clippy for `rusttest` code is useful to catch issues there too,
> even if the code is not as critical. In the future, this code may also
> run in kernelspace and could be copy-pasted. Thus it is useful to keep
> it under the same standards. For instance, it will now make us add
> `// SAFETY` comments.
>
> It also makes everything more consistent.
>
> Thus clean the few issues spotted by Clippy and start running it.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
