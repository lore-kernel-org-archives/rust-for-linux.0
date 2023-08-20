Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651529A2
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Aug 2023 23:07:19 +0000 (UTC)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260CDA3;
	Sun, 20 Aug 2023 16:07:18 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d35a9d7a5bdso2728663276.0;
        Sun, 20 Aug 2023 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692572837; x=1693177637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o73w4w0N/kFb2lwKVkScYV3geo6b4kcMCRo1AY1wg6Y=;
        b=VHszxDnZWMg0bhLx071iFUt+Uq2aw9eX2kYZou4/oiLZy285EYALY9iArxEwe4IZky
         0xPS/XxqeLrG8W7L6BKyNMFFRtVJzl22/fOFyTwLNJ9hPGnp7nMbE2UkM6pLpgEN9D6w
         JkqczHiTjOUIXxOTyvyKT9udJ6f0lKBiY5W6WKiQ6AIuW71nUlGpFD2+fy/5g1I6xwzl
         5iqx8qXqogGVIwWlqtNscZMwvSaU108P83kZDykBqsu+EOfjNP9zpSUrafHtl450zfqr
         ZycJGCdUAgRUVnjRfuD0OgfSJHQ1+CN8O3P7PCUP8AZ7YENTmJFGTaFjGnKE0jz2IlfJ
         eDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692572837; x=1693177637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o73w4w0N/kFb2lwKVkScYV3geo6b4kcMCRo1AY1wg6Y=;
        b=UQbauacB5ok41klCZ6IRy2ng63ILPeKo2oCQqkCykxZtJQgwmX3WYj7VMl7a+eiDNK
         TYRQ4tK5d9rOtA3J9iDJjp7iSEjBDbD7d/MMXNvN6TGatYsEA9wGjdvRZNUkRT9zaAyy
         G4qEmlFxv+Ndh6L6On9+dciybqA/KwWJ13Bvq6uoc3IRhDwhLNS/3JqQxiC6kQaSyUqu
         fNDWikcm6MM8nvzq1SYHWl1+zA1MefBTn1vXHuEZHGEgtE1yXWA+lJIToWsV+oKOzk2F
         qin6V70FsAoShixE2uD6Yy1Paz41N6Zq9LNcfbYo2ChIUfGMYhuFHHScLnOFQ/ClusPp
         SVxQ==
X-Gm-Message-State: AOJu0YwYZerABqkhlRvikGn/SJApo2jIa8sfwqsJXOA91QsVTfV03ZT0
	Wg9ExQEYwScUgEigm2oaNkMbLXPqhD+aHMmLCmA=
X-Google-Smtp-Source: AGHT+IFi9lHMbpMTd7FZZ/bySxVM/B7IE96URR44UPxVilUTv1xESAKFsH7tLD5VDFlmpyEoR3+MvJJvzMb3vYtMDjE=
X-Received: by 2002:a05:6902:4d2:b0:d63:839:989 with SMTP id
 v18-20020a05690204d200b00d6308390989mr5499126ybs.0.1692572837352; Sun, 20 Aug
 2023 16:07:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230804171448.54976-1-yakoyoku@gmail.com>
In-Reply-To: <20230804171448.54976-1-yakoyoku@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Aug 2023 01:07:06 +0200
Message-ID: <CANiq72=YOtFTUXgpBPAG5vA21hsuL-YpvgavH7kxWt6p=UW1eQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: generate_rust_analyzer: provide `cfg`s for
 `core` and `alloc`
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Aug 4, 2023 at 7:14=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Both `core` and `alloc` have their `cfgs` (such as `no_rc`) missing
> in `rust-project.json`.
>
> To remedy this, pass the flags to `generate_rust_analyzer.py` for
> them to be added to a dictionary where each key corresponds to
> a crate and each value to a list of `cfg`s. The dictionary is then
> used to pass the `cfg`s to each crate in the generated file (for
> `core` and `alloc` only).
>
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

Applied to `rust-next` -- thanks!

As discussed, I removed the Suggested-by.

Cheers,
Miguel
