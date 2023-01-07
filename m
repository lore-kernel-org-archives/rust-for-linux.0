Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA8CC54EBC
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 Jan 2023 11:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAGLCW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 Jan 2023 06:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjAGLCV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 Jan 2023 06:02:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52214F124;
        Sat,  7 Jan 2023 03:02:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D6B5B818CC;
        Sat,  7 Jan 2023 11:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F666C433EF;
        Sat,  7 Jan 2023 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673089338;
        bh=y1dBQZExvrCIjEuqf5a0iszBwmkq9VzBsolYElZ5tLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PGuVBSs2uBcxvXPAvf4PAAIS0PVdJrYSmnULK1vOutp+2ZHLb0uEWnzY0UFnzxNsM
         gomaX/u3MQmQkv82SNQOCsAlIXUWzvj7fcuaCBpTSUIhjm2Hm1txThR2XihsZu1k4P
         JLNU3Tz9hf6w8ANQbp2s5TnJGnhVq5kPFNBgb5Qc=
Date:   Sat, 7 Jan 2023 12:02:14 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Finn Behrens <fin@nyantec.com>
Cc:     rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: Rust PROC FILESYSTEM abstractions
Message-ID: <Y7lRNocrUCB7xQXE@kroah.com>
References: <4AE31CB6-53D9-45C9-B041-0D40370B9936@nyantec.com>
 <Y7lMtA1OO3NX5bl1@kroah.com>
 <61BCB8A9-044D-4321-AF3F-1387FCDB230E@nyantec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61BCB8A9-044D-4321-AF3F-1387FCDB230E@nyantec.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jan 07, 2023 at 11:44:51AM +0100, Finn Behrens wrote:
> 
> 
> On 7 Jan 2023, at 11:43, Greg KH wrote:
> 
> > On Sat, Jan 07, 2023 at 11:36:27AM +0100, Finn Behrens wrote:
> >> Hi,
> >>
> >> I’v started to implement the proc filesystem abstractions in rust, as
> >> I want to use it for a driver written in rust. Currently this requires
> >> some rust code that is only in the rust branch, so does not apply onto
> >> 6.2-rc2.
> >
> > Please no, no new driver should ever be using /proc at all.  Please
> > stick with the sysfs api which is what a driver should always be using
> > instead.
> 
> Oh did not know that, only translated a C driver from my work to rust,
> and there procfs was used. But okay, will change it to sysfs.

Please do, and please work to get your driver upstream, odds are if this
type of issue is present in it, it could use a good review from others.

thanks,

greg k-h
