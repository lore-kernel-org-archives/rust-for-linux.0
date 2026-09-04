Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE063486E60
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524316; cv=pass; b=BG0lemi1HsLbFa6+bBrDDxUhAvmqR3qdKqGytjbTXdkChsirKEgXaWpZAnIU6wKP+K1p7xRKrBmDp0theWz2BbWyiD60HO8SYqwhzThksGxqHfP4SseCtJILpapmbTlD5HXCkiwVig7ink4nTivxVpcLcWrS4HI22ipIW29n+34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524316; c=relaxed/simple;
	bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwfkOQUR12yvr5tVC2QxmrkXwHbsNsyRi9xSRRq468GND/r9TNNin1nLBx1PYw2iGhUcvfSShEYeFdFNcg8OkYnCjxf/vgiAiN6VJQI2leb1EdxeYg5RS1lnacHhY+eoQeQVxIUA9B0KkTQTOYzhhgECAWwvh61uyztnhIJiHt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMNauiri; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMNauiri"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d8f2ed7bdcso1224515ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Sep 2026 05:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788524313; cv=none;
        d=google.com; s=arc-20260327;
        b=AvrZaNIYS+auALOOrID3zhmk19Gh/7XQn3YD8qqcsVkujsEROdfX9ClspBszI+hfOq
         BMn0Jnw2Loikm7a57mBckhq37QnzXx6jUCr/7qNIDXSpCZgqxLU0VKHfwNF5RUwB2p7k
         3ONoEwBZIx5hFFny9cB1uH9ZNY70hZIsGhrEa7zosCiPbMqoYulw5uvMg9WxLG0urvTV
         a4dwV7Bw1/lsoOC6QefqQC7YK4v7/+xYZrhLNmzi+qr9ZV4vDEauakIy4N/S4XXX+iOJ
         2UO2lCaJ6+qptp3bbJznC4qfGVnynKJSAQ3VcqGc5INjStik96UsUBilNchg+z5WfKpw
         M2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        fh=6BCDXP1xksXGqujaFbwsbUsZgkqNoB1G0jrcJAAiwt0=;
        b=kkW/Jo177D9whLYvmXtr1cfx3D6ivKHbq9pZVRyTu1YJPg8ssrNIdJIKxKgNW8i4Qw
         T2UUxYW8uiQSaund6wxioSfTcdeLneyAb/ItPfbatDMYHD1Lud0vNc+oNnPO+kGXueVO
         AkudbEO+Ldr1TekFzvPCrxYtWUTTiDPy4WUb888fm9Hnu8Z5beNaXDDgeW7JG1EA67Vh
         /5chFijQE8/4MQ4jRtYSVrSsTiBZlItPttc3YjP4hlbRQ80YqAXraW/WcZxwJSIfBS8D
         tLzbiqI/68lzk2u59CUn3KFLmXOMqQZI3D28k4f/qkx81KT36/nd6WW3PHbbJAReg2ax
         etLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524313; x=1789129113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=WMNauiripi6Md2Q3C3KkcuWrocOGGRafMxbYDlATW6HV68aOBusr3FL4eXVoF4vhsX
         DO7Jgfmeno5zhnwRWIgfHvrvUM+3XTG/xFulQb6uxqGbEytQPlf+GGxxMKD983IfwasK
         JZ8dP4XrZbEY8oiEzvYHXjbMf5wbZHBRAbESh+IxlSqcdT149S3ok0u273lxbuoHsZB5
         x3PySqQZGNcJbPkCUFb2OKLEFffWYo+K3UUed1DYlevwTlbFIAr1+u029uYrVRygQ4ml
         OkrtFQlxk0wYKPBPPf39rZeJx4CxE/88YUpd0GyCLyKaJbRs/qop3EUiAQiviishSpQw
         WkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524313; x=1789129113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=rr8BuAn+RtmD30qTDa0d2d7GABoNPKz5xv3XUFF3LLyqhxkkroamuS9wtVeNJ9GPrd
         G5RZuvXqxezBG+zI5c05VcFgcxHt+xme08EaKJssisTm6TzHQEfOv/dyadK/FSXtaEVa
         +1Z1sOH3Zr8hxGDIywJZ3N9wm501ds5qv1Thio1kMraUxa1TLQn4G9j9dsGDPKyGp1uT
         WYRLq9WLrxJVLEFx0wJiopEV9S16jGNLrYzoqSLEaHVpm+5SBYD+ieF9FPc315n2ESr3
         rrUaeKSNcGKyHqiYRuwgIR2D6fgTSIl8CTBDJOeRYnL0HeLy63tx/x8/ALxYzObj4Gjw
         mLaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy2uaodDBCE1R2BqYMsGQ+iHEh0xW2c8ZLuxIn5NsCrNoHaR3K6tGZAtq2QzDNhUmkmHNxrCAN5awncnBqAA==@vger.kernel.org
X-Gm-Message-State: AFuF++kRjNK+LFZe4wHdZ8DDEGSECXfKlffRKp/s+DKMtcCpCTxbMOgb
	zOpGWv2W/az9jFrJnutVqyE5vyYrYxnSToBTlqO1osbjFKjlAVY8qbdmRCkVwP/4PTtRz1Bafwn
	Qh3j65IhFyUHZRE3qTbx6ZHNbdmxYbEY=
X-Gm-Gg: AYBFou2+sLAVyvjDJzha0nOGS9hI9/fvwSc4G5Pj634rRamf43Ll5leV2bPJOlJfk8X
	JSdMI+A2vmo9uUCvb4v9WUocduid1z7PewNeaMwmVxDC5sNgGbpsL66vl/Pscv7jpQaDmoPUt18
	qYsnAuFX77bAi0d5CcNd6bd9f9KkN3JwIMShet4r7hA/lT/Nt8/eTbK5zMUlZrLFvpaCVsj54ZU
	iJIFXSzLXK9E3l3/0fpFKqcWCJihS9JN6PqKjVC5UEl4fjylFvaHxUnH33F70lc+KZpUpsttqFO
	evtYB+JxKE1QQEAttwDO24JpweDWX42MMR8ym73CEfk768zM5ZP0vG698npRUfctdd6M8lntrfr
	hsQtlj4kQ3mZc1WdgN4Adt2JHuOlbnvsYbA3ebK5woMgJ8//b+spIR3xH2Xgk
X-Received: by 2002:a17:90b:5404:b0:396:d28e:b52 with SMTP id
 98e67ed59e1d1-39b26229b5dmr5722108a91.3.1788524312944; Fri, 04 Sep 2026
 05:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 14:18:19 +0200
X-Gm-Features: AcwNN1W-BJa7t0_HMwRoOS4jQPgmmEa3lTrRn_StsdokzqumkRB4EleU3vHebmI
Message-ID: <CANiq72kg3Z5rB28H4Ck+EzqQgiRSSowBMe3YW6p_iNwOG_dzWA@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] arm64: ftrace: Support CALL_OPS on kernels built
 with kCFI
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
> Gate CALL_OPS under CFI on ARM64_CFI_PERMITS_CALL_OPS, which needs
> clang 21 or newer and RUST off. rustc has its own flag for the prefix
> NOPs and this patch does not pass it, so Rust functions would have no
> prefix and a different hash offset.

Why doesn't the patch pass the flag to `rustc`?

(Looking at later patches) Ah, is it because you defer it to the last patch=
?

Thanks!

Cheers,
Miguel
