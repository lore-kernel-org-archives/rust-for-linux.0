Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CED0175A76;
	Thu,  9 Apr 2026 05:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775713121; cv=none; b=Sd4omydSTfv0eATjeLEEda5Dhp6A18ELkd0LaKCQYplcrvfFQC/ejP5YJj5IBdLJbkg/1QvUkryhb9w7t2o46ugNjOnk/WorOz/aDscM85L3qkLl7x2G6ki1z9QFj0s5++jZU6hjgAJfcbsaR5pNcqvENVSyoGpkinK6MZJ7pMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775713121; c=relaxed/simple;
	bh=hEAOz59k186RnInBhWJexDvZtH6bFccRWC1c5Bq/CMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8Z/KkCAADeJXY/Cthcj5Jt21qAXNy1BltiLkMHC61XG7RcCJ4esBI8VKcL5y1bmL7oq3Dzqv74OlWaBMeDhOeOSywxBOxXHp3Sxv+mkxN/8AjGNHi00+j0E8r/xhGMk7qxufTUTs7FVtp2iz3vbQ9QdbH943JdXG6/HhrZZ6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAAnNxxAO9dpaGKaAw--.109S2;
	Thu, 09 Apr 2026 13:38:08 +0800 (CST)
Received: from [192.168.43.158] (unknown [10.200.80.159])
	by gateway (Coremail) with SMTP id _____wD379Y0O9dpBsGuAA--.59164S2;
	Thu, 09 Apr 2026 13:37:57 +0800 (CST)
Message-ID: <d7e81015-f17e-4ab9-a9e5-d2ac6dd82e7b@hust.edu.cn>
Date: Thu, 9 Apr 2026 13:37:56 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
To: Gary Guo <gary@garyguo.net>, Ben Guo <ben.guo@openatom.club>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <cover.1775619061.git.ben.guo@openatom.club>
 <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club>
 <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net>
 <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club>
 <DHNYKCR34P1F.1EZ3D0A8UB8S5@garyguo.net>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <DHNYKCR34P1F.1EZ3D0A8UB8S5@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAnNxxAO9dpaGKaAw--.109S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xJryruF4fCw1kGFWruFg_yoW8Jw4fpF
	W5CFsayan5tr1rAFn2kr47J3409FyfKw1jqw13t3sIkr95tryftw4UtrWF9as7Gw1xXF1j
	9F4Ykry7urWkZaDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 4/9/26 1:43 AM, Gary Guo wrote:
> On Wed Apr 8, 2026 at 5:51 PM BST, Ben Guo wrote:
>> On 4/8/26 7:33 PM, Gary Guo wrote:
>>> Hi Ben,
>>>
>>> Thanks on updating the doc translation. There has been new changes to
>>> quick-start.rst on rust-next, could you update the translation to base on that
>>> please?
>>>
>>> Thanks,
>>> Gary
>> Hi Gary,
>>    
>>
>>    
>>    
>>
>> Thanks for the review. This series is based on the Chinese documentation
>> maintainer's tree (alexs/linux.git docs-next), which does not yet have
>> the latest quick-start.rst changes from the Rust-for-Linux rust-next
>> tree.
>>
>> Would it be better to wait until those changes land in our base tree
>> and then resend with the updated translation? Or would you prefer a
>> different approach?
>>
>> Thanks,
>> Ben
> I don't see the issue of sending translation of the latest quick-start.rst even
> if it's not in your base yet. By the time the changes land upstream, the
> original quick-start.rst would already be there.

Hi Gary,

Let’s wait for the rust-next changes to land upstream first, then I’ll 
ask Ben Guo to sync that commit. Otherwise, the Chinese translation 
would do not match the original English doc, which will confuse readers.

We have checktransupdate.py in place for monitoring the updates in 
English documents.

Dongliang Mu


>
> Best,
> Gary

