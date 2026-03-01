Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FAC27442
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362450; cv=pass; b=jXddbzAL5CeQ0qh0+YV+knEOX9vBCRav6Nm/1kpHiFJhBmanVRe58EqYycsPWK/kOLMWIf9lIl5kEFVSgZ+vv5K1jYutTXPIkgV/Uwovp3rKbUMSErdkrLsDDg8cegzg+15Pkkx1UjP20P57jsWmKkzhr3/t4dHPhcg7DOc0kGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362450; c=relaxed/simple;
	bh=ms8NTfhFAFd+9H3v08OWErgtPevxHbBS7ddDm+R5JEo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KYsZS1l1MorVcXY/dav0rStU5ECo7S7VmUq2v8mOhxzMgxlFnWvDoj235S5PrJnQxsePWI+t3ULGksyNF4olCz8U3xYSE3X5eFJWdFOXPVMweh/9LvRmCPsxZ/yruI6KX2t12ILi3SqkQzuGWWlYBQ3p6qkr8kUYxapVjaliIS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8EB5nK2; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8EB5nK2"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127148c2112so237151c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772362448; cv=none;
        d=google.com; s=arc-20240605;
        b=SaMUIKIPv0oV2sTyXbl9u6AQTVsZtFPDlyTC0v1qvjmWqFS/s4FkQAMavcbQGfw6OD
         CT1KDtLLWAHcZrtirk39aCn6IxnUdJYO10AZ36kvNSSjwIYn583FhSFELQnmGUjTaI6v
         576DxdOiH491PUw6riTlIOUQV9Ltf5gxQZVCdv4tHbHCTHk2mK6rIa2FsD1dEUZ5B/4c
         fQMkLbJhs1B+8ZeZmrCUygYJYwnx25Hf9DNB9GdBPNc26DTqK12YYY0pIn/g35BViXTD
         HuiWqPceqrsaRx3/Ee7WsAVG7AdBC4v7xAsvJMJv2Pfay4Wfio3wqFB0WyDxz8LX2iOy
         40Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qPY2iRD0gGwPpoA/Tg2y3Kis7+P6WX010l6YDZdz674=;
        fh=vp3slSyhrAsjtpTYd0A+4erb4MZrtArstXfmneB0qIs=;
        b=hY3DQXR09WtTpJqTW1R5FnVRNPM0AG2Wafi8QDVebms9du9cMP7Sci7QYV8v/VMc7N
         1NRPhZGTIRnvr6yuXJoEGPlQeM+PX6IzZRvGUYUTfKzp4Hd34fqli/K9Bpxp8DDn3WdJ
         YVJWDiWHFeKZYm52Y3Jr0Xd9eZ2/SMbnLmr1bNkUsoc4/hppYXvt5YMkcvKMZcigRnhj
         DRf40tYgFI0xgz590u7jfWpSSEYCwBwvsp9x0e5JAfLM39WYVxsEGTHZSfSirRtwHDrW
         iU6nYyZ35Br11HwKpdYu53iskDh7nYyubqnSz0Px2txfjhr/7QCo9sbogj+Hxu0bDgEl
         Wiyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772362448; x=1772967248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qPY2iRD0gGwPpoA/Tg2y3Kis7+P6WX010l6YDZdz674=;
        b=Z8EB5nK2cqSjjbiZWzOXKR/C2U0qDzi09ATwYMAhdVS+J4Ql3jn50xELzh9uj9jUGN
         T9FR5SUihyAwtZ8mc9mbxJbZtipk7kuh/fJ4z+ykUySWuuvE0tuqsYGuLrqCuG9TGRQU
         vKK8UXH2iT9jUl7SEy0vaK2XsQZaumyBUAiOitKFVut94xvRVWUjp/BFcbTn/wDXZ5WS
         0QsT2YyD5J5DF6Ej5c/MvPMjqonltMMD4lvettVx3xdDD2A7A/829to+2I55FFcaeFBQ
         S4JorxZRiUxYYRRvD4/admf+PZXrNhVDsPksHGiE37dQP6+mRIlFEfSzEdDVEwTypADw
         amJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362448; x=1772967248;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPY2iRD0gGwPpoA/Tg2y3Kis7+P6WX010l6YDZdz674=;
        b=jycM1tzCDXRoB+yUHphrRU4LpssER+pxpOxJFV7k41jLoqAceNJaA72t5jQQmLBMb2
         htyDTdY2eRnyXWfTjQ2bcnbhSCBVHwVQbJ74p+e8xCBEvB5ZiwsEvVhyARdEpkhabg8R
         XFibvgUSy0ZqnI8yMgtVEwFgB69n5re0X9XGhyQP39QDWVyydHMpvgi/1PD81gB5k7+G
         JwwKDP4YWoFuas971gEW3b9bmrqdNiKfeOX8S93Q0nby0SnLLV2V6TYkaHx0Cmb0UzDn
         0njyWzdXRXLDsudjf5ADhybvuMyss6+RdLGLYfJFaalWm3MwgFf7YRVk0G92cQ4AHfN6
         xSRw==
X-Gm-Message-State: AOJu0Yz7D8qAtGLnJlReRxifEP1k5q+WPwF3zsDJxKENvrmMG2dGSLyo
	3u0j82cvMeUdfvQVl8xNMr5hyCUIp1etphT5YkkWEJGpQR0XGJuee/o827Xn5YK3fxFX5GBRkQj
	6Kc7rLv61DFVm6M1syc9liIxQxKAGQx17xfjg
X-Gm-Gg: ATEYQzxrNdKmBCzKK32y9vTDKMd++LEvgNR3DcK1x6TJxeVcw0qFxCDj8ERcDYP7nmn
	G1EkZof0QacZ4YDvcNRTE5Pfe3VSjgyHbAfpXtP5XgGalHaEMBTgYjyUiOT9g6JaaQnjfiM31/F
	rULyP3aedIzqIUEYLO/RyEvDW6X/Uo3snY6jLt9OcQiPGZWpvsNXPdMGYImQoZjad9X2d4i7h20
	WUnKP+Qu2llr2NlFMwywWWygglyc+Jkxji4Avkch3spQyJJJoqYWf0a4X9jqZNv395JlIgtrl59
	GHEqssbw3E/MN/UQVs+Xmkfpii+qeB4XZlgMzcy1YmuBtE5VjmryUWPgnH49aODymWbASqlGbuf
	KdaTe4/X9k73kWK8UALnjOt6ISiUE
X-Received: by 2002:a05:7301:678f:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2be0681950bmr256662eec.6.1772362448009; Sun, 01 Mar 2026
 02:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:53:55 +0100
X-Gm-Features: AaiRm53NpBH_GWa4JVfEPRkfqXMWyFxMe4ArZRCTuJSMHK1_eClW361D-xxWPfI
Message-ID: <CANiq72nFZZZrvFFu7KEgGzBco-QeY=HdrJcaF+DEnByksJ6jNw@mail.gmail.com>
Subject: `tc-build` now has Rust support
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

`tc-build` ("Toolchain build scripts") just merged the ability to
build Rust toolchains:

  https://github.com/ClangBuiltLinux/tc-build

So now you can just do e.g.

    ./build-llvm.py --ref llvmorg-21.1.8 && ./build-rust.py --ref 1.93.1

to easily build a LLVM+Rust toolchain suitable for kernel development.

Or, for the upcoming Rust 1.94.0 release which supports LLVM 22
released a few days ago, you may write:

    ./build-llvm.py --ref llvmorg-22.1.0 && ./build-rust.py --ref origin/beta

For context, `tc-build` scripts aim to simplify the process by
handling configuration of the different build systems, by providing
good defaults and by handling downloads. They also make builds faster
and smaller by avoiding building pieces not needed for kernel
development.

The scripts come with options to customize the process. For instance,
one can build LLVM toolchains with LTO, BOLT and/or PGO optimized for
kernel development in particular. `tc-build` is how the very fast
kernel.org LLVM toolchains are built!

More options or features for the Rust part may be added later on, but
for now the basic support is there. If something doesn't work, please
let us know.

We hope that helps!

Thanks a lot to Nathan for supporting the original PR I sent and
seeing it through.

Cheers,
Miguel
