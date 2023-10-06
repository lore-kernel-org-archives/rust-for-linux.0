Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE214447B
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 21:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoaLYK5e"
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0CABE
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 14:14:10 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59f6492b415so23821517b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Oct 2023 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696626850; x=1697231650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nc/T8mYGdG+8ih2hLlQGq5+NcAgLXntLW2uGZP0254=;
        b=PoaLYK5eTUHThehwUBOlAyalDP+d4RWRWM3CG47QnERixgvpmn1qFLMkYGgVcaoCE2
         YVRCKS4xAQkwVAeE6KQyDcBVGEQz6i110eMlqGBJNxnfzKM/pA84PjoEFEXAhnmYvvNP
         0ZhUHzayckusJb0o/CaKTL0jgTqTxMjHO/KI+intZrAec0Ga0Kf5b5ZZaCtDwLA5jhu2
         f7jteO/HObIKmOfwy5EiaTUoPa9YKKA0y2DsOVuHFrc2Q38cETUy3Zh3UtCcMg6c75OC
         b5NVv838irBu/Bg6x2MEjK/n+iW+pVxOSgoeYILMjOLE7ABrxThMg6b8X0TTc8GYyek9
         azyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626850; x=1697231650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Nc/T8mYGdG+8ih2hLlQGq5+NcAgLXntLW2uGZP0254=;
        b=vkE90WD2y70aU5r5hsEJd7eMrRRcNe2Rhi2CsGfe/42hshpODQrJMty0Qrdq9tjBRU
         dKEVS/BFr+NpJwvoRCsW0rVLwFAC2gC62onWOURmFj2EOEAdXHjxgICu4PX0K76AkGB0
         1fuoL7usC5G6/rbIRwu2EQahgCCLkv+/d+ma/Qk4JA0WUr+mJ/M340Kdr3sGwj17L8dD
         eBfbdxKVPlfZ0KbjU0+GaMgUysGgG4MlB4v5nCWfR7Yittqp4tdQX9kA/1jtN3euzAry
         3ZyxSFqpwrVnnebtKInNDBbkNasAKf8qRXdPHgAGJWk9IRDo+wlnFcAL/TZhCK1XIcXJ
         vv1g==
X-Gm-Message-State: AOJu0Yx6yABeL4Xcb9zBflYRAcBOxTyq/yXTTFTlQXevwoGIEoY9M+3Q
	NUzp/gV7BTLRggnG9hW7PSlkB6/dXHgHz9yUVis=
X-Google-Smtp-Source: AGHT+IF93T3qsAxAkn+t2xPXukfWdiK2UF06Y+uSH9E8CpAZtB7uhKm55ZhACUZizhnql8ASfsktQognQfG1cPb0RVA=
X-Received: by 2002:a0d:ca0b:0:b0:586:a680:250 with SMTP id
 m11-20020a0dca0b000000b00586a6800250mr4368286ywd.5.1696626850035; Fri, 06 Oct
 2023 14:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006155739.246381-1-yakoyoku@gmail.com>
In-Reply-To: <20231006155739.246381-1-yakoyoku@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Oct 2023 23:13:58 +0200
Message-ID: <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 6, 2023 at 5:57=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> For now I don't have a completely working example but I have an MWE as
> following...

Thanks Martin, I appreciate it, but I don't think this would work in
the general case we want to solve.

I have been intending to work on this for a long time now, and I still
mean to. Hopefully I will have some news at LPC.

Cheers,
Miguel
