Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8F45007
	for <rust-for-linux@vger.kernel.org>; Fri, 17 May 2024 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715975496; cv=none; b=vEOTJHLCVZyq3dMxAIbxGw+G3QjruN6gHbMu2IitkN4zjiXikUkxmaVPOX06bOn4LD3z4XyI28i5nTfpgTupBGiV54cwx9B0PiNg/DdPkDzWlKZUMLLEXpofcH2CrLlQanX0/04mmcYV2Hh7uPgpDsQEp/6wiBTwAO6GDntZsb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715975496; c=relaxed/simple;
	bh=uRa4/c98y7jK4Lc68uR3+Ya/gCj0EfbFoSLd0Gm0eAQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=d0IOGuWE841jeUdKZFGG65lfFhSWD/qm4ULoUSuGFLvKbzchJbtpAMCbY4nyM32hzeiGSq3EPdsXICOnewTqJsX5FHi7aPPfGShwlOp5MV8ayu0L8dxME7JIJhLxNglKfJLD4o7oJsSDuGSXIiAjVzBrCl3pt4UkzZzouJZGtpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdTu+V2J; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdTu+V2J"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ee5235f5c9so19916735ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 17 May 2024 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715975494; x=1716580294; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5DQlMVh/v6t2ltSyrq/BBjY2qmdFtQoA8kIXSIWwwU=;
        b=IdTu+V2JuSh3TjMnkgTh8PyxtZEC0Pi1LIlkypUlx54T4mATbCzUIsxR+wiL9HKTuW
         Zw2T0VnTBIKxt+t/IxK3RhODLBznHq05vGOthdXV2V8ZhfCmykFSu2lsjShfCIQbuoci
         mp7OZCzSZYTrPDWrwi4oeHlv2kElb5Vj32+rVah+/vP5unpzMlwAdx8228rr63/xxfd8
         Q2u/P8z1lFHRWOI9eL2PR0vUaPX864jZVwzVHTnhmJjrYG1uLg+MYQ3qyHsJ5efwFuyx
         o5JyGHZheJMpBfPbFmgGqeWHbmoSBbMQkDI35ofAiB6b+9sSxlQjHJGW4dPa/z/rpM8g
         QlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715975494; x=1716580294;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5DQlMVh/v6t2ltSyrq/BBjY2qmdFtQoA8kIXSIWwwU=;
        b=QdtzzMlNg3LP/yKm6QTP5SCAADdsaocPkb2m7VJZ8EPGmN/4APfZtNCvgiNhG9SqNS
         RaOfHBz4t0YrUnW6mYVTi62WXzS6cxYwfnuCuJy9RfNDDgJvdOqb1Tj7+9RDY+893BVZ
         3MeUyUwGuQC8Yekjq56xb4JLrRUxkxHc6LFnSaiPqH4ufUjY7YjZwq3t3Jo/Fz/EtzGb
         qcZN3DlM6YqsNO1TL0WTquFL9o+2ZRZb28Vle1fRBSPbaf3ovw3stup/CaxYphJI/o1S
         9Pqdc2HymYhkcGBthaMo1x5Sm/bmV3/64AAWdVn4U9Kxy8Xcwr+26ybMbj+AeCu9jwlT
         o0yg==
X-Gm-Message-State: AOJu0YxKRKCRvo0hrnGjlf3RL+y2K2Xn4ZdhiBugZ8NE9k4XB0Ax1QRC
	Z+Sg+GtOqpc/Y7OrOKMkvOzbwzB5gohDCmteajfCca5s+5u2JbEk0+X+9nY/5MwlaZru/rDaJXc
	+KKUYUa0Cyzc15UA4SzLJDwKylKsXuytO3w8=
X-Google-Smtp-Source: AGHT+IGhwnK7Oc62+5Vz84aEzxzE0mIcZBq2qGW60RB6RremdeIoqtNe8n/3dLZn4erqzjqnor+2jCcrw9UK2HwNUrQ=
X-Received: by 2002:a05:6a00:883:b0:6f3:ead3:c287 with SMTP id
 d2e1a72fcca58-6f4e01b93d4mr28277227b3a.0.1715975494182; Fri, 17 May 2024
 12:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 May 2024 21:51:22 +0200
Message-ID: <CANiq72koT5wYrYDvEZdiz-_-BDH4ZmaKeRjg=p=81=m46Z+PuQ@mail.gmail.com>
Subject: Rust MC at LPC 2024
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

The Rust Microconference for the Linux Plumbers Conference 2024 has
been accepted!

    https://lpc.events/event/18/sessions/186/

Proposals can be submitted now at:

    https://lpc.events/event/18/abstracts/

More details in the blog post:

    https://lpc.events/blog/current/index.php/2024/05/03/awesome-amount-of-microconference-submissions/

Cheers,
Miguel
