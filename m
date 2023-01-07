Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC5CC54EBE
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 Jan 2023 10:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbjAGKnL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 Jan 2023 05:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjAGKnI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 Jan 2023 05:43:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA5D2AD9;
        Sat,  7 Jan 2023 02:43:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5213760BA6;
        Sat,  7 Jan 2023 10:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C8CC433F0;
        Sat,  7 Jan 2023 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673088183;
        bh=XpOCkUedls8MTdjSrA/+Wl0kCJpmvTJl7RSUOhz95QQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JrGk+fr9hIjPRt8WC/A7xn/PM6DGPuaarmg9X5Yleml3LKUKDOT8nTHrWIInnlKZ8
         ormbLfwbzftP29aQA8fTqXlEw6Mgo+yqDL2CMLV9EV3Z7Y4n2SlDfLcDaPwWbhQDug
         dO1q3JC13C/r2nHDsruUL87gOjMQWecFKIAFuhKs=
Date:   Sat, 7 Jan 2023 11:43:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Finn Behrens <fin@nyantec.com>
Cc:     rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: Rust PROC FILESYSTEM abstractions
Message-ID: <Y7lMtA1OO3NX5bl1@kroah.com>
References: <4AE31CB6-53D9-45C9-B041-0D40370B9936@nyantec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4AE31CB6-53D9-45C9-B041-0D40370B9936@nyantec.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jan 07, 2023 at 11:36:27AM +0100, Finn Behrens wrote:
> Hi,
> 
> I’v started to implement the proc filesystem abstractions in rust, as
> I want to use it for a driver written in rust. Currently this requires
> some rust code that is only in the rust branch, so does not apply onto
> 6.2-rc2.

Please no, no new driver should ever be using /proc at all.  Please
stick with the sysfs api which is what a driver should always be using
instead.

/proc is for processes, not devices or drivers at all.  We learned from
our mistakes 2 decades ago, please do not forget the lessons of the
past.

thanks,

greg k-h
