Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0844D09E6;
	Thu, 15 Oct 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066111; cv=none; b=l8IdHVMv4uS4JBEGyxnI2j9d/jDwfIMVprrdPQscWTwAXKkKeyFv2v0gl9J8XUYUGks1geObIYrX2XBpFDk+Pk3CPPvgTEgbRhmp2VDEwbLpp/qXp0WiXPjIJgBooPqg0WzNNkXgDGyvciGdfdAb62Pu4NpYwH28duOB+SkfWyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066111; c=relaxed/simple;
	bh=RtvN2fiU8eso/VYTgVC3AlJRBMOMc9Jhgibg/oYeddA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmdeyE2zlAdRk3Zu0nq1t0Xk79W45cCzHlAcuH6J844uc4npDjXEhuxXOvdMGt7I7dqaUwsE1ljKE7b3Xau+Io01vGCXqDqEV1Y6OyngBHlQUTqTvpkPoOnIFfAOM/E7A1rwiDEOBQWZxMmnAxK6dG6UsjgWFWUsgk6Nh89IbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=sr3lLKRz; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="sr3lLKRz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3SopCeXNyuGlNNcNjQkg/EEQ3+Zn5BMadtb0CBo850A=; b=sr3lLKRzHMF2MQ9+dIbW6ZuJ2M
	8vSIx3n3HMFMJEozPjgAYUPpNBIdQVZ0+mnaGTUErCyupyuA8UI65C+9kSRXS1UNpQiK45JQzA1UH
	mGf9TTsrMMh5BBA+fAk8Gxav80b8Ak1cG0dt0/E0gS0h/NzjEVcJJ68+aikWtylGVvBydJOaf8X/S
	whFeLaEPXlST61j3ZAgS4ELna5ARx8a7e39SGWIkJRnfypI+UI64bmZ1BKFysRUorKMCmRay/eM+J
	NoIyxrwF9gnLgQwyT38tCE9ibjkO/4fOlSedeqYFCvzLiY/jVLE+7XLs2dtHjPKozAWqDMqWqjC5Z
	Loph72hg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHKG3-005BB9-04;
	Thu, 15 Oct 2026 12:08:27 +0000
Date: Thu, 15 Oct 2026 05:08:22 -0700
From: Breno Leitao <leitao@debian.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] Rust configfs changes for v7.4-rc1
Message-ID: <atDCJcl6kYPrLPLg@gmail.com>
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

On Wed, Oct 07, 2026 at 04:12:27PM +0200, Andreas Hindborg wrote:
> Hi Breno,
> 
> Here is the first pull request from me to you for the Rust configfs
> abstractions. Please note that I neglected to push these three patches
> to the remote that is picked up by linux-next (just did it now).
> However, I tried the merge and verified everything works under my usual
> configurations, so we should be fine.
> 
> Best regards,
> Andreas Hindborg
> 
> 
> The following changes since commit df2908090cda368b01ff43709f51890076c56157:
> 
>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git tags/rust-configfs-for-v7.4-rc1
> 
> for you to fetch changes up to e84c9b64df615e658e47561b835c1364dc48f0c0:
> 
>   rust: configfs: fix data offset calculation for subsystem callbacks (2026-09-29 10:30:08 +0200)

Pulled into configfs-next, thanks.

