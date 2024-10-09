Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327931991CE
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492523; cv=none; b=XulEt0RuzMgdR6+M1wgEyH17ITMfGlK5XdKGiIUc012YWIxo94HJYZePB6a2pyNSPWYC4BrYL6VzXEONeRwKXo4LDVDzqe+DqcCdiiH7c162E3f6sqMDl+8dGF0BBOxnhspwiKzfMxu9ZWtk5x1zm85xNxsq6cbGFvn/j9t380I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492523; c=relaxed/simple;
	bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5o8Qioq+WKrd4BxkKFr1U4Ax9tJRa3Wcqrmoq0tkxALg8IstrL3TPYbauldSzvLMz5BcQ9RTEJRVUJCTnA/bGfIvKpL/GuJm4SNlDCBNCIVggqzO0bT6Bs708Aynx/7ky5mX7xK03PN66MhwnSL8nNf6pnWr4Eg8ge6ZZJOhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eI8E5mXj; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eI8E5mXj"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4601a471aecso3131cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728492520; x=1729097320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
        b=eI8E5mXjG4M4n94C3oUnOw9TiI1LtFKgAc89jLMN4tAG+pKTcWS0RvWIR7jH9bm19j
         /GCfz8G5BVWkE1htn6EXvuCASneEZH/JUN9wQJ1jXh63jyuYCvj5UKDSnkCnTtsglHSw
         yr1lAyXkGHhcw+10UirGyI6U1ou0bM7huKXkOYTPGERgRzNE8OSrqDINrJq5n1fj/wWf
         G/fkrftiwSm7i05YfL7K4yVSTLKLLW8Wp+LP0lCeGvgoyZYgbGUVUkrTBUdQX49k0Ds8
         X3Ki4Qyb8OoVYVu2agOOliVS98oqkyPX0RtT70JvLX+uI7GCFBPMPkBrFyDwpZtx60t2
         HELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492520; x=1729097320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdKn2odBMpIYhY6Ml1GXd8IVWbn6t3Iuh+kBokXDOdM=;
        b=mTES5uUjwZSITcc/7OjKGwl4UQoMiZu3ZvkPd6xjS/C5GwxCByYF8UwJ6U7bEgGbr3
         33URu/TxzcfaRO1dje4I5zcrH/3xZToK1Gwy/RGsDWZgXyESkwNn0gGTUGqZWfiTUNGq
         TWE1zKPY8W7bshVc5UfO8zhIbTerFf/flB82teZxxlnHVPuP9XG87qZjwAzpSBZHh7Dg
         e893WdiE/qAButl/FTsv83ZIEktkI6ZW0/Z+vfvwzFuBU4RTDDmaQrdTNH8EzeTm2lxR
         Mt/U2mIElX3MNmXJKLBPNtVdbQ3V7+vwxeQoiEXvQz7ywDfQEwbX4SBwNkNWl489PspD
         m9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmQroLCoc4xyz4mOt5+ZlyA0PZmMx4+MYAW3KJ9OLSo62sSAPMMTkh4JhZsEeUwRxoLj0/FtfZ1UEfXbnQ/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU9nr2SqMHNdRDWrhzmkyvIhawjo8rj7/J7+Y6vJmTorB+/yIM
	ncb0kHPbNZK6GW7WAYJgSJMxYE8d0q4a+Q2okcaX2Nt6wrEkJtzYlJc2THqNmdUH7hlff0qwNDN
	thqibrFLBGF4oiQiyKQjVNrQxYeR+FztCA5LB
X-Google-Smtp-Source: AGHT+IFU2+kjwmtE/tnFQrIWgevFZ6/YDFYn29RzthvZHDHMDNxdPEj2AOVBL4hcHNKv+c2nCcFEUJDPNG9SsF97388=
X-Received: by 2002:a05:622a:5612:b0:447:dbac:facd with SMTP id
 d75a77b69052e-45f0a1537fbmr4407531cf.24.1728492519801; Wed, 09 Oct 2024
 09:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
In-Reply-To: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 09:48:03 -0700
Message-ID: <CABCJKuf83gywnbtkJ3d2VfDRH9f6kcf1Bn1Zau5re=4YoV6E8g@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The KCFI sanitizer stores the CFI tag of a function just before its
> machine code. However, the patchable-function-entry flag can be used to
> introduce additional nop instructions before the machine code, taking up
> the space that normally holds the CFI tag. In this case, a backwards
> offset is applied to the CFI tag to move them out of the way of the nop
> instructions. To ensure that C and Rust agree on the offset used by CFI
> tags, pass the -Zpatchable-function-entry to rustc whenever it is passed
> to the C compiler.
>
> The required rustc version is bumped to 1.81.0 to ensure that the
> -Zpatchable-function-entry flag is available when CFI is used.
>
> Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
