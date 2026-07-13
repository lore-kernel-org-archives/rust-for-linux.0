Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF73932861F;
	Mon, 13 Jul 2026 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783910109; cv=none; b=YLi2RJyCOI359UfIOdv+y5XrARG97JnJDqh5sFtrfTPtI+M+8uCmOA6D7qFv/fiPPT0AlRTvUrmAiYNY/B9deRu7CmROoUtBfTry+727NFE4judfs1qlKJJ4hmg5s/gUSTmhVP9tp8eMta96W8AOvTQuz6xDP+O6R6fY2/fXFeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783910109; c=relaxed/simple;
	bh=2SfyYaekA5vGwMgWZyXmw4sv3c6t/3yluFUnez1PzLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2uQ3Zd6rCsZSIqY6qkDtrsN37w7jRLXKqZGIOA+C7bTd/cpfA+Us8HermPgBadk2eHHEu12+D3FL8Gkz40corvG1CHpJCdUjiWWD2XDkTY1xP7zsXXvN5MowFt7H2V2lEEJddJKGkp+dkiP2vjoJ6/UyhDDg4iFMmMLkmt/hjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrABnZ6CZTlRq2vnuAQ--.9700S2;
	Mon, 13 Jul 2026 10:34:01 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXQBCWTlRqIcrCAA--.22777S2;
	Mon, 13 Jul 2026 10:33:59 +0800 (CST)
Message-ID: <52e01b13-ff71-414f-8b38-e56d9eb3e166@hust.edu.cn>
Date: Mon, 13 Jul 2026 10:33:58 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] docs/zh_CN: Update rust/quick-start.rst
 translation
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Gary Guo <gary@garyguo.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <cover.1783905132.git.ben.guo@openatom.club>
 <78a525ba7344a334bc70664b34327dbb51024e90.1783905132.git.ben.guo@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <78a525ba7344a334bc70664b34327dbb51024e90.1783905132.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABnZ6CZTlRq2vnuAQ--.9700S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1fWFWrJFW3Wr1rWr48WFg_yoW7ZrW5pa
	y09as7Ja97JFy8Zry8tryrZF1UCayrt345KwsxGas3Ars3Jr95Kr4qqw43ZFWIy34UZF4a
	qrW8ZFnY9w4kur7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jhcTQUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/13/26 9:46 AM, Ben Guo wrote:
> Update Documentation/rust/quick-start.rst translation.
>
> Update the translation through commit a4392ed1c8b9
> ("docs: rust: quick-start: remove GDB/Binutils mention")
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
>   .../translations/zh_CN/rust/quick-start.rst   | 48 ++++++++-----------
>   1 file changed, 19 insertions(+), 29 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
> index 5f0ece6411f..0396137f3c1 100644
> --- a/Documentation/translations/zh_CN/rust/quick-start.rst
> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
> @@ -59,7 +59,7 @@ Fedora Linux 提供较新的 Rust 版本，因此通常开箱即用，例如::
>   Gentoo Linux
>   ************
>   
> -Gentoo Linux（尤其是 testing 分支）提供较新的 Rust 版本，因此通常开箱即用，
> +Gentoo Linux 提供较新的 Rust 版本，因此通常开箱即用，
>   例如::
>   
>   	USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
> @@ -70,7 +70,7 @@ Gentoo Linux（尤其是 testing 分支）提供较新的 Rust 版本，因此
>   Nix
>   ***
>   
> -Nix（unstable 频道）提供较新的 Rust 版本，因此通常开箱即用，例如::
> +Nix 提供较新的 Rust 版本，因此通常开箱即用，例如::
>   
>   	{ pkgs ? import <nixpkgs> {} }:
>   	pkgs.mkShell {
> @@ -85,16 +85,14 @@ openSUSE
>   openSUSE Slowroll 和 openSUSE Tumbleweed 提供较新的 Rust 版本，因此通常开箱
>   即用，例如::
>   
> -	zypper install rust rust1.79-src rust-bindgen clang
> +	zypper install rust rust-src rust-bindgen clang
>   
>   
>   Ubuntu
>   ******
>   
> -25.04
> -~~~~~
> -
> -最新的 Ubuntu 版本提供较新的 Rust 版本，因此通常开箱即用，例如::
> +Ubuntu 25.10 和 26.04 LTS 提供较新的 Rust 版本，因此通常开箱即用，
> +例如::
>   
>   	apt install rustc rust-src bindgen rustfmt rust-clippy
>   
> @@ -111,32 +109,32 @@ Ubuntu
>   虽然 Ubuntu 24.04 LTS 及更早版本仍然提供较新的 Rust 版本，但它们需要一些额外的配
>   置，使用带版本号的软件包，例如::
>   
> -	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
> -		rust-1.80-clippy
> -	ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
> -	ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
> +	apt install rustc-1.85 rust-1.85-src bindgen-0.71 rustfmt-1.85 \
> +		rust-1.85-clippy
> +	ln -s /usr/lib/rust-1.85/bin/rustfmt /usr/bin/rustfmt-1.85
> +	ln -s /usr/lib/rust-1.85/bin/clippy-driver /usr/bin/clippy-driver-1.85
>   
>   这些软件包都不会将其工具设置为默认值；因此应该显式指定它们，例如::
>   
> -	make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
> -		CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
> +	make LLVM=1 RUSTC=rustc-1.85 RUSTDOC=rustdoc-1.85 RUSTFMT=rustfmt-1.85 \
> +		CLIPPY_DRIVER=clippy-driver-1.85 BINDGEN=bindgen-0.71
>   
> -或者，修改 ``PATH`` 变量将 Rust 1.80 的二进制文件放在前面，并将 ``bindgen`` 设
> +或者，修改 ``PATH`` 变量将 Rust 1.85 的二进制文件放在前面，并将 ``bindgen`` 设
>   置为默认值，例如::
>   
> -	PATH=/usr/lib/rust-1.80/bin:$PATH
> +	PATH=/usr/lib/rust-1.85/bin:$PATH
>   	update-alternatives --install /usr/bin/bindgen bindgen \
> -		/usr/bin/bindgen-0.65 100
> -	update-alternatives --set bindgen /usr/bin/bindgen-0.65
> +		/usr/bin/bindgen-0.71 100
> +	update-alternatives --set bindgen /usr/bin/bindgen-0.71
>   
> -使用带版本号的软件包时需要设置 ``RUST_LIB_SRC``，例如::
> +使用带版本号的软件包时可能需要设置 ``RUST_LIB_SRC``，例如::
>   
> -	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
> +	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.85 --version | cut -d' ' -f2)/library
>   
>   为方便起见，可以将 ``RUST_LIB_SRC`` 导出到全局环境中。
>   
> -此外， ``bindgen-0.65`` 在较新的版本（24.04 LTS 和 24.10）中可用，但在更早的版
> -本（20.04 LTS 和 22.04 LTS）中可能不可用，因此可能需要手动构建 ``bindgen``
> +此外， ``bindgen-0.71`` 在较新的版本（24.04 LTS）中可用，但在更早的版本
> +（20.04 LTS 和 22.04 LTS）中可能不可用，因此可能需要手动构建 ``bindgen``
>   （请参见下文）。
>   
>   
> @@ -325,11 +323,3 @@ Rust支持（CONFIG_RUST）需要在 ``General setup`` 菜单中启用。在其
>   
>   要想深入了解，请看 ``samples/rust/`` 下的样例源代码、 ``rust/`` 下的Rust支持代码和
>   ``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
> -
> -如果使用的是GDB/Binutils，而Rust符号没有被demangled，原因是工具链还不支持Rust的新v0
> -mangling方案。有几个办法可以解决：
> -
> -- 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
> -
> -- 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
> -  中的pre-demangled的名字。

