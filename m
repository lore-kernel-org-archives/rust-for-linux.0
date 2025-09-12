Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E0D2D879A
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669273; cv=none; b=RXE7R8tN+kmwPuSC4uC8oZ/2uMQ81NqHIBbbegchsC7FvcnQNOgcvlD/9PGKpeZSowOeZNu0sal7v1zrhuTuqcmTbRDYay/gdUDP6GfzVnXF07b3DBBLNHlVGiZmMpt1yRXgxPoH7h2fyK1GiHO6xepiFHDDtZ0FdIefGaRWuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669273; c=relaxed/simple;
	bh=3tSH5UPTW11Y9XuzBfniGHAKTRbqqxgrANUoPyfLX9A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pgn6pT1gTIsbkjJGwGBkPd8cV+hLScRO5POCDY4Xl4nzUMPllSRQlVzA2P4crLQK+Pf8FYvStmpZvf8v4p0fij/YPHFySNAwd5CVMsA3HDBySPhTBXpxY5nqBH66U5wWmsIDCfzJe6oHfAOy/IpQi48WGZlOZUzXusoVyrv1/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S99D42A7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S99D42A7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-772627dd50aso3164643b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 02:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669271; x=1758274071; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3tSH5UPTW11Y9XuzBfniGHAKTRbqqxgrANUoPyfLX9A=;
        b=S99D42A7T0nrNsHpFhPhe+ly2iDBO5C4Rw4pqonjYSH8715QNB6TZasAmTfo9UivV3
         zTikZiZY9CtMA4BqdlcuwvYpm+RwNtaXtqE4pnaIUANW6mqR873Ua/9Zyn56j09C729X
         NctCgaP8tnrjPBtkHzvZVapVf2+u+McDoqNSvS8FH5Dcx/orqYbq1UpZXpezHZb4hOO+
         oP1GS4mBav9QGjQuOqces6l0hPrRLfRxIloYwPR8MlAVLFapiVeN7kV7/gKdF41LEl7x
         hW3YjvsztxMellSab6OQpxMp4pr9hv4oF1NV9fmALC1Iauh742y286iifoh37o1wATaF
         7dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669271; x=1758274071;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tSH5UPTW11Y9XuzBfniGHAKTRbqqxgrANUoPyfLX9A=;
        b=Zidhv5lFuPlcWOEzWdVOvsdYG7pzzQwE33J1fGw1hIBJ4G/GvHXYTBHD60N4vT+Fah
         t02obdmyttTC3HGKOTZ0qR5ATuDr5TZPjTIcLnp7GuyqeYfyUVDC+/UBr/eIZ7DdW90x
         yny3MJtKCxO6pZTXmFDSpkjCxCeuxH3x7djE0qqs39u+nfRHGhglzaFL14kw3GmZKcS3
         2ELjkU7nbK8Yj3hFyks5uSlIsZLn7lF+xZYTiAMFkhAPQuWAS3NraZVSKUanvdSt3zu4
         xBJ0L/or7sVQX3WQ0xNoog2OiaW1dqGnDo8XslT21El41et/Gd8sxXCBKFSQNqsKxVQU
         x65w==
X-Gm-Message-State: AOJu0YwevH9AcxOTxW1kx4F1IUZkAw3e8EQbipnCeeqDRPbypzN39st/
	gZPC/QsRkV6rpTKb0qZ5V1+3FvDD9r6dbG3GPspuRT8an6lMonFiRVM8cyHYcPfF49h5Qg3DV2k
	KAe6fla4qRfxadDa0czYmPPTOcRbOSLDk6PXE12hrwsIiGyKAPu1S+xs=
X-Gm-Gg: ASbGnctDUXHi7eGWPM4a5ZgWtitGFZ+XHoYmK0l6HNO1P0khBOQXaT1NmZ1jNXFP2F/
	bUP3AyIAfD1eh7Rozi9dMylz8bxfSnyo9IfiH2yMNYqCfSVlZ06tW4IC9MqfHQ/qyUWp6fv7uPK
	1Kt/T6KcTJ31c7rPWtwou935bdLmxt43fvAATiHwMZLx0uf4JJOzpWYiYE/GFTHFaDD6DNdP60X
	VF1BL0wdnIQlXvYS/DaJrIm+GMbRfw8YDeeDaHTG/kbtj7gWOL1VEIDZc+DZc6kreTrDgmG
X-Google-Smtp-Source: AGHT+IGZ9/J/gRux6Yk+W24Z34To2Mx5yS/AKLrFXbt6lRuuYYcUiQ9kDBNt6XBpcfyt0QsI4mIodpEyYI0UUJ58oww=
X-Received: by 2002:a17:902:a718:b0:25c:4d67:4deb with SMTP id
 d9443c01a7336-25d2ab3e054mr18239165ad.8.1757669271042; Fri, 12 Sep 2025
 02:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 14:57:39 +0530
X-Gm-Features: AS18NWC_BexFmwLhPfYunrkIwo54ALG6qwusgzRfQHujBXuhNkTXAN-rFLSveGY
Message-ID: <CA+G9fYv0rvRLMM+20vNSdzVWoT4skpoJ9EjD0LyY6dD1TqjTzg@mail.gmail.com>
Subject: next-20250912: rustgcc: x86_64-linux-gnu-ld: error: unplaced orphan
 section `.sframe' from `vmlinux.o'
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on x86_64 rust config
with rustgcc toolchains on the Linux next-20250912 tag.

The change in the build environment noticed as rustgcc version upgrade
gcc (Debian 14.3.0-5) 14.3.0 to gcc (Debian 15.2.0-3) 15.2.0

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250912: x86_64-linux-gnu-ld: error: unplaced
orphan section `.sframe' from `vmlinux.o'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
x86_64-linux-gnu-ld: error: unplaced orphan section `.sframe' from `vmlinux.o'

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250912
* Git commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
* Architectures: x86_64
* Toolchains: gcc (Debian 15.2.0-3) 15.2.0
* Kconfigs: rustgcc-lkftconfig-kselftest

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29861691/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250912/build/rustgcc-lkftconfig-kselftest/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32aTGwi7jsx5icm9sDcpfJLbJQB
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGwi7jsx5icm9sDcpfJLbJQB/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGwi7jsx5icm9sDcpfJLbJQB/config

--
Linaro LKFT
