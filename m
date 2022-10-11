Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08218C433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Oct 2022 06:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiJKGUu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Oct 2022 02:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJKGUs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Oct 2022 02:20:48 -0400
Received: from sender-op-o12.zoho.jp (sender-op-o12.zoho.jp [103.163.153.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BEC65D5
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Oct 2022 23:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665469230; cv=none; 
        d=zohomail.jp; s=zohoarc; 
        b=APZuAtr7QBLdPdiIlS/xagP19x17ROlpeF7C9py/Jx9N2BBUXcDun6SHH46HXBzlfjue1WgKcKUhBvrlwCHHgDreJoPO36r7aWTyoao/+XQEVr+WvDO1b3sM58k3Hg1uBDhhPY0Qt0uopgtr9TXAelZrcG9lUcou+ej5fAEeu38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.jp; s=zohoarc; 
        t=1665469230; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=1OideRTR+Kt8xQmM5k3ME5tCnAoj7i4nfY5RuKiDf68=; 
        b=a8YJt+yU7eLIw29h9yyOLjrxR1eTF5yL3R4N0ZGJeMAqHdTtzOAVC4qQs5bTCSCSb4joziyZj6DI8sahXjqAsOOjofGT3kPCXZcZCKSztf6vQd+BFghyO2c/DILna1ylnEZVbDvKJWJjrwHCBmpOsoKkGSfEGL2Qx8ZXPRuCOGo=
ARC-Authentication-Results: i=1; mx.zohomail.jp;
        dkim=pass  header.i=exabit.dev;
        spf=pass  smtp.mailfrom=tomo@exabit.dev;
        dmarc=pass header.from=<tomo@exabit.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665469230;
        s=zmail; d=exabit.dev; i=tomo@exabit.dev;
        h=Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=1OideRTR+Kt8xQmM5k3ME5tCnAoj7i4nfY5RuKiDf68=;
        b=TdckvuyWvqgX3MBy9ud2s2AIJlT6YbX6fjMMP3ej0uSWh7UhVtVwwTkmfcLXlrbl
        Sw4ZOi+xXW7b7x17BLWRApZkKUaPcA5F3kXM6pEoxsW5Js5NKUwm/ewjTTNd2K4Kr9L
        FWybDEDcZDjopiR3Nc5iFS0mqbl5h1ojETje1UdI=
Received: from localhost (p1292009-ipoe.ipoe.ocn.ne.jp [114.146.73.8]) by mx.zoho.jp
        with SMTPS id 1665469225574630.3220183044224; Tue, 11 Oct 2022 15:20:25 +0900 (JST)
Date:   Tue, 11 Oct 2022 15:20:06 +0900 (JST)
Message-Id: <20221011.152006.627622596401854552.fujita@lima-default>
To:     gurugio@gmail.com
Cc:     rust-for-linux@vger.kernel.org, andreas.hindborg@wdc.com,
        wedsonaf@gmail.com
Subject: Re: wrapper for __register_blkdev and unregister_blkdev
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <CANc8B5MUDNfR=zLrigH0DtR1YVDc1hwp3Usz-_vEczBppP+cqA@mail.gmail.com>
References: <CANc8B5MUDNfR=zLrigH0DtR1YVDc1hwp3Usz-_vEczBppP+cqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Tue, 11 Oct 2022 12:01:16 +0900
Gioh Kim <gurugio@gmail.com> wrote:

> I tried to make the ramdisk module for exercise but found that
> there is no wrapper for block layer APIs.
> I thought it would be great if somebody is working for the block layer.
> So I just implemented a wrapper of only __register_blkdev and
> unregister_blkdev for testing.
> https://github.com/Rust-for-Linux/linux/commit/65fd073d9f2ccbdabeae444ff34a72e23d717845

I think that you could use Andreas's NVMe driver tree:

https://github.com/metaspace/rust-linux/tree/nvme

Andreas has worked on the block layer abstraction that Wedson
implemented.

It doesn't have Rust APIs for register_blkdev/unregister_blkdev()
because the NVMe driver doesn't directly call them. But easy to add
them. 

I planed to work on the block layer but there was already Wedson's
work so I've been working on other stuff.

Thanks,
