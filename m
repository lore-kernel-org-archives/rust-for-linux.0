Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C394E3E168C
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 06:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835907; cv=none; b=jaPlO5/yk3bo1X4J6+5WbdmJBDrGFTw4Vy1liSaiDoXvwdZ9nGhJynOs4/j3nTp032t3Kqc8LE8d9/xQIhptZg0wqiO0L0AE5QH7ZZuC7o1hTIHc7LmpbeTMQTi54wKIzB66VxU7d7WGP2WThOFP/0eU5DnSAGRTsuYc3Er8YOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835907; c=relaxed/simple;
	bh=CuIdV5VrftBCONiR2VTHvhJ7dRW+tausNZFIdyCd3HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS0O6c+bcy/LU3BTWjwc9sLbDhVeOO62fa7BQhx9y5SfglQTC1iLqWC6Dg/al5pw8XEG1JpmU8TGPSgUDXsaHiknAgWwrXpGa4hcBWSy/0kCNUeO2/SfKDNd+laBhTbYQ4QsDidLokTYsR/62P5ABZxnxjYRf4LfFporj9Vlew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0ZJE6hL; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0ZJE6hL"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so3798421c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 23:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790835904; x=1791440704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWianhRz6JmVZ+t3LJGj+9gNABxqIeJX31Clh5irBFc=;
        b=d0ZJE6hLlYbQhWiYykk+skL1mtK05Yn911sIN6RJPck4KZ06U+nM1DeDwtIHhZ4uc+
         IzDWGDtT5/FTj8LeSY3HJgW/Fm2NXm0doaAeU9tr5D/OBknvMQJA8RjTuXVSsyoJn6dk
         WmwEBZotJr/P24mcigPhBqqtrJUyptd56QLvlfBMt/NBLCDxu1xAEWd+SDHfuNXd7mtC
         g53aRwX39nlUHE66E7K3OMyGXh40ek9EDZGFKoS53MjoaOm3f6hhHRMP6vwtjYhyVK3B
         o0EqodMzU0XMw24/c+Z2wcnsLNThKQ/uVcPwrnejfmB2KMHNYJWxiDEAmwmtm6o0SUP2
         o4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835904; x=1791440704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWianhRz6JmVZ+t3LJGj+9gNABxqIeJX31Clh5irBFc=;
        b=lbLuSsxo8otwqAZD0jqmYxoGRuJ07qdnHeSC83bfV+87B8XyzirxtWL+L7Bj8ln9LZ
         2VE4UmjjxlG6IRJFTe1PuHTDNzcH/VQv0M7mqg47txaGBicVEOfmNYg0FrhaDnnVC5y7
         V+iknY/bDfzoJxfc1wPRph3SvmZX06Ws+Jlau24NtI6hXeDabbA9gh5nfFLv0JocTfDg
         AnwFJjXgIyo5hS12f6wWpnIUJFmyumS9XcTGmzOqddcgMtWyAFJpsyQZlUhnYScF90sY
         /caIZG5Fk2autLeR5XU5dM0Fce31GqzEJmJCqOg3XuwBkQ02qN9T3TI5/9LDOQPfgSiH
         1wUA==
X-Forwarded-Encrypted: i=1; AKwUvBwhuyX/Yr+91zNHXY0YV5Nal9+whr67RtqT9vqiZEl5eWJxDJJlNPBSjK0646M/ZQ0HRK9KkittMeoCgIzuNg==@vger.kernel.org
X-Gm-Message-State: AFuF++ksic/v+CNzbS11dc9+z/RhZGwJr+WkG/BSILoeAjieEvJUCsEG
	8c1zyXX2SUBmI/hC/WRtZaOqbqDxa3k5RMLXOQj/tTE7ZCkZ5Qezi/Z5bhpbdUAplow=
X-Gm-Gg: AYBFou1P+eG5DbWU2GCXIVk37EeAXYcs1JQyAHsjkGV3dBZs6wuYpw+/RFA0RF+3hti
	pZE9vievoi6eV0DwcVkGQ3YFv/mdYITd5cLuRyzaTLzS53xjVzST4RUOz8AVxo1uqJNzmmegf+X
	NNNd7FnEVEtDz8YEzQEhGFku+tzvI6o4Z8NbUeObQY/P6blskUWWLciwbwwSBumrb3uZoaIv+Te
	sSws0xTbUM/uYh/MRbLyYEzkzTrFJ3gKOw5HnHGWPtLaABJ6DnmmA6mG0yQbOs6z2lW2dfyg8XL
	oZRpPHNybELkOa15cBYvkdhhAe9R3BGl1CJcwAnNvCrhqCAsVaJXAqEFp+9skQ3pZG0SIh3zl0K
	4DunsdHwTeDI2u25X2UoTOj96kx4eYf4/S0kfw/NIdGwwoBl9tN19U7F1VpWB05N4NLWjlKEdeG
	UMD9+z4nfdQyQqgwZVa4HNLz3wOFohco0A+dsvOO6LM5tD6Ni5oNL+J1c4UT9/66lt5sNgh2cEg
	g==
X-Received: by 2002:a05:7022:299:10b0:14d:baf5:c40e with SMTP id a92af1059eb24-14dbaf5c56amr1838510c88.8.1790835903723;
        Wed, 30 Sep 2026 23:25:03 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df359ee25sm5135037c88.5.2026.09.30.23.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:25:02 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:55:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: spidermana <xuyiwen14@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, lossin@kernel.org,
	mehmet.mkoseoglu@gmail.com, ojeda@kernel.org, rafael@kernel.org,
	rust-for-linux@vger.kernel.org, tamird@kernel.org,
	tmgross@umich.edu, work@onurozkan.dev
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Message-ID: <ar38vCqqekY7T3SZ@vireshk-B250M-D3H>
References: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
 <20260929095539.1398671-1-xuyiwen14@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929095539.1398671-1-xuyiwen14@gmail.com>

On 29-09-26, 11:55, spidermana wrote:
> On Mon, 28 Sep 2026 19:17:08 +0200, Miguel Ojeda wrote:
> > The From: doesn't seem to match the email of the tag, is that intended?
> 
> Oops, no, thanks for noticing! Please disregard the tag in my
> previous reply. the correct one is:
> 
> Reviewed-by: spidermana <xuyiwen14@gmail.com>

Please resend the patch with all the fixes / tags / improvements. Thanks.

-- 
viresh
