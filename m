Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96406C43217
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Oct 2022 11:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiJRL4h (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Oct 2022 07:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiJRL4g (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Oct 2022 07:56:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0B0EABCBA6;
        Tue, 18 Oct 2022 04:56:32 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8BxHdlulE5jy2cAAA--.2379S3;
        Tue, 18 Oct 2022 19:56:30 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxr+BslE5jyqoAAA--.2757S3;
        Tue, 18 Oct 2022 19:56:29 +0800 (CST)
Message-ID: <33b4faa4-e32f-d8a2-407f-e0884518f921@loongson.cn>
Date:   Tue, 18 Oct 2022 19:56:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 2/5] docs/zh_CN: Add rust/quick-start Chinese
 translation
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <58d7a63610d6eb19eed8f809d2eee46807464749.1665650266.git.siyanteng@loongson.cn>
 <Y0py30rOBh5glrpz@bobwxc.mipc>
 <1661dc82-10bc-e53e-864c-0825d6184ece@loongson.cn>
 <Y01oOyQ+Yu1rspHn@bobwxc.mipc>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y01oOyQ+Yu1rspHn@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxr+BslE5jyqoAAA--.2757S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tw47Ar43tr13JFW8AFWUJwb_yoW8Ar4xpF
        WxWFy3Kw4Uuryjyr90kay0vF4akr48A3yYqF9rJw1ktF4vgr9rGrWIqr17Wwn7Xry8Zryq
        va1UuFykAr1FyFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUUU==
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


On 10/17/22 22:35, Wu XiangCheng wrote:
> 2022-10-17 (一) 20:29:00 +0800 Yanteng Si 曰：
>>>> +为了方便检查是否满足要求，可以使用以下指标::
>>> 指标 -> 目标 ？
>> I was struggling to translate this word, I probably knew what it referred
>> to,
>>
>> but I couldn't think of a proper Chinese word. "目标" doesn't seem very
>> appropriate either.
> Many Chinese information of make use 目标
> $ make --help
> 用法：make [选项] [目标] ...
ok
>
>>>> +内核的C端绑定是在构建时使用 ``bindgen`` 工具生成的。一个特定的版本是必需的。
>>> 需要特定版本。
>> how about 这需要特定的版本？
> good
>
>>>> +``rustdoc`` 也被用来测试文档化的Rust代码中提供的例子（称为doctests或文档测试）。
>>>> +``rusttest`` Make target使用这个功能。
>>> 本功能的Make目标是 ``rusttest`` 。
>> Let's think about alignment?
>>
>> ``rusttest`` 是本功能的Make目标。
> good
>
>>>> +``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
>>>> +
>>>> +如果使用的是GDB/Binutils，而Rust符号没有被拆分，原因是工具链还不支持Rust的新v0拆分方案。
>>>> +有几个办法可以解决：
>>>> +
>>>> +  - 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
>>>> +
>>>> +  - 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
>>>> +    中的预先纠错的名字。
>>> 预先纠错 pre-demangled?
>> How about 预先还原函数 ?
> Better than former one.

Thanks review!


Thanks,

Yanteng

>
> Thanks,
>

