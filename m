Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291E314A98;
	Wed, 14 Oct 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969819; cv=none; b=QnswYV/dc4TB6IUjAgxiSb57GniHn/K5t+uH3JIsXTCnpoK4HyBdv6H0vKhqG/2ngv59xD6GjJT7CAHllEb7TPYz7zrhY0ginDTmLZzi6baB3t5O1BHpwygSOxitYWJNCQEx8P6FejSaXHLV6C3s/12SiableksjwyiCezjNUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969819; c=relaxed/simple;
	bh=tSqRZhK6Y6ujWUynNuwFjiEjW12ZtKTvqN3gWztiQZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfpLJm9rHE5ouxQ2WhHDnWOf4eRR5fvJO/PFV5grkOhzxUm4TT/EeHCrnWVASoiHuvtsjFM0k3FuXDrLQnGxV6CNhxtvp4ihXo/DbIm2iEuwHTGdwUS02BcnGEqcCADP1rASpuvb2tjq6o/JpfV1oq5QUStebtExaG7GnKmd8AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=wQLCxgIu; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="wQLCxgIu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s7d2mMERLJ/hEC+BqXXmPLLCZcsq8nPz+clzwHWl8zw=; b=wQLCxgIulYDJHJWhbSjXb3RDXO
	SCCSk1+73KG8qvs22jTO40Km+g8JbnQFMnRlGpK7oPQxwxeqFLs4qoQji2QuQIV+BOCYJ6pYO/rAP
	FAp/dobgqjyHBcTHnqbtka27R+rDCVtZSL6MyedtMD6KZnHBQD4LKMhTPhOtKeSk8FiQBNzHr0/4n
	AQnU4dGCoWR7L/RkfZL9DlwZt0+qfuYAunxDv4qIVJx2QJxa31bDpF6EPYtTMehkAcLBthIi/YUTw
	WKd64V7D9I3DTgvsngLFBww2wYpi6gjF8r63RHyHaW+ncQUlVQKgjN0UzZhRD/w2YoesBXLIFY5x/
	OMoiC9Pg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xGvCx-004Ip8-2M;
	Wed, 14 Oct 2026 09:23:35 +0000
Date: Wed, 14 Oct 2026 02:23:32 -0700
From: Breno Leitao <leitao@debian.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] Rust configfs changes for v7.4-rc1
Message-ID: <as9J9RsSaFsgvWwv@gmail.com>
References: <87a4opeh10.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4opeh10.fsf@kernel.org>
X-Debian-User: leitao

Hello Andras,

On Wed, Oct 07, 2026 at 04:12:27PM +0200, Andreas Hindborg wrote:
> Hi Breno,
> 
> Here is the first pull request from me to you for the Rust configfs
> abstractions. Please note that I neglected to push these three patches
> to the remote that is picked up by linux-next (just did it now).
> However, I tried the merge and verified everything works under my usual
> configurations, so we should be fine.

Do you want me to pull your tree under mine and send to linus, or, is
this just a FYI?

I am happy in either way,
--breno
