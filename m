Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045072;
	b=N9yyRM1zVwDqKpOAjNfvKLWr/aM838bm5tDPEmnN7eblZl3S/K7h+fYEJFVl/dpNbxzG
	 afLnZYb7iPGwmVnfWxc04hyofEFhOszcbFZl22JSQ515fbdci1kBDvxZ/O2AU9mufEU1M
	 O3YLo2jqpOv0dwMhmeHIrHu4LrDRmQeC7HGVniKIw5Kmo7zvqACTZXiFQHNviWhkmJEXS
	 +J10BKuFryl+PdnA+f9iSrk3p4dD7VHoPgB8VNLfz+jpkYayy+/FxuhVIszIMonjDGm2A
	 yJmQgtSTGgq4jXn9S9sQV1QWIlAW8Ls73MAIkEV2GCoBG/clC7HMYCGh6epW8E7P6VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045072;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AkAg6L5zEzM+0zn2rA3ANMwlJH9j/CQ/7JKe3RPzwQk=;
	b=UZ14EtrRcKMhui/golHrivnx6wJQ9jeXds/vdMk2Es6pRDBYLHYUtq/Nr3AtP94/YENw
	 8wOW9FCVyQ4X8LAzNIEMfLhgMoMpzCAV2zJjwrAkwQ6Iom4sM2oKvb6eDShkOtk3cKe7O
	 PJ6uGt/b2luQ4BZ0ZwneAIb78Awc1TrBiPEEcRkw2hPoB7P8OgxmmYC7XYP0sUtyV6vU4
	 Itra3mH9w/7nCV39yvTFB8IJ3rWkNrky1umqaog79ZKVMmd5ZJ2aYmzHfNJxNfDEQ7AZF
	 Er6xCTKFjsEaNIgD1HfBXP46CILYrQcGklDIN6qsFbo+QrS8zSeSZBdWi618EAbpBbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WK7uPiZ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C35606A320;
	Wed, 18 Nov 2026 23:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WK7uPiZ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B451F000C7;
	Wed, 18 Nov 2026 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045072;
	bh=AkAg6L5zEzM+0zn2rA3ANMwlJH9j/CQ/7JKe3RPzwQk=;
	h=From:To:Cc:Subject:Date;
	b=WK7uPiZ38zHXjJLnXwa6kLb44zKfNlzRwSU22q7AE80VUDPbot1ZJE6AtSqzfkbA8
	 jDYibcwMk6qX4W6jT/VlxDEpZkIJr5I4OlKFfw5OWrI2tSRrCFUgQUBOve19Bz8kx6
	 JO4ZjdIIaGYF4bBbxDVtfox8Pq9OdoztGvJkByjX3GdCTIoJYkeX9Jj1/hcg4X9VRn
	 kRG1RH37y5GWbj86eQrNjI+6Fiob+UWpt+KdpTYzNPz93sGtdDmssy0b9xK84snunL
	 enKN73QgrpMfSWAL47vfuPveXTdS0K5gudI7ukXeC7s3wyUK4eQqv6hqBC0jm2XSLR
	 +h803z6KNAKRQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	lossin@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	boqun@kernel.org,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/tyr: use pin-init self-referential support
Date: Thu, 19 Nov 2026 00:37:01 +0100
Message-ID: <20261118233727.3147222-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series uses pin-init's self-referential support to replace Arcs for
resources whose lifetimes are bounded by their owners.

It also cleans up lifetime names, fixes a Clippy warning in generated pin-init
code, and simplifies firmware loading cleanup with ScopeGuard.

Danilo Krummrich (4):
  drm/tyr: name resource lifetimes after their types
  rust: pin-init: internal: suppress multiple_bound_locations
  drm/tyr: use pin-init self-referential support
  drm/tyr: use ScopeGuard for firmware loading cleanup

 drivers/gpu/drm/tyr/driver.rs            |  38 +++---
 drivers/gpu/drm/tyr/fw.rs                | 151 ++++++++++++-----------
 drivers/gpu/drm/tyr/gem.rs               |  15 +--
 drivers/gpu/drm/tyr/mmu.rs               |  56 ++++-----
 drivers/gpu/drm/tyr/mmu/address_space.rs |  40 +++---
 drivers/gpu/drm/tyr/vm.rs                | 119 +++++++++---------
 rust/pin-init/internal/src/pin_data.rs   |   3 +-
 7 files changed, 209 insertions(+), 213 deletions(-)


base-commit: e55a991e09e3b44f0b0d8206bb523dc57c086341
-- 
2.56.1

