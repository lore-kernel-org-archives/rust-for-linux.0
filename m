Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAFC3D0AF;
	Sat, 27 Apr 2024 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714192708; cv=none; b=k/KZHOEoY1eAANLGQ6m4As1m59b3IrEdarQV3Ov5zlfs+4hXnWunQ0Um1pnpDtq07L/CXfvSZrF8w84HqBjQWd00N3ZC8JLiHGV76JlPSRk0CkdYecyLqtYe2oNIX/do8rmPmuleUlmgjGlPbbOP74tVQZcKI2j4c9+QuixPwH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714192708; c=relaxed/simple;
	bh=1e30Vx0x9asTreYv7+Dqpx3STx93SRkQPdmPybsYLUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pbvoJDsBzBXUgmHUZRxMoZRzGTPALGFKeLyK2jc0YHHLuNYQthXCUMbIA/sI3BUZaMSy8169PNf5DUvZGBe9QDNkP5mUwt5Nct66YWDoI8/uSizOndKCViPRZ3RkSbv8cIqb89V/NI1Y0JOc9BWaE5zPaBGHMYASYAaAKr52ZJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8Axqek+gSxm5t0DAA--.2757S3;
	Sat, 27 Apr 2024 12:38:22 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxc1Y8gSxmpBkHAA--.4284S3;
	Sat, 27 Apr 2024 12:38:21 +0800 (CST)
Message-ID: <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
Date: Sat, 27 Apr 2024 12:38:20 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net>
 <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxc1Y8gSxmpBkHAA--.4284S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrury7tF45tFy7Ar18JF1UArc_yoWDArg_GF
	Wvyayvyw48JF48Aa12gr4rZwsrtay7uF1xZ34kJ3y2q345AF4DWFW3Krn2gw1vgrWFgF1U
	GrZ7ZaySkw429osvyTuYvTs0mTUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbTAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcRwZDUUUU


在 2024/4/27 00:47, Miguel Ojeda 写道:
> On Fri, Apr 26, 2024 at 3:42 PM Jonathan Corbet <corbet@lwn.net> wrote:
>> I guess I don't see any reason why the translation couldn't go through
>> docs-next as usual?  It will all even out during the merge window,
>> right?  Or am I missing something?
> Yeah, that is what I am thinking as well, although Yanteng is
> mentioning conflicts somewhere, so I may be missing something too.
>
Sorry, I may have made a mistake, there are no conflicts in this patch set.


What I mean is that if I translate these two patches as two separate 
patches,

merge them into the rust tree, and then merge the rest of the patch set into

the doc tree, it might cause a conflict in the linux-next tree, because 
in order

of order, the two patches have to be applied after this patch set. I'm 
not sure

I've understood the whole process correctly.


Now that the two patches have become part of the patch set, there will be no

conflict no matter which tree is eventually merged into.



Thanks,

Yanteng


