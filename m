Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AD373BE0
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 06:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295656; cv=none; b=oIQHNxKEiHaIhdP2NmmSW2nvp3K0fJokuoFfUnXPOZ6tU7NR/xFCRftHJAi3WDPvuA+776I6yRBWKaqfojvZVaL9p+wBAvh7WILhC+G8LkY4CxziDpD2z063lhuC0jeVbYi/SSdzJL79YmT5sRQF+x1eEsifHfV0BYRQUNhxCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295656; c=relaxed/simple;
	bh=PgPblJNLZrzJZjn2cQnf0HWXc2ZV1HQ+FWe2DQWRbXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6F7mdNqYQP9YgPPp+GbXCH053TbvoViQPvprRIS03b7i9H9Z31+6WG2SLmUzoTs8maNcPRs+1Do3PjrsIwSXbISSRLFr8nTs3xDOcNrcm9+cUiqn4wGUSIFovqVsEOZQt5ny5SbzKHsXaX7jZINm4KUo9gd7VI8M2NZLeeieMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NSTB/rNi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NSTB/rNi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-356337f058aso370157a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773295655; x=1773900455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dhb8K5s9CLHqxHft0Tbe/+oQhEwOQxy4aX8an2pkM18=;
        b=NSTB/rNi4Z+T1jyggc76BziEab5ZdmYBB35/tc9tZOwgtTLD2aC4Wv/vTwX3GKxW/6
         4vNvd4OLAfiX3bluWyC9QseZleHcYUdkm6Z5PxcdyLUuGojrsa6N0S+LG0FZ+CkZcLPC
         GlCnrskyO+ludyu+RjyiUeIW44+1pWZAd9k/GMohdzXlZ375BJMFI3jSQQrECX3HWXwc
         uj4Nd7LjNKRv3Dfik80SaCOAcDJrBf2ab3S1RvJiIw0OlrhsBcClZIDkZ/eJKyxlE23s
         7nGq/6v/5jCxy4/ZB6trarGvax1TxfIJYPFtpB5bFaRea6Uu69h2vAcg9LolSacImyLC
         RjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773295655; x=1773900455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhb8K5s9CLHqxHft0Tbe/+oQhEwOQxy4aX8an2pkM18=;
        b=c8fsSOGwGinsl/KZZSQXnxKPghKBaxHnE9spr8nwEcg0giFXSVspwJqzUrL9O0qfWX
         MzidAY2OGoXWjt7G2XX0OXRTdh4EjJFuVpFLcciDjrFekXWIvnYeD6tcF3pmM9GswXd/
         /olSAUqQbjyN8p4YEnZxFquUS5AdptkpXuCffedYM0xb8dOsE/aoAdRnsdZ/7Hg0TzlU
         sMJz+Z1TnMbxieNZT6eTuA5egxZzJc5yZVLvt8j2xmGo4TWRa/SmczBIr5by/tIioHJq
         jrMItARBJySVByzxsCUPlCT0smY81RcmGhkwU8r4XrzjKPVXoiySC6T2kA8COjEr6yit
         /ESg==
X-Forwarded-Encrypted: i=1; AJvYcCXTe4+ynrI0njs9WfnuO6cAIeH+FIknb1N0OH/JCAd8IlLM4i89b4faAqEjAsCHQo6v5OZcgU23RVOuL+QRrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwduIqiXf0ZXjuLuxNc/ER2iUQecZ0iTJ4XoFkj4Tdh+My/iGrm
	S10YXdoiZFocC5JnP/nLemqppgWsFiiF1Oro0oDIGrPFkXzdM+wMQ6FK7uThanprvyg=
X-Gm-Gg: ATEYQzykAh8JGtQCbj0Y71WkwF2V5/unJgKh+xngrf2vj7ui4ar+pP6y6NJdbcDauHm
	L6Ef2G4lncCX/cHTfFw/ovT5AOiWkCp2XFcb51GbNeM19ns57FndVXEtjGeb07o7YvRH0Qjc4R+
	XouOObWUiVjRGJAUV6TF1qn33EweuUytC6yvOAB+PkrkOYPsh9IOBWSxmvmGrFvftqqBk4YRuQ1
	fiLQr/GJDNWAwCQkC7aV2BiW0chm73BEcSJgAuO9k+226Y8H1L4wMm/HhXdKcWsX/0b7ATukusp
	vN4uEskytkYrW5RNSAQVNzNtK2R0Z16PM7RyosJ7LmZTu+cJWFUSmSUSXaap2yT2hRmcTI0UO7g
	3pybf9GZwVFIJM7V4hoCi1wnGTyfYaGB5VHSAWy9BujCgjCkWySxjfgpo1z4PJUx5SJwrcNOgNv
	Xbz3OWqz37/6m0Dv6ClLvCJqWz
X-Received: by 2002:a17:90b:1642:b0:359:8f84:ad8a with SMTP id 98e67ed59e1d1-35a01367c7bmr4396129a91.33.1773295654603;
        Wed, 11 Mar 2026 23:07:34 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm4012099a91.1.2026.03.11.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 23:07:33 -0700 (PDT)
Date: Thu, 12 Mar 2026 11:37:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/1] rust: cpufreq: suppress clippy::double_parens in
 Policy doctest
Message-ID: <6nswew4stvp3574nrwnppt7lxxp2zmijg62qdku2jqmkhdaaw7@qdesr4fe73fl>
References: <20260312041934.362840-1-jhubbard@nvidia.com>
 <CANiq72kYpm5xZ+ppWuSg1O8zFQYgmbuJHBYh4dpgp2c7=zJJiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kYpm5xZ+ppWuSg1O8zFQYgmbuJHBYh4dpgp2c7=zJJiQ@mail.gmail.com>

On 12-03-26, 07:03, Miguel Ojeda wrote:
> On Thu, Mar 12, 2026 at 5:19 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > The kernel fmt! proc macro wraps each format argument as &(arg).
> > Passing a tuple like (a, b) produces &((a, b)) after expansion,
> > which Clippy flags as double_parens. This is a false positive,
> > fixed in Clippy 1.92 (rust-lang/rust-clippy#15939), but the
> > minimum toolchain (1.78) still triggers it.
> >
> > Add a local #[allow] with a reason attribute on the affected
> > doctest function so it can be removed once the minimum toolchain
> > moves past 1.92.
> 
> Cc'ing Rafael and Viresh -- do you want me to take this via rust-fixes
> to clean the build log? I am planning to send a PR to Linus for this

Thanks for cc'ing us. Yeah, please take it.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
