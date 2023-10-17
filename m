Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFC27EC3
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar3OoPds"
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B9392
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 08:38:40 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a81ab75f21so55261517b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697557120; x=1698161920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=audjk98p7ITuzKPdKSvvv4L4sN1WeHj3RF/Hm/0Y1No=;
        b=Ar3OoPdsbV7Jh/SMZ+0aiKKxO11Gg9SmGzcHDuVziVtAVLKdsm459KTC+RSylSZ/K9
         HnZC5DzBpjSCLBuW0ZjSCP8vgduavLTtYeucTG7kGmUEsTkvzUZfKhZ76kI0yYSs+QA+
         QrKDAj0ua99TgSE/sSwcZAe8uJqtNpkmuTnU+shynfTAKFntJeL7Cmk1elfmqZ1lEYEl
         MIh8FvO2SFpSTgpIR/77LL1nmnK9OkBqLAZmy0HUAuQruE14eK9O9q7g/Gd+XE0OjD/V
         MVtsQOVNqJkGQ+rtcpxLOqNOXJo4h1uXdG/Ld8yLGwTAubLehAUBVBDcFJm/6E+QTfaM
         trxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557120; x=1698161920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=audjk98p7ITuzKPdKSvvv4L4sN1WeHj3RF/Hm/0Y1No=;
        b=vNrfP0UZ5vamhSKEnLQRrh2dKuMuG0u/YEQom1M4G+5oJS7/9ULm1WehzWgR0U0mC7
         6cZxBUnK/wWuKaIbO5QjUD0nBAWQ2hrDe35LnFAjotNQwzLli4jRVzKhi99kg1JB8D3E
         xZeNgjwh4aCuUsj1d/dZusVeSmimN/IeTCdBkrNtvhaGn/Xf3duc7qvSeTrhm000Otpq
         tBI6Kul7IfBxUtwE4o0SLZV6W2XganpL7GJcXvwjBFWSrB9hiaLs0sstx68f/64oeONf
         7Rbd2vzWp06Dej+RkqHId4D+mmB3jgE3lrKRSORap4VStHC4XFMRQnEB1LRtT5ofxv0/
         45Zw==
X-Gm-Message-State: AOJu0YzBGdHxQCjGcdA9/SVG4O1I/NBYOajlZZ6iWjgJ+XMAC91VrYYm
	Y+tsLk4WDCEM1HiyBZGXzMGW2El8T/YX0uq8CK4=
X-Google-Smtp-Source: AGHT+IFYe+Hlz8Y758P/skVjNMp7Wno+nLvd0K2yA1X6n7ZYk70VGpaQNk7HP6yTGgC4uEjjdxyqk7/HRSFI3pNkszY=
X-Received: by 2002:a05:690c:ed4:b0:5a7:b893:6f64 with SMTP id
 cs20-20020a05690c0ed400b005a7b8936f64mr3466501ywb.16.1697557119815; Tue, 17
 Oct 2023 08:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com> <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Oct 2023 17:38:28 +0200
Message-ID: <CANiq72mXdYCbxHCKDRGh6SpzpnuAs-iPNwpXkpZf1mneRPBb+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, Alice Ryhl <aliceryhl@google.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 3:16=E2=80=AFPM Jamie Cunliffe <Jamie.Cunliffe@arm.=
com> wrote:
>
> +KBUILD_RUSTFLAGS +=3D --target aarch64-unknown-none -C target-feature=3D=
"-neon"

For consistency with other flags we pass in Rust, please avoid the
space after `-C`.

By the way, perhaps we could already add others like (untested):

 ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS),y)
+KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D"+lse"
   ifneq ($(CONFIG_ARM64_LSE_ATOMICS),y)
        @echo "warning: LSE atomics not supported by binutils" >&2
   endif

This one in particular (LSE) came up in a Binder discussion yesterday.

Cheers,
Miguel
