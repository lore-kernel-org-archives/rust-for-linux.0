Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5A4322B67
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768536557; cv=none; b=mRHGMLslSntl0MR3s1vqyoW5hUPoKR6YVgJlgxG6rvM8Z49eW+SAbNWX08LyKvs72IseK++l+hl9h4HEg/cGg0gDB+2+KS4BqP6opbYxnfmszc6MzBr0GW8N3fadfEztQKkCooFqXvmPr5e4Ug0GF6WjGxAw8kka0ro2iN7VDEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768536557; c=relaxed/simple;
	bh=vneKnt7E8qQTWjWAN/Jy+FPbdokrGsaN+09MCXRY+Kw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=e9YV4f1vzgtPcrHJnk8nvYXAfawlHqWMzGWIggNUkgo83/kHOR1VzzFUHsIesSJhjXqkDO0SF2EPukJUg0yeggS2xzLyYQ54yDT3t3zy5CPATGoY7a4xJ4rcvc4DontfTZGdRHGrsv4mu1xodF8XxPhOHq75+ux9hUp9LlqhBvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+fQayFh; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+fQayFh"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso992371a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 20:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768536555; x=1769141355; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13TF2YJ4HQpRvMtog/s8sNbTnyNhdRK4CBXOwgSdxcI=;
        b=A+fQayFhX1S6R57PAtHnF2WXyij8aggiddD3MwdhtYVORU1eECFYQ93V9e4bywfCAD
         B5WV9COcWB+SJrnu/S7l7qMSrkkO3BGfLGHipAKUlDimtUXZ+Q2kSDXghqrTI9V00TP3
         iCupdq4bJm5LzFFEqDYymIrPQI9uqTz4rzJRbBIJcBnpdEjX7cinw0CXo6Z//XKmjVvj
         bbYbkB9vBXW7ZCsH4+ORUBWwK+76z41aM03LlfXAXmOJes92pOhfO1VkP97mDse2eQzx
         JFy3XH8h5qS1NQPDuqxGJT5tFPH4yPHwu4aDjxyCgKFYXIGS0v1Y6IXFkHezvd9ay4d5
         pdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768536555; x=1769141355;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13TF2YJ4HQpRvMtog/s8sNbTnyNhdRK4CBXOwgSdxcI=;
        b=AAosi0i2jXfxuYZGJkWyh4lJj6wf/9DOHSp30p9Ggmda0LnL45/337SAFKQQieC/bk
         aKChlg13oRkfSCLIFkuWdh2MU2SkZm3TJks92rPii8IvBWmqSybzx/S4yKbYzMjZF1rf
         nVz/KpWaQZNikM+b1X9kbyx2LyiVOu2BbGvC1WGj5B+CMH0OZsn/PFo4J4NXjkaDAm/b
         U5WsxbBvDZSf5cUnE4qMOxXaU+mYQT0z4IB9By9Mpm/QXqNtkSGRf66n2uQTv/X3ldb3
         sTImuHpS37t8j2m/xyNeTHiq4pdk8hE2rcALdYjUNDZixnA7b3QkZKe/dvgNoxXTHzXB
         4CCw==
X-Gm-Message-State: AOJu0YyRVZ8QkbhnVjrkXOVD5cUKkb17APlMqcSNvXRafeoPoBbUVWFq
	KsVZGvkUxOguGB/euqBYTLLkiIASPW6KBsaFOksyOmu+eid7XIyMzHcD
X-Gm-Gg: AY/fxX7U5sHPBVBGnZN3Duv86Iif6xy0hbufwx6IhhFG4fzVidQoi9HRjkSvlYpmjLI
	r0BDQlmat2xV/eCXAg4i60PfiLH7rZh6QprpjK4bPw3S+uv29ey1q2QrxlFFsirfTXaVZWoVrmP
	MmubdI8ZXD5pBKVO/yugl9ejK1iZhGwoWlS1HHy+lI8tFnGb+cz8kLUUWFbdM3KjyFx1tWwObi0
	93WcspnzKNJg47BF/44qUcOGy7M3wVLLNzT/l88b3lm4AwXqSirploTR1SDST//AARsSkY+Y9jx
	HidAQiprNEJS8XOHl0qIpI1L6WkMgs6YmaN6JEticgJBvRysefhudSrrMQxkP0kUPVuXd51ZZ3K
	n2hf98dz+5NI7BRicrno112SryWBuXqAKP4yXVPqthzjG8fRIzAMcE36NIB7duSP/+VlfExfwW2
	zVdVKchQ==
X-Received: by 2002:a05:6a21:99a2:b0:38d:f648:a82a with SMTP id adf61e73a8af0-38dfe76e793mr2069249637.49.1768536555045;
        Thu, 15 Jan 2026 20:09:15 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf232f19sm754411a12.6.2026.01.15.20.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 20:09:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 13:09:03 +0900
Message-Id: <DFPPVS51UHDS.2JS7UD4HY60I0@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Tamir
 Duberstein" <tamird@gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile quote with
 correct edition
From: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>
In-Reply-To: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>

On Fri Jan 16, 2026 at 1:45 AM KST, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> Our copy of the quote crate uses edition 2018, thus generate the correct
> rust-analyzer configuration for it.
>
> Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>

Best regards,
Jesung

> ---
>  scripts/generate_rust_analyzer.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 6061bd6e2ebd..c6a1f1660c0d 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -98,6 +98,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>          srctree / "rust" / "quote" / "lib.rs",
>          ["alloc", "proc_macro", "proc_macro2"],
>          cfg=3Dcrates_cfgs["quote"],
> +        edition=3D"2018",
>      )
> =20
>      append_crate(
>
> ---
> base-commit: 74e15ac34b098934895fd27655d098971d2b43d9
> change-id: 20260115-rust-analyzer-quote-edition-bf00e950f179
>
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>

