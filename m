Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C554AC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 14:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241568AbjFIOr2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbjFIOr2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 10:47:28 -0400
X-Greylist: delayed 361 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 07:47:26 PDT
Received: from a27-52.smtp-out.us-west-2.amazonses.com (a27-52.smtp-out.us-west-2.amazonses.com [54.240.27.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A19E4A
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686321683;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=hX7Oi2aAsL+tER7pan0FuBidAeNzi9AqKL1hVzc2BGU=;
        b=AhuveFIP4I2PtVUeLwXoD0xfl6r2u7YaeMWARjlTK77l77UWkGbkH5bsjZTgthT6
        WT58HRgZG4+HgalqDCEXUY+tHIsaLfcwGM26xCz/u7HmQWc2wok4m59TTsTC9uKZ/mD
        dkEgnNE9r7mUGNZcmsfSGKZfL0bw9aMrwrTrG17V0spTEzqyU4xwWWtD0osNebBgBAN
        /AnNbkCNZfKNUlIB2Q471jpAzVMrrS2b7aDsxekRf5p8eSgDnnm0Cepmg4/0RSHkAsv
        V5GSXPtw9UQmvJAOUYMprrqnxt+84OA3JP8Gz9gq1EY7qQGpCOZQoEo6S33Wp7acAxu
        xuMi6lb34w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686321683;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=hX7Oi2aAsL+tER7pan0FuBidAeNzi9AqKL1hVzc2BGU=;
        b=nGWYLs+0y2ufcuB+wFJFlxJZu2lkF8IiRdP1B7hR9sgBI7bW9XiCZSxcN7p9U8Bp
        hgF2ov+/Y+ctk8mwl7B38R7SyfyCxPPsXF+8Wg8eIv3laHSCwsCb1d23f39IQZVeIeC
        eSZMgLAD1sItNAc5FvP5IK506ne1Q9+zPVTKeXRk=
Date:   Fri, 9 Jun 2023 14:41:23 +0000
Message-ID: <01010188a09adbab-f50e8f19-fad6-4dd6-b796-d8e4b0cbc162-000000@us-west-2.amazonses.com>
To:     andrew@lunn.ch
Cc:     tomo@exabit.dev, aliceryhl@google.com, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <a1e6359f-5e4d-4d01-b0e5-cb1dcaf0bd2f@lunn.ch>
References: <20230608082225.1367048-1-aliceryhl@google.com>
        <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
        <a1e6359f-5e4d-4d01-b0e5-cb1dcaf0bd2f@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.09-54.240.27.52
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Fri, 9 Jun 2023 15:53:43 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> There is a lot of highly optimised code here. Either you need to
> really understand it if you want to implement it in rust, or you just
> wrap the high level interface.
> 
> If you look around at papers talking about high performance
> networking, you often see that you have around 200 instructions to
> handle a packet. You need to avoid any sort of contention with other
> CPUs, you don't want cache lines bouncing between CPUs, you don't want
> to be signalling between CPUs which atomics will do, take any locks
> you really don't need. Everything should be local to the CPU.

Surely, understood.

I'll remove the atomic counter stuff in the sample code in the next
version. Even with big comments, it could be controversial under
review of netdev ml, I guess.

Likely per-CPU data can't be simply wrapped in Rust because of its way
to use macros. Let me try to push the minimum abstractions for
upstream first. Once it's done, I'll work on more Rust abstrations for
real network drivers.

Thanks,
