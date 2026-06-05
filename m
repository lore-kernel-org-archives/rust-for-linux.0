Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43883D1A82
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673395; cv=pass; b=LaQ4DDTFBrhKa1DCnUvBS2x1tKsbit6SE0xTU/MyQD5kKSUTm+aAD3MJ/nnA5Drx9gnu8c2ihjybOOlOOc5aEjx8iNPuDiDlJMEKs1pm7YzKpQj4+fhb8pVScmvRl8nOufgLR5cdoWstVAtOe1cnF54qsKHX2OLYHrLbraeppMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673395; c=relaxed/simple;
	bh=HON0Vmc+Uv2m+9L/ARZIecJdRDIMB40cGZIqinKUDVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3joPW7TA8mFxPaUsaxpOubYy88ZJat9Ob1e4E8GF7vgjVzXRFLG1qJL6nPAz18iC5Jl005GbkYutwNbY/vayYXopdTkO/EG19y+7mTYkKQxHLmGA/EX579Q34sK5bEB+Q6imP2er7ClSjcH3ChMTNiZWYGdaHCzrDrR1nqfRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfjKaH31; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfjKaH31"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65eb226b1ceso2070243d50.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 08:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673393; cv=none;
        d=google.com; s=arc-20240605;
        b=CZZGftE5w1inbGMBxfeqidsd3Ep5pMeZZT9MSyyhh5hpT75PtlYIWl2VRDikBh7krC
         wdRn/Y894tF5P0wAODUnNxeMspxg7wOS4Raz7T+eabVFD/Egd8uple0ajQMVoAPORkd1
         reb+J+foUD26MdlYZrgn0Y2E8RKVt218NXMLWkyvvh9vJNoA2Hn+DeZDXoKw9KI/ZwHJ
         B6v01f3SD4Cafi3UWgO9Nz7BCGKZkZlTA8IGc4bUG3JE0QxaTlqIo+GgymDxAUdlYXEe
         IolT9C/Qw/oKVq7ukS8z1zQQ+Au3RJe7EMyMAqhfxwrPEc/hzlq1HKC4WFObC91Xwq2N
         sOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        fh=EbN6f8R6Q1ZJCt7SPdKri04h4QqxykPPr4R/0oPM6dI=;
        b=FqJCJp70DGAHHdUtTvbzSW44PaW9ildRHwhfcwdw5PmYjrcgmc6ZcRHzlye/KwV8ft
         powt5E4EjHvTVMQyWWMUFPk+mv2K+5hDdpxbPXGP+rGiJ9ybGap4/LV/WvOzISbb/Stt
         5mIbYWu7piDqheinqK7KIQv8tFtLGK3BPLiskVAWVEK12ODiBLYPUtguM0RUSUL7iRBR
         pYAUq5ddP+ljpS2uhcUzGu7pY7l6Est4O8gcP9f7QCvdgizEUJe5C8cDsfWjGXg8ROtV
         XeUMk1Onj79e/hxZJQxis9ntR4lYaFSo/cY2aNJXPuyjqMdjyFSAXB0VUVEg3HbA5MmO
         lBUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780673393; x=1781278193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=vfjKaH31f+6lQ3upr3PyLRn7MmHU83cfe6ChRbWCt6goUMmPn2jl0rIxPRuESMehyx
         JlwTecA2zsdBdZC4wNajqJ5tDdRhJQGdek1KUAkuSSHnGu5wWNW2zv1FfOB0xlenlvV/
         VHn7ZyBcjHa6J95xUq4/ZAtc8sWgBoZ77jSXpA7Pz0m0mi/AmFceYT5SX8KeR4OKbF8i
         ca4ZQHinJp2Df2RyuEkyXaob7WN7ZZYduCGItkdoLSb9PG3FCvNHZhWe0xqF+DjyL434
         KWUAuftviQm5BlqZ+VUauwjVyT3tZBBP5xYBIFkV3yzuE+6AZODAPGchOCzvtd8BH/4r
         jiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673393; x=1781278193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=qUp/q2NK0FblkOmgPZcs3NKrlA07wB0dRMGhyXtEALBheW7X537Swt/XlOYkOsQdep
         m6HdnWOTgM9t+QHpIYhrK41IZMzCJ1svwYTfoGwb36CReZd2CfQGPKDpI/6ZiUovxf5g
         LVvYkYZr1hAV8KqJNXTjsifnlfpGnjH9CQUl1CyLFG5ySvgN9wH7eFXxEITJnwxry8C/
         kUcGyMYghXXDhv2g04KVgqUsP7O97fC83uMo/g7u8w1TsnJpLPe1Z6mPcJma+TGBafdr
         WSYYFpqigI07htBj0//OL8S31NxVvKLFL0T6J16UDLkMhSpuEFlreEK8N6s65HdXq1kZ
         14bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eE7eS9057Y8RTPzm6DQfFFJJxXBUIcAO/KiDU3XauOtSvIj6nzJoPP2ya1Cj7sf3FC/kxm0vY6oMh2EzcKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1w41T2+oS9QC4mxJ44BnKISITtmf5iZK6dTAlW1Q8D6+J4lss
	VE8gK0Ff3W2bSFintXG4l6I1FNSIbOnNqKZBQBTn8HL31N2PmqqgQUrb8YRzCUfMNDAyhLLALjp
	XpjJ1PWK47MzNCFy9eEU/2BPnYP8hRxanz1Ac7nNG
X-Gm-Gg: Acq92OH1gHyf4NllHnf1aODX6TqbAIBD5Ch/eNru6u/ftf7HK2a4VZsJWV8sTI6RV6U
	hhl7CE5NcY0B3yHb3gpYVQ/AM961a1pRLoJLk4e3jbr2WfQYAa4K0Me3+cASxIGgeUeIc4OIXaa
	YAzQKc5LZmEAoikIfGyJ+ebyY9X2GVFcV8Teq3+P6t/ji0ZAjsAhwuUIpiqNqtOLSTOyRJzK1gQ
	leNcDJDfwNya9tC9mPcJpmUqkUgj6bq8tzQayCHBkEPdEpNGYHETvqgoEsIau7XpN6aZPx+HWbC
	hy83eozhFEqeHD6fKO00JD8MlRgfdjdgPjS0H/HkK08TM+h4RSc=
X-Received: by 2002:a05:690e:4848:b0:660:8e61:1a3a with SMTP id
 956f58d0204a3-66106e3f6aamr2683179d50.19.1780673392488; Fri, 05 Jun 2026
 08:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:29:12 +0200
X-Gm-Features: AVVi8CexkL34vp_i1CuA85Czs2clQeB-m5POHKFPZIkxmr9X1YgpCn5QeGEQ9Pc
Message-ID: <CAG_fn=WavwJakpE35nc+SC2pdhu7zAtS-NTGuzsnDo=84pX8zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow instrumentation
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=3Ddataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
>
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o :=3D y   (per-file)
>   KCOV_DATAFLOW :=3D y          (per-directory)
>
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y                                   +=3D -fsanitize-coverage=
=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y :=3D -fsanitize-coverage=3Ddataflow-args,dataflow-=
ret -g

Instead of adding debug info here, consider adding a dependency on
CONFIG_DEBUG_INFO.


>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export CFLAGS_KCOV_DATAFLOW :=3D $(kcov-dataflow-flags-y)
> +export RUSTFLAGS_KCOV_DATAFLOW :=3D -Cpasses=3Dsancov-module -Cllvm-args=
=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-dataflow=
-args -Cllvm-args=3D-sanitizer-coverage-dataflow-ret -Cdebuginfo=3D2

Ditto.
