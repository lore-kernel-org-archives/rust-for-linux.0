Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02102611E
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Apr 2024 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712306834; cv=none; b=pw8Z7qVferkh4TA37pC764SiAiqW45X2Ygs0OWSdu1Sfw2HdwaCuOq2OmgMHMNzvtcPSu2yCXpv6f8xywjR1FT5y5FNQub521DXLbG+mjGp5hv21py2i7K6UMkYkRR3Mg64ojwRupSalWKvWf6kPuL7Pb0Ml6ZstmdSoavm2UcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712306834; c=relaxed/simple;
	bh=9k9i2KfTGqbxvYpKCc0ya4qLOK6NFOz8FalKwjTx+JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0i3KCHIqBAEZrgKyLDFL8RX2z0TgABcVYpNeVCI/gV4/gPWdnZXXQ6wcblPnNilUnTBxUJrVuMomuybb8oPMn3pMRlFiiYgx5x9Jf84Mzz4v4hk0zlFwdAbE8LkI9BtGn2BUL9EdQSNUn/oiQ07SA+0dfO21H7cve2rvHUB5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de; spf=pass smtp.mailfrom=valentinobst.de; dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b=bSy5DxlM; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b="bSy5DxlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valentinobst.de;
	s=s1-ionos; t=1712306798; x=1712911598; i=kernel@valentinobst.de;
	bh=yQGQ8wUBJarpfwFuxyixwHCEfLsf3yr+5MZhY/ei13Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=bSy5DxlMMzngxRw5j+d5m8q3e5FYFmlhtwM6fD6tJfZWxdCdw5wC0B/l3UHbm2Bg
	 GJ4P0B7zIkmBd2QJbzVKUQebADB9kMMXup/eA4Fub0KCugH2veR7IPtg0aY4UtpUl
	 1V+Rt1WkJc2UUazKpfcqLE9hbFMwvI76i+ka4C/3xr75yRHxYlzTSzmfomKjqePvA
	 wzUHdBXoxZu3lmX/Cm+OXm0qH/zJwvkKOrTe976GCo9y4omGhzoQFt0b4kPzg50Uh
	 BYOCoDalWWtHeabM0NEz5LWnMW2VPACwIAy//KaRpsycuEiIxKsCENwb2FJcOriTf
	 5cV4x5wIS1F2dLerzg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost.localdomain ([95.223.130.98]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWAjC-1sKiaC0BDe-00Xc3B; Fri, 05 Apr 2024 10:46:38 +0200
From: Valentin Obst <kernel@valentinobst.de>
To: laura.nao@collabora.com
Cc: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dirk.behme@de.bosch.com,
	gary@garyguo.net,
	kernel-linux@vger.kernel.org,
	kernel@collabora.com,
	kernel@valentinobst.de,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	usama.anjum@collabora.com,
	wedsonaf@gmail.com
Subject: Re: [PATCH v2] docs: rust: Add instructions for the Rust kselftest
Date: Fri,  5 Apr 2024 10:46:34 +0200
Message-ID: <20240405084634.3474-1-kernel@valentinobst.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403092452.30300-1-laura.nao@collabora.com>
References: <20240403092452.30300-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qP+4MiyAQaUxKyNfjbuLIwEWafE2FWukOmtXnLRx3Lau5kmD1Y1
 TsKm/1qpiqbMGYdOFTisDhNFPfSzZnBr2XPkpg5+DNyTbdwP3z2JkIesVrWgyv79R2cbBvw
 fMyXb54OLC+64oA86fBG9cbzFNFcwHPbmyoslTmnxqEg5ZdbfqIHjqmIFs0nqZLAWs25V7T
 uUB9jRvFWOE/8Dnb+DiMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ObI7NtfsPWY=;+OCstHm/vblFniDMTb0aryZHkT2
 URiHDiXMrwQFnJIcXYG/nu5n4hUJuDGN8/6oc8T44EhQhwlvLbSd+eLCHTwZ5Y07ct5P6ygH0
 gniNsn6os9w56K98ujil1/Xhqv+FYHH3sniokqMXM5RgBjs03sRXEzi3UlV4gXocwaVh3tj8x
 kFH/320TrbTHeqBny0w/G7LwFbSI1Vhw8ULCLtMUtcjUsXsW7LnW6Ba2A6/k770AQql1/7U61
 WEV+mXuGb7oaN7EROyA7hW5RRYL4o1CKVFfC1HA7ifOf021i2gB0T5XKY3tPoBYvLwxncAwIW
 WIGFw/nfMLj+4coM9VijkW7AlRMDTQsiwfbknBMSgSuzj+iGVBRB91tS08cmtFHJSw8nfPxHn
 GNILqqF19eDiDhRU2YNN0jQv/IJEhtfHPaHWj7vghlUIOb/v2kEAqUUw6rIS9HLSd6FFwkSCQ
 EErcFgZLy+Th5WW6VQGSgcqkhGaNdxNBocz7AABsL3mmqXcOznztupFCJ7h+38rEBnTxZ2CkO
 pgeousKyF+wmnAfSTCvj4bX+KhGXB7rSD3bObQFobbBMFIaWayqoO2RMUKvtBXPYdDmrEyJJ8
 CW4syaW/fO+hrYQNtChJmx71fYPoOz+OEUggvB20mUnc2DyFH1BB26U8B0WEsTGxIw48v0TfA
 lQiSrSZM1v9Zomd8/llwZ0Hb2iQehmAKWWnrslmQQB4QiY4DeoEsl39Bhzj3y8gTo/h+vmLHb
 HzNqgwhDhH6Ewqv/MulrPWhlT0hddXE2RRYll7vg2IfvfUfkfkKmGM=

> Add section describing how to build and run the Rust kselftest.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Hi,

thanks for clarifying the system requirements. Only minor things (see
below), irrespective of that offering:

Reviewed-by: Valentin Obst <kernel@valentinobst.de>

> ---
> Changes in v2:
> - Use plural to account for potential other tests added later
> - Omit details about the test_probe_samples test
> - Clarify that kselftests are intended to be executed on a system running the same kernel to be tested
> ---
>  Documentation/rust/testing.rst | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index 6658998d1b6c..64f58c4308f8 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -6,10 +6,11 @@ Testing
>  This document contains useful information how to test the Rust code in the
>  kernel.
>
> -There are two sorts of tests:
> +There are three sorts of tests:
>
>  - The KUnit tests.
>  - The ``#[test]`` tests.
> +- The Kselftests.
>
>  The KUnit tests
>  ---------------
> @@ -133,3 +134,25 @@ Additionally, there are the ``#[test]`` tests. These can be run using the
>  This requires the kernel ``.config`` and downloads external repositories. It
>  runs the ``#[test]`` tests on the host (currently) and thus is fairly limited in
>  what these tests can test.
> +
> +The Kselftests
> +--------------
> +
> +Kselftests are also available in the tools/testing/selftests/rust folder.
> +
> +The kernel config options required for the test are listed in the

Is this intentionally still in singular? Maybe replace /test/tests/?

> +tools/testing/selftests/rust/config file and can be included with the aid
> +of the merge_config.sh script::
> +
> +	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
> +
> +The kselftests are built within the kernel source tree and are intended to
> +be executed on a system that is running the same kernel.
> +
> +Once a kernel matching the source tree has been booted, the tests

Maybe say 'installed and booted' here since at least one test is using
modprobe, which expects to find the modules and other things in some
standard locations.

	- Best Valentin

> +can be compiled and executed using the following command::
> +
> +	make TARGETS="rust" kselftest
> +
> +Refer to Documentation/dev-tools/kselftest.rst for the general Kselftest
> +documentation.
> --
> 2.30.2
>
>
