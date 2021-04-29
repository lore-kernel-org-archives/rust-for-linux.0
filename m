Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0433CC433ED
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 15:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCE6160725
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 15:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhD2PRB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 11:17:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237480AbhD2PRA (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 11:17:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2912F60725;
        Thu, 29 Apr 2021 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619709373;
        bh=YNmM3RnGZrUBvqG2JQHubXAhGAKMuEEgshq7W9rz6J4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0LKtlTnebreKZS+KTy0mcVaO/nM/48/B0dnKb0JZg3XmhfgJSXi7cJ+Da8E5h7iAa
         Nx0IhcA1lQdAQYkqxjnQsvnhuofKDV5Hv7CJVoQB8c7XhPykG4AwpAFuZCMML/Lr78
         GCJrFtIB2G8zjy/j0dMEi+XADIQecmPkCLZjcYDU=
Date:   Thu, 29 Apr 2021 17:16:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Loading an out-of-tree module
Message-ID: <YIrNuQlVnvpktDcl@kroah.com>
References: <YIrDgupEqcmsUfGX@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrDgupEqcmsUfGX@localhost.localdomain>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 29, 2021 at 09:32:34AM -0500, Carlos wrote:
> Good morning (or good afternoon) to all,
> 
> I managed to build an out-of-tree HelloWorld module. However, when I 
> tried loading it in the kernel (booted with eudyptula-boot)
> and dmesg inside the shell, I get a 'loading out-of-tree module taints kernel':

That is to be expected, the kernel is working as designed :)

thanks,

greg k-h
