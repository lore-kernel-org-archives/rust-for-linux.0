Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3D722EF5
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 21:32:55 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9761739
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 14:32:54 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31c65820134so209339f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 14:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694640773; x=1695245573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMRldsUs46EEbZVkFyTZ6oD40BqG4z19kQ5OqRduZDw=;
        b=V3xWFVwxhBa8qZC/HqFPeai6nJDJtaqBg4ENjht1+VSp7adRZrVCUz/7r1ZaGHAcos
         /C5M25rpfC37f03PAoaKfsf2mGJvKeWUma/VPsWdgsIVCIw+/Qb7gsnL+PXYHDNtq594
         m77k7kQnLJbEDGKRe8/thXtV/wAlF48XIvtaPlgSb6HMcGR449edr2I8dSzLfdkmOOK+
         Q7d78U07eM3wEU9Mgq/PFqI0XPWyVPUiSfX0piKFaVIBDZPcp4wbngJl3NID9x/jzrWn
         ouS2GcH8GLTTNe1EWGq4jzqZRO+CAexR975hXVwSubQbk6a3hmE37EepS3914S+S5Yjp
         gwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694640773; x=1695245573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMRldsUs46EEbZVkFyTZ6oD40BqG4z19kQ5OqRduZDw=;
        b=NKu24WYx2OOxGY3MO1GY4bUaH4TSHyx2u1dFh0Qu3CaWmYhiNKoJDDw7TOnAKjt1L7
         ZSYzmv0rRpVlGSI3KFkyzencGaF//6TxP5Kmr96+FR7bHCLIsMFl44hRORDB7FT1Nu4x
         YJvlrbbD1Ohw0w9bzT2AtwZoOeB1w3YAHF8loV+RzDF3UKm30FcznQsVp+bZSmffHCLr
         FmAG2S5cANSY37kqCQTneFv/ETAGzohtkdpmql3g8bRJS3A89GFwPZxwvJF1AkznfSWv
         abFcce62EjVZpUziFbjglcPDxEh0A5qdqox07gzOxC99qRjXSi+b+NfM46ZSGK7juknK
         rAEw==
X-Gm-Message-State: AOJu0Yzf44nKD1g2pZ7l43QjAfr8ULf0IaeScW7kSVjFthEgIIDDWz0F
	ulu5/Nk4S9onFPCXPtMdMFQJctno354=
X-Google-Smtp-Source: AGHT+IF/BEoRRJh52+meIm2R+6S7lHGYLO6wX85PGZIo7O/X1mfHQPeTGQsP42+QOz/ZLWY28Pg/rg==
X-Received: by 2002:adf:e60b:0:b0:314:4237:8832 with SMTP id p11-20020adfe60b000000b0031442378832mr3338707wrm.48.1694640772672;
        Wed, 13 Sep 2023 14:32:52 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id w7-20020aa7da47000000b0052e9b50dafdsm48754eds.33.2023.09.13.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:32:52 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailauth.nyi.internal (Postfix) with ESMTP id 6758E27C0054;
	Wed, 13 Sep 2023 17:32:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 13 Sep 2023 17:32:50 -0400
X-ME-Sender: <xms:gioCZXD5uHjx8rvoV9nERsEvrxIRuZj7wjfur3N0AwlZs5-qMvUHYA>
    <xme:gioCZdjwEvJXbdWhQMNFOzoz7MAzDm70SEg3F1HUZCTzzDndWqfio-Jp9d1OhHjJa
    LZGSCzVl0-avMtWAQ>
X-ME-Received: <xmr:gioCZSn08mSgD8FAU4aYL4Z2ekFTMYowG5-qovLt-4uM9m1d7hjKaXmB3TI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepiedtfeevhfetkeelgfethfegleekfeffledvvefhheeukedtvefhtedt
    vdetvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:gioCZZw3fitbFogX_FbTa-Q2vy9wPUifameWXv4fCh4JzWbfd3q-Ug>
    <xmx:gioCZcSZx7Kt1EGKcTjD3QCF1bzxWOshXdp24xFKSRmqB5quFAdrBA>
    <xmx:gioCZcYsuax3fEOHxz7aEn8qTfXfouvRqokWNaS4zzyV0sHasmED4g>
    <xmx:gioCZXebWrbFPh4bVAg_U6bfpjdN8uhpGfvZ3c47vN0MVXWfWHYDAQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Sep 2023 17:32:49 -0400 (EDT)
Date: Wed, 13 Sep 2023 14:32:48 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <ZQIqgEHPQCfVfjDd@boqun-archlinux>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <ZQIgbA2J46+B37ar@boqun-archlinux>
 <0a986803-e02d-4f7a-8938-fab89af6a655@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a986803-e02d-4f7a-8938-fab89af6a655@lunn.ch>

On Wed, Sep 13, 2023 at 11:05:31PM +0200, Andrew Lunn wrote:
> > > > +impl Device {
> > > > +    /// Creates a new [`Device`] instance from a raw pointer.
> > > > +    ///
> > > > +    /// # Safety
> > > > +    ///
> > > > +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> > > > +    /// may read or write to the `phy_device` object.
> > > 
> > > Well that is untrue. phylib passes phydev to the MAC driver, in its
> > 
> > Note that a "# Safety" section before an unsafe function is the "safety
> > requirement", i.e. the things that callers must obey the requirement in
> > order to call these unsafe functions.
> 
> So by lifetime, it means while it is inside this function?
> 

No ;-) Let's take a look at the function:

	pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
	    unsafe { &mut *(ptr as *mut Self) }
	}

"'a" is a lifetime notation in Rust, so usually we call it

	lifetime 'a

now, you can see the function returns a "&'a mut Self", (Self is Device
here), so it's: a mutable reference to Device whose lifetime is 'a,
until now 'a is still a lifetime variable. When the function is called,
you can think as a concrete lifetime is bound to that variable, for
example:

	{
		// create a mutable reference whose lifetime is '1
		// '1 is a concrete lifetime starts at here.
		let dev: &'1 mut Device = unsafe { Device::from_raw(..) };

		// '1 continues here
		<use dev as a mutable reference to Device>
		// '1 continues here
	} // "dev" is out of scope, so '1 ends here.

in above case, '1 is bound to 'a. A concrete lifetime can usually be
thought of as a region in the code.

Back to the safety requirement, it basically says the caller should
guarantee that as long as the return mutable reference is alive, the
underlying object (phy_device in memory) should be exclusively
accessable. For example, in the above case, it's the caller's
responsiblitly to guarantee "dev" is always a valid reference (during
lifetime '1).
			

Others may explain better than me, but the above is the conceptual model
that I use, hope it helps.


> > > > +    /// Executes software reset the PHY via BMCR_RESET bit.
> > > > +    pub fn soft_reset(&mut self) -> Result {
> > > 
> > > I suggest you keep to the genphy_ naming if possible, to make it clear
> > > this is using a generic PHY method.
> > > 
> > 
> > My opinion may not matter, but this function is actually
> > 
> > 	net::phy::Device::soft_reset()
> > 
> > , so it could be a step backwards if we use a prefix in a language that
> > support namespace ;-) But I'll leave it the people who will read the
> > code day-to-day.
> 
> So a bit of background. IEEE 802.3 defines how a well behaved PHY
> should work. We have a number of helper functions based on that
> specification, all starting with the prefix genphy_. We expect PHY
> drivers to use these helpers where possible. It helps reviewing driver
> submissions, in that if we see genphy_foo we know it is good quality
> core code. If it is not genphy_foo, we need to review it closely.
> 
> When reviewing a Rust PHY driver, i want the same hint. This is a
> wrapper around a trusted genphy_foo C function, so i don't need to
> look too closely at it.
> 

Understood ;-)

> > Agreed, these functions have no users. Also the wrappers doesn't reflect
> > the lock requirements, at least not in comments, after a quick look, I
> > suppose all the functions should be under phy_device->lock?
> 
> The core will take that locking before calling into the driver. So the
> driver never should need to touch phydev->lock. It is one of those
> rules of thumb:
> 
> 	Driver writers often don't understand locking, so try to
> 	ensure the core does all the locking, not the driver.

Make sense. I brought that up because I noticed that Fujita used all
"&mut self" (i.e. mutable references) for all the functions, and mutable
references mean exclusive accesses, which can usually be thought as
"must be called with locked held" (if the underlying object is avaiable
for multipl threads).

Regards,
Boqun

> 
>      Andrew
