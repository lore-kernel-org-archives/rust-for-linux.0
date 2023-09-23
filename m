Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2301CF97
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 14:15:35 +0000 (UTC)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A7C19A
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 07:15:33 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-45274236ef6so1560453137.3
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695478533; x=1696083333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtQdjhgh5ojDAXxkKIrpNd9etS22b5WxpzQrfxu7mZA=;
        b=0LLhwo2EvpXxPjfaKRJR0e8ylG41gWdXP3U+dR+OCrLMX6YzOvLJc8KWNqPBndoln6
         IX7KL+COUnq5kIOVDjQban1fgecXOuIqlQozT1PICH9TK86ugJWxC6E+AcZkXLU0BYu1
         DeiesMdkbqWIWcCD3uj3UjfxtEXP0OsUF/sthGURtvWVM4zZKQqSKbWvgUl2wFnNj+pD
         jP3hbjpXFMcK+cOS7vBGnOnGe4r1Fk5kg0OaRHpC1wfEvq0ikJ0kT+Yh7SL7LlDMFktx
         NGbwnFXBa/g0s5zGov4DlLiMBdyAzad30fTwukTzCRLW/snSfyo5HtTbN6VJlVNkT6bp
         0PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695478533; x=1696083333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtQdjhgh5ojDAXxkKIrpNd9etS22b5WxpzQrfxu7mZA=;
        b=EmtfaBo7v3hxH5hTU95OQRuAkpgj2jHkylz9OgTjzhMIve97n5WpqXGoUcPZ5ypkL8
         ykeBIPRgoPfDzg5Uc+TtdVyQVAdUkj7SxL/FFLOYTTyJdGJSVjqadnYpgxhsF1hZmJkG
         +VVfoquah2zLhcKAXKKFnUrz/PnRhjglBlkBOySoIey4vKeQX0NNJ+mpfiKTHCDobzR/
         z16ANn1Hg35wO0LyNCDUiY0GnvnMGcLWdQgbKYGuV7IlZ//CREqQeA30cpqKzWgOwjWG
         wi+qCjoUZF62dIEuH5tkFuUpDWCR1g+seXdCdz7M1XnmN3mhPaql/gSNWQwgNx1BBvu7
         eAlg==
X-Gm-Message-State: AOJu0Yw3dPmOnrcSz6lRNpqhN6HPVE+iTlkUPf+uAQrPBQjFOQK5uEOY
	tMNy8AUmPKXkRzKqgnbc9YCNnQqQ2jvz+ixJmj0SUpT0xa0Xd3ViyTeB6g==
X-Google-Smtp-Source: AGHT+IEZJy3KgXIUSKRBNQP/kfwplBJlMEPpa9d/QEvbLVrEEQTag2bXQyXM5JRdogNyH5fPXkqtGIhZs2cdtD3acXg=
X-Received: by 2002:a05:6102:2448:b0:452:607d:8603 with SMTP id
 g8-20020a056102244800b00452607d8603mr1470464vss.1.1695478532667; Sat, 23 Sep
 2023 07:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230921213440.202017-1-wedsonaf@gmail.com> <20230921213440.202017-3-wedsonaf@gmail.com>
 <20230923081251.2f702cc7@gary-lowrisc-laptop> <CANeycqoYtbE1eMOoX_ZBp_Ti-jg9eJ+JBmHjiV=nno+ocvvOqA@mail.gmail.com>
In-Reply-To: <CANeycqoYtbE1eMOoX_ZBp_Ti-jg9eJ+JBmHjiV=nno+ocvvOqA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 23 Sep 2023 16:15:21 +0200
Message-ID: <CAH5fLggKf1sXdpnihcm-qOMDk9ewkDB9ZyW3wVdhmuhtn9sPFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 4:11=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> On Fri, 22 Sept 2023 at 21:13, Gary Guo <gary@garyguo.net> wrote:
> >
> > On Thu, 21 Sep 2023 18:34:40 -0300
> > Wedson Almeida Filho <wedsonaf@gmail.com> wrote:
> >
> > > From: Wedson Almeida Filho <walmeida@microsoft.com>
> > >
> > > With GATs, we don't need a separate type to represent a borrowed obje=
ct
> > > with a refcount, we can just use Rust's regular shared borrowing. In
> > > this case, we use `&WithRef<T>` instead of `ArcBorrow<'_, T>`.
> > >
> > > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> >
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> >
> > The implementation looks good to me, thanks Wedson.
> >
> > A minor thing that worth considering is to implement `AlwaysRefCounted`
> > to `WithRef` and reimplement `Arc` with `ARef<TaskRef<T>>` or add
> > conversion functions between them.
> >
> > It feels natural to have this this impl (because `WithRef` is indeed
> > always ref counted), but on the other hand I don't currently foresee
> > anyone to currently want to use this API :(
>
> Yes, I like the idea of defining `Arc<T>` as `ARef<WithRef<T>>`. My
> concern had to do with error messages for type aliases but you or
> Benno (or Bjorn?) had a link to plans from the compiler team to
> improve this. And we're using type aliases for our locks anyway.
>
> So this change is in my queue. (As well as the changes to the guard we
> discussed a couple of months ago.)

Will this not cause issues with DispatchFromDyn and the Receiver
trait? Maybe it's best to have Arc be a real type and just provide a
conversion?

Alice
