Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06942364029
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128783; cv=none; b=HXGRfk3Y0TBPKpT5TyXoFuC/5xrbnTehFd639FH6vErHsdbQhN9YgaRVe8AKdUxoEADhwjD9WY3FW4XyspZ5xUUf5q5TfLMFkKyGuC/P6AUvR26YaYflu5la629QmuKQJ9ZTrNJGzDeKVXGbKaBhsfhZTaC71lI109uhrZGQm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128783; c=relaxed/simple;
	bh=Xd15QEXLpAIBG3VyCnxi7tmmMZSQJXcb6FuKM3D2wx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iLVWHpPwlm+fWadfo4GdUUWTIFyHyVZ6/drsQoh2N9fBZTsI7Lj8v5AmeZJOuFwIAXEd/D5qViCxbK/YX/LeBbRjaRZEPYAwWeCW+tRn63MvU9M88WEjZmFhYnR4QAENkqi4S2qPLtOgx7eLh+FuIPBZiuMC27TizjQLCJKD2iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=hYymN9Na; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hYymN9Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1775128769; x=1775387969;
	bh=gxJJnhhx/GXzBZW3EjQvE+B5ZIdLWBgB5nLyHLsOJXc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hYymN9NaxlBeem63RbcEQbNhZWbbIYMFVEUX/KEAlN3g1UXrG93ZBEwM6wIhJj2+8
	 KQstW0XkMVzceW7ebi2IEcXzfeKn9hnPCfJQeKUKIiOAbFiEXfj826xpHysKrCaFj+
	 /nDhHOHRQqSxB2JJ4H3qmocLMvA/nzDFbKuorPFBgU0RWUQydVIMskalf34BapQSy2
	 pNdxw8i0SiAufOoQu/53yzkXZoNUxKzXxQr/vQ/xZ8211HoEqvH+jDjAIEuQv/qZ5g
	 3vjsw2g43R0/T+eGG3AR4rOvQtNtTaMb/AfHwPDlrlH5THoAp5aQEpqk1hK35kJS7J
	 4r9eqHGBsjmYg==
X-Pm-Submission-Id: 4fmfWh1Qwhz2SchN
Date: Thu, 2 Apr 2026 14:19:27 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Aakash Bollineni via B4 Relay
 <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Cc: aakash.bollineni@multicorewareinc.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] rust: workqueue: add safe cancellation and status
 methods
Message-ID: <20260402141927.667a50c4@nimda>
In-Reply-To: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
References: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Aakash,

On Thu, 02 Apr 2026 08:53:45 +0530
Aakash Bollineni via B4 Relay
<devnull+aakash.bollineni.multicorewareinc.com@kernel.org> wrote:

> This series modernizes the Rust workqueue infrastructure by adding
> methods for status checking and safe cancellation. These capabilities
> are essential for implementing safe driver teardown paths, such as in
> 'Drop' implementations or device removal, where background tasks must
> be stopped before resources are freed.
> This version (v2) addresses the feedback from Miguel Ojeda:

I thought this series was v1 because it doesn't have the version
prefix. Please make sure to include the version tag in your subject
line (e.g., [PATCH v2 0/3]) so maintainers can track the revisions
properly.

Thanks,
Onur

> - The work has been split into a logical 3-patch series.
> - Spurious changes (top-level .kunitconfig) have been removed.
> - Initialization for DelayedWork is now handled via a robust C-helper
>   (INIT_DELAYED_WORK) to ensure correct timer function registration.
> - Pointer arithmetic in the reclamation path has been simplified and
>   verified to be underflow-free.
> Summary of changes:
> 1. Helpers: Adds C FFI wrappers for workqueue macros and robust
>    DelayedWork initialization.
> 2. Core API: Implements is_pending(), cancel(), and cancel_sync() with
>    guaranteed pointer reclamation and layout safety
> (#[repr(transparent)]). 3. Tests: Adds a comprehensive KUnit suite
> and a standalone stress-test sample.
> The implementation has been verified on x86_64 using KUnit (4/4
> PASSED) and confirmed to be race-free under high-load stress testing.
> Changelog v1 -> v2:
> - Split into a 3-patch series to separate helpers from API and tests.
> - Replaced manual timer initialization with
> rust_helper_init_delayed_work.
> - Fixed field offset arithmetic in container_of macro path.
> - Expanded KUnit tests to cover DelayedWork specifically.
> - Wrapped commit messages and cover letter to 75 columns.
> 
> Signed-off-by: Aakash Bollineni
> <aakash.bollineni@multicorewareinc.com> ---
> Aakash Bollineni (3):
>       rust: helpers: add workqueue helpers
>       rust: workqueue: add safe cancellation and status methods
>       rust: workqueue: add KUnit and sample stress tests
> 
>  rust/helpers/workqueue.c            |  34 +++
>  rust/kernel/workqueue.rs            | 467
> +++++++++++++++++++++++++++++++++--- samples/rust/Makefile
>    |   2 + samples/rust/rust_workqueue_test.rs | 214 +++++++++++++++++
>  4 files changed, 682 insertions(+), 35 deletions(-)
> ---
> base-commit: bf074eb6891be799174ff42e0051492681fdc045
> change-id: 20260402-rust-next-19ba03aad3f4
> 
> Best regards,

