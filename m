Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A93DE435;
	Thu, 16 Apr 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348091; cv=none; b=RZK9X9y4cSTvk5AoCofjajN7COF/h5awqImKGvrNxfEtYofwA6wIs2gXzAD05NtEpBvw4ar0mbvRVm14nH7ofGW9VnWnCmokjf7W1EY1EL9CsDM0PinLm8XJyeU+GUI8YTIUzZ72WpSyM6/vGNPRR7z64ppIPwxClPHMGn2mLQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348091; c=relaxed/simple;
	bh=8U7K5xYgKw7j9Cq+FHiUdXtlxnpa2dLKF+X/fK9LXws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alMpJ2EuBwCSDn3C/evF7EQYSIycwuLgYghLlrKB+64Ehk7lh6emK2vV6eyeOZg2E5mBjBppWTPtc8UGszIiCqdiqEniByrtQgG2fuMhOYpwXfBIfW2co5ogBrhBh2l8O84WdiFbIP4hjMFc6HK4vC8OrrwOD7xNTbkaY4HCerQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W65NjOlN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W65NjOlN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48537C2BCAF;
	Thu, 16 Apr 2026 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776348091;
	bh=8U7K5xYgKw7j9Cq+FHiUdXtlxnpa2dLKF+X/fK9LXws=;
	h=Date:From:To:Cc:Subject:From;
	b=W65NjOlNFH6N39wk1Z4vfLOe/r5Tvpld5G8ehn4ApPd9OhwpG4NDTOBcI16keR500
	 SgV5nk3jvzlRkz4oNifk66ilO862p66BUNGAVbJ69V8exW93NcilOTFHze6UxsCqzl
	 E/v/NsuLT0Xs0W7sLa2jZU/BsXoNXP7hz3iPa7/xb3R5rdPQmUvc5Xr7+KkJsXxzcQ
	 6Y8kX9KPlTClc4edAPuWjQNWEfd4y5vPQQLWoIXMNIOPLYBT9tm6pMB02WkCDluD9e
	 nBlm+juS+t9uxg4YxEhftL7BKmFo8hlq0czeJs5v3qygFWrNXEcfcR53alEE8ysd/K
	 2HxAZgSG8MfRQ==
Date: Thu, 16 Apr 2026 15:01:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: linux-next: Tree for Apr 16
Message-ID: <aeDrt2FkMD6ZWaVS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eGjH+aJJMFXx/2B8"
Content-Disposition: inline


--eGjH+aJJMFXx/2B8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1 material
to your linux-next included branches until after the merge window closes.

Starting from today rust builds have CLIPPY=1 enabled.

Changes since 20260415:

The liveupdate, liveupdate-fixes, kexec and kexec-fixes branches were added.

The cifs tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 5043
 4678 files changed, 285703 insertions(+), 84011 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 418 trees (counting Linus' and 127 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--eGjH+aJJMFXx/2B8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmng67YACgkQJNaLcl1U
h9C3kAf+NmSPDON6M0wikB9SZKqZcwCgD3gQAsq1xaLT4HncEeJdMk59TV/BPHxl
Gv8c/Q90YDpmibOd1UOUN05VFcNGfn3nMnZNccpgBl7zlacDsrnxrUJB7i07EK3p
XXWYSHK4PUslxUVbNp5iHsQisfa6G05yY+QpThC+U6oB/SPIahx8EnFu+VOXLv4J
WH+1IpxIJrEDgUJwM8lULwV9mLvOUuEwwJzkJR8F1Lh4OFdrZCYB01m0Zsv5w1pB
jj1knXCfJo5Koxltmv9bCRhbBp/ukdg38i79YqJDQwEYaJBzJljKj21b13y6LTSn
BW13iWOGwk6Lm0RN0BcU7S67KbLVDQ==
=/rag
-----END PGP SIGNATURE-----

--eGjH+aJJMFXx/2B8--
