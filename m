Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01BE2D781
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRQnN6PY"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD5E83
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 10:47:24 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7b91faf40so72412147b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697564843; x=1698169643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hq7KwzFzn9R/YxGxNGLbGy7WRmGHM1T6CgFTdG+59I=;
        b=TRQnN6PYaahTlkKJGgcjuPoEFDJEJ1d7PclMV1MO/YeekmpmMsZhrgOcRnLJ0UtlLc
         dazwn3+EcAu6V/FieUnVVb3Jv1CUuz1Id7rsleuayy3R9o/B5S4gJSyx35xc89WhMhW6
         RqTRUPrNgkueMeSBlhhBGDPCbn1cVMkWBi8G3nQa08LY6Ut3W6DfHCMFkSIZgiUZtQdB
         4uF2dkx8vLUz+X2I1rH8Wz1PmM78q6gzHE8HaMOkbDlgr+YUDtwtj3OkISJLr6O9V12j
         D0M0RvqRuMkNJu85U+/9Zpv1sKrDbg38w3pc5Gq/EhwA/sLBFop9tX0pe83cqkOCb+gy
         TFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697564843; x=1698169643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hq7KwzFzn9R/YxGxNGLbGy7WRmGHM1T6CgFTdG+59I=;
        b=JlKIMTgrOH+MYJk0UZCApR224nMoO6GfEZpDsamVB4Sxpu2mihtq9I+HRLZ1DHZxnV
         bcefJR8Z2y176/7TlUY1aAvrod7ec8gEh6wK3VUJvMRiNIpFBtvk+2FK90z7ZeNfkkK4
         ud0aHvVUUJ5Q+cLnUHDwId5F8CIvw7hC0ldagDNkOXAi+gksqNCw2gemHw6hHSHABqmW
         EbNlfWoGbcyGCT/cocsdBjpQZXmZ+xLyrvo0ahyZDWXyOgN63WD6VksD/oFuMN8+lBkm
         0lWwZ6joRN06zOzWVbouQeCnVdtOArHSblqxQBR3VMiwKzWMPJovhG5aeHy1+n6OX4VX
         2mCA==
X-Gm-Message-State: AOJu0YxPT9w8x5UC6xiHFB/3cNybNrnEF65Nfvd6ilrsoNgZ+BO46ZGN
	K2xoldSNT161E8tdOZQXsyKFskYnNFPBAJcBOuE=
X-Google-Smtp-Source: AGHT+IHIzeA0UApVC4jYjNMGzuWFdqyTJIddDaDCF1Qg6gVC3K4W52pV+yEaSzzdtopnjMq0bSA0Y+LMOdcrLvIpSic=
X-Received: by 2002:a81:a553:0:b0:59b:f18b:efa0 with SMTP id
 v19-20020a81a553000000b0059bf18befa0mr2878172ywg.36.1697564843617; Tue, 17
 Oct 2023 10:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
 <20231016131523.1521965-2-Jamie.Cunliffe@arm.com> <CANiq72mXdYCbxHCKDRGh6SpzpnuAs-iPNwpXkpZf1mneRPBb+g@mail.gmail.com>
In-Reply-To: <CANiq72mXdYCbxHCKDRGh6SpzpnuAs-iPNwpXkpZf1mneRPBb+g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Oct 2023 19:47:11 +0200
Message-ID: <CANiq72=r96X_36rv_yf6pfmR9BbKjsgnjHeYENMHBh9r=ppL7A@mail.gmail.com>
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
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 5:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> By the way, perhaps we could already add others like (untested):
>
>  ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS),y)
> +KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D"+lse"
>    ifneq ($(CONFIG_ARM64_LSE_ATOMICS),y)
>         @echo "warning: LSE atomics not supported by binutils" >&2
>    endif

Ignore this, sorry -- as Boqun reminded me, this uses an
`ALTERNATIVE`, rather than enable it unconditionally. See
https://github.com/Rust-for-Linux/linux/issues/970.

Cheers,
Miguel
