Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF54C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 23 Mar 2022 11:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243967AbiCWLmK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 23 Mar 2022 07:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243932AbiCWLmC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 23 Mar 2022 07:42:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E19878FE9
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Mar 2022 04:40:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D4316146C
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Mar 2022 11:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7D8C340E8;
        Wed, 23 Mar 2022 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648035631;
        bh=wZFyBAI+F2JdmLzvsDUgMqU75L8SgvaJiCOOlT/3XLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jJqKEPv4DmhC5SjgpY9i37ZSe+TeeCcinq3Np3tSZ2cmH4nJ9/yBiGQZp73vEfuQs
         8joIIVyW53l+SHA8QkXWJ/G6+tDzyeLcbgTtXXZYtbCIzldDlZM7qY/UUi+ZEjrXFZ
         C+L0SxgGSyx9Ae8eUjfzwHu38yuxLrqdzpop/Q78=
Date:   Wed, 23 Mar 2022 12:40:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?N=E1ndor_Kr=E1cser?= <bonifaido@gmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Using 3rd party crates in an out-of-tree module
Message-ID: <YjsHLJPb2haKbOBg@kroah.com>
References: <CAHkG_ewRo5uPOue3ZMAAPAc+eP7MNNU5iVym-JVG1jN7HD+XMg@mail.gmail.com>
 <CAFRnB2W+8XqOj0aL5DP2cMNLO2uR0DpPk-qB-oC7r=zT5N5gGA@mail.gmail.com>
 <CANiq72=q2FWAfyjPs+VC-H6o8RXCjrXwKbCFJ1kDKGbfYDYnGw@mail.gmail.com>
 <CAHkG_ewQ3uJBTTPQ24+faW6v2ZHvGhTR2qTpfrj6URTr6hy0SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHkG_ewQ3uJBTTPQ24+faW6v2ZHvGhTR2qTpfrj6URTr6hy0SQ@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 23, 2022 at 10:40:33AM +0100, Nándor Krácser wrote:
> Currently I'm experimenting with different crates which I would like
> to use in my module, serialization libraries, math libraries. etc,

You really do not want that type of code in your kernel module.  Adding
functionality to the kernel rust crate should be the only way to do
this, for good reasons.  Not the least being that userspace crates have
no idea about the restrictions that occur when having to run within the
kernel.

thanks,

greg k-h
