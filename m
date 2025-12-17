Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159C309EE4
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003992; cv=none; b=dwkXcp2EyQJ7ESEio/2uy5wptluKjeashiwYDWhacEcd3P0BXNYvlsVjwjlCkfcPHGyHnDRwhVX7OF/nCf036JEcg2J0gim5ICdXa9os36Jkn/ZSz22JWo1qqlY/P0eLrOWv1KOmmg6Pk5tZsz23tL1eQPeZZBUSXJ+UMjBQc7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003992; c=relaxed/simple;
	bh=/uBNnphXU0rjVmgr2q4UmXoMHsYzPtaEbSgh0Iw1axk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ThwoB5ldv595HwPcTyofsBZcuGd2HgXx6C9GZMuZfQRg21UQG/zEwgBHbKLwufCdcSqdH+bWydzqFTlLyN8j3lIhMIuGILon2DW2lzUIcd/7jTpznXKScoFbg1VmwMkC4/WAX5eTTnDfrMj0IPQ26J5haRXTzyMwXS3UWFKrnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yrYiaNA2; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yrYiaNA2"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b801b94fedcso57520266b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766003988; x=1766608788; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Um2cszXZJr/pG1Mv1V8QtZtgxoz6p014sDFB55pUeE=;
        b=yrYiaNA2J+jqIEFAd0mUPodho4075I17O+GIQOmgxl2UNf6cFqQl6mwsoaxcZPybNV
         M7bguExcWkwtH3XjFPcR51+HkU/Jt5rmSLF9wV3y4xLUykI9BWmxbTtZ3vpJAD7T1WrF
         zzeyRXnfsyEPiJ2tF02ArR7KY+BzUrFkBP9fwEEkOtCQMUjKj59MsNx/EClfoLeOPcgQ
         IWMsloHlBY33gssgOuDxheIdQzZd63LF6+cMJ+cywa8yXpTTRmobyGOYlMGpRi+P2Hqe
         ACFj/6WqgWB0znc114fvys9kbnvjOUVtHwsewOquEhVKaFf64uuRdaOqszKA38gjD0FQ
         XUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003988; x=1766608788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Um2cszXZJr/pG1Mv1V8QtZtgxoz6p014sDFB55pUeE=;
        b=junJYoDTAtj48XATe5C3xEbPIW6yzwDw4pWJc3VhVBx6FJ228GkdN6LTej3EopwTlK
         2bfAHeqSUEXySLftae5hnCX/P0/InURkKhj29QX8DtSwEB7YZOkTaplP1RWm1fr4sou4
         nmXjWysKb5m2/62JZHAWJHX6R4g2wCkTw2RBwHcadk4OUaeDGBePa1FwByXemk0IH7in
         Q9OjMlhyptUaJct2mtX+PR9wiCMarUI6Hz0v/Md07YZWB5kA8uVNy7PwMVDt2gzstxO0
         /miEhiLFpwuFBgp0MWsX5vHHzpHO6sq13Lp2oSk+JOR1kpEybjDL9zMfCs8izhdMxFtB
         5rww==
X-Forwarded-Encrypted: i=1; AJvYcCWhMapoPMZ36oBUJqEoNt+k+Z5O8qMHggm17zSGt9rvaiYfYRLNkzypnacRtU9Y8z14S5StH99f8tem9XnKog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYq1I6DdW7Ne3MJ1GMdSZPI7Tdnen5UdwgPHnOjf/NWf+p3v4
	fqwVRrBAUV3qP085IqZ/GmpqrOQyff8EFQev7yPl7A+Ky9DwKNSa6YdAzU00no6wqn7q97cQdvc
	C813QT0gobkspnhLEsw==
X-Google-Smtp-Source: AGHT+IF5FgPrVLQko51RhPdl0jo/OMBpR+5bDwGGAuE8Pom6j72aqaHt53eSQ849fUmu8aFbhndwKK1ISeHaDKw=
X-Received: from ejcsq16.prod.google.com ([2002:a17:907:3890:b0:b6d:7849:5800])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d92:b0:b76:4c8f:2cd8 with SMTP id a640c23a62f3a-b7d23a6db3bmr1995360166b.55.1766003988340;
 Wed, 17 Dec 2025 12:39:48 -0800 (PST)
Date: Wed, 17 Dec 2025 20:39:47 +0000
In-Reply-To: <JH0PR01MB55140AA42EB3AAF96EF7F3E8ECAEA@JH0PR01MB5514.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <JH0PR01MB55140AA42EB3AAF96EF7F3E8ECAEA@JH0PR01MB5514.apcprd01.prod.exchangelabs.com>
Message-ID: <aUMVE7ZbiDREijFl@google.com>
Subject: Re: [PATCH] docs: rust: rbtree: fix incorrect description for `peek_next`
From: Alice Ryhl <aliceryhl@google.com>
To: WeiKang Guo <guoweikang.kernel@outlook.com>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, akr@kernel.org, mattgilbride@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 12, 2025 at 05:31:10PM +0800, WeiKang Guo wrote:
> The documentation for `Cursor::peek_next` incorrectly describes it as
> "Access the previous node without moving the cursor" when it actually
> accesses the next node. Update the description to correctly state
> "Access the next node without moving the cursor" to match the function
> name and implementation.
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1205
> Fixes: 98c14e40e07a0 ("rust: rbtree: add cursor")
> Cc: stable@vger.kernel.org
> Signed-off-by: WeiKang Guo <guoweikang.kernel@outlook.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
