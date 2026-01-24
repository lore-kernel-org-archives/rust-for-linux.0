Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF31259CBD
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 05:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769230810; cv=none; b=fpih7HAAsvHpZ8Y/lxRmtcXN5H86r+2EFO5fxVNUQdxytnjeyCx3GvwNnj9I182T1Qj6A6xFlza6d1SqS4a8WRHvMeP7OJnyo44uT8OpGoa5huE9ZyKOKN6m6Bl7Ro+i6l1omSJBVn9HuT0iANjEsre7s6QNvSWC6KEMIi1rUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769230810; c=relaxed/simple;
	bh=JAYk98kNhc2Awngl+QSq4p+BT0oGKfb8R1JBOMRKjig=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=sh2hdWDyi9SpkdEATEt5foy/86EiAhJlCZQNYtCsCUw64FQDXX9SZelJkmjtRjcbkfmyJ8SjfXh3DkybNPWMBCOnUlvKMgSko0SK+SHNqtVmgagyJxQKmDZRSt6Ejp8N3H0U30Fm8BD8URWGsdBVeP7bAmqif6PIhzp4dEC+kok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTehVCLm; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTehVCLm"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so3064878b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 21:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769230809; x=1769835609; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0oMptKZnPoc3jSB5+lH8abtIhg7pHGO46z434wdV4I=;
        b=NTehVCLmTzveW2BDpaIwlj13YUGg/b1IEtQn2XiqyiiMvds5Isny/9c6oJL/dSyBLi
         0UQ0sr0zxAWSo8MonzgDFrWMLe3MJ4raPDhDpQD9zNjqgZ3L4D1f3ik1y9tD7pEQcQkn
         CNaolnb33YVnsWHFmWe3FAL5sVRMoWt+9BC1Gs2DNraFpQcSPlYRTRPmDZaamS0jBL2r
         vnxlUJDTn+8Q48urgtBZj74/q11wNeNO7mu9AxPJFUlQ1hcyYWrGVe+yrMaBe/0sWKMY
         DWpk0Vw5ofxbv5CMTi34sFCn7Nr1FCTsadqL/Te6olef5an1VGJh84QWrncnZILBTYvl
         SRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769230809; x=1769835609;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0oMptKZnPoc3jSB5+lH8abtIhg7pHGO46z434wdV4I=;
        b=khl1WJXXQNDpY5AMuNG1D25rwdppLPSMZXQln60CLni7tty4MAcJW2iodAGdJhy7Vl
         CIM/AjX93bMUwR2uQfm8o8eyWgt11WV/lHOWj3jUnvVXHaPBrGsjdt6HMdWmp1PtY2I+
         Do6DtByxkuHLN/3ekUpi7iYzVkjMa71WjXtNAj8C18o0YSX09w4JSS17/3uyGrVKJWy0
         o6+7l5v/7hn/FXVh+Tz7c7ZOApT9/KD3W8TexChYPkgOPO0otFBc8Zk8OPQJrIB5MaA3
         pHfQYWpc3xCdmnE52fyUucSYBRXYjh3++yRRXVadGYj+z3bdxJfYwfOJ36uf2TUH2qM9
         Lc/g==
X-Forwarded-Encrypted: i=1; AJvYcCXCJtRIAqA1u846Wi+yEEnDga3zuch6daUVyeiskJXlJ5AGtxyAeKXP8LuE7cy3XvK/qEj7KpCesAy3LwA/tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpMZ/pisMxyo5FT27z3jnCuLvi2oo9xcrUhIWSEqBLUd03Q++
	31gcZ3n3B27hUxDgfBavCjFjusDh2YWwjIPETeQ8NBSBrR6S3nV7gcMH
X-Gm-Gg: AZuq6aLE/7juMrU75PsE7LXbwYAOJytDo20mEhuV5ERBREzrBgcbdHgu3u5S3l8QkoQ
	/FEUpMXxRA0D6WhKCdx3oLfzPVXMZObY7XK3Yxm5wzhYyKU0tgCjL8Sl9y985Yu62Cz9eWVm/vP
	7nG7xh6qv3myYcdfpJhTLBvA6+p6q4b73Vw80IvrIceFBR2slV9ttdmZZ3fB8vYwpMVOVZG/45p
	suan6oBqz0ioAfctT9boRNl+1L+tt3szx7j2yBWwyilmV3aOsNcu0TP7MInBTySZ0R4x5q2y4az
	2//Fq4R5sgD8559RlvXVLTvAxRs8MfIcsXbdphRwtb7ESx4l84VHWeEp+ZMrqD/kJDv/irnUhlr
	PBN/ylpIxbOiyRATYfG1R9pxEsxvLL+KGRKao7+uRGWO4u8acLpOahyrwD953TGjMkjCpisKNrF
	B6qLnL2w==
X-Received: by 2002:a05:6a00:148a:b0:81f:b3ce:17a3 with SMTP id d2e1a72fcca58-82317ecd3e0mr4584439b3a.48.1769230808558;
        Fri, 23 Jan 2026 21:00:08 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318770179sm3481986b3a.67.2026.01.23.21.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 21:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 14:00:04 +0900
Message-Id: <DFWJZ6YFON1W.2Z2MYYEPLP2WN@gmail.com>
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: =?utf-8?q?=ED=95=98=EC=8A=B9=EC=A2=85?= <engineer.jjhama@gmail.com>,
 "Jesung Yang" <y.j3ms.n@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Tamir Duberstein" <tamird@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
X-Mailer: aerc 0.21.0
References: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com> <DFWEIHKOKVQS.1MGF5PHL2JFVT@gmail.com> <CAGAB6667fm45e9ZNg3FCAw-O_jV3cnK-gGfG=xe2ftPEQHxxgQ@mail.gmail.com>
In-Reply-To: <CAGAB6667fm45e9ZNg3FCAw-O_jV3cnK-gGfG=xe2ftPEQHxxgQ@mail.gmail.com>

On Sat Jan 24, 2026 at 11:14 AM KST, =ED=95=98=EC=8A=B9=EC=A2=85 wrote:
> 2026=EB=85=84 1=EC=9B=94 24=EC=9D=BC (=ED=86=A0) AM 9:43, Jesung Yang <y.=
j3ms.n@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
[...]
>> Perhaps I'm missing something, but I wasn't able to reproduce this
>> problem (which I think is expected as the `kernel` crate already depends
>> on `pin_init`) with the following setup:
>>
>> Tree: linux-next (next-20260122) [1]
>>       (includes latest changes from `rust-fixes` and `pin-init-next`)
>> Files: samples/rust/rust_*.rs, specifically rust_configfs.rs
>> rust-analyzer: 2024-04-29 (which corresponds to our MSRV), 2026-01-12
>>
>> Could you share your environment details and a minimal reproducible
>> example?
>
> Sure! Here are the details of my environment:
> Tree: rust-fixes (commit a44bfed) [2]
> rust-analyzer: The latest stable release (managed by the Zed IDE
> default channel).
>
> verified the issue with the following modules:
> - samples/rust/rust_configfs.rs
> - drivers/block/rnull/rnull.rs
>
> My reproduction steps were:
> 1. Without the patch: Hovering over structs annotated with #[pin_data]
> (e.g., RustConfigfs, NullBlkModule) provided no information/diagnostics.
> 2. "Go to Definition" on those symbols also failed to locate the definiti=
on.
> 3. After applying this patch and restarting the LSP server, both
> actions succeeded.

I've discovered that rust-analyzer fails to resolve
`#[pin_data]`-annotated structs if (and only if) we compile our
proc-macros, which essentially feeds `*.so` files to rust-analyzer. If
we don't compile anything, it resolves those structs correctly (despite
some diagnostic errors, if enabled).

This issue appears to be related to rust-analyzer's proc-macro expansion
logic, but anyway, this simple patch restores the IDE functionality. So,

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>

Thanks!

Best regards,
Jesung
