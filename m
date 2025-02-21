Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A41FECA5
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131300; cv=none; b=itZniXtQSHmcwdx8xbAm0v2k3S9P4ZWEFs5kwwoi0dwb1z/jNKyqBL8TSX+VA9bkjpFwyvwDhrOchA8g46WTdbMVQrqJYqz4OD6KR//4IKm3xu0NsWZRAxo+COdXy8Qxj8zMqxuQZhautm6LUalB5cdxUJtyvM9hPVcC243M3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131300; c=relaxed/simple;
	bh=YQ4B87MLUsD0Ex7xuUwKJHzAgodX1CRjqci7MjxRUgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7GFuOCH+VBi+/BNn+gEtEhnwNBXEKvISkOCtSKJmWC89tQfwzJbQzUUuIxspgR55oJGQa256PdaN8agR+IegJQJkzOGoH+tnTb5eXwoYlsN16IpgxXXJpWsQpNrytZKL5nn69KEvnqumupc0WNJd5Qmt9zyNa2jjhXT00je6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zx6c1AIL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zx6c1AIL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb75200275so306241366b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 01:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740131297; x=1740736097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgHGvk60j/Vl/qcMIezfAgYt2qHmXNlKzysLNMFxcw8=;
        b=zx6c1AILDMcR3XuwvIBLxYqj89lEiwxdY0aYkxxMrqUbOjpr7xFtSlC19IO1w8KnnZ
         abxBAxZL/k4mOAKNG40lnR+gmwER92K2ZLt/2M4DfjoJ1UBc2Nnsc1qXoAdpBPZ8gK22
         4Fyipbgi3xyw9b4sQymkn85sWSMO8d9WKzQD2vcDOSC9B30VvHLfwb4wASTozsefaZK7
         Tk5oKAr4Ze6DdWi4NnWRDB1eEpNPXL1wJg9gz3gEYkFEC3DxMFgX/hMot87S3ZXoELNs
         tZpMS7YeP7YkJcuSlC/tXEaewVs45oD33hdLgl3JF6RkIKk0lg5QRr+GFpAy0enX8vGj
         zaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131297; x=1740736097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgHGvk60j/Vl/qcMIezfAgYt2qHmXNlKzysLNMFxcw8=;
        b=rMuHY++wg8lB18g1elvnTiMKvfg4MmmDqvbF9RzmPnLcnNAwtomUVu1PHaRCMB4YET
         8LY+L7Ixn+x2z42if/sLbMGl3xPKyaCVq5lQI9ddZL5OGXFEPZSAwBRiE+7g5YUbw9wV
         EtDzQic7EEC5GuqTAqjxCAJpu/KUiBewEk53yaKNywDNyol44POHUG0gVkn0A9pu/xj4
         UiYA43JeO5QBTw/VEpWIQFZ5rBVF8y0nT2jvbrsEhSnrFoVfTNtoGrAgq0VOLxBHnBn7
         7S1ZDqAQIDy6OLoCWDbtZzsA4D+mzcDRaoazVoHftG1nCU0zEjJ+KDnHEKcSz7dA7EVI
         bBXA==
X-Forwarded-Encrypted: i=1; AJvYcCWV4piaLyB+TZD/jSXJUJ8+5YQygUcLXeGNQ7zK/X+exvQa+/wgJtVZf2dDy2z/xQuRgDbdDzi9Dy5OQAOe3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YycF6tPUDvDAzRXsx2Tu2nNAuN8kByqPPqKp7z6TFMnrEUSWun8
	iZ2gJ+Q7F5N/jqHXtBFUw22EZ9SjkCSg15uZK9C1Ravh/LO78W2EjCaUNbfKVsw=
X-Gm-Gg: ASbGncvb5oj6fqa9QM/we97otFr9BH3v8p29YixY1Hq9BINAbDYfaTg3BEL/NAX/ba3
	boDxv8oBvXKBEIHkOfnqKviXvTiysOYFwnAM+JQh1isH9iriwN2D3cCknOag13YflcPYGUVf6vh
	ICjiRE4LWR2vbB5yoQW11v7+LcH8jKVfHajPl0h0gzdB8YnqcB67b0ALKVHZUXClsjwC2hH9qxb
	mp2vYI0GP/CR3PjtYqsZ5+oOcODpECQcCswtCd/hDTSqsps+hoviot43lUOzQu88eVz0zLfHqDz
	TiiKGPJH1qoXNylVxouhMmT68XCiITE=
X-Google-Smtp-Source: AGHT+IEsyGrDlEQ3AVOyj1FyijrnT25YFiKbhs7K9ixu3igzvsVEz5e1kryk9Tyhp/G005H/Mx7cbg==
X-Received: by 2002:a17:907:9c05:b0:ab7:bf2f:422e with SMTP id a640c23a62f3a-abc09a80912mr280845366b.27.1740131297105;
        Fri, 21 Feb 2025 01:48:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba532802a1sm1616457366b.76.2025.02.21.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:48:16 -0800 (PST)
Date: Fri, 21 Feb 2025 12:48:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh>
 <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>

On Thu, Feb 20, 2025 at 04:40:02PM +0100, Martin Uecker wrote:
> I mean "memory safe" in the sense that you can not have an OOB access
> or use-after-free or any other UB.  The idea would be to mark certain
> code regions as safe, e.g.
> 
> #pragma MEMORY_SAFETY STATIC

Could we tie this type of thing to a scope instead?  Maybe there
would be a compiler parameter to default on/off and then functions
and scopes could be on/off if we need more fine control.

This kind of #pragma is basically banned in the kernel.  It's used
in drivers/gpu/drm but it disables the Sparse static checker.

> unsigned int foo(unsigned int a, unsigned int b)
> {
>   return a * b;
> }
> 
> static int foo(const int a[static 2])
> {
>   int r = 0;
>   if (ckd_mul(&r, a[0], a[1]))
>     return -1;
>   return r;
> }
> 
> static int bar(int x)
> {
>   int a[2] = { x, x };
>   return foo(a);
> }
> 
> 
> and the compiler would be required to emit a diagnostic when there
> is any operation that could potentially cause UB.

I'm less convinced by the static analysis parts of this...  The kernel
disables checking for unsigned less than zero by default because there
are too many places which do:

	if (x < 0 || x >= 10) {

That code is perfectly fine so why is the compiler complaining?  But at
the same time, being super strict is the whole point of Rust and people
love Rust so maybe I have misread the room.

> 
> I would also have a DYNAMIC mode that traps for UB detected at
> run-time (but I understand that this is not useful for the kernel). 

No, this absolutely is useful.  This is what UBSan does now.  You're
basically talking about exception handling.  How could that not be
the most useful thing ever?

regards,
dan carpenter

