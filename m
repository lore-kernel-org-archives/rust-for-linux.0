Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72A1A732
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 16:37:53 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32928BD
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 09:37:52 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a24b03e22eso31978417b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Oct 2023 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696264671; x=1696869471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg3TulfyRoX7Bn8oJRx6nf2OhkTOFbGirZPtI7uOMf0=;
        b=JwZccVcFT3pri7jV8UfTnpSRIoEg1LyH5/Ruvdug+hVDpvj/6OHmujLe/EqkCfbeq6
         hDiOjI4TXxplG7Y/Yj90pmd9OlbTPrba6rV4sPMuoGFC0d3Q58nnrTRtN+tKfsYoqZEZ
         jAvOT7JDAdybP8Zwicd+fc9DgsTP1duNX2MUC1ss6uyXRLvqCSHrokSmjf38sAh/PmPh
         BIP6KDgexSrnTDIvwMuSzL5q7JCyCLppyjg0UvWjyTholaY/tAWeveCT8dxANHqnhK5j
         8AxZJkUOQZahRcYKJgdX6ciXMckT+jkA4QAxTCkVShnMRGIT6/VJJhZzxDF21rf8CsLm
         1VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696264671; x=1696869471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg3TulfyRoX7Bn8oJRx6nf2OhkTOFbGirZPtI7uOMf0=;
        b=W45TzCjxfFCZXnMu7WbOTZ3GGZXbsp+mvkEO534SkX7xqCIAw768ODi5e0R3pEo4Re
         hcRVmr0a+RtUbzZds6RLiu8SnTXaGSKmcbdsbMU/0bW4sl+pE20b4aiVLRKX/6dJO6Fv
         sR6vHYd3z6jtYa3o67ixQhJXexSg/tsEkicG3R8qkk24+Uk9bXmtlYizxqWONEkYl6Uk
         PHRnK29+N4nPSNR56GgS7S9XurUDHpJx7PN14IM6NwgEIa1g+GYncTkq0YCPYA7DtKiu
         WL4q6ciJdsu6A+rD20QFXCiySFKoSP9v4g/d/Jaz0/qUSH0ngDNNk5mrLjpvFaQNDeDO
         NAbw==
X-Gm-Message-State: AOJu0YzjNBRmmUEVFpYM0rOvDxWHiZN8lFZ0qNzVfNMF6hqbHdRiLIRI
	Ef9oeJjrs8QTl2adbjJLlhKCyKrAvzC7R0gthbMkxA==
X-Google-Smtp-Source: AGHT+IGFYuOH2LSLLbyKIt5RDbzxPQEYsSL9EyhRm5KDhgcuJQZafwVO+TFtnxRz39a74C24IaaDW5VuqJJpmt/ZYHg=
X-Received: by 2002:a81:5f54:0:b0:59b:65d4:4d73 with SMTP id
 t81-20020a815f54000000b0059b65d44d73mr13078400ywb.27.1696264671371; Mon, 02
 Oct 2023 09:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com> <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
In-Reply-To: <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 2 Oct 2023 12:37:40 -0400
Message-ID: <CALNs47sUKvJjiDPVzSfsXo=TMeo3vUpmsZUuGaUQHV-zfvZRcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, gregkh@linuxfoundation.org, 
	rust-for-linux@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 2, 2023 at 10:09=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:

> Does Rust integrate with kerneldoc? The C enum has a header:
>
> /**
>  * enum phy_state - PHY state machine states:
>  *
>  * @PHY_DOWN: PHY device and driver are not ready for anything.  probe
>  * should be called if and only if the PHY is in this state,
>  * given that the PHY device exists.
>  * - PHY driver probe function will set the state to @PHY_READY
>  *
>  * @PHY_READY: PHY is ready to send and receive packets, but the
>  * controller is not.  By default, PHYs which do not implement
>  * probe will be set to this state by phy_probe().
>  * - start will set the state to UP
>  *
>  * @PHY_UP: The PHY and attached device are ready to do work.
>  * Interrupts should be started here.
>  * - timer moves to @PHY_NOLINK or @PHY_RUNNING
>  *
>  * @PHY_NOLINK: PHY is up, but not currently plugged in.
>  * - irq or timer will set @PHY_RUNNING if link comes back
>  * - phy_stop moves to @PHY_HALTED
>  *
>  * @PHY_RUNNING: PHY is currently up, running, and possibly sending
>  * and/or receiving packets
>  * - irq or timer will set @PHY_NOLINK if link goes down
>  * - phy_stop moves to @PHY_HALTED
>  *
>  * @PHY_CABLETEST: PHY is performing a cable test. Packet reception/sendi=
ng
>  * is not expected to work, carrier will be indicated as down. PHY will b=
e
>  * poll once per second, or on interrupt for it current state.
>  * Once complete, move to UP to restart the PHY.
>  * - phy_stop aborts the running test and moves to @PHY_HALTED
>  *
>  * @PHY_HALTED: PHY is up, but no polling or interrupts are done.
>  * - phy_start moves to @PHY_UP
>  *
>  * @PHY_ERROR: PHY is up, but is in an error state.
>  * - phy_stop moves to @PHY_HALTED
>  */
>
> and this then appears in the kernel documentation:
>
> https://docs.kernel.org/next/networking/kapi.html?c.phy_state#c.phy_state
>
> Can we expect to see a section maybe referenced in
> https://docs.kernel.org/next/networking/phy.html generate from the
> Rust code?
>
>         Andrew

Miguel mentioned the linking but in case you were just looking for
docs example - docs are temporarily hosted at [1], and a sample enum
(not yet merged) is [2]. The docs aren't yet available at
docs.kernel.org, but I believe that should be done within the next
couple months.

[1]: https://rust-for-linux.github.io/docs/v6.6-rc2/kernel/
[2]: https://rust-for-linux.github.io/docs/kernel/fs/enum.Super.html
