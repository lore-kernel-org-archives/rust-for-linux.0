Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5A1F4733
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233335; cv=none; b=caoAAZgKhMEu5pbEA4QUuL/dXHKpvVG7oB4JFbHL5fQ6WKxoGEJYFoUz9TAFyNGFYWNsnWSjfoYh0auenOJhWcglXMC6ZzUgfDlnQvP+edgl63k5Y+cbcHNkR9wW22e++wHyXSHkezTcY7J7IQyvl3pDnDv7e60xcZwdZpc/N5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233335; c=relaxed/simple;
	bh=swAdhm2eapOPHzUUlpD6v5igVWTBbj4YrPwfSTMXPjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lq/7OQCmS82YRO1d8VHcoZgtPr2BAKPOo3yjOdJ5X2kqq0wCU71BNLmu2p7JVV4QeHTr6VcelSWPn2DR+p7l3wSWe2QDd93dqJnY4QKUtQBcfMvjzE5PkhkFyHZgsvmV/dCWXC3tbY4xx4ElnG/FiMHXLNp8q222s7/R8f0LLAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=pbubcHWY; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="pbubcHWY"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5f25da4f999so267530eaf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 05:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1733233331; x=1733838131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC808OH4fso6bInT9VuepjDrgNBDvQNxVS3LcD0axiE=;
        b=pbubcHWYfsTdwHTRs66yTuNa4iXGgrc/XFdHnPvMQ40zYwLONntpGo12bVLni6w9Yc
         wdBo3n3Uz2u2JXdVXkDpeptJHUcj+M0GJ2f4V+6bToKfMOyo/zhoaQceu0urmgL3PAB5
         CwPsjkvRlpD5/tv0iBGal2d9wiNgaSB60BuSewN7IBtGB3jvw7qvcFqEEveaQ1w/ye5d
         plsYly6TLxWPrahgvOqmAOWHpFZY2qPOTSH83yEezVWK5AKk/BnONFi4nxB9mWLK52Ex
         JzMPTRzchYpDaPB0a+v8z2K0wRH5YN8YyNEt9LvsW66uZnnFa8LTyI7+c0BC8UrhYnq9
         iAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233331; x=1733838131;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC808OH4fso6bInT9VuepjDrgNBDvQNxVS3LcD0axiE=;
        b=teMfjpo7s0TQ0CojOtX+vGJjWFEkXAv4bbDgqX/V2aKx9DtoI014/BdCXc5WSfLP6x
         qTy2tLezzvHpuRa5LcmQis0SxMXjExIc1Tf/8ImWDJgtqyL5Au/15KXsdMHbJfw/w2lB
         v3ugs/WTxJxo7GxtRFVHJEA/r1e7tie2scCyAMfXzFB80xO6LP3KvKgvDf5AB/FtncdW
         2ucQLDeeoRPUty2JrkNRzcdUWUCKw9R3WbUxPU4mST2foy1xfVPoLZoOwzJbe9SPZ3F+
         LXvuXU3UW5nZ9IOy43zJnaeYBbX5+l4aFuA/lv+mnGmGcu0R+ub3JiR3Ho+CXgDPqZ1m
         SB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFoKwI2jhYeO6AT6PV7Zpx8J3h6hvVoa+yNqCIvPEl93xFofCGA8sc0lSwOpWqAvHBL4/Gfe4H0WApROIpEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0tQPjoqwc+j3IlFofnuIZUAlpdleRm7SyTOfM0P100Z4xoqe
	R7Wpb0CdzibCRKcS2h1vn5Sr1O+7EpLNHedCs/RlpZ5oC3esLoGFHxVdii0xvdO3Nrf+AhGwHJI
	a
X-Gm-Gg: ASbGncvt15tOP5HlUyc6GZgYiWt9McuZzwGvFE071qMAK+cAAPnMQpXcJFGDRKyWjyA
	NMtY8OC6aB7bpiOYwVFlElQyzYRPkzfkS5UhQv+yQ48VgfDcK42PRHLXz1hLxYe1/jxUIroFppX
	P3fvgvTE03gnafwKZsJ3n6foHu0nUVOvtwp5c9w5DZlaqlk5jp0CP5UrKjNJS9/QRmwpnmFqee4
	yi8oO9AsxEO+GC71FJY20ChruP7pUBuweBA/H+wMb3bMg==
X-Google-Smtp-Source: AGHT+IG9pT2mrXevy6o0bm52Erkrf+w3fU0scfAFMj0oTw55yoG0N65LlD1tXQIzU6UaLc+dmzgsgA==
X-Received: by 2002:a4a:e918:0:b0:5f1:e905:bc93 with SMTP id 006d021491bc7-5f25ae0e5c4mr2010026eaf.5.1733233331308;
        Tue, 03 Dec 2024 05:42:11 -0800 (PST)
Received: from [127.0.0.1] ([130.250.255.163])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f21a4cd86bsm2782124eaf.29.2024.12.03.05.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:42:09 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, boqun.feng@gmail.com, 
 rust-for-linux@vger.kernel.org
In-Reply-To: <20241130094521.193924-1-fujita.tomonori@gmail.com>
References: <20241130094521.193924-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH] block: rnull: add missing MODULE_DESCRIPTION
Message-Id: <173323332913.59116.9985316859123945765.b4-ty@kernel.dk>
Date: Tue, 03 Dec 2024 06:42:09 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-86319


On Sat, 30 Nov 2024 18:45:21 +0900, FUJITA Tomonori wrote:
> Add the missing description to fix the following warning:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/rnull_mod.o
> 
> 

Applied, thanks!

[1/1] block: rnull: add missing MODULE_DESCRIPTION
      (no commit info)

Best regards,
-- 
Jens Axboe



