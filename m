Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E392DEA94
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765100; cv=none; b=qVL5LmbSN6nEgcEmESsSOKpjW8k7Wp1lPSvGgeNF+PMjDODPWvfKLwfr3Csc7OYBs5a3wtvYBcE4BKwvO/j2M8CVqwqNH8c5oXeNO3a9e4ElH1V5nJNKg+ey7sItWvtlfEaAOggkjo6aZdONQdbZynRaItsZCA3uaPDTWykWCyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765100; c=relaxed/simple;
	bh=qWisjqzAzLapzP18lcgOkOsr63awJhoc1WFtffJ1YQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsV8tJUgq/JbPNvIttPJOqimtmcgfMf1BMs+IXl+s8Go7qo51gX5e3yu7clLfhgrhU33hsGcfV389/yY55HGrntDPaDyHYzT2UsT9+xii/xSrdyyh9Diu5bEuVZn6cDVNnDxy76Q1aR9AA9WvguC86rZQiRY5C8lcCLAoNuVjMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lKOaJ3SB; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lKOaJ3SB"
Message-ID: <82c7e76c-326f-45c9-bff7-1f27bf0c689c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758765095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HUVTfySCPpJobw6VEmN77jlwIzcnV4lJ/T+C7o0eaw=;
	b=lKOaJ3SBuqZIZ+s+JaUif+AcgaS20/Ih8fQqOOxB7WPlflnEnXunJXwwaZCGcv/2uy/LX+
	IR0coaNv4bP+O7+y8eUj7iGCAXR7HhmyNh6NxL4IdtkJt+MdOeD3W6vjSpW9PQOLEAQW0t
	UYGjEev+j3RWd0slDPPOOsDoi2xTp/8=
Date: Thu, 25 Sep 2025 09:51:25 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: Update Rust index translation and add
 reference label
To: Ben Guo <benx.guo@gmail.com>, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250924235114.209967-1-benx.guo@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250924235114.209967-1-benx.guo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 9/25/25 7:51 AM, Ben Guo 写道:
> Update the translated rust/index.rst with new contents,
> and add a reference label in rust/general-information.rst so
> that index.rst can link to it properly.
>
> Fixes in rust/index.rst:
> - Fixed broken quick-start.rst cross-reference
>
> Update the translation through commit d0b343605f1b
> ("kernel-docs: Add new section for Rust learning materials")
>
> Signed-off-by: Ben Guo <benx.guo@gmail.com>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>   .../zh_CN/rust/general-information.rst        |  1 +
>   .../translations/zh_CN/rust/index.rst         | 32 ++++++++++++++++++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
> index 251f6ee2bb44..9b5e37e13f38 100644
> --- a/Documentation/translations/zh_CN/rust/general-information.rst
> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> @@ -13,6 +13,7 @@
>   
>   本文档包含了在内核中使用Rust支持时需要了解的有用信息。
>   
> +.. _rust_code_documentation_zh_cn:
>   
>   代码文档
>   --------
> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
> index b01f887e7167..10413b0c17c0 100644
> --- a/Documentation/translations/zh_CN/rust/index.rst
> +++ b/Documentation/translations/zh_CN/rust/index.rst
> @@ -10,7 +10,35 @@
>   Rust
>   ====
>   
> -与内核中的Rust有关的文档。若要开始在内核中使用Rust，请阅读quick-start.rst指南。
> +与内核中的Rust有关的文档。若要开始在内核中使用Rust，请阅读 quick-start.rst 指南。
> +
> +Rust 实验
> +---------
> +Rust 支持在 v6.1 版本中合并到主线，以帮助确定 Rust 作为一种语言是否适合内核，
> +即是否值得进行权衡。
> +
> +目前，Rust 支持主要面向对 Rust 支持感兴趣的内核开发人员和维护者，
> +以便他们可以开始处理抽象和驱动程序，并帮助开发基础设施和工具。
> +
> +如果您是终端用户，请注意，目前没有适合或旨在生产使用的内置驱动程序或模块，
> +并且 Rust 支持仍处于开发/实验阶段，尤其是对于特定内核配置。
> +
> +代码文档
> +--------
> +
> +给定一个内核配置，内核可能会生成 Rust 代码文档，即由 ``rustdoc`` 工具呈现的 HTML。
> +
> +.. only:: rustdoc and html
> +
> +   该内核文档使用 `Rust 代码文档 <rustdoc/kernel/index.html>`_ 构建。
> +
> +.. only:: not rustdoc and html
> +
> +   该内核文档不使用 Rust 代码文档构建。
> +
> +预生成版本提供在：https://rust.docs.kernel.org。
> +
> +请参阅 :ref:`代码文档 <rust_code_documentation_zh_cn>` 部分以获取更多详细信息。
>   
>   .. toctree::
>       :maxdepth: 1
> @@ -20,6 +48,8 @@ Rust
>       coding-guidelines
>       arch-support
>   
> +你还可以在 :doc:`../../../process/kernel-docs` 中找到 Rust 的学习材料。
> +
>   .. only::  subproject and html
>   
>      Indices
