Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC020C4332F
	for <rust-for-linux@archiver.kernel.org>; Mon, 17 Oct 2022 13:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbiJQNLE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 17 Oct 2022 09:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiJQNKr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 17 Oct 2022 09:10:47 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 435B55D0ED;
        Mon, 17 Oct 2022 06:10:15 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Bx3Ng1VE1jQBEAAA--.521S3;
        Mon, 17 Oct 2022 21:10:13 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+I0VE1j+R8AAA--.601S3;
        Mon, 17 Oct 2022 21:10:13 +0800 (CST)
Message-ID: <1f184f80-c993-898b-f503-85a52675104b@loongson.cn>
Date:   Mon, 17 Oct 2022 21:10:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 5/5] docs/zh_CN: Add rust/arch-support Chinese
 translation
Content-Language: en-US
To:     wu.xiangcheng@linux.dev
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <a7e68f6ae3642ef3fcc78fdd84702e48fffb1a7c.1665650266.git.siyanteng@loongson.cn>
 <Y0rFugAV266rVaYf@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y0rFugAV266rVaYf@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+I0VE1j+R8AAA--.601S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KFy7ZF45KryDuw15uFyDZFb_yoW5JFW8p3
        WqkFyfGa1rJryUKr4xKr1UJF47CF18Cw1UJr1xJwn5Xr4kJF1DJr4Utr98Krnrur48AFWU
        Xr409ry7Cr1UArJanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


On 10/15/22 22:37, wu.xiangcheng@linux.dev wrote:
>> Translate .../rust/arch-support.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/rust/arch-support.rst  | 23 +++++++++++++++++++
>>   .../translations/zh_CN/rust/index.rst         |  5 +---
>>   2 files changed, 24 insertions(+), 4 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst
>>
>> diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
>> new file mode 100644
>> index 000000000000..f8e3e7b8afe5
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/rust/arch-support.rst
>> @@ -0,0 +1,23 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/rust/arch-support.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +架构支持
>> +========
>> +
>> +目前，Rust编译器（``rustc``）使用LLVM进行代码生成，这限制了可以支持的目标架构。此外，对
>> +使用LLVM/Clang构建内核的支持也有所不同（请参见使用Clang/LLVM构建Linux）。这种支持对于
> reference?
Oops! yes, it is.
>
>> +使用 ``libclang`` 的bindgen来说是必需的。
> ``bindgen``

ok!


Thanks,

Yanteng

>
>> +
>> +下面是目前可以工作的架构的一般总结。支持程度与 ``MAINTAINERS`` 文件中的``S`` 值相对应:
>> +
>> +============  ================  ==============================================
>> +架构          支持水平          限制因素
>> +============  ================  ==============================================
>> +``x86``       Maintained        只有 ``x86_64``
>> +============  ================  ==============================================
>> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
>> index c5507ad488a1..b01f887e7167 100644
>> --- a/Documentation/translations/zh_CN/rust/index.rst
>> +++ b/Documentation/translations/zh_CN/rust/index.rst
>> @@ -18,10 +18,7 @@ Rust
>>       quick-start
>>       general-information
>>       coding-guidelines
>> -
>> -TODOList:
>> -
>> -*    arch-support
>> +    arch-support
>>   
>>   .. only::  subproject and html
>>   
>> -- 
>> 2.31.1
>>
> Thanks,
> 	Wu

