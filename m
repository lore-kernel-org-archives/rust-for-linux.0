Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BA34A77D
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770231267; cv=pass; b=tuKq4qTp0hD/onL+wr94CciIh7FUjhpXiVnmuQEqb5JKMwja607AMv8SKw0AtejlXYgnKT2Mwnp9daYwRxKtg0HcKifPyUzZKvU7dnx+I7bHdVrbqiFhhQz2b1G8FwBykijFThOQ/nz+RVG8GBeHJcTE3obOIlpn0SMrRGjdDc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770231267; c=relaxed/simple;
	bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpDwg2YvyccMeS1jd5giJyntxmo52oKT/qIWkKUy4/KzMznJF9/FSPnCu7RcBz5y724kKq+/shw0eW8UwRHW7ssbQ+e7ZJMCOO7Wo/B5qXgzldiE4UvYOKrfOV7Sz1dR6GizM8T/sGrgkTXc6RAqexX0FiLoDqafwxu57tzntko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/3lfc/t; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/3lfc/t"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b7063004daso4705eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 10:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770231267; cv=none;
        d=google.com; s=arc-20240605;
        b=GgaFIuWn960rR4tp0XXB/YbGIDkUTbi/TN40a1HgqkG/8wwPGyWlrd3cfFfcs3k3q0
         YcRMicunPxinAAT3ZQsj6vtdtAz2cUFKBCaq8CmSr6xwulC7pTgSg+0Xl/yxfnzAe7zL
         PauH0DKa+8C5WLQUIX192jDmfG44dtXb6O3AR3DiM7gAcaIEEjzG5uN1+7e2IFL16X2r
         Kaom1bCJEc9nT4Jok7/jhzRgPIuaaCRCmTGQKooSu1gB88d4dGOz8tycYppN7KE7hkKn
         FAmT+9jzIj4QnDrkY40xRC9VAcGfRKz9vl0epMXWz/Nq6nkfBrE/7PZyjGGBa71JPhF9
         yK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        fh=Kef8FUNCVAcRmDrV9zR03f2CXE86jx/ELLEytDrpnG0=;
        b=Iup9TwQYUF4SjgQPW17WieO20XUAsVPFzf/F65t1sGA7ip0cNhQKiqiBqIXkSncTPw
         Ocuj8Pp7cXQ1ar9eOrGxFBbAELr31RJY1vG7Cb6WST3bPUIDU+FV2C2Gle/OPloDuxbC
         INA06ZYL4c3rCfzL+ban92vyN3Bu1UKlm8z/2KaF3whDHXZUglk0MaP5JErqusQrMOY7
         Ku9TIJ3zJv3H9/c2RP9I1w+4eJs7eiRGO2B9pmNGQ4Xxr9I06psb05kPuZEMA9BzbJoo
         Q5zp2rWAiIwjn9d+7qSJ1KuhLgi33W8lSA5TruNHfLmm/Ogj3IcJ7hK2iP+5gKeVFd49
         Rn8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770231267; x=1770836067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        b=Y/3lfc/t8wdTgu/7IRK65Mkk1fN4Du5djPZAE3GFqfZaBxaXqFb/WgBvyCR+GihNsJ
         vm9iE32tc+RVTtMsdd82tlKNPxbSTjxuQLvV/GhTxdU4i6tjLU0j5rBX/IU+O5cROVht
         Qu1hlu/mTCeV++7eHymGToAghoddqyZ2vz9C9QMN5hgdSI57tCE7qMOKi57QiajEO5sA
         O2b99Ng3eLM8GqsDktHeXV1CZ0oD5m0wa3KSTb2syrALFuEUjA/yeZkbocDWfRvjhYRG
         3k2m/aqrOBzXVru4dUCTPjJVLuRuy4QjnIReNrwTFwqPd6BVoeriJHDMIQEfDnwHw5uH
         3FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770231267; x=1770836067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        b=QGYVVGbOAzW5VnThjYEixvXP/PvnqIf0oWEFsnuZ9qtseX9yMmRg5YaW6wlwNxeAso
         3ytQUFnZPsH/v0yLnD1opglOUoHGX7isdRpAAMprnYADjh1OwJ+yBHP8nBihhqxOK6lo
         mhQnkXTLUZNVEuoQ+HGiME+qIsx9oV7BzLLDE50LAmem602GkjXfuSigYMlXJ+R6pBdH
         czzhfj48fLdRGEVyXhQyccI+hmtaeguu90w+9rje7VITyEfTMbN+XRTx0w8EHowdoH+Z
         VdGmU9d+I8/j2L/XFAhlGIhy4EwDvqf6Bfkja14egavpstXlo/vIEEtI6W8dLpAkVuRF
         fa7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtug6Qd7xo5mXJGhuxJ0qdLVXlHxmYH09Yjm0frbqAHlY20P7zgs2I5DSUKaYELCk7pgd/X72YZesvF4wRww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36msKMeWEjbMbnv+zV0W/i1Oem/aKcO9md+f7PPn9I+mX2tPG
	DpmiJ+FBILdxhI223RGqIO6nwdDSS4cCoXX226fg1rvDxjxz/5JlTzv5hJxgpLTQ+JLXLlWSTOo
	wjTpQtu7pbOneAjj3ahAzLLwF1B6TFmM=
X-Gm-Gg: AZuq6aKqiGIwX/h+P6F5vSVzlxUrd3z8jKabsT1OzYHmm5zwcUzrJzhI/6dGGX28SuE
	IFE59/qnnfmdDCTmTqD1GRefQMXLvKhqBsDmMdJhvv1kx+VeLAvdL1SrVOXdG0xgIxNxhWFvvm4
	ADrgqCRs/DEV25BoW7fqBbCvSCY+/xIXItN4QMP71bi+GvkyLexqjMm+NKCPpN39FHkO1enmii5
	HaCbzdzwQojhdUc6KP11cVQKI+V188cBtWp6f4DMFiZcF6upIMGKCSfymvUtx96qTDJtN/7xHHO
	E/di6SS2vMdxezXzf6VKRZQ8n7RLfd126e4u1xoE4kAwtDDz4EUNqQtdmMEO6IQHYgPy2FWqxhR
	5a7lODD2XCNHc
X-Received: by 2002:a05:7301:fa07:b0:2b7:f145:a66 with SMTP id
 5a478bee46e88-2b832895203mr863567eec.2.1770231266769; Wed, 04 Feb 2026
 10:54:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com> <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com> <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com> <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
In-Reply-To: <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 19:54:14 +0100
X-Gm-Features: AZwV_Qga4SHaJVbqnKL6-k_z0NAbFWIYrZ90umh2b3m2XbOK6FLc8RcS6JCVOMk
Message-ID: <CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Helgaas <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Dirk Behme <dirk.behme@gmail.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 11:25=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Thus for anything non-trivial, I'd like to keep a `// CALC: ` header
> describing the intended operation. I also noticed that LLMs check that
> the code is in accordance with comments, which provides an additional
> layer of checking.

Yeah, it is the same reason why documentation as well as other tagged
comments like `// SAFETY:` comments enable to catch mistakes even if
they may be redundant in a certain sense.

I wouldn't mind having those tagged comments after a certain
complexity -- perhaps it could be possible to define a heuristic for a
threshold where such a comment is required, and get Clippy to warn
about it (we are trying to get other tagged comments implemented, so
it is a good opportunity).

I guess a fancy IDE could perhaps render the math expression on hover as we=
ll.

Cheers,
Miguel
