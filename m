Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D912FAC0B
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207882; cv=none; b=nyJIQo9c5Xz9L4lAtXYvt+8ys9ti+YbD8PxRCD7gOTFcgkMXbdDxokeZcMNC/lLpOwO3HGtSJloy9qtOfdY9AwUGsGIp25+R6XSRAKf1jcEQ9P0/JbftwPz6UH11QqZ7t6fn1tgFsqzaWVIoF1z+Rekrz/wimMAqDx3LRtU8vr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207882; c=relaxed/simple;
	bh=mPm/G6LF4D7ftdatB1aDagh6p6TkQy5ofCUYvdeEZZw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UPSxHPPsXWJiubkpeHSChlEsEgYsa4NoXnCZMHfhU9j4zYcWpPyqLLuVvzh1mgTvHxRtPxBCQSDtyr282kJCOm8CZfBC5s9/7MdcvphYRrnnEq6d96xh+8KEs4oAGJWgoGI0GVvH57GVmJATUEE1cLyWqG8IHQBKqxka2w8Eiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gSgWDDHn; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gSgWDDHn"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-471144baa6bso2178395e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761207879; x=1761812679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWL5Ken7nj71m4OC5w42brfuU7IImlNx1mbsco2vxt8=;
        b=gSgWDDHnJGYmwGIdrypEmDfwxnwApsgt5olDxGaNmLchNQkxd3U386wYSPuwGuD3Wb
         lVJ+VIGL+XENccQk2WSCNOv+dA/KaGobnkX7/wehuacDNggG8592qIellNTkXZ6uwKCi
         6BtaoCWE9Dqy8jKV4QnYT4KedW4vEpzFXDm4WbkTbg2MmRg2OKyQT0xzqOw7Dr/dTmaL
         hjRIC7/eVY6bRTOG2dyVGjeFdZeG7N4d19j9NRT88eiDDHzrAYiEhvQV+pMGnKC5kI6q
         NUKCuhKB04gqEXazZ63QyCLQi/n7w/bc5HH0qFl9yI1KQgU6Ymxwl6iasovtNsHolLnJ
         S27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207879; x=1761812679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWL5Ken7nj71m4OC5w42brfuU7IImlNx1mbsco2vxt8=;
        b=RtHnjSR4nLsbsUDdxwZDt0Z2W8UVVazeKZGe2B2mNeiKK+9WjbmFoHKd5ixY0QY09i
         8Ht3MRWvGS2Gw7fEy7b6tBlxNdVpmdu0AVS5lR/4eIK47sLPM520sUi2Bp/HKvs5zGOk
         m3iPYeHUmRhGXzPxjnn/B8ZhOA5G9xVRLsHNLFL++aX339QB8NqxgjRjLLk3G2Yb4fd7
         TNmY6ik/gLfxwRfJbeg8hcupKP3EWok4yc9aUwfHnElo0BupjaDZAN1B9jWiLrH7BlDa
         DNdOlh6laxZELTZZXynMo8Pdt9lZvfzxd9vgWhYUoew+H6MwuuI+yRfnMlbuqXr/j8BH
         G17A==
X-Forwarded-Encrypted: i=1; AJvYcCUdkTZqrRqYAKllZF558nO9qQ75bbwsgPRJph4Wr1xJe0Z0vOvwcMmxgZIvXwNS4HBRuW0T/xQqx10IQbiHKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYchNnfUU0c4dt28LZkgIzT8tnbN3DNvRxlNkVZ+N5313o9bya
	Rx/NVbF+bk8EZLTylKW5ZgHav+C20y4WGirCS0m23AUaj7rUq9MnG830sh6AF1zyHGIS+2PVVJF
	/UpUTNH0zCHZ9cADrnQ==
X-Google-Smtp-Source: AGHT+IG9CY0EOkHtRRihqXWBOF4xpRsbIyChrOM1QL3oPkUpG+EWq+Zl74uct5FqSuMTOhxCZDqRJe4FTo9EuzY=
X-Received: from wmwj10.prod.google.com ([2002:a05:600d:82aa:b0:46e:3212:7c8f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5299:b0:471:95a:60b1 with SMTP id 5b1f17b1804b1-471179192d4mr213973515e9.32.1761207879258;
 Thu, 23 Oct 2025 01:24:39 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:24:38 +0000
In-Reply-To: <20251022143158.64475-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-8-dakr@kernel.org>
Message-ID: <aPnmRmTHLQn8FVyy@google.com>
Subject: Re: [PATCH v3 07/10] rust: debugfs: support blobs from smart pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 04:30:41PM +0200, Danilo Krummrich wrote:
> Extend Rust debugfs binary support to allow exposing data stored in
> common smart pointers and heap-allocated collections.
> 
> - Implement BinaryWriter for Box<T>, Pin<Box<T>>, Arc<T>, and Vec<T>.
> - Introduce BinaryReaderMut for mutable binary access with outer locks.
> - Implement BinaryReaderMut for Box<T>, Vec<T>, and base types.
> - Update BinaryReader to delegate to BinaryReaderMut for Mutex<T>,
>   Box<T>, Pin<Box<T>> and Arc<T>.
> 
> This enables debugfs files to directly expose or update data stored
> inside heap-allocated, reference-counted, or lock-protected containers
> without manual dereferencing or locking.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
