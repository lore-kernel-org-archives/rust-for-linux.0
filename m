Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F0FC433FE
	for <rust-for-linux@archiver.kernel.org>; Mon, 17 Oct 2022 12:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiJQMuY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 17 Oct 2022 08:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiJQMuV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 17 Oct 2022 08:50:21 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 97DD84D824;
        Mon, 17 Oct 2022 05:50:17 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Dx_NiIT01jFRAAAA--.404S3;
        Mon, 17 Oct 2022 20:50:16 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxLeCGT01jrB0AAA--.465S3;
        Mon, 17 Oct 2022 20:50:15 +0800 (CST)
Message-ID: <47126c75-06ff-a5c9-5362-19568f7c4aaa@loongson.cn>
Date:   Mon, 17 Oct 2022 20:50:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 3/5] docs/zh_CN: Add rust/general-information Chinese
 translation
Content-Language: en-US
To:     Rui Li <me@lirui.org>, wu.xiangcheng@linux.dev
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        Miguel Ojeda <ojeda@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>, wedsonaf@gmail.com,
        Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
        rust-for-linux <rust-for-linux@vger.kernel.org>, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <2354c17a110101de2838766846a5082e6df4ff50.1665650266.git.siyanteng@loongson.cn>
 <Y0rFRgnzw5Y+oNj+@bobwxc.mipc>
 <166588979418.7.9668523827405973655.69244817@lirui.org>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <166588979418.7.9668523827405973655.69244817@lirui.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxLeCGT01jrB0AAA--.465S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ar4UJFy7Xr1DWw48ZFy7ZFb_yoW7GF43pF
        WxCayfK3W7Jw15GrWIkr1UCF12kr1rGa1fZF1UG3WxXrnayrnFqrsrtr1ru3s7Zry8Gryj
        vFs0yry7ur4YyrJanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


On 10/16/22 11:09, Rui Li wrote:
> On Sat, 15 Oct 2022 22:35:50 +0800
> "wu.xiangcheng at linux.dev" <fyqznjfscvhmhtrybuyvbyjnqkkhrser@simplelogin.co> wrote:
>
>>> Translate .../rust/general-information.rst into Chinese.
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>   .../zh_CN/rust/general-information.rst        | 75
>>> +++++++++++++++++++ .../translations/zh_CN/rust/index.rst         |
>>>   2 +- 2 files changed, 76 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> Documentation/translations/zh_CN/rust/general-information.rst
>>>
>>> diff --git
>>> a/Documentation/translations/zh_CN/rust/general-information.rst
>>> b/Documentation/translations/zh_CN/rust/general-information.rst new
>>> file mode 100644 index 000000000000..58a28eb6f01d --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
>>> @@ -0,0 +1,75 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: Documentation/rust/general-information.rst
>>> +
>>> +:翻译:
>>> +
>>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>>> +
>>> +
>>> +基本信息
>>> +========
>>> +
>>> +本文档包含了在内核中使用Rust支持时需要了解的有用信息。
>>> +
>>> +
>>> +代码文档
>>> +--------
>>> +
>>> +Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
>>> +
>>> +生成的HTML文档包括集成搜索、链接项（如类型、函数、常量）、源代码等。它们可以在以下地址阅读
>>> +（TODO：当在主线中时链接，与其他文档一起生成）：
>>> +
>>> +	http://kernel.org/
>>> +
>>> +这些文档也可以很容易地在本地生成和阅读。这相当快（与编译代码本身的顺序相同），而且不需要特
>>> +殊的工具或环境。这有一个额外的好处，那就是它们将根据所使用的特定内核配置进行定制。要生成它
>>> +们，请使用 ``rustdoc`` target，并使用编译时使用的相同调用，例如::
>> target -> 目标
>>
>>> +
>>> +	make LLVM=1 rustdoc
>>> +
>>> +要在你的网络浏览器中本地阅读该文档，请运行如::
>>> +
>>> +	xdg-open rust/doc/kernel/index.html
>>> +
>>> +要了解如何编写文档，请看coding-guidelines.rst。
>> 请看 coding-guidelines.rst 。
>>
>>> +
>>> +
>>> +额外的lints
>>> +-----------
>>> +
>> Is there any good translation for "lint" ?
>>
>>> +虽然 ``rustc``
>>> 是一个非常有用的编译器，但一些额外的lints和分析可以通过 ``clippy``
>>> +（一个Rust
>>> linter）来实现。要启用它，请将CLIPPY=1传递到用于编译的同一调用中，例如::
>>> +
>>> +	make LLVM=1 CLIPPY=1
>>> +
>>> +请注意，Clippy可能会改变代码生成，因此在构建产品内核时不应该启用它。
>>> +
>>> +抽象和绑定
>>> +----------
>>> +
>>> +抽象是Rust代码，用于包装来自C端的内核功能。
>> 抽象是用Rust代码包装来自C端的内核功能。
>>
>>> +
>>> +为了使用来自C端的函数和类型，需要创建绑定。绑定是Rust对那些来自C端的函数和类型的声明。
>>> +
>>> +例如，人们可以在Rust中写一个 ``Mutex`` 抽象，它从C端包装一个
>>> ``Mutex结构体`` ，并 +通过绑定调用其函数。
>>> +
>>> +抽象并不能用于所有的内核内部API和概念，但随着时间的推移，我们打算扩大覆盖范围。“Leaf”
>>> +模块（例如，驱动程序）不应该直接使用C语言的绑定。相反，子系统应该根据需要提供尽可能安
>>> +全的抽象。
>>> +
>>> +
>>> +有条件的编译
>>> +------------
>>> +
>>> +Rust代码可以访问基于内核配置的条件性编译:
>>> +
>>> +.. code-block:: rust
>>> +
>>> +	#[cfg(CONFIG_X)]       // Enabled               (`y` or
>>> `m`)
>>> +	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
>>> +	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
>>> +	#[cfg(not(CONFIG_X))]  // Disabled
>>> diff --git a/Documentation/translations/zh_CN/rust/index.rst
>>> b/Documentation/translations/zh_CN/rust/index.rst index
>>> fe884d1da353..c4d773a8a288 100644 ---
>>> a/Documentation/translations/zh_CN/rust/index.rst +++
>>> b/Documentation/translations/zh_CN/rust/index.rst @@ -16,10 +16,10
>>> @@ Rust :maxdepth: 1
>>>   
>>>       quick-start
>>> +    general-information
>>>   
>>>   TODOList:
>>>   
>>> -*    general-information
>>>   *    coding-guidelines
>>>   *    arch-support
>>>   
>>> -- 
>>> 2.31.1
>>>
>>>
>>>
> We could leave "lint" untranslated in my perspective. This may lead to a better understanding for readers.

I think so too.


Thanks,

Yanteng

