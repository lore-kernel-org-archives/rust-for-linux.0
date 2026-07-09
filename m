Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76840E8E1
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597714; cv=none; b=QuLyKwe7a4nFTq/LsfvaxntzsvUqbiC/g+2z2VW5y8yhdNX6LBfnZfm6suEz7hCxjBryQ+xHa32AZ+/ts4IHjSdeO4xAzp3MIIw4cVDsPz8sTFK24rbl1jZNQKwVfNl45toyW06dz8tE7CiV7/t2Xlss+KFLKM5wewVyZbh6hkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597714; c=relaxed/simple;
	bh=YcrbCGbp9yVb3kD+7VwZ981MYBaNshwP+EjRjcaw6ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uafGq9sCA4rPQgstGi0AxIznaxws4y5unh0EicDd8eU1Pj0gW1WpYbTBMrBblMcfQmaSLftJ4CIiI2r7wEpIXN93wFD4AKYsKfpjh3IUCaS3jYPuSWTfEzKHuXUQPn251xsSoCB5KbdMZxra+vNVQXDUWolPgeZxqFAIZAN2H3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PaFBy+x+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PaFBy+x+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c7902f47so13855575e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783597711; x=1784202511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xhIPKXuDtakaGagT1mNyUeziKP6acuLSpzf74bewak=;
        b=PaFBy+x+7SHjflPNCa+CDICA8wvgiDxnvtDKWQjjeU9EhcvOyejEfUI6r98O1nJGFu
         NVp5Zk80Qk2OF9/raQgIZYDp/STvbfY4aZSFRWHHufLmGF3IxiadXQwR86YptPyrH2T/
         H1ZNEWqd80EM2J5EzfWGSLiJVo9DAiH4p5e9gtldTY15wBjlO2iHakylbjvlJVPIwmK9
         VGvg1RvG+wfLcWm/OlAjROU+uiNNbakrhyWYcLUffwgf9ALB+0Rt3gD0K5aKIR0TAF46
         sjqpbW3Z6Jji0OqvCxF2DvGmcDAKtEVkWCIssowaYD+ujzQun4MHVRx2nUyKFaqarEmE
         CQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783597711; x=1784202511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xhIPKXuDtakaGagT1mNyUeziKP6acuLSpzf74bewak=;
        b=azPf4V6ukLR8T/As7fH6nBdOu8l+OuoyG35TWiHeBW2nWkWjkcFxQ6xzvi+7oqOjoC
         4QzC/boNjCwRc/801CjKfHyI6eQoi6EmRfM3mc+vAIA4b2nElxNOKodK7XiM2LLEdgQU
         wuqMmafD6FSHDe703Oy537U6yPlfQTh1Ln2ih94oseBdUXaSfEyEvFbC2+oDeAJ7xIxk
         qQpFz8YWuIamK/v1v7R5aAfIr1Fgq50wK0Y8or+MuYUQXAwJ21pWCiJjEBrBT5E7RtY5
         3nFQBUfVvRpT+RBWNBgoeW4NC9g8TB5o+WFz8ra1vHla/JXyD1j3QrEjcB/h7kSWHNJb
         VA/w==
X-Forwarded-Encrypted: i=1; AHgh+RpsZklH2elILRlTZXrCeCyixPACjru1vcbUrkGnsYiYv0uTB2/bxXCmlBqEg8JAznitXjuYnQkIQ1Qro1bYOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo4DIigLWZDzLDbVqUBExuTiG+XMScs1yny8bnacCcUbDVm4hv
	+gAeHPbrR6YeSVYmY2UkM/N0LYqi9K6jS+VVdP5pjhmI272e8tX+kKpPe3T+m2qj3bA=
X-Gm-Gg: AfdE7cnlsZYgb96TWJaFtD0nU8+aRFT0moMxspY+tjrO5ueJa5eUyTDQQKuKbEe79pN
	+FT+SBZ0677lwXlbWGn32BRyaJvztZ/R32t8wAKsR5lGagrNOdooqqkZLmKaH6k0BtLXXrxGukN
	NqjhOSaJBT+NfVM6QFDz4eJBzpM5eF593ZCWyfPs51kH4m6/911096W6lIuyERxZku6+PpOHsp0
	o0aprtgVw5IMRdNVlnswqpWBtruqdizlIoGlejIrZSYlzDd/ivwSVMPgJtOh1I12WchYdfshvuV
	POhfY/tjbMskiwrS172VEpkdt2P9zQghHfUzrfvTXwMFWN7WfSnyChMTnZQhS/DQd1H+nESemwp
	b6vFVML55naywWfVdrecwfpzWRsjQDmmjk9WlhIcNL9YkLPiCeZup8muxqQ38ldKbCS8FI9MH4v
	qXEsBE1OvtWyJb7LKJSRPwlb17LKZqFIkmeQ==
X-Received: by 2002:a05:600c:3e07:b0:493:de89:61b with SMTP id 5b1f17b1804b1-493e6868766mr66384865e9.26.1783597710634;
        Thu, 09 Jul 2026 04:48:30 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df417sm55696575e9.8.2026.07.09.04.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:48:30 -0700 (PDT)
Message-ID: <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com>
Date: Thu, 9 Jul 2026 13:48:29 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/26 12:17 PM, Andreas Hindborg wrote:
> For `Copy` parameter types it is more ergonomic to retrieve the
> parameter value by copy than through a shared reference. Change
> `ModuleParamAccess::value` to return `T` by copy when `T: Copy`,
> and rename the previous reference-returning accessor to
> `value_ref`. Update the in-tree caller in `rust_minimal`.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

@Miguel, please let me know if I should take this patch on modules-next,
or if you'd prefer for it to go through the Rust tree.

-- 
Thanks,
Petr
