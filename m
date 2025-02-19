Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE51B87F4
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952357; cv=none; b=MbRGxJHuvKyhDW+jSYqGXVaGWpQDK+JqPwJ4QUbTjT2rSymzrEUmf5nWxjTEkRURiemXRF5ekkE3CTtdh5aikaavBP+fPs5DbAJQZJe/5tv1n6bVIWOZ9n0vkgXgk+CZTa1fMSzV3OjcjYfK+A+2KvjB+8TNfOYKvRp2AFH2gMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952357; c=relaxed/simple;
	bh=6b/FYVUKFZW/rZzPAqlMXsdGXCeCSu0N5Kd+DJjdp7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGCCVJcCh8dhNj08f1CF0Slb277Lts4J5UuDkEvYe3Ujo9UZ7v06STStbqCUy/e2LAQPtSl9yInwXVSr801uxHaquA52caIYjls7h2rBPjwp/Z3IPAt1+SNMRa6QkymfNORlfn3494Sp90Ytb+OyuP+TJ55avgB4jxw2fX9q8jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OP0ZWc5S; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OP0ZWc5S"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1070687966b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 00:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739952354; x=1740557154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLGc0PhsYQqjnufHmhSBlNvjs6ldgEolpYxIgynjQOs=;
        b=OP0ZWc5SESZewczmU4FGe0a8AgI4gtgDFl/IwY9sYT3Za7fNJT9i5NqT2W3xCuBQIf
         TrJZzWXu+vo/PqlX2Zwy7+Yw7xFLcTvuPfgoeRRLSuXzUTndXRoaeI4OSKMcVvWxNdnC
         /QZBHXJUhIpL3PG60Uuw5XEd3lfFevbS9XdFskpRhrroZ8JNxmlx1+0tgb6LgX74CDXX
         bd84sQVbuXkLxmFeomxiX+rAZ5nIlKfPMMMN7v4CegZ+LqAtZodxN8JPHCLWR2+CZD2P
         3equ3fiYigPR5vGksIGlTSwqyOcMqBBG88MKv4mF0ks7nNojOy4142pIeYRs9zlUY6HR
         2fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739952354; x=1740557154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLGc0PhsYQqjnufHmhSBlNvjs6ldgEolpYxIgynjQOs=;
        b=soT0ytQ5cHyZ50Ob+tZfu4Zkk9cr9CcM89L3KnZfuqr/gi/h3FZ4Tw6M8OW9EwS3Fu
         GCPHvrHFfBqTBevPpccBpKxMKNGZrjpxua37PTH+fWePg2O2EztW8PPMcacCa1GwtCg2
         soZRbJIQpQjjrhVxE1DuAkTAU5N8f1x1lPIbhgBLahOzzQ48hBptYfLXzHrBcj41XXbS
         rtHmVIVHDz5jFYbj2Kkvnbt9baIDqZFZPiL6iCqwjzIOH0QVAH2hNJdtD69iptF1mI2G
         aV5Gx3UWj9n9pd4xsQN1N5OJFZ78fPI/RahShxxeE5fJ76O0iDuTit+6gGFidj3RaDVi
         o8AA==
X-Forwarded-Encrypted: i=1; AJvYcCW3F4PvPHi4gUBjf1jz8ydH3A0mqAt/i/3c27V/A6L/qjSiNeolyTMorX0xvsM/ilyES+d2/CGRjJwfX9URjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2th5kRLMOtK8DtV7tl5Esp6SZVTlXrx+DS7uGj2h/ZV1NwlN
	DDsbXAtZ1wlOnGUylAZZueBHkQlGC8OioYFOZbibNDw885FMm/wAnSeUBLqIC7IZ3t3luIdYqRj
	G
X-Gm-Gg: ASbGncvkszZxizZlAcrZ7+r6PU25+4tkzZdMYMkV+Gg7yuuL8ODMNVlTUWb8FK2GH2R
	jsM07ddyP7syXi7m1GMEGmIGUBmQnoXbgkEC4BaAs1dcMFhaWETg2uS+B+92kFJYXEg9xSD12bm
	8dtfvBj2S5gLMnJutISnNU7Zpr7CfqQlTP8IqDh5yBbz/Zwxvqw2BMrGurAQ9z/RIxcPs4AVq7A
	jLOHFnMfH/OYc4MeoMJDlEwiBlgNEYRWeJv6p6aw/rS0aI/lmH9mK8/TwBMhU7jH8Csb0UVYqlF
	gfEc2QSGh3qvgnMzfdsh
X-Google-Smtp-Source: AGHT+IGBEq/z6D6qnilsHC3+mDce/VGZCnHMT6t2e1BeXhqvd14hXzgZOEYBBCCaEPZH9/ztZFe9uQ==
X-Received: by 2002:a17:907:7247:b0:ab7:c6f4:9522 with SMTP id a640c23a62f3a-abb70921334mr1722647266b.9.1739952353901;
        Wed, 19 Feb 2025 00:05:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb8915db0dsm690660166b.145.2025.02.19.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:05:53 -0800 (PST)
Date: Wed, 19 Feb 2025 11:05:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7SwcnUzjZYfuJ4-@infradead.org>

On Tue, Feb 18, 2025 at 08:08:18AM -0800, Christoph Hellwig wrote:
> But that also shows how core maintainers
> are put off by trivial things like checking for integer overflows or
> compiler enforced synchronization (as in the clang thread sanitizer).
> How are we're going to bridge the gap between a part of the kernel that
> is not even accepting relatively easy rules for improving safety vs
> another one that enforces even strong rules.

Yeah.  It's an ironic thing...

	unsigned long total = nr * size;

	if (nr > ULONG_MAX / size)
		return -EINVAL;

In an ideal world, people who write code like that should receive a
permanent ban from promoting Rust.

regards,
dan carpenter
