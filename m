Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F8EC07E9D
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Sep 2022 06:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbiI2G5f (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Sep 2022 02:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiI2G5e (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Sep 2022 02:57:34 -0400
Received: from sender-op-o12.zoho.jp (sender-op-o12.zoho.jp [103.163.153.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D36F12FF0F
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 23:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664434641; cv=none; 
        d=zohomail.jp; s=zohoarc; 
        b=xSKa7wkCIVk2Wzg70HQt5xmsCqoeo0ss2jLnOAPXE0iB81o0G9YA+VyGiKA3uOlEGzwCIu75QrsrD5D97krrKnQRYg2fdecgRDBgel12pHZWRp9nfpdNHphmfblxwXe0QdFL2NbaWN6ki/DGsdxbW1VxJHY62ftFfhwa6Q8nXqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.jp; s=zohoarc; 
        t=1664434641; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=aoMQoP04K2StXuXCS5SJa/2TP7UBtHnTsgXg66DeDsk=; 
        b=F+Lj0I0oe3yfyYw9huDKpWIrMoyTC3m1U08pqTcEImVl6Ebob7/kxaalyNXZfC/4EUd9QmnrDtyUzF1aRppEwAMGHge3QA59luPmrjkAUrMC4R86IGG7kEoommuKVlca/hzBexiRl+eJz3f9zCikk7nvQynSfwx4yj8DXdh62dw=
ARC-Authentication-Results: i=1; mx.zohomail.jp;
        dkim=pass  header.i=exabit.dev;
        spf=pass  smtp.mailfrom=tomo@exabit.dev;
        dmarc=pass header.from=<tomo@exabit.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1664434641;
        s=zmail; d=exabit.dev; i=tomo@exabit.dev;
        h=Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=aoMQoP04K2StXuXCS5SJa/2TP7UBtHnTsgXg66DeDsk=;
        b=GXx3MBL7uqiNc/zH1O52O2qVUE7VSDoecueVMyO7SRDqySNWTT0gLinQOqe8fajP
        X5cUilkuC84caRSZh0sKT5gUB4ycVf15KY/IBTU8Hem6CNKtREEXwvAgNqX2RD9Snku
        pLnmlapyLzZViAzOeQvNLCRSW2bs5LNuMJxe5+w8=
Received: from localhost (p1292009-ipoe.ipoe.ocn.ne.jp [114.146.73.8]) by mx.zoho.jp
        with SMTPS id 1664434639204644.1860617653963; Thu, 29 Sep 2022 15:57:19 +0900 (JST)
Date:   Thu, 29 Sep 2022 15:57:18 +0900 (JST)
Message-Id: <20220929.155718.142512609449591387.fujita@lima-default>
To:     stappers@stappers.nl
Cc:     miguel.ojeda.sandonis@gmail.com, alex.gaynor@gmail.com,
        tomo@exabit.dev, rust-for-linux@vger.kernel.org
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20220928163514.442xdz4eziuoz2fl@gpm.stappers.nl>
References: <20220928143120.iavijwru6r3qnhiy@gpm.stappers.nl>
        <CANiq72nAUKmcBWYqJ0WRHzJbad9L2RrOMP9DY9EYqDD8qSx0RQ@mail.gmail.com>
        <20220928163514.442xdz4eziuoz2fl@gpm.stappers.nl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Wed, 28 Sep 2022 18:35:14 +0200
Geert Stappers <stappers@stappers.nl> wrote:

>> > Where to look for such merge request?
>> 
>> Tomonori has been sending nice PRs for a while -- you can look them up
>> using the author filter in GitHub, for instance.
> 
> At https://github.com/Rust-for-Linux/linux/pulls/fujita
> are two open Merge Requests  (no closed MRs).

Note that they are just the first step. Once the PCI PR is merged,
I'll send more. I need to finish my half-baked code (DMA, iomem,
network, etc) and send PRs.

