Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC72BE03D
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057890; cv=none; b=lty3U9zXhNHw6bjCdxFcp9yBTaUvjP6gaJm9i/jgT1+hW1vFUZyikqlwI78JTeBmQca6qroTvF8hDtQwhAtgGeH3vi+DGWpY+HSDWflil5uHrKMeZ6IrxVzkZUfTukEHvPeUynu3YjfLYr/oSzjU4ppOVlh1M6uuNSTWqnat/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057890; c=relaxed/simple;
	bh=/V/PESa1UG40IFNH+8B1pGFRlRl6nogmYmF0sSJjJZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OI55899qvh3N3aTgtfFTBPvghTC2mKq2HIcAex/DkwyxYqxmFE1Thp0mzoE2pYvmCyOjQPx8DGq0U6s2TL8uL/PaYtqzlMO6sg8Lc03XuXSERP2t6Qz3tRK24lDQmfa5oZBP59lPxHTFpHtdBbnAlXQCqY0/rFMQS4ZSkqBnB5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xR89nSPj; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xR89nSPj"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779da35d27so4744275e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766057885; x=1766662685; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg5bGQtv6vXdDtjNQ8GaT7V3as95JX1KPyjYnfJA4vk=;
        b=xR89nSPjRCjg/lJlan15g73hui5H6FbyY/KGSrJVttm7dzcjnarV7msRt2Yfc6uNY5
         lZ3zJFGcrayFt6s8nhKBKTTLFgro+OFSGgoXSZ47PQR0SW0cL/STOrG6drbn8b/1q7NA
         UDP+QunaNlRnlzDb7wm54HJjfXe173ygKkqHHmya6kRYwNB5/k0Ap1L5rvk75Dr2M1IC
         O+xZxStr8qBDohUwWmQLPDhjL4UyO5y9yYegvEn1pG8DOzt/rub3WiwnkMEw8qtg5Cgi
         hOzrHtOYqJi2UWmNX3+PAHUz5xacAYc5UWz0AcdNxRWsT4VEJEbC/0/cMPk0uWixkdjI
         5ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766057885; x=1766662685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg5bGQtv6vXdDtjNQ8GaT7V3as95JX1KPyjYnfJA4vk=;
        b=rj78AZCM2u416gsNh0TFCcNUwGC13L8k3+L/1wMSxYw87/GouRdm6J4mk0fcB5vfSy
         5uIpIwDsR5iusJpy2uI+Guyf2m+h77/omqUZAHphtejVJdIUqqTcEzNQ8Z+jzjuN6M8d
         jGv7R15KD3YTAHvpVNaGjhbpnOe4s+Y6rb1mgnBK7xTD+Y4jQOlZcxN0jSCB/E/ajrYL
         qaq3lRWd90XomcPFwEb/XJo4W1kZWJrmJ8gJGB56UkvwH6nJqFNQpazl5vhfpYcM2Lrb
         +uHKBOI8CkN7ZHJQfP6JaQ+xPo3+/OB1awM++LK1C3LIDuSZLpUNqkzQbiUPAUF9wmk4
         dPAw==
X-Forwarded-Encrypted: i=1; AJvYcCV9uFQzCaJer7JdQXZB+cDS9bxZRg7rjAGEkbd/6ZoKbenUALPWnwXCJqNVicYjM1IybTlvHBavVc6DpghD4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPyzdbsKF73A3zm8O2RDupK+iaka3SHj+RqT48rLi+rKO3TNx
	05A4oMBNVHuZ6GB6Tle9Y70idsp4MMP7LnnQh4HLPWJ9sBQsVrRyxN8QUDmkCmtMVyl+C5qOnRn
	bXGvRmUWN7qy2AKKwIQ==
X-Google-Smtp-Source: AGHT+IFsUDjfPlHkfvJ2qKUTetnx6+dSwEmlXrSVbECZdQVmhtUFGLsabqyFO3WrhpjGHNV/SCH6VTItq2poEOU=
X-Received: from wmcq14.prod.google.com ([2002:a05:600c:c10e:b0:477:103e:8e30])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id 5b1f17b1804b1-47a8f9145edmr207476265e9.36.1766057885422;
 Thu, 18 Dec 2025 03:38:05 -0800 (PST)
Date: Thu, 18 Dec 2025 11:38:04 +0000
In-Reply-To: <20251117002452.4068692-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com> <20251117002452.4068692-2-fujita.tomonori@gmail.com>
Message-ID: <aUPnnL4kg9yiWtZn@google.com>
Subject: Re: [PATCH v3 1/2] rust: Add support for calling a function exactly once
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 17, 2025 at 09:24:51AM +0900, FUJITA Tomonori wrote:
> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
> would be possible to implement the feature entirely as a Rust macro,
> the functionality that can be implemented as regular functions has
> been extracted and implemented as the `OnceLite` struct for better
> code maintainability.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
