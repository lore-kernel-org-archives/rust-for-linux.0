Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4B1841
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 12:32:51 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7E8AC
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 05:32:50 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-27467da531eso606590a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694953969; x=1695558769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhbQVX/+IzaGjIT0oVTdvgrpyCMD4Pa/Y0vwssaACkQ=;
        b=YxmsOz2FL0BG5Y4EUiSXVNrrudoGpdk7xjrBqkStxUdeSPaWNTORm7pRybvy/4GjSl
         5hV3+QEGNfe6U9E/qj5+VCdpg5qTuLy0qzU06NjcC1vPajFcCUww7BdGOOxwaesQiee6
         tZEUS7JXmT8MTEEKZ8nX1u5bQ3uDQhNi2V3Bn2anHXnfQNvZsqmhwDqWulDwUJfFTha6
         pZdtev4aleYdRmlbLXmbDZRvRQsraHfLOdhhXlCr20DFB5CacenjcDV+X5FQ2y7AxP+T
         oDL+hsZuHuuEFdGM+qA7qE4lwktISIDx4jwd/cVqmSEreDQ2u/il9+QOWM0FlkWno4N8
         ovfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694953969; x=1695558769;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FhbQVX/+IzaGjIT0oVTdvgrpyCMD4Pa/Y0vwssaACkQ=;
        b=LKxJf74acsY9jSi8M4PJTOdg+7ZkLPFCzeIT3iuLAA/2RQUDMM6HdhGhy/gM/B1oE/
         8sx8HMVB2zxnbF5SYn5XkElDebAfaak8TvGhThPzVnEzAFmk52rHPuPby4xuQ3VCkm9v
         ryr6pKK7lumMRNvlLbhLhl1vRfBFysjx89t7lPAWlQ0B3iz8IeAzVLYlaS+RU4ZnPK8C
         aPnqEr+H1rIBrzh1zUXpdm7VNlqV0VuTCMeWDhKQUiUxE1cEjvkgPY0QdFygxihea/aQ
         nbxWKRl66DMiBKpBJF4tqvFgzSu7JshX1XLwd7g92+ofKiDUVVtHHpB25oxRoAGyvPfw
         71FQ==
X-Gm-Message-State: AOJu0Yyvm2ATQDvffTCcTwQ8zpEfgjsiWZaLNJWTElf7jYK+78LrjI3k
	FexIuWadK0ulCSc6z1DlaCQ=
X-Google-Smtp-Source: AGHT+IEZykQA2idZQqF2Eow6yGvlQ8HaQ78HAeY0WJTAhMbKJ+6UPTQFmu13Ah4KaqtYL253KKY8zA==
X-Received: by 2002:a17:90a:5608:b0:26b:27f6:9027 with SMTP id r8-20020a17090a560800b0026b27f69027mr5868784pjf.1.1694953969484;
        Sun, 17 Sep 2023 05:32:49 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a195b00b00274a43c3414sm3861870pjh.47.2023.09.17.05.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 05:32:49 -0700 (PDT)
Date: Sun, 17 Sep 2023 21:32:48 +0900 (JST)
Message-Id: <20230917.213248.712797486250583805.ubuntu@gmail.com>
To: andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file
 to the ETHERNET PHY LIBRARY
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
	<20230913133609.1668758-4-fujita.tomonori@gmail.com>
	<dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Wed, 13 Sep 2023 20:57:40 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Sep 13, 2023 at 10:36:08PM +0900, FUJITA Tomonori wrote:
>> The files are placed at rust/kernel/ directory for now but the files
>> are likely to be moved to net/ directory if things go well.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 90f13281d297..95ecf96b911a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7797,6 +7797,7 @@ F:	include/trace/events/mdio.h
>>  F:	include/uapi/linux/mdio.h
>>  F:	include/uapi/linux/mii.h
>>  F:	net/core/of_net.c
>> +F:	rust/kernel/net/phy.rs
> 
> I would suggest you add yourself as a Maintainer as well. You are
> basically stepping up to forever maintaining these files, at least
> until Russell, Heiner and I learn Rust.

Happy to do so.

> And to make that maintenance work simpler, you might want to move
> phy.rs to drivers/net/phy, so it is alongside phy_device.c,
> phy-core.c, and phy.c, the files it needs to track.

Works for me.

Miguel, any concerns to put Rust files not under rust/ directory?
