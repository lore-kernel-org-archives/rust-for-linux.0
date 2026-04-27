Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C7327BFB
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302552; cv=none; b=Z63l8e79j7XnKAY+sYNxKRQoubys0QQP6/iPJzAsskVlFai6kcY4pMg8dCJfKGXTHpuBI33X4WK4/J+e37J27wW9glrIninoJgDR5z+J//zVO+4rH6QGpwTQwoE4xb5s3ddkxNqtpQN2MDgLKfG9OxzEh1FGHJrmpCf+qB+74BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302552; c=relaxed/simple;
	bh=lNKb4snvjqRMKQYaIpBcH2PhBjl9EZzLDbXz2fxIvOo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BuBAkDQN57NLSCiOhbanncmNjwFzzcfEyAjjwjl+t+Vv8gOw8vkPJKMVxbvfnhI0iLhS/No1XMLhwOpQMpjWfgqBzY5u5arMkIb+KudJyMoiPGLSOoeIQY5iK48h4sMrdpqS2SXIMQ9VB3UDE25R5CjcEzeDeSKkgUHlkwrmO4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h+yBYmj8; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h+yBYmj8"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d1dea12aaso754508f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777302548; x=1777907348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aZLrgPpUjEtLxFuX+Sy4zfRa+tymO29iiPdGcgeT0lY=;
        b=h+yBYmj8usWnel2J8pS30ighc6f+rDs7frusM7CUpYZFpbc8Z8Gg0COvPoFP5LZbvU
         e0o2QpqvRHSpvjrE5tD5wa/lI4bzaw+2Z0OO7t4j15vSLZTe9E69/5aR6WmLBKutCJaK
         Vco28xxrXB+3ZedACjQ+fO854KLiXWQ3wBoU1mCK77pjLrvUtuq4jd1eh5N6ZhezUb4R
         brIJOKCBcm7zlhiaPb0U6oMfruidQGjuzisjtrNyEHm/+l5wIdo26ImTDCV+rp3waK6C
         oe8nk+RG92TFlrAR941NXfMSKW3Np9ospsZ+CdXx8cLjZZG2HI8Mck85Oa+6Sh+fYbuH
         gbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302548; x=1777907348;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZLrgPpUjEtLxFuX+Sy4zfRa+tymO29iiPdGcgeT0lY=;
        b=gNVNhmQigvTZjmzBXqNgxhqhCWtvbNPvATkOE5qAmMjZBoyvYCkXFIlR9aUoa2IOPW
         Ml0a5UbbgKM5rVR5mpjeXcWRlKbi9kx4lmvX2Fzza7TG2O3alXH/Tw4Nyww0SWdRb5H1
         3GcjrqRMAOj9E6W5hg081/mQ9p2JSj6w/pN7CKhZYkiDWMl0/t7sxmN3Eg5v5ceALC1M
         n4y3qH7qKOJ4i4Nma+nRpm+gU0aNe3R9SyHtCuW+bndxnFR+adKG6vGSjWoxhWhl8d56
         MYvCkXKBbMb/OJk5ppM72sClD4lxg6AiaWoVscgxq49G5IV7Z7/mCUo4g2J7/lOfEdSP
         I7gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I01F0i3Z6JqJpfUEAsYzERPbkEX8TTNEuvJFmKFXv11GgBUKmOxuNGHI3AwAVjqLJpNj5hNfKWmVdwu8XsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLdDx1GQRjT1z6w2fQ0tC8HS9XTUb2XEcBSi8LJ1b708pGWKo
	6eo17RFbKKe/IZaWzWePj9wFl/tIziRyN8PwQjxgvbksXXvXnUisURHA51U5Vi0zXpeFXZtJJaj
	Fo81tpBJrz3wdHyhZcw==
X-Received: from wrfo12.prod.google.com ([2002:a5d:58cc:0:b0:43d:7aa0:a21a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f43:0:b0:43c:fde6:212d with SMTP id ffacd0b85a97d-43fe3e13d46mr67938941f8f.33.1777302547448;
 Mon, 27 Apr 2026 08:09:07 -0700 (PDT)
Date: Mon, 27 Apr 2026 15:09:06 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <ae98EolO8LU0rZ5R@google.com>
Subject: `Option::filter` in nova-core/firmware.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Hi Nova folks,

I'm seeing this clippy warning with latest nightly rust:

error: manual implementation of `Option::filter`
   --> drivers/gpu/nova-core/firmware.rs:391:14
    |
391 |               .and_then(|hdr| {
    |  ______________^
392 | |                 if hdr.bin_magic == BIN_MAGIC {
393 | |                     Some(hdr)
394 | |                 } else {
...   |
397 | |             })
    | |______________^ help: try: `filter(|hdr| hdr.bin_magic == BIN_MAGIC)`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_filter
    = note: `-D clippy::manual-filter` implied by `-D warnings`
    = help: to override `-D warnings` add `#[allow(clippy::manual_filter)]`

Alice
