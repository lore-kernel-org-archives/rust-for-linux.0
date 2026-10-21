Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602443;
	b=M6SNpUPiAE4S/o4rf3TEBxylPNackPY9cQSfMUWeSZ+WGp1SPWfib9Dd+KS5lC3NKr2C
	 dFZUM074CzkdhBaboFcNRrpKBCcFmXe5piMb4x03CqUgy14IRam+oAq+I4F055I5k68eB
	 qruEx7muAkbZkRb6j8uMMPoBc4U/CtKs/0vCaeBcKgpTw1dROyioSpwqFKNnYfSJ8ITU3
	 q1FqjE5seP3so8NbWm+FG0B7i1yppQpSN1yBLlea4tkoP1CWLHj9DLqSQXTl8lNeFZgaU
	 DoUbvLfdIwvvwmlqZsuyT18QSzSiQX1tYVqtTZw6P+iPO1aQYaYgIA77DjkpIFtrkOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e0R5eQQgTdpSlU+oUfRU2hbSIpRyLJ1/Cjf8UXH8R78=;
	b=cimYRxQac26LV5UxmQOxSgvUgTaB7GCEjX/OaQXbFzMiTN8Mj81F15bEQ5i4xKCJHSD8
	 GiD0hFxyrOrfWnZNzZggkbm8sU/UowlJlh/016A2U6+gKOJhBKDOJQ5yfUs7+clTZpDmY
	 oAIsji/QvC/9x7iunDlxhsjvF4qwbkUM3pgEztZZZiIXbk7OoF86MkH6TdGuFUSBjyK0y
	 CxBEgmqH2KsYTLNsMMPdulY/591cG88EYPxZHBiULItYsDZuidglc7W80/mj7fo6h8Ifp
	 Cfrc2fft5qxFY/R3uTLllQQ9Y2G31CLhuW5iTFhttpAe6tXhcYmJ//nosD4MuBYaNGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F9h0RjGL;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3992606A31B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 17:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3992606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F9h0RjGL
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5363316fa0cso11307671cf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792602442; x=1793207242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0R5eQQgTdpSlU+oUfRU2hbSIpRyLJ1/Cjf8UXH8R78=;
        b=F9h0RjGLS0HcXPP8Lzs70DqrmIbMaklOZic6JTfWxOKvcoT80HSKNpl88Y3z4SuFex
         K0sa3BpTUNKpl1nH387ihAHymr8rCGkE8591JkZxYJkVv5IPpGOa6V6pm7y5aHUnOlwS
         RzxzvOns3zn7OqUFZijDG3I4WyRyWlKE/VUG7FN+Qcg4gj7QJVVAx2CPJfP3sFcmHWsW
         BH/NRLuL3cNa6l9chmS+FjCv7BZ9HyxAa+SBaLfVyfbIjBLpUwReKVmvkXYgk5cof3ei
         Q1/wQMXNF++xOiXBYp3CVn4FKSvq5r//TZyig175cZxg64B61fmrRxj4cgi4jswVaO1Y
         3M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602442; x=1793207242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0R5eQQgTdpSlU+oUfRU2hbSIpRyLJ1/Cjf8UXH8R78=;
        b=jiFMd0niDMPr51BwjUkyzC0XJsXdy0Sgb0bAzwAnF+ycWda/rkOpfe3P60KMjqrk7X
         /9HtfWYFFPkRL4xye71/Q1wyb4myX34lXxqMoHAUB95E5TCcxFly54I7OiHjyMAetzz3
         YkAUX81F3Heegq6rjMdseL8KfAvHybTmTJuT7GW4uTUB3ul54BsOhuqTScd3gbTCoBLv
         IA1FqwF6Qh03MSflip8ucGnNi3R1y4HUYS95IpT35A8mrL+Zub/R/UOj5RnH018F7Zlj
         O3jSAwHpYEwxO0dCDbJyIPEIYGXDESA7VKnk6hbGwxXSoOBeTJwzT/91ebvrweFg+TtD
         urNw==
X-Forwarded-Encrypted: i=1; AKwUvByKWqt4ECvkmoL2KQQ011ag+3FHhfB1QYpNpv2IfyMoYQhd93C5YBijbMLzipxggU7EP8fo+WwFrIOmDuQymg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+jF47XG/OGzeoqw9Xdw3ffvEo5t3j4LR7zG9CBilgezDbS5B8
	mFYMdlTENACgDsE7J5h7PPl1Lo3E5i/h15q8TM5ANCmme1y+xMR84RJqz52TcVEeMUo=
X-Gm-Gg: AYBFou1TNu8Tv9Mq0BUNO7WeVLmANjU3lci+ihLE5XG781qP62iC0xxj6n/9rzLjvGi
	Kkm3Do1/NVaUMmFs9RmiJd+kCmSF9sBPQPe4vZ2TzZKjd2G+8zDCW3lLljYrMZVGwg/IXTDR/0c
	FKEM9xVN1dCf5PyMQCeCuak0Hi8B5CbInKS9iW8kwzIodj1LBX6LgHxCvzFrpKGhn0yeLMwRV5K
	hHI8MyqrFOkx44Drz3C0ApApNIanG/1O2pOfy0OhwWODCLS0j2SRadmcLiVL1N9nwUSQ6p3D9Jx
	aDXnuz1H+8Q/HqP4HgBl6tOL/Na1JWl0/nIB1cnZkdq+7wQH2bOLA/qfR7emCsDWh4kiO7m1cU0
	OI7xTcEbQ6W5r9QlodL5L6NGGCmAjLfhKJ4R2QwKkfiVnMG134Qh6UaaFumuMKSXyeZ3/xtcneG
	j5xQ9XPfTvVuVPiFhjyu0LQjSbr9mPe1qmscr15G5jfbUhdVK5kdj03vzbn8f6Jv2l6SWAQf7IF
	0nEAldEgbpv2wQx2xykdRYySB8Fvrrpyk2HzN2g7WV9WIk+Z9zod0Z9FZZObj0pijSvuf/rFavc
	MvWDDvKaO6rHZY9nSgC2s2bycGrFuWXpfFiz0oURjlJ+WLfXNZiYgiA81V0=
X-Received: by 2002:a05:622a:e10b:10b0:536:43d6:2a94 with SMTP id d75a77b69052e-5369b813476mr30068181cf.34.1792602441721;
        Wed, 21 Oct 2026 10:07:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab7624c1sm4234501cf.19.2026.10.21.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:07:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJZmZ-0000000E9s9-1fwu;
	Wed, 21 Oct 2026 14:07:19 -0300
Date: Wed, 21 Oct 2026 14:07:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] rust: fwctl: declare cfi_encoding for fwctl_rpc_scope
Message-ID: <20261021170719.GU14213@ziepe.ca>
References: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com>

On Tue, Oct 20, 2026 at 08:28:37AM +0000, Alice Ryhl wrote:
> Currently, VTable::fw_rpc_callback() takes scope as a u32, whereas C
> calls fwctl_ops::fw_rpc with enum fwctl_rpc_scope. With kCFI enabled,
> enum types are encoded distinctly from integers, causing every fw_rpc
> indirect call into a Rust fwctl driver to trip a CFI failure. Thus,
> generate fwctl_rpc_scope as a newtype with a cfi_encoding attribute and
> use it in fw_rpc_callback().
> 
> Cc: stable@vger.kernel.org
> Fixes: e052daab94ee ("rust: introduce abstractions for fwctl")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/bindgen_parameters |  2 ++
>  rust/kernel/fwctl.rs    | 12 ++++++------
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied

Thanks,
Jason
