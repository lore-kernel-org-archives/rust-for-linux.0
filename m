Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC433FE0E
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851619; cv=none; b=tdacNPMIC+47K+UdIXci2MZhjIc29oGlupFN09p62Y9eFQYQRwOU1iAwkK6r3DyU/NchX5cpjsUwlq12G4eyuouEQtQkDAWY+kpOomJGrhSFM+7oHS3vFadkv3EuWnQyfZmxRh/Ze6bDgc5lw6c0ThApBQPDq62CXH7qz39+zXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851619; c=relaxed/simple;
	bh=WfZZkVUD2KIfkMnmL+8RiPfvk8m+CchCTc2u15cbG9Y=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U4kek9eSj+kDuVKMlc5PjAZBxl4EPXuQXBlND4uUj5NcVlUW9jhylpZs+NRAAS3U68ZzBo6kTwKEPLgToUHEgypBdRqaDAagoN4C+CgtlZo7f4vSreR0LjV/omBMKa3F7V7MS0iUdzxd9jQkV6/Ep8a33+uO1dShPlJRM8VIk0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k58/Q0JB; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k58/Q0JB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78a835353e4so9273767b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764851611; x=1765456411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=k58/Q0JBEYWe+KJhx8snKI6/qcTbvf4HvI43lpn5+5z7rPY2sSgNWBTTxvhoW3uOFc
         goN9S1ef1YmXTOI4SLoXzIl+BcLzIJf8n9+/5ciIHUMtxEV/jWJAqgW9lB7G2u8BCbtp
         KMu+WUoL/5Zu3GNg0zklmqXCmKOsYxIzgaO8brrJO1ZX2eUTkFUp/pW0bUbEy5lcE9X8
         UcjDkgsbBUH7K9qnSANT5UWHDdYeUojS4SNmoNv2hb7Oyhg9n+j9qzOtvQjRTuNCrsUK
         fwmtu+D1kRj8ZTdy4XSRDi+teDA3e42c6+Cwjiakqb0ns9dF/D2bFrB7yHL6hPwEVcZ2
         inng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851611; x=1765456411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=kpG9BYwSO/tbM5F84npxt5HUW2jUw6NgIE8hvKaLYyzEmPaMNwCGY818Aiwqnz5JqD
         /EFuk3a9vqOGsMIIB5N94p34ghyWzttxPHxu6eCvfIAiPn4rpDlGK2ErUnb8qCCtg+t5
         9l6O+QE3iocYgIvgkbgZQEI86W4ygR3ugdewYVlI/8kjK0Y8sdWuoiG989wQuThNFRsF
         VjrVFbpxTjcJ+GVljhpEcKEoSoXNiPrIvdjBJq308ZBTdSha1l3EeVPx3x8SteWcwOkD
         e/0KzTbaCnxGDSicbq985Sht8yEwqKo6PcoFhES9res3MiuT3beY/twGQlRnUafuJJka
         niyA==
X-Forwarded-Encrypted: i=1; AJvYcCW2nqTxRAyXiCPuzsBhiZW7n6BCqvc1CCzrf3SfgaIb6K33dVwYBUpUQ//b21fxZWgRH9bg7K0BQIvLcMRnRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCX07Balb6lS8CF57GewJhJFJIypCDsTdvGEpM4PGJtvWQ4h0m
	Ps+JH4dCajVx/0ZxGkCfUwqfEvVhiigjzkJbp9qsksYIs18k60xQEMQq
X-Gm-Gg: ASbGncvESpSJv/RRe62Y5QTF9l69HzByJKoWlGhJA6veWFXNqQWm3o+6fBvUffaOsan
	qtS3h72ESKtAEwYhZj34hlDbNd9FSLjmAfKNAw4yUItL67als+WbBdL2imceaJcqKqDSuaxb+NM
	nZNUXdX7Sh4JvkvQ/K8wD3kRnSeafRrsvmxtcurhtT1afJSRrzVV5fBtERYkDIl4KhDGUhM+Cxr
	yOzYfedyfgaf7WuQ7MzupMUqBXvGX0DshbzOBA1Nc8/H1NRZwIvHCBlOgkmMYclBI82YWUqwp2Q
	2w2wEqc7Er2aZryk0X/cMOa9oe6U9oj+vdNrlEFek85isUcVvbZHJ1d0536HwCsHraWfBE61wVF
	pz5QL8x8u5r1RAndI1nawnBEW8CuSGdDRxZ3cmfK1Xa9DtsiCo8XPAfDAYwStgXOL50Bh8YdMeY
	NiAm0JU2lgVw7PaNPjPl2ya+1jwcurN6Q8wZ0QnrGJNc5fj77vx9o=
X-Google-Smtp-Source: AGHT+IHBUEbYkxJaVsA/zBTgJe8/H/sEcBnHGISwxVU3+cajLhUyQv9YXSpqaHkdOjyO4eiZ0/Xsyg==
X-Received: by 2002:a05:690c:6c0c:b0:78a:6dc9:8801 with SMTP id 00721157ae682-78c0c285f98mr45923627b3.51.1764851611217;
        Thu, 04 Dec 2025 04:33:31 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4d22bbsm4914897b3.21.2025.12.04.04.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:33:30 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Date: Thu, 4 Dec 2025 20:33:22 +0800
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
Content-Language: en-US
In-Reply-To: <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 5:06 PM, Vivian Wang wrote:

>> +
>> +# $(bindgen-backend-option,<flag>)
>> +# Return y if bindgen backend supports <flag>, n otherwise
>> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
>> +bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))
>>
> Can probably be simplified down to:
> 
> $(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1)
> 

bindgen is sensitive to file extensions. If the file is not .h or .hpp, 
it complains:

panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch
