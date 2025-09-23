Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C244322744
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632178; cv=none; b=pCFdR+uLP7sN13m8azFxOUYrVPJn2/VrFd71DarN54Pj+dV7shhKOmiEOEC2xcAsWUJUxXGqdRNYmecCBooVlWYyWGfPjIeThpZjD391mYiq610SdvkyCTr8jN0gGQc+waJQBN9R3cDQJi1gZX91oNDyn3BphVJiTjCnwP85t4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632178; c=relaxed/simple;
	bh=2tluKtN1BCzud6kXRW1xroiXueZTffg1NnGk0toH+EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoF0VxrIv2lLsZucO2fusfbv4F5Bwo6BP6xvCORiMeB7EzrhNtYi0CNi3Ubpxa9UGYqTskS7tg2ukUgVlFgnuWWmqRocq2+O92tT7ydyf7oLPzBdo3i+JKeFL7Fb4+iarkQummG34SMmp8jZaDhC+rMrNlxDy65er6QLzcVVUeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM7t438K; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM7t438K"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-269ba651d06so9763115ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 05:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758632176; x=1759236976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tluKtN1BCzud6kXRW1xroiXueZTffg1NnGk0toH+EE=;
        b=dM7t438K3YlIUO8p/NZNMa/kmC2+1U//F8OI6Rk1kppVC+C9AoffLszDt3Bz+nVga7
         XRcYi2kCexTaLBkSdXrqZy0QONo6pUbZMcpoWdcjNJJajB4Th2ob8LTed3mZvBnBpE8v
         w/ngegT+V9O3jVoX1kJLnk1eMDp8cmLx++1AKFcorEnTHyndek9FXeqMgFtu3slInucJ
         cJ8i2ZW/Oo9DGBj8x6p4hqAq6AH/A6rutscEefkprTKeP0wNLBX0sA1nZccVETEBp8bM
         ZeAxrum2yteKAgwhHA+zdKG1bpSDkmzBnI40zTKos7kUygsUO6xuyA01IMviT/KYwEGM
         AewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632176; x=1759236976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tluKtN1BCzud6kXRW1xroiXueZTffg1NnGk0toH+EE=;
        b=tT6Wu7hE8XPMQPIANl6CTz/FRzmpjgCn77UpeS3IwRnrOracF4QcYJ07Mu8Zj7QEXB
         BfgRYra0sqEcpyQQTZAbN82nEbGULhDtNF3EgDJ9pYFdwASK/acqOMyJ6YsNb0ejpruk
         /R9lnpeMnw5yOngEkGs7ffBINt853LSxa1uIDnm4LIHVI0WYe15cCohiWmf9gK1nJKpk
         4KEgVoOaTU2PHEKoEmq+qfEwzx7Jkt1+3pFs615ufD9zxJHdUyEe3zGD9GLiWJpEY0wg
         tS71V5bTFD+SPO781ArTs6OG3wnVmP6R3Fs0hlhJyNH6b7F6IoiV01KcQS5OPeaABEbH
         gfig==
X-Forwarded-Encrypted: i=1; AJvYcCUJzFWs3MVdn76AwosEAGxj8g1qKcXSZTlyC03GMLepDkecnfwRFGTn0XHainayiC6G6D1JzWyw4i8YVPWA9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZN5qycPKTShD+FvQhoT8tmR4FgpXlCMAFn+zcb4KLHFkYzlen
	aijVXiuUruXSwi69XGst24FNjRQ1PGS9hZz8NkdQLs/g+UMYw1ECCJc8RA8hzK939aXEBLQB7hp
	LA1ZldUtmSHwd0XM280WSw8vWUTVLjmg=
X-Gm-Gg: ASbGncuhAXG4df4UYN07U6Am9LPIxXS92DnqMAwvICeLCXzwkH5M281DWS8IsGE5K/W
	lLSErbQfUm8Xy/BCSlATmVCqVL7b3tAtG46JEaNsZt+fi/RIYwi0XHuqz1jozm1DQq3gL5Mhigw
	P4q3bvHMKujZOnHK+xf8tNQELkQa80pwoRORLnKa0DUYWZflKEm3rwtIGirh6V+te+H7GQ3Lggd
	NkwTSGkKQweEU8s+tCuaprjciE1nyx9wwN/TzNo/QN5yxbiVvflG214HHzBP2vmLFR7s+ItcnaU
	LrJUVt0+GXjvpLoeGRsgmKHLkg==
X-Google-Smtp-Source: AGHT+IF0/NkAjbrntImSusssyg0q/7Q73fQZB6mEfktvsZqm+jJxVnz928jvTWpp9QHkKMte89aUba+cxGL8oEh0ahA=
X-Received: by 2002:a17:903:41cb:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-27cbbaa4eb4mr16801825ad.0.1758632176486; Tue, 23 Sep 2025
 05:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com> <2025092338-elbow-dash-373d@gregkh>
In-Reply-To: <2025092338-elbow-dash-373d@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 14:56:04 +0200
X-Gm-Features: AS18NWAH-rM7NFZKlCBr66FQi40K38NtL4yX19rUN2GxoJY45g8UXFo0cj5K8Zc
Message-ID: <CANiq72k4VG4UMDJUUfD=LNM+tJmvceNDxG=A-+6GDjLzCVXurw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I tried to apply these

By the way, a `MAINTAINERS` entry is needed, according to the log.

Cheers,
Miguel
