Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725611CA0
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046896; cv=none; b=EjlBti8j4D6zD+GyUoyKGPxvivvLxy6as3gxCXABtqQ8XP4WUthWwkbm34GUfacXh9JkLwk0OXqQfpE/t2KREwz1X25NijSqXHvmZavpffv0dGQgJcTX/T85F4lssL0jvV2xMHWtZqlN+PLGDvEV9GLEIOT63SHbHP4qBZYxV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046896; c=relaxed/simple;
	bh=a6Z+ENeEuUU+yC9/pxXn5f1hhHRj75A4YQ3p6o52+7Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pnfjcs9/qk3IPdm2jmm+QHRLR3k5I0T0k19eh7G32lui3nc+zW2NxLOEzT6mqpCD670McZaaV67EebL6I6XduNZQQfqxcGdtTxF+qmLHlPfHWDF3rmal4hpnzP2Si2PKI1hpLDoqZOhQmPWFfEP3KO8+TDiu2G+sMWb2G5Ykhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5W6cTOm; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5W6cTOm"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523dc190f95so2255516e0c.1
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Apr 2025 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744046894; x=1744651694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a6Z+ENeEuUU+yC9/pxXn5f1hhHRj75A4YQ3p6o52+7Y=;
        b=r5W6cTOmlNjbbX7waUS2oQItsqO8EDCzKHEHkZnuaakpZs6kqnjy8gyj5J4a/CrzPu
         wsWL4Om5TE+kXck6IfiV6tZi/qlHA21IfootF6x2+7oSHQWbL3ANH41PsUq8ZAG02qpF
         XMySGKBPmOzS+tK2YUKidZIAzt507fw93bvtw0WfMoY3vKO2L1Mu/OQbSd8yLoSvTxQy
         QkpkNVJF2njHy32gBMhINPyd8sOSL2ENF4tus87n46yRzApeorcNZ4iA4UDwrFXCPl50
         rK5xslg4qwRhZiqWOVO04Cw/ATCUXMmq8K+hokH98dmtHkAdl9mWZ65+TXhYQsS48lh9
         FgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046894; x=1744651694;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6Z+ENeEuUU+yC9/pxXn5f1hhHRj75A4YQ3p6o52+7Y=;
        b=UlYIQUadckA6Tz9jRf+K/TgRJFAQcw9gNiqDU8MpZ7x8Ilj8r91+1F/8t+7tipoAXn
         V3ZLcp3enMSvvKs4CAI4jm0O4jVGJnQkwU36iJM78/em0NHeU3ya3CL/1mOGucjHTBur
         Rtn9phEZ+G0csH+6n/t05YSPklhGbYbqVXIDkX17E7Au4L/W6vBiDXBNNxYzrfcwH1tX
         U6pBFf/thwV5iN0bWiYQci0V7man1T8BfUlLsreott2VSxEP/hZoKVjOhmvjrTPYMWWr
         ZHOZJH02SlyCY6u529Ppyd4aOB3vFdYcuA4MB2fQfRd7G3u9YQU+lWQiEOCZKGtOoW06
         dUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZs2cjWZEVvn/rPB0JVssvyaI/hUslTHUhTahQVB8QYQwdfsRRK3/KbV9VchmsDZ7b/RN+U5Xk70g0uLkSRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBOiXdQFrcAJDT//b45jeRg7ettuQ+syjKp+Bn2XdPJJ6JyHKt
	eVdQn0257ZJCV8ryg3/dkpr6Ei9RLL4yRLnhi4ZDikoakg0gAtvtHOB67XBQ38/8IyV0WZsHt5p
	GWoEbkcblcMZIuiF+RX6o4KFsSTfpcYv+x+/As2d1TG2bKB2ZiyI=
X-Gm-Gg: ASbGncvzYiGE6a0dyogyZRarAWdA5Rn7RvhJg6ywym67b/U5EbVpEIOOqE3QPl4ehc0
	lNloEs45juMyX8yNbKpxYJz5cR6XKzsQoVBwH+vfSDd7X7e4L/ur8Mq3fcNHz69kMg2sKmzUNcZ
	fpPljil8JH7ykcnP0TPQUMRyolXYduyY2MnmVlXOHL2SjckMpyp2AxAgwopcA=
X-Google-Smtp-Source: AGHT+IEVmMkitaw4QXdhkgwEdPJbukthI9jSNdopAjIIvfIiiFbgx7Oz2lGA20nc3VtA0Aj3qI6veAxd6wO3GXeed4k=
X-Received: by 2002:a05:6122:3122:b0:526:1ddc:1896 with SMTP id
 71dfb90a1353d-52772cd6318mr5308951e0c.0.1744046893651; Mon, 07 Apr 2025
 10:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 22:58:02 +0530
X-Gm-Features: ATxdqUG0lZPw-xmkzQsqNG-x55VknO4sMa7eENem1IFu3dmqQUBmDzTB3tDNgw4
Message-ID: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
Subject: Build: arm rustgcc unknown argument '-mno-fdpic'
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"

Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
Linux mainline and next failed with CONFIG_RUST=y enabled.

First seen on the v6.14-13039-ge8b471285262 (April 3, 2025)
Bad: v6.15-rc1
Good: v6.14-12966-ga2cc6ff5ec8f ( April 3, 2025 )

Bad: next-20250327
Good: next-20250326

* arm, build
 - rustgcc-lkftconfig-kselftest

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: arm rustgcc unknown argument '-mno-fdpic'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
Unable to generate bindings: clang diagnosed error: error: unknown
argument: '-mno-fdpic'


## Source
* Kernel version: v6.15-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 0af2f6be1b4281385b618cb86ad946eded089ac8
* Git describe: v6.15-rc1
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/
* compiler: gcc version (Debian 14.2.0-19) 14.2.0
* Toolchain: rustgcc
* build config: rustgcc-lkftconfig-kselftest

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/testrun/27924146/suite/build/test/rustgcc-lkftconfig-kselftest/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/testrun/27924146/suite/build/test/rustgcc-lkftconfig-kselftest/
* Test history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/testrun/27924146/suite/build/test/rustgcc-lkftconfig-kselftest/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNMCPjd4rTR3hQdnzAuHzLE1NR/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNMCPjd4rTR3hQdnzAuHzLE1NR/config
* Test history on next:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27929685/suite/build/test/rustgcc-lkftconfig-kselftest/history/

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain rustgcc
--kconfig defconfig --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
--kconfig-add CONFIG_ARM_LPAE=y --kconfig-add CONFIG_GCC_PLUGINS=n
--kconfig-add tools/testing/selftests/rust/config TARGETS=rust dtbs
dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
