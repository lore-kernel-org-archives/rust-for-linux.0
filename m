Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174F1329365;
	Mon, 29 Dec 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024676; cv=none; b=kI8QW7rTPaPYEOyVH9CoMBsjzQD9Gnxx1QBcm3sDNX6dP/9GSSfR0D8yKqffQI18tKb9y5Da3Tl8GeaENMQ2BJhAHnNKPrfmLNplfGkfEKoEjuf7ZmDQyT2IGKd6TOV5vrce7BcSnvF0COn15/f9Uo086GnOlZPH/tNGSjQtezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024676; c=relaxed/simple;
	bh=A+JFdVrj/EG2jTB+c7iSrXC0M51hsvw0JZZiGo2sQlk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To; b=IQRwE0AaTG4pae61FPxCsCNQkBkj321WoMBjAjhaxYjcK8fWQDX28CjgXYpw0PR7m8BbTwNuOF/L7rD65/N/aMYh1aVJ/prQ1LzMMAa1jifiMDu54uf2zeG2CyxYcKMTo6RDqv0xclsoGiLkPQ5/LughgVaYExJuKE7QRL6ED+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPZQajFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPZQajFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7815C4CEF7;
	Mon, 29 Dec 2025 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767024675;
	bh=A+JFdVrj/EG2jTB+c7iSrXC0M51hsvw0JZZiGo2sQlk=;
	h=Date:From:Subject:Cc:To:From;
	b=tPZQajFTVvAA5n7DLwnLGfooFV+V4hMDPeMnRtDvsE9n0w/BZ6C1XyzhKuYLtNwb/
	 SCS0+b+8hUb3JwSsCBffXWjzm38mE6fKuFSpD+p7j74IaBovtBAAOXo3oqhUzAV/Xi
	 O8NI/hnvMsvB5zipX6TUhleqvJw25wcyBA2yZFzuFdTKbV62SAFB0in8MnlaxkL8e2
	 K+Qict/FHvR3B4f7MIhNqwG1xU/2wCITplgdI+Gs0mTROTxnioqRECvkTbQbLfcjR3
	 M9ji5sj1ojqYyCXyRgZbZeJQhHxdJ9hPBly/IrzOUZzDw6BEGQHUtuf+ZxzYroTYAt
	 s88Qrj1H/dg7Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 17:11:11 +0100
Message-Id: <DFATYVSQRQ4W.1R030NZ34XUZK@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] DRM Rust fixes for v6.19-rc4
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
X-Mailer: aerc 0.21.0

Hi Dave and Sima,

Please pull these DRM Rust fixes.

Due to the linux-next break until January 4, not all of them have been in
linux-next; no conflicts expected.

- Danilo

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-fixes-20=
25-12-29

for you to fetch changes up to 97872fa28b33a1ca6acc0a7b260750c9a123b193:

  MAINTAINERS: exclude the tyr driver from DRM MISC (2025-12-26 12:14:40 +0=
000)

----------------------------------------------------------------
DRM Rust fixes for v6.19-rc4

MAINTAINERS:
  - Fix Nova GPU driver git links.
  - Fix typo in TYR driver entry preventing correct behavior of
    scripts/get_maintainer.pl.
  - Exclude TYR driver from DRM MISC.

Nova Core:
  - Correctly select RUST_FW_LOADER_ABSTRACTIONS to prevent build
    errors.
  - Regenerate nova-core bindgen bindings with '--explicit-padding' to
    avoid uninitialized bytes.
  - Fix length of received GSP messages, due to miscalculated message
    payload size.
  - Regenerate bindings to derive MaybeZeroable.
  - Use a bindings alias to derive the firmware version.

----------------------------------------------------------------
Alexandre Courbot (5):
      gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
      gpu: nova-core: bindings: add missing explicit padding
      gpu: nova-core: gsp: fix length of received messages
      gpu: nova-core: bindings: derive `MaybeZeroable`
      gpu: nova-core: gsp: replace firmware version with "bindings" alias

Danilo Krummrich (2):
      MAINTAINERS: fix typo in TYR DRM driver entry
      MAINTAINERS: exclude the tyr driver from DRM MISC

Philipp Stanner (1):
      MAINTAINERS: Update Nova GPU driver git link

 MAINTAINERS                                       |   7 +-
 drivers/gpu/nova-core/Kconfig                     |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                 |  14 +--
 drivers/gpu/nova-core/gsp/fw.rs                   |  78 ++++++++--------
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 105 ++++++++++++------=
----
 6 files changed, 117 insertions(+), 100 deletions(-)
