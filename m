Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C73E6392
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505728; cv=none; b=MCHT2EKLMmcPn4g9uLeZazXH8ZyhP9AVh7J4hxbzlRrs3NZw3ytvX9Iw/elWVrr9hScAwi3Y9aGkPYXb00mkUtLkktqqoUJFjVTyOTB32037Ng+bMlGFBHt27HySKgQx2mEsxyLB83TmUzkjtvgDBx5nqellRGU5gwUDEhtrmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505728; c=relaxed/simple;
	bh=+JbXbcKDM9tLFcb/oST0T3xjyz8MPd/DooQAyYXusjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FL51Q6FuO4viNUiIaZOVdPRjdwGMs6N+n7ZMBWrdZUPkHwCK2jn1XkZ1wVm5puM9sE+Ce4D7xrB+Q5LoKVwtIPSmVCRm56D/RlYW17WA3fxW58SC+JwaaG2C6Bf+wwdD+hhV/RY9ogobSgSFwYqGHU5cabPL1o2J3aB0+rTdYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2rc3hWJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2rc3hWJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso3799560f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778505725; x=1779110525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjVhhqtI7XvHvBXt5ZBrdyL+WZE05jLTGWEJNy/AWV4=;
        b=r2rc3hWJf+9Mf1480OkY+3jCjbiePrcjLgY20xniMmJQIbYzg5AVJ5ZTcX9PpUo7Sk
         JhM5uQMBzhOo7wI/mXk5Zn2j7oZ7NdREQ0V0MYT13Agun1/dKUUOXy8XdDb0Lfz5qJYr
         4pk/iMEIxxoCslhNvPBye1aDa29dwLxpCuKNDqdq2w4N6NPnpuFRcW06cGRL0Z95Uu4S
         z2BR4om/x+wmHvRvcuXV2ZpgffzLoHt4VHZyqU8xC1cHrImvg8AceGlyF7wrZPKcZYSL
         BogrPJbRWNcvvQt9M1ro/kf+Kak8VMfRRZsa4CmKlcefxfQGarHm5TEl1YffWIa+d+Nk
         z/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505725; x=1779110525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjVhhqtI7XvHvBXt5ZBrdyL+WZE05jLTGWEJNy/AWV4=;
        b=ZpFmQQsfyUEsB9U/JQtuYeyh/0CQjN4kXxwQ6Xzkjk72psJDeIQaNI3RkvSFelHVGP
         FM4EzBij93FZZNrBc7Q1siz2IJ082GKGku4sJa51qyHrlqPGu/6dsPA1EdNyyzUz0/C6
         DgebwB+26Ci6ucsSOdo9ko9vlOvqkqOMYS9tzfYY6kwUFzQfxVgG2vMo6AAj3EhFri52
         iKXLZKnwD+/w9Y6MrudtNH9aSqhoyAJV7LM8YOh5GYk76xpdtKfxXi8MtHlC/o0kS2xZ
         rwqqen8rAGWoWmwzFHP2xnY47A8Oo0V9Sw3jqzndKGUxj+U910qNa8yjaxZJoyPcsR3l
         2lZA==
X-Forwarded-Encrypted: i=1; AFNElJ+DSvljeSGbVFopJ2+sr1ZNExj2sDMybM5JnJgrXi0ApmgQhcxKylafJ25tRu5a3kz+ByXuxxmsBJ8UX+dfvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoTNzWwediCaZfbx1SQaTjZ2cRCahlap6p78Bw+DpE0V4hGQMF
	s5c7/cSv+syRwQuIHRRsV/iXEdt+dPClhGx7RUow1piq73tBgQzjZtez
X-Gm-Gg: Acq92OFqYBAgfzY5Ho6w9bPui7cEmStqYfQ3wUDqDmih5+6wbS3Rcz6tGxh2w3JwDE+
	L7SVjPywW4mejECIZUdXpEYpFhuiAwbDfyK44bmywQyQFRS+I/QdOX39IdjuAxexcs+CsYm/yoi
	qJjCCO8OGuBdOJWzdxUP5JgNIoGKSgDYZpS0+XfE+J1djdtNcVZgPZHUCljeOgMl1nLrmEFeHtA
	zaMlXtqHl7CYVsc4M6hlhg71RrK9J//OwK08Ndpgn2I/UWIxX6A7yz1HXjZUnouA/KrfNgKRx4a
	rkUuLsSbhdnHEo54iguq2JyQFo4wEz3F5+3e+fB/M7nn4DR5L8XlNwr6gQZy0PX+znMmhL866Lb
	VKuyQNHjcbSkV9RKdVb0QcVCB5Ty6HnVBwmi587/2vwHu5nGjhLK3YQ6zdKIX7d4970/xP6tQh1
	JhG4Sx2FGV55ddVkpA3j7jOUbTG7OfJKiO/ezCAmmKL9rVFaEJ1V9RAlNhM5syA9e/10D4trnbR
	Q==
X-Received: by 2002:a05:600c:2ed3:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-48e51f427b3mr251306315e9.15.1778505725311;
        Mon, 11 May 2026 06:22:05 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:34b1:bb7b:f969:515e:9d45? ([2001:871:22a:34b1:bb7b:f969:515e:9d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fff9ab8sm194958305e9.2.2026.05.11.06.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:22:04 -0700 (PDT)
Message-ID: <c216a62b-1653-43b3-b6a7-dd81af9da626@gmail.com>
Date: Mon, 11 May 2026 15:22:03 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/26 10:02 AM, Nathan Chancellor wrote:
> When KASAN is enabled, such as with allmodconfig, the build fails when
> building the Rust code with:
> 
>   error: kernel-address sanitizer is not supported for this target
> 
>   error: aborting due to 1 previous error
> 
>   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
> 
> The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> saying Rust is supported when it is enabled.
> 
> Cc: stable@vger.kernel.org
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Link: https://github.com/Rust-for-Linux/linux/issues/1234
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Seems fine to me either like this or as Alice mentioned in another reply. 

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Cheers,
Christian
