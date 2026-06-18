Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610783A4521
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779183; cv=none; b=rtHcuiTkwORkbtF0ZPIJm2VwL7X/blCfVTtRzpVeWjLGo3pkrj2sbVFaNbLtBu2qamdgyyEiYtj8v8+llmJ16uxF6ltgriaYaiboT5LHiI8U0hYsX6XLXkxWG6TBGHdOQdrReeApMcFgGR52NdzHBMmTKcgI/QpQGf+tZOGLvaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779183; c=relaxed/simple;
	bh=h3usWtBaYCyu4vzaaBANoAcC83gIDUMGyDMaCTQiCAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBnR4kMvAO4+BVQBifknEZllRBdCjwx3NnKvkoCFvw+1LBv+9pQuNf3/bDCny/hcY/0l5anf/fFmX4ggsBZSH/sqoTMVHv6oSQyYTvWxPLxE5bRMmCtKfQRHlm6xQ1urGFm2e3WNjCiASnXf0CXUsPb2rd+z9adfOHQ3tHubhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EggELU+N; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EggELU+N"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so662634f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779181; x=1782383981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B9XxsU4nXDbAmyfXiIossdiRMmk/XkYgvNEAKNkHFm0=;
        b=EggELU+NBHM9mjuhd+KK4f/wBhYuq74BWPG3fneGWyDCv3p8LIkXWT4NP0okKl/46l
         eEEQmzAyTH08x3x8QVyYWvOeGBN6ExNYZLL5TXAxdPsqeXhOCk/61yBGFKvtw6yA2P5/
         WJUa8simCWga4ZXp8FrbspU01JJPe+KPtTTIX9RcCQOhTL1053X5UqCeN5keyLduWsaV
         T1mh3hs6Ic4rSdkHNW2AoYCJ9AGqdjmaZkybRCx4Lkq9m1RSwr1Fl2dvI1adwJZCUEmg
         GT1qjoUYtvintMZ+rI4PoB3yaxXfSgX5+6neFKMQ1nbv7md7Bpxug0VnBDyWzYjuwBTp
         iLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779181; x=1782383981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9XxsU4nXDbAmyfXiIossdiRMmk/XkYgvNEAKNkHFm0=;
        b=f04MuFTKD167gp42up8lyfQawlme/Mi436LceNwGpnMyuCNcfyWN5wMsBHry/o8Rkt
         +XbPiWC/4chE9NSm642n3OpxmoRMz8yGXZ7syPi8aiHbBI0wOu7kE/2xFWY78LTpmP6x
         SE5Q9Bjd70TYW+5xVKsnImcRSRV2tay9fLfcdbWmBuquloUHa0OoFHm42KsRUwNrrnUq
         sYxCSznNC6ykzflo3hSo6iG5fuzs369RdMOXbBkI4DgADgvT1YB2cpKVxQCvzWahYhTU
         0McTrEMxLsRewVGmNxWicIA4jL9DLzj6GopibeFaRi8EZhRPaGgXaVKPkb5RXQapeGnx
         vKUQ==
X-Gm-Message-State: AOJu0YxpoMwgC0opwzjP3gV5tasnUG8fpHozEGN2soUd+fzEI0EHWeql
	WKr7jUyukORqC+OFd2pfXrCGsgFmvE0o4CyR89HXXeUUJwNGFQl7dAN7
X-Gm-Gg: AfdE7cn4jDWiEdOmmUA75ExZTQZux17H+QBHf+FlqYtdbKCFag5bsYuSv6IofZBTZ71
	Z+ngFIQZGTzGl9szJao8GUWC11w6WhA1FM8xfbVD3L8ySmAF0eSUejxZsaeNWxxgUjzuLa9kcXt
	8GAFm+O/4EPuSvhONrYBFDjzQd0PRYGrchAkQBDL+Wyjvu+JmrTjPBnnWdTA/56ajJiU1jbQtX4
	M2E7IZTONnZCKWZx2IG58JbOL0w0XNYcyoUOAQb5alHNtBlgYz9pxxeZ+o5f/YFer8HeJbHogdU
	MYHZKTjLSisudHxQ1hYNLgEizwG863PIL7xZFABohDNuaZyctY84f1Ikuxr80UVKcMEQCdgD/ZA
	N0HYiXBLMfc/JJ2biC6Rt4b4S3CVgdlG+t24KRUS5cMSGYeHD0QBn+MAeCO8B+YSwl21a4iNg8f
	uqpZCGJO/WxuMJgQbkITI4GFJTvQlCALNk3MZz0JlcIVlwz9e9mGyElT5cJ9AZPKgTAH7xXoJ30
	D0iR9I=
X-Received: by 2002:a05:6000:40ce:b0:460:3210:434a with SMTP id ffacd0b85a97d-463ae35064cmr4719933f8f.43.1781779180580;
        Thu, 18 Jun 2026 03:39:40 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm64727672f8f.11.2026.06.18.03.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:39:40 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <985a6e85-3c01-4fa0-8610-9070817da99a@gmail.com>
Date: Thu, 18 Jun 2026 11:39:37 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] drm/vino: add DisplayLink DL3 dock skeleton and
 plaintext bring-up
To: Mike Lothian <mike@fireburn.co.uk>, dri-devel@lists.freedesktop.org
Cc: rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260617151249.2937-1-mike@fireburn.co.uk>
 <20260617151249.2937-2-mike@fireburn.co.uk>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260617151249.2937-2-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike,

On 6/17/26 16:12, Mike Lothian wrote:
> +	select DRM_GEM_SHMEM_HELPER
> +	select RUST_DRM_GEM_SHMEM_HELPER

You don't need to select DRM_GEM_SHMEM_HELPER here, it's already pulled
in by RUST_DRM_GEM_SHMEM_HELPER.

- Julian Braha

