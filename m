Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153A04317D;
	Mon, 13 Jul 2026 02:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783910243; cv=none; b=WwdNGwnSQsrNRaIO80cIdNH2H9iyOCqQZxWI401dxA8HoXEmLK0DqJJD3wd7waMhRBJ+QiBPL/oiJRuOyPcor5S1FSiQhEKfKHjlr6Kch6xrYmWBU20A18h6PNsdXGlF9IMU5Sq4iStC9tWh6hvqOQSRHb7jSSkMKs5RqS6GWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783910243; c=relaxed/simple;
	bh=SVPFdzcOG7sfebkWaR6kZeeV3VkOzzPikv4mmxeo04Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJWduyBN80OPV1YUeEc5d7c9X2LGIqjVk2zEC+hDimJVX5bqJ3w/61D1J5Mq2gsUiCYKNo+H4zpQaxoOLsDcBlBoLmQSQWfnWqg7X53Zatetf+2itsbldEub7BCKMvDfrP9dT7Az7oV1WYy97VR/s9fnqFmjBsAz5xYtcpdpzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAn_jROT1Rq18JmAA--.5124S2;
	Mon, 13 Jul 2026 10:37:02 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnEBJMT1Rqjs3CAA--.62867S2;
	Mon, 13 Jul 2026 10:37:00 +0800 (CST)
Message-ID: <17094968-1385-4dba-aae8-5d93a2aaf59e@hust.edu.cn>
Date: Mon, 13 Jul 2026 10:37:00 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs/zh_CN: Update rust/general-information.rst
 translation
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Gary Guo <gary@garyguo.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <cover.1783905132.git.ben.guo@openatom.club>
 <f7c671881801e1b24fa2965b2e730d0fb0931e32.1783905132.git.ben.guo@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <f7c671881801e1b24fa2965b2e730d0fb0931e32.1783905132.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAn_jROT1Rq18JmAA--.5124S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3GFykGFW3AF43Wryxur1Dtrb_yoW7urWfpF
	1SkFsxtF17JF15XFWxGr4UA3W8GF4rG3WUGFy5Ga4IgrsYyFW5Kwsrtr4fJ39rAry8uFWD
	ZF9Y9FWjkry7A37anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/13/26 9:46 AM, Ben Guo wrote:
> Update Documentation/rust/general-information.rst translation.
>
> Update the translation through commit 86c5d1c6740c
> ("docs: rust: general-information: use real example")
>
> Reviewed-by: Gary Guo <gary@garyguo.net>


Revise the small issue below.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>


> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
>   .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
>   1 file changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
> index 9b5e37e13f3..ff9355cb8c8 100644
> --- a/Documentation/translations/zh_CN/rust/general-information.rst
> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> @@ -13,6 +13,14 @@
>   
>   本文档包含了在内核中使用Rust支持时需要了解的有用信息。
>   
> +``no_std``
> +----------
> +
> +内核中的 Rust 支持只能链接 `core <https://doc.rust-lang.org/core/>`_，
> +而不能链接 `std <https://doc.rust-lang.org/std/>`_。供内核使用的 crate
> +必须使用 ``#![no_std]`` 属性选择这种行为。
> +
> +
>   .. _rust_code_documentation_zh_cn:
>   
>   代码文档
> @@ -20,10 +28,18 @@
>   
>   Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
>   
> -生成的HTML文档包括集成搜索、链接项（如类型、函数、常量）、源代码等。它们可以在以下地址阅读
> -（TODO：当在主线中时链接，与其他文档一起生成）：
> +生成的HTML文档包括集成搜索、链接项（如类型、函数、常量）、源代码等。
Add spaces before and after HTML
> +它们可以在以下地址阅读：
> +
> +		https://rust.docs.kernel.org
> +
> +对于 linux-next，请参阅：
>   
> -	http://kernel.org/
> +		https://rust.docs.kernel.org/next/
> +
> +每个主要版本也有对应的标签，例如：
> +
> +		https://rust.docs.kernel.org/6.10/
>   
>   这些文档也可以很容易地在本地生成和阅读。这相当快（与编译代码本身的顺序相同），而且不需要特
>   殊的工具或环境。这有一个额外的好处，那就是它们将根据所使用的特定内核配置进行定制。要生成它
> @@ -62,6 +78,58 @@ Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
>   模块（例如，驱动程序）不应该直接使用C语言的绑定。相反，子系统应该根据需要提供尽可能安
>   全的抽象。
>   
> +.. code-block::
> +
> +	                                                rust/bindings/
> +	                                               (rust/helpers/)
> +
> +	                                                   include/ -----+ <-+
> +	                                                                 |   |
> +	  drivers/              rust/kernel/              +----------+ <-+   |
> +	    fs/                                           | bindgen  |       |
> +	   .../            +-------------------+          +----------+ --+   |
> +	                   |    Abstractions   |                         |   |
> +	+---------+        | +------+ +------+ |          +----------+   |   |
> +	| my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-+   |
> +	| driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |       |
> +	+---------+        | |system| |system| |          | bindings | <-----+
> +	     |             | +------+ +------+ |          |  crate   |       |
> +	     |             |   kernel crate    |          +----------+       |
> +	     |             +-------------------+                             |
> +	     |                                                               |
> +	     +------------------# FORBIDDEN #--------------------------------+
> +
> +主要思想是将所有与内核 C API 的直接交互封装到经过仔细审查和文档化的抽象
> +中。这样，只要满足以下条件，这些抽象的用户就不能引入未定义行为
> +（undefined behavior，UB）：
> +
> +#. 抽象是正确的（"可靠"）。
> +#. 任何 ``unsafe`` 块都遵守调用块内操作所需的安全契约。类似地，任何
> +   ``unsafe impl`` 都遵守实现该特性所需的安全契约。
> +
> +绑定
> +~~~~
> +
> +通过从 ``include/`` 中将 C 头文件包含到
> +``rust/bindings/bindings_helper.h``， ``bindgen`` 工具将为所包含的子系统
> +自动生成绑定。构建后，请查看 ``rust/bindings/`` 目录中的
> +``*_generated.rs`` 输出文件。
> +
> +对于 ``bindgen`` 不会自动生成的 C 头文件部分，例如 C ``inline`` 函数或
> +非平凡宏，可以在 ``rust/helpers/`` 中添加一个小型包装函数，使其也可供
> +Rust 端使用。
> +
> +抽象
> +~~~~
> +
> +抽象是绑定和内核内用户之间的层。它们位于 ``rust/kernel/`` 中，其作用是
> +将对绑定的不安全访问封装到尽可能安全并暴露给用户的 API 中。抽象的用户
> +包括用 Rust 编写的驱动程序或文件系统等。
> +
> +除了安全方面，这些抽象还应该易于使用，也就是说，把 C 接口转换为符合
> +Rust 惯例的代码。基本示例包括将 C 的资源获取和释放转换为 Rust 的初始化
> +和清理模式，或者将 C 整数错误码转换为 Rust 的 ``Result``。
> +
>   
>   有条件的编译
>   ------------
> @@ -74,3 +142,11 @@ Rust代码可以访问基于内核配置的条件性编译:
>   	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
>   	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
>   	#[cfg(not(CONFIG_X))]  // Disabled
> +
> +对于 Rust 的 ``cfg`` 不支持的其他条件，例如带有数值比较的表达式，可以
> +定义一个新的 Kconfig 符号：
> +
> +.. code-block:: kconfig
> +
> +	config RUSTC_HAS_SPAN_FILE
> +		def_bool RUSTC_VERSION >= 108800

