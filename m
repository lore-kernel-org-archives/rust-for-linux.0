Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2DB749E
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkGOSgf4"
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A3B83
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 01:52:04 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7ab68ef45e7so702106241.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Oct 2023 01:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696582323; x=1697187123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n24qAGfzmg1PVf0PveNVGT5psT/dnx8oFWzr/qUCoo0=;
        b=dkGOSgf4hSQpEwyrO0okijzJbdGAmU2MnKpp/+OFODoh17IKWlOGavSmr8M463TIMm
         MOGrhL1NxxTLaEhYgn72to1U7rv0Pd2P2hhCtK581kIEkbO/TgUr2hGED0E7U66WJukY
         kYUtWEQEypGLbNZSdmU0pL3PwogmCsL06OqaRBmtIXFBgOzTlLYjFbVRb6iCArOcWfWT
         wVMj2n2AJm1jXf/U8WOfZkiFjzlJmnvf012ert5U5UTw0n7cf7aAEncZ6GPQ4WhlVekt
         l+1st+wrJB7JCQHaE8Wa237lFJF3wHLZRpi2lsFCzLShDq3xconxDLAqvgP4/5akTOGm
         Rtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696582323; x=1697187123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n24qAGfzmg1PVf0PveNVGT5psT/dnx8oFWzr/qUCoo0=;
        b=eSrOjDaGDY1pAW41h5+kWq9axZpkyC/2LITarGe0zL4zgoRhqNBIEn586uM9yFz3Kb
         dvSa+9o2ERNhwdia5ukYFw0in+Z9Pqr28GabeCgzOJF4Mu8LulaUEJR299BD+844Y2lO
         jITq+CTqCUK9RmFeznBP4bjGNwcXO97fr1p0j2ml0KDcbGM/Trhgh/GDCKx/sRW/7yfB
         cvmwH1uIFUGPWQEBG7X+ofm9TzTkuMgdqswTN/az3r1S4Mw50zQ134PVCTzLQZ21AbT3
         oM0tmOcvaIB+MTzVD2H4ecXXaZFD8pg1J4GR1jH+bsJ2/Zvsy6+5mAxr17pDzAjQ4N4Z
         N9Uw==
X-Gm-Message-State: AOJu0YzTIqhVgUdtS2eFVVmsqiLzy2s2/t4x16riOVrlch/wOKX0DAoX
	597iDaqDUIqNhgp8M7SaPg5GZ3sTfW47pqrIUCCP/w==
X-Google-Smtp-Source: AGHT+IHoD96RiVv8AYlQXO88pCDv26uNXotOZHGP73JCbfONRD7tBm4QR3mhTQvUJNddUUYkJSHTZdeEBZU0VFhJJfk=
X-Received: by 2002:a67:de97:0:b0:44e:849d:d2d3 with SMTP id
 r23-20020a67de97000000b0044e849dd2d3mr6989714vsk.16.1696582322929; Fri, 06
 Oct 2023 01:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231005210556.466856-1-ojeda@kernel.org> <20231005210556.466856-2-ojeda@kernel.org>
In-Reply-To: <20231005210556.466856-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Oct 2023 10:51:51 +0200
Message-ID: <CAH5fLgj1uesdNxbbYu986sBLGRsWh3d+NCrE__haFm44kSJ+zQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: task: remove redundant explicit link
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 5, 2023 at 11:06=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
> Starting with Rust 1.73.0, `rustdoc` detects redundant explicit
> links with its new lint `redundant_explicit_links` [1]:
>
>     error: redundant explicit link target
>       --> rust/kernel/task.rs:85:21
>        |
>     85 |     /// [`current`](crate::current) macro because it is safe.
>        |          ---------  ^^^^^^^^^^^^^^ explicit target is redundant
>        |          |
>        |          because label contains path that resolves to same desti=
nation
>        |
>        =3D note: when a link's destination is not specified,
>                the label is used to resolve intra-doc links
>        =3D note: `-D rustdoc::redundant-explicit-links` implied by `-D wa=
rnings`
>     help: remove explicit link target
>        |
>     85 |     /// [`current`] macro because it is safe.
>
> In order to avoid the warning in the compiler upgrade commit,
> make it an intra-doc link as the tool suggests.
>
> Link: https://github.com/rust-lang/rust/pull/113167 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
