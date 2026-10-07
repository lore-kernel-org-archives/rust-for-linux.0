Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F333BBCC;
	Wed,  7 Oct 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382383; cv=none; b=o2vQoYK13N4X1OrptjRVXxUvrlywgPMEEq9Za4ctg0VBc3oBgBE0ewSGaWsGPy6me6TaOBGAYq9e9U3d/0PBFzRkrM18GqXzGegqwjtZncL7LPB/fyZjmzxR17LOpLlVEz7X2HArKBdfyxI0+ISaMQGMYNdbpnracTDx9cun+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382383; c=relaxed/simple;
	bh=IpRFl0VU8cc3BoBdsdRGRBvGsS4Lv2hDCImiS7ZadtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YhKJrKA28O+gTfAOzAWB9R+ucP8luEGYxPlGLc4mU8gJMD1NrznJBzbndv4irMwqpsFw1V+65UJIko24IYQ97UwKLTr/rLl/ctCHHrCVfyqS6mP1zsZJOEcUO84ZdGdHtMZA9LSbsAcsSdHBEdLiZk+iaQUX7FeaUv/pZmHyO6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJbJOgq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJbJOgq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F6E1F0089B;
	Wed,  7 Oct 2026 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382373;
	bh=stI11kyLCTRhYGHOAjLyC5EKJqpJKIRI3uDv9+EkpT4=;
	h=From:To:Cc:Subject:Date;
	b=QJbJOgq9v8QAcdusbEW2K7HAO47bdNK8WkNe1jvpSzNIxA6bCZRCCocX1/u1rQXUS
	 embyyK4vnXU2MD7aFcfVwDEgCOiC3EvrGJRjM2Krmc3xgHz5HlXjdcOKx1muhNxYN1
	 bRWFKyMfexgFCQkEuOAXZxVIyk9wUf6VEcIpaZmI8OhOjwlhGxJqSEN1Vldi9dI66N
	 YIAuZdPmcpGvH43lUi8B52fdZvE4nvlO3VcJ1qc5TuqJw917orxrt5CVaNgdaOhLbO
	 1ZUw9KCLSOSRhJXWf9v4okBwYmX0pTEZr38uy2DQLBf9iEg0DRmn6m0GoG9VXNyQBI
	 w6p7MLZ1WRWFQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [GIT PULL] Rust configfs changes for v7.4-rc1
Date: Wed, 07 Oct 2026 16:12:27 +0200
Message-ID: <87a4opeh10.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Breno,

Here is the first pull request from me to you for the Rust configfs
abstractions. Please note that I neglected to push these three patches
to the remote that is picked up by linux-next (just did it now).
However, I tried the merge and verified everything works under my usual
configurations, so we should be fine.

Best regards,
Andreas Hindborg


The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git tags/rust-configfs-for-v7.4-rc1

for you to fetch changes up to e84c9b64df615e658e47561b835c1364dc48f0c0:

  rust: configfs: fix data offset calculation for subsystem callbacks (2026-09-29 10:30:08 +0200)

----------------------------------------------------------------
Rust configfs changes for v7.4-rc1

Three changes for the Rust configfs bindings. One typo fix for a safety comment and two bug fixes.

----------------------------------------------------------------
Andreas Hindborg (1):
      rust: configfs: fix data offset calculation for subsystem callbacks

Yilin Chen (2):
      rust: configfs: fix release safety documentation
      rust: configfs: require thread-safe callback data

 rust/kernel/configfs.rs | 110 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 74 insertions(+), 36 deletions(-)

