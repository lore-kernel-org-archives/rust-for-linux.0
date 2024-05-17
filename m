Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7010915CB
	for <rust-for-linux@vger.kernel.org>; Fri, 17 May 2024 19:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715975139; cv=none; b=NvVKKjO4N4XNJqLaGHnz64ITkzj4QTZkJh+l91znUulP6EPXKS4u64gp9PfB9MUS3R7ZYtq0lBXaZUBugWPYZ7a/4k2G0V532oi4n6GwczFLkGFMcV0+1OjVVasXwN2hy+sDPwQjjddYkh2X1/jTU38ZN1oejp4DQTfwNWVWLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715975139; c=relaxed/simple;
	bh=tKkxPlPVp0hlLbgDgTy6Kj6E7bMYrxkTZm4WP17U3Xs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EZ4/ce9NizOnmnPyXiWiUHaLAz5Lvpd/YMTsU/LGYuHfPeE+mqqMwVJWePwDICerx7qnxsdftgb3gd8ksNITtkhyKSnxAyxI3hnihHVGwlk0ObJ8mE+1yyOO9Tm/vekRTO3Bh20WGkXVFLMvZBzfK+W/1F8J5W1OxT3FNrREtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2Eo5Pad; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2Eo5Pad"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee954e0aa6so20358855ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 May 2024 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715975138; x=1716579938; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ugtT9elyYuH4ETWAAjgBDs+peSqVuR5AzwOYI1c4Jyo=;
        b=k2Eo5PadC/xIhrcZuAsCikv6Dx/Q550SZhLTYD3HYGU20SMB1ghspQTGPi3XsjqpoV
         F8YZfV04lIxZeLCeLDUA9UBl5rHwk7TSu9e8UhzDsXwyM382rQvlqfUYvsLv7juUcxkX
         J2PZ+pJWO/AraQ03fKZF25+dn65LG/Hd2Mtud/hRBjLWutzyvOhz2DT5f7MXkMp0x1IA
         Oghxou/hA9XoV65E6V/cA+g++D1h2ZMIKjKd2/viUOmkGyaWarlaWJVdl4QQXBZduDXc
         Bn+pJfU4AJTfPHLQdH65ok58su6JN4LRNmuiOLgyUEyw71+TYtE046WHMDoji+jqK7qd
         PU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715975138; x=1716579938;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugtT9elyYuH4ETWAAjgBDs+peSqVuR5AzwOYI1c4Jyo=;
        b=dR+f4zwMDJgGtNpqCV9YXb22oqh2cqzqlXYa+xleO7rhIQaC8I4pLLovmHEusmlC91
         SZIlQUEoZygNzKKmCKKKOq6p8gSkVGpxA/ozh5MVqprcMoj9zrFK4wqKdqNIL07mtlzc
         oGqxH0us3r+iXq6uG2WeolbcOfcgJAZRgiL2ZOa1NV3ukvPbf9NoQ07g70NpPegqJ4rh
         +CDrntkYAKzAi5jNeRyXypuIObMBOuc+XgNn9Zll5fGGTBlQi1kxdB7t6OcNxrf3dE/D
         xeD2O4RIrIzMaGqX/jz6RUEkf/d3ZMnJt6zRlDWvxNQx2UgzaLZs3zYgzWQosMIwnR6B
         GBSg==
X-Gm-Message-State: AOJu0YwpVPfjOCpa8lBz1p2nioFnqeGEOkfWs14fw8tB9q/RQwpJUQ6M
	pSEDMJ5Kk4vuToXeoMULkSdzeKkp/35EmJEgnvDgurnLmkgZfaQLBp+qXN2sAp4pN22WoEQqhvY
	26ciz7wNcfBaKj7SkZYGYjaHgjvYuEc/TY58=
X-Google-Smtp-Source: AGHT+IF/nISwgczr/TjZQRQcaddqiEs/gorW2LO/mbV0tG3ddtXudy7Cxh8MRTHWd0mznw8Sqntne5Tfpv4c2vDxMZo=
X-Received: by 2002:a17:90b:3715:b0:2b3:9ce8:1239 with SMTP id
 98e67ed59e1d1-2b6cc1438dbmr20528937a91.6.1715975137661; Fri, 17 May 2024
 12:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 May 2024 21:45:25 +0200
Message-ID: <CANiq72mYRkmRffFjNLWd4_Bws5nEyTYvm3xroT-hoDiWMqUOTA@mail.gmail.com>
Subject: kernel.org LLVM + Rust toolchains
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

kernel.org is now hosting prebuilt stable versions of LLVM+Rust
toolchains, thanks to Nathan Chancellor (ClangBuiltLinux):

    https://kernel.org/pub/tools/llvm/rust/

These are the same slim and fast LLVM toolchains provided there in the
parent folder [1] with versions of Rust added to them that Rust for
Linux supports, depending on the Linux version. Two sets are provided
for each supported kernel release: the "latest LLVM" and "matching
LLVM" (please see the link for more information).

They are also now linked in the Rust for Linux webpage [2] (left side,
in "Links" -> "Toolchains"), as well as in the kernel documentation
Quick Start guide [3] soon (patch [4]).

Cheers,
Miguel

[1] https://kernel.org/pub/tools/llvm/
[2] https://rust-for-linux.com
[3] https://docs.kernel.org/rust/quick-start.html
[4] https://lore.kernel.org/rust-for-linux/20240517170615.377786-1-ojeda@kernel.org/
