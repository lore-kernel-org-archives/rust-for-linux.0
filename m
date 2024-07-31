Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58E2224D7;
	Wed, 31 Jul 2024 04:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722401757; cv=none; b=WvMAzItfvUWkmTP728fFC23D0Io4HogXThi3qr12JO/k/6BhtCVv4aDf6AON4jUWUFsH0tlYHvHWPP/9x3Bc4227YeWf2IQ7d3JAcdO7pyF+lmQIlcM7b+kmYgmZuuRdA/DEVXMctlpHsu7taqdnqaZVp3/LxZT+iMuuoIcKaT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722401757; c=relaxed/simple;
	bh=V0dHtxVer2moH1gvpNDCzKcbUL8qtbkqVCcMZNNeRXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXW7cDyXUZMLfofeQTgX6gAhDzl9iq+H1AMPl8/CYTIcRMCUssYUvmxr4NdcsJ/EIT9LgyzC+1C8cCP5l7MQ6VhSLKNgpPr6bGhGnwq04e7Za8t0vpbddgUWRVvqg2Sc9giiJePBAspZpXphajGEuyVfpPQzn9LMT9vK8gUhNck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=whu.edu.cn; spf=pass smtp.mailfrom=whu.edu.cn; dkim=fail (0-bit key) header.d=whu.edu.cn header.i=@whu.edu.cn header.b=Rqs+8PuD reason="key not found in DNS"; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=whu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=whu.edu.cn header.i=@whu.edu.cn header.b="Rqs+8PuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=whu.edu.cn; s=dkim; h=Received:Received:From:To:Cc:Subject:
	Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=V0dHtxVer2moH1gvpNDCzKcbUL8qtbkqVC
	cMZNNeRXA=; b=Rqs+8PuDpLExA8o+rbDyJ+eHteZqpJp5Lz1oQiFMdQubu27r70
	nDnsRjWD6KbXi5bbhyLuhliuQe4sGUM4L12B3tTUdcr1SoSyJWuzTjyYW1lNh+X9
	62KDjxNUKUDpmO6iWpFQDgnTeUSTH3QCHJkOsux/lqpv8wDCSRTPjgSVk=
Received: from whu.edu.cn (unknown [10.1.14.8])
	by app2 (Coremail) with SMTP id Bw4BCgCnXBLMw6lm8e8SAA--.42801S2;
	Wed, 31 Jul 2024 12:55:40 +0800 (CST)
Received: from zehuixu-vmwarevirtualplatform.localdomain (unknown [82.130.46.207])
	by mtasvr (Coremail) with SMTP id _____wA35MPGw6lmtMILAA--.3809S2;
	Wed, 31 Jul 2024 12:55:38 +0800 (CST)
From: Zehui Xu <zehuixu@whu.edu.cn>
To: ojeda@kernel.org
Cc: zehuixu@whu.edu.cn,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: Kbuild: Skip -fmin-function-alignment in bindgen flags
Date: Wed, 31 Jul 2024 07:55:22 +0300
Message-ID: <20240731045532.7779-1-zehuixu@whu.edu.cn>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730222053.37066-1-zehuixu@whu.edu.cn>
References: <20240730222053.37066-1-zehuixu@whu.edu.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Bw4BCgCnXBLMw6lm8e8SAA--.42801S2
Authentication-Results: app2; spf=neutral smtp.mail=zehuixu@whu.edu.cn
	;
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr13Gw47KF4rGw4kGw1xKrg_yoW8AFWrpF
	W3KFyakws5GFn5Kr1xCr4Fva10vw1ftay5Grn0ga4kZa13WF93GrWfKr4av39rZr1fC3y2
	qanFqFyUJ3Z5Z37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
	vE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VCjz48v1sIEY20_GF4lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4xMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUUUUU==
X-CM-SenderInfo: qsqrmjqqqqijqqxyq4lkxovvfxof0/1tbiAQYPA2apDkweRwAAsf

On 31.7.2024 2.39, Miguel Ojeda wrote:
> On Wed, Jul 31, 2024 at 12:21 AM Zehui Xu <zehuixu@whu.edu.cn> wrote:
>>
>> GCC recently added the -fmin-function-alignment option, which will appear in GCC 14. However, this flag can cause issues when passed to the Rust Makefile and affect the bindgen process. Bindgen relies on libclang to parse C code, and currently does not support the -fmin-function-alignment flag, leading to compilation failures when GCC 14 is used.
>>
>> This patch addresses the issue by adding -fmin-function-alignment to the bindgen_skip_c_flags in rust/Makefile, ensuring it is skipped during the bindgen process. This prevents the flag from causing compilation issues and maintains compatibility with the upcoming GCC 14.
>
> Thanks for the patch!
>
>> This is my first patch to the kernel, if there are any issues or improvements needed, please let me know. ;)
>
> It looks OK, a couple nits are that you would normally not put this
> line here (in the commit message), but below the --- line (which
> means it would not go into the repository).
>
> In addition, normally you would: wrap your commit messages to a
> reasonable length, use scripts/checkpatch.pl to check for this and
> other issues, use the "Link" tag instead of "Reference:", avoid
> leaving empty lines between tags and ideally use git format-patch
> --base to specify the base of your patch (not really needed in many
> cases, but it is always nice to have around).
>
> If you can try that and send a v2, that would be nice.
>
> But apart from those nits, it seems fine -- welcome!
>
> Cheers,
> Miguel

Thanks for your nits, Miguel! I have applied your suggestions and submitted a v2 patch:
https://lore.kernel.org/all/20240731034112.6060-1-zehuixu@whu.edu.cn/

---
Cheers,
Zehui

