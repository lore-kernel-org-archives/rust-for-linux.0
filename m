Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3F742068
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw2SGc5N"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4b77948f7deso1742296e0c.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 10:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704999440; x=1705604240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk2V57k0ESKKkwhIwLxi7MgrccmuYn9DwCdqSEjAloQ=;
        b=Yw2SGc5NT9wyyDne+pPfl8UI8A/CTqnjko6m3Dz2LXyj7Y51CpAD+N/0IBYQBy1mII
         SlyKr5bl6w4WYFKRYEsviiRKf+ul6+k3vBVIv/EbgJ3qm/NY9Iu27r8r7eMJZjwEmStp
         phkAumpqu690QW+22LSJY6osV5MmRG1qPy3wuK6DXDKf0uI6hvgk3j9EN5Ay0yqpNmbk
         zwYBz1gGRL3GDQBOaGJPlsxV/2yaxFxncLfrrl4msQK8CW/jNFFjQsO3HHu/Kh63dNXF
         rA1ZhN7lyaYcM9WWug62BeC1MY2M++oCrHHs1fZuNJyHjKIPGv6o5AM/g90QkkaV0APN
         sSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704999440; x=1705604240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk2V57k0ESKKkwhIwLxi7MgrccmuYn9DwCdqSEjAloQ=;
        b=xKMTV/WdTyyCutaT8SU3Nh35bKxHDS/xwiVemiuppwEbLP52p3oCeOjgVsFshM/nGN
         6/Lr76AExYpXw6Tp/Gptqbr9U3Sq98guUUyTnz8lPA0m9v/ToKtccWh6AxyO1jXgKYeT
         Gi63sYFDxC7iDrJMyDnNJNZbv7nI4oOMQEIymZbBxiAhW0KXSdOwb0W0CLYRefb3G7kd
         BUZvk+VU2+d+KblyrLsvK9NqLAx+DOR6quJmwIEN4royexvkNBriPlfZAOqqSNjjkjlo
         XEOm+hLtJBY4HivhaALqt1pDgUlV3P6IKIG/RV2rwwbVpOri1wK5ozQgFpJmEzzk38fn
         qqJg==
X-Gm-Message-State: AOJu0Yyb+Mn32XWuVoNgKHExjoGeERiEhnOoCwpculkl36nYWe/RNjn8
	ePym1ImLTnG68afl295nfHFfDlhjJgJZHg==
X-Google-Smtp-Source: AGHT+IFGKJmqdw6lVijXHPkLLUSksRO2l6fpPjW5HPIu9KXetHYQ9tff4fCDr0VJhfkr9tygK4ZX5g==
X-Received: by 2002:a05:6122:4013:b0:4b7:3eee:3a3f with SMTP id ca19-20020a056122401300b004b73eee3a3fmr306588vkb.31.1704999440007;
        Thu, 11 Jan 2024 10:57:20 -0800 (PST)
Received: from mythra.localnet (2603-6010-d800-0cbd-0000-0000-0000-0b76.res6.spectrum.com. [2603:6010:d800:cbd::b76])
        by smtp.gmail.com with ESMTPSA id x7-20020ae9f807000000b0077d7cfde46csm518184qkh.106.2024.01.11.10.57.19
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 10:57:19 -0800 (PST)
From: crange76@gmail.com
To: rust-for-linux@vger.kernel.org
Subject: New to the kernel, any easy tasks?
Date: Thu, 11 Jan 2024 13:57:18 -0500
Message-ID: <2714841.mvXUDI8C0e@mythra>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi, I just started with kernel development and rust is an area I have a nice 
amount of experience with. But I don't know where to start, if there's 
anything I can do to jump in.


