Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF32E44A3ED
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743040; cv=none; b=l0wzOEoMhG2vep1/VyD/HIPe/Ok6kLjBgbx+wWepmOvIradfI693sR3OZKn7C4tk+3juIB1r+a34G0RcVFgB4hTDvJPYfKyIIcz1ogMT7fujKyck8FxKGTU8+nzLZwu2bpHSVdciO7sK0iPX9HImmM3YXlCD7lVQHelMaopcX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743040; c=relaxed/simple;
	bh=nqyL9JemtS0GhZQq2YJVUbzEc1H+DENczqh4twt/OpA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZcdOOqaVExeFlQH0B+pa3XFzeQubT8tkKwYnHPF3wOsmtUr6QSCJui5OikAbp/1HFidelHkAOGm5MImbyYB6PUA+UwpfyYOZ+s7p+JlW6ThQ9MIu251X1tEzpeqoCobchHOgjUBIWEaGMK0ZVR0b4WoxMOkwKe57vFZQl79V2d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgCY0dAN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgCY0dAN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b060ec084so632338f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791743036; x=1792347836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGzliFeDcoWv7bGRwRrYy+3M5x902wezSQDQF9PoOoY=;
        b=SgCY0dANr1IL2MrdK1XyQKyAxWzf+Nv3QwSJg7tTvVdCL8LTEhy/MLBVaeQWTn5NVB
         Nr5vVueMZ+7zEP211y4NmVDDNXmd6fVyOQzcI5mhHggoYuyv88YDYbgd30k1sWKeTmgN
         uDjzHbcd3nLGNKsI0BTlLPcDHlAwy+VmC7T4OQy5lIqKTd/Z0cXPZfQwi1DHpJC0KmMN
         B4wL4cEf2iuFexHg2tp+dgmhVI7thUJiENH/bOrCMCN1nD3q5a1J1nZidaMrHkipWAip
         haR2z5D5an3lRMQpKQv49cIjRPIDk5QlFM1P7Ds/IuW34tPBf4WsBA1M+t/ooCUuKqvF
         zlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791743036; x=1792347836;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGzliFeDcoWv7bGRwRrYy+3M5x902wezSQDQF9PoOoY=;
        b=tyQpeu+7iMDThsY/HS9hZ+GNY7esIlyFt+i543Q9tIDA5RZbV12woWZu2wQXLWIb5T
         K3msV4IHt8GOScluUwLQ67DyuCXTFa9j8E33/3TivO5jBdmEGekrpMNf8fg1RfHXPP5L
         8+Eg0/ceavtflVAzAzM0D4OwJBpd+9LdIhEd1q+Sv3bx2bq1z6MvqCEtnIFEWjMd7iOq
         u51p0B0fWX1ovW12XK5fM6eslF0z58pILf5WDadtljiAYUW4uRdcOrw2WqgnWYwB+n/S
         LfgbWk1G0TNe/3TvpptU1583qMHjG/2s/OTWwa9Bc9GxjH3yL9kwP/jRw6bRZxbNo6s5
         je8g==
X-Forwarded-Encrypted: i=1; AKwUvBz26ZPIykwfPnwOfniv8WIzh4EQ7YojA/TlmCfU5jQOSwz3ivcomyP0hAou/gmVmmnkFDe16PEsmxPk3A73ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/phuJIIhHiEtBTxpeqrQkIwoojdykw7nX55EEG48jOY75C/wr
	KpMu0MFlXg3PceKHwt3cd9XdqNUfGbpqrC5rNhSioz25zd8t9634B8LG
X-Gm-Gg: AYBFou24dSA891MabybVyTsNKpZJmPiK05rJPZKQbhUbcstuyJcyRvyprS6Jd9p8v7k
	E3cfMdpFHqxdNsfcvX4bncjlhwqCXmhLoBaAXivoAIo9c3Mk3+k/aY3ZcTt2mF7/ZBP/feVRRMV
	6OrVpTXPop2azLW4ZDOXe8rJgj1Mh/lc0rH0rhY3mblfCNUuV9I5MeOBQNBhd/51aTpzeuMYssT
	uoVnT/ED768xtyECSL+dBvf8gcf8bpwj3wTk21+u8U9p2mFA4jcaPVAeZ2RJAxKVq9gmNaJFosK
	uyeu9lLws7z6fdkXbcMkUEChhhaVzqzyX45LcscB9eCAHECosUpqtN6nAhmy0R79fymFqs2uq5K
	mYIHSq1N5wrM2mcTP7AcuSw5x7b9Fr8MyapUm1MOhLnHogxa3XCQZao6LHHyXNBChemFjJpbGwW
	U2XEBY6gk7XjXMUQy/fci78VNXChI+unK5x+qQ9ky9ndmIlYbmRwHenoHWFLjNWORcUyKENU8/L
	8oxCM0S4WkqbKsRVWxpKrOCZxFJfgd4
X-Received: by 2002:a05:6000:1861:b0:48c:50db:30e3 with SMTP id ffacd0b85a97d-48dbaadeaf3mr13502413f8f.19.1791743035466;
        Sun, 11 Oct 2026 11:23:55 -0700 (PDT)
Received: from [10.0.10.92] ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db93d6069sm14495126f8f.0.2026.10.11.11.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 11:23:55 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f2e28f7c-2b36-4dd9-b91b-81740b8ca5ff@gmail.com>
Date: Sun, 11 Oct 2026 19:22:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 a.hindborg@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
 grahamr@qti.qualcomm.com, jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/26 17:20, Miguel Ojeda wrote:
> On Sat, Oct 10, 2026 at 11:50 AM Julian Braha <julianbraha@gmail.com> wrote:
>> In an offline conversation, Miguel Ojeda reported that scrolling
>> horizontally in menuconfig's search to read RUST's dependencies has been
>> slowing down debugging.
> Thanks for working on this!
> 
> This is definitely useful, because users (and ourselves) have had to
> scroll horizontally too much for `CONFIG_RUST` 🙂

Yeah the feedback I got from everyone I showed this to at LPC was, "any
form of wrapping is better than horizontal scrolling."
> Maybe it could help to clarify here that "debugging" above means
> understanding by users (i.e. not developers) why the dependencies are
> not satisfied. `menuconfig`'s search is uniquely useful because it
> shows the expressions with the current values; i.e. this is useful for
> most users dealing with long configs like `RUST`'s.
> 
> Is this patch the live one you showed me back in the conference?

Sort of, the version I showed at LPC was completely vibe-coded, so I
could quickly get feedback on the visuals.

This patch still creates that same visual look, but I've cleaned up the
code.

> 
> By the way, for context and future reference before I forget, I
> suggested a few other bits:
> 
>   - Wrapping on the top-level `&&` operators.

I personally liked this style when I tried it, but another maintainer at
LPC didn't: "I want menuconfig to take advantage of the full size of my
screen."

> 
>   - Even better, wrapping on the actual `depends on` lines, rather
> than every top-level `&&`, because sometimes they are logically
> grouped, even if they may use themselves `&&` for the condition. But
> IIRC we discussed that this would require tracking more state and/or
> reworking part of the parser.

Right, that would be a much larger change. I do intend to iterate on
this in the future, but wanted to start with something minimal.

> 
>   - For completeness, I also mentioned potentially considering to show
> (a subset of) attached comments, but that is not really needed and it
> is really low hanging fruit that is most likely not worth its
> complexity: we already have descriptions and most options are not as
> complex as `RUST`'s.

This idea turned out to be controversial. Another maintainer pointed out
that you don't always know exactly which lines the comment refers to.

Anyway, thanks for your feedback!

- Julian Braha

