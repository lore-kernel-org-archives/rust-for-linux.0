Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net [178.154.239.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63E81C84C0;
	Mon,  6 Oct 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759768298; cv=none; b=P4/j2559cRF5I/e+bia0wPTRENChh2KIhAJThsnm8q5iZFHzqLXp9cKJEoYcGZ32J2NgD77FlL2Aksawj1ebNYo6paSQvfBuMPLiJ+ai8jdx6UrBdT6H1h2ReOaRZT9uDW33+gXxO94xft6+YthZuLTroKhcjPRgzzHm0J8MXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759768298; c=relaxed/simple;
	bh=Pj5FBmURN0MJhid2NpmmyCY7G+N+6opOsOnbXyIW6es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bheho/sDB1vP1LeslIjt1hf2PCqehylpRaZ74wtIjjR1beRSziBGtb9G0pTAQmwayaJC60DnVLs0lkmK6xNQBDeU+K6OkATd6tm16tpVt9RUIHqQ+OAyyGeHSZGMSGduVwE8aLuNRoWPqBrsymZnGNfypvr1tmbJiRpY3PXCmx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=N9UIorxy; arc=none smtp.client-ip=178.154.239.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="N9UIorxy"
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward204d.mail.yandex.net (Yandex) with ESMTPS id 901E1854E8;
	Mon, 06 Oct 2025 19:31:28 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:4985:0:640:840f:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id A94E9C008C;
	Mon, 06 Oct 2025 19:31:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id QUnb3i1LqqM0-j4CcWPi5;
	Mon, 06 Oct 2025 19:31:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1759768278;
	bh=b6RZui74oJI0+b+gAS9vAzyvMEg16T7qvnhR/fBExVc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=N9UIorxyEw8zo6Z1grbW5yIkLZBDPHbx+hqs1uc3GOvS9AA6IReDd7bEF+HY2psi5
	 bnOE64nTfh1TDtoL6npR65vC3JL3qaxEunfNrrVfUNh8YLroRPwm/SrZpnRhWWZRtr
	 ZfOL8UgLvaULDfEWbdPJoCNUZnFBwSWjZMzWANuM=
Authentication-Results: mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	lyude@redhat.com,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 0/3] rust: xarray: abstract `xa_alloc` and `xa_alloc_cyclic`
Date: Mon,  6 Oct 2025 19:30:21 +0300
Message-ID: <20251006163024.18473-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Initial version of xa_alloc and xa_alloc_cyclic abstraction
patch series.

Onur Özkan (3):
  rust: xarray: abstract `xa_alloc`
  rust: xarray: abstract `xa_alloc_cyclic`
  remove completed task from nova-core task list

 Documentation/gpu/nova/core/todo.rst |  8 ---
 rust/kernel/xarray.rs                | 82 ++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 8 deletions(-)

--
2.51.0

