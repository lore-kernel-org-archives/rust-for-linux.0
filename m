Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0FAEB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 12:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245236AbjFPM1l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 08:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjFPM1k (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 08:27:40 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C69030DF;
        Fri, 16 Jun 2023 05:27:39 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id BEBFE5C00EE;
        Fri, 16 Jun 2023 08:27:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 16 Jun 2023 08:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1686918458; x=1687004858; bh=YkHzHOma5viGo58CK3A/aRgZKAfcV/MATp/
        hYr8GsAA=; b=pyjh6G74mrObpB/UUhjsP4QiE9HqqPlO6A37HxvMlcHOs4boUJz
        slHbBaCWPI6IUDhi8XPy6z8O66A5aIDlGEDrKy+ZwwXPRu9rVQiNUAwWrBt75skP
        JhDD/6Uwh6CKdG/olHh1rIkebXwTMDzwaLRd71Yfq8zz5UgHkwnhr/baYiROwK8Z
        SCz0cODZwMpsUN9O1Q6h5AIdGEevb89XA5aEL2IEKJsBfCXnEJBw1U/njBZkRMCa
        6tzO1g/B8wu39Y1W/ElYcTUZQHOimL8PclsC0q7p32xzO2j6KovApkNWRAHnfqHs
        fp84Lctw4r5HvwT6+NsJ6/Ma5d4SIbG8aIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1686918458; x=1687004858; bh=YkHzHOma5viGo58CK3A/aRgZKAfcV/MATp/
        hYr8GsAA=; b=eE3sJSBq7kMGLyXgxn4uWZnBlgIj29V9uecuMHXWn7+xEiAM4po
        JBL4ol0ZA2AhdNd8n4x7C72RSecLrdjJF2DASGO2HQHqIEQj6vK18IPj6aD+627e
        VXW2URdRcu4du/IdhEy8CSmcQT/E0Ojq43EEh/XDSs5vhwM3FQ+ZAK5SIHG/kO1r
        vDygMiLo/3yRmgdJctng/dL4RBw2ZMJf1jCst5DhioRH0Szq17z2DrJ9hWh071i8
        KWjnAdzjv8nV4BzOLph9hgYNJv/rbgfo7QvNQcFF9g3fHtBkSFfXhJw7wvUSAca7
        Y7ZO+np6ooj0t8eeat0URmIbGKFaxWGeiVw==
X-ME-Sender: <xms:OlWMZB99l-vnV8bqjV3-lTHeRtwfQFYC4Ml5Jy76iXM8bOvhsYbNwQ>
    <xme:OlWMZFs8dOyjg1IoPx6J6Qt-oYubea428ARBwgrhLH-utygb556ohpxx98Lp5porq
    cJC_q5mluZjikDMmg>
X-ME-Received: <xmr:OlWMZPDM-6Bbt1Xe-7-yP386t_jslOBtM5NF6UOWJHvbTplpSMaiAgxSoaB-hm2O9GLz061E2jJz7bDZWFksIK-zybcuzaZBr1zmeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvgedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeetlhhi
    tggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenucggtffrrghtthgvrhhnpe
    efjeekhfffjeekveduieehgeejtdeghfejudekleevfeevudegffeiveejieevheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhitggvse
    hrhihhlhdrihho
X-ME-Proxy: <xmx:OlWMZFdOeRerERxTzhten-LddoRywwWDPxbcfQVfTP1ArSLfy_hgfg>
    <xmx:OlWMZGNJgOE2jGUYmJX7yjyxPZNoeJ60AZCLXFveCeZkiwySk0M-3A>
    <xmx:OlWMZHnNuEcLxjRBdu0sCVlE2-a216yl6CNC6yKPhaavHrXAWq-3oA>
    <xmx:OlWMZN0ffjJBRoZ0-QWT3ZlgrgaPcilfLV9W254OZqbcuCtNbQ314g>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jun 2023 08:27:36 -0400 (EDT)
Message-ID: <0d0eba7d-ac43-d944-d105-008978f4402e@ryhl.io>
Date:   Fri, 16 Jun 2023 14:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch,
        miguel.ojeda.sandonis@gmail.com,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
 <20230614230128.199724bd@kernel.org>
From:   Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20230614230128.199724bd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 6/15/23 08:01, Jakub Kicinski wrote:> I was hoping someone from the 
Rust side is going to review this.
> We try to review stuff within 48h at netdev, and there's no review :S

I'm from the Rust side, and I intend to review this, but I've taken this 
week off, so it wont be until next week.

> What is this supposed to be doing? Who needs to _set_ unrelated
> statistics from a function call? Yet no reviewer is complaining
> which either means I don't understand, or people aren't really 
> paying attention 🙁

It can sometimes be necessary to wrap loads or stores in function calls 
when working over the FFI boundary. However, Rust is very aggressive 
about inlining this kind of thing, so it shouldn't have any actual 
performance cost.

As for this being a single function rather than four functions, that's 
definitely a debatable decision. You would only do that if it makes 
sense to merge them together and if you would always assign all of them 
together. I don't know enough about these fields to say whether it makes 
sense here.

Alice
