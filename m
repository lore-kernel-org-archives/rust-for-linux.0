Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF748C77B73
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Jun 2023 14:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbjFEOH3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbjFEOHK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Jun 2023 10:07:10 -0400
X-Greylist: delayed 299 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 07:06:59 PDT
Received: from a27-22.smtp-out.us-west-2.amazonses.com (a27-22.smtp-out.us-west-2.amazonses.com [54.240.27.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C752311B
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Jun 2023 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685973720;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=FZAACs+RtTkYI67VClkHy8eZ6wVITrgALQI08UdXZCU=;
        b=H3F1Y58bOnL5P84cdKnQsslkebMWzHq9SW6+odwDSnSdFJ3T71BAhXJZnKfVDJ67
        jBZOo8izlnk3G9zMhMK83Q92gza3R0rzU4mAqjiqmp77sHEU8NouQZsHFnJa7XRkFgN
        dx31YwUkvCChA3BhxfMemsmoLnDwZWOso732rK7Y7qMCeAY1odolh6c64/S6rKvetgA
        LqbGRJFnK06HfUGffyfOs/7pnzdhcE5i69SGwAYcU9gNJpCKpvqZbuThPmaZ0oSYkzP
        SdN5vn5E2QhMwlsZ1qQ501bulTF80csmP1uDzPCX8wmuKJLBz49xx9wqfAYDWfu1FDB
        7rrR7i15Yw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685973720;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=FZAACs+RtTkYI67VClkHy8eZ6wVITrgALQI08UdXZCU=;
        b=BhE23LcGhL41/hC9bbImf7llmiIxpYMj+hNgjzzjXzBtqaux8sccXtUryw5yWtDm
        s39Eu830rYEQHexRYI7GqP/71SD5WeMPNlUM9LsOIyA+R4ZnPT9Hk87jd5JLi8QE70Z
        5ftkpxreV+AMNoImQlx95et6RaBWw6vIRVBi9QnY=
Date:   Mon, 5 Jun 2023 14:02:00 +0000
Message-ID: <010101888bdd5c71-e67bfad1-163a-4168-a614-7ab40144ba3e-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 2/5] rust: add support for ethernet operations
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230604124821.1380522-1-aliceryhl@google.com>
References: <0101018884325a5f-da4bd02e-aab8-40f5-8812-3fce5cff34ae-000000@us-west-2.amazonses.com>
        <20230604124821.1380522-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.05-54.240.27.22
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sun,  4 Jun 2023 12:48:21 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> FUJITA Tomonori writes:
>> +    /// Sets `ethtool_ops` of `net_device`.
>> +    pub fn set_ether_operations<U>(&mut self, adapter: EtherOperationsAdapter<U, D>) -> Result
>> +    where
>> +        U: EtherOperations<D>,
>> +    {
>> +        if self.is_registered {
>> +            Err(code::EINVAL)
>> +        } else {
>> +            adapter.set_ether_ops(&mut self.dev);
>> +            Ok(())
>> +        }
>> +    }
> 
> The `EtherOperationsAdapter` struct seems unnecessary here. How about
> using this signature instead?
> 
> pub fn set_ether_operations<U: EtherOperations<D>>(&mut self) -> Result
> 
> Or even
> 
> pub fn set_ether_operations(&mut self) -> Result
> where
>     D: EtherOperations

How can I get *const bindings::ethtool_ops with the above approach?
