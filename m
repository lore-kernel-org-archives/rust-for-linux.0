Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3D3D6CD4;
	Mon, 27 Apr 2026 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314239; cv=none; b=lX13EHef/bIRySC6vuU98nqqFqAAt3d7sKX4FEg/l3EW87nCGdoyG7j3kUzIv7a3ckiT9+8HpZuZLpi7RdgpbLrLyT3iLpWVC6T04JUznxasJvU5z7EelJBhm3aG3b7U8H36MQ2dX1QHNwOnFzP6NYWl7whEbbrEYssKJ8REKfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314239; c=relaxed/simple;
	bh=RZcKzhKXqkXILopall1OZexxEW+DmWizquUvLq+yznI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUGqcWqV88o40gYlTRVtl+TzkBlOiOtA0V1YIuLlI6vc0i1wPmAV/mFA7OHV8tWWGT76ZigEurS0onjEB8OM9J4uCelcypNMooxnf+uJ+dxse44bbnh7gXIYHOUQMol8Y7CDHT0fGIupGM7vrTyS3qlKZEyUNApKGrLdQs2wuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPKdfqAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPKdfqAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA4EC19425;
	Mon, 27 Apr 2026 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777314239;
	bh=RZcKzhKXqkXILopall1OZexxEW+DmWizquUvLq+yznI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lPKdfqAq7GsoZNomc7Oq/rfWMQbw7dT53mvVON0+aNc2nx0Sl3p1UmzlLTWI696SK
	 8aBHUXpXQ61Q8cmPjK3/TCmDjpZvroaWyn8pcpOegEGiJ/6ajIP82Hxm+KL+M5LXte
	 m4jkPuhRuDYV/2mnlu8N3FpbIYyNk6HBd6zroS7lfxAIw3cLXsAJx08KxtsectFlZT
	 puPItX7wISsAQNwc/rpl71Bl/gZpJ3OIaajaU+3cIfxKrz8zmu+7s1KIAtNnHyOs0L
	 blwbMDDHG5WqDQ2EhkuIKCzny8DPZn50VlCwWxpHNgvSe1ubSaXgvdhu5LxZ71r2bn
	 wCPekKh0nHdnw==
Message-ID: <ce9545e0-bb73-48a7-95e7-267292701480@kernel.org>
Date: Mon, 27 Apr 2026 20:23:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: simplify and_then with condition to
 filter
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260423-fix-filter-v1-1-b3b197c65daf@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260423-fix-filter-v1-1-b3b197c65daf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/26 9:11 AM, Eliot Courtney wrote:
> This code is more simply expressed using Option::filter instead of the
> and_then with conditional.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
