Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77AC27EC80
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759170; cv=none; b=LW9NpKCYHqoAfxKR5YxwL99wNWWIBwz6rWQ/PF1r975+y3UcuzWhd6MOTJAI04EYI5JQnQvxA1kdNX9uOuA/5OyDcBlO98n93IMDPc+22Ui4KuwrskWpq61X9uh/bHhJxj8DRdD5Aleyrtpam2JzhuVfS1c3d7P8lgdLG3aKx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759170; c=relaxed/simple;
	bh=MoJ+QP9/5aJbOLjqadSJaeAW9mb0bRnunrRe7iL1NN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kku/n2pF53LNRjKEmdDmJfhDzES1J8aJ/Pzzm4sNvYvvN+spY627QR+zq9vHpmdQ6CuP9+Nyh8EYCcaI/Jown2Bly4D38fSsF2SlpG6TOf4eGDGFFYX9BdN6ABHn7O6bPdrZT2udNE3h+eLnlIsR3lJY5frBEkGcnj5n7dQnKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8uoWyVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8uoWyVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AF4C4CEE3;
	Tue, 24 Jun 2025 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750759170;
	bh=MoJ+QP9/5aJbOLjqadSJaeAW9mb0bRnunrRe7iL1NN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i8uoWyVvcHfMM4UzTPWyGckFIlAhuVGjUlgV0gnWvQbzvI7Rt2MpCT9Mh7rHGKmOM
	 neU3WMSuWrN2QHkpdPF50485dusI2R1hg3QNujzM4zyt600eDNm1RDIMM2DwHJqMyj
	 MrooUo7E+d/ZKuvQ1rePMgjtz3mqB2+2snwpGqjuywrmlez32C3kbc0i2qga+wkHMI
	 QpsHUD4eLion3SE7z7ufIQkn4WdIhqA2t704TzU/TjfLKI2vDIOs61OhT/qxCAhlEC
	 /6ohITBcQ/bibh+dC5spTxw55VgLmDueHhMu6/zb6wr9dLUN0at+rER3NF3d9impZo
	 YCcjsGNVMlIyg==
Message-ID: <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>
Date: Tue, 24 Jun 2025 11:59:25 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: nova-drm: Update ioctl handlers to drop
 Opaque usage
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 daniel.almeida@collabora.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250624093200.812812-1-beata.michalska@arm.com>
 <20250624093200.812812-3-beata.michalska@arm.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624093200.812812-3-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 11:32 AM, Beata Michalska wrote:
> From: Danilo Krummrich <dakr@kernel.org>
> 
> Following the removal of `Opaque<T>` for ioctl arguments in the DRM
> framework, this patch updates the affected driver code to use typed
> references directly.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

It's very kind you want to attribute the shared diff with a separate patch, but
you have to include this change into patch 1 ("rust: drm: Drop the use of Opaque
for ioctl arguments"), otherwise it still breaks the build intermediately.

Please feel free to just include the change in your patch -- no need for any
attribution as far as I'm concerned. :)
