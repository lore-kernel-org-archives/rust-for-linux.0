Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE71DACB1
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Feb 2025 07:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345683; cv=none; b=pNSe/VRKDjac4H2YrpYYpMu/EBq/K7yCc82yODFWfPcArjapw6aR6c9Jmh6LSyGmLEVVpjkpYfOlzbZgggJTO1kBJggV1bUWXEXgFjkrnDs4uWGN/e8EHN4QwswqHs/l4cIoKVNGk+CyRwtCMNVHsK9fkjVKs3DOI3wv+5GJXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345683; c=relaxed/simple;
	bh=xKZQeC8QlmSbvkB9BK44DQ6sGPlxDTX+bVywm5YMmj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGgQij64dzJQ6GLMRodLwxqaHIey44l+vZ9XrrW3LR4xNWVQ0zLEwqad+iq5T+xlPu2Sq/uCV2SqCn51dohslRUpgK7N6PIx4ju0pdndXSzuF0jo5oUBBpZiVVy7Wd7alElsIC2OFERLXtz4CtuufhlXLHXvAAlKALY7q5nVsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWBKFMZn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWBKFMZn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f74c4e586so73196445ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Feb 2025 23:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739345681; x=1739950481; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gBZVQXzGj/Nj2dxnCyApeR+oIxTqVjbcwS+DUCxmMZo=;
        b=bWBKFMZnmiLu5Jb+el07taK6pY24LrKMKt8GmUEH1zlq0+O5Jm954HK2CoZwHJN0YX
         LuinVGVEwQKzztFmxSCjnnAmjkrp4kCcdg8KeVK75wW5dV4A3RiVh+UFv3U29qbu+v3o
         7Gb1vXmyuODRDjzGPwpmT2/PyT5h131eJ19ABx3WE/+iF99iE9Nl7D9Pl7PCbSe0y+1n
         udKH3ZbJCqzcc62GmiVtvVrsEzvM/qPKig09OeCbfPxFxvCEUkowak4Y2idYbYcoYZro
         u2CDVyZ9b5KyUvnlHnpJtm1ZN/PUkltlxM0aqgxdxHbtfmPVuHdEdu7rw3YH3blPvn2E
         3xOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345681; x=1739950481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBZVQXzGj/Nj2dxnCyApeR+oIxTqVjbcwS+DUCxmMZo=;
        b=xBeQZF7sBsFeRLpjquAb26zIafqHpXL4wH6UmfY1N5Hf2pCWbBH5SuFZxaNGPdJyTg
         qYNKnUysn/cMs5XWIEonYx2wf9+zbD6zekRPnGs0SWVu27CpHMr0KvX7L1nFg1B3oc3D
         N1HYWYJiPTgzmE2FsW0m71ytKAzUT+3kbcDMbgYSh3DgNn1h5kLSnQ598Lvt1C0uJPdY
         Z4jjg1BrwU0Sj7Z6KEbv1bZmM2GDFiCqf8aLUZZ8CNL1BLlwMy8gKtD7TloJbH/ndnhN
         wbxI+NiOlqawq0LpJ34Rphq+vMSOsdTqzSRq/qxyBOx9ALVsKR/4cANiqH4BQOlFIO1L
         645Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ck/P9Cg10MJ4WBELYzJEj9eX7AZ2SG0yJ1Dt/uGeiGjM5uCKLy2YU5z3f+3MhjkmPt/oi+Bzr1JW9cgoSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLgobqdTr+qiQxvw18yTyT0XtCPJj7StLQE1foQFI0ciLjEp4
	/ZTzlP4RbKwecu0F3MaXbwXhK67P1VRhMxmle8WAstsRyejQVFXpv5jnriiNiyM=
X-Gm-Gg: ASbGncvjrnNk79lxlXN6vVyoNZf+7pvXDJDvAXFRqgEZvI6rC74PUgo98alcEI5beVX
	B35MZ/PW4WfP1nViD9wcnkqzxykFM2IBGQalc9qvL5LYxOEFlDOYXJoIIboCK1Ns5ne+8fkVHOM
	c6PEkZ+vEL3VyEQQlxmSetQKI5w+iTt5H2C1QGPXqUxi8PGrE4G+mwfluPmBoSTZTgsdXpsyAMQ
	9dnxr05VIlX0WNhOAwCsqBbs/xsEZfb1MEJIh7jHqz2E8TK29v8jUzM3B9zVjW1dDEBTWDytXcU
	D0U0ajDv1mKXT2eOmw==
X-Google-Smtp-Source: AGHT+IG+5sMijvsVWogU7ykbigna0UHmysXJKLgwHilyqSb7VE5FnliyWRdOolJC+q6GU38VtdsVhw==
X-Received: by 2002:a17:903:124e:b0:212:996:3536 with SMTP id d9443c01a7336-220bdedcf55mr32555755ad.10.1739345681224;
        Tue, 11 Feb 2025 23:34:41 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36511846sm107668125ad.37.2025.02.11.23.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:34:40 -0800 (PST)
Date: Wed, 12 Feb 2025 13:04:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 04/14] rust: Add cpumask helpers
Message-ID: <20250212073438.bjhfgefz7t4dxobi@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <db0166341ce824c157d0c58c240b3efc6aec6f6e.1738832118.git.viresh.kumar@linaro.org>
 <Z6qTelPSqpFk439l@thinkpad>
 <20250211042908.nyftiw7gtxosfjwc@vireshk-i7>
 <Z6t51xodSV21ER4M@thinkpad>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6t51xodSV21ER4M@thinkpad>

On 11-02-25, 11:24, Yury Norov wrote:
> To begin with, this is the 8th version of the same patch, but you
> only now bothered to CC someone who is listed in MAINTAINERS. This is
> not how the community works.

Yes, this was my mistake. I assumed get_maintainers would Cc all
relevant people, but I overlooked the fact that these are new files,
so it didn’t include the maintainers. Unfortunately, the same issue
occurred with the clk bindings. Miguel pointed it out at V7, and I
corrected it immediately. There was no intention to bypass anyone.

These bindings had been in my tree since earlier versions, but I
hesitated to post them before V6 because I wasn’t confident in writing
bindings for a framework I didn’t fully understand. I eventually
shared them in V6 to unblock my series but inadvertently missed Cc’ing
few, as mentioned above.

> You also made it a patch bomb that touches multiple critical and very
> sensitive subsystems. You link them to an experimental and unstable
> project, and do it in a way that makes it really easy to slip through
> maintainers' attention.
> 
> Not speaking for others, but please for cpumasks create a separate
> series and start thorough discussion.

Agree, its better to post these separately.

-- 
viresh
