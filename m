Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC96FC5
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Sep 2023 17:25:26 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FFB12C
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Sep 2023 10:25:23 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98377c5d53eso376826066b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 09 Sep 2023 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694280322; x=1694885122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtHKByaO53mLrbhpOGtiNi3UJuvzIoQGu11pZIXNTFc=;
        b=GHdOtEYWwQaGowIKc5+ZrOOaV7WEGEyxdFcc4KhS56w5oSTaft1ruLHymIAaR5Y4Kj
         J4mBKfs7Y7G628cSb4h+Q0d/TBlFZ8TelRtJ94vgyFF7aUSNd4dNtx4n+Uhw0nWJp2ed
         BymrpRZ7HlzQWoMj/Cv7kssoXUild/gbNucFPupf2MLRCW7iTC3UjHaR82F95djfTRwg
         f9LQxMN3KwoEeH/rxAevHo97D0HQHblvMwBAdV4X9FkvIr6pY7lwttXjWkxRbn0w91T+
         Oefyijb6ulNOb1A64GdF9792eo70ta8Zj/fvxx9l/N9SjwsJ3KnFtuA30Akxu6YwD8TO
         LCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694280322; x=1694885122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtHKByaO53mLrbhpOGtiNi3UJuvzIoQGu11pZIXNTFc=;
        b=Cye5SE6JWE08Fb1bzvyfo2rZIfnua2FTBRp5H3Tzvs7HYwfISO6p2fTfwjnHQh3JED
         ecSfPRXzBgODH46q+yW3OhJY9nPx5THZ927cYaG4DVq4NWBfUxBpZ7JgfoH6OwLo2JAd
         knTyraw027hT7/OL4rCO1UWWo6kuKNMO/0LTc24BywosvHm2oyOp7VyyxnYWsRWeMkSE
         0uXYIeZz4X+urC6cbpNphhWr6H8GNSGtJH/NKPRJbAkbtgtT1VyIDdYpdVZqgwRZPqrw
         hgBPIY4HIkW8YwxT3eFLibprMyBx631MY64Em8OlKCxgcCvIcQU9QuK+p0GlFyb4Zitk
         3dmQ==
X-Gm-Message-State: AOJu0YxAenUc5+P1YkjWVkPf2TOIYefdEyBZSOf2DBl4nq5WrpWbynWX
	3EhP01D1j8OQRZJ8vFWSAVYz/dro5w4=
X-Google-Smtp-Source: AGHT+IEJ8ciZgrTl09NoByNgQuPAzQJazma/ptaFODvNb9gSHK99N1xQLKNMiXskRcXdIiysio/DkQ==
X-Received: by 2002:a17:907:1dcb:b0:99d:dd43:d427 with SMTP id og11-20020a1709071dcb00b0099ddd43d427mr4359641ejc.10.1694280321606;
        Sat, 09 Sep 2023 10:25:21 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id c13-20020a17090603cd00b009a1a5a7ebacsm2525444eja.201.2023.09.09.10.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 10:25:21 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id A7C6E27C0054;
	Sat,  9 Sep 2023 13:25:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 09 Sep 2023 13:25:19 -0400
X-ME-Sender: <xms:f6r8ZGguvnpK8edtxdoV4l7QiWN_IaClyj7Qo2qFhd11OlgqPbnGfQ>
    <xme:f6r8ZHBOgWBaxqOcjF4iPFll16Hd3YrsPn7kDJKm_z7AJmlwm9KvlWK3Ooy1xUYcz
    w43LoqVS0hnOMT9kw>
X-ME-Received: <xmr:f6r8ZOFdJ6qJwXP8_n6q1qDzFp_61mZCuk4lXFYO2XawyFvQxOWiIMQOd5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
    dtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhg
    sehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedtfeegveduffelfedtiedtvd
    dvkeettdevffdtgeetgeejfffgueehfeeiiefgkeenucffohhmrghinhepghhoohhglhgv
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:f6r8ZPSKar9NKwCcu1jwA75AvOSnK_wgB6vknkz7t779jaZtw0v1dA>
    <xmx:f6r8ZDwmaCbRgEPKXteKfTDIku6cpsvsm_3GfK-MaMsep0XBoDynVA>
    <xmx:f6r8ZN7L6LSuqWdhSGtYBD2J9dXJiJq9fsZkcgysJaFUSfgoMfscbw>
    <xmx:f6r8ZMqApJUtXL5d66Do4xdzKy6Bu6U2yUmw9HX_Gm-dY1T1gdzRdw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 13:25:19 -0400 (EDT)
Date: Sat, 9 Sep 2023 10:23:56 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Rust for Linux Open Meeting
Message-ID: <ZPyqLJ62B2GZg6BA@boqun-archlinux>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Jul 11, 2023 at 03:12:15AM +0200, Miguel Ojeda wrote:
> Hi all,
> 
> We will have our Open Meeting call on Wednesday 18:00 UTC (first
> Wednesday after -rc1 is tagged).
> 
>     https://meet.google.com/vii-meij-xpw
> 
> Like in the case of our old informal call, everybody is welcome to join.
> 

Just a reminder, same as the previous one, we will have the "Open
Meeting" call on Sep 13 18:00 UTC, come and join us ;-)

Regards,
Boqun

> If you are in a timezone that cannot easily attend the meetings at
> 18:00 UTC, please let us know.
> 
> Cheers,
> Miguel
