Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD98EC433FE
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Oct 2022 04:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiJREjd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Oct 2022 00:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiJREjK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Oct 2022 00:39:10 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B84DA221A;
        Mon, 17 Oct 2022 21:39:05 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8CxLdmSSk1jEQ8AAA--.421S3;
        Mon, 17 Oct 2022 20:29:06 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxPuCMSk1jixsAAA--.429S3;
        Mon, 17 Oct 2022 20:29:01 +0800 (CST)
Message-ID: <1661dc82-10bc-e53e-864c-0825d6184ece@loongson.cn>
Date:   Mon, 17 Oct 2022 20:29:00 +0800
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
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y0py30rOBh5glrpz@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxPuCMSk1jixsAAA--.429S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3tw45Jw43KrWxZryxuF43GFg_yoWkXF45pF
        4vgFs3GF47GFyUCry2kF1UuFnakrWrGa1Utwnrta48trsYyF9xGw4Utry3Wws7Z348ArW5
        AF1UJFy7Zr1jyFDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==
X-Gw-Check: afb512509c46355c
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


On 10/15/22 16:45, Wu XiangCheng wrote:
>> Translate .../rust/quick-start.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/rust/index.rst         |   2 +-
>>   .../translations/zh_CN/rust/quick-start.rst   | 211 ++++++++++++++++++
>>   2 files changed, 212 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/rust/quick-start.rst
>>
>> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
>> index fc6a074841bc..fe884d1da353 100644
>> --- a/Documentation/translations/zh_CN/rust/index.rst
>> +++ b/Documentation/translations/zh_CN/rust/index.rst
>> @@ -15,10 +15,10 @@ Rust
>>   .. toctree::
>>       :maxdepth: 1
>>   
>> +    quick-start
>>   
>>   TODOList:
>>   
>> -*    quick-start
>>   *    general-information
>>   *    coding-guidelines
>>   *    arch-support
>> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
>> new file mode 100644
>> index 000000000000..21ebc25b0d01
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
>> @@ -0,0 +1,211 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/rust/quick-start.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +
>> +快速入门
>> +========
>> +
>> +本文介绍了如何开始使用Rust进行内核开发。
>> +
>> +
>> +构建程序的必要条件
>> +------------------
> 构建依赖
ok
>
>> +
>> +本节描述了如何获取构建所需的工具。
>> +
>> +其中一些必要的软件包可能会从Linux发行版中获得，名称是 ``rustc`` , ``rust-src`` ,
> 其中一些依赖也许可以从Linux发行版中获得，包名可能是 ``rustc`` , ``rust-src`` ,
great!
>
>> +``rust-bindgen`` 等。然而，在写这篇文章的时候，它们很可能还不够新，除非发行版跟踪最
>> +新的版本。
>> +
>> +为了方便检查是否满足要求，可以使用以下指标::
> 指标 -> 目标 ？

I was struggling to translate this word, I probably knew what it 
referred to,

but I couldn't think of a proper Chinese word. "目标" doesn't seem very 
appropriate either.

>
>> +
>> +	make LLVM=1 rustavailable
>> +
>> +这触发了与Kconfig用来确定是否应该启用 ``RUST_IS_AVAILABLE`` 相同的逻辑；但它也解
> 这会触发
ok
>
>> +释了如果是这样的话为什么不启用。
> 不过它也会列出未满足的条件。
ok
>
>> +
>> +
>> +rustc
>> +*****
>> +
>> +需要一个特定版本的Rust编译器。较新的版本可能会也可能不会工作，因为就目前而言，内核依赖
>> +于一些不稳定的Rust特性。
>> +
>> +如果使用的是 ``rustup`` ，请进入检查出来的源代码目录并运行::
> 检查出来的 -> 检出的
ok
>
>> +
>> +	rustup override set $(scripts/min-tool-version.sh rustc)
>> +
>> +否则，获取一个独立的安装程序或从 ``rustup`` 安装:
> 或者从以下网址获取一个独立的安装程序或安装 ``rustup`` ：
ok
>
>> +
>> +	https://www.rust-lang.org
>> +
>> +
>> +Rust标准库源代码
>> +****************
>> +
>> +Rust标准库的源代码是必需的，因为构建系统会交叉编译 ``core`` 和 ``alloc`` 。
>> +
>> +如果正在使用 ``rustup`` ，请运行::
>> +
>> +	rustup component add rust-src
>> +
>> +这些组件是按工具链安装的，因此以后升级Rust编译器版本需要重新添加组件。
>> +
>> +否则，如果使用独立的安装程序，可以将Rust仓库克隆到工具链的安装文件夹中::
>> +
>> +	git clone --recurse-submodules \
>> +		--branch $(scripts/min-tool-version.sh rustc) \
>> +		https://github.com/rust-lang/rust \
>> +		$(rustc --print sysroot)/lib/rustlib/src/rust
>> +
>> +在这种情况下，以后升级Rust编译器版本需要手动更新这个克隆的仓库。
>> +
>> +
>> +libclang
>> +********
>> +
>> +``libclang`` （LLVM的一部分）被 ``bindgen`` 用来理解内核中的C代码，这意味着需要安
> 换成主动句可能稍微好一点，看你意思
> ``bindgen`` 使用 ``libclang`` （LLVM的一部分）来理解内核中的C代码
great!
>
>> +装LLVM；比如当内核被编译为 ``CC=clang`` 或 ``LLVM=1`` 时。
> 同在开启 ``CC=clang`` 或 ``LLVM=1`` 时编译内核一样。
ok
>
>> +
>> +Linux发行版可能会有一个合适的，所以最好先检查一下。
> Linux发行版中可能会有合适的包
ok
>
>> +
>> +也有一些适用于一些系统和架构的二进制文件上载于：
> 适用于部分系统和架构的二进制文件也可到以下网址下载：
ok
>
>> +
>> +	https://releases.llvm.org/download.html
>> +
>> +否则，构建LLVM需要相当长的时间，但这并不是一个复杂的过程：
> 或者自行构建LLVM，这需要相当长的时间，但并不是一个复杂的过程：
ok
>
>> +
>> +	https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
>> +
>> +请参阅使用Documentation/kbuild/llvm.rst，以了解更多信息以及获取预构建版本和发行包
>> +的进一步方法。
>
> 请参阅 Documentation/kbuild/llvm.rst 了解更多信息，以及获取预构建版本和发行包
>
> Please check all inline rst file names, must surrounding with prefix and suffix
> spaces.
ok
>
>> +
>> +
>> +bindgen
>> +*******
>> +
>> +内核的C端绑定是在构建时使用 ``bindgen`` 工具生成的。一个特定的版本是必需的。
> 需要特定版本。
how about 这需要特定的版本？
>
>> +
>> +通过以下方式安装它（注意，这将从源码下载并构建该工具）::
>> +
>> +	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
>> +
>> +
>> +开发的必要条件
> 开发依赖
ok
>
>> +--------------
>> +
>> +本节解释了如何获取开发所需的工具。也就是说，在构建内核时不需要这些工具。
>> +
>> +
>> +rustfmt
>> +*******
>> +
>> +``rustfmt`` 工具被用来自动格式化所有的Rust内核代码，包括生成的C绑定（详情请见
>> +coding-guidelines.rst）。
>> +
>> +如果使用的是 ``rustup`` ，它的 ``默认`` 配置文件已经安装了这个工具，因此不需要做什么。
>> +如果使用的是其他配置文件，可以手动安装该组件::
>> +
>> +	rustup component add rustfmt
>> +
>> +独立的安装程序也带有 ``rustfmt`` 。
>> +
>> +
>> +clippy
>> +******
>> +
>> +``clippy`` 是一个Rust linter。运行它可以为Rust代码提供额外的警告。它可以通过向 ``make``
>> +传递 ``CLIPPY=1`` 来运行（关于细节，请看general-information.rst）。
> 关于细节，请看 -> 详见
ok
>
>> +
>> +如果正在使用 ``rustup`` ，它的 ``默认`` 配置文件已经安装了这个工具，因此不需要做什么。
>> +如果使用的是另一个配置文件，该组件可以被手动安装::
>> +
>> +	rustup component add clippy
>> +
>> +独立的安装程序也带有 ``clippy`` 。
>> +
>> +
>> +cargo
>> +*****
>> +
>> +``cargo`` 是Rust的本地构建系统。目前需要它来运行测试，因为它被用来构建一个自定义的标准
>> +库，其中包含了内核中自定义 ``alloc`` 所提供的设施。测试可以使用 ``rusttest`` Make target
> target -> 目标
ditto
>
>> +来运行。
>> +
>> +如果使用的是 ``rustup`` ，所有的配置文件都已经安装了该工具，因此不需要再做什么。
>> +
>> +独立的安装程序也带有 ``cargo`` 。
>> +
>> +
>> +rustdoc
>> +*******
>> +
>> +``rustdoc`` 是Rust的文档工具。它为Rust代码生成漂亮的HTML文档（详情请见general-information.rst）。
>> +
>> +``rustdoc`` 也被用来测试文档化的Rust代码中提供的例子（称为doctests或文档测试）。
>> +``rusttest`` Make target使用这个功能。
> 本功能的Make目标是 ``rusttest`` 。

Let's think about alignment?

``rusttest`` 是本功能的Make目标。

>
>> +
>> +如果使用的是 ``rustup`` ，所有的配置文件都已经安装了这个工具，因此不需要做什么。
>> +
>> +独立的安装程序也带有 ``rustdoc`` 。
>> +
>> +
>> +rust-analyzer
>> +*************
>> +
>> +`rust-analyzer <https://rust-analyzer.github.io/>`_ 语言服务器可以和许多编辑器
>> +一起使用，以实现语法高亮、补全、转到定义和其他功能。
>> +
>> +``rust-analyzer`` 需要一个配置文件， ``rust-project.json``, 它可以由 ``rust-analyzer``
>> +Make target生成。
> target -> 目标
>
>> +
>> +
>> +配置
>> +----
>> +
>> +Rust支持（CONFIG_RUST）需要在 ``General setup`` 菜单中启用。在其他要求得到满足的情
> ``CONFIG_RUST``
>
>> +况下，该选项只有在找到合适的Rust工具链时才会显示（见上文）。反而言之，这将使依赖Rust的其
> 反而言之 -> 相应的
ok
>
>> +他选项可见。
>> +
>> +之后，进入::
>> +
>> +	Kernel hacking
>> +	    -> Sample kernel code
>> +	        -> Rust samples
>> +
>> +并启用一些内置或可加载的样本模块。
> 样本 -> 样例
ok
>
>> +
>> +
>> +构建
>> +----
>> +
>> +用完整的LLVM工具链构建内核是目前支持的最佳设置。这就是::
> 这就是 -> 即
ok
>
>> +
>> +	make LLVM=1
>> +
>> +对于不支持完整LLVM工具链的架构，使用::
>> +
>> +	make CC=clang
>> +
>> +使用GCC对某些配置也是可行的，但目前它是非常试验性的。
>> +
>> +
>> +折腾
>> +----
>> +
>> +要想深入了解，请看 ``samples/rust/`` 下的样本源代码、 ``rust/`` 下的Rust支持代码和
> 样本 -> 样例
ok
>
>> +``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
>> +
>> +如果使用的是GDB/Binutils，而Rust符号没有被拆分，原因是工具链还不支持Rust的新v0拆分方案。
>> +有几个办法可以解决：
>> +
>> +  - 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
>> +
>> +  - 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
>> +    中的预先纠错的名字。
> 预先纠错 pre-demangled?

How about 预先还原函数 ?


Thanks review!


Thanks,

Yanteng


>
>> -- 
>> 2.31.1
>>
> Thanks,
>          Wu

