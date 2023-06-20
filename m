Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2E4EB64D7
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Jun 2023 16:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjFTQzh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Jun 2023 12:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjFTQzg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Jun 2023 12:55:36 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BCC91;
        Tue, 20 Jun 2023 09:55:34 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E83135C012F;
        Tue, 20 Jun 2023 12:55:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 20 Jun 2023 12:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1687280130; x=1687366530; bh=KQSCdDFD/6Vkuj0Di+TbFY2KQ2wgcZELmKR
        ti28kkw8=; b=bnfwkXz7FUAWpU5BHQGXg3rmo0S93JHHeo0cjoDkpOFI8+2zASr
        Et6sJB4ALGqZEla7dIqN41vbwuhDrITEz4PO6mv+2F2t72oN76dClNoTGlLXUdBG
        DtfVICedQpQynxHq0U77k8Zn0j48APxlYMFelvwcLBn1w64NSFZSvFwgayVBi+S+
        GI9RkovJ+S/w3hk3v+ZKnDMn6LD8Wo5q5bKOsfIVx3T9JhYG8BSG5U61Vlz8F0oG
        WD9YEyUaE09Y56bRtQi+ODu+hhpwKxlIFK19YhwujhgpY/ZHiLThBMsg5Img71t/
        4LtfM1oGTS8SYx2sxd/MA2g1MBk7VCBPKkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1687280130; x=1687366530; bh=KQSCdDFD/6Vkuj0Di+TbFY2KQ2wgcZELmKR
        ti28kkw8=; b=i/TaytD8HvLQFupBX7zmne+/0Ew5HXDIPOBfMrQwTsfdfVN6bcF
        S8R6cehhCIukF2bCAC24uE3Rfxi1yNyce6WBeyJHtTQKnF7S7owqcN4ZF6iayj25
        3Oo4ZIBiJfYkqnsnxH8Cvg8K2tp31wOEMVMvCUmuZJrMSs9Pycwei3WqBfOwsAed
        5iMZ5jBQDQMPAnYb7ffaTqAS5Mehf6S/l4aaZj9AJuv9K0JvuhvxSjA+AVoxEwWi
        64aFcxkopZybWq6HOmfYqrjmquryO3hQnSTTzG2i0QehZo9cr2FU53HPMSg/N5pT
        DXpIisqKEiuyOORJ/8bYeEUcw+QTqs4B9cw==
X-ME-Sender: <xms:AtqRZCvNVlKKh76TJnxWezHJztAjaJv37mtI8MdGByJHTI2hIEdbsw>
    <xme:AtqRZHcZ5MCOfJ-kaajg_UnseSAxYMKKZ3E7R_DViaCtZ1JrwPxzq8t6nmeDGAMDF
    0SBzgEIWL5mnSUSGg>
X-ME-Received: <xmr:AtqRZNwZFLNSALicYiKv4nlJdNBPXQyyJAS3bY12-AAyI-VeVTOI65oAVaKXOzj4Ra_XiTeJhPcv414RM3yWOOeuRgwTgcyjp7chEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefhedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeetlhhi
    tggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenucggtffrrghtthgvrhhnpe
    ehudduvdetkedvkedtudeludfgfffhudegjeeguedvvedtteevjeehheeiffefgeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhitggvse
    hrhihhlhdrihho
X-ME-Proxy: <xmx:AtqRZNMWfjJZK4fFIPmu_eb16D31hl-GWCUuvBvjRz9zF_SHqGnWgw>
    <xmx:AtqRZC8O-QgB9lP1cc2hXbta-4yDaJTHG2DSysd-vssmG9es7bnloA>
    <xmx:AtqRZFXgA-t4pNd8Cb1CYmkRDn9fuKJH_Zauh8cRKmTTUwyY1XNczg>
    <xmx:AtqRZJk_bTyZ-6MiKQAtNoUUJryl00ys0YJY1i5hWZAaOSyhvEWnFQ>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jun 2023 12:55:29 -0400 (EDT)
Message-ID: <809bb749-365f-af06-c575-0c4b1a219035@ryhl.io>
Date:   Tue, 20 Jun 2023 18:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Content-Language: en-US, da
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
References: <20230614230128.199724bd@kernel.org>
 <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org>
 <20230616.220220.1985070935510060172.ubuntu@gmail.com>
 <20230616114006.3a2a09e5@kernel.org>
 <66dcc87e-e03f-1043-c91d-25d6fa7130a1@ryhl.io>
 <20230616121041.4010f51b@kernel.org>
 <053cb4c3-aab1-23b3-56e3-4f1741e69404@ryhl.io>
 <7dbf3c85-02ca-4c9b-b40d-adcdb85305dd@lunn.ch>
 <c1b23f21-d161-6241-26fb-7a2cbc4c059c@ryhl.io>
 <20230620084749.597f10b3@kernel.org>
From:   Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20230620084749.597f10b3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 6/20/23 17:47, Jakub Kicinski wrote:
> On Sat, 17 Jun 2023 12:08:26 +0200 Alice Ryhl wrote:
>>> The drop reason indicates why the packet was dropped. It should give
>>> some indication of what problem occurred which caused the drop. So
>>> ideally we don't want an anonymous drop. The C code does not enforce
>>> that, but it would be nice if the rust wrapper to dispose of an skb
>>> did enforce it.
>>
>> It sounds like a destructor with WARN_ON is the best approach right now.
>>
>> Unfortunately, I don't think we can enforce that the destructor is not
>> used today. That said, in the future it may be possible to implement a
>> linter that detects it - I know that there have already been experiments
>> with other custom lints for the kernel (e.g., enforcing that you don't
>> sleep while holding a spinlock).
> 
> Can we do something to hide the destructor from the linker?

We could probably have the destructor call some method that the linker 
wont be able to find, then mark the destructor with #[inline] so that 
dead-code elimination removes it if unused.

(At least, in godbolt the inline marker was necessary for the destructor 
to get removed when not used.)
