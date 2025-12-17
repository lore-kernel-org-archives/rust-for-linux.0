Received: from sg-1-37.ptr.blmpb.com (sg-1-37.ptr.blmpb.com [118.26.132.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398423C503
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936481; cv=none; b=HlRA0LeJlZmL9DbO1od823A4oQMZUgIvVQ9I8wdVV0borpVlfOkaYuTk8eDKt7hJUBnbIw64P3Sb9EAyciiluziLq2nT0KW05faBWDl5ioeb/csLMdqE+yoAWg2Oj1Kx/WHCD5wAqNg6vGbqV7+MLrmkz8J8ijVUojrhfe1z1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936481; c=relaxed/simple;
	bh=xCNeTGWpco9hZgQfPFJJXbjPdxhSp/aTKjAH52lcPdU=;
	h=From:Mime-Version:In-Reply-To:Subject:Date:Content-Type:To:
	 Message-Id:Cc:References; b=ka3rluLZiGyBT4xGbbIjlv7euwgWg3aM4J9w349tWMGwobPga1BZirHFfv5JdL8nEUhTouNDh8BKjVh4zxMAvlUctWBj+GMcjYK/ajEL1a2MWL4YuaH5F21q76CzNF6Zn7dYJwHeTgFb9vfDQ3z9HVGIkkLZFNTysFt4xHBlRxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=r9d/9pL+; arc=none smtp.client-ip=118.26.132.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="r9d/9pL+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1765936461;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=I17QoDCS8yY5hOoxaNQpUDI9OhKV5ghr80lrutUntf4=;
 b=r9d/9pL+vO7CtUa5+kQj0J+l0XB6P0a6Qq1dhBq939dXLWJRHprWVzzFgxrA5CCyPQRJRX
 Jt4g6h57KMhJl66xEfofQW47DHFin4i7ukGiGImi4JecWk8a+T/3RHpve9SKbrjllZya2q
 aA9sEaS5zlTWnVnIF77bs4cqA27LzC6zHbF+kUCtRMFJgy7oFlmXtxq/90yz7hjoUe2tKJ
 PF7doigw86SMFnxiNgluKWL7gEebBBt8kH37WlpNZRRtqCuFzjTlM7m6e3VwfDIF9/oBk4
 Nmul79mvpEsHms6evII1XylugdqeNUafGnnQeJeRaUSWfZlIkiHfDYeEX55vBg==
From: "Chen Miao" <chenmiao@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
In-Reply-To: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
Subject: Re: [PATCH v2] Makefile: Remove the product of pin_init cleanly in mrporper
Date: Wed, 17 Dec 2025 09:54:17 +0800
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <miguel.ojeda.sandonis@gmail.com>, <tamird@gmail.com>, 
	<da.gomez@samsung.com>
Message-Id: <6cb9eca3-52bf-460c-ae10-3b977197bc89@openatom.club>
X-Lms-Return-Path: <lba+269420d4b+8b63e6+vger.kernel.org+chenmiao@openatom.club>
Received: from [198.18.0.1] ([114.249.193.37]) by smtp.feishu.cn with ESMTPS; Wed, 17 Dec 2025 09:54:18 +0800
Cc: <hust-os-kernel-patches@googlegroups.com>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
X-Original-From: Chen Miao <chenmiao@openatom.club>

PING?

On 10/31/2025 10:32 AM, chenmiao wrote:
> When I enabled Rust compilation, I wanted to clean up its output, so I
> used make clean and make mrproper. However, I was still able to find that
> libpin_init_internal.so in the rust directory was not deleted, while
> all other corresponding outputs were cleared.
>
> Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: chenmiao <chenmiao@openatom.club>
> ---
> Changes in V2:
> 	- Add the `.dylib` to mrproper files.
> ---
>   Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b34a1f4c03967..b38b2895e1e4a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1590,7 +1590,8 @@ MRPROPER_FILES += include/config include/generated          \
>   		  certs/x509.genkey \
>   		  vmlinux-gdb.py \
>   		  rpmbuild \
> -		  rust/libmacros.so rust/libmacros.dylib
> +		  rust/libmacros.so rust/libmacros.dylib \
> +		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib
>   
>   # clean - Delete most, but leave enough to build external modules
>   #
