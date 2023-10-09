Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73898C1A
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="XcANRmBx"
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8DAA3
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 20:17:37 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59f7cc71e2eso51034927b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696821457; x=1697426257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqaXKMeorgw8klxX7SFExXDrfODIB8PQmaVSaXxWNMI=;
        b=XcANRmBxIWlPOMRF19T2hWpyBiKPS+SFJFYVBG/Avjmxrh6Q+MbYXu8hAD9WrV6ouJ
         QisQrTKEu2yg/JtcIl7z4xfP6CMajo8mMy4mwLh6ddvStpytGe6SO+e0Jc0RYc2aWnGE
         Xgr8wJtL3Rnx/mCsGiQzWi5iglskVAsdwVxISsWfU5vlVyEwx+rnvcDpxStzYmK1Tu/C
         oeu1CDEZ/LdIsXixf5bU2EwOeLoVXY8j1DaubJ92jhZKJbodAJWBHhWng1LYKE08qbvW
         0Ln4nBdoWwZGvNbEiHldlYrZH/kb6bbGyQN///2AvIg7p2d3Lp0/homCO8SEaxgpcLdd
         vqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696821457; x=1697426257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqaXKMeorgw8klxX7SFExXDrfODIB8PQmaVSaXxWNMI=;
        b=A2fx7hAlxhvdlEPafHjClcd928ptMXP2ehGRRMb1tWn9XeDa/9wrF0If8k11kveDd4
         QF+1w30l90YWpVDsxNmztfnP8NNpwKaLEhCyRIUM8Mf4gCSxpfR5qq4/O2/oykxiP09h
         mqSNb7PBhnNLwCrBsla9sHBSXKYpe4A7cmWynE+KKl/CJxnbgc/G/yETZAit68ot8nvj
         EgsAoGECPyaQ/e599avzOxmMGla5GWKiEy+9Yxk3S8/2N4ajwofVTs4tMz9J2iTFBKMt
         BAkFBNx9655xdUL6IJf6YDmQTkr6H7lvjalF1GazZfp+K24vq118SA3fV24mjqEdL9F8
         6ypQ==
X-Gm-Message-State: AOJu0YzaJBBCWcu0MgUU+rIL/wCFzSzJz3Ia+aTR0py9Uo4lZa7NubNK
	QRqCBDRMKYCcE4wAJN6LxsuzGb90unbWqCTMkAuFiA==
X-Google-Smtp-Source: AGHT+IGtzCKsZXLssnKDI7GYRcpQ4c4JdLFeHqylI76jUyK4gclOH8jIjOaWuyIrma8SVhSsvL/fe6BeT8SAB3rk8Go=
X-Received: by 2002:a81:6d03:0:b0:5a1:d398:46 with SMTP id i3-20020a816d03000000b005a1d3980046mr14575051ywc.12.1696821456935;
 Sun, 08 Oct 2023 20:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com> <20231009013912.4048593-2-fujita.tomonori@gmail.com>
In-Reply-To: <20231009013912.4048593-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 23:17:25 -0400
Message-ID: <CALNs47sjXBG_yQHfBSn9xa05_Knj_EUPCReoSsGhOC9pyhqc2Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 9:41=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This patch adds abstractions to implement network PHY drivers; the
> driver registration and bindings for some of callback functions in
> struct phy_driver and many genphy_ functions.
>
> This feature is enabled with CONFIG_RUST_PHYLIB_BINDINGS.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

Thanks for all the work Fujita, the rust side looks good to me here!

Reviewed-by: Trevor Gross <tmgross@umich.edu>
