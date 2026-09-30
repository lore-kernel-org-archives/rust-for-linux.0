Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687374FDA77
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778275; cv=pass; b=FXLzCKVQqKMhynj93wno7k/b9d5OJMDOlJQU4Fg4uaMQhGomH5w8wapiYntB1kedPtUAbA1Ixvi7aVSCtU8lOaxD1ja7Oxy8blhmpXZiM1aAMrpOWcAIhBblTDEkUTADUgyrn3nI8NMp4EC7YQo9+M3B4TGezbUB17+2oXqEQWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778275; c=relaxed/simple;
	bh=9AcG3Bf/TJyVMvU8LCLEiBB8yyyCf0GJT1IqMscVjJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBdsRcU57bQDCRNPYcaOxibAzByRQ91rMmva0JnETrxAqQwSsvJ8V60LFjoLbEC3Uiwbuzw8CYAqaEojiBjGPWfL8618fNlS7LoTxwcMDiWUpESzDtZ78cLH6cSzXiniyI44ChmYmo5IIux8c/jKIxmq25uz5Cqpp29lh+W3vQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sk4kxMWO; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sk4kxMWO"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14b1b157591so60289c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 07:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790778261; cv=none;
        d=google.com; s=arc-20260327;
        b=d0r84qvKKVJV3TZKp/QlQ2xJ81ARErfDPzpCQ1CqS3sTUQ7I63bqnVTOPPt4icegrL
         mIBPZl7TLjMZXO7pZzyfnU/tRfjubT6JOmNonxPU1rBJFwjfsXs3Y7mcUWPEYwd7yVUm
         4jwBeNv+wIQ7R9x0MxRcsCuXz/omZZy4eFfp5Yv/zwUKs6KfLieusOzLJIIUVH2emXbP
         h4tpIqB1jxclmM+mQWDzS6vPJVKRVDkaQ7aNcG7IYicQ+yyBZlC7yb2V26HHUtk5+ORS
         9Znlj702v4u/9tN/NrjqCstiwhVLxLOhzqf07BjU98WypR6WUAa2FEqtRiOtgKs3CsSy
         x5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9AcG3Bf/TJyVMvU8LCLEiBB8yyyCf0GJT1IqMscVjJ4=;
        fh=zGgiI/v20Sh5I438Mn4dFXbtuh4SKA/feqmOr2enD8I=;
        b=joK6pIXntblKZMWfuhp9iK8ah60rb9kuC0TjymJj4PBDQieopATr5CLuMGvLpolU8J
         Ztgz9y9YpFEKHydmNuzcJKYbK6cG6HqRo+tyZ32EtQ63qRfCH+OVqgagei99ZbLRhWAe
         MhqOWbxz7fzfAlGDj7UIKn6KAYelfJ8PGL/elH+G0ptXX6ygdkLGGqlBlekt11AMaLDq
         QpwL9KraA0hf377lo8Pj1sxqUTVEl466IJZlLpsCRdPNkfHq0rwgEBHsZrpjDVKhKkmp
         SZBkxylHIkwJTo6pvzU5t+2zVq+j4SGtFX2ZJWKVgF8YiGlXqxDHD21VY0Hy47x0tU/6
         t24Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790778261; x=1791383061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9AcG3Bf/TJyVMvU8LCLEiBB8yyyCf0GJT1IqMscVjJ4=;
        b=sk4kxMWOVVnaTOFZf432GocoRBL677Xxam0UzbCB/QPuPLbkh+zM0j3MLH015uOyMc
         OMjeCYJOSJfM8k2NViemZBwjfB3j5Km5eXtm3B2sRIIFpntQvamJY2tNRjFeYwelz99n
         E8x49WNiblIR+vreI5TqBqXmNQ7HZ47ln8wYE4emKxG9hgFm1coZajsPDrq6UFz3ohSm
         jdYAtzXI3WAMpajTg0JuFVmNv3TXD2sa+SED98irgGnMdf6Le4bW26NkY5wMqERrKXTP
         I3CijC3Ebn/w6GMmcHnmOeHceDHCheEzyRO8eigs48GoQY8GYw1TNraN5KpI+dAYcbaZ
         TpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778261; x=1791383061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AcG3Bf/TJyVMvU8LCLEiBB8yyyCf0GJT1IqMscVjJ4=;
        b=K430WiCI3OBZmCTd22jiHf7OZi8YaFAqjPcbFWvSi9Rlq6ZeF2UCmys5TFFL67YmA6
         qfe3H0Y2AHbvDitOSn9NKeS8TIdu46ZNt0sKotGc2pNm4Zc/cGpBcMhkgpNYvfwRiLt2
         2Mzh4RKgYqWWC444s0d0Whdu/LJ5jr6qkTrgD2L/cD6yT7rH1nm3WFGlHze/hPuXMbr8
         If16UjX70Fv+fo8cklGfH7Y1UOsQ94Sm9unSzneaLkUzqwAET0WTU3zgaZHDa9pBTiq0
         bF93KumRuycS+1Szo9crJL/vrIS8r9K86IxuK+ICG7H3nk8arpcydZLan2x/aGn20yq3
         2HDw==
X-Forwarded-Encrypted: i=1; AKwUvBwMnt6Mk7xV2yPCZ6KDFEqyIXaDrCNqi24HfXNKdIHZfHGxPCgFAolJR5behn5rB5vf9cBRiip8UhU4WgnVQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKx7HSoYtXlHO67ezgmRLzD6RE3ruKwJ5mR52XVsVPq6lpc+E3G
	V2Z7ItxiJ4ENnBRL8vU/5pLojej9O2EhVOPdlPgssluz8Gxosir7JyZ9sXWBowHkcsAh7ZOm5f/
	ZdJjQQ8rXSMcoecNgriuDzxq7FQjnkzI=
X-Gm-Gg: AYBFou0hCN5uqroi8i61LU8OQUHZJVhqJbEDOPXAW7kEFzanmr8k4rhRWGX80a5qLwv
	JXv6DPgtyuaGMIhCBfY/dAVEfjuKB2YKu58Mxeu/3BamFxgoOho6GooHW/WK9aTUbikT1Q2M4jS
	HUzgjbKh7LCOvJhcppBsH2SPik4fVSzpUbBduVOqImsBaIto5cJgEFfYOA8PpIFF8XWP1WWU/92
	yDE1Y2YqMy9Ws6DmlLK9lmJPY4fnBcvVd5tGD0RmPqHqYazHYjbUKF3d9JQYTf4BWLiPstwlNdY
	DIBzWBE464x329xGzBPjOBmIBMQXfFwzy374zPkPlIXUjQIHf6W89ftXXx6sqsdukstC2TYjJik
	G7wGJ9HNyVMoH7jkrw13I02HUirh4lsK5uAl8o28WskXuXVVwGI6mj7bKiEOC5LnrC71MkWiNP+
	2136LPycKT2RbkcUm2UNMAKPrDvry76lYEYjio9QfMCPzRGcU5uvM=
X-Received: by 2002:a05:7301:7309:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34cdeb6be9cmr2983232eec.2.1790778261266; Wed, 30 Sep 2026
 07:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930123645.302318-1-ojeda@kernel.org>
In-Reply-To: <20260930123645.302318-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 16:24:08 +0200
X-Gm-Features: AclHuK8GB95XWuO8LKxnbuc-rexw5qTBlkNwTjmQZMYAdkZPzMK378NIg3-sfCs
Message-ID: <CANiq72=kA67u9vmvAALL8ibWEX4AnvkWB9ncj2Kce8DtxVpW4A@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: fix VM_MAYSHARE blocklist entry
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:37=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added constant helpe=
rs
> for the VMA flags and blocklist entries to suppress their direct bindings=
.
> However, it listed VM_MAYEXEC twice and omitted VM_MAYSHARE.
>
> Thus fix it.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` to go next to the other one where I noticed it.
Thanks everyone!

Cheers,
Miguel
