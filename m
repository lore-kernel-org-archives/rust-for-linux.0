Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BC822309
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LNNQS3+8"
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53004B4
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 11:31:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-408c6ec1fd1so14095e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698777087; x=1699381887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaYTohuTIqjHgVNVxWFcVGAZS0vdx2BVhnZszP8s5bg=;
        b=LNNQS3+8VoboEPwb+5Qx6wqnjwOvueh+S90u8r9t98o0mKPC0z3pXXQ6TSa7JILB1A
         XMQV6PbfL8GOn1ztgm3+FvPnSneKSettZ0LYOlghzrRCvlOPZvGLVRGItNMQKXcfsyu9
         n4I3AEMUq2iy3nShihpVyd0jx7fmYJfjdSoiMx/uUx7UXSqsxH1en4d8Syk0xFDNvMHr
         sB4PPWSeIdvFp3We6UErFILEtL41zHgTewzhXoMGba+Y3livrRcMfl7wXWyjhBPq6qgX
         8LJvkEQqNXA4CC0nHP52zUPdjZAmUZUkYw1NnNl2tdgUPbPE+tvQk048gpB8RhF7/nfS
         uVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698777087; x=1699381887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaYTohuTIqjHgVNVxWFcVGAZS0vdx2BVhnZszP8s5bg=;
        b=Od8ipWoHhQ/gVgo8bD3Ja20j39sJBKzdbZdrHgIZ65ccSh2P6jUYkp2o4g6oaa6jUV
         WhQgGabpXtr+gfchy+FptYOnRKCTg1ZyhtK4YYt0UcQZElozfdsyL1Kgp2XZKQUFHV2B
         k4q4yzaGjAk325TH2axctNjZwCaroGPeHAbQ29pqltj/pNB0B9yaanN36NMhK9Iako8r
         7AUBnCcyY+vXlH3mZAXHS11ssIpUCJGqZB79nmwd5CKXU3YWT239r+AXiIBNNf6VdfbC
         MKlsfXKzFEARN0rZjXp/FuuT/YJDJT/dp2NnhfUM/sd5HOpWQIV1TeIDV4fN0BqC2fC6
         N7rA==
X-Gm-Message-State: AOJu0YxMmWTASSyGr374u5ejyLeq5IAUEsZPQVWy1UkBfisSTMsLNdiu
	UINIM8ZarT/njHq9WM6aP33wSHzUxav0fA4kgxPqnfcDq9fhBJq5EL58lg==
X-Google-Smtp-Source: AGHT+IHk8irUNCnWVXz7O0/JYM/RLlDUpW+GqIv41z0doUX+yANnCaXEkq13rT0NXYkEiHI/U7e3Cz8MEjnR/q+baw4=
X-Received: by 2002:a05:600c:198e:b0:3f7:3e85:36a with SMTP id
 t14-20020a05600c198e00b003f73e85036amr91508wmq.7.1698777086582; Tue, 31 Oct
 2023 11:31:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 31 Oct 2023 11:31:14 -0700
Message-ID: <CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 8:53=E2=80=AFAM Jamie Cunliffe <Jamie.Cunliffe@arm.=
com> wrote:
> +KBUILD_RUSTFLAGS +=3D --target=3Daarch64-unknown-none -Ctarget-feature=
=3D"-neon"
If I have aarch64-unknown-none target support already installed in my
local Rust compiler (either build a custom compiler and enable the
target, as is my real case, or as the common case, run `rustup target
add aarch64-unknown-none`), this produces a build error I didn't get
from the previous target.json approach:

error[E0464]: multiple candidates for `rmeta` dependency `core` found
  |
  =3D note: candidate #1:
/usr/local/google/home/mmaurer/android/linux/out/cache/65c6e8ea/common/rust=
/libcore.rmeta
  =3D note: candidate #2:
/usr/local/google/home/mmaurer/android/linux/prebuilts/rust/linux-x86/1.72.=
1/lib/rustlib/aarch64-unknown-none/lib/libcore-690113bb4de6f7fb.rlib

Are we sure that we want to try to use `--target=3Daarch64-unknown-none`
rather than a custom target.json? If our libcore and their libcore may
be compiled differently (and they can be, because we are controlling
additional compilation options), it seems to me that we ought to be
defining our own target.

If we really do want to go ahead with using targets directly form
rustc, this patch should add `--sysroot=3D/dev/null` or a similar
override to `rustc_library_cmd` and `rust_common_cmd` to prevent rustc
from picking up any already installed sysroot libraries.
