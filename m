Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081DE3D8103
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249719; cv=pass; b=eRkbHHXcLZzGFnEaF/EkYW5jDP5yN/8kV8DWoeOdyL2/f8CFSi/S/Eh82R3H4c3ihCqShp97geFbrvN4m0XCzjmvKACAKAe0Krn1N9sOxSvDaYrj8b13hkPN+tplwJ679h0mH1e2XBgY262UXgsh0tn3710bJzsy6ust/6F1gb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249719; c=relaxed/simple;
	bh=p6q8LWPMVa2osOVn3baZs5YxnHGVEKp86xJ2gk1+YxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsdF4Z+k77ZckHdy9AZ2lS7tbNN/zq8kvnTlsQUov1ajs40KIu6+UGiPR5LmDb4GXnJixUjR5sWPZ/zB7M/7oqjBwiINVOVTmXHDLtHBfOQQiDhWIECpCqGITj0e+/3Yt2mTuzMkCLRKLIdjgHhCzd2hO5cgC2UbQiztf6OLqcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4dXThBe; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4dXThBe"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e3b2a435ecso7546957b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 00:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249717; cv=none;
        d=google.com; s=arc-20240605;
        b=SYa27mvqwWTa9rxp/44B2smJUIQDdtBCOFK8yt7iX/GjvLFi+lqa5u34LBgm7Rb8dJ
         IoxuYIlhKPAzML8QQa8MMLFt7KWBFzZ6zHO6eElLIjJd/Msb9ILbd10bL8KXEYewK0uU
         9M0PvPLdyxcf1nRI9OAevCpaH4WLsCaSFRtCGmqn0OSYF8B7x2T+0ZhaGHWnfRAOfuCc
         RkrF4RKUWGQYDdCDCVkL/kSkXJDc/0zSUI93iLrj7TK93fjnNggAjTlvZJHD1n2V+8td
         Ng533zLKmITg+Zx5iDtAtfzpVzW6E6UNGRlHLLQAk/amHXfkczuumGcqIgdsCpaQYMUp
         ViFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        fh=WuX1Ebg89NIXsGipchDWo/wBTVYBzTG/JAuf4GtCt3w=;
        b=FX8UKA9oP8Mxo8LvR4cwxgjCPxHJixcXDfOllazb7w6D9mjbMPxCcd6JT8eBMuztye
         nrB1PEF+D1odSUjbJsPJCQeiEJCUZZiMdaRAbJJtSMUe4/1kKva+XeYkcHpsD1CVbFnR
         bnn8U8aRCzbqPVvvdMIGyJIq130alCJLN/R35O1sf1769TMgP72XVogQRj+ousGRWDhH
         W39hW5RvplY/JlfcGqUg4VH9B5qCFy4xZ4TEbnMOsIlk9C5k8l0vPZ4sTI5EQR9TsVGC
         mdZYyxW2mT8DqLuYgKZ3eRSxHrHd97t8ZtjkzRX1uDULcv1PmK9xSGfOSLaiNgeq/koy
         R/ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249717; x=1781854517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=J4dXThBefC/uv2x81IA7NSuEoWoexazimn8V8DKAXljYkmsI7laNV1zY/Dy0fUxMwi
         EpMDSRwzhCk7HuyVirTGkvjYmqkTO6VhWfVz8ybPjAPhIwsY0PW9VlcBxZzBg17hiUzT
         LJrOnRk++eHkpd+cqkT90bqerl9yX8cc5AYhu69Rcb0sKW7ALA2zafe8fyarShtqsnHE
         jeiQQ/AKg5tPx8+Km/itxnPkgyx6eiKY+AM40UYt/At1csgeOJ78QPt+sXWsWuhFP8sv
         dIUGuFqLLWUFGQ/HavxSmB7IPH0Up19eje2bFm4nUgecG2bO/dhrdAMobt6x5HYpecuZ
         uF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249717; x=1781854517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=WZ1lxFTT6vVpOGg/eZeqeCwBpHEqHMvfDyezQfKheT6Ujt2gLmAiw3C4kbWO+nKeWX
         9lThP9nm1cAhPEXzuvJu9z0wcy5B0ZvcZUN2M6z3XrW6W+VSFA1fvK4zGvJUePNOxs3q
         unzqyaM6gXHEi1rMj+hghJX0dmlC22Oq01gmwJWnYef9ipFs3x4vJzmpgGYR0KOLYIIJ
         ZSSGwMEfMIehYwWkUcftYYZ7GjLOwmYkN+Kn36rsokI34/O2KkO0KmhFBc7sN/xxY2fY
         kdSN94XuI9Eye9xXUxVkXvpMKmq8QWoqlYUUSsNJCIM5iLGGSr5Jcja6Bfvj2kcXFe85
         ltJw==
X-Forwarded-Encrypted: i=1; AFNElJ+pEiaGHWPPRaCxDoZSxy7XymBo47s1t9PRA8Lr9OOdfnGZaDDPTeqAQ1n7kqWkFdlILmkE6YLiJtJyUXpvSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmbT6yRBZHprMQ4iXYkg+HVikBsIqEd5wbEpku2ufbF79nFPE
	PxuZyHMAq0MmraYwYLXO6kTA9MKYuL5pDAL8oB6kRlnJEDztcwWyQI/cS/F8aWnwBk8mmJxhQgu
	wlcXjCqWL4YCwO9ujCJ8DRt297ohHurBF35BCWmf0
X-Gm-Gg: Acq92OHm7CfYqJOeu3Gym6EJXG9j1TQcdshyfv6IrN56Fpk2SfoMIPFHb9EY1bLqysL
	gskOAdRj4eHKzf+e/4+zCVWeW5igywUf9uLa0ZjBAhrVjrjIHKhvGUEK7cdle7/a2ZqD1/vzFw7
	vUTQOFOdqJLvM6lXcpltGJiMJK7MpnMjKuCty9y+zJEtkmH7bXSgc9BR57O9uBkwuoUcRan6ckl
	Spt8tAyS84iYBXDFYi7S8tw5W0pvvvXZP3ORyasI97kjXRaCnOUP4rA1BK2EYSBKJBr/iBig+92
	bYvIcuFadHboGuR1J1aleQphCaLwqz4qMJ+ckA==
X-Received: by 2002:a05:690c:4b0f:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7f7b9020616mr15009847b3.40.1781249716383; Fri, 12 Jun 2026
 00:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:34:31 +0200
X-Gm-Features: AVVi8Cfm4phss8ao3422B1w1tp_vYDP5PJUsvm_ZDGjV7MhrtYD94WvUDwrEe3M
Message-ID: <CAG_fn=WYdnX_09RNs3sTQWn+KZZaw+X9a=s1Uk1bqd3gW04h6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Add a new tracking mechanism that captures function arguments/return
> values at instrumented function boundaries via submitted as an LLVM
> RFC SanitizerCoverage callbacks:
>
>   __sanitizer_cov_trace_args
>   __sanitizer_cov_trace_ret
>
> This requires a custom LLVM/Clang build with the trace-args/ret passes:
>
> LLVM RFC:
>
>   https://discourse.llvm.org/t/rfc-sanitizercoverage-add-fsanitize-covera=
ge-trace-args-trace-ret/91026
>
> LLVM PR:
>
>   https://github.com/llvm/llvm-project/pull/201410
>
> Clone and build toolchain:
>
>   git clone --recursive --depth 1 --shallow-submodules \
>     --jobs `nproc` https://github.com/yskzalloc/kcov-dataflow.git
>   cd kcov-dataflow
>
>   cd llvm-project
>   cmake -S llvm -B build -G Ninja \
>     -DCMAKE_BUILD_TYPE=3DRelease \
>     -DCMAKE_C_COMPILER=3Dclang \
>     -DCMAKE_CXX_COMPILER=3Dclang++ \
>     -DLLVM_ENABLE_LLD=3DON \
>     -DLLVM_ENABLE_PROJECTS=3D"clang;lld" \
>     -DLLVM_TARGETS_TO_BUILD=3D"X86;AArch64"
>   ninja -C build
>   cd ..
>
> Build and boot kernel (using virtme-ng):
>
>   export PATH=3D$PWD/llvm-project/build/bin:$PATH
>   cd linux
>   vng --build \
>     --configitem CONFIG_KCOV=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_ARGS=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_RET=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=3Dy \
>     --configitem CONFIG_DEBUG_INFO=3Dy \
>     --configitem CONFIG_RUST=3Dy # for rust module kselftest
>     LLVM=3D1 CC=3Dclang
>
> Core implementation in kernel/kcov_dataflow.c (separating from kcov.c
> as Alexander's request):
>   - Per-task lock-free ring buffer via debugfs kcov_dataflow device
>   - READ_ONCE/WRITE_ONCE atomic pattern (tested on arm64)
>   - copy_from_kernel_nofault() for safe struct field reads
>   - in_task() guard rejects interrupt context
>   - Bit-31 recursion guard prevents INSTRUMENT_ALL re-entry
>
> Build system (scripts/Makefile.kcov, scripts/Makefile.lib):
>   - CFLAGS_KCOV_DATAFLOW: -fsanitize-coverage=3Dtrace-args,trace-ret
>   - RUSTFLAGS_KCOV_DATAFLOW: -Cllvm-args=3D-sanitizer-coverage-trace-args=
/ret
>   - Per-file opt-in: KCOV_DATAFLOW_file.o :=3D y
>   - Respects KCOV_INSTRUMENT :=3D n for noinstr exclusion
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for whole-kernel
>
> Kconfig (lib/Kconfig.debug):
>   - CONFIG_KCOV_DATAFLOW_ARGS / CONFIG_KCOV_DATAFLOW_RET
>   - Depends on CONFIG_KCOV and CONFIG_DEBUG_INFO
>   - CONFIG_KCOV_DATAFLOW_NO_INLINE (default n)
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
>
> Also fix rust/kernel/str.rs unused import (flags::* -> flags::GFP_KERNEL)
> which newer rustc (1.98-nightly) rejects as a hard error.
>
> Rust support requires rustc built against the custom LLVM with
> trace-args/ret passes compiled in:
>
>   https://github.com/yskzalloc/rust
>
> Link: https://github.com/yskzalloc/kcov-dataflow/
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h  |  10 ++
>  kernel/Makefile        |   3 +
>  kernel/kcov.c          |   2 +
>  kernel/kcov_dataflow.c | 324 +++++++++++++++++++++++++++++++++++++++++++=
++++++

I think the total size of kcov_dataflow.c doesn't justify splitting it
in multiple patches.
