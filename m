Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A676FC9;
	Mon, 18 Dec 2023 06:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inmSrJtp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3333b46f26aso2126625f8f.1;
        Sun, 17 Dec 2023 22:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702882074; x=1703486874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0AT1Mm+ApmzRWU5CE8MDyBwNw96Os0ML2k0Gs4JY74=;
        b=inmSrJtpWIb2Q+TQob1tmGsXZvpt0c4CBWtL7mkxgnmrK6gfyblzgaoadne5nJm9EA
         APmUDR/b5QrXr2ACWttBBQ8KVT2fl4saI1KOpZYts0tb5n+G9FXUy9vprJT7nWSd2K8K
         nfAeqlDk+8MGIv4t0D6hUVounZ/PQXbFW/1TN9otEpp/mC+US2EmZlKc6pvApyZZCWad
         n14p7gENNuQHbTzx5i/OvBwbTMM6UN09wloH6PYZN81eYSY7yaEYp968wNt+VXXS2cgt
         M1dNlJ0CG5HEXMhUIqqVUugPODvvqWMUcB9kqiXVf8erFQb55rTT7yPYkzXa7cCb4QN+
         bEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702882074; x=1703486874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0AT1Mm+ApmzRWU5CE8MDyBwNw96Os0ML2k0Gs4JY74=;
        b=K3zCEhbH3TaBIhpONKSm4knI0Xb/nZUblsP42JkUpJsasC6BgZMFMx56LlHd5xbc2I
         2ZNJG8ZVTO3N50cl4rPowdarE91yOs6PnIm1ifb3gHVpQylmXVw2oXJUpvK8tYtrDH/P
         KEKfG9N735cv33J4suLGHIeq6eE1JxZbQ5M7o3BKaz4UPW7pUZjs/FyYYROytWsLKVoU
         8u7Nllh/mjzo7/rPqM/J8nhpARXXsHrVKtYfJyH+EUCLXZHi0S2zYfigoN/PbvwCVYO0
         6CVMY1bfaOUmSjwFq+wKmEmAX3s7m1lP6owDpEHeu0fMMZhRoLDRDqfzijFv+rBoToBq
         ZEKQ==
X-Gm-Message-State: AOJu0YwT/UUCt93BCGVjboXeyx+Vp5FbxvciLTf6BbAM4W7VJMcB7mjx
	ur1EIrRK2avu7nzX/E0Ing==
X-Google-Smtp-Source: AGHT+IH36newPw8Y1gTzSIPqawOCVHQE+gmfDx3gq8ZGmQUXx737tWV8aafN7TII1gRTZDnF11MVDg==
X-Received: by 2002:a5d:410a:0:b0:336:6413:682 with SMTP id l10-20020a5d410a000000b0033664130682mr707904wrp.42.1702882073843;
        Sun, 17 Dec 2023 22:47:53 -0800 (PST)
Received: from [192.168.1.148] (224.69.114.89.rev.vodafone.pt. [89.114.69.224])
        by smtp.googlemail.com with ESMTPSA id v17-20020adf8b51000000b003365c8d0756sm6461912wra.96.2023.12.17.22.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 22:47:53 -0800 (PST)
Message-ID: <f891e3b0-c36d-4495-8e80-430723a445e0@gmail.com>
Date: Mon, 18 Dec 2023 06:47:51 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] docs: rust: Document the rustupoverride target
Content-Language: en-GB
To: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <c22eca4c308b72cdf750087622b61d3839ca40cc.1702878682.git.viresh.kumar@linaro.org>
From: Tiago Lam <tiagolam@gmail.com>
In-Reply-To: <c22eca4c308b72cdf750087622b61d3839ca40cc.1702878682.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2023 05:52, Viresh Kumar wrote:
> Document the newly added Make target: rustupoverride.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Tiago Lam <tiagolam@gmail.com>
