Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660E8C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 16 May 2022 13:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241232AbiEPNe1 convert rfc822-to-8bit (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 16 May 2022 09:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbiEPNe0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 16 May 2022 09:34:26 -0400
X-Greylist: delayed 496 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 May 2022 06:34:24 PDT
Received: from mailext.lri.fr (mailext.lri.fr [129.175.15.10])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8364E2E08E
        for <rust-for-linux@vger.kernel.org>; Mon, 16 May 2022 06:34:24 -0700 (PDT)
Received: from [129.175.15.10] (mailext.lri.fr [129.175.15.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailext.lri.fr (Postfix) with ESMTPSA id 18735C029E
        for <rust-for-linux@vger.kernel.org>; Mon, 16 May 2022 15:26:08 +0200 (CEST)
From:   Xavier Denis <xldenis@lri.fr>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Taint Analysis for Kernel Rust
Message-Id: <DFB00BA8-A9AE-4854-9CF7-082380402F20@lri.fr>
Date:   Mon, 16 May 2022 15:26:07 +0200
To:     rust-for-linux@vger.kernel.org
X-Mailer: Apple Mail (2.3693.60.0.1.1)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

I saw a tweet (https://twitter.com/marcan42/status/1526107814477074432) from Marcan about the need for some sort of taint / capability analysis in Rust4Linux, and was offering my services. 

If someone knows what kinds of analysis are needed and could let me know that would be great: is this intra-procedural? Inter-procedural? Are we dealing with simple binary taints? Or do we need arbitrary partial orders? How complete/precise do we need the procedure to be? 

Given an answer to these questions I think I can whip up a `cargo taint` command rather quickly, so let me know if this is useful or desired. 

PS: I gleaned from other threads that there’s a Zulip as well, would it be possible to get an invite? 

Best,

Xavier 
