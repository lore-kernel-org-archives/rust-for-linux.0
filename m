Received: from zg8tmtu5ljy1ljeznc42.icoremail.net (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE333D966;
	Sat, 27 Apr 2024 04:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.65.134.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714193895; cv=none; b=Gw2w63HJ0nSLS9vXq4plllrd9jR8iGg1meF+dOrgF/oH84M6I5EVzJ3Ya+UpIoxyVNjyCXo4GVAGA5g9avPwMgLV/eFmZyP/du9RDUz9IAc4EPakBCUt3efMgMCCJmP561wyPIo4x3ApWs5G15uhtvczuGm4bhtlr2kKLTzrv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714193895; c=relaxed/simple;
	bh=aM2Luehj5+ffkrgeKoI0aifHQ4Kms4zk+9w4xyw7XR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQp+qTZ8ApzSZGEG8+O3P816BMugRSS+p4o4XLIl9/oEc+gcWJlqgqWHTatzoOzlvhr6j491/lt60tlNtnanZ7+eVTVfDeW75MOoYlCP1G6Q8bU+xW8xatavxW9Fv0E193+c2TAaPsJ8zmvYfJ7YvlSXetl+Oe5T4HKMaHVsSEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=159.65.134.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrADX2SjHhSxmcIp7BQ--.43098S2;
	Sat, 27 Apr 2024 12:57:43 +0800 (CST)
Received: from [192.168.130.49] (unknown [61.242.129.158])
	by gateway (Coremail) with SMTP id _____wAnAdrFhSxmvgvfAQ--.31060S2;
	Sat, 27 Apr 2024 12:57:43 +0800 (CST)
Message-ID: <9ce2bf52-375e-42a7-902c-72de1dc90af2@hust.edu.cn>
Date: Sat, 27 Apr 2024 12:57:41 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, corbet@lwn.net,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org
Cc: linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1714113680.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrADX2SjHhSxmcIp7BQ--.43098S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Jw45Cry3XF15tFy3Kw4fuFg_yoW8Jr45pF
	Z8GFyfJ3Z5trn7Cw1fCF4rZF4fGFs3G3y5Jr12q3s5Jrs8GF1rtrW7t34Y93y8urWxZF4r
	Zr4rKrZ8uF4rCrJanT9S1TB71UUUU0UqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	4a6rW5M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWrXVW3AwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUy4CGUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/4/26 14:59, Yanteng Si wrote:
> v2:
> * As Miguel's comments, translate commit 01848eee20c6
>    into Chinese, as well as commit 81889e8523e6. By the way,
>    these two patches haven't appeared in the doc development
>    tree yet, maybe we could consider merging them into the
>    rust tree?
> * As Dongliang's comments, translation "在... 前添加" other
>    than "前缀".
>
> v1:
> The Chinese version of rust seems to be way behind,
> even though we did translate to Chinese at the beginning.
> Let's keep them up to date. :)

Looks good to me.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

>
> Yanteng Si (4):
>    docs/zh_CN/rust: Update the translation of arch-support to 6.9-rc4
>    docs/zh_CN/rust: Update the translation of coding-guidelines to
>      6.9-rc4
>    docs/zh_CN/rust: Update the translation of general-information to
>      6.9-rc4
>    docs/zh_CN/rust: Update the translation of quick-start to 6.9-rc4
>
>   .../translations/zh_CN/rust/arch-support.rst  | 14 ++++--
>   .../zh_CN/rust/coding-guidelines.rst          | 12 +++++
>   .../zh_CN/rust/general-information.rst        |  2 +-
>   .../translations/zh_CN/rust/quick-start.rst   | 50 +++++++++++++------
>   4 files changed, 56 insertions(+), 22 deletions(-)
>

