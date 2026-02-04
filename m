Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFC3D413D;
	Wed,  4 Feb 2026 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770217186; cv=none; b=TH8r2Xm5t/Kk2+iiFQcnmibyzcJEsYd+xO3FbvruxBXF3qiGktQYMDgHc0FqZWydh+kDcmKE6KtZrthzj3mxumZxCaBciGixcSMgMcWWa49AT8qhc10uKdTXJt9DJfq+AGANRXFSF0ypUuBFUgYAinuZ2vEuvFccKGiZy74u3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770217186; c=relaxed/simple;
	bh=GbES7aG2mQfMLb3/jx1ri1+13Q6gUPgKpMi3ZlKcqM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2LYjGU1A9QEySuFKQ/la9qxO1gY0ertZzlUktO0iS+1TUmlvXUOzQK0+X1s0000Vyv6ZIiy14tAuW7L5Cg5/DW5YFkg/5a4zii4N/V+gyQS0T5yqgHfjMT6o2B2YgCUfHRfENiK2njT8aQPeEoEoPCePjGGj4r5QNKuoUdy7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9eYd4Oe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9eYd4Oe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A67DC116C6;
	Wed,  4 Feb 2026 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770217186;
	bh=GbES7aG2mQfMLb3/jx1ri1+13Q6gUPgKpMi3ZlKcqM4=;
	h=Date:From:To:Cc:Subject:From;
	b=K9eYd4Oew63OwUq5vuBIejtNgo9tFS9zq4rAEAgvGwr70liFuFKfzfU0eVCvA+2TP
	 RKX92TL2ELzFFuqCRDxlkVmVa/0nbRrBX+xtP2wRUWFoPX3ovIe8ZxM8ngBogsoFFR
	 GiW51RLvdog5LUBqHVwDhShv1r98XJ0+GPhYp62FZGwhxam/1T7DL6m9vokhhzYhR8
	 W3BG+fNOdWm1Vdv1wzu0lURXAjmtv3fptmYGKgGRp2ZO6501LUzevr+N2B5RlQCVpA
	 vO81KlyAOnmbpxUyREW5Vt3xiW74PnQuTbHOA6OnNyEm88wKvICWW2wDMqgqWaYovZ
	 MU+BoGIVX4rsQ==
Date: Wed, 4 Feb 2026 14:59:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org
Subject: linux-next: Tree for Feb 4
Message-ID: <aYNe3khJcKy-N1ga@sirena.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fg4z2F3rYwFbJl6Z"
Content-Disposition: inline


--fg4z2F3rYwFbJl6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The KUnit coverage now runs with CONFIG_RUST=y

Changes since 20260203:

The tip tree acquired a conflict with the pm tree.

The leds-lj lost it's build failure.

The nvdimm tree acquired a conflict with the vhost tree.

Non-merge commits (relative to Linus' tree): 10777
 10460 files changed, 596349 insertions(+), 221690 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--fg4z2F3rYwFbJl6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDXt0ACgkQJNaLcl1U
h9A8OQf/bq/LFBg924nn7AdH03pLYU+Da94xfABh2XI3COTdgquT86ouZ7F82X4d
LMazwqT2d5u6LgTwRjOAA9YG0+aYAoVDawhFRrBU3Qrg67QwrLL75PQOm9JXAvyK
mWXNoFKxc2yG3F0YtWbRKSwUEuI+YycNapo1/e3xppDiUpqNH+j4OjYykPERCB/i
d/r120c6Lf06WCxrjXu6sircZiCtwfr0pAQQEEML3kIt+ltvhOdOjLKgAhoLyZaQ
hntRx0TMAoETWrMr/0qt6Mct449YFMJzd5I5s1dL8rYAOEJdn4/VahY1z8RoxFDe
dXYB5N0dhmAa5jWROXvg7RZ6Nuw9jw==
=H6Ce
-----END PGP SIGNATURE-----

--fg4z2F3rYwFbJl6Z--
