Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D101BA4B
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="hXWoJyQL"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCA1A4
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 12:14:49 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a24b03e22eso59890217b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696878888; x=1697483688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJkxWpfY6BylSbHsECCWxvdWvw5Xy177dBQc6H0SaVM=;
        b=hXWoJyQLgoTUKPLXUo0OsDP6QlHu+vpi6ZjXxufvB4kQ0fcr2pH1yOq+jbv0/u1Oyz
         b3910Jb5UJoKX7LExSy0W6hOT0JggAFRON3VcZSS+IZzOTH86I+LA0y27PR4DHiglOZM
         rLX24z9JaBfPsV9c0NrlYssTzYTn23F2mQQXQjrnQMxrHjk/ylh/aGK23qk9ybyaD5tr
         CbvqwVWN9HhQr2X1HXBhDkfl4fkjx2xzTWP73ld95iJadqtXzxHDL4i2ES9CYdnC5K8S
         2fY9dGy79C8KbMzwsS6cseWJwNmqz/OJEy23WHNCYG7Uc5ECvWuMDcpkyCsyYKzNf/C8
         Zjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696878888; x=1697483688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJkxWpfY6BylSbHsECCWxvdWvw5Xy177dBQc6H0SaVM=;
        b=F/aW+Zly0aG/Trro6rDb6APwZcKrfZZNLA+OdcMzwKLDvHXmHC07HBFDZ7Cm19zw33
         IjR5ICwIXtall7HcDqI6/Qx18sDwhXOPSZ4TJdPCVpR8OnkA6qon648RkSQIR43cUR0g
         34B1WnikdjT7rdO4uJud7EJCyE/H6okwxgfgSBXonyZH7R9dDQylWbiz7j5xTZlFuYXU
         hf2va7Gyg56RpdQrLfMb0aVqADeoY9i3CfERbqWPhwIbw5m95RaXZiobspi7JBd/TYQ6
         MLmflsTzLhEaEfMgAUp2dbY9LypU01tvNdgQZN3XDCJoJo3PYneurgO1w6Oh5D2qkAdc
         Ubjw==
X-Gm-Message-State: AOJu0YykGbXeYgvpWu+8v6Z+ieO/zD9y2jqDCmmws0X/qFvxvwnMAxzQ
	dgAQ52mgfbHXTiRuARUNu0VWRjZQ/s8dJZrDxClgDw==
X-Google-Smtp-Source: AGHT+IGoOGPmyv61/skaGAXztPhoFbdiRTQNoHUWul1/cEM2B5AjDtUCSOLoHBtqQYYPCDEmcZ2ozReE5JYRpwKHe1g=
X-Received: by 2002:a81:9c14:0:b0:598:5bb5:1801 with SMTP id
 m20-20020a819c14000000b005985bb51801mr14787290ywa.50.1696878888662; Mon, 09
 Oct 2023 12:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231008094816.320424-1-tmgross@umich.edu> <8a6a2133-92a0-4478-8f3a-e1c7ba38ff18@gmail.com>
 <CALNs47vj=whnF1FcmmXHz=msB2j=GAnrnwx-OKHciW6iR+GUMw@mail.gmail.com> <CANiq72mn3f1w0RZo58BrzDuDHjcGNyBr3FhygVGfSx_xbYwgLg@mail.gmail.com>
In-Reply-To: <CANiq72mn3f1w0RZo58BrzDuDHjcGNyBr3FhygVGfSx_xbYwgLg@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 9 Oct 2023 15:14:37 -0400
Message-ID: <CALNs47v9Vk14Up2MMQsqZGtGzbvyA+b7QB_nmTH05zSBpbyxJg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string literals
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 6:49=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 9, 2023 at 5:04=E2=80=AFAM Trevor Gross <tmgross@umich.edu> w=
rote:
> >
> > Good point, thanks! I'll add that if there is a v2 (or Miguel can
> > probably add it if not)
>
> Yes, I add them myself when I notice they are missing (e.g. most
> recently 2 of the ones in `rust-fixes`), but patches should definitely
> come with the `Fixes: ` tag themselves, i.e. it should be the
> exceptional case.
>
> However, is this actually a fix? The title and commit message make it
> sound like it is a new feature rather than a fix. And the docs of the
> macro says literals are not supported, right?

I suppose it is something that augments current behavior and "fixes"
the linked use case by making it possible. I am not sure what
qualifies as a fix.

> So this probably needs to update those docs too (and ideally add an
> example with the newly supported construct too). Or am I
> misunderstanding?
>
> Cheers,
> Miguel

I will update the documentation, thanks for the catch.
