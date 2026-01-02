Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F5EEBB
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767315861; cv=none; b=SaoWi4RkuZ6KBFO5+IL3JMAJAAHYHDsTFKOHbEjpgyLm4aBT2H7VGQl5TWa9ItfUxm930OV69hinwPQjw6x1zSy5ixSnxagRIhtbN+86PBgdGuR/sYeO9guF+gfvRf0NpWRVSvDqEZaKiOdq5qAnEoG4kohY+ivFNcsgnxCwIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767315861; c=relaxed/simple;
	bh=LxvtmTgExU838dZbu3M8EpSvWJY5HTmGFhE6QKsdeqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX707fD9I1EoM++wRLCxQ73BLBp9RVPaFLCovzwCF2yh1PrbLpwSgc7vSI8hVMm03OrxPelmaAsMMW5gs2Fr7VYPApuKgISo4QDMw5afp4RsmG9f8Ldw0k9dptaRIM4QSejF018l+vhycjRWQnOV1VMw7WbH3FhfG+oVeuvKHR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf6nrkJp; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf6nrkJp"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65cfbc56a29so7972883eaf.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 17:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767315859; x=1767920659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxvtmTgExU838dZbu3M8EpSvWJY5HTmGFhE6QKsdeqg=;
        b=kf6nrkJpWyzYawdUhOeNoWyPbx0xauN2RHok11o/ItMQfAs4sB/yURE2pnxa84Xd7d
         7x+gSmmwBcoLZqU2/D/2+e4dBQodL6uR1xiYlENJmYH11r/ywu2GUATFoiPysFzHvMEF
         sfKzzhvuA6n6+d9gZEzQvgZCRlv0IhpKPVqbeN7CezYpq9blkaLgiPdtiP89jMX768qW
         mRWGxAo2HharBMdKGGHhFtUTawLIVihrEjte+Fc0cbSWmhiUqSCZiXcvs80bziXxcNuV
         6m73JglnKImbynzAClLN84wGWocqiF0eJMcbtSOcwft5XWQ3rYWd0SrsPJXJYkOOFJbh
         Jhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767315859; x=1767920659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxvtmTgExU838dZbu3M8EpSvWJY5HTmGFhE6QKsdeqg=;
        b=c6iLozY+ByRUnsUbDtm7NYaqkNsbj52STs6c05EeE4QDJZ4brJrPXjWzXoxmhW3YL4
         mevArKhyJ+sMXB7vcwRSV+l0mlLe8YN1TvLM9rhE4ps7bZDhrPc0qlrCVjNI3tZ+HHM1
         bNw4hPPLZmDTIQfdg3oFR4Fy8YYhnsfISX4mc6Y+ZkssX5Xjg6JcpbVMrfjQiLr5OZfN
         K1zSn7MdV0YSeM2tnmOuGHUVckC/OGJAcgo7dQPW94258Uyh/Z7nrTmOq/HdtUgzLyK9
         Ajv2JbZ8PvzAdMdjxJm4OnAOEHoUVwTMcLTJVl7QsXz3q1NM5Lcmlly185R5ayq2d/lg
         vK5A==
X-Forwarded-Encrypted: i=1; AJvYcCVcikzKEFojgDp04D6LD6raHm4rHh9ONAchWqrAG5RmnPbwPpwfTxKkwIQUCIvj1oL2lQC8fXybNBX0yKzV0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG06wQ7HeveMR6N+SfdXNPsBBb849CZNqlawI7Fgbeen7NLMwW
	oOul/lenOgrPX647x53h0eSfB8fYZtmAeEAsLWK+G4HCo89INLfwQHw3WuRmlirnHMN98Mf7L2u
	/vbA+5J1nUGoqjCYjXpI/6jqnu8SUJsE=
X-Gm-Gg: AY/fxX52K8KzDD/S0nJ0qMby/gE8+zrfL7cLZt/qe2T2Eayhq2qTmTxPz1u9Pbicxtx
	zc6ULnbGLzke7Qri/FO4sv7cbHBY14kWrbi4VZ4xntt+Kt1HzKZarvNYcBMIHtZxuEJ4w5jbEob
	g2J9YAZAPF60iDmiM/U/3aDIygDVSfthDoQiIs3VhuPVjqG824Vsz+PEafuXC04snTVgftBVLEj
	ok51QI6xGxWMZAeRI4A1X8rrU0LRmEhLd3oO/MLmnX3xDZxy4+5EtoylLG9AEt/XD0/A5Q=
X-Google-Smtp-Source: AGHT+IEXStn+3DV26KfQhODgMqvpdlTgT2wVksyL6lKPpgkd0LgtAlF62/MtHk5q/xiyCl4OKtEQsFjfMSzEHn6AKE4=
X-Received: by 2002:a05:6820:168c:b0:65b:35fe:4323 with SMTP id
 006d021491bc7-65d0eae1f60mr18434953eaf.67.1767315859063; Thu, 01 Jan 2026
 17:04:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com> <20260101220903.0c099099.gary@garyguo.net>
In-Reply-To: <20260101220903.0c099099.gary@garyguo.net>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 2 Jan 2026 10:04:08 +0900
X-Gm-Features: AQt7F2qSe0GXFXUOYAJfbZ-_oS5K6WwhDJH5NZyAUkA43PdDaBERUQ6zVq_3wzE
Message-ID: <CA+tqQ4JF_ZO63U4GiSb6+Ym=m=81kN81xr8Q2q3qypYfYQinxw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file size
To: Gary Guo <gary@garyguo.net>
Cc: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 7:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 01 Jan 2026 08:21:24 +0000
> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> > From: Jesung Yang <y.j3ms.n@gmail.com>
> >
> > Use the `cfg_groups` field to aggregate common configurations into a
> > single project-level definition. This avoids repeating identical `cfg`s
> > across crates.
> >
> > As a result, the size of the generated `rust-project.json` is reduced
> > from 11MiB to 406KiB (about 96% reduction).
>
> This feature is not available with Rust Analyzer 1.78.

I suspect you are referring to the rust-analyzer component shipped via
rustup when the 1.78 toolchain is active.

Do we apply our MSRV policy to rust-analyzer as well? The latest
rust-analyzer release supports older Rust versions, including 1.78. In
practice, I believe many people who rely on a language server use the
version provided by their editor extension or IDE, which is usually the
most recent release. AFAIK, it is actually more difficult to use an old
release of rust-analyzer, as it often requires extra setup to manually
downgrade or pin the version.

By the way, thanks for pointing this out!

Best regards,
Jesung
