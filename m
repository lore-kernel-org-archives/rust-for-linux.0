Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77513B2A4
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745000347; cv=none; b=tS/OTxBqYVXUXauFpCnqEOy5N/ClN3KS6uX9tf7vUa46V4vgYbz5YtNFvpW+B3b9c/kxTb1qY6BbGhRfRamFytXpuE0IRORvzK1NxKK/b3wnwdvT+O6M2gVIc+Gh4cGfad0rt8wCNZLIfA5jOcig6qkqoyK++AZFCde4NM73Xlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745000347; c=relaxed/simple;
	bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RufstPkaBKO0o7MvBsovjg9hpRtuuC2oa4rF/pLVgdTvwg/ARe4/SJf7HUksPlViqoTlq1mBA3Dwb5A5jDS9vYsI2fc757xX6P2Hs99SSYQpdJ1STXkF6KcJC9AP3r726bU+O5jwuaUTm+bD0XW8Wry4Jt5vnsU05qdvw7yBXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk5lgV5X; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk5lgV5X"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso166555b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745000346; x=1745605146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
        b=bk5lgV5XiNm5bgInoqKyNkZWFSElqGW5NgyY2KIxGVdPmq4CjIh8Ec/mQCU7WvLvTj
         Ujvr3PGM08ZsDB3iyX3SBqrjr8JHHiRMMaXyTIUZLon5wh0oa/BnYc3vz2aFdHSIpwsF
         2ClYTxBmEpM1e5As5F+eLAHu6/fbzSTnxnJSfVmwyoFM/BXcwu3Fn8SKuMQT3LOzkeCP
         jV1IcU1HtOvoRN0dUZOn8dRFbi5KqMp/9yS5gZs60PaL5EiX4JHzOO0mISDuhcm1dW9G
         zKxpn1KX3Gz1oN5cCITIL1JwE5aS3PzUJI9zkEq1k/GTMt46WsobNqeF74z9geLROZxi
         3Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745000346; x=1745605146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
        b=FA3zGNw9hH8CW/uoqj0lYaLd6W1Z3rptLnoJ8rY5IZENHJ2UmidsruiETpfit3zcFY
         HRINlUflC4+j7KaJrFq3WFpMD3vnqqphxRwZOAKDk2ReWML/QAh9BBYd42qmZ4YaTsk+
         fM5bQC6Dg6gyP5x9KJDRoeMm9FDeXEht+fR4YTp3rOPudEaASdkdz4chr+NKYW2ZH3JM
         QQhL68q+n2sc+sgd3hcJDIOHKHWQkt0IZur+3PSAymh+tnv6rtraatzr75sg/Sz8d2AD
         3STcLpuWNuaQhd3hZ6leZFttHpoIEqM5qzuqV1vvqKB8DiCHowSiBBZSiYmelN3yf7ty
         CQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCUL7pJj535jON9a848nWER5093W7tkj0KSh36WMS0k+Ep066s+clSv3D73ZjEm/aq24wVU7RCJiHfBg2G17qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY929LT4cbkhIaFAxETL2AuKToeYfhAW/g9ImutUAao5efdv+L
	PUI2SWzavg632TnB4hoKebc6oirYL0pO00krCCNUR12sKISQAQM+zA2SoQEmUzOJ17bT8E48kdC
	mIBFHKXaQF9edpaWLDXejHNlp+Lo=
X-Gm-Gg: ASbGnct3EPtFDJwJl230KcXMSo4sCxjuVYNo6YOEpT8PPaR2fwq83c8LUDhx60qJL23
	M8N70zl6mZPH4AEPXW8Qf/cLShoNWP7nK9qYrqgtCw9+PdWcNnFJdHK+j96AlSEKL3u56zfc3LT
	qzmzUYZJsfmJKN8ZE1q82dgQ==
X-Google-Smtp-Source: AGHT+IFV4p50Y316WvC6L326TQ06DuzofFaE8ATLtfwiWvN0aeHQqLZuaNb8xpXTzoUb4z2FpJVX3YSLno6jad/7bKA=
X-Received: by 2002:a17:90b:3b8d:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-3087bbad9edmr2033817a91.3.1745000345670; Fri, 18 Apr 2025
 11:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418165059.560503-1-jfalempe@redhat.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Apr 2025 20:18:52 +0200
X-Gm-Features: ATxdqUFNvn4gbPVQIz8Iq_5t6yfACtcQqcpNAlWXdLLoUUoWOhcu7yBY9nNqBOM
Message-ID: <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 6:51=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rn=
xxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]

Thanks for fixing that -- some tags for your consideration:

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rn=
xxKvx+HvWdBLopZfrQ@mail.gmail.com/
Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Cheers,
Miguel
