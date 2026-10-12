Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88208496D4A
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817455; cv=pass; b=o94sWfBPRUPa9E1D+PT8Oj2omPDVX64PjMUsR0DaPVqLyqCPOW8n6shx7Zs8UoACzPBTLdPqe6MU1s5wcxj0rHIUzNZH6oR86v1ggVfgGseAYL1KUXcRu8ykTEi7/54cjmxk70innF/PS+b8BzQTvqG+hbnjx9EsH3D8k5bcXjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817455; c=relaxed/simple;
	bh=ct2YHHtAR1NATrFfSOMu/0HJEb3d5oH3R82Bkhe1BMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrJO2JywRsBTv+wutKXF4IcS4PlkBfT1YiF5CDWe/nzESSb7voK4bo1W013mmd6Oj9JdAIAcWuMkAP7EYRomK6vdnbRnnbg5KOxqSS+bmPTBPywzxO3CP2GU8dhG0hLWdJqXPPwDj3bhWCq5RRK6yiahLZ3npHKA1d/jsfNlkW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UQLNkKpx; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQLNkKpx"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-141395927feso3522158c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817453; cv=none;
        d=google.com; s=arc-20260327;
        b=h07myS+xaQIPA5qec8mqJSKTBeySlP/KGJmIteqcPdwuWEz33Yipcp/NJwsowibYIJ
         4exHyeoG0OWpdMTck3QiSu59FT+65NPNhHTvRLOHJO7HWjsDHOm9uiMAwSNe3s5BzYYC
         klM3xzV0FT0x/d76QsK0Jnx6I+LWiNqNHFCMeJovk5VE+cbI6aOSN9adH5HyiqGvz57s
         IulLL+UyJ/gRt0eV3KBNXSF3f7+QHZQitrpDWVTdj896r+L0Fx/VHgz+Z2U56x4hVwYL
         iPHBT1i1P4Zo0Igpa6HVH/YPx082CadHhEGY70sBlMEjNy7SXEhX4tUu7c1CvsD0OGHt
         nGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        fh=V0I4O8yx1tjBtmnuM1VYgzayfu83o6Z6A0REt2+Hyig=;
        b=Wit8lIS6SqYM3jugkIZgHNuIqPHBtZEjFT3ohBUewHS45skVAcaX26aQy5Rp6an3Le
         3/t3b08v1cYm+IfZXPKwzW0Eg/Qqwg+/Iolr5K1qm2VTU00bryc/h4yQ2e7XDLzv/7R9
         efl21YP+N1n1wDOIZQONSoeLXrGBVsvlaETL5KJLB22edFbIcTfO7XqyL9wfDQwXJ2SY
         eS38e3IA5wo6hnNzVV4GolGoDTc9Kh1MEXLGQQ02CWdpz0Oeuw8JjYegStNofK5IRi9R
         QDRbjhJlGnqVIJd4vwKGLnpIZ69anMBrks6XQGK2i82gdmCe5NKLmaR+BfubO+TL2lnj
         /h9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791817453; x=1792422253; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=UQLNkKpxiED/3rLDebPPzHQNo9S3ltEPBplVVPqpzbHizDWYA18vZS57QxXxP1A6z2
         tyuekghDEz3bo7p7G/cSFNt00HHb016Bn1itsOfrdUyNqZUHGfu/KnTCtzke+KLD1VM6
         2viGgAdDy38b8jdj1JNHDGxyVHjgmzBHbBksNjVQzaVs8R3w33HIaqghQxOjxCQrmFYS
         cqSbGPzzamv6t7esSOGN9mc7d5yu6dOcBNGQR6QqjcMaPXBqYA3fbvsvKgj0U0vZqdRI
         P1a1D8+JShgoN81aBsRd5iaCpEUZM/oNlhA23Pl3oWtJYJ6+QQUuDCqLLn0pAiyczeGJ
         bHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817453; x=1792422253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=MOqL/njuG/7K4T5aXHyhaHWF+1hNLWWx/dE1yhs/FxlbS7eyWoRf5nxBvkHmSFLf81
         GarDbj8MkOO7XhylRx5lms/+AYETdvwRoQNkcmlC6lii7s0sVq53TVl7o+REO6n/R6VT
         Sov5U7cG6e8u7sn/289GJUTyRNiZf3zMOq5RouvvqOIEG9Qw6MAhRk3DZGtnczIVmxi0
         Y8PC07y6JZByr45HvLr0g476Lhuec7jnEYtKGjvOFWAuCYDpxMo+I5VlkNsEHbMnTrVS
         FuetKhDir/kqD4w2x/3E3fb5OBw9WXwK4DWfM0GFZ0Sjn9ivrW/NiW7oKNY3y59Sdx8i
         kQNQ==
X-Forwarded-Encrypted: i=1; AKwUvByFQA0vZgMCc70kbmHtD/vuCfdk7VNTUCWv7fUMBnwi9AknmVbiXUuV5KFZJ54xOsu3a9sWwfB1Fmn0so5CNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKx6jdCG9GCIglzEwxyQIF6aCKbzMPmrOvSZja1RFo1Vf0r9Apw
	m5JTS+PpDD/b83fnQ9m4AbATyNoGpC4xhWr7ZnbfRodClKktNeplWSulZAvM9IrTDfObYbqT0Jn
	J9hgqtyoTu79BS1OmVyMhtBmuwiSP3tH/XGnxNawM
X-Gm-Gg: AYBFou1vJRb2/agB/qHPUU1y4JsGFOtdUPS0iR/r8FnP73nep1gfP9jAyrMr3+JCXpv
	UPpt92ZmZuCaG0wc5DQ5ZboMh4Cku4v2iprfuNnu7TiSAGAog6hn5mugwZ30O2AEeU8KWBA65Z1
	Nn5cAmgGesrPEgHVpQpUdZcVIKwuDprqW8f9LvAnUnzSv/T1H3Hcfyh9tp89UvN+jfZ/wd/9Bjr
	GMOeFKm525dV42LW4K2yANxzxbssQuOTbdH6g6ZF3NzlcWA9/HZD1y9sSFmVi+vuSPeduibWwo3
	WxVsZA21arDXxYu7MHfw129bbBvD75Qcvwa6VVMhiXZ/UFGzAR2R0lUzd9dd40BoJaUGejk53eb
	HK73irzmuBQ==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id
 a92af1059eb24-16a5dbfde08mr14809417c88.13.1791817451365; Mon, 12 Oct 2026
 08:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 12 Oct 2026 17:03:34 +0200
X-Gm-Features: AclHuK88gg1MNQf0tKC3CQVs4jdrfXCck0NjLOHXH7T1xUhHlrbtWu0XiGM6pmY
Message-ID: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/Kconfig.test        |  11 +++
>  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 135 insertions(+)
>  create mode 100644 rust/kernel/kcsan_test.rs

FWIW `make rustfmtcheck` fails for me on kcsan_test.rs
