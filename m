Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9E137E;
	Mon, 20 Jan 2025 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737332863; cv=none; b=nGfaK0RP+cNEDDxxeZxIEHBGu+GncpVA0mfo+bO49Fciy3nBfdwRJULR1iz1sH+h4i9Awae2ZvVT5WK1mf+F/zWFd/+Ktx+Y41aCKnR300L/0iM9vdUwsCVJiTEqNul+5hQp/IXLsMStYOnB60gay3+hUET7hefBim1AzW/9sJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737332863; c=relaxed/simple;
	bh=qgl4ns+YGR7JxzTn9nZ0g3vaZFKHlgS3Kk8wXQIIQaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKqAGadSct3m0aI1O7B22uyaeLEEtRoRyIVe1B9/aRc5lS4DExaH2a9cCgEUqnBmDtCK3YsNKfzheH5PmmFCcr7yFRp9PKsVkTjioY78+/LYzrLTWvuGySuhB9ul8mRgB/lGNdy+dZYHUJVEbxOWx0OFTyhzf1vAiZ+VRDiDglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3Za7oPZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3Za7oPZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso699948566b.2;
        Sun, 19 Jan 2025 16:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737332860; x=1737937660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8S/5JbK0dxmnZQYhmaT8rH1xoWeOgcn9QnuPPTE30o=;
        b=K3Za7oPZFIc20jAAlmk6CnC6FqhslW6XHdijWFjx+ZGy5cP1JqNeGxP3mP47ur9a7x
         kBu5YO+M9D4N+ybJjBbgX1+NGhksTQGdpY7Oh2SGQEfwZ69AfhrWZQxrwzjrC1HURsf5
         qycYiiBUHdm0+f5RHqp8BEM5I/VrF68FPfqvSitIX3lvg/aA/xKGsbhsgGIi20I/dJfs
         vh0o8xnm5ijqI9JdY8iz5gZmZGFudbElyx7EFvlGWYyEjyBm9Bp0TD00MwF+qobToTIC
         kbWvwZOnYqwLey5yIKqcGDD1Lvq4fJeWuQo2z6EdAvrr9WBmEZSCoN/sVqQH4gWBvD+Q
         Z6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737332860; x=1737937660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8S/5JbK0dxmnZQYhmaT8rH1xoWeOgcn9QnuPPTE30o=;
        b=XgOPHsVCrIjn+1r4B7Ir7KxKsOMLr0e4hqJ9EJY9fTtAqCXegIlggruEB2QY+ykFkF
         zsXyfn0xhsPMWXl1XtIQTEQG+xQzyuFFT2DHRSkiD2hZpOzmTKaTEO/z7J4ld3cY69CW
         8OrrSZ04SliJp4I4FBQE5ZFIWWq2MhVUlNKPC0glZZ38qjQl0nrvHrf4Vs+7pXTHhCUQ
         dnWMvDcDtEwxfdV6mngbFumF0t093aT0ZJohHJ2I6uWGrMf4E6bAIW2PRkNe7nvoEqYv
         E/96RVLGQKDMXyh7PFfRddaSZkdxD2B3fJXEkxEDlmeNGy4+87JTVMaS90EGk98amjp+
         UgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoplzuwRdvyuly3hA/dYqIJKjn+BWv6xFRZRoBUezkxENyiV48zKfyMJlXC5y9XX5Q82rfSIYrXvWZqW1EsxM=@vger.kernel.org, AJvYcCXKemTXGyjNYFrP/qdas149kixxDGwCcO2xQb93YNA6Fxg8I3YJhLlrNoryMimCErrSsidw5yNRmr4yok8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpX71jPNxQL844+LCX6sl6LgktWxmVnjDn1VSmAfF2N6Ht3mDR
	fW9l85HNL7pUEwMLgYc0//VChV1aB55KRiqFJNIwWk0XIryJ9b3JB7KdXDpj
X-Gm-Gg: ASbGnct0GeAqChfYuyjcZVGIvXbGH9Pr95qxgQ9D96ZvLygyb8/rV3xRN5uHsHRlDng
	JjKESFKgPViaVnBzSiI2Tf+DJ8lozsAAz3jK/nYDUDJubQgXG5g5sZcRaAEXJHJN5N+gBa/Llvn
	TMnCpiIMoN2IotQRU70CdOOZPENsN7tOBoGZ8mqhr3x3aIYgSGLJNZeMGnkGp4+eRAmf0G25O68
	VdQTUzunL9pmVhTDSOnYPqKWa1+iU6cKuNVwYM/pnQYQdWY8lP78K0DxFi6hOLIrgnh+TS9T4kE
	D12+EPw=
X-Google-Smtp-Source: AGHT+IFdTfKzh5GBJU0ctgXNoSl3xbTwNO+8HKcfrD9gtO/3Ddrs9hedR4dUa/c7fE4mfMZM5SmBiw==
X-Received: by 2002:a17:907:1b15:b0:aae:b259:ef5e with SMTP id a640c23a62f3a-ab38aedb10amr1180276766b.0.1737332859967;
        Sun, 19 Jan 2025 16:27:39 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c6077dsm551702966b.6.2025.01.19.16.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 16:27:39 -0800 (PST)
Message-ID: <29fcdb16-5931-4189-91c4-57d947cdd5c1@gmail.com>
Date: Mon, 20 Jan 2025 01:27:37 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: add Aliased type
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <CANiq72mqhTA+LQ5d6Sd-E24qc1_k46UZ6sbgGZRj07GZ9TR5Bg@mail.gmail.com>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mqhTA+LQ5d6Sd-E24qc1_k46UZ6sbgGZRj07GZ9TR5Bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.01.25 12:04 AM, Miguel Ojeda wrote:
> Hi Christian,
> 
> Thanks for the series! A few quick comments on the documentation...
> 
> On Sun, Jan 19, 2025 at 11:11 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> This type is useful for cases where a value might be shared with C code
>> but not interpreted by it.
>> In partiquarly this is added to for data that is shared between a Driver
>> and a MiscDevice implementation.
> 
> Typo: partiquarly

Fixed the typos and missing newlines `--codespell` did not catch them.

> Also, normally you would leave an empty line between paragraphs, if
> that is what you intended.
> 
>> Similar to Opaque but guarantees that the value is initialized and the
>> inner value is dropped when Aliased is dropped.
>>
>> This was origianally proposed for the IRQ abstractions [0], but also
> 
> Typo: origianally
> 
> I usually recommend using `checkpatch.pl` with `--codespell` (it may
> have caught these).
>> +/// Stores a value that may be aliased.
>> +///
>> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
> 
> Would an intra-doc link be possible? Please use then wherever reasonable.

Fixed

> 
>> +/// Call the Drop implementation of T when dropped.
> 
> "Call" -> "call"?
> 
> Also, please format `Drop` and `T` and add the intra-doc link for the former.
> 
> Could we have an example or two for the type? More generally, you have
> some nice comments in the commit message, so it is best to put some of
> that in the actual documentation, which is what most people will read,
> so that they don't need to search for the commit that introduced it.

I added some more to the documentation and also mentioned it in the 
`Opaque` docs.

> 
>> +    }
>> +    /// Create an `Aliased` pin-initializer from the given pin-initializer.
> 
> Newline between methods/functions/etc.
> 
>> +    pub fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        // SAFETY:
>> +        // In case of an error in value the error is returned, otherwise the slot is fully initialized,
>> +        // since value is initialized and _pin is a Zero sized type.
>> +        // The pin invariants of value are upheld, since no moving occurs.
> 
> For lists of requirements, we typically use bullets, e.g. `  - `. I
> think this applies to another patch too.

Changed it, also fixed the wrapping.

> 
> Also, please format comments with Markdown as well (no need for
> intra-doc links, of course).
> 
>> +    }
>> +    /// Returns a raw pointer to the opaque data.
Changed this to contained data.

> 
> Missing newline?
> 
> Cheers,
> Miguel

In case you want to take a look the current version of the patch is available at:
https://github.com/onestacked/linux/commits/b4/rust_miscdevice_registrationdata/

Cheers
Christian

