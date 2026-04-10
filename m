Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51974313273;
	Fri, 10 Apr 2026 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775783403; cv=none; b=i4S6hLS+vFsz/lFf96GwdYScby53upv2auiLDP9YRmCsgM/LoB7VvzFsZOgPbG7NONUCFK/oO1ZzKqbe2lFKSIH/D8kZ/15c2JjjwNL6niwX0lVfFIeFTELwRoOAh4tm4KuAhGQnMToA9A7ztjRO09AHROFMnjy95xZZFA9vQXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775783403; c=relaxed/simple;
	bh=TLOyOoJegajucaNBtxenWkUsXS3pfQSNjXk34ZBMjks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMupntwvd33lTWWAFTBSALd+BchJ6PgfV6qjJKbCLisoq0xj6RQFMVCh62Ii4iUfrhAUhAFgBpJbf9d49qRYuxyvLOsyX3AI3aqCCkU53Vq7heUoiEo0rvsWAluwWl57wQ/J49e6eSgEcjhTJxY4KLRn28ISoWxUihVfKLRLyuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAC3ZzjOTdhpTafqAA--.64816S2;
	Fri, 10 Apr 2026 09:09:34 +0800 (CST)
Received: from [10.11.69.226] (unknown [10.11.69.226])
	by gateway (Coremail) with SMTP id _____wD379bNTdhpodKyAA--.62376S2;
	Fri, 10 Apr 2026 09:09:34 +0800 (CST)
Message-ID: <816ad142-071a-4f45-a81d-35166ecf514a@hust.edu.cn>
Date: Fri, 10 Apr 2026 09:09:33 +0800
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
 <8dd6239f-eac6-4e81-a1b5-a4e6c45d07fd@hust.edu.cn>
 <34e73fc0-97d8-4bba-8083-84b932525789@openatom.club>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <34e73fc0-97d8-4bba-8083-84b932525789@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAC3ZzjOTdhpTafqAA--.64816S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW5CrW7GFyfGr15tF4DXFb_yoWxZrg_Kr
	4jyrZrCrWUtFnrJFsavFsxXrs3Xan7trn5JFyrCwn3Ja4rA390gF92grsI9rWrGryxZw1f
	Cr1vgrW2qr1j9jkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcV
	Cjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU0X_-JUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 4/9/26 12:54 AM, Ben Guo wrote:
> On 4/8/26 7:44 PM, Dongliang Mu wrote:
>> Hi Guo,
>>
>> I found an issue in this patchset: please do not directly include my
>> review tag from the internal mailing list [1].
>>
>> After you submit it to the linux‑doc mailing list, I will add my review
>> tag at that time. Including it now would look inappropriate.
>>
>> Our internal review is only intended to maintain patch quality for our
>> open‑source club.
> Hi Dongliang,
>
> Thanks for pointing this out.
>
> I will remove your Reviewed-by from all patches and resend as v2.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

You can add the review tag from me and Guo in the v2.

>
> Thanks,
> Ben

