Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C904B44C81;
	Sat, 27 Apr 2024 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714215629; cv=none; b=cYM+L2S4v1G/ZeYQLpz0AnidERn3H4YIMWP+z5EhvurrggCZea+pRaWLGAfPD5TBuFOdqaSoohJHg9hDJeYqbwaq3zYTjObPm92LbuFvDDGCg8f4EUuhkYQk/8GMt4vYnnntx2cc1c7NXYWm/RIthR2NaoQRuXZzUd8tJRhTfpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714215629; c=relaxed/simple;
	bh=uN9zg4r2+YimpK1afkplrma/oXZ35hyD4PXPKo8Zow8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgfTv9NnW3+2/hI4FBuQTaIJdvb1wFI1rZWx0eaMsHpvlr5oQa0S3VZpgNflscavRT0tChmy+Xwpn/HIG8MnyUIOVhjTaxbpulhaWsQMkXu5XwTvO+hKvwNXP9/R/87unIoDZNVaZhn8yYutCEvivSSzmJI1SHdyyyoVvgCa9AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8CxiOnJ2ixmgvADAA--.2754S3;
	Sat, 27 Apr 2024 19:00:25 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax693F2ixm3VEHAA--.21438S3;
	Sat, 27 Apr 2024 19:00:23 +0800 (CST)
Message-ID: <96b9372f-b77b-4810-8fdf-5e5b02522bfc@loongson.cn>
Date: Sat, 27 Apr 2024 19:00:21 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org, dzm91@hust.edu.cn, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net>
 <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
 <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
 <CANiq72kDEm7prV6ynAf=rZ5VydT=cYD-Ncj=waZEUOeCA1wbGA@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CANiq72kDEm7prV6ynAf=rZ5VydT=cYD-Ncj=waZEUOeCA1wbGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax693F2ixm3VEHAA--.21438S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF45AFyDCw45Jry8ZF1DArc_yoW8Xryfp3
	9xKwnayanrXr12yr13Gr47XFyrCFW8J398ArWxGr93Ars8XryxKFyktrZ5KFZrXrWkWFWj
	vrWSgrnxCa1DA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUstxhDUUUU


在 2024/4/27 15:06, Miguel Ojeda 写道:
> On Sat, Apr 27, 2024 at 6:38 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>> What I mean is that if I translate these two patches as two separate
>> patches,
> Ah, I see. As far as I know and from a quick look at the history, the
> translations try to be in sync with the latest non-translated status
> at their own pace, and they don't mimic the development of the
> non-translated side commit-by-commit.
>
> So I don't think particular commits should be translated as separate
> patches. In other words, what you did here in this v2 seems fine,
> since it already contains the "final state".
>
> Of course, there is a small risk of going out of sync with the current
> patch series if e.g. the RISC-V PR does not get eventually merged in
> the next merge window. This is why I mentioned that I am not sure what
> the policy is for translations here (e.g. there may be a requirement
> that patches to be applied to translations have been already applied
> to mainline, in which case you may want to send the RISC-V bit later
> -- but I don't know what the actual policy is).
>
Yes, our current update policy is a bit vague. Most of the time, this is

consistent with the latest state of the linux-next tree, but in the future

it may tend to be consistent with the latest state of the doc tree, Would

avoid the situation you're talking about with riscv.


The optimal solution is always to provide both Chinese and English

modifications. :)


Thanks,

Yanteng


