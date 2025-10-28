Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C1242D99
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650770; cv=none; b=mNmrdMPQqXvSrxoXEOMGDA0yhEZhwA2IGM9MHSp1CP5k+/q9eiGZeBE1dWB2eiY9sEvJxOHn/pGtkmdUOzV4fvbBF2QJNYQr3LKM8Emt0FzryOKjsR8bIPNZ+pQ4cQLW4tQe9vV2tBXze1/5hQA99fL1rQYbs7uqEJU5fx1Bvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650770; c=relaxed/simple;
	bh=ZCJbG9iuhjEAYwcKvADDuXGSGM6TrrphpYFSNn8i8rQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ov8XW7YkC0gwGBl+m1FMFydw/C9+Q9urHj0Kc//JHuyltDK/ug4fOSSfrALr+StQ2cIP6aowxa4qvIabESHAFBNjmOdqNbJCQYtO6OK7qJ+pONE0xKthhQoJwOX2j0J1exYKed7qa6Rwh20Vs8CX+z8KClSPBPeUsj/ubKcrABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dw7GFG/l; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dw7GFG/l"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42814749a6fso3035212f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761650767; x=1762255567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1gp61VUQ5GKZJ4rPcQiEWjfVo83pc6GczcZCQWQ3ucA=;
        b=dw7GFG/lVnXmhPPQKuAIdxBaaOJR6Qs0zrMcDPxrSdQan60pvmOB9JTTr9+/nmYI3K
         0/b2gudTidpGMiaMxcW8LQH1BeNWJ0y1L5kcwe9qGylJ6pQI9ygXDt/t/+A/VT7Ps0sU
         pp46pjE/aCcrFtPwk4HE75k/AXEr1AegLU/TwX+NKyJpNcuSv4Q0YcVPRizykhw6+Rjo
         VJKbOQqUEZvbXKUlLBs2Bie2AAhcIUVcMDuXxSr0Xj5EL3GEUQj6JQ3vFqR7vzHEVAbs
         VugCOZ5wOVW2U5/a8v9JWOuRY5/naunDCxYucezrH3mHlicfzVKcx5byIr9LevdGYLOq
         LHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650767; x=1762255567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gp61VUQ5GKZJ4rPcQiEWjfVo83pc6GczcZCQWQ3ucA=;
        b=dPdNUusqURt28K7Tmc68shXZ7xQ42LCP/knWqjzmNGeN+r9kLNAT/TdJ1QQmLtf4bg
         1IE/uoqmK2pWwGDq2lQGaKdr152+hJJ2qYWdb66dbbauJc3/vwjzDRnXpesj84ax2y45
         zGybY3g27fAK+v4m0XI0AdZX/A9yiF6KeJgKaIRi5sZIKPEwwUySlbdCxoggzIUvn4hc
         pLVt0fKqA+Aj8ffwAyY0ahx4EnEm89N8eoEB1EdpMS0GRfOnmZu53L/1C8yodu/SfE/t
         pOOTvqJZ1CTH7JYRph2YvVhCGxrwe2UeecpO4R2OV433sx2ZWv++DfTt6808Iq7XYp+J
         CbZg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVJjJfiRhoWXjnqzCdfFU4L2tqTvwIZys4+7AMyAKTocKag13VNLPFaWlSH6R93LS9GGbcxNm4m0yQ0+nvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/oTwo5+/da3XATU5sytDwKnylmjoLWbuzw3IBQ9YOR2NHfPg
	PWx3lK3qubbv92m6otLaRbvWYImPqVxczlYcI7tjDi+925VE3vXaOVq4I+AF64ddfKPl/XAJ/Ha
	SoTLSbkkEpYFH9IXk0Q==
X-Google-Smtp-Source: AGHT+IGCjLcER1nUmaNB8byqj93U1927D6rJQzvZKoDx1wLR/EqOPj6MzP8Te5ivJKOxZOUP2tIzFY+jEWEGTmw=
X-Received: from wmgg16.prod.google.com ([2002:a05:600d:10:b0:475:de83:8f42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a89:b0:427:72d1:e398 with SMTP id ffacd0b85a97d-429a7e9e27cmr2796635f8f.62.1761650767471;
 Tue, 28 Oct 2025 04:26:07 -0700 (PDT)
Date: Tue, 28 Oct 2025 11:26:06 +0000
In-Reply-To: <20251028104433.334886-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028104433.334886-1-dakr@kernel.org>
Message-ID: <aQCoTpzBOp4tvKTx@google.com>
Subject: Re: [PATCH] MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON
 INFRASTRUCTURE [RUST]
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 28, 2025 at 11:44:27AM +0100, Danilo Krummrich wrote:
> Commit cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali
> GPUs") introduced the Tyr driver for ARM Mali GPUs, which is maintained
> through the drm-rust tree, hence add it to the corresponding entry in
> MAINTAINERS.
> 
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>

