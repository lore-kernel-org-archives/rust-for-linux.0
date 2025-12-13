Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EF30E856
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670049; cv=none; b=sJ16N60GEqjq49dwcYK9SQ3ShlYua7yzz3PGz4XG1+XjGqy/eRqQXor+iWeVzdn89BI9wOhN8YOWJanhMv6RcNxuQy23YmuPHptrmCU6riuQeq+amZkb7tNEvZpt/J11uWFJOBzBqR6/uGgcaJiWRDTA2SyUKsC3XCkhuPgL3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670049; c=relaxed/simple;
	bh=dMvsk4TMnTyWR5/Ns04LifXAo7hjvc9/eJzEhni+uvA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cl9uTL3F6KLn4ahqWt48EghRKWj8tAiI7u+Oe1mD6W8VVb90QNb24Z+tJ8kiMlcvigtC5LBBSLs5tzqSOvIyqEyDspnlTlDSQaW9oiiXWKxGfPHB+kDEK6ApFYjVsCdUBK9KC/7sKop8RgxejLPLysc/NDTu/ISdJs3T56a//54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJZ0MqAK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJZ0MqAK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1960923b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 15:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765670047; x=1766274847; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYN/3SFl60V2M0Q1BmnbULjYHcf9XcZ8oKvOquVNi9o=;
        b=cJZ0MqAKQOp4n4tWifHNeXmpB0/4DuEWx8DEe/DN6A9O3sf5rxKVulAEoZH4QDh7Nv
         cENKwSukLPjG2bar4uRgWNoiTv2IUbjPX2WfZ0Uyuk1cIJwJQFCBbnh8DCca4+eGRnjC
         Z6YJKuyeAFrLYczYL6dnwE8PU0EpusfRcrFk/F2/dcPw+qFe47cH3Dd500qi9erf7TzS
         OZBy0mTN4eZmS3hzTGZLd1twH/RMgjaiy07IPAbB2bFuGnDb/nWDSc9MWRzFRmvL/Oal
         XqALSjgmHMur8+6SakJu6EV8O4f1UmMYEWLYAw1mZ/cJKK+ZLf2KwYQZCBKAmCvMYcU0
         m0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670047; x=1766274847;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYN/3SFl60V2M0Q1BmnbULjYHcf9XcZ8oKvOquVNi9o=;
        b=LuTkyKk2kJbSuEL9oQ/Z1h/1ZiqiL8cR7Z7NJycI3mcH1tO5FPYnF/5o3H8ct3aM7A
         Usa1c+4YdKyjQdja3RVtn1VYGpQ0lmVqy2qH5FjEgNCmHAxXEJS7557txYFgrFsmgghl
         2afrztUjFzNox2Fizq6V8pNgkCd6xuMqeQ40yqRW8Ga5OZh/6reTLzEspjsrdF+0ubjc
         tWjq6w4GE0p4/y7eNsvSG/BHSQaRc8xIxM8VMNya+pzqnjd1lj02nvYx8+bqZquPMw90
         aD+QzQiQKaH8qsFAl+DnAG7zKli2grmiAxc4e+M6Y7sfIHjP+hbqlaHXwEsFyBtEu10i
         RGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh5FbE2KK02sIMSv9AvDqOK+9YTDgv7k7EmK8PdYVhjeKK06XuLdFbHKXCjFgVNYFzb/PghBTao5UHpdtFlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdCF97Mm+xtoXEAg3+qo72Pt8Ax7JpERZcz9rZ/pnCSLiVBSu
	Dr1VGIkkkvTvNiAh3ruZjfMCvNySVxkMCI5qSbmc3OX3THU3ofgujvY1
X-Gm-Gg: AY/fxX5jIqmQqzXLS/2Yq8zHqlMYvGuZASMGoSTdthX/lpS7rfVfIHqjFMHFNRBq+yx
	ZY3BWBaOtkBH/sT8QajQRwnEqnwsUePPhjF/3eOgY+8Hs06s9zXkWCbqHs0vUkpjM7ow2xV0h2M
	degkKA4huxTg3r3kOSMxW/KCZu7623a5g7ejm8CUA572L5odQ3GAMkDmYZhlxEnbOFGsl4ucWNs
	BYoHGuzGxRTywD88UbAJJCoyXIyuwTlGU1Wrxfez4DIp6X/zgyuQ9G03qd+zTQ3cDRAw4m0l4L7
	RztmHVuxzS8mJ1syJN3XxI/EPfCvZnvZ5zfFRlvbv6ipfwSbckcb9w8y1A2+zFcApT0BPg+2nBD
	YCfhhXr71TDE+v6m9JLz+i2v6nt1oF9i3gHh8qTKeeXdSG8s/G9h9RemQN4uZzH6lT39kogqXo+
	ZiPRoXR9UJ4izCxwQHMVGeljReKwpIC60sHoiq9dnQlSIdidxygidO+vW4Or9c2Z7vsQ==
X-Google-Smtp-Source: AGHT+IGDoWXmCM9OrPKNNZApGm50I1zqnlGU64Afsrvgz02JemgL7gneo2W2ox30974U77jX1cNJlw==
X-Received: by 2002:a05:7022:ea49:b0:119:e56b:98b0 with SMTP id a92af1059eb24-11f34c02b7dmr3531294c88.23.1765670047330;
        Sat, 13 Dec 2025 15:54:07 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4867sm31845185c88.6.2025.12.13.15.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 15:54:07 -0800 (PST)
Message-ID: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Date: Sat, 13 Dec 2025 15:54:05 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello all,


I have the following problem: 
https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635


In short, what is happening is the following:


- The kernel boots and outputs via UART when I build the kernel with the 
following:

make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"


- The kernel doesn't boot and there is no output via UART when I build 
the kernel with the following:

make LLVM=1 ARCH="$arm"


The only difference being: CC="${CC:-gcc}". Is this expected? I think 
this was present in the Linux kernel ever since Rust was enabled for 
ARMv7, and I never encountered it because postmarketOS was originally 
building the first way.


Thanks,

Rudraksha

