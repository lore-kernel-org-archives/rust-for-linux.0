Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D7672617
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753110370; cv=none; b=tHtgqmDIZ4O2ZNXG8qR3DgPR+lnHaVYSHeUK5V4HYEBdNppAI6EOMg/i7lTueccNfRpMIJr58xZ0GZrG0O/GBnEKRdfGUhEOmp5R+G8jensEJZUqS1xpp7dMLH5nMrQ6jrp69b7BjRp30Et8qgHsnUU0ak7mMQOsZWOXCvmd8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753110370; c=relaxed/simple;
	bh=3ZDzpHnQOUHziQ8M+YM8Ui/PJs0MPtGKOTMPlp8JC1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0CjQGog2S0PYXpIcH0Ym0Mz64krsy5E2tDLd2iUO0eLdKBmizvJ4MPG6Yx7AeI8Vx6rlHHucG1fWIURTszqFFvtCteQSkAUVcOpXMf4PTHxLuBW6wiu5Z1nXTW8tdx9w6111Oa5HTuNeF7tWGer2D55FcJ0g4s5+JBRDO3pJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sT1wn+w2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sT1wn+w2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89810C4CEED;
	Mon, 21 Jul 2025 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753110370;
	bh=3ZDzpHnQOUHziQ8M+YM8Ui/PJs0MPtGKOTMPlp8JC1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sT1wn+w2ElytKnMVfe1xQ19z72ib/caz9V67ui9JPKNQbtpF33AO7coGOYT05M/3c
	 Rhv16CTZeWBkncSB7mCIJoT56KLNipkmARkToIvbKC6i14oYdZvFAfgUgh4Jg9akZh
	 AexN+DKakfq2RhIOIzJdLMsec5m2epEA7U8t3Evl6i58zX6I6/4BXdyHBgDGpoJG9K
	 gBV5ADzxQWraf4+Eu+u/gxjjgfZtJaqMK8uTSEsVQDF84Ch+tgac7dC0RP0CGcKRPV
	 ChJt+PUrdGMDB3m5PLzFfnYgau1ur55oEdGMl175ef+ZxVHC1r7pw1gVQJzJ3dsN9P
	 qA0AJ4oUTmftQ==
Message-ID: <f71d7815-f478-4930-bc8e-cb5a412062ad@kernel.org>
Date: Mon, 21 Jul 2025 17:06:05 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
To: Alice Ryhl <aliceryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>, daniel.almeida@collabora.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250626162313.2755584-1-beata.michalska@arm.com>
 <aH5U2Jm6Jpf5LyB9@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aH5U2Jm6Jpf5LyB9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/25 4:55 PM, Alice Ryhl wrote:
> On Thu, Jun 26, 2025 at 06:23:13PM +0200, Beata Michalska wrote:
>> With the Opaque<T>, the expectations are that Rust should not
>> make any assumptions on the layout or invariants of the wrapped
>> C types. That runs rather counter to ioctl arguments, which must
>> adhere to certain data-layout constraints. By using Opaque<T>,
>> ioctl handlers are forced to use unsafe code where none is actually
>> needed. This adds needless complexity and maintenance overhead,
>> brining no safety benefits.
>> Drop the use of Opaque for ioctl arguments as that is not the best
>> fit here.
>>
>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> 
> I'm guessing this should go through the DRM tree?
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Yeah, I can pick it up, but it won't be considered for the upcoming merge window
anymore, but for the next. After -rc6 drm-misc is in feature freeze and I also
already send the PR for Nova.

Daniel, Beata: Is there a reason you need this earlier?
