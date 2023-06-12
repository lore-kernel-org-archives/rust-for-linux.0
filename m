Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794FDC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 08:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjFLIUy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233228AbjFLIUT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 04:20:19 -0400
Received: from a27-22.smtp-out.us-west-2.amazonses.com (a27-22.smtp-out.us-west-2.amazonses.com [54.240.27.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011E51717
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686553344;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=i4COiaCXyYDdsA53oeQqSbv0qkHwzvOoZppZsxovdiU=;
        b=edej2erseNj8KQ9+zzbu0DZlC3dl1po+8T5gPHFozBTmvkcoskS+xQayGpzg2S2b
        FaCRb6282YH+aHrwLPjuU0NGK/pHYJX95t5xuu6jQ81LMKS1hYb4po1ynkCgnctcge3
        dBOhLyG2yaTwV428+EQl5LYu0nyt6Qf8Q58v1d21pmrLE0Ziw/XyBxZD8HIr/4ughhk
        GSQ0eZQtSxinnY7DVM2oHVErbq1ykscJR54Ql0M98Lg2Eg4si3WMfkUInLGYWsQPkx4
        WuwJqQ8s/3vwEipx/NblBSdiNQooEgZExeSdDuzeAxbz09qGTovx5o8CFWI9IrzL/b4
        q+YfV5QBZg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686553344;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=i4COiaCXyYDdsA53oeQqSbv0qkHwzvOoZppZsxovdiU=;
        b=SdRB6ahVScy2/c0lDIoC82eVQdDkessRdGqtV6lnKr3vvKJlb468Dun00RkcOUPI
        i22SYz7LK6vUAqptcbhzPG9+PI8LnKxEXfWbCIcA9zNCkhPojKYkKc9TI9Ur0vcvDyH
        WTgKFvrk3Bab8qRiU+DM1mZSNypvOXbwIW2b7Kus=
Date:   Mon, 12 Jun 2023 07:02:23 +0000
Message-ID: <01010188ae69b73c-78d7aaa2-262d-40a2-982f-75a9e203ca6b-000000@us-west-2.amazonses.com>
To:     andrew@lunn.ch
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, fujita.tomonori@gmail.com,
        fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 5/5] samples: rust: add dummy network driver
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <d76261e6-5558-4e57-9e5f-d778f9ef3804@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
        <01010188a42d5620-fdafc00a-8aad-4c5e-a0b7-1fb83da6ba03-000000@us-west-2.amazonses.com>
        <d76261e6-5558-4e57-9e5f-d778f9ef3804@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.12-54.240.27.22
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sat, 10 Jun 2023 18:59:52 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +        pr_info!("Hello Rust dummy netdev!");
> 
> In general, we discourage the use of pr_info(). netdev_info(ndev, ...)
> is what should be used, once the device is registered. The output then
> includes which device is says "hello world", which can be useful when
> you have more than one of them. netdev_info() can be called before the
> device is registered, but since the name is not fixed at that point,
> the output is a bit more ambiguous.
> 
> I would not say this is a blocked for this patchset, but i would add
> wrapping netdev_{dbg|warn|info|error}() high on your todo list, they
> are pretty fundamental to network drivers.

Sure, I'll add it to my after-initial-upstreaming TODO list with
per_cpu stuff.

For now, I'll add 'TODO' comment in the next version.

thanks,
