Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB3D27F01E
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764740923; cv=none; b=CVYQDBOapMf7NNg7xIfaG7KkPphGMFVqN1DNhkZkwAG93TgHkmFcAy5nHyhy3MWcp1+jUAQV1BalLDf+C0RrNiLmiCFe6MQVlyHibk52Vef/VCH1DgmmQNv1DMQTWJRkRCxnVYdhDAH07vle2ENWMi0++LLNGQelnmmOUU/5cZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764740923; c=relaxed/simple;
	bh=QOXLxWx1f91A2ezRoFQpXoqA4u3WO0ay954toGFKrYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKLQI5AhLWs3FDlc47Hxp5ksi1z/sPKmHeoKLCc+zXNnN0RU65keQP2PhkmSqpDoEklzME0oAh2zOwXv4/oFo9Lre23FOLskqm7lfl0SqdI4UcWyw0H6sZcyhr8P3uBjiiNY5K3I1Rd7AmAwt3vHQ3yDWHp/j5CJ4iIBtA03SPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNgufZtd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNgufZtd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29806bd47b5so36071885ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 21:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764740920; x=1765345720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Um7WZrOc52htQuQHI+IKOO/kj8j/l/2iMMPC4W41Dw=;
        b=bNgufZtdUuxTMmIPn1Mkn9xIdyQh+kUfrSk5JdtV5LJcb8fuDLWBubf4oY1aKJ5sWL
         TBJX2rmo3ToBqOE9hZnwIuqw6PiUmZSSjyP6hg75ksG1pbjEIgKr9EoXoBuoNu9x1kn8
         9Tnm8sJjQbbLD9cg8XgaSnCquRkzh4KzIzGhnYRAKtcattVUjK7lws6PiSveDrcO0IJC
         Hqdd6z7kShJSkLvnP4J3J49dvMzDFf/S9LiHnsN5bdbLRHrUSY3xViKEtc4DhACCGDA0
         9NGqtbt+uwnnxUqewMKT2S9R5svSHx6qLLnWtC2p1s4Z1yeuXN6qIJtw+utwDHCyHWnv
         BdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764740920; x=1765345720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Um7WZrOc52htQuQHI+IKOO/kj8j/l/2iMMPC4W41Dw=;
        b=CHTHathNdyNu+wOLDwlw/GqBOLT7NLWAyJ3KelQfCJ6Do2OCaPBnpXyywkcrG5GIdj
         N2NzQ0XTstq8tSufFmFGw+v5U0qt7nsUhXv13Up++Yy681GZi4AHVjqp76vND/zT24jr
         KzWE+1jV3Dolm4K1A7SOq2UOZiFfszoI6wofDgC7xcDQoiDMEyNkJI3CAreT2xwJU5Hx
         Qmtejv9aBO/rwm3glx3jxeCkUA/BLybk5Se7csH32Qo3gx+mZUd5EBIHLrfo+zyzFYFc
         paUCWQOg4b5V/2MdQPmdpzI+K8vQ0bIHTRVGjLIQQQ48WLkUwpZsZCIWrV90npSXyTvh
         /9wA==
X-Gm-Message-State: AOJu0YwBoseLb1CRYucvedeHaXFb5ORLCi/DylyP5K7H3GSVOBWkNEOS
	4kRcHIo/V2ob43dhyJ3u8GAnNa3YFWc9dwqCRLtOfLudFeaRDXJT/3H3LM+HxSVaIk8=
X-Gm-Gg: ASbGncv2CTaU/NLcBDVzeQ3BSZwScs9rbX5VlNJFUmakzkaz+0BC5Fs7ECjCCqEpu6u
	1AgBvLK/dCGZ1jN8B+wiGSD2TsIFgM385aCkvB5eue+slt+vUViTXBeSXxVWmN5N7WOP+0HicO5
	rAynkEkLpl3bH9IunUxYaJTDJGStGaTiXJYHP+ju2gGJkSKb8wPjFtsBk4u3b/gg4RMPkn4AjQh
	HHMQ8H5w+DA6IKPTvBqIPzb3e0imEC6eZs8hnPb0RU/B0sNHEVfxeGcMveCOkeNXqRJR9je65Yu
	wy4yajdpAhzVKCDxLus7DU82ODjVI9WzXsFy1amKpszRlzscKGiKFvsh3W7hsiLI5LRGwiLfmZI
	C2cEmkDUzRhYPZDcEcrsohD8Yk1xcYaRPAjf685Trl6vcLYDiSPMMTtOj49jUd3ZLOb3UoFsMOY
	mIOlpNvZi42SU=
X-Google-Smtp-Source: AGHT+IE/1qLWIAoXXmBzs2FAgqz/NW7C8OfqRH9EIyc2L+bzyq1dQjuAmwkNxtLdw6O1nx1Nmewmjw==
X-Received: by 2002:a17:902:ecd2:b0:297:dd7f:f1e0 with SMTP id d9443c01a7336-29d683b2842mr12705915ad.43.1764740919428;
        Tue, 02 Dec 2025 21:48:39 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27691sm174413795ad.64.2025.12.02.21.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 21:48:38 -0800 (PST)
Date: Wed, 3 Dec 2025 11:18:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 11/46] rust: cpufreq: add __rust_helper to helpers
Message-ID: <fb4pcnw7a252oqrldwmga5m4bijtenkoo3smktns5jstwocdnj@2qvb6ceh5gu5>
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-11-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-define-rust-helper-v1-11-a2e13cbc17a6@google.com>

On 02-12-25, 19:37, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-pm@vger.kernel.org
> ---
>  rust/helpers/cpufreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/helpers/cpufreq.c b/rust/helpers/cpufreq.c
> index 7c1343c4d65eaff6f62255b6c9a9a67f89af1541..0e16aeef2b5a696bf8974f37d9e5e3c24d999f40 100644
> --- a/rust/helpers/cpufreq.c
> +++ b/rust/helpers/cpufreq.c
> @@ -3,7 +3,8 @@
>  #include <linux/cpufreq.h>
>  
>  #ifdef CONFIG_CPU_FREQ
> -void rust_helper_cpufreq_register_em_with_opp(struct cpufreq_policy *policy)
> +__rust_helper void
> +rust_helper_cpufreq_register_em_with_opp(struct cpufreq_policy *policy)
>  {
>  	cpufreq_register_em_with_opp(policy);
>  }

Applied. Thanks.

-- 
viresh
