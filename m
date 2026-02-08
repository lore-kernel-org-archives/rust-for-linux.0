Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FA126C03
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770537346; cv=none; b=PCUFuPrc/3/M06Ms835g5PAF9VbPweO3nsWS6FMP7r1Q+3elkS2YMRUtov9Fe4sYwd13sQrynxNmlXUhWMPww0LYod0SRlxn1wjU5l+g0QTLjPXDtarJY++4Q6w//vbUdh1Hf9duDwDGOTlCAxyk8B9gL2TCInArgIyX2XncfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770537346; c=relaxed/simple;
	bh=3a9QhNIrYqhvijosCbQ+6UHxLzZsM2aXEyEwX22+Ibc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2WyqoUz3dXTf9nO++Cl36ycMajB375xhUSZbj1KP3Uqd12QPWB9gVLB+EcMn0JwLLsD1yx2TVSviQgZ1XFfGwuvhU/jaWbkQvyHY6VhIWZuG/xfNFTlGwPPbNZwJvksJowUE9QS+DWQGltG2IY5IQZonfz1Uuq6oC6yycSc/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgMdadyv; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgMdadyv"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so47121625e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 23:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770537344; x=1771142144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CILrPNxeMzqYF9DydhPhafI3xHuSld0NaekSWF+cSMw=;
        b=NgMdadyvVaqNHoacZWQ/uTzOcP46ca0wBL/K/RD1RL1JD/aFvoejZZSgnOfBfXbRzk
         hlQxuynIOKCcx08Yxfklsa8JDtA1BwfaQmdnep4c+t4OUl7zaZOas4kl+stJ8f+z1Cfc
         o6ZTSDPcqT8i/TIVgSJ8yN+ejeWwy6PilJo+XuGRAuM92owyq69RS5ybIAOiPYv1XAvA
         uG2FzT98JBGxUDr04VCg4+NsgWeNay0b+80q/L59ToQf0I+8DYwggW0BjkpOZhoiSJlI
         2CB/cn4A05HFj3MhvilmBJwAs0vA3MREOguh5Pylumkj3WvJoqkb3oCQkDpOLas4GzQj
         tbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770537344; x=1771142144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CILrPNxeMzqYF9DydhPhafI3xHuSld0NaekSWF+cSMw=;
        b=o6+zTMqjGKC3FaBw+m4xjhf9cXmqWZzV5GHTbA/GrT1FtgZtcaQQ+mEM0DbPdcKal/
         8MdMH6fI7G89rOACADPrMK4ABGntenXAcyZvPRPEJdHfOXHOMtypQTGLPFUiEQZkw50N
         E/QdQkuryv1yGcCJON3YsfL0hcUfY32Vh96PEelpXsq2RJy3a8a2Ho5Y62e/8GNb+6WB
         ZTpYClC1+sRahxSSkhkMRRhPIup5ZZO6EFok1YKtTnm4OywKVBTa+cnh12ptI6bpnh84
         Cw0a18iZbt+olGsi5EbnZMGF5x2iJ1mXwgf6hiXqUkU/To5VtKmO3qteXvlqfdlUczlI
         ZruA==
X-Gm-Message-State: AOJu0YwTlpB2ZRS0MA1o1zbjANS1sMULW7AlC0I6hmV7S6j+F/47T+zo
	CQd/2YKGUd9jT8HPBeaAv662pmBX1C0rUBHBa6q1CZitNw9xZQ1SI3zm
X-Gm-Gg: AZuq6aLzibQexM6F+nbN3kCFDcURgtvjwisgZhziQ8UWuMHsowvgzSB6gAObxiiIdc0
	F3LIWj7LG9p9yQVTn5E7xHDnJ6gGQnVxfDoK3G+XsQA2I8R9ITbJU8UcdiXUR+6CKmwkbVWxYRi
	5V9sguX+3NeKeJnHo7BX4elnQddWStfYjPfiGcHwumvKlUVaiO0EyYOeFm+1AGimnncRW73UkKs
	oB5VjlhkNXkFU7Jb4KlMB+j0PwNmAnPPi28ZEppsK2zGkBlnnLrhmsRWqK7rWtLNerF2zdKdPHt
	hnn5q7gGLtmWKMmCoY5gOaPRHCCWfCaxcEKUest/A4HrOEJmUi/AoWxBwfwqRC6lfIIsjV+fRep
	ih+wRb9Vs63Il8o9RTxsnZIzibKcQIfrUkNNPNKHpEEkMmCxcpwbLQ+ODmA8+LWcWuYrhaZej5g
	i4Qa+KfbSIpTQWo1Je5TJ3SfHEEB/d7dBdNIOO51x2ivKEaCrhhCXEWXuNxO++GLtEhfFd5pRSF
	mdc8C25m/O4H6aq4dbG78GDXRMgW8hyLGB0DQmA3+E+FT3skj3myf6h
X-Received: by 2002:a05:600c:444f:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-483201e4d03mr113118775e9.14.1770537343608;
        Sat, 07 Feb 2026 23:55:43 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:f72a:85fc:d143:8f3c? (p200300dfbf2de300f72a85fcd1438f3c.dip0.t-ipconnect.de. [2003:df:bf2d:e300:f72a:85fc:d143:8f3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320983f18sm87092175e9.8.2026.02.07.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 23:55:42 -0800 (PST)
Message-ID: <9ecadaa2-0f6b-411f-9faf-0ecc93b26bc2@gmail.com>
Date: Sun, 8 Feb 2026 08:55:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] scripts: checkpatch: add RUST_UNWRAP lint
To: Jason Hall <jason.kei.hall@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakru@kernel.org>,
 Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
 <20260207224907.234815-1-jason.kei.hall@gmail.com>
 <20260207224907.234815-3-jason.kei.hall@gmail.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260207224907.234815-3-jason.kei.hall@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.26 23:49, Jason Hall wrote:
> Warn against the use of .unwrap() and .expect() unless accompanied by
> a '// PANIC:' comment. This enforces safety standards in the Rust-
> for-Linux project until upstream Clippy lints are integrated.


I wonder if we could add some outcome from the mailing list discussion
to the commit message? E.g. what we consider to be false positives,
the handling of them and what we suppose to be fixed etc.


> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-linux/linux/issues/1191
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
> ---
>  scripts/rust_checkpatch.pl | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/rust_checkpatch.pl b/scripts/rust_checkpatch.pl
> index 56c1bc29d3f2..fa7adaed264c 100644
> --- a/scripts/rust_checkpatch.pl
> +++ b/scripts/rust_checkpatch.pl
> @@ -9,7 +9,21 @@ use warnings;
>  sub process_rust {
>      my ($line, $rawline, $herecurr) = @_;
>  
> -    # Reserve for future Rust-specific lints
> +    # Check for Rust unwrap/expect usage.
> +    # We skip lines that are already comments, assert macros (common in tests),
> +    # or have a '// PANIC:' justification.
> +    if ($line =~ /^\+/) {
> +        if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&


Whats about the `.expect()` topic discussed in

https://lore.kernel.org/rust-for-linux/a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com/T/#m00723ad673727036e5fcf96a35f2f231ec9de31f

https://lore.kernel.org/rust-for-linux/a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com/T/#m5604274a633ef33eb474f95b54f797843d0fe1dd

?

> +            $rawline !~ /\/\/\s*PANIC:/ &&
> +            $line !~ /^\+\s*\/\// &&
> +            $line !~ /^\+\s*assert/) {
> +            return ("RUST_UNWRAP",
> +                    "unwrap() and expect() should generally be avoided in Rust kernel code.\n" .
> +                   "If the use is intended, please justify it with a '// PANIC:' comment.\n" .
> +                    "See: https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust\n" .
> +                    $herecurr);
> +        }
> +    }
>      return ();
>  }

Just for the logs:

Running this on e.g.

https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-v3-3-8ff388563427@cock.li/

gives


$ ./scripts/checkpatch.pl
0001-rust-alloc-add-KUnit-tests-for-Vec-shrink-operations.patch
WARNING: unwrap() and expect() should generally be avoided in Rust
kernel code.
If the use is intended, please justify it with a '// PANIC:' comment.
See:
https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
#52: FILE: rust/kernel/alloc/kvec.rs:1524:
+        let mut v: VVec<u32> = VVec::with_capacity(initial_capacity,
GFP_KERNEL).unwrap();

...

total: 0 errors, 21 warnings, 189 lines checked

(note: all 21 warnings are from `unwrap()`)

I'm not sure if it makes me happy to ignore these 21 warnings as false
positives ;)

Best regards

Dirk
