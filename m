Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F8CC7EE2C
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Jun 2023 13:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbjFENp1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Jun 2023 09:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjFENpZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Jun 2023 09:45:25 -0400
X-Greylist: delayed 328 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 06:45:24 PDT
Received: from a27-24.smtp-out.us-west-2.amazonses.com (a27-24.smtp-out.us-west-2.amazonses.com [54.240.27.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E790C92
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Jun 2023 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685972395;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=m9/HcxQgfPApOZssp87ZXQbU5I088+lGRhrVk7hx9f8=;
        b=EwpHww/HZB0qx4n3VXbNyEQrG69AaWrNdnhWEQMbRKjMJHJbeMHU1i7Nu7mHEwnJ
        Acc1byADcOHkL3VATGLehSxTrGaIrSijRNq3fDCMmn+uAnYls9JGZWCEQwnfqSOZCwg
        NTAm9qL0AhwUwD8kZn8HlkeSLK/BpY4FCAzpu37tsZ1R7eosMJkZQMXQUt9kOteX27H
        yQon8lESnm2aQweVe9gW1nSbNYdif2KTz8uqlitUTXkt6j7mDrPYW2gs/I+YAmJrCbQ
        kr3JkQktACNOjnNbKjMV9D6S2sW4D9LBN8NhM3FgAoY4JNrw/jX3heq1wQFSMa3WkO0
        eZa6/TeFAw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685972395;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=m9/HcxQgfPApOZssp87ZXQbU5I088+lGRhrVk7hx9f8=;
        b=JjRWiIf5oic/HSe5V4Cix+dEUbzE1O0kHljsYtD8KAR+vrEcvOCpG3HAsyapBALI
        +odSCTXcWlNv7VLu8Zg2zHv7OKBU4g4OExXZHrZxpMpy2X5e4/YdII8JEgxuGsCZOgK
        CrAMNFOdJmlVFYzrC2ItXK2LrLE+IHWB/N9ASX3Q=
Date:   Mon, 5 Jun 2023 13:39:55 +0000
Message-ID: <010101888bc925e0-e96f7ef4-ec23-4016-88bc-55d44b39adc7-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 4/5] rust: add methods for configure net_device
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230604124838.1381423-1-aliceryhl@google.com>
References: <0101018884325bd2-663fb619-646c-46f6-96d8-769e87a469cf-000000@us-west-2.amazonses.com>
        <20230604124838.1381423-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.05-54.240.27.24
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sun,  4 Jun 2023 12:48:37 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> FUJITA Tomonori writes:
>> +    /// Sets the name of a device.
>> +    pub fn set_name(&mut self, name: &'static CStr) -> Result {
>> +        // SAFETY: The safety requirement ensures that the pointer is valid.
>> +        unsafe {
>> +            if name.len() > (*self.0).name.len() {
>> +                return Err(code::EINVAL);
>> +            }
>> +            for i in 0..name.len() {
>> +                (*self.0).name[i] = name[i] as i8;
>> +            }
>> +        }
>> +        Ok(())
>> +    }
> 
> You should use `name: &CStr` here instead because you don't need the
> provided string to stay valid after the call.

Oops, it will be fixed in the next version.

Thanks a lot!


