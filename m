Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4E82D64
	for <rust-for-linux@vger.kernel.org>; Wed,  8 May 2024 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715169525; cv=none; b=DAke1+1v3wIev7fVLV6lENfRn7kiHnOssE5nNGZl2To30otD9DZOW/K+u7pzOxrWW4wJERhuDlX2gyJLTxN50dWLhm9H8Ijy8truq7xuXUVVrBObhTJ0B9yECIkbFne9pVhx+dDVIPGowP7YYZ9U5uSOhKfJdtDz95Yysy9F1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715169525; c=relaxed/simple;
	bh=ZUdtWRY9lOAuMOy10Ti50D0Rt/2Btu9daRaqkCna60k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aq1aGZ33bPqlT/+dMMUzrKpwcAVSa9hZq3ttSRXb/kSApqKR9GRIo7BhwH8ezrS6JVdcO+jCmagqSsR1W1n53X5FVi0dWfnLb3MzzFFGCuIFAjY3mNaPHoguo/JpmzJszhlqc7+dOkMQHIU4g1ZJGhWTfrDdojERLjFzYhRI/p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oj9XEkjS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oj9XEkjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715169523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZCKwc2tygNNEpMe0o2U98b2/YFKmCkOVeXMf8OM9s4=;
	b=Oj9XEkjS6AskPQ+nAei26iEt+Sge8z8kDbPeb+Zr8hCoLwSGU+ADkn8FuMLZ/nuoq2cJD9
	wT3v1t/kBRbB4FqRaugrPsK7NC1w8jA06R3p0V17tR9eTDrzH8pw/B+8urKSKf4nPIHGVj
	Rghfckf8fOjNPMecqsNF8tanBgdODF4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-P4euIqtXP9mhCmex4QwuXQ-1; Wed, 08 May 2024 07:58:41 -0400
X-MC-Unique: P4euIqtXP9mhCmex4QwuXQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51ee3ecca9bso3535544e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 May 2024 04:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715169520; x=1715774320;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZCKwc2tygNNEpMe0o2U98b2/YFKmCkOVeXMf8OM9s4=;
        b=pwsheVlORjSAp15mEyW6txBuvyWjKH+U5JAwfe5tN/ZhvTcmEikm0lXf9VJjGvkwsk
         mFgcUXGrwKcLyKrOA1Zb3kHWgM811BZRCN9dCn2zTuXAtBCwNxBxdQUi6AtThLR4xq1E
         fhg7cuCPsn+XaWu1/GXPsRwEHdZ8amTSUp9wuYNf0JFsDE3qS4M74MQk4pd5JxYrfk6Q
         DPpx9dNatmntMMBB2rKKjNqyftd5PgdYQW2vEFfRLbTNIwDhMtb9oUrVWx54zTpQ7+1x
         jDBhe6ptBf6LuMgyZkfBfRWYP2EkGDrndYbykdVsEKzJWv/vxxddz6WYWQbrLaIbO3/h
         ZlKw==
X-Forwarded-Encrypted: i=1; AJvYcCVaLCDVwTDfqXs9qjYCHKE8BN9nY1X1lcDMgYboTdMNHRLbbKwgEMc0xDAGBLal5i5KwkxX1In3aA0p+zN+HF5xWkbEI8oIRCDIpkfzAJ4=
X-Gm-Message-State: AOJu0YygMWhU28MK46ISxFMknCQfEWU66vdkg1todLjpvCCKjDGlHqCc
	ZqEDAia1ObiC/FwANuccojkQC6+eGUKKGF67LBhI08Ad0Ts2BclQ2n/PPQKcUTBn+VTwJTYLRhE
	ikzsytMjgr0S8Xsti4c9RKDbq/ZejJrv3dF1edARD4YbMEe/lHMkCaCWdmvHUNugZ
X-Received: by 2002:a05:6512:1186:b0:51c:d528:c333 with SMTP id 2adb3069b0e04-5217c5667aamr1382746e87.20.1715169520163;
        Wed, 08 May 2024 04:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLwp92s4FukDq8qfVC4QbrEha0E/Wanc5m4xG52UGIQ+WWZnYlrK2yNLSSFA3B8tpMnBo9Yg==
X-Received: by 2002:a05:6512:1186:b0:51c:d528:c333 with SMTP id 2adb3069b0e04-5217c5667aamr1382725e87.20.1715169519691;
        Wed, 08 May 2024 04:58:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b004182b87aaacsm2068052wmo.14.2024.05.08.04.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 04:58:39 -0700 (PDT)
Message-ID: <ea4a1a66-b584-48f3-8453-370d9ffb1f2d@redhat.com>
Date: Wed, 8 May 2024 13:58:36 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add room for insn-enconding and symbol name
To: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: David Rheinsberg <david@readahead.eu>,
 John Baublitz <john.m.baublitz@gmail.com>, x86@kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
References: <20240414180929.79033-1-sergio.collado@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240414180929.79033-1-sergio.collado@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/14/24 20:09, Sergio González Collado wrote:
> The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
> in the reference [1]. This patch adds room for insn-encoding and a
> symbol name, as proposed in [2]
> 
> [1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/
> [2] https://lore.kernel.org/lkml/16641a56-9139-4396-a5a8-89606bedd1f1@app.fastmail.com/
> 
> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>

Acked-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   arch/x86/tools/insn_decoder_test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
> index 472540aeabc2..add51bfc2260 100644
> --- a/arch/x86/tools/insn_decoder_test.c
> +++ b/arch/x86/tools/insn_decoder_test.c
> @@ -10,6 +10,7 @@
>   #include <assert.h>
>   #include <unistd.h>
>   #include <stdarg.h>
> +#include <linux/kallsym.h>
>   
>   #define unlikely(cond) (cond)
>   
> @@ -106,7 +107,7 @@ static void parse_args(int argc, char **argv)
>   	}
>   }
>   
> -#define BUFSIZE 256
> +#define BUFSIZE (256 + KSYM_NAME_LEN)
>   
>   int main(int argc, char **argv)
>   {

