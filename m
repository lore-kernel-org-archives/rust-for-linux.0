Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [20.231.56.155])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D0E3D966;
	Sat, 27 Apr 2024 04:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.231.56.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714193658; cv=none; b=HUvanDwiFNW5JAJM1xUv2pxySq7HzUVMog30rYqeveEI68YjDI9SoNKF19nRy4nJjUO3uJnndrlJMCKfz7cMvOQ9jUFiKAkOVMyyD0JRuEWUsf+wGN8Dofk+C6ozXIVAzfjHnvciAstDOp31eCqJCQmsJ8lu1fMsypve+qe/HVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714193658; c=relaxed/simple;
	bh=COCIbDZFltGaD84Wal5CSKydsK30X8Hnro6ckdcys30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFbqdP2AillpCfF6hD9M6/SPh1HgIc95gFKnU5wY/QGPUv4YFLwYe3VUMhM0J3IWAl9d9uV4X4NoDY+0ZgKGsEnEOO1X8aU1fJBc17StrQfPJIH02G4sBgO8zRj1G3L0fSiT67SF2ATMw3vO3Ge6BAVPBt3ndZUEtVvMBCSZs0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=20.231.56.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAA3aMTPhCxmTTwKAQ--.49572S2;
	Sat, 27 Apr 2024 12:53:35 +0800 (CST)
Received: from [192.168.130.49] (unknown [61.242.129.158])
	by gateway (Coremail) with SMTP id _____wB3yDXMhCxmSkY7AQ--.5384S2;
	Sat, 27 Apr 2024 12:53:34 +0800 (CST)
Message-ID: <14146b11-9e46-4799-90df-1f40337fc0ca@hust.edu.cn>
Date: Sat, 27 Apr 2024 12:53:32 +0800
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
X-CM-TRANSID:HwEQrAA3aMTPhCxmTTwKAQ--.49572S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Jw45Cry3XF15tFy3Kw4fuFg_yoW8Jr48pF
	Z8GFyfJ3Z5trn7Cw1fCF4rZF4fGFs3G3y5Jr12q3s5Jrs8GF1rtrW7t34Y93y8urWxZF4r
	Zr4rKrZ8uF4rCrJanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jw
	0_GFylnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26F4j6r4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnLa93UUUUU==
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

