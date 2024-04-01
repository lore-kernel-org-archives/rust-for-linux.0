Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0228944D
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Apr 2024 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711975681; cv=none; b=ADcA1tI1jIP2vEox/KQbDoDtPBNs915K31oJL6GfgerA6rvwKTZDsAk+8dKUt3mNjG1ScZ48KrKqZGkEybhXrQEw+epX3f7zgsaQk2lm/lBG+5D6hZbqOgVIH+OrSiNcK0fDuvZVCrp60o25a5y8dtFEfZrYmqdWCbOeq93B9HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711975681; c=relaxed/simple;
	bh=sa/1vnP1bMfqUv7FGDwc5P2h9QTnmQ1J1xRzDxsRbZo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zkd3TqYpWQ9lPWOF2xGt2dFSySrXjSBvlGwEJXbDo245ZPeS/u9C4EQqEEhapHlIytQzGqpe8WGogI1GsRtrrDMs4gu47aPBBZRs5qG0TXnyGvoWAm7V9kLeQlvbD0e5A62PO680YsDdxb3zmBxQMGpRb2fZEjzPKqXBreAePUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WmKB6qUI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WmKB6qUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711975678;
	bh=sa/1vnP1bMfqUv7FGDwc5P2h9QTnmQ1J1xRzDxsRbZo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=WmKB6qUIViIIM1gV0No96oW9Y8Lk1rYMHjpj8kC9KB8zPi0WTcy3RPGoTQettP105
	 X8HPfwxsyAA5MRjoFUnqVk5jaK8PQK5AY70fP+Mbk+5qOivkQgGdwrP/AQMlR1rns/
	 AkGq04b74kCKOvbkb0oEgbRjf6PMpKktPKd5xirPzACtyNRWcVMIqGdIBEN9oopJAL
	 BK58oSeXxykj5TooGMezGmnU21HA2tOutkQEu2iaJ6uYo0/bdlosunJitmyD3zdpUv
	 YqxtNbGXpjUeMtbJanpzydGZHlTpUCinmsFk7zVBdXkFMe+YDFf0eX/1prq6NpxIBJ
	 caMc+q37ZfxTQ==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 126DB37813B6;
	Mon,  1 Apr 2024 12:47:52 +0000 (UTC)
Message-ID: <bc3a91e5-d8a2-47cd-afb2-fde963e1cfac@collabora.com>
Date: Mon, 1 Apr 2024 17:48:24 +0500
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com,
 rust-for-linux@vger.kernel.org, kernel-linux@vger.kernel.org,
 dirk.behme@de.bosch.com, kernel@valentinobst.de, kernel@collabora.com
Subject: Re: [PATCH] docs: rust: Add instructions for the Rust kselftest
To: Laura Nao <laura.nao@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com
References: <20240329153025.150112-1-laura.nao@collabora.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240329153025.150112-1-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/24 8:30 PM, Laura Nao wrote:
> Add section describing how to build and run the Rust kselftest.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
You can add following after fixing comments:
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  Documentation/rust/testing.rst | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index 6658998d1b6c..b5b99e625a01 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -6,10 +6,11 @@ Testing
>  This document contains useful information how to test the Rust code in the
>  kernel.
>  
> -There are two sorts of tests:
> +There are three sorts of tests:
>  
>  - The KUnit tests.
>  - The ``#[test]`` tests.
> +- The Kselftest.
>  
>  The KUnit tests
>  ---------------
> @@ -133,3 +134,22 @@ Additionally, there are the ``#[test]`` tests. These can be run using the
>  This requires the kernel ``.config`` and downloads external repositories. It
>  runs the ``#[test]`` tests on the host (currently) and thus is fairly limited in
>  what these tests can test.
> +
> +The Kselftest
> +---------------------
The number of dashes are more than required. There should have been error
or warning while documentation building. It should be as following:

The Kselftest
-------------

> +
> +A Kselftest is also available, which verifies that the Rust sample modules
> +can be added and removed correctly.
> +
> +The kernel config options required for the test are listed in the
> +tools/testing/selftests/rust/config file and can be included with the aid
> +of the merge_config.sh script::
> +
> +	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
> +
> +To build and run the test, use::
> +
> +	make TARGETS="rust" kselftest
> +
> +Refer to Documentation/dev-tools/kselftest.rst for the general Kselftest
> +documentation.

-- 
BR,
Muhammad Usama Anjum
