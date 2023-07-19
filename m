Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265E7F2
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 21:07:35 +0000 (UTC)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952FD1FCD
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 14:07:32 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-635eb5b0320so719556d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 14:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689800851; x=1690405651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zSlqE3bh3FO1VpHUNUmPePyMS/en0oYUpW8AkSfg6pg=;
        b=FZhT0HKJARNdb/dWvTW63CykdIIuwhphOcyO5OHU4WeH2H7tLrqZebyPeZWWc8+2ve
         qGyEVnC1P8bm4X2Xisg4xBsGFkDFuclUUKXU3yNaK99peC8u5YeKEvCyc8vCu2wtXV2x
         Km3svFyrWxDhzld1DR6KI0wKoQuQUAelyD+PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689800851; x=1690405651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSlqE3bh3FO1VpHUNUmPePyMS/en0oYUpW8AkSfg6pg=;
        b=duLs1FS20rQMyFYjFZPBEwdoyyW4TyQybi92t5W7TND+OcZhdh84sUHEPkNGxbll5R
         yrMWSPwSZsH6hTFa8k1FNw548Idb6e+mJJIJ5EODWRq84noBmpIyi+WekQ2PebjCU1zk
         RiNu5PRR59ERr8n+9G0CdLR9TLyZH59wVk97kL3ndDaNogA3PYWEeQsAejcVavAfAqvL
         9xKzFqbzJlSWUWbkQSzOnJIzoQoSoYO8JSFZfHr+R09dppfnj4DJ7orVkwurSGBwWO5X
         K44ew73O0SdP2Iy9G/hIApMR3fuVTke7f8wPPq96kClbCnxal6dX9ItN1sbXSbnumJSh
         Emow==
X-Gm-Message-State: ABy/qLYNuFfrDi5nM/ALLAMXbm+GtfeGk/GDiqZ6hVP2XoG1HJDq38Fx
	Ij5pf6v2uqvSbA4ZaXv1Oi5SJw==
X-Google-Smtp-Source: APBJJlFE+XbC7i2PLAa2MNSFVULNmS/gWOtab5JbI/bfIwcN+P4yQL1OgTqQl07/Zxc6xHW6KgN+sg==
X-Received: by 2002:a0c:fb02:0:b0:632:27c1:23fc with SMTP id c2-20020a0cfb02000000b0063227c123fcmr19561032qvp.39.1689800851374;
        Wed, 19 Jul 2023 14:07:31 -0700 (PDT)
Received: from nitro.local ([204.48.93.123])
        by smtp.gmail.com with ESMTPSA id mm1-20020a0562145e8100b006362d4eeb6esm1683424qvb.144.2023.07.19.14.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 14:07:30 -0700 (PDT)
Date: Wed, 19 Jul 2023 17:07:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: Test delivery and archive propagation
Message-ID: <20230719-toll-spoil-cobalt-d95121@meerkat>
References: <20230718-refinance-levitator-cf0be1@meerkat>
 <CANiq72mdQmV0MJUhGCtj1MON4+Tb2bbKSkyjmM_ayeEBgc1HgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72mdQmV0MJUhGCtj1MON4+Tb2bbKSkyjmM_ayeEBgc1HgA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Jul 18, 2023 at 09:56:23PM +0200, Miguel Ojeda wrote:
> Trevor asked in Zulip if this fixes the patch limit: yes, it should,
> from what I understand, so the need to Cc patches@lists.linux.dev
> becomes obsolete now, which is great.

Let me know if that proves true in real life. Mail sent to this list still
takes a different route than direct delivery to lists.linux.dev (at least,
until all the rest of vger lists are migrated over).

-K
