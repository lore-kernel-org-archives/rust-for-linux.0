Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F443B28F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6sJn+OM"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82544E5;
	Thu, 12 Oct 2023 13:45:33 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7ba0828efso17550797b3.3;
        Thu, 12 Oct 2023 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697143532; x=1697748332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm71cAIR4dnc3VUdHD6qFWEMr+jee0/siUqiNF2HWtY=;
        b=c6sJn+OMESOcOy4vgW7D1RZuXgyFwYRsgCl2ivAhkGQZY4E7+CFQaKlFr58GmFV8WF
         +kLucTQBa9wDz1igCzEHEVaztBmqkwC6KKr3utTBQeTiulbUvYYNF4PxPioNm5fHyGUw
         163O/Svb78IbhMV9kcFOMNuj543wUzMQMkpMhldgq1qINJrVlOdYbgzDwBM+Q0P/IH6o
         5tKz37yrFaqrN6KlIt7YjWo4SruR77XKHiLI5/CKPplXU8V00Ole15UDqQrOXReVqBDH
         HVgaV7EJtWtiM2APz9WAmkFglx3DtEtXqNY0Flysq+DhAA7C9HZcs2w0A32i9OCD1vZY
         Ahkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697143532; x=1697748332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm71cAIR4dnc3VUdHD6qFWEMr+jee0/siUqiNF2HWtY=;
        b=EJr1VOzWUPYW3J4Pl66szR90XbvKUgiotOygWdZNCwFbp6cxwONuaRzkEQeKhP8oIh
         cpO9NcEeBcp9d4Rm1/aga1+w+aVX3gTlFxJUUDtEVDqdaPk2IMflWZUAZFs578kMOg0z
         +hyj0TuM7kC8YQED/+mUkajqwVU77iu6FHZle8cSeIly+kRqdpNjt/AATV0qPM28jUVs
         53VunEH91XPbXok1kLaR4iJiTRs7jnF5z+e06s11jdVTWQhk7X6pL+f97JLAhuxjKocm
         gPDCbx6F5NXj2uI1zoCYGDHx5UidbCpxZaVqYpdwECWVDW6fBBF/Iz/fO5mazt8ygFQ5
         SQ8Q==
X-Gm-Message-State: AOJu0YzFIgs84GH3ObzdbhEGgUeSa6CxHC0df/sRoSDuKeDaZHfgliqS
	5VLw8cMxZyzEWi/eazLWrA0LOGo20vjdV/fqhN0=
X-Google-Smtp-Source: AGHT+IFv+yC0f0vTaV9BEfJYe/+emnZEdaZ5U2pHDF7/5muhUYA8tdCFjUAesps6E4dSrwBKJaseCia0qQEE6zG0Pd4=
X-Received: by 2002:a81:8141:0:b0:59b:1763:bff9 with SMTP id
 r62-20020a818141000000b0059b1763bff9mr29244314ywf.49.1697143532705; Thu, 12
 Oct 2023 13:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231008094816.320424-1-tmgross@umich.edu> <8a6a2133-92a0-4478-8f3a-e1c7ba38ff18@gmail.com>
 <CALNs47vj=whnF1FcmmXHz=msB2j=GAnrnwx-OKHciW6iR+GUMw@mail.gmail.com>
 <CANiq72mn3f1w0RZo58BrzDuDHjcGNyBr3FhygVGfSx_xbYwgLg@mail.gmail.com> <CALNs47v9Vk14Up2MMQsqZGtGzbvyA+b7QB_nmTH05zSBpbyxJg@mail.gmail.com>
In-Reply-To: <CALNs47v9Vk14Up2MMQsqZGtGzbvyA+b7QB_nmTH05zSBpbyxJg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Oct 2023 22:45:21 +0200
Message-ID: <CANiq72=4zCTJOk_V1sonN3-7NNWDCSA70j_bthsZo35KK7qT6w@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string literals
To: Trevor Gross <tmgross@umich.edu>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 9:14=E2=80=AFPM Trevor Gross <tmgross@umich.edu> wro=
te:
>
> I suppose it is something that augments current behavior and "fixes"
> the linked use case by making it possible. I am not sure what
> qualifies as a fix.

`Fixes` is meant for issues/bugs. So if the macro was broken, i.e. it
does not do what it says it would, it would be a fix.

But if I understand correctly, the docs say this was not supported, so
it is not a fix, it is just expanding the feature set.

Similarly, `Reported-by` is not meant for feature requests.

> I will update the documentation, thanks for the catch.

Thanks!

Cheers,
Miguel
