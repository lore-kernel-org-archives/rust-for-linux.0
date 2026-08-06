Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380ED485CCD;
	Thu,  6 Aug 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035672; cv=none; b=YTatZkSROfUZtCKzKueZvhZVxFR/yHbcIZS21EDmcDccDGEW/ipON0mUCxdy1c0ITKXSKiPdkLaHGUEYm2Po9QpLAfGUQ0ZEplQLYnwSKXFh02FivXc93tCMS4+31RvpBsS5YfyTdrPLq5blCKc72WqdezZ6vZEHCfbkflB2NsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035672; c=relaxed/simple;
	bh=bmMIvzfmQ7BeYn5cajaTZYnS62vXNyHLR34Pu7awYQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7NUv7nUzevTlT+wR8zt++x0b2qWE2/aTrBmVTwdGZYQV5n0ZskHCwH9Kof8deEpL7nE6mzGFVNQikFnVUsoOV1UwS3OcU5wIgMUniob0vtJjcbgjJ4rXujGJt40tVWyzGzqLdJhQ9ZXniubBZPRWK9umuL/s21CSSXuG983ZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkMfxaXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkMfxaXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FDC1F000E9;
	Thu,  6 Aug 2026 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035671;
	bh=j58o4tQkEHXKsK4UmBbaxK0v61wp70HA9mAxBwH7Bfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OkMfxaXl0iOvB8FVIKoE6BsigEDabSMY9hBMa9/XFtEpwy24uurpfZ9ny975IGcEq
	 Z8pt0BSjFaZWNlJbPdEljmyfBfLtebqXKGilZaxFoUQaLNUjYnT1UPa21W410RgCgw
	 NGqHLkln2hclckkZ0l/TanKjh8GaBxN0iYr6Lx03P4gJs6lCct+plX3GEU6fLrQCrU
	 dcb4hMTmCjdda5XjtwPZdEYZzVbuoRlOgSFYkIScO1aLWpBuyj7RkJko9pXJGDqSif
	 +LCH9jqbjkcCWDVpJanLzKpH1flXBcyWE5/8PXPLTlEIL1VKSM1FtMcrHvPp4w3hcC
	 jCSL3frGqVb9A==
From: Miguel Ojeda <ojeda@kernel.org>
To: gary@kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
Date: Thu,  6 Aug 2026 19:01:01 +0200
Message-ID: <20260806170101.67544-1-ojeda@kernel.org>
In-Reply-To: <20260805190012.2934907-1-gary@kernel.org>
References: <20260805190012.2934907-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 05 Aug 2026 20:00:07 +0100 Gary Guo <gary@kernel.org> wrote:
>
> Still more of refactors this cycle and not much feature updates. Tuple struct
> still doesn't made it as there are some complexity related to `#[cfg]`s, but
> the cfg-related internal refactoring are picked so hopefully we can land it the
> next one.
>
> I did a late rebase today to rename the API based on Benno's feedback. It does
> made it into today's linux-next (2026-08-05). Feel free to wait for a few more
> rounds before pulling if you see fit.

Thanks Gary -- we will need this on the merge commit in linux-next due
to the changes from driver-core-next (Cc'ing Mark):

diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index c0cd24481ee3..a4927452016e 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -197,7 +197,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             // SAFETY:
             // - `driver.as_mut_ptr()` is a valid pointer to uninitialized data.
             // - `private_data.driver` is pinned.
-            let result = unsafe { data.__pinned_init(driver.as_mut_ptr()) };
+            let result = unsafe { pin_init::raw_try_init(driver.as_mut_ptr(), data) };

             *active = result.is_ok();

Cheers,
Miguel
