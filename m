Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A021B8F6
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984758; cv=none; b=GECA/vvLR1CDQzKH/uSqB3iuhJmn039MyqFhGyNnuEZaeeEe0w0hE6hcRlJm7MjFU4yJaGsff5Gpccr2ZkwdGF/7qAn6Jlg6SJ7UlIPUrqKNe0irjk4WXxLECAEwpn7eMRfvL0JjJbgTUl6fUBYsNI3+CJNMh/IFm9mY5JHQ3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984758; c=relaxed/simple;
	bh=E0ShDCdu9lAOMVz7ALM4jbU551cKu8SSMbDSrCRZxEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0rro6JikeETbezly5TXTW1JnxJBIsHhIfptYz/QilADiXuElvS8kshg/ZY5GdyYs9+b91eVwM95rhNW9PfLRmR0YNFzcNGUW06rvLPcWTWEjqxgWvFNP+WpjzGce18ARmufKoHhIRsllp0rASH4C04Xw4hwoFqNCihAU/ZX5g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6ql+FeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6ql+FeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CBAC4CEE9;
	Fri, 23 May 2025 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747984758;
	bh=E0ShDCdu9lAOMVz7ALM4jbU551cKu8SSMbDSrCRZxEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6ql+FeD4AFFmKKjw47tjsuBVAqf9jtS0npqWGk3pkKq/ji4wg2/M9p3mGZNEkp5F
	 lP1x/SjEBOI2Ihf78j5nfdRRPMHb/4pNyXwfyVS9pxN2TUcf1SCDjkcb8W/aoFOIKp
	 AY/BWK09Br3j+yLyeEwB6kwoLxyrul/MzoFr8EVdH5qWMWcaMu2ar/SOcv0bcFqS4t
	 vQvQgHvxV29GNOTk22RUgKZT6nrLCcFSoctur79u/XkvFvXn7PxA387EleEulfpg+1
	 Y9v95a+MS60JrgG7axsv9OIAgcKPLPHxPZHECFdWGDZnkn9XeX98BVkw3pyshpUkS9
	 xA67iJ0A97RqA==
Message-ID: <2390300b-49d0-4fe5-81b5-5a9f3fd9e300@kernel.org>
Date: Fri, 23 May 2025 09:19:14 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 2:26 PM, Benno Lossin wrote:
> I'm not happy with the sentence structure, so how about:
> 
> * `data` is valid for reads in two cases:
>      * while `is_available` is true, or
>      * while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.

That sounds good!

> * `data` is valid for writes when `is_available` was atomically changed from `true` to `false`.
> 
> The last one is needed in order to call `drop_in_place`.

If think for this you have the same conditional, in the RCU case you can't call
drop_in_place() immediately after is_available was altered, but have to wait for
synchronize_rcu() to return.
