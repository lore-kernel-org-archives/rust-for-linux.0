Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0563135971C;
	Thu, 18 Dec 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073171; cv=none; b=YBRJFDXi+ffz16BmYH1Mfp1OrUzJbh9hNPLRTRapVrwiETu1GFMyu2yVSi+r1NELgwuVjwBRR6tTR4ljMyphXBkHPveqfOP5YETAmcl2M0GZyEmGgufDgcLvh/3IdIYUOAAvJtCYagtPSBwJ6qi1vE8OukMc5vfQZ5ClboDgmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073171; c=relaxed/simple;
	bh=sq+km+wvT4DGrv7PkS4uONGlYNLQhbs1OTtEFeLOWqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KIGcG0CuZro3xt27VvfttykkuUaw0agafaw8d6oT+1a6HxBy8tEMV+ONirzjNL4bOe7hFRxbnlrWAw4wEDVB33K9e/L+1iEGLYw4ji6WLyzc4lR3ASnexaT2oQ4ft1zpQEFsghf6kT98nCJ+zPaGUoxe+o7OytsahnJGHS9ES1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt6sEqd1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt6sEqd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB74C4CEFB;
	Thu, 18 Dec 2025 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073170;
	bh=sq+km+wvT4DGrv7PkS4uONGlYNLQhbs1OTtEFeLOWqw=;
	h=From:To:Cc:Subject:Date:From;
	b=Bt6sEqd1SrETZEoMhV+xw1Xf5/RORJDOUqXrGJrEaroGiWDeqK7Uo0S4NTJF9XC2j
	 nA5ogDNI6Ja7u6HckBN6eAKGLZ3MT3aQHvOeXUoLaMYqi4oCdSUDSLkzgolei3ix36
	 YY19napuyMc7QbJpHbA3YB8UFDDPEoxg7+BQLCwkqzNqulWwCDArZPUOAyAmZa2jen
	 pTub+YYddgTTrKzntbRiDyrh/suPBilg0NaGMVp7HHAmAIxVhSeDGMJmXNfQfe+GVe
	 +XCJ5TNhb40nVPRf6ZM3m90Iql/SNNiC10/qTiVI+CZZsRcKEubku+xEpJyNsOCmD6
	 jXmp+SHsa+gCA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/4] nova-core Improve pin initializer code
Date: Thu, 18 Dec 2025 16:50:47 +0100
Message-ID: <20251218155239.25243-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a minor series to improve some of the pin initializer code to:

1. Reduce redundancy caused by Result<impl PinInit<T, Error>> return
values with pin_init_scope().

2. Relocate code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field goes
into the initializer block of this field, making it obvious that it is not
needed by anything else.

On the other hand, intermediate data that is needed for multiple fields to
initialize remains above the initializer, naturally indicating that it is
needed my multiple fields.

Danilo Krummrich (4):
  gpu: nova-core: fw: get rid of redundant Result in GspFirmware::new()
  gpu: nova-core: fw: move appropriate code into pin initializer
  gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
  gpu: nova-core: gsp: move appropriate code into pin initializer

 drivers/gpu/nova-core/firmware/gsp.rs | 134 +++++++++++++-------------
 drivers/gpu/nova-core/gpu.rs          |   2 +-
 drivers/gpu/nova-core/gsp.rs          |  73 +++++++-------
 drivers/gpu/nova-core/gsp/boot.rs     |   5 +-
 4 files changed, 106 insertions(+), 108 deletions(-)


base-commit: 97cf6bc0abd381fd84e5d8e978322a62a58fb00e
-- 
2.52.0

