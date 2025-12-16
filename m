Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEA630E0C0
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896118; cv=none; b=fmOBJTu1LJz9v3EKRZVcTKzhPSijGQhvaUu7r4ff0s5qseJw2d7DEbDKXbmk+X43F7n86eHDvHkAN+T5SDTaZ32zFJrKDvdSURcLa1kEK8+5iTgqnMaqUE5CwH0U5qoefYABOAGCVNFVe8BlTT7+zRtFWgqTYg91pclS5zRnjHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896118; c=relaxed/simple;
	bh=GcmsVh81EPRglScizk3u6c6zc0imNsEO8zBP3X7zTI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWkfrlxgw2AcPhODXHlVgMHS3nUwzFeJAnkHMuV9gt4lqNO1fTxhDWrpT2UyxaPlKPCEhfd2SLQnIB9Dsm6EywctLi/I5l/rrYXtZrkljDS8F2Ae4CeFDvtGAfYPlrCCjpISp5+uGzFYR8lmJ7vN8EEpHlzrQCUyL5FeHaIAmUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8GO2Xxr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8GO2Xxr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79f98adea4so688760966b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 06:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896115; x=1766500915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=;
        b=j8GO2XxrFIfFFCyA+O7Zf1ks/757dwI0isspaJO6U/ZKcHTCQSCPzmg676PjLigdfs
         YSrkLMM9NoCi+gW7kDQbBIguBj7DxrRN92pFXKdgDxvVSTWtgZhtPW21rXylD5w5UHND
         U3epEMCOV/tOUrQC37vDLtXto3xXFMeq8RsU7ceTzPuPiLHAG79uyFV2NVW+2+bSwo/C
         QzMUIui9oiqkURSbagTnMEiWHSo/rXfe66G73+0JrgRM5TLbcygs/IF+dHGHXkx54tbh
         eIqrxE6oCNFDqYopgxlGgzOBxF189A1RVDCOnKTOZSpHFjc2dO1ogI5Pths57b6P0edO
         7heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896115; x=1766500915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=;
        b=s1iflwT+ofnFTOLaBPbIPMRJCT84QuA3SXBfqfY6wlDz/sq1/AYePjWnKdIiMYwtNs
         L+OxIdMbocX2TCKr4Rod8vLylgZckUyCLDFM3PwwNRBQowLpc3orvynzHNCMw1z86DaM
         4nxeY4Yb90+mARKNu3wYaV8fQZgqFwMXmGJza3VKwyxM/URzy2KqNh1wx06qLYeBejYD
         hOGpK4fjQB+bHPO0kNYdD/FtfGLtd2Om014gOcAu2adrkAle2xKtgMRgW/rZaVyMokL4
         UvcUXtQCIJUOZoXpI/ZLMmLkpaoKPVF0rfm98Nr+Uj3yY4d/ASBb75Nu943Krt/gmL0W
         gARQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+cbpqpus3bTJguMBUXxKuO3Ww9NxPDzciJgr7TDwrnW1UVak7fROROFmMdXY2U2Dc6SSD/5KLmiSM8wIRWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/L0+gqU6nGvbhAK50kuEL5QpklUd6qoIGqrsDGGqtPqSeE+S
	GmmzfwlK4Z/3EcmKEgOJEn5+oKLJGBqACyoqNXzR+sihipbh6/fiCMz5
X-Gm-Gg: AY/fxX6v+r82mS4ETw3Q/vz+whKI9fzDoWE8jm6+Lb2dA+nW0eVlWSkqzW9XP8PtPMv
	gKVgcNB0b+xi6C8Qosf6Xllgs3fUFCNWK234sgMz26T1sp/uHegH46gPSrXGXc+ip7PgxUz44vh
	t23dqLUA4/vOqauHAPt+xOKNCy0s1dY/r+Cfn+W5H1Y14Sa5rC9QiRm9hwKB5znxALoUUHv6Lxz
	itBO5oIj1z17+W7o5nDkXCcuIhbd38SDQpZv1TjMRsQS8FApFRgUnuCMlnP1pYMAMz24ku1Vx20
	iEzF2uECOPC7H5EhBjuOhiAK5bwOrTXjyiItc17/dkUOd2f4snjem++TUbQAn/6mC7K+xrZrM4f
	qnYBnAbb+iHsvaG0KuOYLMc0VkDnlGhPZh00rBgIlbm3tNcQD3NwpOXgJ2bfrVjXXnbFtWsIGKM
	pNeexHaNIQYwBQ4PZNE9okPEw=
X-Google-Smtp-Source: AGHT+IG2eeJsem6ZFRGiTw+NwisDAZ+3SHIeXNcmnaxykLecsCuhc1aufmqpuqSo8Y4ftNwLIvjHPA==
X-Received: by 2002:a17:906:4fc8:b0:b79:f984:1557 with SMTP id a640c23a62f3a-b7d23c5bf6fmr1614360966b.46.1765896114506;
        Tue, 16 Dec 2025 06:41:54 -0800 (PST)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ebaebsm1717413666b.21.2025.12.16.06.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:41:54 -0800 (PST)
Message-ID: <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Date: Tue, 16 Dec 2025 15:41:52 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Rudraksha Gupta <guptarud@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
> Hello all,
> 
> 
> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
> 
> 
> In short, what is happening is the following:
> 
> 
> - The kernel boots and outputs via UART when I build the kernel with the following:
> 
> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
> 
> 
> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
> 
> make LLVM=1 ARCH="$arm"
> 
> 
> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.


I've managed to the get the build setup for qemu-armv7. For some reason
I could not get past the initrd even on kernels that are supposed to work,
but I think that is unrelated (and not a kernel issue).
On the linux-next kernel I didn't get any output on the console from qemu so I
think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.

So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
do a bit more digging, but I'm not sure how much I'll get done.

Adding the LLVM and ARM lists to this conversation.

Cheers,
Christian
