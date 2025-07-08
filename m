Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3352B9B7
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751946022; cv=none; b=Jpjro6wypMZGkC3yg72aFZI4Jn/+sjZUXAgsJXllCN0M4LR/cO7U0EWYI2zRLMrwDipRPSWOBn/neTzBAXu9+D9q9MeibVxx9thNtF/gR2cSbHYxMqT3d6NzBMoq6lszxVtWT6cPwvz0VpwfeApWhzM7lTU+l8OSNyGDHJtJdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751946022; c=relaxed/simple;
	bh=iLK+dAACHGuXMMs/hiImUPsR9C78KSSdSROi2SJBd3E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LbFAELHASdytRv32c6Jz8KrJ2m2uuUdpOZ3to8IjOdnWjzEecV+dCRyY5Hv8qRocN9tO7Y2w5Rx1TngN6ttgjTSsi8/wZ+xYYSJhILpcGEImP89l4sIsJje67ip3qk949fM9nkgd0WgdyZdINsmRvHbrcTznN8+2BT6DmCK4hoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6aA/ogm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6aA/ogm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313067339e9so738634a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 20:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751946021; x=1752550821; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HEOVtSoVegj68Il7FQxIvm9p1d8ccgPb4UcVGZEKh+s=;
        b=e6aA/ogm+LlNOZvG1RVmP24ZU2/Vg2KVJcZJcpVO/KTWWyQqc/NED5EgNxG1Xx7Gz7
         W+iasXGoPTGyjGHtziPYLn8JmDbMsexHZQ+dt70KZrpzQEZzEYqukhwYk/300KxmarNg
         5fry5700tgEbE2xJwNTqOt2a34fCWtFrXajmYhlNYGTtTXr+Gpvz4Lmwnakhr6e1WZpS
         348e8ya8RZX/YAbkwZxufPslhzsjdezEi639xr75XGsSr5e74Fhj4KoPuepJorI5p2w8
         xAhnVKJazQKBWsYzF7gBF7hbB7NBPyMI+ZaQFObY/J2XmxE+UwyCtuMQMwX8F5X0w7Gp
         +4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751946021; x=1752550821;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEOVtSoVegj68Il7FQxIvm9p1d8ccgPb4UcVGZEKh+s=;
        b=e6DNWvtMG3izmh6BvK1kO/cpguYlRsM7OZ0KNbj0Zmrlbxt6G9PqqH7S4aEalmSbVt
         K7yk3zDxSJ0Nu+noguuSh4jgPQt0ERASwttJw3V2Nvoqvw6yeZKj06faDHNp5wY4CAZF
         5EZ2Y0ZVtI6CtG89+fYF6wdQY5DYgAYFo9OWXIiOIc9jP0mUIXtOL0jWhML0swmvWO5y
         2wXT2g8y2mcmTxtVZPk/zAe76jcYZTvw3FHi9uYeQWqiGYNvqCkPHKpzES4o+GEGil5T
         s6R7+3HDesSwuvflVIpIx+7pxMIjchP/SSdraPLgMfklMVSWoZkkR9qAstdS/KT7ssgu
         bcTA==
X-Gm-Message-State: AOJu0YwSwGxJOdV2O5ybd5MPZu7g8W7zRQ4m6We5Wp2U2vjFl8PfM/u5
	BIGjXPPBBPq3OMkxoWbGnemwpNVTvdkvFMxAoLOVzhK1tkEifsuSUhHD8+6ZUKBzVH61pRj4ZXq
	xtIdVlTNV75IfFVsYRN/rRCNPnkDq2sar6MYvIOA=
X-Gm-Gg: ASbGncsqrAoLaCEEMs9sTAjBIOUAg3rAHEQEzTDJe7zrf7+zMxUeo3AuHx0rMELOsMs
	G0rsxypM80tzD2M1F6LdepH/VR4yF6UD/kwZnxSeXQIN7TsC12GZxcwrjhmN521sc5XZbkoHujq
	6yOB3r+tFeJqAoOznKiZOaYZSHzUSX8hnvmGcSGsHa2NsKzjElw6y6V9M=
X-Google-Smtp-Source: AGHT+IH/pvpwMCCbqQ/zSy4f1SSvF/zD4tsBKYFSiGaLa7YQRPwEaGHvJ4Koc2mwZgRc3CsW4ZUaXn2eqKhIOQuOTuU=
X-Received: by 2002:a17:90b:2687:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-31aacc36894mr8139668a91.6.1751946020732; Mon, 07 Jul 2025
 20:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Jul 2025 05:40:08 +0200
X-Gm-Features: Ac12FXxemO2_5319KAnRSnS1L7gQ7yE2Kqvy6hilCyJoRy4stKf_q--X_3tbpEE
Message-ID: <CANiq72=o8B++kHHb8O2tJh8d7E217Vw=mPfnH7mzvFnxEhkyWA@mail.gmail.com>
Subject: Rust MC at LPC 2025
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

The Rust Microconference for the Linux Plumbers Conference 2025 has
been accepted!

    https://lpc.events/event/19/sessions/223/

Proposals can be submitted now at:

    https://lpc.events/event/19/abstracts/

Cheers,
Miguel
