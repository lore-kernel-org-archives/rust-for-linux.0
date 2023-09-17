Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9915E1877
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 11:28:10 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2469101
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 04:28:05 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27467da531eso597662a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694950085; x=1695554885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+18gS0/MLHq+HeuLig4mGH6Uf9cJK9iUssaUmHKsDw=;
        b=Prwgl+KtGu8AiB8HPxJlj47b7dNijuIsbtVUmeJT70iS5hygIF1nJ9zIYnTiprdj/C
         13DiepLHSYY3wnAWqcZXz2vKhDXZbdXos8uwLcm3KMHo5ovEMKPAqAXcfEXDkF22qQYE
         X/3fdMOwbMqHGAzmmza+ZzAKiBuMBYURdupq1REZM/aY1/eW9z/T1i2JfqZXi0P3omKr
         WGi84lfYBuJN0wsuecrWXWeLDTqquqjacXFfgXaja2J7jen6pjvMfN7CuCfnR/5bCl8s
         2mYonczfDysnN6yohVnvCyPLv0eIE/lV+4gXFlrA/no02h04bSqqM+SpiiC7vJzo79tl
         e79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694950085; x=1695554885;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I+18gS0/MLHq+HeuLig4mGH6Uf9cJK9iUssaUmHKsDw=;
        b=nIP3cB4C2anrE+RDDJWYsVWQjgFLLcVBhmi//QUE5jOfPajsBqkWdcL+WhSZ4ZaFxS
         MNc6WozdEfzDDSeUZRsyMfJXnytiEqrdp+nKXE6Qa6NXBE7NB0qIrgCaGX1z/Ds8w759
         ZfTUzYzBncctOT9aqub9Ml8mIijSAyx8IDROg+Pe9Zed0yL6ljCtIHXKCEBvHW0caRFi
         MnMRf7sczmWXLlLu6Yc+mOiCDwTiqZN1a4DDbvDFUT/XHGjtX2vKAITxvyESYc4bpysb
         eqvm/7ThgPRZmS7yBCDU40qDEq2htd/Ef4OtuMqOuoMMGg1guVbffi/AEj5s/ts8Mh1L
         MtVw==
X-Gm-Message-State: AOJu0Yx0hGjE+16VIa2NwJnR1AOGXPZtWlBEv/XYftnHX4K9RIjCRZYq
	j24+W5gYgDOyWgWhZz99W5CcqgDMOjwMZG7U
X-Google-Smtp-Source: AGHT+IEwLHWadzW+CguUNBwUNVm/EFPkFcfln6/r1WdCUXpsKm+4220S2xWL2lgtNbGATcRG+TTmrg==
X-Received: by 2002:a17:902:f68f:b0:1c0:bf60:ba4f with SMTP id l15-20020a170902f68f00b001c0bf60ba4fmr7838840plg.4.1694950085057;
        Sun, 17 Sep 2023 04:28:05 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902968600b001bdcde49bc3sm6450454plp.119.2023.09.17.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 04:28:04 -0700 (PDT)
Date: Sun, 17 Sep 2023 20:28:04 +0900 (JST)
Message-Id: <20230917.202804.2074374258417179605.ubuntu@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <52517bd0-66fe-4275-bef1-afabc906e836@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
	<20230913133609.1668758-5-fujita.tomonori@gmail.com>
	<52517bd0-66fe-4275-bef1-afabc906e836@lunn.ch>
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

On Wed, 13 Sep 2023 21:15:53 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +module! {
>> +    type: RustAsixPhy,
>> +    name: "rust_asix_phy",
>> +    author: "Rust for Linux Contributors",
> 
> You probably want your name here. You are going to be maintaining this
> driver.

Will do in the next round.


>> +    fn match_phy_device(dev: &mut phy::Device) -> bool {
>> +        dev.id() == Self::PHY_ID_ASIX_AX88772A
>> +    }
> 
> What is this doing? The phy core will match the driver to the device,
> based on the phy_id and phy_id_mask in the phy_driver structure. A
> match function is only needed when the vendor made a mess of the IDs,
> and has two different PHYs with the same ID. I don't see anything in
> ax88796b.c to suggest it has this problem.

Sorry, I experimented match_phy_device() and I should have removed this.

>> +
>> +    fn read_status(dev: &mut phy::Device) -> Result {
>> +        dev.update_link()?;
>> +        if !dev.link() {
>> +            return Ok(());
>> +        }
>> +        let ret = dev.read(MII_BMCR)?;
>> +
>> +        if ret as u32 & BMCR_SPEED100 != 0 {
> 
> PHY registers are u16. phy_read() returns an int, so it can have
> negative return codes. But if it is not negative, the positive values
> are in the range of 0 to 65535.

A negative is an error?

If so, this function should be:

fn read_status(dev: &mut phy::Device) -> Result<u16>

>> +    fn suspend(dev: &mut phy::Device) -> Result {
>> +        dev.suspend()
>> +    }
>> +
>> +    fn resume(dev: &mut phy::Device) -> Result {
>> +        dev.resume()
>> +    }
> 
> Can we avoid this boilerplate? A lot of phy drivers will make use of
> genphy_foo calls in their struct phy_driver. It would be annoying if
> each driver needs silly little wrappers like this.

you meant that C style like

{
        .suspend        = genphy_suspend,
        .resume         = genphy_resume,
        .soft_reset     = asix_soft_reset,
}

is clear than Rust style

    fn suspend(dev: &mut phy::Device) -> Result {
        dev.genphy_suspend()
    }

    fn resume(dev: &mut phy::Device) -> Result {
        dev.genphy_resume()
    }

right?

>> +
>> +    fn soft_reset(dev: &mut phy::Device) -> Result {
>> +        dev.write(MII_BMCR, 0)?;
>> +        dev.soft_reset()
>> +    }
> 
> You are missing the comment why genphy_soft_reset() is not
> enough. This device appears to break 802.3, so you really should
> document how it is FUBAR.

I'll copy the comment from the C driver.

>> +
>> +    fn link_change_notify(dev: &mut phy::Device) {
>> +        if dev.state() == phy::DeviceState::NoLink {
>> +            let _ = dev.init_hw();
>> +            let _ = dev.start_aneg();
>> +        }
>> +    }
> 
> Again, this is bad behaviour of the PHY, so it should be documented
> why it is needed.

Ditto.
