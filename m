Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EF174C3
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jul 2023 19:56:37 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B681997
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jul 2023 12:56:35 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-403470df1d0so457481cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jul 2023 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689710194; x=1692302194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2fkhBMs6Eb6qvbOZ5Ym7EUAaXKSzfjCL55CAYWO6/I=;
        b=IWskzX1lWEKjRZ+s9pplqV0uBHbL/fBUu16bX9hqhx8KnGwvahG2jqFUrv9Aka1kQc
         XL0Z3DXlvL87YXMmXBg6ZkgNHgILEJJBic1BRs04+DUHX/EHIrfunjk2xsSLoLhHIOR6
         a568kYx2mJF3EHW9Kn27+9DCYvLMQcX32J3avEs3D5bX2I3bLT1JipiUdHjT9b8a+9GR
         Oa+schMUurq9jz7ifj7pLlvTM636DCftxEmSwvLycpFF4ZBtaJPKMJNF1YH/cyyFoTg1
         65wWqFlkuLLnyaRR1rIkPNEny1Iv9s7EAzNk3a9KFFeoUMdNpZOukIMby3hApvUI8bl3
         2TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689710194; x=1692302194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2fkhBMs6Eb6qvbOZ5Ym7EUAaXKSzfjCL55CAYWO6/I=;
        b=Xggmmba1wrldD69SXZCsjnl2MZwX9LCNRcQdHIHiUKdcCeuaJMlIolbRnZJURTCjES
         ywoH2VjX5YjVKEwJonf5qJ7bqpxcJBwnQi3ffb+itRFBEk1oW/u2s2bU6FXfm+XVj46X
         pb+gYAQzf3cUB+6J+RLyARO5yQt8mIUOcAXj7rw/hJKd4OyCMih5kW8L4CrTGBJzP7jk
         qALUDd19oXX7OmKzwcV9Ht2IWdG7asRq0ghLYKbKWoDd3oHT/uB/DIesEASxp1gECB1L
         Abv0ZEiyS0EbwpCQHFTN6DTzvyl2gRIPs1YWhAXi1bauYHr6HX2OIyWjUwtk5uahJNUb
         4TYw==
X-Gm-Message-State: ABy/qLbv6AHkDAydw/QU82cFJyhOZscVXLKGmR7E954HP1ko5OvTms1F
	BCvbVYqHvg3tRqE6HoJ91gxOBytjKVBV8RMOjcuVOQ2sNo8nGg==
X-Google-Smtp-Source: APBJJlFnhwbKB1Xl3CKgR3K1fvqbIVDc+FCeH3HJIgpLHp9EXWRHR09Pw6vYbtG0bAq4j9F6hScvH01Bnlpng8bfGX0=
X-Received: by 2002:ac8:5bd1:0:b0:402:3863:cdc0 with SMTP id
 b17-20020ac85bd1000000b004023863cdc0mr114868qtb.16.1689710194762; Tue, 18 Jul
 2023 12:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230718-refinance-levitator-cf0be1@meerkat>
In-Reply-To: <20230718-refinance-levitator-cf0be1@meerkat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Jul 2023 21:56:23 +0200
Message-ID: <CANiq72mdQmV0MJUhGCtj1MON4+Tb2bbKSkyjmM_ayeEBgc1HgA@mail.gmail.com>
Subject: Re: Test delivery and archive propagation
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Jul 18, 2023 at 8:05=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> This list has been migrated to its new location on the LF "subspace" syst=
em.
> There is no action required on your part -- it should be a fully transpar=
ent
> migration.
>
> This message serves as a propagation test to make sure that the archives =
are
> properly replicating.

Thanks Konstantin (& John)!

Trevor asked in Zulip if this fixes the patch limit: yes, it should,
from what I understand, so the need to Cc patches@lists.linux.dev
becomes obsolete now, which is great.

Cheers,
Miguel
