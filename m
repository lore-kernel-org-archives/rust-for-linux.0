Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9A19CCF5
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 05:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207934; cv=pass; b=RDcu1d362qaLM1We3qB/JXw0X8n5gmS2IOS16N7JR+WqgbYjMIvZv6DVkgKxWAru0ODeOpkLeTAFK5YEh7oiLy59kZ2Ls131JVF0x5LsZQPNcw9g93scfENTiHl/vz02VxzTstP9cYPiLfO9hR772fEdWi24BX0ZJDHKoSL8Pn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207934; c=relaxed/simple;
	bh=r4v/8AxQsVsQKqeA1EPh7dKn8uljic87H/j2UHTWtCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8We0L8QLH5GIx7LCrRQmkV+Ai/kAxPTjbdwP5dHMKL+lz3xyl/jc+JJxwKIRzBvMGeB23UVd0+PD632IrtUi5FsEWge7S4D7CiWs0JCn3/10acxSBekol182vrk7QA3DljIkDi/Wy+7os0UpOmUzQeLuQo1UyY4XJmTxHmdSOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1NPEquw; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1NPEquw"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be2ce5b538so785716eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773207933; cv=none;
        d=google.com; s=arc-20240605;
        b=IHZjdZoP1LpqGZSSnnrD3Niixw9J0VCdfcnjE7gHruwNyePl6pP84WbOpq4P2HHMzc
         dQxyfbMcUQPYXcSv9Ig+Wiq7+7LrQyLU1t0yQCUuHJlxZW+dbBwxgaWONP3bcEw/FYxB
         Zh7KRnnXWO1x1i55jJC4HgwSB3YsV7f0rc26Xjg3Bgsblp3R8F5PqXxkC9D/uKB9qAc0
         8TfEDw6CeTWMLqwss1j0Lp6v+YwzpxBBqp9WWvNBO4ZtkYaVJj/uNSxYdBxGkzBk4Ijc
         iMY4myPa9wBhXf7KQFOWOIaCzfEwJA4xtPX7ILunhRl/J7ZUHHmIk0i0EijtZs500mly
         kxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRrx4mGJc6Q33SJ/ND+vA0Vcw1UnP9Ka7MhLeW1+pT4=;
        fh=5bSZTKHodWrOGMXLtCIzT1+sn1qTnmtdy+/fW3kUYbc=;
        b=VsHkV/x5k7YfdX1Ys8hteb1zAvt+PfNWTjpepZLOt/UaDVkE6a3t8RfZ7l2sK+6Psq
         L0EXYA9cY//Y0j6iWj+ecEN9MhMyP+6Qiqylz4zUSrNhzWURcksGDplvcqO0Ig8L0bX0
         3sg2B83ZhXpoz0uDCOy0ybHemw/Psv7qJfLb+8RFO1fEkf1YK0VHPhXxVBVZHXvK8n+w
         dbP5tuECFOltX4s5wrC2OTPy0OtIFz1bFdEubztAcpcmzvdAoSwOFrxxC+YLfA29ATcl
         1DsKn29/oDzh0lpO5Wt6xpCANvOPda+EdjNyR14Pd4kKmbg40gVyaac/OyqiCNQW7+6t
         03cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207933; x=1773812733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRrx4mGJc6Q33SJ/ND+vA0Vcw1UnP9Ka7MhLeW1+pT4=;
        b=e1NPEquwRVpSTvhPpK8mDPA/501wxfsyqOmltg/LHTSEVHKNpHMm6kQTBRKcu/MJ4b
         od5lpEY1WlZFXVIR0kv5ZL6HvoMLaXeke0UMDGWtwTBMnI7qDMTMsC4MPprOir8LUQC9
         yRgGzD2niqwsO9PnR9QG1B26gH/ZShbhGl/zHNtzvPFGENnoKMuHxFtekHM5O3Nj00JI
         Qjuvlo4EeFEArbvqPGXOANJXBUyyULgdn35JNrZDoja7TNKihuR3zZ48LlOSFGcbFioZ
         Dufi0BkuGxd3sNVRWkDFkZi0/fJvkDtsSfESIzZ/LAPVw0a2L4ZZom/RP9AordddoiVT
         1xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207933; x=1773812733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRrx4mGJc6Q33SJ/ND+vA0Vcw1UnP9Ka7MhLeW1+pT4=;
        b=nz8TW22Y3iuHoemUsbvDvBMpuP3spbg8J19ZpjU/O6w49tr1SDcBPm5MsHAGkMFMwI
         Y2/PE9oXkmSnI2DH7q17QDMTQRbNz0zJHmVj+UIjlqk3oSpBnGtyQjEE0n0FSUD4hVD9
         HTVyCcuxYuxVMAaa9OJbnF5HSmI9ec+xr2UtpnX+RTGoS+rGmQfhqlyGPNeH0SrjjDJi
         jigfcRW7hjRbP1zKJhPIBm9Oo26hjMyFodOAjepyY+V89gJ+qIGThDskx4sG95DGowTt
         Fcjxuf2o3AX5p23xnQGLwixoLhcuMTmimAMtT4kDoNODof6RIAY5IwBAEl1oXZMF48JX
         xVgA==
X-Forwarded-Encrypted: i=1; AJvYcCWLMATt77+OUpTqb+d3b6bHl+ESFLDTLdwAdP2bdSLwenKrBQ91Mao84EadSC2PnlYGA80Zlm0kMddpT6ZaSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybeyh5/ZW+6MJzRWDm2tIe0QbGlYEvl5ynXc0OMB041XHXRJ/Z
	yHEXZOm2TlPrGDR2keedbqPPmrLWod26PS8wC+PvZsioNyo/HHwEgfFn/lQM7qvNjpYmY2OECCH
	DcGWpb+2EJG28n0S/axUcz9uSktHyWg8=
X-Gm-Gg: ATEYQzwnoJK3V/3Z3f1KlXISpY/LbdplyH0AJEZvuA3hQqqU8KxrURt4v4n/GReV8SK
	rZyv2vyXg+b3n7cIwQdMki7baHH9v5mR7xZo55c9XDTOn8Bt6/xFYkqsemfYKmRPyT831ZcKPFF
	j0gTyobTDyVL+KmsL8iZkFDxjHCynW3sOT/LGzsQegactGpUdaYCRSl6DggGUwqupOy+IVsXjwZ
	1nUhU0AQrpT3WzH9NOnfMM+NZ0baE8KHZihp0NDT79Tks/apcGQePYyGlTGttkeocUA8Gy/Jbpr
	5FQ4/vKNL35wjAYdxfa+H73UqvMW6K6wq1gG2HjlaRRI7RlLTghAMz4/BnU225hyvXYHlXFqm4A
	ciJl6t8R6vDvr5fPC1BZZCKo=
X-Received: by 2002:a05:7301:1018:b0:2b9:1375:b551 with SMTP id
 5a478bee46e88-2be8a0bcf33mr256939eec.0.1773207932520; Tue, 10 Mar 2026
 22:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203130745.868762-1-gary@kernel.org>
In-Reply-To: <20260203130745.868762-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 06:45:19 +0100
X-Gm-Features: AaiRm51k9WB-s0UvVyrIVbtPIC-tIJA6IbwhlGW6aX-J_prRHDISh9G1UZ3PmbM
Message-ID: <CANiq72=J9BMfgD+1uoLoe199xyeR0_+K3adV_96DcNk4AnMSng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
To: Gary Guo <gary@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 2:08=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> `as_char_ptr` would provide the correct (unsigned char) type without
> needing to convert to an intermediate type and cast the pointer.
>
> The `as_ptr()` function is going to be disallowed by clippy warning, so f=
ix
> this usage.
>
> This is used only if CONFIG_DEBUG_ATOMIC_SLEEP=3Dy. Instead of conditiona=
lly
> importing `CStrExt`, import it via prelude instead, and remove other
> imports that are already available via the prelude.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221157.89t3Sqbl-lkp@i=
ntel.com/
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied series to `rust-next` -- thanks everyone!

    [ As an example, without the previous commit, we would get a warning li=
ke:

          warning: use of a disallowed method `core::ffi::CStr::as_ptr`
             --> rust/kernel/task.rs:422:54
              |
          422 |         unsafe {
crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as
i32) }
              |
^^^^^^ help: kernel's `char` is always unsigned, use `as_char_ptr`
instead: `kernel::prelude::CStrExt::as_char_ptr`
              |
              =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#disallowed_m=
ethods
              =3D note: `-W clippy::disallowed-methods` implied by `-W
clippy::all`
              =3D help: to override `-W clippy::all` add
`#[allow(clippy::disallowed_methods)]`

        - Miguel ]

Cheers,
Miguel
