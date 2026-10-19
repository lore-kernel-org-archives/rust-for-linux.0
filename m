Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447154;
	b=JQPevbniwF7zaXQvQoplzKEudAUI2hcqaaRIkjMxzW6io+yuh/DrR21jLitD/zLUCo2S
	 K9IKEdmxzRViL0xIAJGYzB2tZXB3Ix0BBMmVFbdwtOGRj7iV8nEadkmwRnAlgzK0fbB/N
	 U07CL/7Eb/+IbWbmXWN9sO1wDMhLoT++BStujU6L2h0VhBqVa5i+lWMpWU1qqZxtzXVeY
	 Mnirefzpu42pMmdrXqD2tdrYSu3IO43+TqcPjddGZBFQNzTypknW6uGpwFOqIcNE+k4lO
	 7nXDreZDyqvei7EPghTzPjVbkhsgPIyBZfZtCiSFYVy7/ZjcH8uFGbwwFDuPpzigzDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
	b=G6ZqV7IO5NpZN0ThJ07r/GkxmNpMk2FTZXymRy93b17CXxfMoxYs+YMiorAv01WAQ6qG
	 tJ1llb2NFUcKbbX3fh1dxUIA6geC31HN4TlMqL7kbVE9iCHtDFITP3gyOV0KY/AHIi7jf
	 y6BGM109HQkhBREkQ5Jftt2W4iJTIfhDpB6Q4Rygye93utGEDIkqjilEgCpJM/W1G25YS
	 hOQKZ26kviAGLyBfRGdFp8mdpWxXwktNPbN4wViVdUwS0zxFwQWFYnwaBPaSLuCmUj8cR
	 r1gcNOlQBTxy4NjHsVUR0WVigMOqTQFxisJ7EYK16LPAbMU9KQuFOn7qSM4seSj6HHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tuJUcM+r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1C606A31B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 21:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA1C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tuJUcM+r
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so6768954eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 14:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447153; cv=none;
        d=google.com; s=arc-20260327;
        b=SzMS0H96igl1Q38HTMKP40ubrsP3/ZMNxTkKxt9MzJNId1+RCWvHJy0dMWls5pZRhU
         HqBS9dsvoaCm/Xc0vd5TLY4LzP9l4m++Nsl7UPqPOx/s+SNJPbZjUELuGlcqyiyTsL/I
         /P9n9iRVPD5L3w/if9Y2SRBW4XCs5+6A9m0z+UwgrLx/Qk59bsbg+n+101TALgs//gTO
         sEWhk/JGIm3O1vXRcHM7USaABjqfQoOneO2pisVbP9apVgQgHb6iC4Rc0spZls0ufrXu
         XcuiIONTFP6vOGtylxkfa4AK2XULnsDDQAI2F/ToIyDfsqW5oCo+623h3E5KPwYziaeQ
         +NNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        fh=rWmU00LCvzCjJSexlome6JngWgCCcm/q6OlAOLquoQg=;
        b=YGHyypRckgciVP/rGbj2E50jn9ex4ezIdfjIhfHdK/y9VufeeX5mx3lyFQiBFw3H9P
         eT93zy1u7zRt0dinWrUkC/iLfsWgCAS+V4y3TD7Rggg6TOSD0USFSc0t5l0EdGnNuw3y
         Q/3GJZZzCAaAqm0twzF4HfLOmhDFdwHAwxNqOH8owtH9odpupipK+lkyjStWChbkX2w0
         Ytgx3QMtw+sl0iMe2IiLgb9XOgiiVJ6ghMwNlei9YbZj/xncQZxwQhqyeRLxm3YH0lkJ
         6OPexiCNvXpxAsGFUnsFVZfkZU7XN8h4PyoweVBSOZ4SZe7w2gGbUW8woKJkaBsbFROw
         WA7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447153; x=1793051953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=tuJUcM+rzbY1T3hPy151XGwtTm9pe5er0cE5XFCuBgpHlWmauyO44hNPXyaOBU2k5A
         mmnJCszVpsv0Pq9bmMtXp97kD/V8Cp+eTXquX1wdjYCLd+spKFDiaRse4g6thtSfryQ1
         1dWDYpOJeSVm9jBtwKEOpeJxe2u9AETKpgzKcf5Pgu0AjuDvAUSl2GUhJ72CVGdWQTzW
         5/omJaVlPyPmaUUn3+CHecWeNSW0adLhpRVsOlg1CaWGFUs1q2rqEaOvNodzMDrJHuBD
         SyKst/DGammFWm5vbEb+djqB1R3xDPZ4GXpLWq6wyrPlCKvc++5OmGrDG/dV9HqrNCEY
         9yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447153; x=1793051953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=QtVjoBub9Kfh3OcHk4FZdvD9A76NoPIgASkiO88LKmzr0SWohx3Nbn9KY7jTtoFxxw
         hZHR+xivkwTMX20kv0F6IxC9NtCxrG/KwzGL+FJWAVT3iYqc/uLJn/SWtLsU4aaHWPJC
         DjCpk4plWpDxlyjqUuntZLikoFrrrTSutfV/4+XMUT0/NyP4kB7Mm0lke5Qs7W+Tj/ex
         vgBMYUsd5l3rSXmq/Qd4BWBfEPt3RpkEXVMkBMmkXfLWdvMoYwfZJxm7ml31i5xXGtM4
         6j0fd8n+TkSNUwKj/Sk532+T0Z59VGqDEfvGBUfrrMc8EW+iZ6dyFUPL7rGdzhXzF+9U
         B5mw==
X-Forwarded-Encrypted: i=1; AKwUvBwA2FqhQCiselejZbc99qycnc2SdLOCvvnb8MoMxnz+Dkrn6bfampVDRtyvY+dHegY13mDa8rjkfJknmP0GJA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJB27fKoG4zybZEEzug8ayZS2Q5cxBbnH81ktE94ZdLFM0DacZ
	j4V6gmBrEw04tA86o1u796GIkmpt2qRVpv8hu/m/77mXoYBHxxfYShjDYXv12QxFOaTzIoqBlRv
	+3YfsMFpgxbozCc8qX5yk6gp4/tomFaT9EXyAv52X
X-Gm-Gg: AYBFou33iDCPJF/PU691j6F1DvzG859Wru8ulAD0aDbP+WnS8JrbxDpfzgxvrf6wdsz
	Pz5vNCXVvJ6ztj5B7DYgnPK1RZ04ImqnhetrroNC5WUES8yxIqvWuc4liiH0o3tjvGon5sLd0C6
	jU/33g9N3Z6TCqL14Bc7HKW5vE9H8dvIi5LLWxEhDHzSDicUWXJFc/WwPqXhsbEqKy89Ug67xoK
	3AQMAX74f4KRo2utdKHPvWymNz7I9+cxjNx8P52Hrb0YCM3/d3rs5qBpSmh+xZ6SLKslQHOi3LO
	9vLLYyZiAnUiIvD1Rl99mC47DI055adr4wwC+t46RwRiCrFK8qtd4lYoQKaUCnnDZLuKp93+0t4
	ojxEMfAdf6qA=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-1876658f6c4mr9237879c88.6.1792447152061; Mon, 19 Oct 2026
 14:59:12 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
In-Reply-To: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Mon, 19 Oct 2026 23:58:26 +0200
X-Gm-Features: AclHuK_qWUQb64XA37ScTQq_ZMKUMtenjdgDmPfnErmCHixLBqORRUjuSE_XZSQ
Message-ID: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 17:27, Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> > Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> > KCSAN relies on; however, Rust code is not currently instrumented.
> >
> > Pass -Zsanitizer=thread and the same TSan backend options used for C
> > code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> > with C (though rustc currently rejects linking crates with mismatched
> > instrumentation).
> >
> > rustc only accepts -Zsanitizer=thread for targets that declare support
> > for it. Of the targets used by the kernel, this is only possible for the
> > generated x86_64 target specification, so restrict instrumentation of
> > Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> > Rust code remains uninstrumented as before.
> >
> > All TSan options used are supported by the LLVM versions of the minimum
> > supported rustc, so no rustc-option checks are needed (they would also
> > fail, because x86_64-unknown-none used for option checks does not
> > support -Zsanitizer=thread).
> >
> > Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> > omitted for Rust because rustc provides no corresponding option. While
> > disabling tail-call optimizations helps preserve complete stacks traces
> > in reports, it is optional and not required for KCSAN to function.
> >
> > With this enabled we can detect data races in kernel Rust code and
> > between Rust and C code.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks!

Which tree should this go through? The Rust tree? Probably too late
for this cycle.
