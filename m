Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410D3CCFE
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="NkiVpPc5"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEE0BB
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 13:13:20 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59e88a28b98so11776057b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 13:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1697141600; x=1697746400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmsqUR3a8IPD5QTie/FP4du92v7/hXM633MBDjWHf/Q=;
        b=NkiVpPc5GQzIPVsu4db+d7tmdcgfNFg1RMClqtpM98KKaoTVqTbTgUlFJunCYcTWa2
         KcGJ009a4sAVFmf0bMwPPQiq2alAezmJ7rxALbf2PPKfIlIMIu96qOlDhr9FpyAgPLhL
         Nkd97k8SvjyF9TOLokrukMiqSbDWaHHwnqfUoqBFPEi/O5ei3eIVunFSCnRzvLKmIIT7
         O2nkSxmcTJ7ULVbpX8lLOx01C9qZH2cQBtCqqlI2GGNfJqUlbtDGmN+am73DIsqC8NCN
         1DrGyZl6rO9IKYC0tDp3BaSL33bZ8dBewoXIeHmE/CnfgtoZ+X4HZcR24nneGf6hMYgl
         cOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141600; x=1697746400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmsqUR3a8IPD5QTie/FP4du92v7/hXM633MBDjWHf/Q=;
        b=L5E8Xrgk/UaIfZ1GjkZJe/fVF9tFz71LjmipupEEiY10eIYcZ/HibJIpgmWPDO7WtS
         rti2+o+3K5y57uAUcMLtlvtTyyxDciRqGEQP0Ai4muxtMrdz6iv7NArI716O4KeiSFTL
         63xXZ6NFmRCL4k13fvHBR2R0cOV8g0C1p5Aj9+eIeJBB4cPi1Wd7AJuvGunhYLZQ88T3
         jsGdmbQcQtjd28WQLF8LQSHosckPumJKadYoXJ6k7yBrJ7vHLEh0x61PcrBsUEHHc0Sj
         MG527SaLLXi+Pl9tMFWfyzV+6PiCDXc0ktDXBJ4pKaEIY+fLR08SSkZPYhTvubtbowNR
         bcwQ==
X-Gm-Message-State: AOJu0YxJ/d+35yEGYt+gBLaj9l4V9lD39XKl7HEEeRUvVslIzYKGdckm
	3ufpbOAPSR4MZicshG0s+v0zjjilZOGamJDJ2d/nQQ==
X-Google-Smtp-Source: AGHT+IGTPmT8+w+G1CpKsLRQJBMcbPG+xe/GMXfSoBv66uXw5hXFwHW4CgQJ72SoDpWu+dr8jluUbQmqYWXnHRoPJrg=
X-Received: by 2002:a81:4e10:0:b0:56c:e480:2b2b with SMTP id
 c16-20020a814e10000000b0056ce4802b2bmr15175977ywb.12.1697141600157; Thu, 12
 Oct 2023 13:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009224347.2076221-1-mmaurer@google.com>
In-Reply-To: <20231009224347.2076221-1-mmaurer@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 12 Oct 2023 16:13:10 -0400
Message-ID: <CALNs47vtnOfUarrH8qiJAZpp6bs1jjcsMyb3-A2Gy9YiaDFVEw@mail.gmail.com>
Subject: Re: [PATCH] x86: Enable IBT in Rust if enabled in C
To: Matthew Maurer <mmaurer@google.com>
Cc: peterz@infradead.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 6:44=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
> +KBUILD_RUSTFLAGS +=3D -Zcf-protection=3Dbranch -Zno-jump-tables

I have not tested this, but is it possible to enable these options via
`-Cllvm-args=3D...` instead of using the unstable flags?

If so, I think this would be preferred in case the exact flags change
before they become stable. It sounds like they are likely to change,
see [1].

If not, no big deal since it would just need an update at a rust version bu=
mp.

- Trevor

[1]: https://rust-lang.zulipchat.com/#narrow/stream/131828-t-compiler/topic=
/.60-Zbranch-protection.60.20stability
