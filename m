Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6186539E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 07:07:27 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D3F3
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 00:07:26 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ae473c0bd6so401773b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695712046; x=1696316846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTAHqRp3GCcNiTwFmobBPSIMHg4RBfAScyLuEZ5Fdmo=;
        b=X/bBkYrG1v2c1Yu+/InD0wyRlnDJiVzvajtxhl2+AvR3usmiTE9BSF6aGDjTcH7PfL
         5PYzvVlHWaK6WNWbtC14YFwHOtlxW8FnqRV0SMPfJdgu4qtQ8O13inPkP+ywdob0AXkd
         IJmfexAcBDi8GwCjhFf22V7721VFDT5D4nAxGPczdXgS0j/9CoHa1kQ5oMI+bEayze3u
         9UCvmN8CAeI5BcdpgzM6JH8lkADWNnzXbqb6VgNDFOEuDfhyWoBhjm9Ojwa8zyGRkQwW
         6k9mOL1FeAGUbz5Qy7+T4prIaOvNIbWCKkIE43GHeKgPRBB93R0JlDwcYjYnopb6RE+d
         Au6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695712046; x=1696316846;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zTAHqRp3GCcNiTwFmobBPSIMHg4RBfAScyLuEZ5Fdmo=;
        b=W762SdyeIo3fpU044tiIL2ruulqOKToykmMEtLzlbPNvP0ZmXd44PUUStDurjOrF4I
         LdGtdmAFeNjaoHzW5XShtpA5V6XlCmszuEFdIWtS9CvInNGsj+DIgnn5jGUD1MENLeFX
         AolMkg1zqSqYeB+wkWgT1YJjYutDBhqgV88A6A/baCOrOKsu02iUxsXOiBP1kuriEGK6
         y7aiXlQRABLDI33SwOd3yTcxfK/KKNxC6ecSxwMy+8JbUNNJ7lMRnfw3Zu/2VILvW0FP
         QQoo0oea1BZKNF52lrixDTxRwQwiHL2PB2Fa6aBzKKl/ygHCzV84G928mhuMRthEKKuK
         Y3ZA==
X-Gm-Message-State: AOJu0Yxv/R8FN7O574ki8P92F5CnvcW/R92bBIg9CQ4flKTyQ2DTHGQa
	zELIZwZhq6jkszi95T9K9S+QJz29gbwbQj4P
X-Google-Smtp-Source: AGHT+IHUNM55KrEPSN93OGYRmmPuRgQ8OiKLvVwT1qhDbT9aEulug9UxExq2KDbV/+/aws9oKESvtQ==
X-Received: by 2002:a05:6808:158c:b0:3a9:e8e2:579d with SMTP id t12-20020a056808158c00b003a9e8e2579dmr9860209oiw.2.1695712045728;
        Tue, 26 Sep 2023 00:07:25 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id j17-20020aa78dd1000000b0068c1ac1784csm9276485pfr.59.2023.09.26.00.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 00:07:25 -0700 (PDT)
Date: Tue, 26 Sep 2023 16:07:24 +0900 (JST)
Message-Id: <20230926.160724.485514445673047276.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47tecmP6yL=ogjEDPuLBS6q-E=fyya7xKQ-c2Uc7kTsx_A@mail.gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
	<20230924064902.1339662-4-fujita.tomonori@gmail.com>
	<CALNs47tecmP6yL=ogjEDPuLBS6q-E=fyya7xKQ-c2Uc7kTsx_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 26 Sep 2023 02:20:33 -0400
Trevor Gross <tmgross@umich.edu> wrote:

> On 9/24/23, FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> +struct RustAsixPhy;
>> +
>> +impl RustAsixPhy {
>> +    // Performs a software PHY reset using the standard
>> +    // BMCR_RESET bit and poll for the reset bit to be cleared.
>> +    // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY
>> implementation
>> +    // such as used on the Individual Computers' X-Surf 100 Zorro card.
>> +    fn soft_reset(dev: &mut phy::Device) -> Result {
>> +        dev.write(uapi::MII_BMCR as u16, 0)?;
>> +        dev.genphy_soft_reset()
>> +    }
>> +}
> 
> I don't think there is any reason for this to be a type rather than
> just a function?
> 
>     fn asix_soft_reset(dev: &mut phy::Device) -> Result {
>         dev.write(uapi::MII_BMCR as u16, 0)?;
>         dev.genphy_soft_reset()
>     }

A function is preferable than RustAsixPhy's method?

> Also, we should make sure that the user-available MII_X constants are
> available as a u16 rather than a c_int.

I'm not sure what you mean. MII_ constatns are 0..31. That's IEEE
spec.
