Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686621771B;
	Fri, 15 May 2026 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854082; cv=none; b=l4EPchQuyoPrUPrJbDwjv0BDDwd55FMLj0t3DNYMMFXgmurOYfF8ql5nXs/d46uXM/n5YYGYZ9JLmNMi2seD8fqctSAAMjdd96XonM0f45H1n3t0+Hj8D0XxDZFX1/azqqRkSpEX5NcUhgflFKRyzzwnnl/0gYNjkH/bbVEb04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854082; c=relaxed/simple;
	bh=5Je9qJDQHUmKksf6M7wkN/UCibG/n4JN6VJ9BQsIkKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XcgTnajz1okQ92rnYyXJmSe7B4AjAZ99qWcPCalNOSZSTuXFlY/td+45pU0yYJamw7vGAAnTKLJDJcqW790ptp0kaDVQ/ezBdV32gbih7xUe9hp8HSHmdAjgy1avHOKj+VxZh4zYuMRWUiAgHzYoV7hmCoc3/u25G2L6IcHslXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=spZqlwJX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="spZqlwJX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40BA4410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778854080; bh=7mj6lsxeuqRuDfxWMifzwdMgNMY3D4qHHh8yjBVSBxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=spZqlwJXWPMSr4J60NkzpjhiOqJNHRzU0PZ6jejUicA1JjA3bYlRp7XkNStvtc//+
	 YLJHfOwCqBoOXP2511iSUbJt2SlnoyXTUrGqOLKZ6mtg1bHyXo49waArXP8ZpLH6ZZ
	 s7pid7P+N8h9Q5y+pqpsejbo1dfeXVWM7TxfCYRfLPZyQeYUcFIEOmkY8k17GrtsoO
	 AaRJgZWYa4+YbXjyzJ+GdbJrjnQYtmpjFlvfDa2WLlm+DsCWn07Tcv1oX5bsyM23c5
	 zhasPnr2se5PXJTtNlSzDkaSXGB6UksfnOwF669OO8r5WU4b/1DN2CLGq5fi7yEgcW
	 0YyZPSJ3WknqA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40BA4410B5;
	Fri, 15 May 2026 14:08:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo
 <gary@garyguo.net>, Joe Perches <joe@perches.com>, Matteo Croce
 <technoboy85@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Trevor
 Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Date: Fri, 15 May 2026 08:07:59 -0600
Message-ID: <87zf20rcjk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series improve the output at process/maintainers: instead of a
> pure enriched text, the maintainer's file content is now converted
> to a table, and has gained a javascript to allow filtering entries.

OK, I've applied it.  I've wondered about including the MAINTAINERS
stuff, but I must admit that the search box is kind of cool...

jon
