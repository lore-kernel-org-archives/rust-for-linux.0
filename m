Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E1AECAAA1
	for <rust-for-linux@archiver.kernel.org>; Sun, 23 Oct 2022 07:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbiJWHGt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 23 Oct 2022 03:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiJWHGs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 23 Oct 2022 03:06:48 -0400
Received: from sender-op-o11.zoho.jp (sender-op-o11.zoho.jp [103.163.153.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A4171BF4
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Oct 2022 00:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666508803; cv=none; 
        d=zohomail.jp; s=zohoarc; 
        b=p3V8WqIizOqruVDVcnI5EWFj+1O9O3fPpexLfw5q1Zj8BlVcO75EANCpW7u00kTaJssRggTCrTQt/WDJbK0hwewqkMgmquiZ6AoE2tKediJcHD2ZIFeIr+lt1LB99QHmOmIvWtIyFad8rnUJOOwnN9uRx9EdyO6uLou/ZK6Nz4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.jp; s=zohoarc; 
        t=1666508803; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=3Lju++PRz0ZJDu2UJHESdTGSfRvKWktgoWtj1L2wVMg=; 
        b=HAGjWSvxL6/8tNWAga5HxmsknmuFgWJlH2KxExWc6+gJa7b5hY79iZEOhLyg/02QbTsIv3szew+7aFwiPo62+aCYx0LmW5Vur5uMJJCc/adPH/MtcLbNv3LRzVSYjTvumCZbQXVLOOycorp5NAzT5E+PyqbW/bTwBkiN7V847Zs=
ARC-Authentication-Results: i=1; mx.zohomail.jp;
        dkim=pass  header.i=exabit.dev;
        spf=pass  smtp.mailfrom=tomo@exabit.dev;
        dmarc=pass header.from=<tomo@exabit.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666508803;
        s=zmail; d=exabit.dev; i=tomo@exabit.dev;
        h=Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=3Lju++PRz0ZJDu2UJHESdTGSfRvKWktgoWtj1L2wVMg=;
        b=Z/ARwWr2rj51IRSSB0sUcPDhCu4qY7ViUtKSAq92plJgNQtMTRCpblMGKEbpfruU
        gagIEPLkpJNtqU35cbCFWVTzMHdEIjiYTzVix60o4lIiZLR4fz6JcTK2UXMKP02QK4H
        u0WJ1EGJhJEDmoiJ1A97cCr/MHsNYJB8XNcR8l10=
Received: from localhost (p1292009-ipoe.ipoe.ocn.ne.jp [114.146.73.8]) by mx.zoho.jp
        with SMTPS id 1666508799530861.6056149850746; Sun, 23 Oct 2022 16:06:39 +0900 (JST)
Date:   Sun, 23 Oct 2022 16:06:29 +0900 (JST)
Message-Id: <20221023.160629.2256816202817247395.fujita@lima-default>
To:     tomo@exabit.dev
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20220919.103820.680182888079022491.fujita@lima-default>
References: <20220919.103820.680182888079022491.fujita@lima-default>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hey,

On Mon, 19 Sep 2022 10:38:20 +0900 (JST)
FUJITA Tomonori <tomo@exabit.dev> wrote:

> I've implemented Rust e1000 driver (Intel Ethernet adapter):
> 
> https://github.com/fujita/rust-e1000
> 
> There are many places to use the C bindings directly for now. I try to
> clean up and push abstractions for NIC drivers (DMA, PCI, network,
> etc).

Removed all unsafe for the C bindings now. I implemented abstraction
APIs (PCI, DMA, network, etc) for minimum functionality of the driver.

Pull requests aren't merged yet. You can try the driver with my kernel
tree:

https://github.com/fujita/linux/tree/rust-e1000
