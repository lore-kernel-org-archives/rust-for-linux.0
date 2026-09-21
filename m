Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71730D3E5
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 23:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033944; cv=none; b=fif2/+jtkEkTlW0hd+qEFkt2XFsnTMpAeCM75gjIH4J9HcEA+MV7zNntNJsVi0kbGXkEKGI1Muc/bG5gozycKtGxJr5uNlnvYEcVRD4knmh6LGDD1vsDL2qMT5QVGGyUr+P96pbl9uORQWAvIAA+3ovSuVCQgyKKj3ZwXSvxbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033944; c=relaxed/simple;
	bh=Vi0byBQ6eTPn8Hm3DwBTt1QuqWUnBnxfF9vYCnJkVaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uagV8xTiZBslH7fnacnqXy5iL7S9SbXA189V8mti2mH/s3c1HdajopXiAYwg3oNIsfjkX0WQnQ2ZtO6/K0sqf8gI+Z4ddayb6B68lqI0M5+ofI4Lau1AaYSFJjxkwRgpRvn/5YiMGZl4QK4qH9QCCopI5BJunSXYkHTA5iMuwqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dq9i+0yx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dq9i+0yx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so27455ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 16:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790033943; x=1790638743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYSc9TZJl70xsfiMBgdeHeiAhwqgPx8+5Bf/0PtU6RE=;
        b=dq9i+0yx4OjldeB0529SwpiRmpsSiXuJn0XMzfU8hPS0n8mTZI0d3EhPzuy5yjtk+D
         1bbf11wNsuKl4N0ZDZcYjkXry7OldA+Q3mIx+ZVwOqZe+ET/4p7ZlF/A12gL1HsStuuR
         jfpyoCKDpLO7W4Z4T6UgwVY0Z/Irs9mcNyvvPG6p92UPeqU3KJiS0g6yy+TPQCdjlv36
         eo9dHh5tIcgt6iocGVaKRwrOPeqimjr0Ddal2Diuh5EfzFsD2uQXlYt1MF7pkxZSFO8x
         voGBe3XSy/NuksrU4jyK0jdPN9phD2Ddf6ejWJFZEb43kKIXqLN3P/Q6bTnuGaoF36w1
         7e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790033943; x=1790638743;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYSc9TZJl70xsfiMBgdeHeiAhwqgPx8+5Bf/0PtU6RE=;
        b=gRwe/H7sC0Fdcs19ZJmZy8xVpt0jxOr+Tl0BNZxTw7r4OrxhU255vH4H0YqxEPg0MA
         J/jEmVS7vzHWWET683oU0B/ry9ArwoXE/Vwq/E7DuJZZVCMk/zWmIbg3jAxxQYp0lON6
         lVdJueU0dZDzC1AedJ1IV7N4qNsK1p7+3T6ehlEEIrOVYOS4liC01czcfXt4/Oimzz6c
         dufz+0KP87W/t86hIvRhTVlcBizQ09rV9F9KJCvgWTuPV42JDEvMiB/tvJRF8fK5ljVn
         FFOYb3VhkpXR1lfkv8ZUBe4Z26vA2b9dkDNG+TLGJeOfzNJPEmfJ1aaqW3LQbvEkxYza
         OYVA==
X-Forwarded-Encrypted: i=1; AKwUvBwM8lxccLe2pVf7Oze29eVjxV1b3FHCm3Mg7kK8tEa2lb3/XEuXf1PdwWi+fN6EIl4cz2NBUcPMToyfWXzQQg==@vger.kernel.org
X-Gm-Message-State: AFuF++lUtpab2/8hnA/LmzIvGjrdcUXiCQN2sV48ESCIgcNbWsEbrc3X
	FB79WG/H46yqZez35IsKtN2kRHJbh5DV79/hnckluNafElfUgYagAJa4DivchhEKWg==
X-Gm-Gg: AYBFou1ALMbNhOW4Y7AG2IMKlgZWXQww/oXnQWnGfTXZaIDyBFhcBck7KmBRik1c5jg
	basa7LoLDHMOCM4mns/+YdJdGVtjjNf+q8OXzWV4ygl+e4h6IcqVMaFf6xEEZkmxxfdHQy2RJdP
	SVrnlhIng+cV3O/4QvxovbX5NAtHbN4PLmgzBl+oSVTgtuxx1jEzl8NAC760ipRCP6v/kOlEsSz
	Cp2HNQV9OnR0OArKMjkfMOdaHbfEe5SdJHL79htHAE7pnheQnJbCwUBAKcxaQ+8XHXuC6JfIGSr
	n4bSigpuUzYCTFJukHZOlJarLdkepKzNoSo9lQQlnfj3l8QeEgajFeA6e7o3m0TVuWB914D5DJR
	1ecEdjqCJCPis7N7MGV5ovTQHGDmIUDPR0PxO5gFAjK4ldPFpiVOcqLSZ+75FqtHhV+7kK8T3N6
	GKU/lZvFdaX/wvlUZv8t03nN+PHFigg4fuWNyDyd4NSiT9vBuqtanvLFAYYNFG6Lj/EDQ9cwnjj
	PS2cNCN5KOhfYl1gXQ0zAk7VOzkD0kCx1TLw29IdXJG9cpZfx7SttsARXv56IpkxG49Ov7zoD+W
	INZrOfrafwxnT89Eqfm9ja7n9tOwuSDfDUaeveM5ryuY5PM=
X-Received: by 2002:a17:902:fc8d:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2df5b83635bmr2369315ad.15.1790033942078;
        Mon, 21 Sep 2026 16:39:02 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0691fe5ddsm1049674a91.3.2026.09.21.16.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:39:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:38:56 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] binder: use irrefutable let patterns
Message-ID: <arHAEA0JT7T1v1GR@google.com>
References: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>

On Mon, Sep 21, 2026 at 12:49:28AM +0900, Alexandre Courbot wrote:
> Replace matches on infallible results with irrefutable let patterns,
> which are available since Rust 1.82.
> 
> This removes boilerplate for handling impossible error variants.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Thanks for the cleanup Alexandre.

Acked-by: Carlos Llamas <cmllamas@google.com>
