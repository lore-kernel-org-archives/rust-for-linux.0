Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C104CECDFA1
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 Oct 2022 01:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiJZB7l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 25 Oct 2022 21:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbiJZB7k (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 25 Oct 2022 21:59:40 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C4C86301;
        Tue, 25 Oct 2022 18:59:28 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Dx_7eAlFhj0oECAA--.7953S3;
        Wed, 26 Oct 2022 09:59:28 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxmFd+lFhjJxYFAA--.983S3;
        Wed, 26 Oct 2022 09:59:27 +0800 (CST)
Message-ID: <1b54f1a2-23f8-7446-d46f-ac1a8e37ec96@loongson.cn>
Date:   Wed, 26 Oct 2022 09:58:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/5] docs/zh_CN: Add rust/quick-start Chinese
 translation
To:     Gary Guo <gary@garyguo.net>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
References: <cover.1666097959.git.siyanteng@loongson.cn>
 <82a36881a46eb8afcc754f81f196982ac3f6c735.1666097959.git.siyanteng@loongson.cn>
 <20221025002513.49f1eb2d@GaryWorkstation>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <20221025002513.49f1eb2d@GaryWorkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxmFd+lFhjJxYFAA--.983S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uF43Gry7Kr48Zw47tF4DXFb_yoW8Gr4kpr
        WkWF9xJFW8Z3WFgrnrt3ykJr1Fkw1rZryrCFZxWas5JrWv9rZ5Kr1jqay7GwsFgr129ayD
        ta1kuws09a4kAFDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jwhLnUUUUU=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


在 2022/10/25 7:25, Gary Guo 写道:
> On Tue, 18 Oct 2022 21:04:22 +0800
> Yanteng Si <siyanteng@loongson.cn> wrote:
>
>> +这会触发与Kconfig用来确定是否应该启用 ``RUST_IS_AVAILABLE`` 相同的逻辑；不过它也
>> +会列出未满足的条件。
> Would "不过，如果Kconfig认为不该启用，它会列出未满足的条件。" be better?
Great!
>
>> +折腾
>> +----
>> +
>> +要想深入了解，请看 ``samples/rust/`` 下的样例源代码、 ``rust/`` 下的Rust支持代码和
>> +``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
>> +
>> +如果使用的是GDB/Binutils，而Rust符号没有被拆分，原因是工具链还不支持Rust的新v0拆分方案。
>> +有几个办法可以解决：
> I am not sure how to translate mangle/demangling in Chinese, but "拆分"
> definitely sounds awkward.

Hmmm. let's use mangle/demangle?

>> +
>> +  - 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
>> +
>> +  - 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
>> +    中的预先还原函数的名字。
> Demangle has been translated to "还原" here while it's "拆分" above,
> which is inconsistent.

ditto.


Thanks,

Yanteng

> Best,
> Gary

