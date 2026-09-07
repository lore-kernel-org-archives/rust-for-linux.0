Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7447CC96
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Sep 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809599; cv=pass; b=kihs406CuFu/R1Ev7OYGkO6af69m3obNo7fwzo47PXO9Tb8LVz0d71Te+QYoEQHIsj5iDz/La3JmCnZ8W+OtkR9qRhsf74zVMF4mTbLThGinF0aKXlMrHORzwxuWrAjUaZ1Hvm/xkRmm5lDrWedz5wPRy0RGIxf+VvTDOUcKxBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809599; c=relaxed/simple;
	bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRiRLAUFsrqXaVS61oe4V0G9YvMaKDKLV/IICH8gf9pUuNme4Pp1grE+WyLXsDnrY04VhFNX96ijdbotwytFlEcPgdIjBLMb6NXGV9YHzRFqz+mBGxuaJLBqHQkiBikbwaQZ1Lr9i8vbmTTlK6UdqPzNN++zw/98dQEUOn15Ck8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK0qYj5j; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK0qYj5j"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so436656a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Sep 2026 12:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809597; cv=none;
        d=google.com; s=arc-20260327;
        b=AjBIfVlk3anZqwZDe6rn9YWNULAAwtUAGFgP3QbF4CWm4svsuoRY3jKhybW0j7awr4
         pIuNnv7HwmPjSNO2CZnKyzJrzV0+53WGGwY0Ip1nK4516dBWxBVwQ6/1gLvNloJN3lhM
         llA2EJhdGShi4qhqEhI95SFAEJe1d5Er+CpGe5fktrjsYdB33ryKKLcaC1jX7LkcpNiJ
         dxITPpolnOcGeActOVAX1mpOQypookMEqFVtwkpK80t5rXHmOj1bsGpw+umDfB1zKc3x
         GYPEX5Eiee4kQBrybKESo39k5W/phCjjQyXqSawamiLlmBoN+FdADRgngoa9hPzdBEWd
         2gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        fh=ozBu5A9Ooxhh9Uc7SyuNEzRjKArjeRvFwYQ1fRlTzI4=;
        b=MkWjafUHebd4SQafF8DFpu9PlFK9twLAzUugfbrPi4Brn3uGqgdIb2nJC+oALQjACE
         s5BxNLsBCFv0+/q4Urx20ZdFdm6YZXk47JA4+47ExiaCVTeIAixAT0n9o7WWgofnJHtg
         HkWE0Xh4csz9WJut8H0qb7cJyS/+wfsX5IxzDYqvkwC9i9RePoEa2HnaS+1O8rQaVQm5
         PUolZoTXdTZ1iL9LT3tGCFaI0WFm3znyK8ThJIg31txV3iMHAB46AyKDzrqw/zb7A6pp
         44s0u9aTrDaVzROldIsRZGNg+XkAW3WpJjdmgzsF7zWEeOVk9aXkTU01sxI3ltKd+Nk/
         E8dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809597; x=1789414397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=iK0qYj5js7h9LqZ16ntFi4pR+coNw+J1DIsxddLy2bybdXua8s7AhsQh5PKG4aPy8k
         cWfcsot8Jd3QOFo9QOMLhxclr26W+2bFQXUQb/5htv9RCQ75k/nTYOvsiDpAh9ZC1h0P
         17HYrGhBkPAcaFKfVJDBRota6XZwJTFU94U1d0QKrv1bCLj5OM6vuETU3sDAU1WcF6/P
         XwKGZTES39HLJn7EPOvbTJ556I3rp76dCWF5AVgyuUSKXaJklfe1ypw/YLdAV2Pt4o8p
         oIt3UyGz4+F70fE+3rhKKK66OxHCacES0jUQHDbVEe3CfUFb1qgvkTLFywu8+KyEsrhR
         Wz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809597; x=1789414397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=Rxm2pQXrlt2X3S4h858K26wyxTDmbJySF+Lmv/fgNj9tC1lQVlJshn3KctsoT1chN1
         nGjXPUS1ra7bkZXO31H1rD8fNpamVIFMSbI3e1pSMpJu3408SWTiEbMPp4+G9GdadbKZ
         RxtiszAF0n2ph4zRo0EHru457QyfL2w39QTFz0BQJXJLdZP3d+GV39QPyR463Ihr1HVx
         d7zWGIQ0ks7kzLB+w6+BnzEH80mQM7PFgtvURnxUWn0B6+8i2ka461hBzlampqm5EeYO
         AQtetzHtymFea7ZBD6ntY2CMY8uyGW8QyPvnBcVALFlkmGFxFeRzR8fR+1EcCHNjL7d2
         OxOw==
X-Forwarded-Encrypted: i=1; AKwUvBzOFyuCcoFORUBMztGO/h+Ln/4P8O3SzdZjAalPawgOmMoCVs/ir759iN1YD5LMhoZjw4FiLJCL39MS/GcWdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lWZll3qqajdHr/vnNSBhXnQHgChBpriVUeEOo2h+MHqI+aP+17
	fhQ8GVSW5znv+T4haotEDqEftZlIIsDjC+6e17E2FreDaVwhbO8AtSNCXarDUNXVFIBjAMfps7g
	H3mM6YCtupcC1l7MsiEnAUuOCvVvTsKg=
X-Gm-Gg: AYBFou0shcg7x/RUK1hd6TC2D8wSoe2nSEiiXxoYUzmBH8rZpM409XosvaX8E8wTIcI
	9hiBtvfzG/oX+umOi8xyLeR13g2NVlA1WNFfqLhpqkEmWJ1rBqwj3TEih7C1XjDOILgAsSeLyvk
	7JhFR25l9Xz6PRzUyOUsnjO9vH+v5TC27bu5Kzfq7SRCfTJu/FUE57p/TgY32ZiAAz/GG5SL5Ia
	QILH11SIswy4hIVjrsLPtOviMjk/vc1Cf3NhInB7ybFMUs3WhCaX77Lpoxr+VP2gqnDD7aa6zi0
	AstNyo+kOdmmcFZCilUrAG7phktrdP4kY/y9gEXf4Sl53IVdDJadJlBJd/8uJLLDd1aJy/EE80c
	AsUa8tNMgwYjqJYhA1Rfmuew8FaAwdwHSkXIjfUrfalXK1Jrc4p+2tBxEpFlu2Q==
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id
 98e67ed59e1d1-39b264b24e2mr23088437a91.0.1788809597288; Mon, 07 Sep 2026
 12:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev>
 <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
 <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com> <ap3Z-YDtzmdtMiMk@linux.dev>
In-Reply-To: <ap3Z-YDtzmdtMiMk@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 21:33:03 +0200
X-Gm-Features: AcwNN1UJ5AD1nmjaRgagxZvj3fkfuD3Z7c-j0Zc231NENpcPq2HjO9j40kxIvNk
Message-ID: <CANiq72mVXNmqh-RdOunFLBKRwMgYHFBqJOP7NbXrd8WHPb3sAw@mail.gmail.com>
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

On Sun, Sep 6, 2026 at 11:24=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> # Do not pass -fpatchable-function-entry to bindgen: its libclang may not
> # support the section argument (Clang >=3D 21), and parsing does not need=
 it.

Thanks! Hmm... Not sure if "parsing" is the right word, i.e. a flag
change could still make `bindgen` parse and generate code fine but not
match the ABI of the C compiler.

i.e. I guess I would have expected something like "...: its libclang
may not support the section argument (Clang >=3D 21) and the removal of
the flag does not change the ABI" or similar.

Cheers,
Miguel
