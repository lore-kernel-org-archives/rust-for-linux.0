Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD626738A
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480870; cv=none; b=egOlecJvbCKBR9jZ5rE9TbTw4roeEBnPl//yHp6Ha1LA6imuaPhqhTxWN5Uh7lnyz5ik/4ftGmuvkZK13XgadIh+nnjzb7dDl6DHRC+g993GSVy3AOeNfcMeMqdxVwREBzeaW0ePvSVHtWXXq6jcYspK92NoTSiKiEiE3NDK4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480870; c=relaxed/simple;
	bh=Nlblt9Q1ES9xX9+QoDGnrD/VUnOCuS5GL3nVG3iQZ00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODru/L0c3DH8LXBS3avjmHSSVzeZZ7ZiRbGU/ECP1IBkEJxCZT4bCXkcRakDvjUzIA8S9nbj+qTAP7Q4kOsx+s8TaqZPuoq2tw/t6zkbAp7fNFFK0ClZICH/9ERBWAYDGGqoW3S18QavHB8TjqbtNrgm17iI6ugiUA5go9H1n/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uqb6u9BG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uqb6u9BG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220ec47991aso74524195ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740480868; x=1741085668; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywJx3h0ZJvqjojvcAw8b7KbSJw+rY7IXbqqxP13I3pQ=;
        b=Uqb6u9BGoNTIq5VlNwpUosXmVAghTzaLqvnQoF1j27Cp4La4ztDzfvztZzP3EEj7EE
         ywSBwZLVZ8TaSvJYfWWUgdyjkUBCYBXwW0uvcx2CNfd4M/aF/Gp3/iGmqmy6sUZzeBN4
         Ubg2AeWLPF3W0FgU7OkjkCZoYLI8GqZJYZkBKqeqDYpIi+zx2zk6FbXHIc9pBUvMApJ5
         fA+aa8g1yNWjpuQ6A09FTzaI6gPX/BEmpnbI7loRbB/Up39na+H+TuVDIgQfCxsYpXM7
         et0ghuz/LOcVurIh9cBpRKakyKm+i2MbeJR5eyRY+iipIH6kixFc9lPx3HxMTBgFr2bU
         UMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740480868; x=1741085668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywJx3h0ZJvqjojvcAw8b7KbSJw+rY7IXbqqxP13I3pQ=;
        b=ZwEeWbF3E7zIitFEtus95TeqI7gu/uCOWNmwNOjaWl2pVkS02r7mK7wWJs2eJDwX4K
         MEqJTHipO6eXnmpHOEzZgfP0Lu1v4XJd6DLQ7e4L4OfYU/BXuiW51q/eYcHLcgvuSS4P
         gl+gAMkQJVzkqrxZGy0HrvljxWIVjbPraM9fwXw4RXwqXPgslbtutrQnF34iJ4ua+Yk9
         2AQROmuKRroyKk5AJoqE8s2F1XfQne/8oxNDd6+R7+5Ky73gIux1nig8m0J7kJTJhjIG
         LgN+ZFKRsERY9Mi0ZM84BKOQa3HWl17l2+TPwXbhkWkUjwQeECQOSOWHtPh8PL5zzqm1
         roNg==
X-Forwarded-Encrypted: i=1; AJvYcCUW2oRwChU97hu/uXOUHtjDgqEn5tHCscAI8Nct5/uE8wV4uGzJdLC9Fheox8v3oGCre2bWFxmsJR9+rv5hAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzWrfAvIoZO1vFcdduiP5ciJgzdZMd1bZreFjNKj3XZ2mm0YH
	iphHyDm3P0HBgHZkWjYI+W89bQ+6K9TCsJxETqFGJxwYh2hH0EsbxbQ2axzo4nVrvmKUusBzZxK
	s
X-Gm-Gg: ASbGncuRR2feCYmTgk75pHSAS/DaC9AGX4PCUL+1XgpUHImrB1S29D/u4Il0a76kb06
	0plzgg4eJQ+wq9VfGiB+I9sTyXrLR1YVY+bHwH0SkjTl3FssyAVvj2fdOlJeUYiQ/Z0UQCS7xTg
	iUy4zohcx1EKuASMeSYQUN/wQA7gRBd+5cmdfwLORq2l/dg32wPr471HFQtHcXARenp9ulykVQw
	EG55pUzA/QcDMKkPZsdCzqtj6bjAU2jbUq3Dc/YTAtMrinnGy5pM2xC9uTPiX9bY+lQ3HqUJZkv
	IJ9Uik3Ko43RN52yYXf+pXctEo0=
X-Google-Smtp-Source: AGHT+IGoJFVYUA+pbas1YPlSrtUdxisbU+dBwLRwJk/y+b4li8vEnSApiSuQK3C7VAjyR5NAwMkJiQ==
X-Received: by 2002:a17:902:f545:b0:216:282d:c69b with SMTP id d9443c01a7336-2219ffc00a1mr258165835ad.50.1740480868315;
        Tue, 25 Feb 2025 02:54:28 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6f761fsm1188981b3a.47.2025.02.25.02.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:54:27 -0800 (PST)
Date: Tue, 25 Feb 2025 16:24:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250225105425.ooqvefiae5bmr723@vireshk-i7>
References: <cover.1740475625.git.viresh.kumar@linaro.org>
 <68ac0f0ee3c0ebd3d3cc078a6270752778a1b732.1740475625.git.viresh.kumar@linaro.org>
 <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com>

On 25-02-25, 10:55, Alice Ryhl wrote:
> On Tue, Feb 25, 2025 at 10:47 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +impl Drop for Cpumask {
> > +    fn drop(&mut self) {
> > +        if self.owned {
> > +            // SAFETY: `ptr` is guaranteed to be valid for the lifetime of `self`. And it is safe
> > +            // to call `free_cpumask_var()`.
> > +            unsafe { bindings::free_cpumask_var(self.ptr) }
> 
> This is missing a semicolon, but it's not the last statement in the
> block. Did you compile this with CPUMASK_OFFSTACK=n? I don't think it
> compiles with that setting.

I would always add a semicolon here, yeah I missed adding that but ..

I have missed minor things before sending a series a few times in the
past and this one really scared me thinking here I did it again :)

Though I was sure that I have built the code with both
CPUMASK_OFFSTACK=y and =n, I performed the builds again and it worked
(again).  That confused me even more :)

And here is what I think is happening here (which makes it build fine
accidentally):
- free_cpumask_var() has a return type of void.
- The block {} allows it to build fine without a semicolon here.
- I performed a simple test for this [1] and it works too.

> > +            #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> > +            // SAFETY: The pointer was earlier initialized from the result of `KBox::into_raw()`.
> > +            unsafe {
> > +                drop(KBox::from_raw(self.ptr))
> > +            };
> 
> This looks like you did not run rustfmt.

I did this:

make CLIPPY=1 rustfmtcheck ARCH=arm64 O=../barm64t/ -j8 CROSS_COMPILE=aarch64-linux-gnu- CONFIG_DEBUG_SECTION_MISMATCH=y

I hope that is all I need ? I checked again with both CONFIG options,
doesn't complain with rustc 1.84.1.

-- 
viresh

[1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=70cd7d31633d98774a088fed68ebb00d
