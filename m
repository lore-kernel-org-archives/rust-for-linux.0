Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551279F5
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731787317; cv=none; b=s6AhTy8Xc7DWAXX/akyAqtNb3P83d7Bd8e/tAysKLKEVo3NVMaIkqEc/fu+VqmMEKhmVtqCNSxppPsnj6pm/fEkzqHVW4e0batyiGvzFbyGnuaYegLl/bdxVI+TRXhpKJbH2//lzlNYoN8fsr8LZUg1GEpn1tr7Ehb+1EsK25yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731787317; c=relaxed/simple;
	bh=ynDBoKi847vnpVlLk9b3nRs8zpMi9En5OSzAHQNwJ9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwkZCsoY01l+OP1Fawqole5YK2Fuiub4rajyJpXCi9AWgvfNQPFxZYJQvH1EKHluX99WZ9Y0yWeQCMwLwLuurjfvFg6TAwx4039sNJNNvXOgm+a6hPhrQGaXU041qzhuhP7Xew7shOrzKkLhQvDI7HNBiCZuX3d73PHF38cV+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkHQkRav; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkHQkRav"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-211ef41959eso1175495ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731787315; x=1732392115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynDBoKi847vnpVlLk9b3nRs8zpMi9En5OSzAHQNwJ9Q=;
        b=AkHQkRavspSBQAI/ehb/orB+ND3PExO09Y5vho1DYARdCjFp8hMhTV5xn86sUFziYJ
         ms9Bo0EVeSls3MUtPTpJ8VhAtIycMxX0W9s0LzYKbPwKRG+x8T2feIu9NIY69LYCtZAr
         Sd483mZfr4kyhaLjqSW0TlU4JUm1Nlt9adujOK9iBzeFjBxlG5ISpk8kG9N54EdVpbEw
         hEhE4W9DYhX/nIz7jqrk09c6NcCwZLvm/KZElW4hwwTbmSngthi+Lvgc/LfeVL4eQwzu
         sNh+byWI8yAcrHMLHJf0nQyOEnieGrzCSLleirHFvHL+hCb6zHmRgEU2AeUG8ejp46T4
         IovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731787315; x=1732392115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynDBoKi847vnpVlLk9b3nRs8zpMi9En5OSzAHQNwJ9Q=;
        b=KAGueC9Xv/gotZ8EHxPY9gBSkKS5JaVgQmG0Ix1Yf6XHBFVcwVVriUWHhAPlyg55Qj
         g5EF9srGlN/RrstbwD6+KMxX2Wn3rVe9IZ4lS6kbR5ssN/lAi7OXmwBIdvbWSPcI9wp5
         DH6uH384WPKpmHQCWxQ/ILAqJRYOHjFR5pknYnfGX6aHN70jWtallb98G2fhv+t0ACKy
         ODDbsZleVc+QQRbImVeshp2o4+oF1VX3/RvwTIbIvmGMMatby/ayzcJP+6fnEBxc8MWx
         SukhF4RYDpXRUJIvTRNiYhLzNLrBItcmz32HadsPQaSKIGoX5f3qJsuTmZ4VAXQaAnQm
         6nLw==
X-Forwarded-Encrypted: i=1; AJvYcCVmfvlcysGmfhIWPlFOXIWyDnVTDqH3+VxX0IRikMSaU1JFsiXHPttilexn14EhGYlvn6jAiIXPJdqEUngMZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcsKJINWGcwZjlz0jsUReFUZRPMz3TCJ1Naffx9D/LpjnfwOvz
	Z5amc9nXIZlXk0MPzDLswPBIIzayvoOQ7CZF5FJD65zVCw++Fm3LYUGTuWAmCN+TbFjobEKi+oA
	3aGUxPtnnasq0ePp+OMOjLs04tN8=
X-Gm-Gg: ASbGnctpYEPeJvfajQZIF8Q/aM8u6Y9McRLryM0Qs9ziWbhUchXuvXoV+m0uS/IcXGI
	GmUAn3rG9f4ufMR11NzIhm8Njx0h6qg==
X-Google-Smtp-Source: AGHT+IHx7r5SpYTehR62URU2QRwluUSQTcv5TYXKAKLVhqxtT1Cbu2B9y0tH/5Bg42qCOvJEXAIwJi+2y2CmjKKTJn8=
X-Received: by 2002:a17:903:1d1:b0:20b:642c:222b with SMTP id
 d9443c01a7336-211d0ed6339mr39415245ad.15.1731787314896; Sat, 16 Nov 2024
 12:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev>
In-Reply-To: <20241116195221.373332-1-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Nov 2024 21:01:42 +0100
Message-ID: <CANiq72=hn_-+RmhdEtqScrv-=_mFs4AtGCc177khdcU=3GjskQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Replace unwraps in doctests with graceful handling
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 8:52=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> There are multiple occurrences where we use unwraps (or other panickable =
behavior)
> within documentation tests. In the following patches, I try to replace at=
 least some
> of the occurrences with graceful handling. I haven't touched the rest (ye=
t),
> since I am unsure whether we will all agree on this. If we agree on the h=
andling
> I can submit them in v2 or as a follow patches.

Thanks!

Tip for next time: when you are posting patches for comments only,
i.e. when a patch is not meant to be applied as-is because it needs
some discussion first, like in this case, you would typically send it
as an RFC instead -- use `--rfc` in `git format-patch`.

Moreover, ideally you would also add the rationale in the cover letter
(and commit messages), i.e. why you think this should be done (the
Link you had in the other messages is good, but normally you want to
say something rather than just link).

Cheers,
Miguel
