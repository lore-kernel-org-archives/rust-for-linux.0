Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F48C433FE
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Sep 2021 18:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37276610A2
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Sep 2021 18:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241887AbhIBSmN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 2 Sep 2021 14:42:13 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:56559 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347071AbhIBSmJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 2 Sep 2021 14:42:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id DA8472B008D1;
        Thu,  2 Sep 2021 14:41:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 02 Sep 2021 14:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=r38+nSzCq6uECfUA1nc4T+DPFW1
        RTquEwms3gVSTGuM=; b=vv/ZpxF+Kdbdq+LviB/P6X/lCNW3KM6dzDdmOadpBkU
        jwQTr4QK2h86TSGUmZZZ76745GX4QYk/U9tEwhJfosj0m1hk1QsG8r+V2elp896u
        YUokRCZ9Xkifimi4lfpV/oXc9LkmMcWRbE2sNe75a8Xl/OTM7MPUjbyl6+HkWx1F
        rnvEH4e83ewZ+EFLh5t1Fj9llM9J1MJIW2GU+bUvNJJTbc6IvVqS0P2L6CLRJ6EB
        KCp8ZkAH1nzXFgqlveFTFw3Q60aDGQx1rYOZeJtT8OmqtUb0+bDAXJRc3TeY5YxW
        3XUEDTUmMpFcpSn1gvNLWz+ZhUryrTvnS4ONF/YF7Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=r38+nS
        zCq6uECfUA1nc4T+DPFW1RTquEwms3gVSTGuM=; b=ileA0pPOcVxZLvW+af0JsS
        /uYggpWpO9sVPQb1NzWCSF5uaUnKDqiPNPexECw27Z1r1X2kttN1i/gB/NNezjMS
        ncUaIPtTCd7/mqzahDFtIT6J6gdmR6U2JN1Ag4WyDpUdkryqjI2pVgjzqqoesWus
        t/hduZJ+AJGEkME1VzL05T7//bZ0MmHU0ZLf13eNMPHQd22C6QNhG3wWr6tOHUHw
        L9plyVe9ooGeKyeJ3N7YX4YnwOXHy62Pc+bBsSQ07/poJGnDNeBQJeBNdU7M3yoD
        P3Lv8grT8PpqD+hNGLbON8t69lKN9GfBw6BJrALghBes4mx4krq/onBTF8oUArLA
        ==
X-ME-Sender: <xms:xhoxYckpR5GgLNBGS33OLBtAFkLeklhUBHhC4_jmqYQKSUsPuxRIoQ>
    <xme:xhoxYb18GebWFZkZ9ALA0SOJCJccUy0UOF-cmKdN0FEBg8wAsnylCKbLVy6l3Qufr
    O2IbaDxg2psnqBC5Q>
X-ME-Received: <xmr:xhoxYapCiLrsi81fH_zPOByJy4CsfNxzkw-1hJNYx8jyMl7MX48x-lCnHuASksfY9hQuGQ2PPucmZzcPVjaWzlJwlRXG9QhWjR03-H7jq9sBPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnegovfgvgihtqf
    hnlhihqddqigegudelqddvkeduucdlfedttddmnecujfgurhepfffhvffukfhfgggtuggj
    sehttdertddttddvnecuhfhrohhmpeffrghnihgvlhcuighuuceougiguhesugiguhhuuh
    drgiihiieqnecuggftrfgrthhtvghrnhepueduvdejfefflefgueevheefgeefteefteeu
    udduhfduhfehveelteevudelheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:xhoxYYmKhP08WibUZsjHMbmncVgP98h5k83eTYp0ZZJd8o3zLSXH0w>
    <xmx:xhoxYa3WdcbD1wknoGylOivcX7t0RejIKcpGWDhhlVwqw13iM7QtMA>
    <xmx:xhoxYftxbs3BkevEibpMu8w80pJ6lEIToSE1KVxRTVlE2BynWhaiXw>
    <xmx:xhoxYf9K1w2PtocetkFtNDWoGkhKIoxB6HvK4k4ML-bhaij2fFJR0HJayng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 14:41:09 -0400 (EDT)
Date:   Thu, 2 Sep 2021 11:41:08 -0700
From:   Daniel Xu <dxu@dxuuu.xyz>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: How are rustc -Z flags enabled during build?
Message-ID: <20210902184108.yrxmccpp5ofi4nit@kashmir.localdomain>
References: <20210901230715.civmnrpmt3c2u72v@kashmir.localdomain>
 <CANiq72nGvGL1qhr-BpEZ=kY_oW5ZDe_nUvuh8tWPKLNq-oVJQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nGvGL1qhr-BpEZ=kY_oW5ZDe_nUvuh8tWPKLNq-oVJQA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Gary, Miguel,

On Thu, Sep 02, 2021 at 07:50:44AM +0200, Miguel Ojeda wrote:
> Hi Daniel,
> 
> On Thu, Sep 2, 2021 at 1:11 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
> >
> > When I try to run it outside of kbuild, I get:
> >
> >     error: the option `Z` is only accepted on the nightly compiler
> >
> > How does kbuild use the -Z features on a stable rustc?
> 
> As Gary points out, it is an environment variable being set in the
> top-level `Makefile` nearby the other flags. I considered adding it to
> the command-line instead so that copy-pasting the lines is easier,
> even if it means being a bit more verbose.
> 
> In any case, note that it is an escape hatch intended to be internal
> to the compiler (which explains the error message not mentioning it)
> and thus should be avoided unless a project has very special
> constraints.
> 
> Our goal is to drop its usage as soon as it is feasible, but it will
> take a while. It is also why we only maintain support for a given
> `rustc` version for the moment.
> 
> Cheers,
> Miguel

Thanks! I knew there must've been some magic somewhere :) .

Daniel
