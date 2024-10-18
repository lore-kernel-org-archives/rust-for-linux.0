Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F518BBAE
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Oct 2024 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235665; cv=none; b=Kvqg512ZTAFh9DY7FtVpWaATp8u0Fy/XEgNCSELXSR+56DnY92bdYMr5nCi+pXUByaK7NGRg/mHHscLpO9VYHHQ27BhI5/6ZOfskZTJu2yIYt7L21OtVyRliGRlpjQ4ih3Fn03DCnSjnZpwxUO3K89K04mUJcLMzLbOHXkKmXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235665; c=relaxed/simple;
	bh=CNDZidYDQjQO/KxpEE38RWnBxpwCgdTHV9CIuuQEsN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7FFeRsM1p1MoBhFQPAK7R4ED7ruZ6iEGmKuoxcclCSV4CjM8ohdeZY3uKAt7RIwb67+R9vVwa5Ah3HcV3Ywj+dKgKQhIKY67/t8JPO73hkxqzc8yzV05D73D6z8waUK/DLvZsr1mZKsEkV6NjQqdqcrWkpPl5bhf5sM8pBy2Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LOI+OiM5; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LOI+OiM5"
Message-ID: <716c3106-1ea7-42cb-ae97-94f1c8d53ba0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729235661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Dy/FMmIdpEEYtPG11bDaRN2mkWlqryabLg2egJl0Xk=;
	b=LOI+OiM5ulkStDBIJ8XMM0nrwzIUD4B4rYiBXf78FanjML26Sl8ekNCKh20bwZJIeVWz1O
	0TtjN+5SpZNRIXEj8oB9Slw+gvMPKfMeIKimk6liQjBtbfdnILlLb6bZPh10KxzwIJyH7f
	1nNh+3KGIjcR9MaWDC0qrI48Lu4wSyA=
Date: Fri, 18 Oct 2024 15:14:11 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs/zh_CN: update the translation of
 process/programming-language.rst
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241018015226.3786020-1-dzm91@hust.edu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241018015226.3786020-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/18 09:52, Dongliang Mu 写道:
> Update to commit 0b02076f9953 ("docs: programming-language: add Rust
> programming language section")
>
> scripts/checktransupdate.py reports:
>
> Documentation/translations/zh_CN/process/programming-language.rst
> commit 0b02076f9953 ("docs: programming-language: add Rust programming
> language section")
> commit 38484a1d0c50 ("docs: programming-language: remove mention of the
> Intel compiler")
> 2 commits needs resolving in total
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
> v1->v2: revise the script name
>   .../zh_CN/process/programming-language.rst    | 78 +++++++------------
>   1 file changed, 30 insertions(+), 48 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/process/programming-language.rst b/Documentation/translations/zh_CN/process/programming-language.rst
> index fabdc338dbfb..55f132a4b212 100644
> --- a/Documentation/translations/zh_CN/process/programming-language.rst
> +++ b/Documentation/translations/zh_CN/process/programming-language.rst
> @@ -3,25 +3,22 @@
>   :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
>   :Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
> -.. _cn_programming_language:
> -
>   程序设计语言
>   ============
>   
> -内核是用C语言 :ref:`c-language <cn_c-language>` 编写的。更准确地说，内核通常是用 :ref:`gcc <cn_gcc>`
> -在 ``-std=gnu11`` :ref:`gcc-c-dialect-options <cn_gcc-c-dialect-options>` 下编译的：ISO C11的 GNU 方言
> -
> -这种方言包含对语言 :ref:`gnu-extensions <cn_gnu-extensions>` 的许多扩展，当然，它们许多都在内核中使用。
> +内核是用 C 编程语言编写的 [zh_cn_c-language]_。更准确地说，内核通常使用 ``gcc`` [gcc]_ 编译，
> +并且使用 ``-std=gnu11`` [zh_cn_gcc-c-dialect-options]_：这是 ISO C11 的 GNU 方言。
> +``clang`` [zh_cn_clang]_ 也得到了支持，详见文档：
> +:ref:`使用 Clang/LLVM 构建 Linux <kbuild_llvm>`。
>   
> -对于一些体系结构，有一些使用 :ref:`clang <cn_clang>` 和 :ref:`icc <cn_icc>` 编译内核
> -的支持，尽管在编写此文档时还没有完成，仍需要第三方补丁。
> +这种方言包含对 C 语言的许多扩展 [zh_cn_gnu-extensions]_，当然，它们许多都在内核中使用。
>   
>   属性
>   ----
>   
> -在整个内核中使用的一个常见扩展是属性（attributes） :ref:`gcc-attribute-syntax <cn_gcc-attribute-syntax>`
> +在整个内核中使用的一个常见扩展是属性（attributes） [zh_cn_gcc-attribute-syntax]_。
>   属性允许将实现定义的语义引入语言实体（如变量、函数或类型），而无需对语言进行
> -重大的语法更改（例如添加新关键字） :ref:`n2049 <cn_n2049>`
> +重大的语法更改（例如添加新关键字） [zh_cn_n2049]_。
>   
>   在某些情况下，属性是可选的（即不支持这些属性的编译器仍然应该生成正确的代码，
>   即使其速度较慢或执行的编译时检查/诊断次数不够）
> @@ -30,42 +27,27 @@
>   ``__attribute__((__pure__))`` ），以检测可以使用哪些关键字和/或缩短代码, 具体
>   请参阅 ``include/linux/compiler_attributes.h``
>   
> -.. _cn_c-language:
> -
> -c-language
> -   http://www.open-std.org/jtc1/sc22/wg14/www/standards
> -
> -.. _cn_gcc:
> -
> -gcc
> -   https://gcc.gnu.org
> -
> -.. _cn_clang:
> -
> -clang
> -   https://clang.llvm.org
> -
> -.. _cn_icc:
> -
> -icc
> -   https://software.intel.com/en-us/c-compilers
> -
> -.. _cn_gcc-c-dialect-options:
> -
> -c-dialect-options
> -   https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
> -
> -.. _cn_gnu-extensions:
> -
> -gnu-extensions
> -   https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> -
> -.. _cn_gcc-attribute-syntax:
> -
> -gcc-attribute-syntax
> -   https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
> -
> -.. _cn_n2049:
> +Rust
> +----
>   
> -n2049
> -   http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +内核对 Rust 编程语言 [zh_cn_rust-language]_ 的支持是实验性的，并且可以通过配置选项
> +``CONFIG_RUST`` 来启用。Rust 代码使用 ``rustc`` [rustc]_ 编译器在
> +``--edition=2021`` [zh_cn_rust-editions]_ 选项下进行编译。版本（Editions）是一种
> +在语言中引入非后向兼容的小型变更的方式。
> +
> +除此之外，内核中还使用了一些不稳定的特性 [zh_cn_rust-unstable-features]_。这些不稳定
> +的特性将来可能会发生变化，因此，一个重要的目标是达到仅使用稳定特性的程度。
> +
> +具体请参阅 Documentation/rust/index.rst
> +
> +.. [zh_cn_c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. [gcc] https://gcc.gnu.org
> +.. [zh_cn_clang] https://clang.llvm.org
> +.. [zh_cn_gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
> +.. [zh_cn_gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
> +.. [zh_cn_gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
> +.. [zh_cn_n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
> +.. [zh_cn_rust-language] https://www.rust-lang.org
> +.. [rustc] https://doc.rust-lang.org/rustc/
> +.. [zh_cn_rust-editions] https://doc.rust-lang.org/edition-guide/editions/
> +.. [zh_cn_rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2

