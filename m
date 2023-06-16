Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F587EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 13:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjFPNCZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 09:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjFPNCY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 09:02:24 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C77C2D79;
        Fri, 16 Jun 2023 06:02:23 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6664ac3be47so146656b3a.0;
        Fri, 16 Jun 2023 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686920543; x=1689512543;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSRgVahhDk5BTZ6yG8Z1ju6hpD21p6mQOCPqqP1GSyY=;
        b=afdbB8lMZuZH4YL2aUJ6YYNZ0WlB2XInCgQYMqU2utur23ieul7ORkrIAOJvBnwzJb
         kMjqHUF5+SmR2vNQelbntuPxLlTeFswkbbuG0xeQuqqD3RNOmejtwIat8mC5fK+hpvem
         qEGU5XmsPrttmLl+3MMGQ7k4ABef197bePxQmx1NwNPbtyallXAAxgXvmzLjh2O7MMe1
         ERZGkf4Ume8SzknZURClmK+HgkiBK4YmYedsV8x9+A6l/df48BytweC7WzVVrL1JeaUS
         GXCppZXXGN0xwMnObbBKFPYmozrRGdJ+DOvNycXrQXX1JVX9t8PWTNdIn8XxyiFV+HBY
         DwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920543; x=1689512543;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GSRgVahhDk5BTZ6yG8Z1ju6hpD21p6mQOCPqqP1GSyY=;
        b=Pq5hAt+6zAAmf8SVk2xP3DSpdVCZWaKGJ8M2RPl1R3mTzMX6VSneZKi/IycuGwg+qu
         3+4JKiCkXzwHT9q8Z8jcLdfz/YPrXH5VUvRve99TjwRwSYcaYwF9C4BWJCkXak9V6pO/
         GkeQUP3IJrLAVBvbViISShrU42YcP1Rr10j7Kuc8BNb3mJTwLnLMi8fAAX4B4XnKQS0U
         cbHIhsL4o/m0yQYEGG7Oo5UBv0rCQ9w8IwaWF7Ftd296ppcn4joGdsPbKgw5zZtwugoO
         H3Zn20OOrnguUa6QRG4cWR0R90EhNaDIUHgQSa7nM+McFgEpW0EJQiqu6LXVVu3ptZr3
         FE/A==
X-Gm-Message-State: AC+VfDzTYwOo/qtgQMXZEwR0WbGr+E+hAyKzRzocKnAtgvLRDV0QxTZb
        467blaUnYD0JVtY2aFl3Udo=
X-Google-Smtp-Source: ACHHUZ6aBCa1TsQocKDeGuI3WbshAkFRckfjkcXWHHcBO7qv7ZumWlmnmu2IYLg+vjL1nS9rUb/jJA==
X-Received: by 2002:a05:6a20:7493:b0:111:a0e5:d2b7 with SMTP id p19-20020a056a20749300b00111a0e5d2b7mr2783790pzd.4.1686920541634;
        Fri, 16 Jun 2023 06:02:21 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id v4-20020aa78504000000b00666912d8a52sm2803154pfn.197.2023.06.16.06.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 06:02:20 -0700 (PDT)
Date:   Fri, 16 Jun 2023 22:02:20 +0900 (JST)
Message-Id: <20230616.220220.1985070935510060172.ubuntu@gmail.com>
To:     kuba@kernel.org
Cc:     andrew@lunn.ch, fujita.tomonori@gmail.com, netdev@vger.kernel.org,
        rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20230615190252.4e010230@kernel.org>
References: <20230614230128.199724bd@kernel.org>
        <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
        <20230615190252.4e010230@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu, 15 Jun 2023 19:02:52 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 15 Jun 2023 14:51:10 +0200 Andrew Lunn wrote:
>> On Wed, Jun 14, 2023 at 11:01:28PM -0700, Jakub Kicinski wrote:
>> > On Tue, 13 Jun 2023 13:53:21 +0900 FUJITA Tomonori wrote:  
>> > > This patchset adds minimum Rust abstractions for network device
>> > > drivers and an example of a Rust network device driver, a simpler
>> > > version of drivers/net/dummy.c.
>> > > 
>> > > The dummy network device driver doesn't attach any bus such as PCI so
>> > > the dependency is minimum. Hopefully, it would make reviewing easier.
>> > > 
>> > > Thanks a lot for reviewing on RFC patchset at rust-for-linux ml.
>> > > Hopefully, I've addressed all the issues.  
>> > 
>> > First things first, what are the current expectations for subsystems
>> > accepting rust code?
>> > 
>> > I was hoping someone from the Rust side is going to review this.
>> > We try to review stuff within 48h at netdev, and there's no review :S  
>> 
>> As pointed out elsewhere, i've looked the code over. I cannot say
>> anything about the rust, but i don't see anything too obviously wrong
>> with the way it use a few netdev API calls.
> 
> The skb freeing looks shady from functional perspective.
> I'm guessing some form of destructor frees the skb automatically
> in xmit handler(?), but (a) no reason support, (b) kfree_skb_reason()
> is most certainly not safe to call on all xmit paths...

Yeah, I assume that a driver keeps a skb in private data structure
(such as tx ring) then removes the skb from it after the completion of
tx; automatically the drop() method runs (where we need to free the
skb).

I thought that calling dev_kfree_skb() is fine but no? We also need
something different for drivers that use other ways to free the skb
though.

I use kfree_skb_reason() because dev_kfree_skb() is a macro so it
can't be called directly from Rust. But I should have used
dev_kfree_skb() with a helper function.

thanks,
