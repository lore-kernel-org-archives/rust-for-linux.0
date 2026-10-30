Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361523;
	b=aGaxrJPNFv9pu/ceaVVMnlW8CjE9QV/y6SY2j5hIoA7xZn9STwTUSA46QyEvE+7yHyCp
	 o8wjYKIJTYZUPHqI08A4GV1nuh485dwMSnsmupsK58WhEWCjrdWwq/Lw0EM55Etf8lXC1
	 u7cNGous1JcSPdDw8yfxjTMpz9/aE5+R8GmlHeowGOnYiClGtN3pfSTIqljBQjMsHIi9M
	 5hIAZH97HipmElGzqNH0syaLHX9v8zl8Ti8HsRIODmP7uNp2WvuJYGOQpH6o70W1RDboc
	 MVgJwXOaripsBD8ScyvFULA63N18OsDJPyA9gYnop9GaUffhV8FgHqIZxXrKeMn3DkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5Nr1WKgza+AgQYQHg2wjswGtM7GwVueFVekAPuAhG4g=;
	b=2Z9EFfUaYH6zdkWvtJ8tRPD+qPWREd696VcFv7a6XEWfsEQbD1v3dkOAafzUWB5v2Iyn
	 L8no/Z67nLtgJMJPcj3ZJiXT4goZ6Ug6/Nvozv0DYtMcU7AEDy41VO64+NSm1eFevefb6
	 9kJbnTki/K85L403XKVDCjsd/X+fyvXBEhFs/rJRgAHmlKaOc39OCRFYkNSNwbTRdaK3z
	 jCOHx93jv73MYeKPIjNnf/lv7olEcXPtTVEP+2ZCSIBEY9cFoKNALCGzlQGFMj3IX7jp1
	 R9K1d8ioqcbEzAq23HUsNSb5WtkNfQuVpwX+0NLPoBGtKH9cXw8hILws5FgJgVdyfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzQjvSxP;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D2606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 11:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F26D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzQjvSxP
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9e53d011eso5502955ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361522; x=1793966322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Nr1WKgza+AgQYQHg2wjswGtM7GwVueFVekAPuAhG4g=;
        b=EzQjvSxPLHZXl/YZUNvhgfWaApbPxlLlU6lJhGVAvNMA4rNTgQOpyqeOVoJV7wz/Kb
         l+ASFxCoumgSCUkrwzDw/RTdHWAmjwsjPtBu1godxRU2UACayyhZ3c9SHHf+PL2nudni
         MgAdtl861Otv8vDOWivq5XgCEzu7N2L3YtUQy94Z9r6BbIkwFej5Lch0JH4K3e9Pt0xI
         Br6B/q66ATElm15E0KXrqo4kKSW6Sue1etWi6ajgVNCHT+CT/oIGbvZCr5nqA8EdS7Xe
         hMMFuDkmIt+MxFsy3eGgMo34KC5dVpGH3kccckKUqEnGTECHpddHz89LseuJkB/45Yhk
         04UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361522; x=1793966322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Nr1WKgza+AgQYQHg2wjswGtM7GwVueFVekAPuAhG4g=;
        b=fXcIiJrFjGZAagDG1SOAENoJlXXmSfwUCQ0njDYBjhNuPJcye7QjvFKmiosgeigaJ5
         4ETzVR7KnXVRt6Y794eBjSYiFiSDAFZIX9zZsaBAlMh0fzouFWzOj+hKcN7EFTYoNUY4
         4OrRANDVEq1mRtHi18aLCbrxt8mP+HTcjQd5HMlngAQ8+VwXp2iz+aDusHujQ3zkVJuH
         SPch4BXOPPhTD5hU08LMRNbRYa6uaoHBKsQqPR1IA2rSCV6lZST7AFdws/77CrFJHIhK
         A/UHg2DNpDLibNyfl9kRIoVWOZf80lDD2EDsS1KEE7X0gywlUYtVpXErLGFyAreoMeJs
         6PYw==
X-Forwarded-Encrypted: i=1; AKwUvByvWBu+7yLLObfkQJotvz+yeY+yAAUeYWK94dMQwFrauQrlKpCUu1uI6unvt/AOlcUxzhUhz5eo4zef1yl98Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIX3jHrYqXK7N+sGio91M0oZ7/UHU4T0SLJkHv0Ntf39M7P9W47
	8MsGffjkFO9CtyJTx88XjrkY/VhPUCeiGXDOMfJK/ODLP6FJnre0UNOOa3M41Q==
X-Gm-Gg: AYBFou05rtTk2/WX+ekhri+QZ0F4kwB+JXQXqH3IOKv/pF8rV9kJYO37Y7i087vV5rz
	ay1P8W1dvO/vUvutfkKmlDpRHP9cY7/SW9hpnRzIwfk/NitVe6yZcUc4T8M5D6/G6iDgM0Fg/sq
	cOZuYmq4/kKNQfanM4+n5X4F22caTa1q1vXCc6/qXBjY7DjphVviWqgunK3JdgMOP9bJDVKXuBD
	2S7AZ9FPsEvwKfE/hTAQk96byu7dp69ltmI8KDvGDFS6QYAgEPbSzOyvGtdhZCcpn662guYY6xo
	tD8XIx89ENv3/qmMrfSZSckeKinREgGodEMx1z+9USLCJruHhqDGiHr9xWn7fMPPRu6rcJbNl5K
	Fo2ZDLt7wxqz0anskCT5MT+EtGaUp6oxAEUTkc6p0H86aMtFB9retrhaNFxPuuN1Ljqp9Ov8J1v
	2rV7za/hMDvnT40gXV3yw3mNzvi7IuDi9yHb7+nnMTwVwF8SEF2IBETuO/Fg0wsT9QMk93ZMmv/
	1gVDz3KuqEZ4qCPX2Fp+i3LqH3b1u88DoXApazBsQqCmOCJGS3kpJ1WJbzaZwVuR7DXX0UWKHPs
	3g6Rn+Wv1HbzZu7P7dxMOA==
X-Received: by 2002:a17:903:230d:b0:2e9:6788:9372 with SMTP id d9443c01a7336-2eb36515de8mr22854405ad.62.1793361522377;
        Fri, 30 Oct 2026 04:58:42 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm6175585ad.34.2026.10.30.04.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:58:41 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:58:38 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Shuai Liu <847807867@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 06/12] rust: serial: Add minimal serial-core polling
 console support
Message-ID: <auSGbrP19XfI3S5N@debian>
References: <20261029-rust-bl808-console-v1-6-b736ee920078@gmail.com>
 <tencent_12B82162741365EE49D2A22CCDF2A04D6908@qq.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_12B82162741365EE49D2A22CCDF2A04D6908@qq.com>

On Fri, Oct 30, 2026 at 10:16:11AM +0800, Shuai Liu wrote:
> Hi Kwanghoon,
> 
> I reviewed the Rust side of this series (the serial abstractions in
> 06/12) and did not find any soundness issues. In particular I verified:
> 
> - uart_port.lock is initialized by the serial core in
>   uart_add_one_port(), so zeroing the Opaque port storage and relying
>   on the core to initialize the lock is safe.
> 
> - The set_termios() adapter unconditionally taking the UART lock is
>   correct: the serial core callers (uart_change_line_settings(),
>   uart_set_options() and the console resume path) do not hold the port
>   lock when invoking the port->set_termios() callback.
> 
> - The console callback accesses to driver->state are protected by the
>   ownership chain: the port holds an Arc<Driver>, the console is
>   unregistered before the serial state is freed, and removal drains
>   the console readers via SRCU.
> 

Thanks for review.

> One thing to consider: SERIAL_BFLB_RUST depends on COMMON_CLK, which
> cannot be enabled on x86, so neither the driver nor the abstractions
> get build coverage from the Rust CI (allmodconfig on x86). Something

I don't understand for now, COMMON_CLK not possible on x86?
or you mean CI not supported?

> like "depends on RISCV || COMPILE_TEST" (with the clk dependency
> handled for the COMPILE_TEST case), or splitting the abstraction
> Kconfig entry from the driver entry, might make it easier to
> build-test.

> 
> While reviewing I also wrote KUnit tests for the pure-logic paths that
> can be exercised without hardware. The patch is attached; results with
> kunit.py under QEMU on arm64:
> 
>   rust_kernel_serial: pass:8 fail:0 skip:0 total:8
> 
> and CLIPPY=1 is clean. Feel free to squash it into 06/12 or keep it on
> top of the series.
> 
> Best regards,
> Shuai Liu
> 

Best regards,
Kwang.
