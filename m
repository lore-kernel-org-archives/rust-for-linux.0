Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB83D7D9F
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902000; cv=pass; b=YcJx8CXpv2ID9oQBhzzdT48Sf6T5xy5y6V6XgM8QAzRnjIi+AOhY/Q+92IoXn+o+Ya7DPldUkHQeSdCQNlpk4S0hXheZbKKp2yp9LVCvvf6X19K0IFq0I1c0hfdbreZyUwPUMfpo3b3pF+Ddp1/0GE2NTEzNLJTw/BIvUVCNF2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902000; c=relaxed/simple;
	bh=ABcg7txfjreOEvrgYloSz7dmSAX99sKg32JTqnOhFhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG4oPeo+i/wdEa01HkpvOoMycK7a2yr+zEVBLETRc0XoEpEnLDRhsJhMgvmP8O1QdL6tpLYSKDaWBN04qcIZd2AKrbHokaMYwMvlL5K/rmjPd4EDqgyn+h6ak6kpxzP4L93roh61PEla1EvTJjKdqzFNeCElf3axe1LUJu3KXUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPf6ZmPD; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPf6ZmPD"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed443so1306121a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901998; cv=none;
        d=google.com; s=arc-20260327;
        b=WVHeocXXF5YGuC3rqZ16INwhGeLy3suvpims7xvmxn2zewHiLRHDuj2EkfefcdsJLo
         InakjLkAZe+klro6CfltUOQon/vFkhpRcmiCeUQ+uRHV82ftedaosKASz7F8Ql3YVVS2
         W/5Y0fbV69jQxIAEx7orCUdt//tJVSY0JiMMBPfdXIvkDPej3XPlQQiEgtHetZt+7eXq
         4VrSzAp9HYUsfuMwWj3+qoBkCkeQAn3L8LAz9Auu63F52EQcYVrn8uS7hJRS8wIZZEa7
         OLp4DHr6vUxczdRa1yYAWIuW6Le1ncrBUqt1xNbxHnoaMG/SWnkF8VyAYPLSlJOgQ6v8
         myZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        fh=MDhplH7Ejogr3eRCpjGozjZJmwCN4qVraPg2Z6Za72s=;
        b=jrkHIMmLhJbh2R5ukjWn5MqJKNTpf+dKBkoLvXPD9iiNZhUUbahJZodWvYEqf3v1fn
         WXma0UOU6Sis3iAfQmgGu5tyClCQJNacpRBTw8KqWZkuifN6SgYHvEtA6hZUhl4R4Ejl
         PM4BkkrKsGS3ifW+NoldB/5/6OTmupUQfthZXVi4vA+DJAXqN3gN8GMN5Naze5i0cvLW
         /f6yS/rwLLqVIKXvS/YlCLKLtm+Y8D77Nyh9MH4hHhdyqzthDR4Co5tZljF980PRKra5
         vClL2vVVnVJAk0wIIXWAVki/5sxaOiDXKO82Ff4WZGaKcRrIrKOaaYkPVkvw/HLnDGj2
         BqeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901998; x=1789506798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=kPf6ZmPD2v4AefzfbB96CY/1Ro8ul1IcFijnGdxXVXzXHHTesc60tRNbKo2R6qNiCV
         COm6UKvfUu6Q7EJ03xDCsbtZZbD+boDtakiCuWcq39IiGKN4AWNMMaVstLpEFMUY9fs/
         fA3Ai9ETukyNfyw4rNxQfgzC3yRmNdwLUvg5cs5n0LI7BG+oMLyNjugmjmLMSwmDxeii
         iJ9ESmD+qArHzXwghsJnFKtjbvVeFcor+5i9UXIjBUduxGmJNTr6bn/S+Vu/qGuE5X55
         I4+dUgYq6dDOehzn331667NXRaNpuSHWvSLVHlvtNcNxcI1Le57wdyswdbpjKOR//hsO
         L2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901998; x=1789506798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=ns6iaaN35awjoV4PATqOsgcL2poNnS8Aa4vIH948VRc1yctodAe9vTKaVr5AJFGtAg
         N695dA5NfLQuqpFZ6gPN0mO9xVXooZ1Zgbk/X8xwuS/F4YpStKX8Mjs2Ys80IdKv3aRf
         Wh5lLYB43QzPUwA4olTh26o0KBCpkdzZQ9VYeO5SC3O+hNo2Z/mDVzphlej0KZQO5nWJ
         OaWeRcwdFDDuGIPzT+JuoMZLvY45+3d6WThwEfZv0/jW4aL2B4PQeEqGgh9W9DJZK1vR
         Za8ZDWr7HMME2d1fEqjDTvgW5LGRQvwrayrywoS91VznBJmzvtI/7jPkA1KEQI89n98/
         6xYw==
X-Forwarded-Encrypted: i=1; AKwUvBzsY6eQdiUWril4d6KJkoIXjT3EZk74H4PzrLGBI8gHWiXHCjTHTCSuLtSBp8f86Ntzb7qH+zb42nsWnJoFKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJxtoHU9TqnapXP6fMo014LmYi667rMIza85eu5YtgwDKDnkO/
	XrT1alxueS7yGTKSRmY9XP7JBM6g8RR7T8qH/OxLBGCygKTmtf9Ia/azkpDnsI5IQIst+5+uRW0
	JM/pcWOnV1cwhTr/Vs6NctUfx2GHiuS4=
X-Gm-Gg: AYBFou3ce8KiIi2A1O7q3lDei8oN6gK0uq0gRNKGlgHKsfTP+eotVH7/Qmsc/e7Tn35
	lVBE5OUUeUKDfgid8po8fzlpgoJ4s8YZz/mNj9PlbtGtzVqzv6DcnG96MJsRSqFtKaWckgy4iKR
	7+ckIQkdkvUJ0qajkHPcJjZAzduSaZm9ktqNrhiQVXcclhy6pqfoEKzgUhsFFv1Nj4//DrPjgnd
	LS5dLvrtnVpm8hJ1tgtlf1YKSJb7dd7OBDWE8QeJB+yf+TMAuz9cQ1Nq2VQECPuQQOaq+WIQS7F
	xctiLUpRwHY7AgSRvY1mQh7Wz72MlMqT3VnujM+a6s0GXtk9c3DwiaCseLSI1yzyA/h8CFWkrtL
	85w7KpQ9UQeCMZ1Iz8Bf3Zdw4QwjJUYYWgZ4k/1Q5UXHLdDeodf4otWFxq6hSXit13sl6/XBqyu
	eobgciCyhu3/CANoVGGmVCcr4pWFAOUED+nnIM1x2gDAIOjRRiIIA=
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-39b268ce386mr30178901a91.3.1788901997757; Tue, 08 Sep 2026
 14:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:13:04 +0200
X-Gm-Features: AcwNN1U58TdOwuasMFef5tH_3N3xyJMe8mAu14nPZtzZCuWKC0n_7MgG3XQZVuw
Message-ID: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:59=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A future -j/--jobs option is planned for
> rustc:(rust-lang/compiler-team#1005), so check to see if this available a=
nd
> if so use it.

This is already implemented in nightly as far as I can tell. If it
weren't, we shouldn't add it, even if planned.

(By the way, could you please add Link tags for those URLs?)

> +config RUSTC_HAS_JOBS
> +       def_bool $(rustc-option,-j8)
> +
> +config RUSTC_HAS_ZTHREADS
> +       def_bool $(rustc-option,-Zthreads=3D8)

We can simplify using `RUSTC_VERSION` for these like we do elsewhere.

Cheers,
Miguel
