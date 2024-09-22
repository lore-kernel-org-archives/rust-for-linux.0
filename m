Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6DA5F
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Sep 2024 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727010722; cv=none; b=L9Rt9b63J15hss/maeT39/igtrIPMWrcbYfR7BeWlOy21wN2HGcJivlZi7EVnIywPNG16LvpctFyhN5ScV3NAY5oHPFU24dEc67+2iv+M2U2AmTWDy3O1ybORg0jr9EKrAhgFdDphnVrDFp+HLzVvxKxicA+p+LNOBIllmTTP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727010722; c=relaxed/simple;
	bh=K69oMExutIbqq5vLU3cF9g+1TZsKEYU7QDt+mrwggMU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uM+31BW1DXrLWeagRNvqd5Y3OC2NX29poT2mBanr9smvz2hxnwTMcdUT6cowZYvu8baIO3HMZRYQnjRGQtENaNC/N73OrH+za69ZNxFryfcYxqg7WWGkSUnH7xsYeAH8slVNKa3En3JSeaz7hdbsfOsgVTTJBxIbmcXoh9s+tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjJZFylZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjJZFylZ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d8741c85bdso674739a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Sep 2024 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727010720; x=1727615520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K4l4J7IsYFxdmsYbyBoKStS5kUAi9gU5DhoPh14DwxE=;
        b=bjJZFylZzhGaWgjHwl39JgTi45m8J5Howo6yjroMGb4WP/IeLidnTVV0nRH3NU8rhH
         gU4diCsjqPK4VYp/4NQVZ8soSATHnhFIwqDQA4pfZ3QHZSeM5HlGCj02WegmSaaAJh+Y
         XOwy/rM+IN2LlfZYLy02HMepJrV2Ic0a2669/B8AEUZbnsd/2W0m2W5fPA1TL5usrpji
         lLUUPQKsOVCRbgU6CQlvbkqSshjj0TJUI1/R4bCbk4hfFHflwDAune0ZCrnmMcrNmfsu
         zMSS03U/Kxz75FH8R44ZXdUSlOMFSPIxTqJ8F1Te/M/VP2JmdwDf+iFBPXjltnACeDAS
         1GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727010720; x=1727615520;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4l4J7IsYFxdmsYbyBoKStS5kUAi9gU5DhoPh14DwxE=;
        b=lI1QXvlsRKUBfFg8bdwflFz6cNQ1Ar4k5smX6PYQkVFDeP0GeEV+u8Rrr00Dk9LQJ2
         wiY0YFh/23mMtbGj/q5xGG/BfHaSg/qic6kv83OyhmGytMhYw3LNGlfNHbjmAQ2aGe4N
         5QPjb0F1D06P6JyenlvIzsMUMg2/YlkNXEgW+J2XHKO/ZLU/r1gW/1FZgwmV3/TThuwX
         3dga9DbqYtI1SFDBuSZlLreRBlVSUWXkP2LDeFlE1N4IC2H0Q5ocmHhhrwDyOb6oEQhi
         GbV9YJ2uyrSHBHdE8/sXhhfxmp2Cn4BXcDxZBgAnTXMo6W3tLtFd+8FOOKtnW0j+Anpx
         CQOA==
X-Forwarded-Encrypted: i=1; AJvYcCVCq6tvgUFqa1HOnqGEu4XF2tLf9lBWnn172j8rW79wQ0MB1YDIBQiZrMZ9e57zhXF/vE8ZxWt4/q14+8BpUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFHCKTcJXgMN2YcO3jTrRZLdJkZFr6pI8I1hra5t0oGXTk9LQ
	QygE+YSjp4/5RXH7Y488yRi5QMOdnzEUmwJYsC45GA4iRVCq5RQwrfrRi9/KXzG1ZfxyszW3q2S
	tOCotazv/56Jsv6wkJFYwpTLJ5X4=
X-Google-Smtp-Source: AGHT+IFgJvOEYzDiSQevwVI0ocEtX4pZRyLmwpZoc27d86h9KeAVitKFyZgmqaloHsUiNThTj06x3Jfar9zOMemY22k=
X-Received: by 2002:a17:90a:46cc:b0:2db:60b:9be5 with SMTP id
 98e67ed59e1d1-2dd7f761e5dmr4284749a91.8.1727010720403; Sun, 22 Sep 2024
 06:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Sep 2024 15:11:48 +0200
Message-ID: <CANiq72mNeCuPkCDrG2db3w=AX+O-zYrfprisDPmRac_qh65Dmg@mail.gmail.com>
Subject: objtool warnings in Rust defconfig -next
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi LoongArch,

I noticed objtool warnings in a Rust-enabled defconfig build in
linux-next, e.g.:

    rust/core.o: warning: objtool:
_RNvXs1_NtNtCs5QSdWC790r4_4core5ascii10ascii_charNtB5_9AsciiCharNtNtB9_3fmt5Debug3fmt+0x54:
sibling call from callable instruction with modified stack frame

Thanks!

Cheers,
Miguel
