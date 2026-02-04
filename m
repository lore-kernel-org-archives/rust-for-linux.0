Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084AB3939DB
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202345; cv=none; b=EEt0Is/jDm9UM2/623IyNyycjKpRoCuYqmxxLfu7J/oY7QJjB1dZGFzqobc/ycy+a5W9HVNVHzijY6K1L89uCghXGYoIbpAf+gs9QuIZdhmH7XnitYyw31UUHFGWA+CJJ+GdpM2OJMaVtcD32Bg5UuHyQMryAXraXIXYqwoPJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202345; c=relaxed/simple;
	bh=868dMbZwHMGdBdt5bDEBMNLM1SHVDeo9NzzKUCxKx+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U7Y16UBfQThf5O/cdbkHrqYJYNnV+Gx6MDZSoaDLZLnFWo5hc7jnzSrlJqF+gZnvZtRRf9k+YOmx5Ib4hfO8G7E1NgDm6k/5XfTwvGrvi7IPAA2g3eg7yyoFUI1RrPPXO/KvcKzR+vbf7TDq9S5PhHIXi42RTQ97jFkyQtRe0bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iics9bow; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iics9bow"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47edfdc6c1aso54226895e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770202343; x=1770807143; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=868dMbZwHMGdBdt5bDEBMNLM1SHVDeo9NzzKUCxKx+c=;
        b=iics9bow1r8wSwRn9gcZIv6+3crxVx99F9vgfSsIaT7Y6GMvX2twgaB9g1V2k/Wmvb
         lBl61sX3Y2FP7WuW9owtqiks48KggmBOWZIeDljL4eougqI3K5wW6opOhXd7e+QUZosL
         INNYFx1RnS0Fp8y6B45hltZooDL78Ibp4E7LpMxdDG9ARMygYIFmPEkGilsELaOCvykE
         0N9LVgVspmdkYIJ8KmS5ULtvQi2mQhcZsPkUNJFDFxVPvWt9IyuUyWALcQMHMxGrL6mK
         8PtWO0AO5wxLyRJGV/RDfjh4qPth8zczcJHG3ODbf0z9D1sMxMnZm7dOLPfz9qHGNxU6
         GU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770202343; x=1770807143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=868dMbZwHMGdBdt5bDEBMNLM1SHVDeo9NzzKUCxKx+c=;
        b=mssf2y33GTvs88Ta7zYfV5WLVIP0pgvpE07uyhfy1zoreTaHajYpfMd4c+7VAOSWbq
         377ZkgZQyIG49qOfzLYs6H+Oc08gJXQTQSP8PZM76YPkC/+Tt6A40pOPF7Gjob5pewQb
         qtB7wXvZr/BauM2/nY1Yq8py8s99Ikky+RaKjdHjaXl+U/yhD0/3Ol+CImtZT6y69JNT
         rKICWxUDoSXNPaYrDfb2LOKkBbmfDBebyMSqox2sDShiEk1w8DaQKSeVY6bU3u624YNQ
         gCpR6/QR9WBAYSGtFWR7SxOI63ciyPOjcG3qZ8RlVEAsQhSE9mTnb6VuM6m3+1qhMcpY
         uc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHfIFCLU8LktXG2VklKzB3J5tPIzz/kbKc0gP3ncNCZk1XpAb0yut8EqojtbWN3e72om4v+T4qrj/dsUY1kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMCb76grgj+iD+XVBmc7Ka3vNaIreOhNPBxPwX3WhVdXUcEMv
	GGQzc3jzHQKdOlpSOMZM9MeYraHspdbUBFfQwINvICX/qbakn4j6EFMUWyAdGq9x+oRokH9OTlY
	0Ezv56Eg72R6joK2uoA==
X-Received: from wmcn23.prod.google.com ([2002:a05:600c:c0d7:b0:477:9976:8214])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3549:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-4830e932c20mr36729305e9.9.1770202343587;
 Wed, 04 Feb 2026 02:52:23 -0800 (PST)
Date: Wed, 4 Feb 2026 10:52:22 +0000
In-Reply-To: <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203152818.317806-1-marco.crivellari@suse.com>
 <20260203152818.317806-2-marco.crivellari@suse.com> <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
Message-ID: <aYMk5skDB0Rk7vWS@google.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 03:53:39PM +0000, Gary Guo wrote:
> Is there any reason that we cannot migrate the user early by just returning
> `system_dfl_wq` inside `system_unbound`? (I guess the question also applies on
> why system_unbound_wq cannot be the same pointer as system_dfl_wq).

I think this is confusing. Let's just rename it here and update the
callers. Otherwise Rust gets out of sync with C naming-wise.

> Also, I feel that `dfl` is not a very intuitive name. I searched the list and
> the commit history for a while and cannot find the exact explaination on what it
> means? Does it mean "default" or something else?

This I agree with. dfl is not a good name. Let's at least call it
"default" or "unbound" or whatever.

Alice
