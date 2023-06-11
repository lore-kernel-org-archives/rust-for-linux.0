Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D944C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sun, 11 Jun 2023 08:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjFKIDI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 11 Jun 2023 04:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFKIDH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 11 Jun 2023 04:03:07 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300A92D5F
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jun 2023 01:03:06 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 66B1F3200302;
        Sun, 11 Jun 2023 04:03:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 11 Jun 2023 04:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1686470583; x=1686556983; bh=Re21MPZlaxRmewM4fsP7rw6LEsvmFmXAL/6
        /96PHol4=; b=nMFEz53XFjkMjd41rkgvqBpbkZel5bImoZYBcFrfn0zpMicowFg
        wrQTIwK88+2vUCiCMoABthJj8ppWF3VR+y33mMi0ccdyjbCGHK4t2C5O2ILFXV+8
        frJPxptEIFwS6TWU6xy1+MwbzFdab8WzoqCCQzBrJj1Aj77/Hxxr9HZCs8Tk4Di5
        i/xTZTf1NBHyryUvEEwt7pZf5Jog5Msaz4r6UHa6Emo4DMRkxQejGy5n8A9lZHkA
        /7yY0Yo1+EYl7XdOAZgW/n6KAJek55w++n92dhrx+GUEVw2dPal+BAn8u7bMpXyq
        /Kj4FJPYQ/GidbhTyrLK2uv0nzQFhnamK/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1686470583; x=1686556983; bh=Re21MPZlaxRmewM4fsP7rw6LEsvmFmXAL/6
        /96PHol4=; b=s5RqZcvRiYj4E/mzV6H2/KBgC9zSjy98lyQ12FwRLMz7oS9vsHf
        icAFo5FKSPb1Ft+QLsg/tfElRnpYC+NosLj7OxMn2LE7zRMUNLEeo2E3S8OkKhQt
        l0INDxF/R7MGhXI9czg9xm9Rhm+fzgO15sZIu+FTwg0K3juqsXHsmWlSZIPb5Rao
        HT+vrmutIqCHxwBH8acBtxs+KdkCRZ2L2I3WgOvV1vvfVbDUs8i5fTtywe4M1QXp
        J7VCgdkWPXerlaW4rBWWbeA4lOUP8Yph+/P8PJlBPszR0pPGKXK22K9cXFm/C5x9
        UmKOMbBEw7dv3oRj+sHo1OaDZtTgBkIMxqw==
X-ME-Sender: <xms:tn-FZJZwWHwXLwCDctncLyS0K8pUhbHib3PUe2u9GtEsBH_DEaaMIw>
    <xme:tn-FZAbQDI1GV-Z1LMLK0MDUr0G0T3NQ3KICjyOBjBGie0NWn7eGpWxIod5VJFnBc
    wto6Tu_Rw8WBIOaDA>
X-ME-Received: <xmr:tn-FZL9OQoJHcMZsJaru6SY1QJTIRxPjsuFi7FKV2nld2edvhICnBzBsyV_7jKKA9x3KTf2lnUCQq8Bytcq5Ecd94l2uW7WkopJqQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduuddguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomheptehl
    ihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnh
    epheduuddvteekvdektdduledugfffhfdugeejgeeuvdevtdetveejheehiefffeegnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvg
    esrhihhhhlrdhioh
X-ME-Proxy: <xmx:tn-FZHqN8of0zrovvVJyjL3lq4OKc-Zvlzis7ZGnCLKrfS0SOCjSag>
    <xmx:tn-FZEqdHUJbHKn2jW2MaG5y3j2wJw3q26I4wYgmxYsaaKd6QZeP-w>
    <xmx:tn-FZNQQC2-31PcObKB47JwKqpjZkcdqKC_cEnCGRU3PVNi4p3ecOw>
    <xmx:t3-FZPU8LTApTdTE3cMsaTbRtKg7RgUZmjzjvkFmKc7lakd_UaqMQA>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jun 2023 04:03:01 -0400 (EDT)
Message-ID: <964b5c9f-6eab-d7ff-1ce6-dc11f15898d4@ryhl.io>
Date:   Sun, 11 Jun 2023 10:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>, FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
References: <20230610071848.3722492-1-tomo@exabit.dev>
 <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
 <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
From:   Alice Ryhl <alice@ryhl.io>
In-Reply-To: <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 6/10/23 16:11, Andrew Lunn wrote:
>> diff --git a/rust/helpers.c b/rust/helpers.c
>> index 81e80261d597..a91d2a99035b 100644
>> --- a/rust/helpers.c
>> +++ b/rust/helpers.c
>> @@ -23,10 +23,26 @@
>>   #include <linux/err.h>
>>   #include <linux/refcount.h>
>>   #include <linux/mutex.h>
>> +#include <linux/netdevice.h>
>> +#include <linux/skbuff.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/sched/signal.h>
>>   #include <linux/wait.h>
>>   
>> +#ifdef CONFIG_NET
>> +void *rust_helper_netdev_priv(const struct net_device *dev)
>> +{
>> +	return netdev_priv(dev);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_netdev_priv);
>> +
>> +void rust_helper_skb_tx_timestamp(struct sk_buff *skb)
>> +{
>> +	skb_tx_timestamp(skb);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_skb_tx_timestamp);
> 
> This question is probably due to me not knowing about rust. Why have
> these helpers? They don't appear to don't do anything.

It's because we can't call inline C functions directly, so we need a 
non-inline version of it. (Similarly for #defines.)

Alice
