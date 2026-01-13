Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF5C21D5AA
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287184; cv=none; b=ls6ysqskau/zdWt5D54JGmO5xaQ6bbGHfBigl6pvjzrjdHiqT1mtbVzQ21nzO1foUMcK2AQCvru4omjbgRzbUSa4KAW2va0GsK6ZxEj5hk/CQjr67QQR7cn/3w2TsOQqAGk8Y/7xdiRnfAcYwFQwIyOPJtl3JX8kKirCTlUp1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287184; c=relaxed/simple;
	bh=CNdS2PzrayBGprny2/NNwW3YFOxS1GWNCHarYIyTc5U=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=L/A36QLtW5CjP9+nN4NG9EHZQjk+CZIM4RZX/KM/l3HB+4Mxm/3umCtY4ymzoBOnrVmDR2b40DX6qa30SpaWg2ssfWcI2sTdNHWN7ypuU0Iwp4aPKy2iSFZV5dv3RxrmvVJF00jy6PlOe77SpxVKqL6UoSjS5+RNUtYZ6fqkJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgP4eLs0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgP4eLs0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c21417781so4777581a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 22:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287182; x=1768891982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV1GGVj6Mcnfqn6sLjBeIeiIAQNMSP3IvSfNq1rjB6c=;
        b=lgP4eLs0SQexqmmGJCQrCd+9HqyeQnVPN6a3vPe0vrup4Ev7xLT3bu9L3w/NfM+bBf
         3MgQVQapzVsGB6YA99ifmSTef2NDbeMFiDQapYr72dODqjbzxfemsd/yYkP54tKtq7pS
         LCPA4gOlP7uNhzilOiWUXQl0Ap6rqobsCCaB052c7tuBalRPawJnSJU6wQhHFk858xv9
         RuVD3rGWUZyOWD53ofpg+aUor2DY+Z5S4Zc8zC2ihCBPJ5IxXvrfH0siXxr1vOQYWQrQ
         +N652Lhb6tNlioFv/ir7HHSvlhWNyH3Tp+p51KP+EnGhuvmbrG9dNq+NLUd43YQJCHW0
         lyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287182; x=1768891982;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV1GGVj6Mcnfqn6sLjBeIeiIAQNMSP3IvSfNq1rjB6c=;
        b=ZEL04wS6QECFSTXwKrzv0rvqN+VSxF9lD7AxdvsWH1FTM4ZqDnDFjCDiB1slj8R7MF
         d4hqXXGqQMgbDLOPCU4c2qwog9h0bI29KDXfWXQZ/ZKsSppdE1ERa5BZ+CwxBA5qwF7s
         H4f88Tuyr5tJKcEFZy/4B9pGeRRBWJoGk7RYxHzcn2gvVkIpiGzQJgGYTXULkKchFsNM
         vIyZzQPJePCexXM4g1izzypj6EYsg0T0b0Qyt3CBBU7kDqA2pBDzhXk3QsRN6cOe0/qg
         6vkWhH5YdNX0C//v15i6pb6GOwiZxzrwx2VytuVfZsWleXDSdC5CYT64xhCfQi4r/HaL
         qGrw==
X-Forwarded-Encrypted: i=1; AJvYcCWjHoJnnkJTE0Q926tP65Jh/6cObnwuqvbvhAzMdpL0rHqJq2QIVfh+zLBziqiPoNl8nNbJyzxtc0tF5X0DNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH9c1s7NXqXT85Visbw1+BwhVFva8YfVjhVyPXvayMkIth07Nw
	dQLkUcMV4xLow40xSJcJqhFpB0/rdPwPhFQX3CSqbvYPn/Y+K67V37vy
X-Gm-Gg: AY/fxX5Vgz1DqO/q1A0yF/CDQXRBGYDtVIdbxRl8CFmg6bE+gW8P4ftxwDuTZ9J2BwX
	5TFeuxQl/wgmYnJqUR1/ZRMJHfOhrxLR6cPeIgOs9iZgUe5kqoIP9fkLYr1qn+9NfcXnuhePaN0
	LgTaWwqcG0hRBH/uc6dP50msrtYiJFXA9gvlaJ3zZJQBe5xiNgR3KxzmMN+RpSsWbsw7HtUbYOn
	qPTpJELcYFfBM+LGICf7TiPJuJH1uYsBzEBzyGj7grXwe12HzlEeigSr63bnMy+JmKx+Vv7vC38
	RKUuu8f3kz0RRugTcGEiIf1TCqwmDye8u8zT+Wmex+AIAkxokonwvV1o1z1caaTW8XwMkIyyZQI
	u1ubo2AwoJajj6jYkiqvBxcCeB89PK4yYxJzCoXLaKMJmZzxKgYvPlfq8U3rLHQ87HbRfuXkIVs
	yEQREBrI0hu+TEpO/fPmiE8qMjqoYLGnZqNmmGZll/5kzNMJYvNAk1tQ0vhQr/vUl+CQOosKAKp
	wELkw==
X-Google-Smtp-Source: AGHT+IFV737XJC9QxYF5OCXyzt3O6eZAZtaNgW7g0gDQXW4cZIOu7yHDS7zlpMrIF8T78MFDLVtv3A==
X-Received: by 2002:a17:90b:3e43:b0:34a:b4a2:f0bf with SMTP id 98e67ed59e1d1-34f68c28716mr19839116a91.16.1768287182534;
        Mon, 12 Jan 2026 22:53:02 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fee37b89sm479583a91.7.2026.01.12.22.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:53:01 -0800 (PST)
Date: Tue, 13 Jan 2026 15:52:57 +0900 (JST)
Message-Id: <20260113.155257.527388589071919524.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 2/2] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251223120600.6541cc8f.gary@garyguo.net>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<20251117002452.4068692-3-fujita.tomonori@gmail.com>
	<20251223120600.6541cc8f.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 23 Dec 2025 12:06:00 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Mon, 17 Nov 2025 09:24:52 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
>> macros, which print a message only once.
>> 
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> A meta topic about this one.
> 
> I think we're adding too many macros with this. In C we had to do this
> way because expressive power of mascros are more limited, but I wonder
> if we should just add different flavours with macros.
> 
> For example, instead of
> 
> 	pr_warn_once!("foo");
> 
> we could do
> 
> 	pr_warn!(once, "foo");
> 
> If we are adding extra tunables, we could do something similar too.
> Given all print macros start with a format string, doing this won't create
> any ambiguity.
> 
> An added benefit is that now you only need to implement the functionality
> once in `print_macro!` and all other macros gain the feature, too.

There was some related discussion in another thread [1], any other
opinions on this?

[1] https://lore.kernel.org/rust-for-linux/20260108125523.5c7810ae.gary@garyguo.net/

