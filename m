Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086E5FB9A
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715000814; cv=none; b=C4K3eLz5uZQaglUPi99lj6Y/oPaYO+lBdA93ccjm7AEO9b3o4+Kxqn/hb2s+Zt+ItmZCWzyhTvRBiIV3KdFTAAh0XcPVVnCWAU1Izr+cECnUH2kUJLsE1h+ffyTMgF7ojgFqQ3Ta+wvrnh71zzYCa+43mXmt+js9x1SOrWptPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715000814; c=relaxed/simple;
	bh=uRa4/c98y7jK4Lc68uR3+Ya/gCj0EfbFoSLd0Gm0eAQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UNHXPgifVfI+4diVwC7TgL6oAb0Y/h2ADqzppgH/wkCd2B1uVe69NnDthTsyA988lMoby4sxMPOPWtDDs7C61zP1qGoZ3V+2UeWOxOgzg3KCLBcNysCspt08UbJMH/krgON7gEoDq2hWaUmE8oNIyvuSTDW7Dt5zN9yKEyDPA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+chx7/K; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+chx7/K"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1016443a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715000812; x=1715605612; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5DQlMVh/v6t2ltSyrq/BBjY2qmdFtQoA8kIXSIWwwU=;
        b=D+chx7/KKGWqOpvAKAJWnhoqIkbrjtkvud+lnU71p6VYQKgPx7NZxxah9jOITcnPY6
         gDW4hPZlRsA7RpfX7DaP5kKMcS+KtV1IbRFGXHoZFT199/aImA33Rn5uLVYojAisKh7G
         Zj2QQ30BSXaOC2Irw0r5ccdV31K98cvfatYUXdCRyC4eDlNSq90x9OS/bbGMSVGS+Txx
         r7WohC4ccnFWLWdfg7zs68Nfx5pbkq+UuI6gTz9kqx6IKevcZQeNM/AXBMCYvuyh7X7Z
         rniY17wbfhJkWQLvBvg/YDIHC3AXD/Sa2KTOiHG0bi0YBn1vbgA/57KsNvm/jEfUxqT3
         M7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715000812; x=1715605612;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5DQlMVh/v6t2ltSyrq/BBjY2qmdFtQoA8kIXSIWwwU=;
        b=WrEVlkY+1FHbotp0Nll4GH8OhCXqqvX0sKkvk2JY1RTUfMiBz6SNfJajfqJVBy0ksg
         MXfjTI2JN9PL3/erQxBLpPSaGJpWcl5dolZmyxALUnNNog392/LBLKTxDi0S1AJa0nTF
         YDuM/hevXla+Mf0AEijOYXAS9si0TZQknGK/2X/Npo0BpYpq/qx5xyZ1RrqMGhT8lXns
         1m86zuhkDqGZY3Th08Pyq3RItHHKzcmqwvaXrKDjyX9Myr+KSBDAssBdL+Xtgz84QcXA
         lSw5jmkNEgEATJjFJWa/iAYUnTxL6pXRJiy9FdrnUu2DksKzZhpYaVzivlQ2t/otyP+Z
         +6vA==
X-Gm-Message-State: AOJu0YzLZGqAVdiZvV6yicWErs0b6sF2M+yXqz0bm+B2An6hF5iGBvMP
	q+KzaGV/O0zWQXkFWcORRpqRvRxtb/Jgsa3HBdZPrgwUeF5sk/UAmbxuPSNqdLfmKFHimBGL2Sr
	aNqvkYAYbD1aFYBGyY5S4p8SB7vHodifFMD0=
X-Google-Smtp-Source: AGHT+IHS7uHSWnodggA7FR+sPw9beUi5dXHeRF5RP2NrrUC1r5JQ/nOKaKwiHNjJuIAz1hlFoujATpro9IIEy7Qyyr8=
X-Received: by 2002:a17:90a:d504:b0:2b4:3669:65f1 with SMTP id
 t4-20020a17090ad50400b002b4366965f1mr7459904pju.22.1715000811593; Mon, 06 May
 2024 06:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 May 2024 15:05:27 +0200
Message-ID: <CANiq72nJshrWBY8sqJPwnFYkZjP_ZbC8VaUdHaVQ9xptt6bc-A@mail.gmail.com>
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
