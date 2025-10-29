Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E12224679C
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742034; cv=none; b=e7rdufay3D0Wjio/riHntvORmOJK52AfhZvuLCTK2c5BmPyegCM/+KQLHgLF/rXPcrej4nbzcXK2UtwNLX1bdqf8Jt9hP97pg/RxeojCGPrBcZf0pnWCwE58iPISK1tZUxZYFN1Me6ZFqEXW4I4JZKEywo2aWYzuvbkHNiYcUeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742034; c=relaxed/simple;
	bh=RZ1c8In1gMlq9FbCVcEzVNRcgJEWOIyiWryo2vurgBU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PtZtAoa7tRR6wB0f7zhWHbQm8B+XVWuw9S6pi+nF2A4D0lC34kgk7MfsEn5klRq0Ishyo31JEgxXF/TwqOrUAnjjveBZJhwyKTj0sFPEl6al2oM75Xp4TquzwtHf2/4MJyrMzc87dLiTiJIB3M7DaSrbbYUYEEAF1wrQRIaFD00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQbPVJly; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQbPVJly"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-427027a2095so4604652f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761742031; x=1762346831; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtXJvTcq7PSogsyLbiFNIiSa3aMDytmkSsBCAXBdzyM=;
        b=CQbPVJlyM9PbzgrJMatYwu5IELIalkeSMjDpVDvFBHy/SlkiMqlLRRqx24HEOi1ti8
         fmxoITHvV735Q2lXLR/LQ2HiLmUNshJVTf7+JQrza6VQ9hGl6bmqkwXY5RT42rbsmy10
         DziG2VgNlRJC0zv3EAmrnt4np58Q12nP4PuXrsOMaz2ABE93miqAI+4xaeif7aGBTv03
         VH3cm1l/099XAm6jin/REUu1PhKOJmbnnskbvD9Rk5e1AfsNL2FxdzB6KNQIquzkX8rH
         BYimfcWHGR2KMK+Z+iNSa9FeLNnFXLrLFNHdUPAn793MVSbYVk64P6jQEd3Ebt/QAxX+
         5z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761742031; x=1762346831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtXJvTcq7PSogsyLbiFNIiSa3aMDytmkSsBCAXBdzyM=;
        b=CirGFhpqqvVlXirbImNzpiuX5jOucebFJTQCsQAWnML8+FDjlIRUv+iw2dyY3JbGxc
         62ScpK7uYNr5W0ywqioc5o9XpgWzJZuR3iUMb6ktmloSS4QwGyqFhsJpWpOYvUzGjufp
         P44rvQ2kFmx5WckT91UFvKzVUEVcN3fKZ74G4KdzGJ6MKWvC8OWr1JVQicFHX5bF1aaU
         V0525Cou8PSIjk+hpkOztNxhy+t+Mn4khkxMPh/R8RgyAjAU+e0MPfiN22jOYISpt/Mv
         mi3CupjNSQsInwkAqz7kEo3Y5Bf7sFOjgkSLnK7wlVN9gvVWgODdTS0gGzhLAdDXfQm1
         HJlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB0YD6jykfBDk1nyT9CzvwJCJm6klPG1Ox1kBny72+XLBdDVsGGTMWertNMzp3m3RadWLTTR/1y3nOY/UFBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoBgj7ZyhghymJwuw28Sa2qI44+Vj+5hadJn9xGPh1HcFfp+w
	v/kv44V4a/lpjYsshUVNn7lGJdOlSMU7fKRA8ayTBQ9GkWib3Wf1G+G0KArm/rwmzpCN7qFmknd
	AXowLtGLQ8Bls1oCGLA==
X-Google-Smtp-Source: AGHT+IEv3fbqpyMJagFo6xGiSAp4ZJfz/NOzhfXNsSPeWdIojUeQVslwvThMYOlDlFUMgf9NEYTALza+RhxNeRs=
X-Received: from wrrx8.prod.google.com ([2002:a5d:4448:0:b0:425:6e00:e053])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25ca:b0:428:4004:8226 with SMTP id ffacd0b85a97d-429aefb2a9dmr1848797f8f.34.1761742030807;
 Wed, 29 Oct 2025 05:47:10 -0700 (PDT)
Date: Wed, 29 Oct 2025 12:47:09 +0000
In-Reply-To: <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
Message-ID: <aQIMzXnUqjW_IVdb@google.com>
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
From: Alice Ryhl <aliceryhl@google.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 28, 2025 at 01:22:32PM +0100, Michal Wilczynski wrote:
> Kernel modules that use C symbols exported via `EXPORT_SYMBOL_NS` must
> declare this dependency for `modpost` verification. C modules achieve
> this by using the `MODULE_IMPORT_NS(NAMESPACE)` macro, which embeds an
> `import_ns=<NAMESPACE>` tag into the `.modinfo` section.
> 
> The Rust `module!` macro lacked the ability to generate these tags,
> resulting in build warnings for Rust drivers (like the PWM driver) that
> call namespaced C functions.
> 
> Modify the `module!` macro's internal parser (`ModuleInfo`) to accept a
> new optional field `imports_ns`, which takes an array of namespace
> strings.  Update the code generator (`ModInfoBuilder::emit`) loop to
> iterate over these strings and emit the corresponding
> `import_ns=<NAMESPACE>` tags into the `.modinfo` section using the
> existing `#[link_section]` mechanism.
> 
> This provides the necessary infrastructure for Rust modules to correctly
> declare their C namespace dependencies.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
