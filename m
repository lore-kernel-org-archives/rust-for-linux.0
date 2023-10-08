Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E828C15
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="BylOMK7N"
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33233B9
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 02:58:42 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a1ec43870cso44027137b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696759121; x=1697363921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BUOfZ5u4Lzp581IO/H3NzM1c5ss1yPUdACAcJ9LVNM=;
        b=BylOMK7NmVSahNBAlo1SDdHmhmy+RdGakW0TSqehnucOdj8zoJlzKZt/zkuNgaqtf9
         TG/cqny8r6JOJfpjHOjA2zoBEyKq57KqB27zZLVCWVY3xdN2YgFRqCT81dida0mNrsYb
         5fXnX6aAQjm0VXBHcd1bdSTJRktC8BqTBJ9P0p2sD833ccOk097rV8nbBnhTVDxHpbee
         jhkOpzP3TWTziSWYnPuPaccCdKqvjEkh+Z/droVlNWXyCAfYoQ2/wJEB/m1Iqi7zJZU9
         sx3jvAUF2qii4Mjt9dulG2zNCjkr/14ZMutsrE1nmmrE8KGdY+hEYWXNjRu04RhGVRvh
         FJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696759121; x=1697363921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BUOfZ5u4Lzp581IO/H3NzM1c5ss1yPUdACAcJ9LVNM=;
        b=HWX2qNPm1eEYYdFpeVCr4p5z1z51axIVy0pdSw3A4qiFhpBFNlf/oOeQZ+i/K6/gbh
         R9h7dRjJPLxfmPyEB+C7zQ0DTE1zgknpG9vq/941Q8mqGo5qaMRhtQ1elnRD6N1F2hdY
         gI2wCRcUy+/uYUL9c/Hw7k2tQCW09a10UbYCqLdIK/iRTK+cDggP8YpcumOngkatPzWe
         cSV7odW9OWfwAOhorzAp1TXOEXo6Fjbg/64v9B6x0doaYmPdu3gn4AC/7ZyDgi05/lNS
         F7QynPo++4NrYj9OLEeoFKIfoCSYWSiAXg2Oh9T2A5VnN/XEkQwJVul75OUE0W0gH+Ii
         VIOA==
X-Gm-Message-State: AOJu0YxPogrSSjXr4Rwci3W7Q1pIPFIZOrrD58tTs5FauhCVqKDiAGoK
	HBKnR6URFeVlUmo4j7I9k1Kgxaou0qHGQOk5aqk7Ww==
X-Google-Smtp-Source: AGHT+IFYOapup9gAZulsLb2yT23Pw+WtoQf6F8HLfw0peZSp+NaZDSv11chD2x3ak9BjYSOZSCCsE/cEu0u/YnZ14LI=
X-Received: by 2002:a0d:cdc2:0:b0:59b:d3cd:ffb6 with SMTP id
 p185-20020a0dcdc2000000b0059bd3cdffb6mr12651258ywd.33.1696759121425; Sun, 08
 Oct 2023 02:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47v3cE-_LiJBTg0_Zkh_cinktHHP3xJ3tL3PAHn5+NBNCA@mail.gmail.com>
 <20231008.164906.1151622782836568538.fujita.tomonori@gmail.com>
 <CALNs47sh+vAXrZRQR8aK2B_mVoUfiHMzFEF=vxbb-+TbgwGpQw@mail.gmail.com> <20231008.180257.1638765262944543712.fujita.tomonori@gmail.com>
In-Reply-To: <20231008.180257.1638765262944543712.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 05:58:29 -0400
Message-ID: <CALNs47u66Lr5LaD_+V14eh4vyrV_FKsQYdxyDTzgD35gBc5FOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: core abstractions for network PHY drivers
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

On Sun, Oct 8, 2023 at 5:03=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Yeah, now I don't use paste! in PHY bindings.

Even better!

The fix was small so I sent it anyway,
https://lore.kernel.org/rust-for-linux/20231008094816.320424-1-tmgross@umic=
h.edu/T/#u
