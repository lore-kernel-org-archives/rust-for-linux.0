Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0D920C001
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 04:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763699879; cv=none; b=p0GBPJqfmGrJQfPgG1/SytKfOHhsVnCcFQmAzvpr99NYwtyieXfrefCkzRlnlGVp1fnrb9U/hP6BvyCuAnDtSsejMkhnFuguLlZTwht3efnhQOHxh38glrq0hM/LJ95fpGvz7WfgDDZo8ntHTnqjwFmqaVwlrXDunSQ8PANtPRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763699879; c=relaxed/simple;
	bh=6s8PHWdOSG+1W/WLK0jEINIZHtjaB4NfAJ0TkZr4vkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuL2JmnAMJ1QQbQcNlhEy95tiuFkjS7NI4h23rlC7+watcT6sldiKW6zxB6jGkF0t8dGjRvWOEo+qFKVmtzeRRivyoGuL60D9ARY9zotGeThh0E8c00/elNN8U13mjdkCiwhTumw5GTzwRkE09joRCVlgLNnbMPrJD/98JQU9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH2LE0Jh; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH2LE0Jh"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso2498876a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 20:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763699877; x=1764304677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TynGywYl6RyYw3CZDKcyLY9zDRebGixEzoKG3/4NI9s=;
        b=KH2LE0JhyE2zTCeE6mJ7eikYcUCnr1NnkTjUf1TqnZlHxYgIvR+bDQv49e6oEFxwE4
         LZSUtsMolUC3IaS2L01wFjcqaOyKH5VNIhIFDuicQN7Z+QLxV/EHJrsp0XcAX6FHU+GG
         mx/W1l3O0sy4Rk3Egi6NF3tEU3ZfecQbPgKKU4q9WoH2rEfqEoInHC2Gn060HcWlEuoA
         pkqIuNMTx+gbXho1zJLRYLqyfAtS+p1y98daRWPlQUKoCYcGGZp1jNolshSXT5u7wFPm
         qShlbs9z5b87A5Ob5IlBB6SutBoHsyHi3utJMXBRvbsHKnXE8i/Vg7nXeZI3SdPJoS3d
         M8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763699877; x=1764304677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TynGywYl6RyYw3CZDKcyLY9zDRebGixEzoKG3/4NI9s=;
        b=EJcYQ2+4C4YvTtGQ5c86cFpkAmhkZb/EHP3bR1zKqi3tGN41qTQCswoUcmwIvvtiKG
         LLyazehH9FtL5tKYBRq8iC/g/xkpB3eascfTPzcy+OzPj2QX5IIvzOtLiQAfFznqJ8ws
         FZOUBVlwZNjjcl1KYik+sPsMtaAxs2Yu92b8Akc68SAB7PIjg1+ZrlyYZ2TH52vQM5wA
         SEBev+fpKc84gUKQYWj36afgtS8QfaSMU1dwzxEubzaktNP1GSKPNxgnfz5uTy4spuMm
         IKVoOsOz3uwYUpkLtLF7ZR9wvSKcjzUJcPEOQGmgh7hJNRugNLce6vBw0lNh/rZF5XCZ
         8jNw==
X-Forwarded-Encrypted: i=1; AJvYcCXxncvgvr8tOHpByy9ZyJwT8JbnarScmnnOWc9JWJ2v7TchfD3G5mL0C6FReS/8N4hgdL6SlWpApWXgrZuEeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmISTVDm6g0/IQffQXem53YuQvEF/Gf8yhrHQxtGRzLA8ZRPj
	rtTrJT/L12jcCOmazt6ptmehrsUEcZ+igxREYp+3MiTYxuNGQHpGRkfc
X-Gm-Gg: ASbGncv7VNWoYkTyouu34DEwC/lwe6q7sNecWC9ZnpYeo+PxO35V1tzUSBqTsvMjG9B
	LDkk9ThtF8em/XYfslIhc+BdzwjjMXYlC4kgM5N7MZTjLa96IR/ZSbzlhHMPfL59ZyDERNHxaPI
	/uwbddrZ1FONWjLZ0essQvRs16PsP3LV+04fh8nQKYAFlZU6atm3gBOI0BrB3eDUZ4luYYqgz5h
	/VBZKs1XNwQ7gdoTX8oBOZkT5GmQb76mSaYxdTtHuDtS6xdFIijBoMjFxwuBvXpK7UhM1ihxx2x
	7eVkP3SV6YKnd4Jmh6mOIuRMD85GPgo0Idm9gMoifRo44FkrtW7ML5+nAYmurkJvxa5cej8tsK7
	vTjVjRqtKocI59Z+zPMziF3GsJLLf1p/aObOYUuN4qJA5zb3JaMrdUdu+uYwLkhRrKWVQLS6RsD
	1hVDuQMnWONHfRGkaLMFE+fQ==
X-Google-Smtp-Source: AGHT+IFpy8aEMiz+rI49VLVFHENbF/NAOcnRM7T5COE/u2FbKYQ0ITBcar491x6jUidWBixZMc+Z+Q==
X-Received: by 2002:a17:90b:48c4:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-34733f163c7mr1355810a91.19.1763699877463;
        Thu, 20 Nov 2025 20:37:57 -0800 (PST)
Received: from localhost.localdomain ([104.28.217.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696cd4sm4150711a91.4.2025.11.20.20.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 20:37:56 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: gary@garyguo.net,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	patches@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH 00/18] `syn` support
Date: Fri, 21 Nov 2025 04:37:47 +0000
Message-ID: <20251121043750.298843-1-y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251110135927.05d83da2@eugeo>
References: <20251110135927.05d83da2@eugeo>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gary Guo <gary@garyguo.net> wrote:
> I can build with these patches and I've verified that libmacros can
> indeed reference types within `syn`, so also

Hi,

I've been trying to apply this patch on the current rust-next HEAD
494de8f67b1e ("rust: sync: replace kernel::c_str! with C-Strings") and
test it, since I need this series for my future patch revision.

Unfortunately, when I make the following change:

    diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
    index 793f712dbf7c..084633b517be 100644
    --- a/rust/macros/lib.rs
    +++ b/rust/macros/lib.rs
    @@ -444,3 +444,14 @@ pub fn paste(input: TokenStream) -> TokenStream {
    pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
        kunit::kunit_tests(attr, ts)
    }
    +
    +use syn::{
    +    parse_macro_input,
    +    DeriveInput, //
    +};
    +
    +#[proc_macro_attribute]
    +pub fn dummy(input: TokenStream) -> TokenStream {
    +    let input = parse_macro_input!(input as DeriveInput);
    +    todo!()
    +}

It fails to compile:

    error[E0432]: unresolved import `syn`
       --> rust/macros/lib.rs:448:5
        |
    448 | use syn::{
        |     ^^^ use of unresolved module or unlinked crate `syn`
        |
        = help: you might be missing a crate named `syn`

    error: aborting due to 1 previous error

It appears that the vendored crates are indeed compiled; I can see some
build artifacts like `rust/libsyn.rlib`, `libquote.rlib`, etc.

For reference, here's the sequence of commands I ran to compile the
kernel:

    make LLVM=1 ARCH=arm64 rustavailable
    make LLVM=1 ARCH=arm64 defconfig
    scripts/config --enable CONFIG_RUST
    scripts/config --enable CONFIG_SAMPLES
    scripts/config --enable CONFIG_SAMPLES_RUST
    scripts/config --module CONFIG_SAMPLE_RUST_MINIMAL
    scripts/config --enable CONFIG_KUNIT
    scripts/config --enable CONFIG_RUST_KERNEL_DOCTESTS
    make LLVM=1 ARCH=arm64 olddefconfig
    make LLVM=1 ARCH=arm64 CLIPPY=1 -j8

I'd appreciate any guidance on steps I might be missing. Thanks in
advance!

Best Regards,
Jesung
