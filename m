Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C01B1201
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106431; cv=none; b=POti5wQqH+HbDkcwpA/3SK9AzOl3/FgS0xxB3I4Hl/Aoc4DKL0abc/p/dJSt7qM12dKpJ/IYsEPXc7helrxmkuclt+znYNi8bIUhAUqje0CxCwXuUtPX2hVJmjn0pmad4TnGQGmAbx1c7jm4vn2F9gdSbtBGUFsrpnogmy437MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106431; c=relaxed/simple;
	bh=/PizTQVDlkIyNELY350ZONH8Gfc08NYf27/JwjBxgRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ8YUdQHCL0LcKvX7OrUE9euaSWCWRJNXmwFeT7bEYvEUNKOvWKY/1PMSQ7OvAHI8V1bbpytirz7CnCAJnEARpKLvko4S60yMB5S6nd1+ROX6hBWcSIRc4Wi85nc4tf4rjxQB6kCrWJAEpEq5blSaBpCTbTwyEIVu0kx+ZZpTLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fu1hIWQC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fu1hIWQC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1faad2f1967so13899635ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720106429; x=1720711229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMtQ8G7gYG0PtXSm+9oSte5ras/tptARhMk8vAyTBpM=;
        b=Fu1hIWQC/Sh/lpNuKEDxDoKokku3Y7aOEw1EuiIfNAFF3DTgfpsDw0pYkpgzopT6Xt
         7UECkjZaO5+TPym0K8iv7eoNWcZrmT9O5jfpKVGSkISRGVKggSoes7aGcev7nTsp9gA8
         fPXKDpkUfOp7Txy04cbUv9T5KDpQ6JLfrObHuQYnVGXn5kpt3jiphDkj0hnbapEDZFpr
         6ncJvtDOLQAtaBAZhDLGfZmSg0jeGVZD4R3WFlFeJwXmbQtYWUfYHfN8G7RG2/KTM16i
         Fh8SjLY45v6AX/qx64phLWH/9KLyYu1+/8RZwyMDiRV+Z9dffxfFgA+787OpAisg5HaL
         k1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106429; x=1720711229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMtQ8G7gYG0PtXSm+9oSte5ras/tptARhMk8vAyTBpM=;
        b=MWsPOgN+nbZdnpfTK7HoyLrK4K/0NhxA3kceFS5r0GnnHSSmPhKFD02g2CVlnwPe3k
         7YomdpJCF+swrlabk892ZSSLelEDPwZQuDf4vVzGYRZ6pBrV9Fbh1txXx/VvBcO0mr/M
         HB5VGB13S7Iv735enqejFwPJsGWMbQfX42coR0NVlBNz+nAUit1Y9wy/hVAwi+0H2SNQ
         +3QdgQ9Am2rKvWRSANVwrwVmYfgHooRYGejl0GR4TtzN5z5Ul87k4bc1GmZ4deQ0otZw
         XEV9abTsiNDaEPS2W3/iQaDWAarwzJt6zGAJT4eQiJoSGdQgbhQ/SbDM4PmH3KMNj+u3
         1a4g==
X-Forwarded-Encrypted: i=1; AJvYcCWybHq3BAAGGESy0Z3obw0b70D+eoCsVWoh0qKtPFd5EFgzAXK6H1jRkrKT0cjF5ITVnjwH54BpUkEObHw+H0s5qUd+fELRar6ZJe7eQMo=
X-Gm-Message-State: AOJu0YwpsUsxfyHaomfLcCGX6q+oz1bXS+R3bGthhGfmFQyhyZr6Hjy5
	sNB8XiNCS6Haoa7BisguqX6EIufDh+SivbamD9AJ/ZpXAsaZAivzEcSXw17A5Q==
X-Google-Smtp-Source: AGHT+IGCoEg+2iwgq2yFecGonukG4K9qxoer7A69funkZsv0Vc/pIw4JkTQQWYN93RAWKE9BO0pBlQ==
X-Received: by 2002:a17:902:dacd:b0:1fa:1a78:b5a9 with SMTP id d9443c01a7336-1fb3700ccffmr27138855ad.3.1720106429108;
        Thu, 04 Jul 2024 08:20:29 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15388bdsm124081885ad.168.2024.07.04.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:20:28 -0700 (PDT)
Date: Thu, 4 Jul 2024 15:20:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Peter Zijlstra (Intel)" <peterz@infradaed.org>,
	Sean Christopherson <seanjc@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 2/2] rust: add tracepoint support
Message-ID: <Zoa9uMODCjTfM741@google.com>
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
 <20240628-tracepoint-v4-2-353d523a9c15@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-tracepoint-v4-2-353d523a9c15@google.com>

On Fri, Jun 28, 2024 at 01:23:32PM +0000, Alice Ryhl wrote:
> Make it possible to have Rust code call into tracepoints defined by C
> code. It is still required that the tracepoint is declared in a C
> header, and that this header is included in the input to bindgen.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  include/linux/tracepoint.h      | 18 +++++++++++++++-
>  include/trace/define_trace.h    | 12 +++++++++++
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/tracepoint.rs       | 47 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index 689b6d71590e..d82af4d77c9f 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -238,6 +238,20 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  #define __DECLARE_TRACE_RCU(name, proto, args, cond)
>  #endif
>  
> +/*
> + * Declare an exported function that Rust code can call to trigger this
> + * tracepoint. This function does not include the static branch; that is done
> + * in Rust to avoid a function call when the tracepoint is disabled.
> + */
> +#define DEFINE_RUST_DO_TRACE(name, proto, args)
> +#define DEFINE_RUST_DO_TRACE_REAL(name, proto, args)			\
nit: IMO using a __* prefix would be a better option to describe the
internal use of the macro instead of the _REAL suffix.

Other than that, this patch looks good to me:

Reviewed-by: Carlos Llamas <cmllamas@google.com>
