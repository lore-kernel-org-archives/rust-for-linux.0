Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3E10F1
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783018210; cv=none; b=Hl9TGP3y14uRdZ8Ph1eQ2HLZetjH+5jgy9ouM4ent7sjC8eNS5JMeRvTaYtijzya2Izvu76gY477x2T0i9HXHlEVNQp8Rgr6NDnbkIuj0iCRLQlp3VefOX/ywdpm5721sZ2EJq9x2V3R6rRJ562/BjiVW39IA0e5oT47cW3P118=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783018210; c=relaxed/simple;
	bh=z94wlGoWyGXa6+NrNsVo+ApQ9sWAJB1y8JNzYoV0CzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEe3ZgpWCvQ77zWVJx9buHi+KKE2NZarWLYhVfyh0poUvIV6GrXyeUsS3eEr41sSnL0sBaHi4WSII+UXQOsJbyKJyXJJzEtnJC09dpTxMUAVA9Pd0KlA5MaWad7rPE8qOxkTLX00VeTLXdVpjvUoQ8kbRQexhbmbmQtDGXeiIOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUJgjnrI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUJgjnrI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so15153055e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783018205; x=1783623005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXG6OHs7oPiK0kfLO0F3MKN7dPnCD1zMj8jc2BcBAJs=;
        b=eUJgjnrI4Ux57QsULz0c8T3PZjyaqbliLvwUgh2mvIIBkhcHQU4tIcBQ3vSX7ksVvJ
         +ZU/UVMe+3hEp12IdqDyIjoFVFF+gbWq6lXRg/jx4HKhGeFSyhMYoB0iw6ZhlEIQ2CiJ
         G1D1yael6BF16FP/zniM4XZAP8jTx9ARe+XdrlI50Pk5QnV0AEvzEXXrf+uLqn+pBxYh
         szYsIiWfO8h32/c5WC8pqjAgFhS7e6wBukyXxle0Irr+yqbEob90nk/zylhW3SAphNZ5
         QM4Y1PtDxS3Z4CEQULGHStwTDu/Rr6ib5zAivlafx39ojAf3b1WxaBp8lIvwL1kDCnZ9
         DlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783018205; x=1783623005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tXG6OHs7oPiK0kfLO0F3MKN7dPnCD1zMj8jc2BcBAJs=;
        b=We4PE8Itze/23pixapJqHHVUmKbJKv262ssXwv1Cq5k+XIQnyPzVtboGQzkSrfHpQv
         anewsm5ZLk5EMdCGCKo3jw7DuhO64tSYVRaAVFu5uTVgRIpEhCNDp+TMtpaqd4OZITkc
         xNsx1EzIX8aB/JvIfD0ZSDzPrXnHV0l+uBLew9tWXP5AwKQ6AO8Pq50SDiVG9pHTdSo2
         J08SZuxiIIJ2hDf8opX5No4FtEfp7es+6AHoWgY2b0exhFUOGLH6MmhvG3g5YCBsjZzV
         Vdg2tWl31Ttr73tcyggqFZmwns5OSFNYlxLSpz678j7Z0TWLgjo8sJpYdJd6o5nhQRjR
         OsFw==
X-Forwarded-Encrypted: i=1; AFNElJ+nU2AsFqaZ7rCoSrips2CqeOm1KfJxBe77aGvpGZlTmz5cBFHkEbYTdjGioDeW21J+Ef25zL9v+3aRcjuAHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrmayOwjLROmC6b+qp1J5E5WBlKWtU3bX7AExcMZTLKPU7XUzE
	oIcMBVkFq24a8J8Eir4Vh3vvGz4X9XzoflE22riLQnnZ2HKU9BwAnK74
X-Gm-Gg: AfdE7clXRC8MZ9Ozo+rSN8fwbs+m1czshYFd3Qqd5ffBfFeA8PtCisHueSQufUyj929
	H0yY1CSrz1iV6Pgeogq94DbeUXewHs/fwFhiBJFA7MsKlaHukz1pK9mCOf5+kyXXlUIqq/hcQx6
	pYjh5qk8ccj6pmYXPm1cY0MEjD7lSSFvpz0U9PJT18NO7oLYmr/1lld4AFXOV9jv83Vjrnadhgn
	o+JRNc7w4wtXmUaV8giG/HMYpFbcBvPICQEjdAQ556FY73Vdc3HidQ6ad8i0QFkmGEZHOHQ0A11
	wMaZiFsrCI6IGBWFU6HFitRAO4m3Zdd1BWRnokrRMQwaeJuZnujgBwC8weqWCIIrM2064zBICdE
	7mPNCHPODQ8N4SBwG2x6iWzDZ1Pek+fFKHhsfGwSGMP6Ak/onbM2PyJdorpgZYiVau03YwlaQCK
	6zhQmk5JK9vV6DZQKmKeXkcE2SNvh4TRwjMPzurfId0NKiB/NLHZIGdtxvW1uH6SoFzjulHNARu
	wGs+nc92LBsVxreIvc=
X-Received: by 2002:a05:600d:844f:20b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493c3df77eamr74808995e9.34.1783018205423;
        Thu, 02 Jul 2026 11:50:05 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dba3csm10877210f8f.3.2026.07.02.11.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 11:50:04 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dc6ec395-ff15-46b0-ad0d-0f173b4d405e@gmail.com>
Date: Thu, 2 Jul 2026 19:50:04 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: core: implement rx580 state optimization engine
 and c-to-rust char dev
To: Breno Rodrigues Alves <breno3011alves@gmail.com>,
 alexander.deucher@amd.com, gregkh@linuxfoundation.org, ojeda@kernel.org
Cc: christian.koenig@amd.com, arnd@arndb.de, rust-for-linux@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260630210445.23103-1-breno3011alves@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630210445.23103-1-breno3011alves@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Breno,

On 6/30/26 22:04, Breno Rodrigues Alves wrote:
> This patch introduces an automated indexed state mechanism to optimize
> VRAM latency and command loops for the Radeon RX 580 architecture.
> Additionally, it provides a converted C-to-Rust sample char driver.
> 
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
> ---
In each revision of your patch, could you include the changelog and
links to previous iterations, here below the ---?

- Julian Braha
