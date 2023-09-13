Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D5200D4
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 20:49:55 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0171BCC
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:49:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so202239a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694638193; x=1695242993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9cme8RwIaMBqRJwrBZK4I2kLMG+aJuld1dstKuDPMo=;
        b=I8DwPcaL2/HMNt8L6hv8uhQ3VR3E9OgSOhJ0H6gvI+ahBMWMdKUyFQ3QjoYsg8QwnD
         PjJSFtQscaWgTa0afQNhe+JprhCtZc0fgGZ/NfttUaQy52AcIIededCcjx6bCOnKk1Sb
         rQL0jQfcCIA1yu5Qt9Lb6gZskA5DmHaazFMgW4So+zX0Z/D+20RQVkjWMiGq2hRU7gn8
         g6NYTl3TiNasIXLzWF3jZZ8+kJqQQfpNILhTd4upIK2L0tFM9IMqumHPUbsGz7VOB79b
         yikWXAA/rEC2couhOOyY47VDF5VYkaMnqaCSk0bFFYa6qy9zfHXNM90o9PqUYR1RqMrW
         qliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694638193; x=1695242993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9cme8RwIaMBqRJwrBZK4I2kLMG+aJuld1dstKuDPMo=;
        b=XuycIpJ+FOjXPDI0QupN6CRVseGhXLCT2xqk0IloldKc748+AfwcScCFTzHDB28YH5
         H9CLHL4w4PKyjCBR0B6OJFTiWj7vB1+4O05a4pFidH4ch7i3k0uZEA8EXe833X7WB1k0
         CkzsfEiOXPF2+QzSMAQZDdgnVEiSPzlUbkxJ920IPbzkE70yauc5Jvr1eoLMlHMn11n3
         mw6Bx0KgSn50oFq4UKQtA08Hb9YRum65LirFvjexTZ1ki1RCQNTuRd4CDKBR4T+T680Q
         xzAhxlQnwox/dRFCb3ZtGKEKUvwi9hpjICqi9V19ESeAljVkDo3fxaqUph0TnxayIAjw
         /ZfQ==
X-Gm-Message-State: AOJu0YyoZZNKajwx3Pmfcmuhdq4rBMFsIgf0yDNWPcMpw1FoCtrtoG/I
	gHXMR7Ku6kEOy04WmsPLl9g=
X-Google-Smtp-Source: AGHT+IFDOBFMyB+LeGIZg+4hEG5IOc8VM69Qz9QngLQ6wbAN9A5g9hKkZSPRXEUq+5WuAQgFtLxSWw==
X-Received: by 2002:a17:906:4c1:b0:9a9:f17e:412f with SMTP id g1-20020a17090604c100b009a9f17e412fmr3133508eja.50.1694638192816;
        Wed, 13 Sep 2023 13:49:52 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id se22-20020a170906ce5600b009920e9a3a73sm8998012ejb.115.2023.09.13.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 13:49:52 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id F278827C005B;
	Wed, 13 Sep 2023 16:49:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 13 Sep 2023 16:49:50 -0400
X-ME-Sender: <xms:biACZUUnT33uV2ZGoSaHnarKaTpbrNXz5zwe27BGBJPGmr1W56H0lA>
    <xme:biACZYnSjclej0oE_AnjokR7s6XneRRKjeSW8h00fjh6bzkv-ie2ojJ7QcmgCts5U
    ffKMhAt__AClcftqA>
X-ME-Received: <xmr:biACZYYSNhh3EBEGbeBRJChWcMHdaGOoNi00Z9juMhz4EQPneRxK4-c07qM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:biACZTWzFXCZiWYOYMxK6_E5BTbkaZ8p5-glY1-N9vsnX4HD69NKgg>
    <xmx:biACZemvXp9AqlduKoC-6L3dltwgtRGBFC0gLEvnPXfVrVJgzfHrmQ>
    <xmx:biACZYfYDqfgNdIto2DzqrIG58zRWTHEKUtkeAfoLGc1KEXsO_XwZg>
    <xmx:biACZTxx7jqnjOpzpLuaRip0EOFQCgByw_4jE5XKQERdLgrLDdgUFA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Sep 2023 16:49:50 -0400 (EDT)
Date: Wed, 13 Sep 2023 13:49:48 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <ZQIgbA2J46+B37ar@boqun-archlinux>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>

On Wed, Sep 13, 2023 at 10:11:57PM +0200, Andrew Lunn wrote:
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index c91a3c24f607..ec4ee09a34ad 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -8,6 +8,9 @@
> >  
> >  #include <kunit/test.h>
> >  #include <linux/errname.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/mdio.h>
> > +#include <linux/phy.h>
> >  #include <linux/slab.h>
> >  #include <linux/refcount.h>
> >  #include <linux/wait.h>
> 
> How does this scale when there are 200 subsystems using binding
> helpers?
> 
> > +/// Wraps the kernel's `struct phy_device`.
> > +#[repr(transparent)]
> > +pub struct Device(Opaque<bindings::phy_device>);
> > +
> > +impl Device {
> > +    /// Creates a new [`Device`] instance from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> > +    /// may read or write to the `phy_device` object.
> 
> Well that is untrue. phylib passes phydev to the MAC driver, in its

Note that a "# Safety" section before an unsafe function is the "safety
requirement", i.e. the things that callers must obey the requirement in
order to call these unsafe functions. Here it's supposed to  describe
"what's the safe usage of `from_raw` function".

> adjust link callback. It can then read from the phy_device
> object. There are also API calls the MAC can use to change values in
> the phydev structure. The phylib core will also modify values in
> phydev. In theory, the core will protect the phy_device structure
> using the phydev->lock mutex, although we might be missing a few
> locks/unlocks, and suspend/resume does not take these locks because of
> deadlock. A phy driver however should not need to touch this lock, it
> is taken before there is a call into the driver.
> 
[...]
> 
> > +
> > +    /// Executes software reset the PHY via BMCR_RESET bit.
> > +    pub fn soft_reset(&mut self) -> Result {
> 
> I suggest you keep to the genphy_ naming if possible, to make it clear
> this is using a generic PHY method.
> 

My opinion may not matter, but this function is actually

	net::phy::Device::soft_reset()

, so it could be a step backwards if we use a prefix in a language that
support namespace ;-) But I'll leave it the people who will read the
code day-to-day.

> > +    /// Reads a given PHY register.
> > +    pub fn read(&mut self, regnum: u32) -> Result<i32> {
[...]
> > +    /// Reads a given PHY register without the MDIO bus lock taken.
> > +    pub fn lockless_read(&mut self, regnum: u32) -> Result<i32> {
> > +        let phydev = Opaque::get(&self.0);
> > +        // SAFETY: This object is initialized by the `from_raw` constructor,
> > +        // so an FFI call with a valid pointer.
> > +        let ret =
> > +            unsafe { bindings::__mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum) };
> > +        if ret < 0 {
> > +            Err(Error::from_errno(ret))
> > +        } else {
> > +            Ok(ret)
> > +        }
> > +    }
> 
> Now we are getting into the hairy stuff. Locking is
> interesting. Rather than duplicate all the interesting stuff, can you
> just use the high level C functions? In fact, the driver you posted
> does not need anything other than phy_read() and phy_write(), so i
> would not even bother with these yet.
> 

Agreed, these functions have no users. Also the wrappers doesn't reflect
the lock requirements, at least not in comments, after a quick look, I
suppose all the functions should be under phy_device->lock?

> > +    /// Resumes the PHY via BMCR_PDOWN bit.
> > +    pub fn resume(&mut self) -> Result {

Regards,
Boqun
