Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C6B35A397;
	Mon, 13 Jul 2026 02:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783910450; cv=none; b=rrZX7NRL9NyXUmUhmHVeshUiwmP6IBXnxeqdoVNcSsSFH5gtyyDd/AfSA+bj4UfGmoXOb5DuX/evM1LCBckQ0+g+A7hm3NkRBaK/bM9RyXBca8az4niPacGjl8RkgPl+D6qorpyLXqm79a7EXywV+/kd2r/Tgh5wXH7Pu3SoJH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783910450; c=relaxed/simple;
	bh=NE3DnHEfBiiniFvqRTiv2jjm7rPMlDqOb5vMLkmLePY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KiuZk+OhWL+NJRJuEwyf6eCUoHW4RTiRBarKt4X2krgU6JQX7w548c8LPKhckbsgnJSsbPOqtpIL9yZLIZyZI0RrwhIR7g71vrBE2u0z0l/+sXkavHOko+erFs7gPy6rEpo17I+WISfQGLT9LVF0pXAWiUGU//sCsyXvHvzDKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABXfaIeUFRqyQjvAQ--.12705S2;
	Mon, 13 Jul 2026 10:40:30 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXEMcaUFRqo5eAAA--.23668S2;
	Mon, 13 Jul 2026 10:40:27 +0800 (CST)
Message-ID: <e82fabda-e3d7-4645-ab4e-47d8edb11b50@hust.edu.cn>
Date: Mon, 13 Jul 2026 10:40:26 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs/zh_CN: Update rust/arch-support.rst
 translation
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Gary Guo <gary@garyguo.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <cover.1783905132.git.ben.guo@openatom.club>
 <ea65566150d1b7797051ac2e9bb2b8725f041513.1783905132.git.ben.guo@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <ea65566150d1b7797051ac2e9bb2b8725f041513.1783905132.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABXfaIeUFRqyQjvAQ--.12705S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWfZryDJr4fArWxAr45Awb_yoWkZFXEkw
	18Xan0yFWUXr97Ka1rJr15Cr1kAF18tr1UJw48tFyrCa1DAr4DGr1DZa4kta4fGF47ur15
	AFn3Xr1Sgry7CjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbm8YjsxI4VW7JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRuVbgUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/13/26 9:46 AM, Ben Guo wrote:
> Update Documentation/rust/arch-support.rst translation.
>
> Update the translation through commit 3f70ebe63858
> ("s390: Enable Rust support")
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
>   Documentation/translations/zh_CN/rust/arch-support.rst | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
> index f5ae44588a5..0ca4be6e176 100644
> --- a/Documentation/translations/zh_CN/rust/arch-support.rst
> +++ b/Documentation/translations/zh_CN/rust/arch-support.rst
> @@ -23,6 +23,7 @@
>   ``arm64``      Maintained        仅小端序。
>   ``loongarch``  Maintained        \-
>   ``riscv``      Maintained        仅 ``riscv64``，且仅限 LLVM/Clang。
> +``s390``       Maintained        必须禁用 ``CONFIG_EXPOLINE``。
>   ``um``         Maintained        \-
>   ``x86``        Maintained        仅 ``x86_64``。
>   =============  ================  ==============================================

