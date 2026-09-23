Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2027740DB53
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185112; cv=none; b=AnjYxZEZU+ukKARkF6/kWGLeLax5mESCfIQM5aHV57zCCuINpCysbGCLVM6Xhdgtd1F9LbbpmjUondahpi3/m+dNiWS5vNRqXezxoXIQRFqniRSV1qWK0C9BvAPuothlmuqVRgihW7BtDcx/DYZsB3NhghCwhzDcBIRF3P9QwFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185112; c=relaxed/simple;
	bh=pV+1D5vSrpBEiPdYYCuKzOStJttNKVhJ4dZ4A9bnN/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfIajNG2E5PBtBKVpIBDTVhWpAXKxXkilPOFvDnbn9jzXyEP4bJllTumAQfH36zAXUOSLQM7hG69P5Hogmxmn45Js8xv6j0XHSeTj/YUSRaM7QeaDDsrhhp9gBqJBYBM+LcjtX52yzo08E3daXzUxhbUvs1Oi6IjZcquzqimn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EXpzXTtC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EXpzXTtC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8facae850so6635ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790185110; x=1790789910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1AquzIApwGo2FvNhSKw8uhRmWAtNmW1t7wHGg5rKrs=;
        b=EXpzXTtCj8ztqUvIft+WiLrzGaKaHL1NXJ0cS8TtZePNF9Wjoe5TiNES6nZ1cLIaCf
         C4DgJgKP4N3FlFL3ANoU5RWJoWlRmWp5XxHVHSj9uHuoxDaVIeEqAdSWJbAJilENn213
         pAtayeMHjOk57biEwRw43UiAbPXw5+vIhA5nAqDdI7zmD0q7qcWHMYrj06LdWuniqhmn
         ogo4zlPHwAKXXgv9uvSsH2wf3o6iLNTyJDRQt+jPE4+gfnq+omDTjUkqmOVhWhfK2J8Y
         4O0adTAXUgpibLcTcqXYlbq5EzoxaLPUmrEd8PQjJ+W9QnnJgUGX2/63VGkn2GlNgT5j
         hfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185110; x=1790789910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1AquzIApwGo2FvNhSKw8uhRmWAtNmW1t7wHGg5rKrs=;
        b=s1m/fEWlay6LlNXG/SlcE5zk/rK971FGXrUQ80iIPM65K0VXkAAzFmeMjudLe/rp2D
         ZiHz57rIn70MURrD3qV2VVwRAJPR1eyaAuRmewEUIvwtUppZDJXLT/gkII9mzAILB9yc
         9JvmzTpEpZ5aLHXa6kW2gv1rETx/Pw15lqgyqe4x+wHcfJP/GoZP3ZVxY5kqhG86Z9Ki
         Yy7PQg423wa1c1xJvb9yqT6K8aY411lESGqjnictKEABqec3ARrQ4O2y90FQTipUxBsB
         7Muj8XXwcw0I4bh2WXUh8Xc9KOTwt9+my8RyM1vPK+loyL3nTlnxeG0qbMb46Ge6ZBUt
         LU3g==
X-Forwarded-Encrypted: i=1; AKwUvBxkRA1jzxip5ag6rkRTKe1mUtrCzX2dJFc8sKwaxMaZV/q1RCOhwAI0FGrUolAvtcMjyzMgKasYs3+xH6SPfw==@vger.kernel.org
X-Gm-Message-State: AFuF++n+HqVH7wPUJz+9dKKSmic3WOMk3RXCFWkU0sMnEbyvNSAweBy6
	p+Ezbaxfg02O8sMkqeL53FlWW7dveniGa6fhC7ULWw0Zi5I5LuPkRBB4eZNdNYt8uQ==
X-Gm-Gg: AYBFou2Jt3Y8IXtFQ85Q3kNEQf5HfFMxr8QS0xeW+kF0Qiq1iX3QauDdLf9w1A6BnJv
	6y21QsVs42Zb+nh9ho8YgnJw+uEKA3KLcZ+6klsOb3E8m/9tO8Ts6oq7smjrtj8osmZXg6Auw+C
	C+W+9gPvR8Qjp22Xoznq9BxVokp3ZAz8fpppS15tGIbUD7vu3PMte7NL5VEs15m/V1+Du3HX+zR
	Jq+D3A2NTLeVWuEq4I5KH1V718zNOzb50kJ8+V/OTZ0R+rfxtZUS4+VKvwSggT0EKJLPMwm0sOk
	VlnIcEUrqKqKOAP971gu+G4ft4k6T9wIL8AsAqNfc1vszNCt+PweHcGgQ0+O/lf8iXFffGDXqRm
	HllK/PNaLL0wDLgF7lxCF8qucg91YYtUCn7kk3RI/OtKXj/YGoqEHagDg3oGn2Wvl5/FUc2V79q
	pqSEsTn2IrZfDzjpN9/SbdK2Kg4/Me6ng5EtzKIHpNamVB0nGldym9Uq0fUtP0CGpw+Wt0J715G
	SpLK+fGDtZxHhDQgQlqnCQv7Blfeh7yEGySNfAK0syqDQ2fQRi8O1VQDNYpx1QMvUNojUBR85/B
	jLT9EJveg0hmbGZb5CVRt6nAJAz7qS6wibEMRcgA0eW0POQ=
X-Received: by 2002:a17:903:90d:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2df7bbd799fmr625835ad.5.1790185109816;
        Wed, 23 Sep 2026 10:38:29 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5c4sm119346a91.5.2026.09.23.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:38:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:38:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Matthew Maurer <mmaurer@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v4] rust: net: netlink: validate attribute
 length before casting to `c_int`
Message-ID: <arQOkOAcTTt6dCyr@google.com>
References: <20260923120504.9100-1-sagartaunk@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923120504.9100-1-sagartaunk@proton.me>

On Wed, Sep 23, 2026 at 12:05:17PM +0000, Sagar Taunk wrote:
> `put()` trusted an unchecked `as` cast from `usize` to `c_int`.
> When the length exceeds `i32::MAX` that cast wraps around to a
> negative value.
> 
> This ultimately resulted in a kernel panic when the reinterpreted
> value via `__nla_reserve()` and `skb_put()` became enormous.
> 
> Validate payload and header both fit together in a `u16`, rejecting
> any payload that wouldn't leave room for `NLA_HDRLEN`.
> 
> Fixes: 5eaa5fbb6e6c ("rust: netlink: add raw netlink abstraction")
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
> ---

LGTM,

Reviewed-by: Carlos Llamas <cmllamas@google.com>
