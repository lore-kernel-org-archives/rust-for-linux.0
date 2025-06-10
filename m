Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C721CC71
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551919; cv=none; b=cRNJjBNRJbx6LQ5ZgU5hsokyMkzYW2y28Z57i/VzPeLHaAQjg+1aL7OT+XUKeMHN+bCXxOVtTbS+DQCNJn91KkxebZ9r3PsTom4TNEKLDVeyMG9W8hIULQfDdKB/Nk18eEc2r1Gk8cogPI+2h9CUiz/KenEcMuQuC2JmSLOid6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551919; c=relaxed/simple;
	bh=RtnMrmlXV9IDEuAe0xQcKNhw7/57Ldi7nJ2CsDZvIAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnN/EWERIm311JjYYqi9dar1Tg9K22Wpees6foTloiU30c50msLYbaiWTBPVmkEXzLtnA/VMXeFGNoe+lnqf+oDpigLoiuH26ahZDKiybpf4J/2dG17j9jZ52pcNcOj1iHP8Yhky5f2FKfb7dQA0kLOqtY5bQMpdQWp/DeAoJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ls1ObZqB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ls1ObZqB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747e41d5469so5752950b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749551918; x=1750156718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kXIjHn7dVanx/dh81apv7WxrCAGv0rouoOBBRWo8fJs=;
        b=ls1ObZqBfoxEafiiAoRs4Viiowa2d76sy5WJIukUbGDOIK3bvdp0EoYxTWXHzNS2Dc
         7TGdF6aL/8ex7qvc6bnSBTqDmaibQftspx7KJT34IJYyR5biZeO4DmWhSTqWSz8CA58g
         MyQB3B7+hjuQqza1bnVFIsTFUyWO6c9eyGTLiRuhjiCn4vJd0FqrjUga2XoX56PWpj5G
         wd9rgoyAYeFIoelk4ndyx7aNzxW763TyjNUAFKqGHwiC6QcIqNXhwjrup5LbjI8Ima1C
         quYHOtasy133AaO3NTuH38jzagiYAt0NJkUUVyFMGO4LFQC+LQP7r3+53WvzLdwC6v6s
         48Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551918; x=1750156718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXIjHn7dVanx/dh81apv7WxrCAGv0rouoOBBRWo8fJs=;
        b=sOfgsfY0Ndjrs5c14MlGhk9it/kgD8tdvryY3YhpuuhUjU4VkzAmw1d8clTHjtwoEo
         jurqTmtLp1ast4gAYXz8U8dM3h/tnW0SWVEsC0hIRErFHfWwsJswIVCxgddf/vlBJDIk
         98k0LqoYS/+2sH7v1TiMmegO8cddEy40m3T7U7CE3WenkGCFJrLc7j0NOhKaTiOFo1zI
         nu0TGnWnnrPM6xak2iKGdRstLQXEUHF7y6VUOcaZAbypNH6IM6jIeJ3rJNcrb6eR2GuK
         GphaxWxUSN6EUc+kibJ7VchCqx2mnhOb9r5wxazJePmlIuO4u+J/0l5VvbIJuTrunjFZ
         o3fg==
X-Forwarded-Encrypted: i=1; AJvYcCUCjGdx66y6v1asNEoBQgorHifaEwDe4zpN3PqGcRJWn/85LsOl3CpVnMHVS+lhtWnQrksDi0Hq6jPPjWgqiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWHrmPiMJQ+o3IP3vFatc9gfdgxuSPqmScnnkhph+Ss0SOYXT
	kw6PqmQFUj6imWAbTHAlnN9cXceGJ1U1qWd1KOI49NbKfty8p09Jbda87sYTLjy8L70=
X-Gm-Gg: ASbGncvJU/M/j+we6UUlOqFQdv/FzQ4Zf2CTXp1QSfzmVjrfuJp8ty80JGMJPKTQjTy
	wrzvIr3N2Tya2KmRkMAAdVJQq2IJY+CTZL5GsXtOhE//gBPgAJtxiB1ajtwuNU0oU0jP7Q90pI7
	M+HP0XixHI13kRIhdkB3pNpwKNDXwQ5ztjJ43avpBwCWLDf8fv8QCeMWDTGpOsdNYfqr9U4Ou/3
	zzExl+GSuV8LRlxrxM99/n8TYYSuzolZrXzaD2cBqpWCjy01xgbQh/bA5WVyXx8mVmeGqA2r8nq
	VeNSNaTb8ANbFwGDD+uIN9u1UJd4zXaWT+iOklXUI/ED4YN2K3o8n37LtZbZFYY=
X-Google-Smtp-Source: AGHT+IEYxgFtuUO8rprFJtHGGMBI2ccjNlWeNIyHcQi7l22B1BFH/M5F5SPjP82SwQlO1/YYkJuhcw==
X-Received: by 2002:a05:6a20:c991:b0:215:dbb0:2a85 with SMTP id adf61e73a8af0-21ee14c3a23mr26299879637.0.1749551917806;
        Tue, 10 Jun 2025 03:38:37 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70730sm6573730a12.22.2025.06.10.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:38:37 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:08:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610103834.iqwuozp6mrgz2i5v@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
 <20250610100025.e2jadqzlmimyq4rh@vireshk-i7>
 <CANiq72=dKx22CksQ_r7XuTrufTCh8ty-aAicPwFX62Q4JeAVTw@mail.gmail.com>
 <CANiq72=uZLZ-ddUpyhPA8Kn-4DRKDgYT00wzc+zDRLOX3kv+dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=uZLZ-ddUpyhPA8Kn-4DRKDgYT00wzc+zDRLOX3kv+dA@mail.gmail.com>

On 10-06-25, 12:21, Miguel Ojeda wrote:
> I meant "for your files", I meant, sorry.
> 
> i.e. it takes some work to guide people and help them get their patch
> setup right etc., so it can be often quite more work than just doing
> it oneself. So it is understandable if a maintainer doesn't want
> those.

Its perfectly fine and I am available to guide them and review patches
:)

-- 
viresh
