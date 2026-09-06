Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904E156661
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 16:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788713823; cv=pass; b=B8PPwRKYWS6Jl1/l/vQwQofxVgExHOnzU+y/1Ddeuc4bvsPGN/O0hO2azP1/ysJnP+GiJGObDaonQ6ukoP286OpiQ+UFDxV2Q33/Svyb0A/IOOWGcfhNpuBE/NPrQX6kc6mkDTZoRtTep477dwaj9ZPFrr20q9EiNqfngUOBaOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788713823; c=relaxed/simple;
	bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpc0LCwIZDKd3XbsZESIYyhtYWCyiJTkw/d7h2RUr/9Bm0M/NUIBKu8AbnVmVIjHuNSkwE6KjSJV0HY/Vx29GMo141/qs5ce+Q2ZurVVNS5TRSCZJNja7WW4BSTJVFtD/HOWjNd84sNNbkYeTC4Yk7QTz3/BLCfPB3FybvwSSOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjHPtZQt; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjHPtZQt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso175591a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 09:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788713821; cv=none;
        d=google.com; s=arc-20260327;
        b=M7Fc7sCfvmacgPcF0rTOCjAaufD76MjBG77ejlU0NpgHbsy5gZ50GqDtRiCeqgozGY
         N2jm/rq8OIwRRIOkhE9Ji0bvOPXZqFMuUQss3x5M47oD/DuIVxx8sxYUhg8PWCM52oWN
         3jsuysIY3wWVbyHe/w/GiDFBH6Y1xWRdLRi5rq5coJZltRyOSxsjcjopLrPze7mGHa9g
         zgZghjut+Xx6qxGkQaCXbp43L2SYhUkxjGGiriJSKEwdqTeysaq4sYb/D0lv8s9CAY7J
         c6Ac95JEKXdvpeYapm4tFIEq7tnZU8GPpRNKRNZk+kMYLgpRsxxaicPOY32HUv1tItZT
         Up3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        fh=9wNjybLrbcqvIQKDgnVydyk40cvq6qjugeKlVB3yQ7Y=;
        b=a6bZvM1crYhSU3c2de0DODkaaWADJzBVLaxU52uAXZA0SX6Xe6iD31Y4VCYt6OhFjg
         giIjH5Th4bFvxT0QtfjTARkCse1vsFTB67EZ/hOLSooG9alhuNEA5kMlHOiFm8oWbBMG
         DcLmvXy1nyAMwvvSp2V9A7udimVO+EBU02ZmsY1DiVxQZT8V+ze1BTShCpvx3EjEjopU
         mXHis3K8zrRb2mPty7bFCPJUqH4B6fA4D1TjlEbqTLYJxQRggvJZheU4iE+XNNyydqao
         2l4NR4V5Bb0JWMR7BKy81Y/kDuprcecVCrurxGwC67gjp2cYkSfvtC2A8u631fptzV1W
         +tgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788713821; x=1789318621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        b=UjHPtZQtZlfn+jMBdsesbKV9hhN0VxB45TUW8NF6jsIj/u6sMjuVZl/S6vNiEMAdHB
         Te+UXjaLTopyZrVKblQ6F2RdO17BiDzp8YSjJWd1LjGv8/lpVMX/mJq6tjMcQBGE+lh3
         gkbl212FSvMq4hzn08kjNsXAWfz8CFVxj8DwBvGDcA2V9pboEq4SigdRgrpS5P3lbPAR
         WaeQlpczdSbYO4EXZkRcm/d2DFhfIccQOCyUcacVGnAtc0aqHvm4nD/lvAQStGw+ys2S
         nEMr3QPCYz3NCaB4lrh+lVRBv1NLXl63CMfDijyK5BqBSV6Pp1fy8GFAFtzsiR1Bm/Qi
         cjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788713821; x=1789318621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLbNWAYKOjUjCxKPAnKQtbCBXntzd3CfPr6hFf0UbZI=;
        b=gv3ToVqGTUgpy0KSZBsvVvXX2uir6NVB2jYfSP/LJ90Z8fF7gEIJGfmShOn+em8wDt
         COKMVmthwLROqLGI2HCQUeITRS8jUx5eh3mmtHmuWUmBqUXoxjE/+CZPMBpfpugs1PBy
         s24Py1dD07y7JQO3YymTsONN5zt25+LvYim/+5zmffRGuv6yqqGNMmFPn5/unVaiwTOd
         t5d0HsNUU8YOhqzd2m5aIRzGwUZ9/jnYcwrQoqTeXKxoM7rL5AsYyzp6mX8ZC+uFvegR
         gCKbZHmTN2Wi3QZNaoyOSEKR0U+AfVp58axj8/T5VXJCedapFpQ3gzlU93bk8xFRPfnd
         DBBQ==
X-Forwarded-Encrypted: i=1; AKwUvByy1zyQUiiA3amQ4zLuzd1333qg/xd5NGrcoFstQfMLAo8hupYEXw0Bc5o18yfLx4KBQ3jLvVELE90DTUa6qA==@vger.kernel.org
X-Gm-Message-State: AFuF++mH0JVxClGvSvuQJan9A8LBt9dycRl+TFzfcnOsBgwKQGBftSRL
	G4s9OKWIypYIjZ+IM7NKC1rzvED/LDSo56i7pen67ANzfv8eCXLmN3zjzjLf8rsjQuU0AbOVxCp
	0Ed7vaGsm2DqibFa0w82C81BYsSvlqHk=
X-Gm-Gg: AYBFou3TjnqvrllI+Hqm5kHqgyypb4z2sY7od3nfW/CeyBUUi51d5l4piH9QNKaTRRW
	0ZyFzwGXpkew5EG4iJ9xRu7/vOmMJIONDXalwWZdG1Kpz9ewCR4wF16gXT4vzHIiJA3V61TdXxw
	NHtSZoJZUur5IYHz19IehNtUD0O7NIg8FR6D+r2HDW5bkwqgmS4LxYnPlkYQjkUo6NnXyrQrIeT
	+AsxRYiF1WJ2lNJI73FI2JVgLUelZjJilmYoxdmtEN93G213PCqyN9UUSv+Yt2KY25mZObIWPsL
	ayxl2Fn5NHaWZuUQwfSkyKvSS4nPFLzrhQwhtP2OMSMQhhHYefgakCKz+OSEB1DT1Qe/iDKG3ZS
	auM0nwwLgb0Yb7Tc3Hqh43il+K0cGLthd5RpByKB6haNF0OFLOFccxEHl6yT/N8Uj4AjQVXfY
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr12050791a91.6.1788713821151; Sun, 06 Sep 2026
 09:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 18:56:47 +0200
X-Gm-Features: AcwNN1Vz7OHfpHx7W0dFC3jg8glvxcm1hmRiClFLpwy0F6DpBbL1JHHuwRxDDvo
Message-ID: <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: ftrace: Allow CALL_OPS on kCFI kernels
 built with Rust
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:20=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> +# bindgen generates no code, and its libclang may predate the section
> +# argument of -fpatchable-function-entry that a kCFI kernel with CALL_OP=
S
> +# passes on arm64.
> +bindgen_c_flags =3D $(filter-out -fpatchable-function-entry=3D%,$(c_flag=
s))

In general, one should be using the same version (we warn otherwise
early in the build), but yeah, it is just a warning for now and it is
nice to try to remain a bit flexible.

Now, if we are going to filter this out for Clang, should we just
filter it out for GCC too? i.e. outside the `ifdef`?

By the way, "generates no code" sounds a bit strange, since `bindgen`
generates source code...

Thanks!

Cheers,
Miguel
