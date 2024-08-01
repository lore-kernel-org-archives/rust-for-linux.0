Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D22C8BE0
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500489; cv=none; b=E1QDYHj+ysTA22chDkzGTC4LWrYPCY+mkJHRqt04i/t1JHB7eIn97lWIWti+a/kiF1LBcIPymT0wgEcMuOvhvambOB7ab3tdtf2L4RdTLhsFqEusiYJJYOAc1IWrkYPFXaiJyDBz5UKyx9nL0uwLce7hXKWIo4xzIg8u3rsNSUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500489; c=relaxed/simple;
	bh=Ift7TzORqGbhU6p7sF4Zt54uNnequ529bnGRDSsXufY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSSFNQrTFN9VcEzB3oPEnSUftYL0rfTzfqRP1iwZnG2FQDUiwqeuPevA2kRSe2iZkdX6qUqZbOFQnkOzCmfIwC1yBsawT8JDwRTKkefAJBOmE8opsdMcfYQ5KnSElRF9/sElVdY8I4Wk0663wKGv0ZlLjknEnzdG7MYq+9txaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EctJB/Ob; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EctJB/Ob"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so83335101fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722500486; x=1723105286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ift7TzORqGbhU6p7sF4Zt54uNnequ529bnGRDSsXufY=;
        b=EctJB/Obzxr2KdykbmB+JweAyQ7/H1sVewc0je2iXZYPRd/EUTjZMCMPW+H9L116vE
         UmSPiM+sg+qb+PlNOTUrKgchITs5rVE6BJ51vQc0L5LjkEhfEUHIbKQGO34SMzVIheOB
         I18ZpN6j01IsGWhLAV9Dq75xPio5Q/9PByE0PCpqlegGDvhasYGVtT/S0tuzhOwcZLU7
         OScqdMZmcdyXpaPcNuEHoshd9srduKa8Jp+Irbe5ZLtaf3BMiMqgbrk6X6YbM44AFPG1
         26Sy3MSZGAhaWV4Bg/cUyK1RyQPR2FqAbaDfusSmyAcIteyr3WyREUbw1RyEWzTfNEmO
         m+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500486; x=1723105286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ift7TzORqGbhU6p7sF4Zt54uNnequ529bnGRDSsXufY=;
        b=jEs+GGopGN8ecVdImHvN+k1cCrldmc2tfRx0TItx2aKmWALnT8NztHC3d2m191dTNb
         CJPBU3f0h0elYvQyP7X0qHNjz/4kdsYyKfTYE6YhS9/iXVRIfn2qh+XKCA+oBznab/qb
         iFYOQvM1T/C0sPfpx9UElTEwIb4OGA7Ev1DMtn3+aPQUSrnRleXvdagIRAXmoMQFTQiN
         ArnFIsn0nDm7UgoglxMduKKOZBXPubZvzktaziY/A7KEq/tI1xQy+BF9S7plMhQO4srE
         QmbkfI+LqXI2xOH0NbIShEFrTMbw/oPOjTb3Nv9I1CEzzM6XxTW7fY3xmXPtc2GNpmKy
         2IWw==
X-Forwarded-Encrypted: i=1; AJvYcCUvDnqHBcuWZ2+1aC4HPUf9m423As/C2CTt88FUp6x72XjHD7BKLSHwZlxWh7Zf26wOpiRfEBsEE0Kv1isJ6vXtca8reH97Lzhj/HcKRIQ=
X-Gm-Message-State: AOJu0YwaPrDFL6LMYtHZJQoAckTFd+DUyi9pc+nwEj9G0pNA39y8K+Te
	v03y51h89WprJnrRNLrLmZiDjhX66aDSYGHKwWHMpvLpeXJ6qlWJslVRcYvLmCtA+ehnrfMqZg/
	ss8hjXy6+MQSem5cBWi0ZCzVj9bu0lJlp6Jl4
X-Google-Smtp-Source: AGHT+IHsR2voflQxRCSCFqdxDUx0/w3yBaqi9tYqoopje2/QUhwqJ2c0wR0BypuLpRopenPqhbkO1ohoFYuhjseiL4A=
X-Received: by 2002:a2e:9b84:0:b0:2ef:1f51:c4f2 with SMTP id
 38308e7fff4ca-2f15310069amr12958661fa.14.1722500485934; Thu, 01 Aug 2024
 01:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-3-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-3-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:21:14 +0200
Message-ID: <CAH5fLgjQ49HUngZx9vxVNWJuHQzYWVTnrUT7xMxvNNKRGaD4Ag@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] rust: alloc: separate `aligned_size` from `krealloc_aligned`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Separate `aligned_size` from `krealloc_aligned`.
>
> Subsequent patches implement `Allocator` derivates, such as `Kmalloc`,
> that require `aligned_size` and replace the original `krealloc_aligned`.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
