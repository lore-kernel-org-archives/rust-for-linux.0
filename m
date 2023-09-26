Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224114A32
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 06:20:36 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C968E6
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 23:20:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9a6190af24aso965962866b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695709234; x=1696314034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pp/B9nL6NDpOnEbUyT1OfK+7D0Ozo/hUqBQXOVCXN+w=;
        b=Ia4Wh8w2gkzzGjXbVIczNBTdeOmaS3Q5fyVB3QPruvAc+bADi9bbKUehqAQod955XF
         TzX+Zl8S07xz9u6Y3jtlBlrC3F1+C6G2z94iC/1vIs9TKSkzJpJoeGvk6tKTgsM/aLsG
         pTAMawo2vWjhU2Z/do997mop2RTpOhXHSVmol0cLJEIIvYREQDVuYku9vVB9Gc1ZgJlZ
         7QxnSXc8KD//Vy0sWX6lcbMEOBXZrK2dKB2Ue+X7nBL0ggPEfg+hILDBj+MIC0HLRAQs
         A9078PI2Ii6oyDxMM6Gptw7LctdWFFRKg6a8fnzzM6k5caKucOQsu9t+aiEa8OVhDAXN
         /63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695709234; x=1696314034;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pp/B9nL6NDpOnEbUyT1OfK+7D0Ozo/hUqBQXOVCXN+w=;
        b=Vzl7gy0JffGnhPWJO0KTnwZNw28/0IsmS7AkqPRcykDkiIe7QmSFxyNXHEJNdwgsjU
         FFuXMDRaQ/PmtQdaXMj9yyz8LinFp9YIc9BJUK7b0yD0VkAFkk/mO/Z6tsKTI2gt2sf4
         hjXGzHOILYEvf/cLE/c7tP6O1z2Nsw3pDWi1kX89cJGvp7NoXVIowmxMtn5DHvnaHlRA
         qdmXPSk1Zif1ehNS7Xi13jftXA2xtscHLox4WJO1icJPfItbfBlSbubRXhdnUIZmCOeL
         Nt8Ys2F9GCfQdCLE8ILS8fcwLp3FYvt1byZkqaLpyA0ld6UKe8Z9sjGaGXPWemeMf4NQ
         vvvA==
X-Gm-Message-State: AOJu0YzdURpj7NbQAMeQiavIWCiyZoayi4n7Z6oeB5Ve3v+DeNUcqfQ5
	IlKi0dRaVCI16iC8AFH+ijU920UKpJiVZqHHyDAEZA==
X-Google-Smtp-Source: AGHT+IGZ9/R3lgoUOs46DVTLjXPu+AQM7ntpvbhAPMc6hFOPbAfbHzFV/2PxUfgXPKY7IoqgWJtEWm4t2PZhTII1dGQ=
X-Received: by 2002:a17:906:9b1:b0:9a1:b950:abab with SMTP id
 q17-20020a17090609b100b009a1b950ababmr6331733eje.32.1695709233990; Mon, 25
 Sep 2023 23:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: by 2002:a17:907:708:b0:9ae:22c3:5b8 with HTTP; Mon, 25 Sep 2023
 23:20:33 -0700 (PDT)
In-Reply-To: <20230924064902.1339662-4-fujita.tomonori@gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-4-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 26 Sep 2023 02:20:33 -0400
Message-ID: <CALNs47tecmP6yL=ogjEDPuLBS6q-E=fyya7xKQ-c2Uc7kTsx_A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/24/23, FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> +struct RustAsixPhy;
> +
> +impl RustAsixPhy {
> +    // Performs a software PHY reset using the standard
> +    // BMCR_RESET bit and poll for the reset bit to be cleared.
> +    // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY
> implementation
> +    // such as used on the Individual Computers' X-Surf 100 Zorro card.
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        dev.write(uapi::MII_BMCR as u16, 0)?;
> +        dev.genphy_soft_reset()
> +    }
> +}

I don't think there is any reason for this to be a type rather than
just a function?

    fn asix_soft_reset(dev: &mut phy::Device) -> Result {
        dev.write(uapi::MII_BMCR as u16, 0)?;
        dev.genphy_soft_reset()
    }

Also, we should make sure that the user-available MII_X constants are
available as a u16 rather than a c_int.

- Trevor
