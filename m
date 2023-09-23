Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE31CF97
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 14:07:39 +0000 (UTC)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1231A5;
	Sat, 23 Sep 2023 07:07:36 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d84c24a810dso4344527276.2;
        Sat, 23 Sep 2023 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695478056; x=1696082856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sysCF3eu9Z5ZV58cqPnNNcgJEdP+enFw1r8CDggNwjE=;
        b=RDVss8oLWPBnaZ7ETO/SosEP6LWEvQSd7nVBA4F0ZWjNDWf2bu2p6ZzXEFdGlltZJo
         rqOYtqEU4BoOXVfMq1Z+2AASC5cbj7eOFrEmfVI8owOtn9kD/Q2sZgai8awwYYNEcNbX
         rkOQawtVjccF7RAdIq68WskmakvbQ0GTCuhavJ8Ixq+9UWpG/AZrfLWJMiAGcwzXLJt4
         ExPDipUBM/jJMe67fPa1i7WEzs8dUvlOPtqUe1Na3EiLs2bmWJK9yfWgTAzq4wG+l+jO
         XXFGxn/r07k7MzKMZ4Eh8SQnjGFMhUc1tlDJOWSX2fW2P4eN9Ksv9PCJ08KzXa9km27K
         02zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695478056; x=1696082856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sysCF3eu9Z5ZV58cqPnNNcgJEdP+enFw1r8CDggNwjE=;
        b=UBhK/8/sHfUkRG+SknbSPh9hOZagg2xUUAIzOvYF4YYmTDxK5i+hdkDzURMyJnnFWB
         d2EhNKOpTIkOL7t64PU1zbjB874Lvt6Bkf/VHacfKnAc3lDGHlY8zrhREZiBcodqisjE
         Zl44Ml204CUJ4LWL9MiUJsHR33Bs/3Owk0xt2sr2HIl1mQzcUVEAH0FuUb/dyyapNqtA
         F9I7BrPV8+n0YIv98Wa5iZd+A1grySK4MiGQ/Hxv1sFC+2aYFY4tFjeYCz39kTup6MrQ
         /hkARFhDSXyeYErQprrN5UzmZU2qUxiG39iQnajTSGJy0iYltXom+TExIOXj1ONCX48+
         U3Rw==
X-Gm-Message-State: AOJu0YwINfdXTvVvMF18AL15GVr6OXf9aejPTIx7r3+jxbg3v+EFHNuk
	jg/zUI6fnqWayFilmeJL77Tf+rz6GH6qOwd/PWQ=
X-Google-Smtp-Source: AGHT+IFbEEKbEpPqgElWqyvW40FFe0C4+Q74wrdyEalsYbrwhBjNd3W9Bvia/mHfT386yHUjmgU1sGqA5UBo6FW2vxg=
X-Received: by 2002:a25:b11c:0:b0:d81:a0c5:f275 with SMTP id
 g28-20020a25b11c000000b00d81a0c5f275mr1675201ybj.15.1695478055798; Sat, 23
 Sep 2023 07:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230921213440.202017-1-wedsonaf@gmail.com> <20230921213440.202017-3-wedsonaf@gmail.com>
 <CAH5fLgj_wQtmW4A6-4wPeP-Qmk2ga2NoVRwZDujjYvHWY7Bk3A@mail.gmail.com> <b2e5befc-1a56-1657-1656-1b5792dbf3e2@proton.me>
In-Reply-To: <b2e5befc-1a56-1657-1656-1b5792dbf3e2@proton.me>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Sat, 23 Sep 2023 11:07:25 -0300
Message-ID: <CANeycqoVM1UiTHXM7om=aCxpyvs_kWdhEXdF7OTMQK98+N1Axg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 22 Sept 2023 at 16:50, Benno Lossin <benno.lossin@proton.me> wrote:
>
> On 22.09.23 17:29, Alice Ryhl wrote:
> > On Thu, Sep 21, 2023 at 11:35=E2=80=AFPM Wedson Almeida Filho
> > <wedsonaf@gmail.com> wrote:
> >>
> >> From: Wedson Almeida Filho <walmeida@microsoft.com>
> >>
> >> With GATs, we don't need a separate type to represent a borrowed objec=
t
> >> with a refcount, we can just use Rust's regular shared borrowing. In
> >> this case, we use `&WithRef<T>` instead of `ArcBorrow<'_, T>`.
> >>
> >> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> >> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> >> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> >
> > I wonder whether "WithArc" is a better name? After all, arc is short
> > for "atomic refcount".
> > I also think it's nice to include Arc in the name of the type.
>
> I think `WithArc` would be confusing, since `Arc` is the smartpointer
> that points to a `WithRef`.

I find `WithArc` confusing as well: is it a `T` with an `Arc`?. And I
agree that with Martin's point that it being in the `arc` module
should (although feebly) establish the relationship with `Arc`.

I'm not married to the `WithRef` name, but so far it's been the best
option I've seen.
