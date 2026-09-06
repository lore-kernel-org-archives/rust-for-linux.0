Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B154378D7B
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710027; cv=none; b=Fc8i3BU0m5NXXTaoMrjLKJ5Q9LuXTpZuS5ZCay4kYaReAGSFikqrflAmsD3iBtM0KMjZ/1dzDUlcJWqJEtVZyBT5xFojpCiK6cVjvcKrUQkxBr8mbXhwRfpBjG/kN7etBEmhWqtt3qrIzK9yHG2yWuk4u2Zy68inkIpZVkXtsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710027; c=relaxed/simple;
	bh=iXeuXZinLwPRHtHoRD2Ox32yQacS6fb88foD+iwKC5I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfY8cyfOP/oBs0swGtdW0RGnULszRiJhN3elUzgAdsOHguYw76+NkGBh6SemvLSNkJvVZXbdbRZIFjZl5yTSqtgqL1ibWlHXiAgXEvNsQfaV4mz40jqw/N731MHUGLdkF+19ZS2wI1nXn5vBzsawIW49111tcpsgipXKRxHTo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0k1WdWs; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0k1WdWs"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca80d708489so1951908a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710024; x=1789314824; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZKG0N4Qd9s3jT0vFHcSeVc0433ACE4MO/8edec8Z6I=;
        b=I0k1WdWsx9WNfUFzK3BCcm/BNEFTWwsSSN1wsCkjh/W3e03sW3FrKRgga6+nkV5OIa
         GEqvcSuepfem0vtcK9eRFpdHfs0fsmMrFwXcXObxNZ0W/5MTQfFnnzXgCch1vdFT355o
         AKlgGOiBw7NXbkXRQhWgRlnS73Soey6eW/4SWZOlLv/qlWWc4yF5Zc0UfmVCgbtRfA7p
         Rab3z+XWQZPxKy0j9hBclzk5skPzkXj9IYYjj+lQUrExtfpo0tRP+TGkOLjAtcwVM+gS
         0vg5gESMA1idbisUWf9LZEANhJ3vno7R5txyykz0JKQOhgbsYpBSQcA8B5+Q9QZbZR9W
         4V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710024; x=1789314824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZKG0N4Qd9s3jT0vFHcSeVc0433ACE4MO/8edec8Z6I=;
        b=Eq3aLbhmcJrb0WfBuAqxHwjIhn51fwACTVtR2R3ROdVPdQapdGzZGFi+D37Kn3RD89
         yVzctTK8wyDRPtE3MuU8GgYDE5WVm92gQ48nl4QDtsrd4MViZht51Ktueko78ECVA/e1
         7F7kQ1+IRV3lhFLmPAwId/RBigXzF+fgtSlYoPL+lZznWXD9Awzo2+LP46Qfs+gQQVlo
         QxbY6jl5P+z1xvJ8z96mNPYyXTRAhy/r6HIQQyYtRskPANetuzTRB1xuedcmFRGoofOr
         gEpt1oH2Ea4h9aoGOjEwXWK79Hl6MmRKc8F75Isu1Ybca1UBNTjpmMshrJLGVg27FR4j
         adIA==
X-Forwarded-Encrypted: i=1; AKwUvBwnBKQIDZEglp3S6phqnokfcYU8q8mojr9Iho+XtPbVXxkAmrlAC3oXbALn4aDS6kZO45e7jOiZXa4Y4AjDUA==@vger.kernel.org
X-Gm-Message-State: AFuF++mFsGTQt5xDVqMuBDt4TxguZzwFSs5LjYXTyiin667uURTSqT7e
	CXPIWauRJtMuUIWf5E6UrQdyImBpFeY5ko3NXbOSTb3LZBcH/eZ15vkV
X-Gm-Gg: AYBFou1ZOjx8kIFWgb4MQsOZVcxxnaToDpbatqKPtVUHCYte5/q5yFLDlVr5Ch4hJcH
	CH6OdxgJ0r3e9gLN2ge4PiLYcVZhqKz9qxyD41QTo12EYPR5g8fScPkcc1ObJUnZEIRx3SmbPpo
	HGXuMRmgg6W+TTVBGQslBUMXeFutOmoQgiOUEolJOSHN4HX4Mwl3k3neytr3ONTGwvAbfHC2F1C
	Jn7GcNj5Lf3sY97vCk5pJGveLB4DsdmYMaDhiLDHMkubaBbFmVsCkY8EbXpoQTbontUkvxVnq/m
	StDESdyaMVXycfYbIT6lMKqEtTQKC7KEDd5uojXL4ROqgedWcV14A9WVLxoIUl9BH1EUSkwuyr1
	Loy7zjrdVTmwAJ+S+LMJY89GupCXP1FaPu/BqTea75ezPUpcTcPnfxB6oGNGhvpc6jV91Ntjd0p
	OiewVawTVhLOhI2rDE39L8SPLn/j5o9kQtwjjyyXejODv25JLO9zimzN87rLlHShFAgpOsSL74x
	SHWic2nYsnYDdMgw5g=
X-Received: by 2002:a17:90b:2ccd:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39b27c442f8mr14641110a91.5.1788710024292;
        Sun, 06 Sep 2026 08:53:44 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm21561901a91.10.2026.09.06.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:53:43 -0700 (PDT)
Message-ID: <6a9d8c87.7436a696.197962.124d@mx.google.com>
X-Google-Original-Message-ID: <20260906155336.vppadsy6zpw3mlfa@DESKTOP-1P5QNTF.>
Date: Mon, 7 Sep 2026 00:53:36 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
 <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
 <DL89AIIO0EQF.3U7UGK7JIRZ72@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DL89AIIO0EQF.3U7UGK7JIRZ72@garyguo.net>

Hi, Miguel and Gary,

On Sun, Sep 06, 2026 at 02:09:30PM +0100, Gary Guo wrote:
> On Sun Sep 6, 2026 at 10:56 AM BST, Miguel Ojeda wrote:
> > On Sun, Sep 6, 2026 at 10:46 AM Kohei Ito <koheiito.dev@gmail.com> wrote:
> >>
> >> Add the top-level GPIO module with minimal common definitions. This
> >> module is the basis for future Rust GPIO extensions.
> >
> > Thanks & welcome!
> >
> > I see you Cc'd linux-gpio, which is good, but the GPIO maintainers
> > should be Cc'd too, since they are the ones that will be deciding on
> > this -- doing it for you in this one so that they are in the loop.

Thank you for adding the GPIO maintainers. I'll make sure to Cc them in
future revisions.

> > By the way, it is nice to see GPIO again :) Now that some years have
> > passed, how does it compare to
> >
> >   https://lwn.net/Articles/863459/
> >
> > ?
> 
> This is possibily also a show case for all our I/O projection and register macro
> work :)

Thank you for the pointer. I was not aware of the past GPIO abstractions
[1].

As I understand it, the past GPIO work focused on the GPIO driver APIs
(`include/linux/gpio/driver.h`), i.e., for the drivers that provide GPIO
functionality, mostly present in `drivers/gpio`.

On the other hand, this series implements GPIO consumer APIs
(`include/linux/gpio/consumer.h`), i.e., for the drivers that use GPIOs,
such as `drivers/leds/leds-gpio.c` and `drivers/reset/reset-gpio.c`.

I assume that the GPIO driver abstractions will be implemented later in
`rust/kernel/gpio/driver.rs`.

[1] https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/gpio.rs
    (Current hash: 18b7491480025420896e0c8b73c98475c3806c6f)

Best regards,
Kohei Ito
