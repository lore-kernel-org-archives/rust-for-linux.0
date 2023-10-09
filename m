Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DE08F44
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="guJ4xc+v"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C42B3
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 20:08:04 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a2379a8b69so49328447b3.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 20:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696820883; x=1697425683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwEfqH+ZZi38DlbQatjn6Imup0zBT+HV0s2je2cotj4=;
        b=guJ4xc+v97u5hxqri15r7K9RuSPj9kLAj5qEJd0GtqMTUBbbgvFDuHzha4NUGfOgAy
         fJ126uYiLhZfPt24zlxh5IyDpNd1bHrnFpDMbQztuYq/wrJPTE8pg+OWqFZa1SvuKx5k
         xN4gGp7Jw8buwmR/ZQ+Hr2unrRWXV5FC0WzSxyLEHj56mtYwtvrZk/8ECCxms/wUbKit
         53Cy3tGrwgwNYj7uj2jYKI+6qS+kmwna8MH2yLmmLbirXxWxHre5e+xqVBzRXEbt6TIU
         zDDuF55VTngIxVSHDYIiSOhXm9QjVi2C4tDiaMfUYLD31N5EYKFBlJ6bUfkmBexZlYab
         TwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696820883; x=1697425683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwEfqH+ZZi38DlbQatjn6Imup0zBT+HV0s2je2cotj4=;
        b=ZzJLB9KTEzqstIDhLVdk+w3ttefpHfaSn21OvSACPhJpoud8OZsTV3A+1iyWm7NqeD
         +SSBhRyltCFcX5YwVgXkr8YN3PIYI90Do9GEKBI0T28gOc7DFiqMwHv1s3eSeufOx6/t
         xsmmpiBY29MuaTEN5dClj7g4fdhAK0+nENE2qedOt9mdHpgq3xGRpq0Sja1AdWQYi5XO
         LwcUBvoTKKJHlCPYxCw0f/gIQOwvxeYLB8el1JLKePT7AZ3i5FivoZrKelMml+hCrK9S
         Todm/s7Dh6MLpCMBbobAvwiSqcVjdKbBszX19BiJqkaQsvZ4ffKnD2ZcdlMMQ4nbb0qn
         RgHw==
X-Gm-Message-State: AOJu0YyF6r2uU0EIg7H4hDJiQgJTl2AN58QneZrwxuJNwYzvJczVUh/j
	Y5TQCaOne8COP9OK7kXjMxnzaZj5xIdxS+PQ06O4Lg==
X-Google-Smtp-Source: AGHT+IFhJHDhUJUa0yrILzA2GI50GNAuaWSoHcFPn8hoImr1HHqbjqjpz+BvpPupQ6A/u01QD+ryyn22roXIK1UYHPM=
X-Received: by 2002:a05:690c:dd2:b0:5a4:f7d3:394e with SMTP id
 db18-20020a05690c0dd200b005a4f7d3394emr19334241ywb.14.1696820883736; Sun, 08
 Oct 2023 20:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47sdj2onJS3wFUVoONYL_nEgT+PTLTVuMLcmE6W6JgZAXA@mail.gmail.com>
 <7edb5c43-f17b-4352-8c93-ae5bb9a54412@lunn.ch> <CALNs47ujBcwHG+sgeH3m7gvkW6JKWtD0ZS66ujmswLODuExJhg@mail.gmail.com>
 <20231008.232827.1538387095628135783.fujita.tomonori@gmail.com>
In-Reply-To: <20231008.232827.1538387095628135783.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 23:07:51 -0400
Message-ID: <CALNs47v7rVp2jFGBuG_UBEpTTfp6aKOts4A1hBP0rohw5=q_QA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 10:28=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> > Fujita - since this doesn't get exposed, could this be pub(crate)?)
>
> Device? I don't think so. If we make Device pub(crate), we need to
> make trait Driver pub(crate) too.

Not `Device`, just `pub fn from_raw`. I think it is fine as-is (I see
you sent a new version)

> > Fujita, I think we started doing comments when we know that
> > lossy/bitwise `as` casts are correct. Maybe just leave the code as-is
> > but add
> >
> >     // CAST: the C side verifies devnum < 32
>
> Ok. As I commented on the RFC reviewing, I don't think that we
> need try_from conversion for values from PHYLIB. Implementing bindings
> for untrusted stuff doesn't make sense.
>
> https://lore.kernel.org/all/20230926.101928.767176570707357116.fujita.tom=
onori@gmail.com/
>
> On the other hand, I think that it might worth to use try_from for
> set_speed() because its about the bindings and Rust PHY drivers.
> However, I leave it alone since likely setting a wrong value doesn't
> break anything.

Agreed, thanks for the followup
