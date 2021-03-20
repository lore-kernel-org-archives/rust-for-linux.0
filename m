Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FF5C433E1
	for <rust-for-linux@archiver.kernel.org>; Sat, 20 Mar 2021 11:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B8E561972
	for <rust-for-linux@archiver.kernel.org>; Sat, 20 Mar 2021 11:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhCTLYs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 20 Mar 2021 07:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhCTLYd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 20 Mar 2021 07:24:33 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DD0C0613B3
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Mar 2021 03:45:18 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id h25so4879515vso.2
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Mar 2021 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fossix-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version;
        bh=g3t5eWGEN3Q+vPG7w2vtAVk9IGXuD8LxbnERE1pb1p0=;
        b=KEBVSIz3XHGeYzxUZlyXbPt2dLcrQqqSenYLtIXan8yZTr2f+gsKIFBo/O9P0h5yf7
         3A4I8XOxjju9riwng9z/B1WAoJDWr7KAtNyUpbe8rMVqYe0PEgeCsL44aoaPgnwzH60e
         /wpY4SomnJdZV6wyb4uIaDm7pNFAzwT/S9NgH4tkOeVTsL3yDvhi3WQdR/lkk+p0i2B8
         vCSXwN3DUfYTDUXyocXejrR5GBp50Uxmo1SSK+VI9DpgLs8RyRdUZ5lNC/ztsywOjQtC
         5BYyzfRMlBZpyS8RuPTd9ZrP/42HQ50rleBFtzg9+R1j8HU2RI7hXVFL7StB71A4gV4c
         Kmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
        bh=g3t5eWGEN3Q+vPG7w2vtAVk9IGXuD8LxbnERE1pb1p0=;
        b=KftA+3PfKQMQQ+ehecnbtMShN3OLovsSI5mNVm+ENWy7NK10NqpNqgJd7M2fpFRTWX
         b2MbRIg9EytgHprrfl7rTmsEBJKOhPdNF4LGhQL+sxOYfsNuk1DRzjufa+ohCmoyHucv
         D1jJXnC5k/oo+LJ0CleLYbPWRDfFq2tHVriLY8wPKpjwjcvGdHurcnmzbzxGYUAmHg2I
         tNd84HptpVhXSQUfNZEY7eNsaNEG3no0InNHn3WrP5OhhzgDNNe7c/KdcMaZuNgjIQEP
         hukgGydZaflwIipoMYyD2f8Oq3MNBI5tTD4+Miy4C5HoiZLR5g1/EkP4vZ3E35dbQYZC
         +O1g==
X-Gm-Message-State: AOAM533rnJMxaDHZVa1OuaftksfHE/E61yQ3DR6TO3lIWx74JJZaeE7S
        8uHVKUTAIhEiWDCr9hV5C02yoJ3GX4AV9w==
X-Google-Smtp-Source: ABdhPJzxhB+aA9sHhc+F/nZ9jqHvV8lIFiB7zZttOHbFDV7tBdDHtePLjzR7Iaa9JnH6upmHCBZ4jg==
X-Received: by 2002:aa7:9797:0:b029:1f8:1a14:b055 with SMTP id o23-20020aa797970000b02901f81a14b055mr13158013pfp.57.1616235609086;
        Sat, 20 Mar 2021 03:20:09 -0700 (PDT)
Received: from localhost ([103.21.79.4])
        by smtp.gmail.com with ESMTPSA id t18sm8517260pfq.147.2021.03.20.03.20.08
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 03:20:08 -0700 (PDT)
From:   Santosh Sivaraj <santosh@fossix.org>
To:     rust-for-linux@vger.kernel.org
Subject: Could not insert module: Exec format error
Date:   Sat, 20 Mar 2021 15:50:04 +0530
Message-ID: <87zgyy160b.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


I am very much new to Rust for Linux. My first attempt to build the kernel with
rust support, and insert the example rust module failed with the following
error.

santosh@x86-vm ~ $ modprobe rust_example.ko 
modprobe: FATAL: Module rust_example.ko not found in directory /lib/modules/5.12.0-rc3+
santosh@x86-vm ~ $ modprobe rust_example
modprobe: ERROR: could not insert 'rust_example': Operation not permitted
santosh@x86-vm ~ $ sudo modprobe rust_example
modprobe: ERROR: could not insert 'rust_example': Exec format error
santosh@x86-vm ~ $ sudo modprobe rust_example_2 
modprobe: ERROR: could not insert 'rust_example_2': Exec format error
santosh@x86-vm ~ $ sudo modprobe rust_example_3
modprobe: ERROR: could not insert 'rust_example_3': Exec format error
santosh@x86-vm ~ $

I followed the 'quick-start.rst' by the letter. What am I doing wrong?

I am building the kernel on a x86 host and running it on a x86 qemu VM.

Thanks,
Santosh
