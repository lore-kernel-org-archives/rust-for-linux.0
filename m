Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8831D5CE7
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730763231; cv=none; b=d1AujA/378g8Ll4s9bmEql3fC7CkXUO1ohfx6PpPiXPz7I2R47GJabQsqTpV2XfWz1zVXrccY2tQewaVWns/kmbIGzmnNiEta7WPRhSSzGRHu5qEAjj8mjXg5WAIhvdIgI+hJAqBnayq3geMZ3jrIwlG7JQAg75FHbmqmPSh2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730763231; c=relaxed/simple;
	bh=xeXFoO6rpGFTfW67aFdtZg1DADblEtbw0u7DA+FvHvI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Act0SQzs8bF/NFoQQ5zWyssvKzg42CjzBrHiY/QodCUrb23vc8DiUPwocyrQZaosu2R2IvxxaD662Dq8vLy5iItD3bUh8gJOn7P4jrMwaLXw7znivBhL4KLIqp8EDO2BA778eLSoC/xsXZi9mtiBMZYWAQZPUCCk0bFiySbx/To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0Fd1xZu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0Fd1xZu"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so3467532a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 15:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730763230; x=1731368030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heuluemexJBQ8njzhkrobyveDd7MJI7zIcl7ZO4hjpo=;
        b=b0Fd1xZuoMIjqSxK8baQj93maRRIu6XxJXB+MHCIozTDNZdp8n/vu48b4im8glBe7s
         2WfCB1/jkh3fpNiLqbIfl0K2TA9B3QIg+lQ8IcjeQSrYU+zC7xDf7w8mlcUbMVDqtCN8
         U/eldwZT4tRYkpFvbZ98WxYnxk1AVamjHp7CHqfPTZ4zkQHGkXb8rdjsfkTqe1KltRVn
         D9pl5zkje4HAHBaJBlpXtgj63ncP5WxSEpQFfIBb6b45R5tb3h0T0OmEFsnxEHETkuIu
         bklh/2c3Q2EbdN5f/48qD/EGmVGO2XaklUB7csgzKtwiylOOpWTCsYDFrsqKd4LPSP14
         Kvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730763230; x=1731368030;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=heuluemexJBQ8njzhkrobyveDd7MJI7zIcl7ZO4hjpo=;
        b=hrG+yKHQx2QDg941z81Ld/S48Fq40h+Fh+tr494Nx9HGt1R8u2BkeuqOfjnXsTw9oD
         eKnutXp67ydzg6vg5lJJ6YUqw8z8xyN61Nk3jJAtCmWH8bXzFKoTey0BOCHCahoEjDZp
         3TKg3c+dRyapcZpMbwYVIbxgV8n7par4yVkqAA39LYO/r6Qu5vS0p2krYdykzHEaztDT
         1S8CUMtEJR8O2gmkzdTYWuVj2SykV5NhDpzsbhPOR9lbE871oLbVKF8W0P3U81X0ibkO
         o6idRxcbUGJ1ILiXmI4/PM9fgx+uDzmjOX+HCyZqJPmTqGoKwk6O5meNPCoXYc3AH+on
         5bZA==
X-Forwarded-Encrypted: i=1; AJvYcCXlfB3dnk2t9SOeomyJYaieBzu2Kj4C/m7Ngae9pUzTTA0cA2qie2GKCwWAh+MoUMOMZWhfHelTVaiaGHxssg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZPx3K9GX1vj5Yn69JWJSJ/4eaatKmNhE2uPtvZNSfnPNNJvT1
	Ro9Y3eP8S5Lt+3McWWDMEQum2ZIJThtu+XD2Ocx7QUstyarp4LWI
X-Google-Smtp-Source: AGHT+IFXLy5kJS7EK8R303EfQrWoyv28kB4v9SgXhNZU2mGKDYzUMVv9hwl2n8xvHNG4IPD5eIjgCA==
X-Received: by 2002:a17:90b:4d05:b0:2e2:c6c2:b3d5 with SMTP id 98e67ed59e1d1-2e93c14e8a5mr23448855a91.9.1730763229735;
        Mon, 04 Nov 2024 15:33:49 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93daac445sm8299663a91.18.2024.11.04.15.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:33:49 -0800 (PST)
Date: Tue, 05 Nov 2024 08:33:43 +0900 (JST)
Message-Id: <20241105.083343.2243442761267649401.fujita.tomonori@gmail.com>
To: jens.korinth@tuta.io
Cc: miguel.ojeda.sandonis@gmail.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <OAtDBYR--B-9@tuta.io>
References: <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
	<CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
	<OAtDBYR--B-9@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 4 Nov 2024 23:08:21 +0100 (CET)
jens.korinth@tuta.io wrote:

> FWIW, my motivation to look into it was the TODO
> kernel/error.rs:123. Might be a good first place to use the new
> macros.

I think that WARN_ONCE needs much work than the code to execute once.

The following your warn_once implementation (from Zulip) isn't what C's
WARN_ONCE does.

macro_rules! warn_once {
    ($($arg:tt)*) => (
        do_once_lite_if!(true, crate::pr_warn!($($arg)*))
    )
}

I think that all the architectures that support Rust implement WARN_ONCE
in assembly. The simple wrapper for them doesn't work.

I assume that we simply can't cut and past the assembly in the C side
so it will be complicated.

I would recommend you to work on pr_*_once than WARN_ONCE; just a
wrapper for pr_* function.

