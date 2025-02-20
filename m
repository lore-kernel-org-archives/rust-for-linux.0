Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21ED1F6679
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740059212; cv=none; b=nrNeH1gojL9WHin7+IYQgzkPeZYeQrPvLDWwynrWzOekw3Ezok4ph8FXvBDJ8996KOPUT2iHpCBBhPACJcy1MjRs3q7WyO2hCUciA8h9gUtvxFYADKyioXCn4ZvTwicsWNRk8o1oLSiyD814xBzVG3hn7dCuB3KDTytmxyToHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740059212; c=relaxed/simple;
	bh=1jVbThmX/xBa44klFEKjAJ5W34MO3vftIlESOdgboYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1ZyUSQeTfOBcBhFfBQpl6pmifQH/+bRzBQvr1IgpKPEK0AGqMKvTnNnB59r3B86Vkr5LNmFKcQxfM73Ui4aeH/1BC6tupLf34qN+79jZ2sj6A83Sy1/bjJWxpX/YL7qLoU/d5gL/z6CqoU6GrvaKTYrFE8YgntELn8QDHWNv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3t75xax; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3t75xax"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso1733584a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 05:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740059209; x=1740664009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zn8iEIUMrS40tjZsG1qyBPqsWfjDSZ0FtFQ9slyGvJ4=;
        b=D3t75xaxbMbBs5SEYz8soWwwNhJBAX14DFyj9Gyk27nUzXSMddSJOjnFejCKBJdmwU
         6c6I/bKv1SIOAxpP9fcKrcynHla32Jovp8Q7uG6cuRLwuwHo9NTuMFrXBgIyvfsDpt0H
         +0CXlcaAArdZ/6niJJry2uLCsAiQSzueqSaMNoDfbRv1h8Hbor9A5iywvpqMoZrhpCWg
         CgaJ8ZwyOTU4cbYrUJDH4lXqVlAnu97PS0jg0Ssele8mMsFBwCMpJqUJUTMfL/JeT4sa
         OGFdsq+CXElJPN17hb6y2foAYPozBXdSC0IRC6PGKdhBdJAvtjKWmEkVS7frMjcxubkB
         st1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740059209; x=1740664009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn8iEIUMrS40tjZsG1qyBPqsWfjDSZ0FtFQ9slyGvJ4=;
        b=p2skF+4HI2WH9Aznpre27iV6q25TWrPTgGbNZc03Ibu0o+maD1K0MvvIJl41lF5kR2
         qk0I0t90UcMU5v6nJ4MbvWpfVaIgv3hbH3mdSaiHugUUGf6okvXy2urUA/FWmpzJGbpZ
         NbRR02MMSLxItSr6wjmpdHKOkA1OszsTNqhhk4S/3Vd+znZBy58WNy9OaVG1r64hu6ZS
         5osjYcq3/ckFxfOSPSR3G89L8Qlni0R5MehEA+aRNbvwrd9AgqW3Bkn1U93dz87cYzIj
         MTqQ1Wv7mxfOhHk6A76veM1Zp5H/xAAATzCkaxf4p66R7un9dis6Gxf/lAy1XHBlRuFV
         yAuA==
X-Forwarded-Encrypted: i=1; AJvYcCUUI6inwVdF21dTA0p2rQwXtAm8vAj4zcSnfhn8uDCm6woQ9dOsyg+SRe8Toty5dFzeKWuT9LdVoaWjqV+BNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwGgdWbYIwiVlLIXdXQqBqEkVQGy7E1GbwZEvhfEVd4tGZV8N
	yDlBkot50OMd0Et4ihQnGhV7Ux4bC+0MKMz/weD8+K6iATmyEVUcrF2V9ZYEyHw=
X-Gm-Gg: ASbGncsskPqNJJdNzE3n2BPy5zxTPcH9TdBxQUOv53WDdV4KX5rjfCFmzHCUwW+sgcI
	otZ+4ksTPeOJJh0I2tiiu58JIRitmsM3Y3qqkhEkzJkPWSkV1gTg3doG+XGrqAjSxDGkIJ1XQF5
	sW6yn22NI1CE2Z4Zy8MAvm4CLd2y15KidyUmdiaNj1iAWFJ2PRYSDwcnBAsFqrHGRqgBtg3TGs8
	DMS2Qpox3SPSidaZFzpNAqhnz+NJDyoxZg3z+mpAN/Gqc2hn1Gke9Glhyj9546bMCs855x+/vqc
	8JSEDKUoUOpWavBwh+5Z
X-Google-Smtp-Source: AGHT+IEfkrRQ85xe9pOj5R5EwLaYpo72DL1cc79Csvepxg+wxeNncqBoFZXg3h/koqsH8dAFU2C0hg==
X-Received: by 2002:a05:6402:40c4:b0:5dc:929a:a726 with SMTP id 4fb4d7f45d1cf-5e0a4bae4bemr1740318a12.26.1740059208978;
        Thu, 20 Feb 2025 05:46:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1b4e80sm12119627a12.13.2025.02.20.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:46:48 -0800 (PST)
Date: Thu, 20 Feb 2025 16:46:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev, Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: Rust kernel policy
Message-ID: <962fa158-5315-4d93-afb1-8a1c08787ad8@stanley.mountain>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>

On Thu, Feb 20, 2025 at 09:57:29AM +0100, Martin Uecker wrote:
> In particulary, I have a relatively concrete plan to have a memory safe
> mode for C that can be toggled for some region of code and would make
> sure there is no UB or memory safety issues left (I am experimenting with
> this in the GCC FE).  So the idea is that one could start to activate this
> for certain critical regions of code to make sure there is no signed
> integer overflow or OOB access in it.

I don't think diferentiating between signed and unsigned integer
overflows is useful.  In the kernel, most security issues from integer
overflows are from unsigned integer overflows.  Kees says that we
should warn about "Unexpected" behavior instead of "Undefined".  In fact,
Justin Stitt has done the opposite of what you're doing and only checks
for unsigned overflows.  He created a sanitizer that warns about integer
overflows involving size_t type (which is unsigned), because sizes are
so important.  (Checking only size_t avoids probably the largest source
of harmless integer overflows which is dealing with time).

The sanitizer has a list of exceptions like if (a < a + b) where the
integer overflow is idiomatic.  But the concern was that there might be
other deliberate integer overflows which aren't in the exception list so
Justin also created a macro to turn off the santizer.

	x = wrapping_ok(a + b);

What I would like is a similar macro so we could write code like:

	x = saturate_math(a + b + c + d * d_size);

If anything overflowed the result would be ULONG_MAX.  In the kernel,
we have the size_add() and size_mul() macros which do saturation math
instead of wrapping math but we'd have to say:

	x = size_add(a, size_add(b, size_add(c, size_add(size_mul(d, d_size)))));

Which is super ugly.  Maybe we could create something like this macro?

#define saturate_math(x) ({             \
        unsigned long res;              \
        __trap_overflow(label_name));   \
        res = (x);                      \
        if (0) {                        \
lable_name:                             \
                res = ULONG_MAX;        \
        }                               \
        res;                            \
})

regards,
dan carpenter

