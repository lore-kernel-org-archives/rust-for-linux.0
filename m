Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A7A2A
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 01:13:20 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81962E8
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 18:13:18 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-277317a0528so456266a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 18:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695604398; x=1696209198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qnagk8r7yfaE4HNyIdB5nRlyyC83jBI1WWPF7Nua10Q=;
        b=KlQLxuOChCTk2QPuYGGhph4gOtIIzWKAxoP+7pEDeLQsSaJmG6v1BiO0oIpakLyqHw
         YJS+0ZJEML9g/8nF2jjzvhNaa12Ig+3ZGx9uB1uR7fpVD3ZvCIvcTfZRXu895AgzvWCn
         PpxqQVmjjsGoLHDKjKoPZL+c6Q2EhzNfRomytnuPUbehkzrE213hvGtQWi0uf20xpwaq
         GLQfes5/96joz9nI/cZPRw7lTUe7CffKXsPSR6dG1pdH31wlkYFzGKci3Q3OsX4KaHSW
         g018zy5fQf5eM8nYV9ZBAQoQmNemeE6GdiibpYr5PK7ubSJtp2zJNMGgVQ9W2TcqUA92
         4wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695604398; x=1696209198;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qnagk8r7yfaE4HNyIdB5nRlyyC83jBI1WWPF7Nua10Q=;
        b=AlxJUZer8354dWVrEJQZMS0phcT2sUIrDtfjlKYnFPE3EpL/17BvzVr427m0jKx1sW
         unSCsyGw1LuynYhuD69eXprgh4fh3uJwxTSGcoFw3hysLsOGxiVoVsqurX7HUylT7kTY
         FZGpk1cR2csXCaiS8Ph0WB7LFnI4F3VfZJ0k6MkJHMlrdjgnfCcovBnkye3kV3G5XCj1
         O+A+p12HIGcJyAOxUROSm/3H6uKlOZ8nDDTWp4KO8SG3rJHRxI5NgLLMLw3gKlixmin3
         FjYbTDRk/8JrEeCMGiNOxz/E8qcscOdrcHsjkpwPtTDGfPLzdEikX9MDmxGYi72pZKtx
         /qaQ==
X-Gm-Message-State: AOJu0Yw9yN9nEcA5yS5ZRFprhYiP2yQZMWIvJ6B+RlYOQDZNnCFXywd0
	LHFJuqWT9BT5lqlEMlqBn7Y=
X-Google-Smtp-Source: AGHT+IFxE9+piitYAOoCVD+XdpOE+ERsTVt6FhEicZE2kiYYhImNgq4Fg1bM83qtTy7xB7tjp3Y1mA==
X-Received: by 2002:a17:90a:bc9:b0:268:38a7:842e with SMTP id x9-20020a17090a0bc900b0026838a7842emr4837401pjd.2.1695604397818;
        Sun, 24 Sep 2023 18:13:17 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id 7-20020a17090a034700b00273fc850342sm9389771pjf.20.2023.09.24.18.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 18:13:17 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:13:16 +0900 (JST)
Message-Id: <20230925.101316.1428618195606780609.fujita.tomonori@gmail.com>
To: andrew@lunn.ch
Cc: wedsonaf@gmail.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aae808cd-68c2-44a4-9e01-2c5e01193fbf@lunn.ch>
References: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
	<CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
	<aae808cd-68c2-44a4-9e01-2c5e01193fbf@lunn.ch>
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

On Sun, 24 Sep 2023 17:42:16 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> > +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> > +    /// may read or write to the `phy_device` object.
>> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
>> 
>> Is the requirement that nobody else may read or write to `phy_device` realistic?
> 
> In what scope?

Inside a function in phy_driver like suspend().

> The phylib core will use phy_device members. The MAC driver has a
> callback which should use phy_device members. However, the phylib core
> also has a mutex to protect phy_device members. Nearly all calls into
> this driver and all calls into the MAC driver are made with this mutex
> held. And phylib core also uses the mutex.

Thanks for clarification.

I thought that inside calls in phy_driver, exclusive access to
phy_device is guaranteed. Please let me know if any exceptions
exist. I need to think about locking when adding such to the Rust
bingings.
