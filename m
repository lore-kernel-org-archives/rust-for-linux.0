Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA11EB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 15:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344935AbjFOPBm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 11:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344959AbjFOPB0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 11:01:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F098297A
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:01:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0294D60A1F
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B96C433C0;
        Thu, 15 Jun 2023 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686841268;
        bh=hBwiaSGn0nBddMVHJAAxoUgttTAMLJjTNQGw5lI7TII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zUZgbmrDhEAGL/LjHqMHGJlUwNzcRctBGRu3j8ITpTed69mL2ivi0FWo8FZgpAcVK
         Tch3IC5VF7tKJ/YplMi/cqWvLcteXa29QU56Rx/BhqYQx+WxUZzcwvE+mhaaJej5Z3
         qUMPfn24kVk8dKKMwTqy2zN4u3nS1+YSno+ugHBU=
Date:   Thu, 15 Jun 2023 17:01:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
Message-ID: <2023061544-pony-nappy-78cb@gregkh>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
 <20230615142311.4055228-2-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615142311.4055228-2-fujita.tomonori@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jun 15, 2023 at 11:23:10PM +0900, FUJITA Tomonori wrote:
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

For obvious reasons, we can't take commits with no changelog text at
all, nor would you want us to :)

thanks,

greg k-h
