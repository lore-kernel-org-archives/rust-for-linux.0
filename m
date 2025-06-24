Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17426B081
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807802; cv=none; b=AVde31v8gCQuPfMGoHnmiP/6rT+vbzyGE9E5K4bm+qqfyH6UVmNLzBSJZz8Rnou/56efBPy2QJbSG4wXfXIC5gbig6AXv8hc1dWZSTavurBy4EuKwSlDzHAIYwiwBAUCJKQK2KPNWKARE4OJ6rAKBU4kwrcG5ROAGuc1NLLDsck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807802; c=relaxed/simple;
	bh=MuzVbQeTY/MUN0sWtEjlmOlmM96ThH+TLpj57VHfoOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZF/JMQFowlVoJ+GlVtNalNjjZKuvfFbqrBgs5ZookAg1gSk+HcNbydNA2g8pYZiB4b8lzz6wXAxRjJhaODjF2Q+REwu6IAPbY3FelAI7ctpKHvfgt+cWRgd5549yG/NAPJYyKPJ4xa4tgwP1MfOzvPqS9i2cJeJ/+vXZRKhBD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+D62ww3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+D62ww3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CB5C4CEE3;
	Tue, 24 Jun 2025 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750807801;
	bh=MuzVbQeTY/MUN0sWtEjlmOlmM96ThH+TLpj57VHfoOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+D62ww3XWpPedTFfWKm2DY5A2b4tFVE9lgbghBxWP8V1Xjmryr/7ZKESIutXEO6G
	 W4RlAUYs08I5HDHC4dR0Jrq6aMfndbbSWx26zEObCvawQz/lzFV0hl0WGP9QHn/0FG
	 QOx0iVXrfTC8f3eG8IkH3Xu5qJdU7DIOLJnchdgIs2oJWlAaxhZXpxVq/oKBzlHn2B
	 X6s/tAB4kXV/aEFX/JxJ44OjkNti0XB7OwBkQoWkA0/6hfEcnX/lRm2Suh/w8kc/7G
	 S5tNP8suQ0DNSKZr9cuF5xpiqVG28u0oQA5t3Z7WCbUrfJ6fFvXUo0gsG3NpUhJzK2
	 cV+XD+ofiu48Q==
Date: Wed, 25 Jun 2025 01:29:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: consider `clippy::cast_lossless`
Message-ID: <aFs09WPfK1i-zwCC@pollux>
References: <20250624132337.2242-1-dakr@kernel.org>
 <20250624132337.2242-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624132337.2242-2-dakr@kernel.org>

On Tue, Jun 24, 2025 at 03:23:23PM +0200, Danilo Krummrich wrote:
> Fix all warnings caused by `clippy::cast_lossless`, which is going to be
> enabled by [1].
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to nova-next, thanks!
