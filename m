Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E95683CAF
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713200913; cv=none; b=qL6SBcdYWbGGQjTWKPaFbKdZE3IrduZr9u97/1UKXJTiD8K4gYhJNxdXl4K9iy7+ruMHbB4EV9p9GX5isSzRzHqTSuoNPjnKhs/S8rxBD7sg53JPbdNzGaecmi51ol4/cATifqs54t1NEJ5kZbMc6bow5laMO5+cewTG8PnwaWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713200913; c=relaxed/simple;
	bh=RugWEcPj7mLc+ykQmVDXsINc+yUnD4Z6zG9Nxnjmzg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lE9E2nwPg4xmWIxJvY7WsoOcXJBtG/vTW1WyPtnrCo7ff4RNNMSx2jO2RwCbHgTqcm0sz1zDIU1geMz0T3V2BU6gQ592HSsvDThBg0GLRqAtJxvyk8wEontL0z3dhos5gvY2UzujgJ4OCO0bjNn67qzYkWuZFsSZFhE4mp71gFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SKn8gTAj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SKn8gTAj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ecee1f325bso3232064b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713200912; x=1713805712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hcAaLIzTeGt6hWYjO1jT3BQBc4jW6jSrXxhMBGNGb14=;
        b=SKn8gTAjJKMUvDZi51tQf5VIfrSZN+ezeWMCFyhWIQuVkBf3DI03hUSfmFLlpn1Sca
         i8fXbZyQ9jey1yfwJzRDWlVII6iil+ugpBmqJy41XE5qkLEg25lotpxunJd20OZspQpw
         DS+Nrj5isK6se5THFuGK7fI4fFGvYKJPmNQD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200912; x=1713805712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcAaLIzTeGt6hWYjO1jT3BQBc4jW6jSrXxhMBGNGb14=;
        b=KDlKkAunLF3PBMgx2MmcXB4IYbkVItIVXTFHgToWMRaXYKKDtUITjtQsTVZe+k4h02
         8h8P78wrZwCJ9/ARUgLPR/yNSwi7Y4g8ccswT5vSCEdub4R2FyYnftEJ31aVwgSTL5J8
         0tntTaWcVh7hOMmh93cRSuKsSSukH4kKwMjlfjtyOt4nxaS63gPlnx7DvDzvuJcVygV0
         tiSfDLR/n9Q1v9tBDHqTuDBkaGXuAjVO0uxUysep6/ZDvxVvB2aLRoCiPwA+pJm8VBZ6
         +j/45GzAFWLtxrE7eiywP/oJ/d/OhWMkkYLvNuiVDlky4DRIkRH7Znw9N1p6Vvoum1dD
         CpPg==
X-Forwarded-Encrypted: i=1; AJvYcCWDuFPgtIrb3g32vf+z40v+kCThgm1ftXxKooPN2I9j1jouOClkIGdZVAPvcHC+4FPgRr1bxgo+siRdU8pTGmlNAOnfnlr2zqiyfaPjs9U=
X-Gm-Message-State: AOJu0YyacuLiIAHo/66YHmCyKLbRbfhIY3iyZzYqbz4E50iEK7gFzyyB
	m8XEKrcTWTXOB39HF4vDALEP4OYcq37nrjIBbQrQuv9IIoaEe/xHGpVmb6WcpA==
X-Google-Smtp-Source: AGHT+IFS60V/7PQX7NA/39zXZhcKumbWVEL+/evOE3BhhEe5wnSkFy5tdvukgRaWDCkry3aMCaVenQ==
X-Received: by 2002:a05:6a20:734e:b0:1a9:9d07:c431 with SMTP id v14-20020a056a20734e00b001a99d07c431mr15727248pzc.53.1713200911943;
        Mon, 15 Apr 2024 10:08:31 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k28-20020a63ba1c000000b005f0793db2ebsm6302106pgf.74.2024.04.15.10.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:08:31 -0700 (PDT)
Date: Mon, 15 Apr 2024 10:08:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Philipp Stanner <pstanner@redhat.com>, Kees Cook <kees@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: time: Use wrapping_sub() for Ktime::sub()
Message-ID: <202404151005.EB7F67A@keescook>
References: <20240411230801.1504496-1-boqun.feng@gmail.com>
 <20240411230801.1504496-3-boqun.feng@gmail.com>
 <CANiq72nSSAVkynVaAq7bQKoL6N8K2JUXp8AOVvu7vN+siAhk-Q@mail.gmail.com>
 <f08c06a4e8361f2cb55cd0dc1fa2bc2b0a046049.camel@redhat.com>
 <CANiq72kMZ6mpK+LaL9Xfsp032CZOfAEtr6Dp9A2R-m6dC3gkWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kMZ6mpK+LaL9Xfsp032CZOfAEtr6Dp9A2R-m6dC3gkWQ@mail.gmail.com>

On Fri, Apr 12, 2024 at 09:58:57AM +0200, Miguel Ojeda wrote:
> On Fri, Apr 12, 2024 at 9:43 AM Philipp Stanner <pstanner@redhat.com> wrote:
> >
> > Is that going to remain enabled by default or what was the plan here?
> 
> The plan is to ideally keep it enabled by default, but I defer to Kees
> with whom we discussed this back then (Cc'd).

Yeah, we want to keep "trap on overflow" the default for Rust. We're
slowly making our way there[1] for C in Linux, so I don't want to
regress the Rust code.

> The goal is that Rust code, since the beginning, has all wrapping
> operations marked explicitly as such.

Exactly. We have to not perpetuate the ambiguity of arithmetic
operations. It should be clear from the operator or the type what the
expected bounds are for a calculation.

-Kees

[1] https://lore.kernel.org/lkml/20240205093725.make.582-kees@kernel.org/

-- 
Kees Cook
