Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5F73466
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514252; cv=none; b=h6FrLzw5Ew0wQLKVnGN/8JFpGGNZllCEM4o2jDOedVi4JqTxmNVTAI4AEp+83tpbHpDr8edfkmdpYv6GVTc0i7SPPaWKk/p3ZJ0jvrTMPuh+OXINdmK042pG/T7O/Ffl9lOrKk1/iOgvvu5t2LXdDU+LPo7RdbrTGMtdJ/iLCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514252; c=relaxed/simple;
	bh=e0ST16hFS8BD4t8TE1aEuiovt67c4WgIofkhonJHDoY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dM5mBjJFqsrXnCLJU4tpkCH4xjqRogMwyN2/e/ZQuZq8sq+4JNrvtOXiDSIggBQcV3J583in6MJMLU3/+4m4vmBAjRtaNE4BJX5EQwQGs4LuG0pEV5WGtok/R6Ha4Wkzsf8Hq23gf0oTEHl1Qva1m3JO5Avxcu2XYSqmHa1aTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cu8E3QFg; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cu8E3QFg"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84876d069acso1207724241.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726514249; x=1727119049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vqx3usVPpKT0iyvBpApWWwNta7RIraSs6wvkWJ44Agc=;
        b=cu8E3QFgjarVLCsTJS+Su0+l3NIcNuNMDVmy1Kj6YQthEV7OmV/4kE7W3fYjnBEGEa
         YvuF4ej5QOUN9oEGah5oK2MqnxyYhr1j5NX4/d+GMSQhDVD3ajYSOKTysfeMD+Hzojzn
         4y1f/so7MvdbreLZq/Q6nCt1iJPkyh3OmAORRgkoWAFVj43ZXxcaG7vFCVhOI8GDFyzX
         uYKikj0Z8SOpcbvK0YyKreI/WpZY6acG3jXFMRYhkzH7ZBCyzf09Ly5Y1b1ZR03y4oSA
         2z+WjuP1EEdW2+f1wYVUkf0YKjx26hG2QeEQgC4oyjN4A1S7qzTQwGkIe4sr3ZRpkL4s
         hw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726514249; x=1727119049;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vqx3usVPpKT0iyvBpApWWwNta7RIraSs6wvkWJ44Agc=;
        b=sXIok2k7VtnrT8g5WL1W5QrWl93Vt1jV8Nih8fJYMuFeOTVCplrQ9661w5BRDia6kP
         N6NlF95DrL7zIFWBm0KvPckSNkPZi8figt/SYmzZzUwVEKY6AT+6Ir6ojD8szvUr+69f
         XBYnKRSyQihwC67A7E4aQ3exEQVti/BG/oJ/APNOJVL/xi3wwlUz8iuAgYVKx/rQBsqW
         BvUOJvr7t/Eu5gIG+8jpHHYtWAdHC6qzecUXPTQH4/Jd8ZqK1YZG+b8zbWjJRFS5EKYc
         9zbp7rMUEzZ6GUgTO1v3rmiRo6LJ0d2wZJ2a0HdS8lshfi0pOhJe+nGmageg+8xZQhVY
         Z0NQ==
X-Gm-Message-State: AOJu0YzCIVpk+Ggn7wPFpbnUZy8a1SUUztkaa+GMVHln0Hdwe1Xs8qM4
	zzo6+IVl37VUE2VOKx6WnXMPMc2UoAJAf06toq/NCR5qZK1bmymqlTDn3VxtfUjt7fxKjqGLL02
	hFXU2BYAmhrtB3OEUfJxGBbPLw3L0w5EqnXKa+JiZKA0I44ibQ/0=
X-Google-Smtp-Source: AGHT+IFS9//ZCamdnpFlaBqZvxOqDw7qKjCs+is9WBT+P2HGRgdKr849Izo3HFvk8azXHKlcu7vS45+Ic9quvSm42II=
X-Received: by 2002:a67:f41a:0:b0:49d:43d0:9913 with SMTP id
 ada2fe7eead31-49d43d09d07mr9444822137.19.1726514248829; Mon, 16 Sep 2024
 12:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 17 Sep 2024 00:47:17 +0530
Message-ID: <CA+G9fYuaDUCxseqCW8BO0KhLKn6F0VHYaAhu-T9v-MJHzJebcQ@mail.gmail.com>
Subject: rustgcc-kselftest: error: unknown unstable option: `patchable-function-entry`
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, aliceryhl@google.com, Shuah Khan <shuah@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The x86 rust gcc builds failed on the Linux next-20240917 due to following build
warnings / errors with rustgcc for selftests rust builds.

First seen on next-20240917
  Good: next-20240913
  BAD:  next-20240917

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
--------
error: unknown unstable option: `patchable-function-entry`

make[3]: *** [rust/Makefile:392: rust/core.o] Error 1

Build Log links,
--------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240916/testrun/25144919/suite/build/test/rustgcc-lkftconfig-kselftest/log

Build failed comparison:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240916/testrun/25144919/suite/build/test/rustgcc-lkftconfig-kselftest/history/

metadata:
----
  git describe: next-20240917
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: 7083504315d64199a329de322fce989e1e10f4f7
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/
  toolchain: rustgcc
  config-name: rustgcc-lkftconfig-kselftest
  arch: x86

Steps to reproduce:
---------
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/tuxmake_reproducer.sh
 - tuxmake --runtime podman \
           --target-arch x86_64 \
           --toolchain rustgcc \
           --kconfig
https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/config
\
           TARGETS=rust debugkernel cpupower headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
