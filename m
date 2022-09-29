Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CE9C07E9D
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Sep 2022 06:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234533AbiI2Ggk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Sep 2022 02:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbiI2Ggi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Sep 2022 02:36:38 -0400
Received: from sender-op-o13.zoho.jp (sender-op-o13.zoho.jp [103.163.153.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC0812164B
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 23:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664433384; cv=none; 
        d=zohomail.jp; s=zohoarc; 
        b=PQAU8sHockEGDXGuFrqlDAqOSSqzED3NwJYJ6/hoaz2vLD+NYF8ZwVcPO5YOfh+NtFChC56CCVNmXlRMhqAp4ise09WwweQejWt4BqzFOs6le+J6s45WzUSunThP4DX8fsGQf60PE5HXg6yod1hYNHLjRWAaWjFrr4N7ex+gNm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.jp; s=zohoarc; 
        t=1664433384; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=9k/xzd0bo28KTkiLBN2s1IJDmJvbv177oM7tV9w84Lg=; 
        b=sodM2QRjr4mXhTfg0wyehlLvlYV3brbD+YkmOQZ6JVBTrEw+I1FRA57Ybqu8WlJfVvol93dCL28Aa/qJy4zDng2zOl/8+a5+juTjUa7RmXTP20sB1p2iWcDEP7xasjiBParEQeEV84BPO1S0LwXMYWa80fkTd3k6+R38bDHGuXE=
ARC-Authentication-Results: i=1; mx.zohomail.jp;
        dkim=pass  header.i=exabit.dev;
        spf=pass  smtp.mailfrom=tomo@exabit.dev;
        dmarc=pass header.from=<tomo@exabit.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1664433384;
        s=zmail; d=exabit.dev; i=tomo@exabit.dev;
        h=Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=9k/xzd0bo28KTkiLBN2s1IJDmJvbv177oM7tV9w84Lg=;
        b=Za0mKlZtYEk6g7JM8NhAxQY+BuhmejCeiR069Uck3gfNSk7A+C44lVCQ5sctzX6A
        SChFlqDSe2lrRq2myC8eSwWBQpv/oPzYjU2efa1qU9HOKfvSKzDiY0aQp9TteKrUYXQ
        cyy2WZdOmgwfTblBeXJx/Ij1v1hT3vLLBUuctf3E=
Received: from localhost (p1292009-ipoe.ipoe.ocn.ne.jp [114.146.73.8]) by mx.zoho.jp
        with SMTPS id 1664433383806174.85677403274894; Thu, 29 Sep 2022 15:36:23 +0900 (JST)
Date:   Thu, 29 Sep 2022 15:36:23 +0900 (JST)
Message-Id: <20220929.153623.1440169232702561363.fujita@lima-default>
To:     stappers@stappers.nl, miguel.ojeda.sandonis@gmail.com
Cc:     alex.gaynor@gmail.com, tomo@exabit.dev,
        rust-for-linux@vger.kernel.org
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <CANiq72kShUNkypRF9sH-EPeE7qV+dKkstNE8YVvVn_U-fKM2_A@mail.gmail.com>
References: <CANiq72nAUKmcBWYqJ0WRHzJbad9L2RrOMP9DY9EYqDD8qSx0RQ@mail.gmail.com>
        <20220928163514.442xdz4eziuoz2fl@gpm.stappers.nl>
        <CANiq72kShUNkypRF9sH-EPeE7qV+dKkstNE8YVvVn_U-fKM2_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Wed, 28 Sep 2022 18:46:59 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> README.md at https://github.com/fujita/rust-e1000 hints,
>> hints me, "this part should be inserted in another source tree".
> 
> I don't see the quote you mention, but from a quick look it seems he
> decided to develop the driver side as an out-of-tree module, with the
> abstractions in the Linux one.
> 
> While that requires to clone both repos, you don't need to move files
> between them: compiling the out-of-tree module after the main repo
> should work.

Yeah, it's just an out-of-tree module. After compiling my
Rust-for-Linux tree:

https://github.com/fujita/linux/tree/rust-e1000

should be easy to compile rust-e1000 repo. No need to move the code to
somewhere.
