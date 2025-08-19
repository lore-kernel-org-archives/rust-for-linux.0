Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DDC3115A7
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592842; cv=none; b=Nmjm2PqQ1WXR/3I7zuQkmITjAhLT3/zeqLpnF8tWW1bMUvFZZh8Do7lqkUNSGY+ryshC8Fwh/xcGFFv37h5mVvYrirmiipsMxFjdaG6D7yA1TtB+GRzGwrXT/cGEjGSzYe+Q1MdkD1gewuT7zznjnp3jDSvrvgDaES07Vx+3S3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592842; c=relaxed/simple;
	bh=s4rCdNrJl4PbZFUL3SQdLxne9G64dePB0cGlGicB9/0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RAgB5TNgWQQLY75jJ3lzYKxszXFr3VTbraKmb7sGqHhDwPo3/KLVtEx5P6b7SW4LPbw8/y5V8v/G2HREcyzbfV1rl7sFtMIkOeKkENXzCGSkUkI9lA/YH8a7yIPICNtnmwTK6SZ/gQgBrjqtMD/ivczcMr1JEpXCQtqdtNT1804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RS0bKH9J; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RS0bKH9J"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b47475cf8eeso1165678a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755592840; x=1756197640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fOvEbU0Cnc0FjNAEZg7vmgeVRfzmShXkhUtYM2eUAbM=;
        b=RS0bKH9JwTp4NOYDbvLcuQAXEuro4ovoSLC0dfi/6W2kyEufHBw1EFh83wvL0PAXTS
         tt8KUdOhe6G09a/F+EBJ40jx22AiMiDn14nUmebvCSDugwk1xNlgwFER/gaGJ6E5JgKZ
         WIL2E/4hFeICmZqBx6H4I+0d1NNbd1yarUof7T/Z/9/qo9VIqaoIjlycw1BJ24oDcHzF
         eZ4gOHfyQW6Cs7QJuuDC5TG6YcpWeOCLCaJLEgJQm6q83VFrXm+v+plD1e9QwPen4SV1
         mPLy7kbAIzxqqjJiEC1MLycIY/mjdU/QvyJ4/tAysXwXxJRYH3vhsIwmMtY3u/41kZ4/
         WOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755592840; x=1756197640;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOvEbU0Cnc0FjNAEZg7vmgeVRfzmShXkhUtYM2eUAbM=;
        b=MzGIKTPcoduo9ABRlnNvmi1W/nAANC0nsnH1mP9Qasv90SKpHFTK3+wQycVjLzB91u
         rQQ3xMTSqblIQW/yrdATpRJS6ZUp3k5F0AK9n2koG8hVu0Fv5CDJVbCxbOPCMC0hPxxo
         5v5Si0zUTeU7O44EcWfcd+KNDhDOlLI6VkSC9dm3AwGBAh7/nBGWXtH9PSZM9MGay6ra
         hJE6MJnItM5IeBBZq1uOeGHQO2VC2zsvnfozVUGRm0GTqU6imn0zsmJTPv3nGjKaPjiL
         0OEQ/FGHBO6XTuRdrSyHjij8PUFFSh1DjZd0HB379m/mszjx9PGHIWU2Luwuos536LIT
         aadA==
X-Forwarded-Encrypted: i=1; AJvYcCVYk3M9gzP2asGPYT26DaitTjV6MN/bso6N+NXwRqlYsRgeYN0LyZMqe3mVg9KxH9IRoGRYRcA9r8gG8K6dwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbJFcQOKfNMcvX3sR+iyAvSygXIkmUpH5bpLvu74NqBED0mlK
	EG1wOW4U89kBlepHtBayBMH8cd7rZ2cAZw2YbmKUYMOma6QK+GqPsO81Dd5eN31Z47Mp5lX61gW
	Q3xrwMjpS5llWR5Z/Dfk2oNAvaRGYMlnfiG6HMB6mxUyF9G7cHn3P9Gw=
X-Gm-Gg: ASbGncs22Jb1gKDq42kkNvApSBllW4OmFhkUXeZa3rBVz2BEMmUAObsixxgeyDdAIcC
	YJGDDAZeTGj595gjJSFCyyDxtaEpGu7Is0dEfSJH2zuN8dKHDqBwJJHK4DJAEBjrDfHmEa99WVm
	b4tK3WKD1pgKgs//KSBXKD3whQY7jQdgcUW1mJL+8dH/BkqAZRwiuq9M3qM9eaoVLPapuxc8avG
	QcWl+BLfUm28W619J5Ldtx5eoydEcGqtOupDUmRD/ppoaD9wA==
X-Google-Smtp-Source: AGHT+IEGGBLrKnJA5rKPO3tG/2IpmKWfgJNSJRlHDGAPjusotj2Hf8o9mNnZTQtC90ugTktRZGVV8VN9rh1Puc8/i0A=
X-Received: by 2002:a17:903:1ce:b0:23f:cd6e:8d0f with SMTP id
 d9443c01a7336-245e02d83f7mr22374655ad.13.1755592839617; Tue, 19 Aug 2025
 01:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Aug 2025 14:10:27 +0530
X-Gm-Features: Ac12FXwQ9ahb2ew69m1KVEd7V2w8TSXSPCLlnKGNCFNH7jf-h193q59E6JrscyY
Message-ID: <CA+G9fYv+gELzgcL4y8rOQbTxv2Y2JQTFhNkgUcLbzPJ_yDTziA@mail.gmail.com>
Subject: next-20250818: rust: `ARCH_KMALLOC_MINALIGN` is defined multiple times
To: open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, wedsonaf@gmail.com, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Build regressions were detected on multiple architectures (arm, arm64,
riscv) with the Linux next-20250818 tag when building with Rust-enabled
configurations (rust-gcc and rust-clang) from selftests/rust/config.

Duplicate definition of ARCH_KMALLOC_MINALIGN in Rust bindings is
causing build failures across affected toolchains.

First seen on next-20250818
Good: next-20250815
Bad: next-20250818 and next-20250819

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* arm, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* arm64, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* riscv, build
  - rustclang-nightly-lkftconfig-kselftest

Boot regression: next-20250818 arm arm64 riscv rust
`ARCH_KMALLOC_MINALIGN` is defined multiple times

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
error[E0428]: the name `ARCH_KMALLOC_MINALIGN` is defined multiple times
      --> /home/tuxbuild/.cache/tuxmake/builds/1/build/rust/bindings/bindings_generated.rs:125708:1
       |
5305   | pub const ARCH_KMALLOC_MINALIGN: u32 = 8;
       | ----------------------------------------- previous definition
of the value `ARCH_KMALLOC_MINALIGN` here
...
125708 | pub const ARCH_KMALLOC_MINALIGN: usize = 8;
       | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
`ARCH_KMALLOC_MINALIGN` redefined here
       |
       = note: `ARCH_KMALLOC_MINALIGN` must be defined only once in
the value namespace of this module

error: aborting due to 1 previous error

Please refer the full build log information in the below links.

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250818
* Git commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
* Architectures: arm arm64 riscv
* Toolchains: rust-gcc-13, rust-clang-20
* Kconfigs: defconfig+rust

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29578517/log_file/
* Build details 1:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/rustgcc-lkftconfig-kselftest/
* Build details 2:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/rustclang-lkftconfig-kselftest/
* Build details 3:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/rustclang-nightly-lkftconfig-kselftest/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31RcUoS2AqZLljDCs480MNNEyxJ
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31RcUoS2AqZLljDCs480MNNEyxJ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31RcUoS2AqZLljDCs480MNNEyxJ/config

--
Linaro LKFT
https://lkft.linaro.org
