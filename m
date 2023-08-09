Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC31E50C
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Aug 2023 23:22:02 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0C21BCF;
	Wed,  9 Aug 2023 16:22:00 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-583c48a9aa1so4983797b3.1;
        Wed, 09 Aug 2023 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691623320; x=1692228120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAUCVB9hbx+bm1gCJWJ7NI0D5vTP4KeLZCLHymhDXao=;
        b=V+ixzXp8y9iFryPiBEr/0UAIfaBTWtRqcmV3Epr223t+BlW+bs9j0UopmLWuAPAjyG
         qmzAhFYhpoB61/7wMfMHbFx70tFVDNx08ZNekOT8/GE1rKkP2DP+kD3YZlfSP+aUuKqg
         WTNKlKQmkthTgwEYq6GJNNcoq2gB44mMAJcORwhIWNJXgikdGjUgwaXGLVo4zukDt+zj
         EjTgO0Dl4Q2drNMKkYtcHmLwVk6UolBPC2g6qumyQKELnmYuHoR58EVEHCiEKXekqzCF
         d8Vpgh4ueyHv2A0iOYH2PWCnq6UK6RQnzSt1jdOIoRgrHfhW0/+EiMjnGsyzuSHZsQbp
         Csqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691623320; x=1692228120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAUCVB9hbx+bm1gCJWJ7NI0D5vTP4KeLZCLHymhDXao=;
        b=U/hFRAUar4KQhLlNLtF8sVgfPU8qZT8CPrrY2v/JD+43sA7iF/9fu6ODF+o3P330yy
         zmNNjzoRrv3Ku5f4RwVJ8hnDNyW2V94hSsXsFU9Va0K6DgS9YFlOo+vrk156Qk6hFkRS
         9O3SZHN4+vobsZGilNyk3Y7KyRC2GpCpMPRTMsBrqQHNoKpFbYcCseUGTswhpvGUl+17
         0D8wzwwTvwcghxjcBpURLDeKzIRlEQrBSGY4fY/MtNsrRii+Da9EkYkM9tI5T9GfUID7
         Cv7wOf7mqQ9BPnR7IE+JzTdx2lPRy0NTVNBBdqsL373UN6hX6yunnxIjuzG3zVZaANJT
         1LdA==
X-Gm-Message-State: AOJu0YyEfwNBvzvQZ0n39Rfxpb9FdxWEzUKm2ABMSADPz7CmZmFZYfUL
	+twsovHq47xEQqL3MXFrSMPpKx8l0EZwgWmO7SU=
X-Google-Smtp-Source: AGHT+IGplt7IN6NKg9sHyqvgrj1hGD6mus/KNdcOnf0yuldHarmJPd1+ib/dTzvV6O2KSekEQIs3TdDPlbLJu7pVKd4=
X-Received: by 2002:a25:ad20:0:b0:d19:d73d:7950 with SMTP id
 y32-20020a25ad20000000b00d19d73d7950mr903429ybi.27.1691623320133; Wed, 09 Aug
 2023 16:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230630150216.109789-1-benno.lossin@proton.me>
In-Reply-To: <20230630150216.109789-1-benno.lossin@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Aug 2023 01:21:49 +0200
Message-ID: <CANiq72kUFSc-iX7r0EQMXAh36Bc-4rWPdLnYO0CYbSCRyzpvXQ@mail.gmail.com>
Subject: Re: [PATCH] rust: types: make `Opaque` be `!Unpin`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Jun 30, 2023 at 5:03=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Adds a `PhantomPinned` field to `Opaque<T>`. This removes the last Rust
> guarantee: the assumption that the type `T` can be freely moved. This is
> not the case for many types from the C side (e.g. if they contain a
> `struct list_head`). This change removes the need to add a
> `PhantomPinned` field manually to Rust structs that contain C structs
> which must not be moved.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
