Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099131A567
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892684; cv=none; b=XnC115pK+tBCzMIO6ZI3TlOYZ+ZaZ8CuF/7N9x+1+9b3GcbOIPcks7knb9HWxa3k7l4Bug7f95w9/rekoAD3xSTcmkBk27V8ngNxds048n0QEEgZ3ndSy6ozfwLLn2htz6VZgDXxqdebxB2BDSrTkivLth9aE2g0NOgtkXPkBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892684; c=relaxed/simple;
	bh=vLnIWUnT7L6c+HLKibZGqAb1vjAvLoI/vnRdb+HoAdM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nAWT4vez2onZoT4TMPKXSFbTrueeuvHBsdL0FaNskasN/x7WyoFdWU9qI6tA9/O0N6zn4gBxYjsvaRlIoHkJs17nVexp3ZhnoLtJQZo5gKz73m1/idCdu+nDirguRuBTC7dkOIiualc90h0KTk6BmMnAjhk0+mEq+A6tZFSbdAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=rhruCnxJ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="rhruCnxJ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4855e69a4c0so4008518b6e.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779892682; x=1780497482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/ujAwvlEauNK8MqRmCBOkRamDg/525sCRmIkKVYiQo=;
        b=rhruCnxJ4saMk3c6lgLfJCIZ1yh7LMUPis6zFWy8eAB3P/iqKeePj3gZ5lfXzeNjy6
         m7N721nFPYurjFyhLeDfifKJu/6+cvhhffoyp8aJ7mDuuKicDMJsFd2FKzkG2sv2L5+T
         5r5mUZczVv5Vkw9ve35r0NHISZfMnC0WDVI/qhX/5ZmqXXTj/jHaaFXGWa34V9urLU+o
         3+DuMdCrB82bPGpKs2AorD2Vph1x3BVpnwSGqAIsj9xl20vVmiYElp3Xob0jNS745Dfb
         CtK5+UYJLQLWxVShVS0gUdSLPafy1iBLt76RI7BO/8wRrmGS4SIMyJlEcwmj7S6AfiKc
         snTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892682; x=1780497482;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/ujAwvlEauNK8MqRmCBOkRamDg/525sCRmIkKVYiQo=;
        b=SKnlkme/7T5ffhYBVJCeksu6wD3ysar1tcarumz5pOdpJdzYMPzH5I2l2SCUFbkFO3
         X0YchM0276wNAL1m/RLlX/On3FQ1+c8eZ5pjSnC2AwszF2nsqA3IvBqbYS4UavCDtWhV
         WGa1+hX2m+bEl/MuKy8/YgGpGNKp+olZ+BKeml+YedFvxytqdcb528QQ9bbNLVqJAc7w
         qJ9hiBUs2oshoTzyRgtKFP9AhtyRBPV6ZRcbczmZmIfH9sumGXBRzyokxl/RBhFZY1Jm
         jqQrth3X74j8M57WBT1tDs5ruJyDFznDqU0h87dgJGHrIQZ1TpITTq4TKeZCmjEXKVLm
         JMnA==
X-Forwarded-Encrypted: i=1; AFNElJ8xV+2SqgZZc1ZpE+1S6KM2zWYDHcofUPDkHR5Kst2rKwGOGfUtn3ETG/coilqBzOFTa0RtIzv5f6ar5D0yCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxahPY834psEPx+5YMHQ0FylzObayn/eRcyCxd4XwGkZhsUeHpP
	wa8GeKGjzPqGysVs/W0xikuS79enCnfBonTZ0SGE5p0Vr21houg/ZGnkGwjyrY5yiU4=
X-Gm-Gg: Acq92OEEgY6ZLCwPEnVmybJLzD8sG0UAKqH0BoyT5A+xmRxDtmn5OHaL9l1i/+M2TXr
	luvyNWh5sWzuYBy3GT+KGhNH1Klan4z9MFmIql/Bzs/p/kaYnIhVDP5Pox4ArpEAUP2m1golVtV
	sVP2lNA+kmyCziG7zsHTb0VMTl5baSjSPnAaos1Qt5yi979Bn+OQ6uOKu0BowsS8fH1PEn+dkkN
	UhkmCssMeVnwJfOT48372HU0CKfLP2GhwkmKkY7j6YiWIe3SHdzGiuTcTKvx+5TKYdPThql5P8T
	EI7zsCmUBBKvFcClGATOMKQN319DaFGU3TBFStBWHszFAH9lksY06ZrOReLLsvNdvAxrY08/ZKA
	kLD3YeiAKBNhn53Idm+1AjPtoQG7GAy+RycZ9hzFrROUe0YxxCeQERzT/8DZaWxm1JbnoPYF6WY
	gRpE7UCpFyTgKKLSi677BQo7KWmKPbRdKKPoULhJ7wZEUp4u3bPBrXo0uHdX4LvpLFYdoLLAKTm
	0w=
X-Received: by 2002:a05:6808:c2d9:b0:479:f370:fac0 with SMTP id 5614622812f47-48549ec2492mr14461494b6e.18.1779892681940;
        Wed, 27 May 2026 07:38:01 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b6351a772sm16950878fac.3.2026.05.27.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:38:00 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>, 
 linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260527-block-for-next-2026-05-26-2200-failure-v1-1-4865889e282c@kernel.org>
References: <20260527-block-for-next-2026-05-26-2200-failure-v1-1-4865889e282c@kernel.org>
Subject: Re: [PATCH] rust: block: mq: align init_request numa_node arg with
 C signature
Message-Id: <177989267992.742656.1381719020976456974.b4-ty@b4>
Date: Wed, 27 May 2026 08:37:59 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 27 May 2026 11:18:09 +0200, Andreas Hindborg wrote:
> Commit b040a1a4523d ("block: switch numa_node to int in
> blk_mq_hw_ctx and init_request") changed the type of the
> `numa_node` argument of `blk_mq_ops::init_request` from
> `unsigned int` to `int`. Update the Rust callback signature to
> match, so that the function item can be coerced to the C fn
> pointer type stored in `blk_mq_ops`.
> 
> [...]

Applied, thanks!

[1/1] rust: block: mq: align init_request numa_node arg with C signature
      commit: 6b2f3e4970e48e70c10111366f59f908f2ea6f96

Best regards,
-- 
Jens Axboe



