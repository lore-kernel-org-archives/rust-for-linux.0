Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157B6FB8
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 06:24:47 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FC8102
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 23:24:45 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-56f8334f15eso403921a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 23:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695104685; x=1695709485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncz/H/t/o7ROvGeNO0dTGrweBMMwHbEC5jeau+oSfJg=;
        b=cWMOftPLy/fNhGFNPJMDVkXSOPzI0WXMyBAXw7uj4omTZPEW8RAZGihGKXxyiPezE4
         yXPoFxvlXLeIr/HzY0Y95KOcfzW0+y9AsPrmkDgv9qitscrHVWmD8fx4dIou6b6Jxl4u
         oPSBkzP4yLtkNH5N3dsOiyhjHEufJgVkkplJOuD8FHCMHvPSnY0m/ClmaLEWvClQBTiw
         1w8idZnnFCTm2n8cI5Ho1VQHnoK1+B14VrTMiatmxkU3zf7687nHsbAja8gsNCKXWX7p
         QI75cFpjwu/1e9YW7Oie1yRcfeGcqWdJONhs861pUvHDs7AKvnhg5Kf2jZykKsPWVaz5
         uyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695104685; x=1695709485;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ncz/H/t/o7ROvGeNO0dTGrweBMMwHbEC5jeau+oSfJg=;
        b=kqQuLz2abqkDKZb8Cop4lC44kaY8xpS/ls7zg3hnBL/3SuFW258SQwbwQDRAr8jmtd
         uck/4GwbL4n771c1zPXA3BWFfwAYPXgpDVueWqwWS/vCmbNoHN8BNr92B2JU192pzApY
         /pahC7ijOnHIvnKpMalVo+VO3AOmkvUDljz7ahIOFsTKjm3TKNA9QK4nYSiDpT6LTbRl
         wQKjaF4ptus8rGDsW+u4KEM/mYlVFF0eEb736ZNjdm+FNaWRT2IVDLPh8eHO+88sJrAO
         J20MhaPp7EttBKnI5Kx7DInRRDWwRtVL+eMC9FpYBvnJ6MIvB6h1JfUyR0uQVegyoyds
         feFA==
X-Gm-Message-State: AOJu0Yzs5IudyxVbSAa9gcdFU79r5G+GnK9cxl3JGMcw0Qv2hCJ/tPxw
	OxhAPmUwPfdYmJZ4TqZQ40f6CAtoS4x87qlY
X-Google-Smtp-Source: AGHT+IEd78ZX2E5P2TwiyGHydCRs6vCEiJDbNwjIxZGBdpvtS4zj5QvBVxFeWQ63GW1eiGISPJ47nw==
X-Received: by 2002:a17:903:32cd:b0:1c3:6d97:e897 with SMTP id i13-20020a17090332cd00b001c36d97e897mr12877616plr.5.1695104685077;
        Mon, 18 Sep 2023 23:24:45 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001bdc6ca748esm9298385plb.185.2023.09.18.23.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 23:24:44 -0700 (PDT)
Date: Tue, 19 Sep 2023 15:24:44 +0900 (JST)
Message-Id: <20230919.152444.1457385307728133204.ubuntu@gmail.com>
To: tmgross@umich.edu
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47taHGkhjPH6j=JtmCAAqgTz=px5gsb6T_TN-TfPeu+Y4A@mail.gmail.com>
References: <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
	<439b6ee7-65e0-4849-8028-cbf5e752dd87@lunn.ch>
	<CALNs47taHGkhjPH6j=JtmCAAqgTz=px5gsb6T_TN-TfPeu+Y4A@mail.gmail.com>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Mon, 18 Sep 2023 19:46:57 -0400
Trevor Gross <tmgross@umich.edu> wrote:

>> > [1]: @Fujita I know you have mentioned there are times where a driver
>> > does not always have one mask. I can't find anything and am not sure
>> > how this would work since `phy_driver` has `phy_id` and `phy_id_mask`
>> > fields - do you mind linking an example? The above could probably be
>> > adjusted to work with this
>>
>> drivers/met/phy/meson-gxl.c does some funky things:
>>
>> static struct phy_driver meson_gxl_phy[] = {
>>         {
>>                 PHY_ID_MATCH_EXACT(0x01814400),
>>                 .name           = "Meson GXL Internal PHY",
>> [ ... ]
>>         }, {
>>                 PHY_ID_MATCH_EXACT(0x01803301),
>>                 .name           = "Meson G12A Internal PHY",
>> [ ... ]
>>         },
>> };
>>
>> static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
>>         { PHY_ID_MATCH_VENDOR(0x01814400) },
>>         { PHY_ID_MATCH_VENDOR(0x01803301) },
>>         { }
>>
>> So the phy_driver wants an exact match, but the module is loaded based
>> on the vendor OUIs.
>>
>> icplus.c:
>>
>> static struct mdio_device_id __maybe_unused icplus_tbl[] = {
>>         { PHY_ID_MATCH_MODEL(IP175C_PHY_ID) },
>>         { PHY_ID_MATCH_MODEL(IP1001_PHY_ID) },
>>         { PHY_ID_MATCH_EXACT(IP101A_PHY_ID) },
>>         { }
>> };
>>
>> The devices seem to not have unique IDs, so:
>>
>> static int ip101a_g_match_phy_device(struct phy_device *phydev, bool ip101a)
>> {
>> [ ... ]
>> }
>>
>> Its a variant on Murphy's law. If vendors can get something wrong,
>> some vendor will get it wrong at some point.
>>
>>      Andrew
> 
> Thanks for the references here, I see I misunderstood exactly the
> problem was. In this case, maybe we could do something like this:
> 
>     trait Driver {
>         const PHY_ID: u32,
>         const PHY_ID_MASK: PhyIdMask,
>         // Default to the same value
>         const PHY_DEVICE_ID_MASK: PhyIdMask = Self::PHY_ID_MASK,
>         const NAME: &'static CStr;
>         // ...
>     }
> 
> `PHY_ID_MASK` would be used to create the `phy_driver`,
> `PHY_DEVICE_ID_MASK`  creates the `mdio_device`. That can be
> overridden in cases like the Meson G where they aren't the same.
> 
> I think that the icplus situation is already possible with `match_phy_device`

drivers/net/phy/adin1100.c

static struct phy_driver adin_driver[] = {
	{
		.phy_id			= PHY_ID_ADIN1100,
		.phy_id_mask		= 0xffffffcf,
		.name			= "ADIN1100",
		.get_features		= adin_get_features,
		.soft_reset		= adin_soft_reset,
		.probe			= adin_probe,
		.config_aneg		= adin_config_aneg,
		.read_status		= adin_read_status,
		.set_loopback		= adin_set_loopback,
		.suspend		= adin_suspend,
		.resume			= adin_resume,
		.get_sqi		= adin_get_sqi,
		.get_sqi_max		= adin_get_sqi_max,
	},
};

module_phy_driver(adin_driver);

static struct mdio_device_id __maybe_unused adin_tbl[] = {
	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN1100) },
	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN1110) },
	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN2111) },
	{ }
};

This registers one driver but registers three mdio_device_ids.

bcm87xx.c registers two drivers but registers no
mdio_device_id. realtek.c registers 10 drivers but only one
mdio_device_id. There are some drivers that do unique.

I think that to separate registations of drivers and mdio_device_id is
the cleanest way.
