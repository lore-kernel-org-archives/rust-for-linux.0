Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C56BC433EF
	for <rust-for-linux@archiver.kernel.org>; Tue, 17 May 2022 10:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235885AbiEQKj1 convert rfc822-to-8bit (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 17 May 2022 06:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbiEQKj0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 17 May 2022 06:39:26 -0400
Received: from mailext.lri.fr (mailext.lri.fr [129.175.15.10])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B30962AC73
        for <rust-for-linux@vger.kernel.org>; Tue, 17 May 2022 03:39:24 -0700 (PDT)
Received: from [129.175.15.10] (mailext.lri.fr [129.175.15.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailext.lri.fr (Postfix) with ESMTPSA id 36888C08E5;
        Tue, 17 May 2022 12:39:23 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
From:   Xavier Denis <xldenis@lri.fr>
Mime-Version: 1.0 (1.0)
Subject: Re: Taint Analysis for Kernel Rust
Date:   Tue, 17 May 2022 12:39:22 +0200
Message-Id: <DA4D23F2-412B-4669-A079-A654735CE9B4@lri.fr>
References: <CANiq72=P76KwNBOnZ+h8kAWrfMCsvMJt4we69atDeW1ugY7_jg@mail.gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
In-Reply-To: <CANiq72=P76KwNBOnZ+h8kAWrfMCsvMJt4we69atDeW1ugY7_jg@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (19E258)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org



> Le 16 mai 2022 à 23:17, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> a écrit :
> 
> ﻿Hi Xavier,
> 
>> On Mon, May 16, 2022 at 9:39 PM Xavier Denis <xldenis@lri.fr> wrote:
>> 
>> I saw a tweet (https://twitter.com/marcan42/status/1526107814477074432) from Marcan about the need for some sort of taint / capability analysis in Rust4Linux, and was offering my services.
>> 
>> If someone knows what kinds of analysis are needed and could let me know that would be great: is this intra-procedural? Inter-procedural? Are we dealing with simple binary taints? Or do we need arbitrary partial orders? How complete/precise do we need the procedure to be?
> 
> There have been discussions in the past about annotating functions in
> similar ways ("function context restrictions", "colored unsafe",
> etc.), and we recently brought it up in November's Rust CTCFT too.
> However, how the feature could work is to be discussed and nobody has
> yet put time on it (as far as I am aware).
Is there any interest in a prototype? Doesn’t the kernel already use a similar system for C?
> 
>> Given an answer to these questions I think I can whip up a `cargo taint` command rather quickly, so let me know if this is useful or desired.
> 
> Note that the kernel does not use Cargo at the moment.

Right, I forgot about that, but if anything it slightly simplifies the work.
> 
>> PS: I gleaned from other threads that there’s a Zulip as well, would it be possible to get an invite?
> 
> Of course, invitation sent -- welcome!
> 
> Cheers,
> Miguel

