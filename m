Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6650C944E;
	Sun, 22 Dec 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734877032; cv=none; b=t8IOMMuESWwzxCVPOxJEvFdakuNMZrL95bRAf6xsdVGYlj25lGrAtAP5zECXb4xVzPlz6EIa+Uq7RMfnu8dlrWvyKqs2p5hqJVv7FhujyqodBLrWwqypEFOUXeFdE8hz7nukPrgEhs0ZbrEnvNugKf/QK60pbegMyW+d8vYC6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734877032; c=relaxed/simple;
	bh=bQ3cLRMubwdezJ7on8pJE7xExM2q48OD+EdfFSolV0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7cjQrERQ5jVrc4ZMsJJSxDFzG6MDyJ+5FaDNioLfu5+96Qqav3NF+xHRQk/MQg/MaLVkPqID2DTNVwR7OJ27CsoWC1EHt8ppD3mFnTSwzinaqvKtL0fU0wCA7IXO3kJx8rI9Z6cxYJglkwyHNrM2qkuU9MbwNObmkqu6Ce+LVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoJk3th+; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoJk3th+"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e53537d8feeso2728507276.0;
        Sun, 22 Dec 2024 06:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734877030; x=1735481830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ3cLRMubwdezJ7on8pJE7xExM2q48OD+EdfFSolV0U=;
        b=CoJk3th+q4eiw7jqoNv0qli7ZzLv2PIN9qeCB9bbTqDvu2sxaDIcO9/y6gA106uUzN
         m8TS89gnt0ey58qZ7cwJHh2LAeazur9tj4yPflUV85qlwbsHQBjFDp7d8CfSn5ezhq3s
         AzimOuUAWNw9gSRLUNU/qwowBKASu9l1WS7WK8ZQH+gxMLRz5p4w6rrxECkydBjBejI/
         bbh8b1ktqvZWQzStHnKigF3L4MiyDqRqbF08MGFV/nm2PCVoDuSmerX8+SxOptm9nVIO
         zVNF8ebWr0EJod8NqtHPj6MIWfg809AfQsWDvMSa8leF58WRh+iI4Y3z/PrCPDb+zZJl
         j3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734877030; x=1735481830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ3cLRMubwdezJ7on8pJE7xExM2q48OD+EdfFSolV0U=;
        b=viYz1+B/gNxaGoe6DFsm6nq+1IX6EMoMA/i3esRSQmrrQ1Cchgk/GWR2xJW0GM13by
         vPct5rgCzfSIs8doGBgmfsZkerW863Xm658XWbMEGRzvRaFEJ2d8tDxibo6kfWHGAvdj
         9pkt7fFDZ0DKBi/7zNXyL8aDNkwtK+c06PBFKBDVlJ7k3G/WbadMhw5yImob5h7PbV04
         WZZapj22tIrCUib15ayPfnrYLc5u33vxV8+bhSYg/+rOs1x+6BQB8Ei6xoFIEJ1o5b07
         t+9c80rhB3z34MI/SCTUTuWmYxoIySAmQixbXxj+HjNZ93F8KVHVcx38EL+IfPUJJbN5
         yVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc6ftIdm1gZuldtXJz3sFxk/KG6rocjCtc57R76IDDW+Dsru+Ytz+hTLJPln+1NX81B9YDgRBWVsUrYck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTcJNP+7fD3Gfke53tAK4Wd4CGE+SxudGTZNzGqendMapLVxZ
	jwYgcmUUZ6HFQAp5wi++N1ZHKAKEA6lnOocwkbLg5ybAMXPlfdbqZOvydxvDJa0XE0Yb+4ZXaht
	1Wcfs62id4H+3bSTDm0B5ee6pa1t0JeeUetU=
X-Gm-Gg: ASbGnctl/ipftt0J6KEuGZfE6x4k0DgrDGS8E86dVNPPPJdwtGhxZzFNXXdIT5buuk+
	qw2lgdcIKiXUITR2DdqjwOXvGADfUAKK5yKDzO0c=
X-Google-Smtp-Source: AGHT+IFiwfYulqh8GhDd+3T5sc/0ZG0s0RTwhHBDfgT1zuy5sqDOelffAU37tDqIMfwbOrQlAsZ5Dzn/G+VSkEVmtV8=
X-Received: by 2002:a05:690c:708a:b0:6ef:5119:6f39 with SMTP id
 00721157ae682-6f3f82223c7mr75459797b3.30.1734877030231; Sun, 22 Dec 2024
 06:17:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222094658.31263-1-simeddon@gmail.com> <CANiq72m_GR0+k3ZybLFUg8hx1bJRQRaNqHsPJid9mmiFHbYpnQ@mail.gmail.com>
In-Reply-To: <CANiq72m_GR0+k3ZybLFUg8hx1bJRQRaNqHsPJid9mmiFHbYpnQ@mail.gmail.com>
From: Siddharth <simeddon@gmail.com>
Date: Sun, 22 Dec 2024 19:46:34 +0530
Message-ID: <CAGd6pzMdQZF+S=PjH0fgqOKY+ikM5gt2c-bAA8e-zVqXHn-FOQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] scripts/checkpatch.pl: check for non-permalinks
 to Zulip
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Dec 2024 at 19:23, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> This is a resend of v2, but there was a v3 previously -- I would
> suggest clarifying which one is meant to be picked, so that this is
> easier to pick for maintainers.

I seem to have resent the wrong patch, I'm really sorry about that.
I shall resend the correct patch soon.

Sincerely,
Siddharth Menon
