Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF91220693
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Feb 2025 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134609; cv=none; b=SnTGnn9pJUps/6odtrV3tlFelrtK7Vz2naCZvURVqgErTJSL4JpYwJ9BydyxGCym/g20xFQXVjMtnRqP7CCcZ85ZLRKquXvStPhLvofO991gD6Ts8my6MXSbc9r1JY7ZEXzmKsE8zNII7R5xlZhLnBARzcGIBcBnMu5BRKZX4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134609; c=relaxed/simple;
	bh=qdLH3OzvK1/42fgpgk6VS8O1r9Vq7MA1XV5P6reJHtU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=A6AwgOiK8M/xB9YcnjWvMthlYtMr4ldYH3XU/4RnBxZ95v84LYaaftsLqCYnaF7P8Q3Srv4lN7CWi+jcwwAsKJ7fO3f/k0Ryg22XbK69A9dKKsJLd+a23qi93HZ3dNDq4hTOTwlrnBvTilNVMD8P5or6ZMESAvGG5u9DWMU5Q/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IooNAhTU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IooNAhTU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa227edb68so700668a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Feb 2025 12:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739134607; x=1739739407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KuItwZCBapzJpx0EW9kOwau57SuqJ2HfDFKxuI4Rba0=;
        b=IooNAhTUwcVCSg7N168G6Ft57s9ojitn9IYWkgGR2dQJeeKNdQNj17+kXKZASmMBTu
         hHktIpE1Tr/HU4rHN5umXaEGJaD4sZevs+b/JE94/pVzjixNCSKQv9BNNQMN0PuPAyRo
         IUgIbhFGpiFBeNe92/DlxGaNNNUyTNA1ia0NezRq1gXoO4XsRPZDUKvmGuXdtR8PZd0a
         FeQwmhSE2ORuq6OSmwl7JqfNn7QszsW015fYTG2Z+qQQN6TzKJ+37d8OThT9gnMVR0db
         U6Wedef/D85UZYX4G1+I/YsUjphOazqX7LdFVedeuKSxM59zgy1zdxk/k2OPXR7pFhkZ
         yUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739134607; x=1739739407;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuItwZCBapzJpx0EW9kOwau57SuqJ2HfDFKxuI4Rba0=;
        b=hguHvlMCZejLd38BfoXQf36dBA13Ff4siS49Qa/YP19Sc3/Gh24gxQrfw/Kk8SNFhT
         J7qzvweKlnQoZZM7JrlvQg8NvxHsfrsOV/BtyBSVStSLuICxM965SXSNrcVNXNKe5KmJ
         dw6Tj2hPMXR5yh+N6kyS6vec+PstRKpfiuzOE53yjdtFYWjg0nklQHKYBdS7a4j6/AZw
         sU6NVmSLTXx7FmonoCfuKj0/m+4IFVKx+25ea9WCKk+I9gXyBRn+sSnrxoyaQ/r2d1Wq
         w3IuAmsSgJ2nMCh6rkRkMc27++i3UZfoLtuY1tqTraSiWKuGms6ZO3/pIdbALA+PHNgi
         ARGg==
X-Gm-Message-State: AOJu0YwOxVX97GXlcxbVb8hayA3KQoY4UjczYdxujUrWToxZbLLUq61/
	PzkO00N9qplrS7UQls0g5OY1aTfVPFIUpOhg4qU+mrlIREUGv2GFG4SSrQ/auoHV1Zwz4ZPkRVT
	V63nqTgiIF+pfXM8j5Pep8ltAGiuZqdG3ZuU=
X-Gm-Gg: ASbGncvkmdH0BwnkYFyjGEtQVbzh4N4N5dWyW767kd7bPeDSpQiYHB/b2D85R+ACtgs
	Zljpn4Lj9dFHNMfL9ZN8TeHzJm8K+z0DsjLgGLocyfHIwp7HpY/rYjUNyv2vHGCaA0lzQfhIh
X-Google-Smtp-Source: AGHT+IHaiZev456cN22Fc6ooDsYo4rPsUTx5unsEC27CWLHXh0si3nKkAJEFhrKe4kwY71PuTLXY7QnIDzhZ7pEYFy0=
X-Received: by 2002:a17:903:32c2:b0:216:1d5a:f348 with SMTP id
 d9443c01a7336-21f4e758a83mr65689165ad.11.1739134607061; Sun, 09 Feb 2025
 12:56:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 21:56:35 +0100
X-Gm-Features: AWEUYZlvDbm9x9RRrKnGAlyXXZWTzmUOY1bXWfC4jWxeDYy8nIsgnkef8Nnev2s
Message-ID: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
Subject: Rust kernel policy
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Given the discussions in the last days, I decided to publish this page
with what our understanding is:

    https://rust-for-linux.com/rust-kernel-policy

I hope it helps to clarify things. I intend to keep it updated as needed.

Cheers,
Miguel
