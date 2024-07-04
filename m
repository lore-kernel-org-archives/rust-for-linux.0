Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D271AAE28
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085187; cv=none; b=OeZ3kq/OuvK2dJOZhodc7G9sqvwohY+AWwzXpdxB5lC/d+BuPoMnC0/KTktZVfcmFgM5YJ21MpMTMpvEb5WPH/SiqCa09Nd3NzCeDVHiKqZ56A7eg6QHt0Y0T6dMBcVc8oBuFWxt0Knd3m7JdETybjm0IZ4W1ecpZKQS4ZzMiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085187; c=relaxed/simple;
	bh=jK4QiJYgMpqZHuOiFOYJ7LRloe0aUPmvOMr7gZdKz2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyXEQmFs7qr7pFklntZh9bw7Ma1H1CMdU6uJMqL8yDr+CjmeDj3fMPkjGuLea4nQcSZQAmEvSdaifyvPIUKNWTllQx8WnLS7+SQbvyuMtUzv+IBEEqqRZhOstcOu6UrsFLFLEYHlExV1tMkA6tpTHkE+0zpdaiRUtWbmnFGWQ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X1LQkm1q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X1LQkm1q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so2714705e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720085184; x=1720689984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK4QiJYgMpqZHuOiFOYJ7LRloe0aUPmvOMr7gZdKz2M=;
        b=X1LQkm1qIhKmx2cXHDWcmiIyZH7j1qfnh6QbGyfLyyIevj3VsoKYxEEr70fXHRrJCH
         GoMAeqoV/WGnX3PhaJMozwPy0QnS2FvD+MRKKvBTpYHSPtjW5hJY/D9I39Ribv/jbGXQ
         z3BJftDmqwarjuta1GYq1mO+ZbI0uh7B9tbhdzbJgUhNMR0zmnPIZ99uQTLTRe+eINea
         grb9FoSBlY/UasLH5qKn1UVRPYSLeqSKmHG9XKO9WREvZTJlszyRrlJzQ6o9CFwL40Xd
         Bo6G4HeM4IOq7nxQYJxDggaPIb1Xvrwf0CycQQHcR4HcPw8yO56CfchaRXIppmUJWdfw
         3pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720085184; x=1720689984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jK4QiJYgMpqZHuOiFOYJ7LRloe0aUPmvOMr7gZdKz2M=;
        b=is/ru/VQlm34XhvhqM50uGDOn5cqdtNCwffVr+pQV//fuYaHfH9F9QYGet+hC2cTsJ
         TpdtJivaHOQw7qZ8NzYjoxt1rYqqjeqnc88YFCmW77UGvbBcJzxTwr7uYL+GCn6uh+8x
         tv5W8oAkrtK1F5GKMyOm/Jk858jtgiBm0YaJuhk6ohcs8Rltv50ND3xhVVHzz0V+UNFV
         wN/I1boIAb+rhSCvNiY6g0rTSFEZHblccysOsVelvVsIbk09/L8cbCHsAi0XCN3+wHKU
         M2W9RB2NEXZbZNjMa+cwQK0oPNQeN1xhTCNrGpCmVXOlvlypMy9yOxHnK8PYIqQd9RVa
         6ulA==
X-Forwarded-Encrypted: i=1; AJvYcCUJt6uVz8iC6foSuoTC6f0Y4DwMTBcMWckLM0VfBzPF9wtwBkw/c4qbmPu17lQnnKZWEEnVHjAV7RMSFQfaJswcJQOXC9Gj7HHF2VQcf1E=
X-Gm-Message-State: AOJu0YxbRyYTEDumqAQUz4EE70OcFapMn1ie/mqfD7RzhqLbuuegcvvu
	OOQ+Nxxqov4gzul0CB8DUqNnMRWF9xdN9HTJoOhkVqaAc6INMq2KS+Mi6JITJHhsoW64tjuhYhC
	Xyk69vM2iXQe1qUS61uIcxApx8ZMFV8YpETSf
X-Google-Smtp-Source: AGHT+IFv88LNQ+GBGvy774X0W9nVuAppKr5CisW/ZF3NA8NQh92OFnzT9hs2dwXxiuMzIoeI82UfG3HBNYc2ycinAtg=
X-Received: by 2002:a05:600c:4891:b0:425:6f96:8bde with SMTP id
 5b1f17b1804b1-4264a44d7e5mr8270825e9.29.1720085183623; Thu, 04 Jul 2024
 02:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2dbd1491-149d-443c-9802-75786a6a3b73@gmail.com>
In-Reply-To: <2dbd1491-149d-443c-9802-75786a6a3b73@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:26:12 +0200
Message-ID: <CAH5fLgiyDsmG-YvsxvPPS9dAnKb7jJ2iapQQ3eWXnBPDOiA=LQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm: rust: Enable Rust support for ARMv7
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sven Van Asbroeck <thesven73@gmail.com>, 
	Geert Stappers <stappers@stappers.nl>, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:04=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> This commit allows building ARMv7 kernels with Rust support.
>
> The rust core library expects some __eabi_... functions
> that are not implemented in the kernel.
> Those functions are some float operations and __aeabi_uldivmod.
> For now those are implemented with define_panicking_intrinsics!.
>
> This is based on the code by Sven Van Asbroeck from the original
> rust branch and inspired by the AArch64 version by Jamie Cunliffe.
>
> I have tested the rust samples and a custom simple MMIO module
> on hardware (De1SoC FPGA + Arm A9 CPU).
>
> This only includes support for ARMv7, but supporting other
> sub-architectures in the future should be as simple as setting
> the correct rustc target.
>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

With the clarification from Ard, I give:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
