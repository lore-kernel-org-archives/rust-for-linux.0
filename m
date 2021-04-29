Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A36CC433B4
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 15:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 025F96144B
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 15:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbhD2P45 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 11:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbhD2P44 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 11:56:56 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1DEC06138B
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 08:56:10 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id i26so11612695oii.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3gli3ivlNcMNPlOJGmedInM5hTejn8mAoz+25VJpIP4=;
        b=UQ27z/cyo1P94UTjJ2kk7YgFNPOzpOcUxDHo03n3W6ITNILhhFMuv3NDQK+dThwsUg
         7fXW4CWW1yq0Qo+mdb5/8t4bY1kaROWBESLoW6q/R0yJGrRzkBNvAQv9uy+ICkhUZaEU
         MC8UbeHpsRKkZcY4d2L52F8hCHC6K+ngbZZ7h0DBWCIDWG1BjGP8zbJ+gj/HXsqS4Chg
         AvuEx+pQ/Kw/qo/LwCaG2HJTOELW8ixdoHbKzPUkqxt/R93CTPswSM/vK2IIbVYq25l0
         4xw6hHOFN6f5GArnZmJ+DKW/jo3JegycwtYLG5Rc4Zua/If9IFkyTo8INxn4QRt6EHLP
         CRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3gli3ivlNcMNPlOJGmedInM5hTejn8mAoz+25VJpIP4=;
        b=AaacWH+9v1GLqC6I25dIAK+/WjCilWAa9Ux4cfuLcQ6uoF09uUbhNK89m4TkUybe4K
         kzH1nD9jB7LnWzreQFPL6mC7A/qsx68a4yeBkuqJPpiXnF71u1QiZ20uA9atpdqP2j20
         qjYa4vTA+R04L3NE6T7XU6EIT9bWphevZ7WIgFkBTdJHssilPrKa6Aeh+JhjJmMfu5ZG
         FwvjWsH9/ji8kQzd8jx0OrK9BG6gkuect+8NPNAMZALcgfqIIN+SzevajNkPxH+3XZY2
         S9b3xtiFPPqTtU3AxhbElX5L0LGgzNCzZph3Mq2dF6xAlWWFQXvoRGTAUlnFv2+djHYb
         pYAA==
X-Gm-Message-State: AOAM5315skxg8X/WcWTBWduPz4rgZz+zf24YPah8AYJm3xzWJwBa+cJR
        ano56QaftxqwPzoT39w7O7MR7SoOotxZtQ==
X-Google-Smtp-Source: ABdhPJz/8NC5IoqQK8eweLlwwi25TaNVa8DgdWF0W+XafRF/rLQ1GrOWeaJ4lGg/MZpxe8wI8gKeLg==
X-Received: by 2002:aca:4bc2:: with SMTP id y185mr6877283oia.64.1619711769517;
        Thu, 29 Apr 2021 08:56:09 -0700 (PDT)
Received: from localhost.localdomain ([2806:2f0:9001:d702:61ca:a6c9:43eb:e8b2])
        by smtp.gmail.com with ESMTPSA id w23sm44274otl.60.2021.04.29.08.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:56:09 -0700 (PDT)
From:   Carlos <carloscarral13@gmail.com>
X-Google-Original-From: Carlos <carlos-II@localhost.localdomain>
Date:   Thu, 29 Apr 2021 10:56:06 -0500
To:     rust-for-linux@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: Loading an out-of-tree module
Message-ID: <YIrXFt2KVovbM+Fs@localhost.localdomain>
References: <YIrDgupEqcmsUfGX@localhost.localdomain>
 <YIrNuQlVnvpktDcl@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrNuQlVnvpktDcl@kroah.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Thank you all for your responses,

I get why the OOT flag is there so I won't try to remove it. What
concerns me, however, is that my printk messages don't work as expected
(i.e. They are one off). Is this behaviour caused by the same flag?

Respectfully, 
Carlos.
-- 
