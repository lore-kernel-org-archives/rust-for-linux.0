Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3112637C0F9;
	Wed,  8 Apr 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648761; cv=none; b=jfh80PT1ozilXkh2Ord/piKR/KS3XYQThQh55Qs4kpoonwHrVp7SnTtinE8K0xQ6j8R946bmfb8AGBaW+FVqOnL4ZAOaynZrUGVC249xJMWJkekixFsFDoWYGx3q6deQaZTwDRDtAWPTCzAqE8OQmaob6MZyjPB2GLrNCyz3Nwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648761; c=relaxed/simple;
	bh=qkK3hN+oUxZaD32wnRxtAe0HifbnCEny7JRRkFmJtd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP8tqls7TqRpGPF5ud3XOI3l7iZajv42Dhjk/WeS9t4x/xYBgJRVBPgoNFKEl1TBQIs7k3lFtZH/UTWrVsb/RWrjef0GLKmQ0XWtJkDrYltq4y0bh/MCfqbsS0Ujs6tXRQpKzGYdlntLHPasAjJNJpFRWyhzFCZ9Skch5DgF77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAB3KDm7P9ZpMTPnAA--.16491S2;
	Wed, 08 Apr 2026 19:44:59 +0800 (CST)
Received: from [10.11.70.22] (unknown [10.11.70.22])
	by gateway (Coremail) with SMTP id _____wBHIQa3P9ZpYyqrAA--.52308S2;
	Wed, 08 Apr 2026 19:44:56 +0800 (CST)
Message-ID: <8dd6239f-eac6-4e81-a1b5-a4e6c45d07fd@hust.edu.cn>
Date: Wed, 8 Apr 2026 19:44:55 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] docs/zh_CN: update rust/ subsystem translations
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <cover.1775619061.git.ben.guo@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1775619061.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAB3KDm7P9ZpMTPnAA--.16491S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW7Gr1fZFWUXF4rAw4Dtwb_yoW8XF1kpF
	WDCF95Ka15Jr1Skr1fG3WUAw4ruFs5Aayaqw47Xws3Ars5t3W0qFyUKrZ0yayDWrWxXFy5
	Xr4Y93yUuw48ArJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcV
	Cjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 4/8/26 1:05 PM, Ben Guo wrote:
> Update Chinese translations for the Rust subsystem documentation,
> syncing with the latest upstream changes.
>
> - arch-support.rst: add ARM (ARMv7) support, update RISC-V and UM notes
> - coding-guidelines.rst: add imports formatting, private item docs,
>    C FFI types, and Lints sections
> - quick-start.rst: add distro-specific install instructions, update
>    rustc/bindgen sections, remove cargo section
> - index.rst: remove experimental notice and genindex

Hi Guo,

I found an issue in this patchset: please do not directly include my 
review tag from the internal mailing list [1].

After you submit it to the linux‑doc mailing list, I will add my review 
tag at that time. Including it now would look inappropriate.

Our internal review is only intended to maintain patch quality for our 
open‑source club.

[1] https://groups.google.com/g/hust-os-kernel-patches/c/QGN_5xneJc4
>
> Ben Guo (4):
>    docs/zh_CN: update rust/arch-support.rst translation
>    docs/zh_CN: update rust/coding-guidelines.rst translation
>    docs/zh_CN: update rust/quick-start.rst translation
>    docs/zh_CN: update rust/index.rst translation
>
>   .../translations/zh_CN/rust/arch-support.rst  |   9 +-
>   .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
>   .../translations/zh_CN/rust/index.rst         |  17 --
>   .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++---
>   4 files changed, 401 insertions(+), 77 deletions(-)
>

