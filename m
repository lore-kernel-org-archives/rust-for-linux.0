Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8C12DFF04
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Dec 2025 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765064506; cv=none; b=mSUBUEPInfsu7FX1/25EBiYiPVvpvwkTFBKqHDmFTnmjLW4UHptVi1Ro6duDUy/3C3ULDa5fKXF58UD/peuezlt5tqaImM2+yTmiUwUlcmC/uheDIDikEyt3thUIJo08Q2SN6gkdBzRGywnPfTPLMqu3NizDIONcK+sp40x9p/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765064506; c=relaxed/simple;
	bh=2Q/7XbQJvjrLnrR/4wKTgacaB87PLU8rSVQMMxnKDKE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uDS6iPAnyQBFvungXzHNeEovdb8kdT6lqhcG4kQ+/LaYaomMP+A+YlEWcVaiebkFvJ4SHCBwHc2G0yIq8fneT6pr/sv9YqxtKXu4Og0DOJREvPFzWAhJqqsdYaxP1x61Gz7LXhlI+bBaZJLm+Atpq0eUWNZBPOsCu+3CEq79K/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePbt8rTl; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePbt8rTl"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-787da30c50fso33348817b3.3
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Dec 2025 15:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765064499; x=1765669299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=ePbt8rTlE1/eJnR3sxlgLCX439LMvWsXdYqDxSA+rAA+wjcio2o5qdAW69NWoHSF/q
         uT0cDQ7XpImbiond7HESH8CUO09+l1Tf+VyzTxeMUFInb5tGKBFEXPvqtG1J6HQ2+g6+
         S2Bfv2iqXLc46Q7PxygPijpCgWZdQfec01YtKZx9LFgOFogj9G123xUhtSp3KdMTrrT3
         qyGY5FH+b+lmQqhb73ZXslptbAtXGH0bzSEqifHeJThhpyXi2JBdZO7JeOMUe7HQMdhr
         I29RZjK9nRLC6wZqwqLNn0U6DaIqKLoLA06pBWGrMXXy5XihSHqBBlOVKos41TZSC++W
         Q5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064499; x=1765669299;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=N+/COTP9wovVEZ5zdVLlvfgKROkp7GkwmapH/lvv5CWSQieEaOrcOrbmPs/KDiojRN
         28PLeNNyHcWgXzPvVdC8euRBGo/gM7RJo+1nXabVw7Z8Wt4O+AYVpnDTL4dPaH6noN77
         QWtsvrNKn/SJ4f3mYHeqkqX2tn7KWQwj0XYEdXZVpc/t31g8/bbqTRX/RE0gt0X/wYIH
         yQgaNsK8BnVJxsgqAWRQfOrohIBO8cKwrj6QUnlUYOM6YcPfFlFcCX8Tn/f4YF50GUyA
         C/7XeLO0em7HeYuaYsoYXUY0OhK/COycPqJA0orxY3MnAb8NjG082Ktes6usUY3sHYPi
         C15A==
X-Forwarded-Encrypted: i=1; AJvYcCXsv2dnB+iBm/Ta8chg8uSErh571G3Aqpx+gvG/1RSqok15gQlJDSogj3+2IV49wYLhjdtciItBYSlUuXQ47Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0KNUw+yZ85hyvhJk27bs9YZX599IlSmWQZ3J7oMQBdI5hHUU
	BiFjGf7J54gcNpHEO/0ZHe5ccHCFjSqry0jM5F6rKNMnPUW2lAoLaqQr
X-Gm-Gg: ASbGncu5mvFZJp0dIrWNdNfdLJVP/7SkpuVPy/JOAwLtRCCP+MI51zAH87nVmgGZ3GM
	j3MBmDiRYGoJXROMrLbSxoCp/oA7HKaXklQ6o76hTDfqH5mukq3mWMKCEIZF/Dgnq6FOa2uCENM
	YobmKMhTPAttA9nuySw5fpIwvpEYf9HDAW5a4znTFsoHUly+T6hMqACQwWLgAB318NDHwOQlRhQ
	GwnvNJbGmb1Nv5bwPqlpFNIGvm2jBxwNPvR0W/Zsx/b0borB3NSwUupVHMkHS34kDrXPdbNgPEn
	8kIU/XWlVUHQBGXvz8UXF0+yu/cxCC0w/j8KzaXNDyKU9Oyp1NhIVMoMtC/jaM3QnMy76WYUvAl
	7Z3D4akQemv7iASCkW+l4QuLAS0fU2gnCBw+N39J+VKY1wvB5cqaulWOZH5maoV1V4rZjyHXKuk
	7uS98QBlXJcu/FLec1693LUA3lLL4cfoQruJFS8CtF5qlZ
X-Google-Smtp-Source: AGHT+IF0mKyXnKTQB1xhzD6LpgpTfgywW7IIal9fCo1GqYHTHD2NnE85yzsXQBQPCshexFlzlGdhdg==
X-Received: by 2002:a05:690c:7404:b0:788:e74:b267 with SMTP id 00721157ae682-78c33cb321bmr61970637b3.65.1765064498716;
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b7a72dcsm31972167b3.52.2025.12.06.15.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9ef24254-2761-4a0f-9c4f-342293383800@gmail.com>
Date: Sun, 7 Dec 2025 07:41:30 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
 <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The -x argument should explicitly tell (lib)clang what language the file
> is without needing an extension. I don't know why it's not working for
> you...

Didn't realize that I should pass a `-x` to the backend. It works now, 
I'll include it in the next revision. Thanks.
