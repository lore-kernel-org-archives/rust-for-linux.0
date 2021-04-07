Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DC6C433B4
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 16:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B179610E6
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 16:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343545AbhDGQup (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Apr 2021 12:50:45 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:53522 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235801AbhDGQum (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Apr 2021 12:50:42 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 41A21BAC2F;
        Wed,  7 Apr 2021 12:50:31 -0400 (EDT)
        (envelope-from geofft@ldpreload.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=u4uv/x/DeUfPzABOt4KG+MltwpI=; b=UrxLk1
        ozIyfVmZWQEpfdEXtg3Hx8RpoiFIOqDI9Dj6wcHSiBLcwxn5vq+pQX6sqLC4qGdA
        mHmxfggoWWuqyYmubT36yWnbRGo6waHSpr3Ih7ARvDJC+/SRe1vmtRQgwvQkZLuj
        bq2whV41f03C5ZIklYOtkxU52RxPePIbSTFJc=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 38504BAC2E;
        Wed,  7 Apr 2021 12:50:31 -0400 (EDT)
        (envelope-from geofft@ldpreload.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ldpreload.com;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=mesmtp; bh=2dvR8rkKJR5FtGoVQMpOYNBVwrOPWi/zFG3a0VFfYYI=; b=xfO06S8wEj6oEa5FVRbIwR10OJpabtW+unBXEviOPPhHUkNhshIPVxoFakxEpyfR+nej8nbwcP2w4bcOHd5ajK64LkL59dI7KTJ8Ku5VXLi8t+35FJgTpmm7r16gsGuvkRJWFr7DvC3HLubL/4QTv9XFDPT7JGLwtkdk7ptGJcw=
Received: from cactuar.ldpreload.com (unknown [198.27.64.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 9D60BBAC2D;
        Wed,  7 Apr 2021 12:50:30 -0400 (EDT)
        (envelope-from geofft@ldpreload.com)
Date:   Wed, 7 Apr 2021 12:50:30 -0400 (EDT)
From:   Geoffrey Thomas <geofft@ldpreload.com>
To:     se iro <seiro22@mailfence.com>
cc:     rust-for-linux@vger.kernel.org
Subject: Re: leaky info and kernel modules
In-Reply-To: <1802230489.25122.1617805363569@ichabod.co-bxl>
Message-ID: <alpine.DEB.2.11.2104071235550.11174@titan.ldpreload.com>
References: <1802230489.25122.1617805363569@ichabod.co-bxl>
User-Agent: Alpine 2.11 (DEB 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
X-Pobox-Relay-ID: 5CD08A7A-97C1-11EB-A417-74DE23BA3BAF-67873895!pb-smtp2.pobox.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 7 Apr 2021, se iro wrote:

> saw post on reddit and github issues where rust compiler adds username 
> and systems paths/info to **release** mode compile bins. also its pkg 
> mgr cargo does the same with registry paths. otherwise its extra strings 
> bloating output that not needed and strip command doesnt work. also not 
> working is compiler opts described

I think what's going on is that, while this is unusual for most dynamic 
languages (and the Rust language intentionally targets the community of 
users of dynamic languages), it's actually the normal behavior for 
compiled languages - compiled C binaries include full paths in their 
debuginfo too. I checked a random released kernel that I'm running, and it 
has full source file paths (including the username, if you built in /home) 
in its debug info, so for the purposes of Rust in the Linux kernel, I 
don't think this is an effective change.

We should definitely match what the rest of the kernel does in terms of 
debug info, but I think we already do.

-- 
Geoffrey Thomas
https://ldpreload.com
geofft@ldpreload.com
