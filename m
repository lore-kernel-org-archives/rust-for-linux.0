Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94331B042C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538119; cv=none; b=cHOzrzepglFFWUc2aA/Key0vfgN9Ug8LZ+5oUjdZNreiAyMsGKUl/IFlInZB36qS+4V9YoTYes3bE8icnnPt1Y0HCX0UxSNszaQ20XqKx5lQ9MhKPlacedKpgI9ONT7H6/jG8QYqBtrnwAkCH8yn3T1/DqYbaHD2esOhhbhVA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538119; c=relaxed/simple;
	bh=xbs6pkcGGYg7MyC5acef3Ng6hd1HLWjVDBGDfxb/tJg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Sj61wU6IqYTL6RJPpvXYnl5cqAyy9vWb/KeKfxquRgXnSx/9vZn2OYry1lBxwNtfmQDGHeH9sXvGsCuM1T6Gxrf/fa7BYR5alcUoKdTvQpBA16mjuAmaNjq17KNoWKfcBESCb0Vy9wS7G3t4oIhH3pDk+oemVOPxSPcPRExSxe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ror4JQ0k; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ror4JQ0k"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so11441895a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 08:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734538114; x=1735142914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QW50ES75k7ZlA+0aVGA2vQrwcPxqpxjuyk1+khizvpM=;
        b=ror4JQ0kE5AOwhenmIghuE5eMkA0VuPgU+Q6k/fpEt3uL1/W7mNjdiVgG69ysPSTl+
         86vmU6mYNgvpZxowsbV8GbD3lZCDgB4056/tbNobInAkye4sQ8VbAxiEMQQELOvxvhp7
         1UqECqrUJid0GDRncmQsYY2WY40m0OIc0BY9Kg3DUdn32RLrM0QLRVweE7SnFRP5YvRB
         mCEMJ6cpoj/KItcYVT33LQxOh+MeOzAUWpQCToc8ApiwBb9od+DRjOrQu/MYev+RL4XP
         Y+Pa7GW020USzsFKGf/09IOYu4oRfPSnN0gKIx0rtwp/MAMENCZEu0leMMZgUBBrVHxw
         Q2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538114; x=1735142914;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QW50ES75k7ZlA+0aVGA2vQrwcPxqpxjuyk1+khizvpM=;
        b=X7VeWLEs4+67KLyHnjLe1P/GQlnHgBfCzxe9WtcgRWbjdDFTyKUGVrmoj9KaAtXIXD
         jBX/y/9oSYrH1HQ/d1m9Vcm5Tz2CsN5x4z9u5dH+1UICwif0S80Je9nSs7ebRNIwCm7h
         e9SifTZk/dHJbhNdb8SXorpDDyaTgzbgQph/PLj1cgFEvPGTe4G4yn5slABsV/WQR3PL
         sIsxH7udruAlzPyJxLxqHhHkbDFrTz9ViSikeKyb/17W6FHyXQOdOPRIjZPKgv73ylj1
         QreeCk5V90Fb4/M/caco0MpGZ4C15Wtsow5kWgXFJ1QCgapOA3Esd7xsnVl4aEy1X6Xb
         n1pA==
X-Gm-Message-State: AOJu0YyakZtpYbCU3V9yFqQDSgrBdFKdTKL0rQJk+bqD1BHm8O8KJ9py
	tp4Dk/QqjbB1pnuI5NmbMeUnY1B4nfgS6kQ6fIjz7rmf3lqBL3t9DDt2w+Q3Yth/supvaIQi3qA
	WCstJ3ahLbT+uY6vDuCEWBoBwdS6A7jCdDcwauF6SAWzfa/MOCSo=
X-Gm-Gg: ASbGncuyFOZG4WA5rxcuRxtDOuOy8xkhp3+41tOpNQGdwuA7d6P9ILhbo1uIHCt+Fla
	r0pfLEUnv5d198HNV0M0WJBewOleBfIJYBMJndiU=
X-Google-Smtp-Source: AGHT+IEvRDswF6qCA4Q4qe8FqmZE+32BF9dCulruYx6y5eM7Eq42ZItCwVXs3YMMPKWYBAIm0XcFZu7vNiJzcGvFsW8=
X-Received: by 2002:a05:6402:2547:b0:5d0:d087:6d5b with SMTP id
 4fb4d7f45d1cf-5d7ee3b614bmr3267431a12.18.1734538114296; Wed, 18 Dec 2024
 08:08:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 18 Dec 2024 21:38:22 +0530
Message-ID: <CA+G9fYuP2bHnDvJwfMm6+8Y8UYk74qCw-2HsFyRzJDFiQ5dbpQ@mail.gmail.com>
Subject: arch/x86/include/asm/current.h:49:9: error: call to undeclared
 function '__typeof_unqual__'; ISO C99 and later do not support implicit
 function declarations [-Wimplicit-function-declaration]
To: rust-for-linux@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The Rust gcc builds failed due to following build warnings / errors on the
x86_64 and arm64 architectures with selftests/rust/config on the Linux
next-20241216...next-20241218.

First seen on the next-20241216 tag.
Good: next-20241213
Bad: next-20241216

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this regressions and found,
# first bad commit:
  [20b3c3eccd9361c9976af640be280526bef72248]
  percpu: use TYPEOF_UNQUAL() in variable declarations

Build log:
-------
arch/x86/include/asm/current.h:49:9: error: call to undeclared
function '__typeof_unqual__'; ISO C99 and later do not support
implicit function declarations [-Wimplicit-function-declaration]
arch/x86/include/asm/current.h:49:9: error: expected ';' after expression
arch/x86/include/asm/current.h:49:9: error: use of undeclared
identifier 'pscr_ret__'

Links:
-------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241218/testrun/26395023/suite/build/test/rustgcc-lkftconfig-kselftest/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241218/testrun/26395032/suite/build/test/rustgcc-lkftconfig-kselftest/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241217/testrun/26355712/suite/build/test/rustgcc-lkftconfig-kselftest/history/

metadata:
----
  git describe: next-20241216..next-20241218
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2qNMCRNosQCRWxj5dIUE87pDXos/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2qNMCRNosQCRWxj5dIUE87pDXos/
  toolchain: 'gcc', 'version': '14'
  arch: arm64, x86
  build name: rustgcc-lkftconfig-kselftest

 --
Linaro LKFT
https://lkft.linaro.org
