Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFAF7F
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 09:12:46 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD03E8
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 02:12:45 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6927528c01dso711315b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695546764; x=1696151564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjP8D/yqyQJmnm6cj8McTFozy5qTPky0K9X1jzqI+18=;
        b=SmTWBtIXnS3Bz37GdRiI7a35GiV2tFuH2OvED+ToRZwsrl9OoIe1yxOaQzftWnLKpv
         mHCDT/SOGGu206ZcPiOrid4M0BwTycZxt5HVMlUYc3Z33h1K3Ag4Tq3rNb3AH+HN7KXb
         TkGVT0nBbUyCZb3LvZiBzGvZLd8FGUZv3S8OZu7n4yFgwbB9679W/WsxJ58HMTPqtWmB
         LPROHA/V5PBaAsUSr8dQDNbIffGAyvZfRdnCUloQ+NCDK3Od7k58crmo+BEHvp2NupzP
         UGtLNUW+OkQ+T/T6ZoJUqBFHvbL4wkgSEcod0fzL6hfOWrc2Suv5aJD4FLthaCfMOVuJ
         7I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695546764; x=1696151564;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SjP8D/yqyQJmnm6cj8McTFozy5qTPky0K9X1jzqI+18=;
        b=rzLjOgtjj+Flq0YNX28y/55w6pKqCOUW4zflEn/6ZAVI1/UpgWYpxkoj76ZGsDBym5
         j/1AxIGN31ttPSF68+8nSvLPAy651p74CAcx76fLJXDKIVX8CEo8ZfHGYpxUMms1CZql
         gwN0DBf1oUWlJwnADLkUrqfeAA0ewWF3pKQOVW8AXge4Ug71U4wakLezVzrxk1vZLvI2
         9rj78Y8kpOfveLsPVFtAG0hi6rbk8a58zXlZZZsX7oRkGhHlnYd7SJVFbmLd0ZZpwZZC
         GypTtt5hgAJ8zSrGz0jEBydkWPvplgJ/vCS5VQL2smnqhv9zNsxeRUybZSmb3a5CXb1l
         8KWw==
X-Gm-Message-State: AOJu0Yyw28AX1nM4DjtcTYd2JwRpst3EXXki6znSvpSX5Vtn1m3h6cU5
	WNL2shdFJLgmnEJBb2ciubk=
X-Google-Smtp-Source: AGHT+IGO0lYKdrvPIKqJaJLXutHFXlSbrz1lmUJJBHnCoTowh+m1tN9R8ukSG4vnn1n73852TH8b4w==
X-Received: by 2002:a05:6a00:2f4d:b0:68f:c9f6:f366 with SMTP id ff13-20020a056a002f4d00b0068fc9f6f366mr4786769pfb.0.1695546764407;
        Sun, 24 Sep 2023 02:12:44 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id g1-20020a62e301000000b0068bbd43a6e2sm6178757pfh.10.2023.09.24.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 02:12:43 -0700 (PDT)
Date: Sun, 24 Sep 2023 18:12:43 +0900 (JST)
Message-Id: <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch>
References: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
	<20230918.173527.1946752214085636243.ubuntu@gmail.com>
	<964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch>
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

Hi, sorry about the delay,

On Mon, 18 Sep 2023 15:37:12 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> >> >> +    fn read_status(dev: &mut phy::Device) -> Result {
>> >> >> +        dev.update_link()?;
>> >> >> +        if !dev.link() {
>> >> >> +            return Ok(());
>> >> >> +        }
>> >> >> +        let ret = dev.read(MII_BMCR)?;
>> >> >> +
>> >> >> +        if ret as u32 & BMCR_SPEED100 != 0 {
>> >> > 
>> >> > PHY registers are u16. phy_read() returns an int, so it can have
>> >> > negative return codes. But if it is not negative, the positive values
>> >> > are in the range of 0 to 65535.
>> 
>> Sorry, I should have commented in the previous reply. ret can't be a
>> negative here due to how to hanle an error in Rust.
>> 
>> let ret = dev.read(MII_BMCR)?;
>> 
>> Here '?' means that if an error happens, return with an error
>> immediately. So the ret is set only if dev.read() is sucessful.
> 
> Ah, that is going to take a while to get used to. It is also going to
> make reviewing the error paths in drivers more interesting. Good
> practice is that when something fails, you need to undo what has
> already been done in a function, particularly resource allocations. So
> you see the pattern:
> 
>     err = foo(bar):
>     if (err < 0)
>        goto out_foo:
> 
> Where the code at out_foo: undoes anything which has happened so far.

Indeed, this is an interesting topic; different from C's way.

fn probe(dev: &mut Device) -> Result {
   // heap memory allocation; kmalloc
   let a = Box::try_new(MyDeviceData::new())?;

   foo(dev)?;

   dev.driver_data = a;

   Ok(())
}

With the above example, if foo() fails, this function returns
immediately due to '?'. When this function ends, 'a' is dropped since
nobody has reference to it. The destructor of 'a' calls kfree().

fn probe(dev: &mut Device) -> Result {
   // register the device.
   let reg = Registration(dev)?;

   foo(dev)?;

   dev.driver_data = reg;

   Ok(())
}

If you register something and foo() fails, the destructor of
Registraiton object needs to unregister the device.

The registration in the abstractions for PHY drivers is designed in
the same way. The destructor of the registration struct calls
phy_drivers_unregister().
