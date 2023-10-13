Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E4208DA
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ZwiFtBnw"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039037A9E
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 09:17:16 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a7dafb659cso28161427b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1697213836; x=1697818636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiiSucGc6MTfRDKvJCNBXPQO4K5K3eID4HqkvnQPig8=;
        b=ZwiFtBnwih85tFp2tIkrKIBocKRk36V9aZTDOvUytg8vj1V4H5jhjoowLCHeGKHKd3
         3CP+EyDkfrgP06SyfXpPBNoIOl75QLgvIIGnvkb9l6n2zamoe8YbJuyBksOwT5Unt3Ws
         w+gJXp3OK/7oZFkxq/k1vRrgaZ6G+N8LDJqeVxZwANAJWE0VMxz7TFK+qluy+rzTv0YZ
         G8wAqhSjsOvEX83llR6263t3lmwh3zTqMEQsVUm0MCJbMY7JAcgCDMOWPIQemojjXhWn
         mATHyYGFMzO6qYqI94J+d0tr5/mjm3Idy5kFggQ6ReY3SEETwTcq3UUHvvt3HcdDKM8z
         W95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213836; x=1697818636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiiSucGc6MTfRDKvJCNBXPQO4K5K3eID4HqkvnQPig8=;
        b=jd5RojVlctqhjmI+Puefwinor6Ivkbqjk9g1JaoQ05/fT6haq8qze8aZMIU1lI+TqI
         kn/6C2aHbbsoquBvGfo2alvbHUCcuOhMW7n33VaijTwv0+CmsbkCLVAU/Lld7XjA7s8u
         AhQg/H9Q12agn8aGU6rqpdzNe3cSLo+wUb4IRFL40nFTPHyObEnaLauyCbbWBr4P277g
         PzPZA37tqtxPMaK9w3Po/4yoQVE3Aq/g8fg9GxSucC3s0tcHZS1PJ1f7i+KSfOonnU9h
         udoc0vm4mKq9aKvIg2iy5o1DbN+KepuugYnEqUnHQ5hPXNhUMtxenpxV3LCIifAgS84Q
         Bp+g==
X-Gm-Message-State: AOJu0Yy2cg440gs395h+T2Pk+EOfFlzd+InPYcx/Qmoin5HzxmQ8iVTb
	p9rgSB1zEAne8wC9YQ1xfyVgkGN5dtjw+bhZ4E/yJw==
X-Google-Smtp-Source: AGHT+IF3pGp90hQo+h2MPJtv3DsS6C1bs2A0PCwuo6WKVaMixajklj0e4Y8EAA9FbyVBM0js+xMDy/dW3VUcPy430i4=
X-Received: by 2002:a0d:d857:0:b0:5a7:ba00:6dd8 with SMTP id
 a84-20020a0dd857000000b005a7ba006dd8mr11654622ywe.8.1697213836143; Fri, 13
 Oct 2023 09:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012125349.2702474-1-fujita.tomonori@gmail.com>
 <20231012125349.2702474-4-fujita.tomonori@gmail.com> <ZSlVgAfz-O5UR_ps@Boquns-Mac-mini.home>
In-Reply-To: <ZSlVgAfz-O5UR_ps@Boquns-Mac-mini.home>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 13 Oct 2023 12:17:05 -0400
Message-ID: <CALNs47u9ACA3MO2soPueeGZe=yZkieKb6rDr-G1fGQePjJ5npg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/4] MAINTAINERS: add Rust PHY abstractions to
 the ETHERNET PHY LIBRARY
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, benno.lossin@proton.me, 
	greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 13, 2023 at 10:34=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
> Since Trevor has been reviewing the series and showed a lot of
> expertise, I suggest having him as the reviewer in Rust networking, of
> course if he and everyone agree ;-)
>
> Trevor, what do you think?
>
> Regards,
> Boqun

Thanks for the suggestion Boqun :) I would be happy to be a reviewer
for the rust components of networking.

As Tomo mentioned I am not sure there is a good way to indicate this
niche, maybe a new section with two lists? Andrew's call for what
would be best here I suppose.
