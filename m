Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C173AE707
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133195; cv=none; b=bmxcAWy6GFYEvQggc4OWnRLh0LRNuhPfbu2cHWwMIV4JsY/ZQQJWNEggCKLRB3tbgq3yAXO1jBYKxQ2FgwyhSJjfylHypRIQNPgT6Vgqfo9eHi17TsobNVa6viXsUN2u7thx7YAM2qKjeXUWEDW8wbk5j4vELwaoGrEWVEjEyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133195; c=relaxed/simple;
	bh=qNfUwrpCiGE6r7mkqFjE2Xl4k/fEDgaTobIVEGwXXO8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzMaI9jQ8kW/Vth96kRQW8QbyOss25Vra3pcuq9S95Cn71v6yndkO7DWLlZF7+lojjy43SacpRMcC9RB+IpaEcRg07VcRMUj/GtmpbyvSqZsICeP8YRfJW8tPzPiS7AkgiJ48nDArP4aEO/+VptRS9MBvYgtnmmOuznJlnKg+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QeuQUfBR; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QeuQUfBR"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so4666019f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133192; x=1770737992; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmnn5t92lSnSpuZRAJvJB0gsvukMfI2txyxc38rCEgA=;
        b=QeuQUfBRKc3Fc0g83D574NsY6wwQxgSkvFbUQWsoMNuBdwWJIv6upOZyXq74IkuIF9
         GFGtnvOS+s9/lM0bis3waWMSB2Dr/uDgGJtsaJLaUV4Y6ecKxtA8kP5QhLRtsWXeVQ1E
         VHl/7uIP7bCCSROFGkj/46LIxnrcj47bfP6kYcsTcGNp4JcVWu4a3cbueJOwhHWJku1n
         7lQcArvNuetWJwab4hHLSr7J0ayOyah6TgbTXrtODYMNaHO0SSR33L4Q8qHzgpY0vVxX
         zwprPVa/gsS8XGBUu49afxNS2sTJV11BavWKXoDrXfSy0ApPtw14xbO8jFkz/kWwgS1V
         G3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133192; x=1770737992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmnn5t92lSnSpuZRAJvJB0gsvukMfI2txyxc38rCEgA=;
        b=WdlSIkWEMHwebDubx32hm/rmQ9CTRt/2sjc/l0ImMMYZe7h1ruTtiABNd4PHDZef6q
         J2u38D86OnV0O6V8Rh6kX8iJjxkg2JmnUxElmPgXxwegLrtYffS2pkH3r6Q5sAsS/X/I
         AKqAT4RYRLnE7fq63xSyCR+zBrNN11lsbzbLdQbLStNU0G38BP4JJpZYheefT/K+shMt
         92QtsZ32EuxBMLFS4yCEpQQYEKvYR8puuC/4zlj7O8X6Fvf8nMZi9FRtO8YNaj0sfQHq
         MqG9iK7CYWAMxHT+5GAal5uzmxVudVnUEmXcMnNVWMwm0ZTc4J/2c9qCNirQSSWvaPEl
         Pj1g==
X-Forwarded-Encrypted: i=1; AJvYcCUTH+3RWvwExGWm9f8dmryIOtBZRpG8GCbCwnuITP9e+tLn24Kk492VePRpA+OyuOm0ZDFg2OuRNH5JJtkOeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8VnilnV0bVKXgButmdM0fbrhR3+EhMAgAPHJsDEGY2iJQOIZi
	68mfaXqa1O9tTiLc1pKgVfSn2fQJdAx4fblchtBXvJM51h/6IOmq2zwP3vSrRLuxqVR462zfHAM
	xsiTGTD3rQttaqMHokg==
X-Received: from wrnx6.prod.google.com ([2002:adf:ec06:0:b0:435:a287:83b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:431:35a:4a8f with SMTP id ffacd0b85a97d-435f3aaf7d9mr23133470f8f.47.1770133191927;
 Tue, 03 Feb 2026 07:39:51 -0800 (PST)
Date: Tue, 3 Feb 2026 15:39:51 +0000
In-Reply-To: <20260203152818.317806-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203152818.317806-1-marco.crivellari@suse.com> <20260203152818.317806-2-marco.crivellari@suse.com>
Message-ID: <aYIWx4VKJHe8Npp5@google.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 04:28:16PM +0100, Marco Crivellari wrote:
> The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
> respectively the futures replacement for system_wq and system_unbound_wq.
> 
> This change introduce system_dfl(), that use the new system_dfl_wq.
> 
> system_unbound_wq will be replaced in a future release cycle and should
> not be used.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
