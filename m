Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46BF33F36D;
	Mon,  4 May 2026 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929184; cv=none; b=QSD0lGshsTgNFc4slVcQ42X6OoKNmfGz/amFmU5dWkNYo0Ryo5STiCdLxvg1jAF9zUQU2eHFNQlepjApRqr3IEGlFexYLWGdOiq8ii8Hm7Z5TItgFMoXWnlYAucYmrkWqGEFNtFcOsbiNaS8AT+nnwD8J2J2kXyEdQWeVL3BMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929184; c=relaxed/simple;
	bh=qMrcT3rWp82wlM+oByr0iQfTYv2xzPHn/l2oJX1FRLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8aSZwrI1vNqqd86b8fTRRvo8L6VV1f//A+o5IM6qb9FU/KfHwuSmgFRaVDH1m+thXHpen5UOKVCY5jg6xQPda4PfKLci3QprYbzJ2w3Fa/eZi6ZrS8HCzZszIXq6cC3XsEeGWTSP1/5XRvcOAQXp/2AkmLtOf7pq/xk8iyP4c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W+bPS7pO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W+bPS7pO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2ONsSVQZYdZPXw4LiZQJCDXZopFTGMrU4WZxjy6F71I=; b=W+bPS7pOOBlfBobURqj7ZjXwPJ
	58izSrRHHRo+K2B7p9oM7x1JP6FMXEwHv3sqcT43kaiULBf5OFjrfkiSSVD/HM4gbqWYk0A4gnRRB
	dKKobNAJ/+a4E92QOCjtiRhmDDXaUZoWwCfVpYL7Emn+V6dbt35GOzGBt4JK6Fngqo0vQ8ZjNOu3/
	F3kuUWfCC108WyTPGMosL7KGAN7iRu1BjNfxgmwYGhXJGt1ouPrxCA1Ic/pFAxXS496nTkVoS0DQC
	o3MKiHn/aJ45PKlsxbmL0hk/K61jhd1FQDk87TE+nyPJaseF3Dji748nV/lfRzc/iXn37QTe6+RUy
	957brIjg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0b8-0000000EKgF-00Ak;
	Mon, 04 May 2026 21:13:02 +0000
Message-ID: <d303200a-9fc7-4ea6-89ec-90c2a159bfe2@infradead.org>
Date: Mon, 4 May 2026 14:13:01 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Improve process/maintainers output
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Joe Perches <joe@perches.com>,
 Matteo Croce <technoboy85@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cover.1777908711.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> As promised, this series improve the output at process/maintainers:
> instead of a pure enriched text, the maintainer's file content is
> now converted with a table, and has gained a javascript to allow
> filtering entries.
> 
> The initial patches change the logic to split parsing from
> output generation. Now, everything is stored into a dict at
> the parsing phase. This way, it is easier to adjust the
> directive handler for it to produce a more structured document.
> 
> Right now, the entries are sorted alphabetically, per subsystem's
> name.

How is subsystem determined? Just by the heading?
The MAINTAINERS file doesn't stay sorted so the output isn't sorted
unless I am just missing something basic.

See e.g.:
DRM TTM SUBSYSTEM
GPU BUDDY ALLOCATOR
DRM AUTOMATED TESTING


-- 
~Randy

