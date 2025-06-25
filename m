Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748E433086
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Jun 2025 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875620; cv=none; b=p9+G5TOlhWDvnGms6GGFuvRH9YBVXvhI61T7LvD1UOn57OTi5nyDStU+8N+2vUBFVbryIRUbOWA9Hq7aaib+D+voJAWicsvZlz7gtdtqoN5JH4395PJBMJ8fve8yjk03a9VKAxk51sFqQHI+kSIIQikWZduLnBl9V6pGRtype5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875620; c=relaxed/simple;
	bh=VxlmLzMyNV7tHN6TJqRWcZDGSM22FRYtG3OjfMQ6e44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0pGeeIZh6Lg+b4+jLU/UVXCbGKdASBMp9Yju7OKHF5AGxeaPfX/IZqgrS7kVsAyu91SLzFqMckUop0NRtoU+mJc86LuDJT0THNdTxQACHX8hxICxb8UbNyMZgU0UkgO6x1OdwO1+nNRcOhG15tSt+tJtXKUhUa3ygsWK1ZD+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUPN5tOr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUPN5tOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D3EC4CEEA;
	Wed, 25 Jun 2025 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750875620;
	bh=VxlmLzMyNV7tHN6TJqRWcZDGSM22FRYtG3OjfMQ6e44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZUPN5tOreQIycJeduVlWcP1WcvUiGZkIXmffaSYRTlWGdHS6EEP1vDvaTuV0s1afL
	 Fu/27kdJL0Cf6ZcytxFFlSrTSyOinOoVQ1el9Wfkw2LuxS2FF55WeENuz4IxxSG+Tk
	 BU/gyQbefa3UTkNoN3+0sYtcT4+kSCbE2H9p+X1aOkWzGiAboZlg+1sCbZeJjR1zNy
	 THaIYj3LEReChCTb6wqLfY4U6jF6kIrNJVvtHisnIAkssQQdqAVKAkdZxtyaBA9tms
	 LndNKlzlVo4zYOytXLoiyjWhyaobTn4p+0LduOVhMLYSjp7D6JbTv1fwYuvkFHFL4w
	 caB6muGJXND0w==
Message-ID: <513ee881-cf28-4c68-99ee-5a802c3269e2@kernel.org>
Date: Wed, 25 Jun 2025 20:20:16 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Alexandre Courbot as co-maintainer to
 nova-core
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 jhubbard@nvidia.com, bskeggs@nvidia.com, joelagnelf@nvidia.com,
 ttabi@nvidia.com, apopple@nvidia.com, sbaskaran@nvidia.com,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org
References: <20250624170517.105148-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624170517.105148-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 7:05 PM, Danilo Krummrich wrote:
> Alex has extensive experience with NVIDIA GPU support, is closely
> involved in nova-core development, and brings valuable Rust expertise.
> 
> In addition to his technical contributions, Alex is actively engaged with
> the broader community. He works closely with contributors and
> stakeholders to identify and solve issues, fosters collaboration, and
> helps ensure that the Nova driver evolves in alignment with the
> community.
> 
> I trust him to take a key role in making the Nova driver a successful
> upstream solution for NVIDIA GPUs in the Linux kernel.
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to nova-next, thanks!
