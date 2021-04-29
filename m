Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABE9C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 14:32:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5CC461409
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 14:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240555AbhD2Od0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 10:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbhD2OdZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 10:33:25 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66500C06138F
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 07:32:37 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l17so35342844oil.11
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=bJ/PLktPKniZe2EeVuNM8Z4nyqPjwtXUomNw32X6DzA=;
        b=MiwWFw9I0kdxfMApSvZnPIS/sB0rKeUkVMIXQ15ImwmTX4Vn0eIp4edkPTJgRGsiFl
         840MLJZJs1s4Vp4bXZiG5KBbwvBUbylhMMrUhca8oBUHxoXNYHuGWAq6cR622uXlYxhg
         59UITNWNzpnMPBGZiDQW+vEiy1UzoR1Yl2g+v38gKKK0vRYQq/m8V/NYu4teRY/1ul4r
         lovkMQZkCp1F024sICsyt1OV1nGUccn7TQIfPxFiyYaGIDRTrC/hS9I1V53Wg8VsMhiq
         jS5l/dGK/tEk/IqLs+1CfWiPt7FuQ73ItKrKRfbruXzrXtD37dilJ312fgh/9aMbeRSy
         jKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=bJ/PLktPKniZe2EeVuNM8Z4nyqPjwtXUomNw32X6DzA=;
        b=YrSSQQkJUx/EpbF/Pdb9jUEL00ke9VoFw7TTWGYRIFd7z2nxe62fH/q+SDeRcAMqsa
         w0SFVKscVd7KsQyqxclJg6mQh0HMqCc5e2B3AhgQQzI9V1sRLzhpp8vE52fmtqTGi6S0
         OaPLqT6Hxll7ruxGia6OQKouzqz+cZa/ZWzhrFiyY4A96Hi16bo2QHVcMwJqgMUElMzE
         /VKXmbbtMLYuoBt1sYMbpoCpgPzKr5iq/y2y4WB2fu9vGeotUVp78xbmlhULh4vRL3/q
         KzxTLSWWHUo9+ZGytwprjlOwBqRodXsH+sdohp1XreAtbeQVQNVk2DpAiQTOnyHuUrav
         vmSQ==
X-Gm-Message-State: AOAM533Kxk45Cq+ZjLDxtMyasu9U6YED/V2uCrVKQo9pBmik6VKdRhzW
        1dtxtg29bwcKgrERCcqHVr81to6CDBY=
X-Google-Smtp-Source: ABdhPJwUGEp0H2FIp2Fpj4gZTYEm88QIfAyQsTvYeOpp3SSpHEPlOhTviBrF5Q31xWMg7RpWoCgOCQ==
X-Received: by 2002:a05:6808:56f:: with SMTP id j15mr7051323oig.19.1619706756655;
        Thu, 29 Apr 2021 07:32:36 -0700 (PDT)
Received: from localhost.localdomain ([2806:2f0:9001:d702:61ca:a6c9:43eb:e8b2])
        by smtp.gmail.com with ESMTPSA id i9sm602525otr.19.2021.04.29.07.32.36
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 07:32:36 -0700 (PDT)
From:   Carlos <carloscarral13@gmail.com>
X-Google-Original-From: Carlos <carlos-II@localhost.localdomain>
Date:   Thu, 29 Apr 2021 09:32:34 -0500
To:     rust-for-linux@vger.kernel.org
Subject: Loading an out-of-tree module
Message-ID: <YIrDgupEqcmsUfGX@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Good morning (or good afternoon) to all,

I managed to build an out-of-tree HelloWorld module. However, when I 
tried loading it in the kernel (booted with eudyptula-boot)
and dmesg inside the shell, I get a 'loading out-of-tree module taints kernel':

struct HelloWorld;

impl KernelModule for HelloWorld {
    fn init() -> KernelResult<Self> {
        pr_alert!("This is a rust kernel module");

        Ok(HelloWorld {})
    }
}

impl Drop for HelloWorld {
    fn drop(&mut self) {
        pr_alert!("Dropping rust kmod!");
    }
} 

[...]

$ insmod hello_world.kmod
$ dmesg | tail -1
[   38.462244] hello_world: loading out-of-tree module taints kernel.
$ rmmod hello_world 
[   38.462402] hello_world: This is a rust kernel module 
$ insmod hello_world.ko
[  315.360871] hello_world: Dropping rust kmod!
$ dmesg | tail -2
[   38.462402] hello_world: This is a rust kernel module
[  315.360871] hello_world: Dropping rust kmod!

And from then on all module messages are one off.
Is the 'loading out-of-tree module taints kernel' messsage something you
can disable at .config? Or is it something particular to eudyptula-boot?

Thank you for your patience,
Carlos
