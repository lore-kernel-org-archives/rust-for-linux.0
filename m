Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF611712
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KGZsYwu1"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4b73593f37dso2256933e0c.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 00:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705395458; x=1706000258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/5+wFbKzs5eno9rduI40iFUzUBQ1swEm4/6pnECnjw=;
        b=KGZsYwu1INGfWZK8B3zHpr4ksn5Wdmbl4wjMc2dr12Br66mhSk+oih96jRnKRI3/Xb
         7dWmIEmNmHqfGoD2EumMaBrIhIcenzoYA1xB3ZE/kyoVM4r0E+UXWL9Ycv+DG7Degqj+
         DtO40xjT0EtQvUXZ7RcqBjINEKSLPBKLXHMjyxFirnTnlx+Jzjd/5ArFENjOgdA0vLwr
         uctKdsN45P2lYea/1TL52VIA9LBu+XMIca8ygQNMoldl6Zhd552d0XHxFwMGgTjZjcMj
         dPHc5KZhpnHA4YOyBJqK3p9eFrqxY8ESb5uf7pVZQMdmfL+gSh9GV/0U+vIFggGAp4PS
         t3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395458; x=1706000258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/5+wFbKzs5eno9rduI40iFUzUBQ1swEm4/6pnECnjw=;
        b=ILPnGPmJR3Jb/T3IjVrDb/JZzmMnM/Kky1izn7gtl4M2WUHLpQoTfRdzkvRqNXF4hD
         8g4XwjYnvYdv3CjhJRqPSOJ9lnOHkpD+zTjM6RIQD0L7ezeYLjRknwGmq/4krGnpwds3
         cyx7UAVerTk+2CY1MSJWLVeL4iulwLdtlqY3dpBWxhm5uASfi+V0cxFJJvUA4eqUOkcs
         tZL6FJAmzVavF5x+JFjffTVC5PBCjlcGEjtEpyG08niJakDo63+KE1pSkjjQyNsQnH2+
         YGFqg4QD98FNwUh0fX/2MsVTCtnv7U0S21x4Cy/aCkP2+Nn+AqRU65p63GPvCsbQ3olo
         i+yA==
X-Gm-Message-State: AOJu0YwK8MqlqEdo6QkAg63TKCnSjohx9dHKfaU3FsP5oRCXr1cckvSx
	SxSdl4gypNDPmXwM2BVqtXHLXMxcm7vXuzLJgI2+uk+JTV7Q
X-Google-Smtp-Source: AGHT+IE+qyEJORTT+fA/8WOK+HStAr7BRZoXMnG6iiQRTF9beAlrrwSRz98T0KrfJvI9rRh0VtMI5QQJE0g5RS7Krns=
X-Received: by 2002:a05:6122:444a:b0:4b9:197a:f82d with SMTP id
 cy10-20020a056122444a00b004b9197af82dmr1471985vkb.17.1705395458258; Tue, 16
 Jan 2024 00:57:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116022823.64058-1-antoniohickey99@gmail.com> <20240116022823.64058-2-antoniohickey99@gmail.com>
In-Reply-To: <20240116022823.64058-2-antoniohickey99@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Jan 2024 09:57:27 +0100
Message-ID: <CAH5fLgg65cOXNrKbU_B0bhsJvWw_ox+u6G9-z+c3iNjzeVWoSg@mail.gmail.com>
Subject: Re: [PATCH] rust: task: use safe `current!` macro
To: Antonio Hickey <antoniohickey99@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 3:29=E2=80=AFAM Antonio Hickey
<antoniohickey99@gmail.com> wrote:
>
> Refactor the `Task::pid_in_current_ns()` to use the safe abstraction
> `current!()` instead of the unsafe `bindings::get_current()` binding.
>
> Signed-off-by: Antonio Hickey <antoniohickey99@gmail.com>

It looks like this patch is based on my patchset with file bindings
[1]. Please make it clear what you are basing your patch on when it is
based on top of another pending patchset.

There will be another version of [1] before it can go upstream, and
the next version will not need this fix.

Alice

[1]: https://lore.kernel.org/all/20231206-alice-file-v2-5-af617c0d9d94@goog=
le.com/
