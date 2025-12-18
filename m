Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2993358B5
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052612; cv=pass; b=K2aGgUjbmzv/b7SlQHf4j2NnBfQghZBGnKuxkjv462fHGloWsXnwaInoHdaz7/cfexS/58VA+2exG53UxXfh7hEQyg8m/GzTZqTbJTeT+p6/5Q5ujV8Q75rQxVHQ48lWTI2JhgbdWQLJsLiL23grwfEAomiGgYg0kTScWqFiIDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052612; c=relaxed/simple;
	bh=NvvEhEKg8mBHdLSm1cbmP51NE95Day6J419XJmG/1Bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1Bt6N5869WQ1jaehElH0PcXhkQjIuttrUntyxZ1NtJkyEetx91M2gMMwcghqv2d8PbmYogFNNZogU3qdH+488l169Bqyv/NhG4w+osTpBMkwWlYIb2lmJ7+ORAI6NywQNtQHcylPrradX6k4nsvdhqEYV/3L+CcLFCcpv3LeaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9yzVlSu; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9yzVlSu"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso15657a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 02:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766052610; cv=none;
        d=google.com; s=arc-20240605;
        b=LbSXfrvZRZsdS8gRGmnek9ccqpOK+gH5C28yRKInQSGKv2mfpKpEROfIdW3c3MuE4A
         9NSrkLx37XzfWt7dFmfxjbJh3giPOjCei3BTc/79fr3RxbNALGCHq3SXRZ2qAiGisBNe
         2ptwK0mELeeY3QpFMkUdIH3Ybr7cAdph9hFBYQVH7raIOfkKwFYxZqQnNWS//PM0lklm
         MuJA0EtDcdgnZysqLoxMS57DU9QN+KrP4NBMBH2w3rIP5TfwraN1mWpKNKWRW0+hkDnj
         dOP01YBEZtW0miYXoXhDFJfObRmdM2MYEz0zyaQkW/u+DizLLLdc0BY6HaP48JtWC+oR
         Szyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
        fh=/0nd1eLlZITzk4xmCwNn5wb2yfeACACgnuGrVoDTQpk=;
        b=FUpsH6W9lLb9cxFwxz62VGdW69dZDeCkdnrwZ6AZJsthFBZea0JXWMjcZi+xHGRwPU
         ilFCdMvtTMtdzBwgcfyv2Bh53w+h8STUAoIHoev2YM4+6xcXXHwAZJ9ymLyPMh7xYBYW
         CaWH52OVFTsqYd1CzzuV/hDsyV6WC5k4reN+v4wIDhYhaokCX9T4LXn/xwDIlithbXzl
         IPX6+1h2NZcOHnT7aQfOlDKR6doBhQEp4OSwGRG7/FBVx9Enzd8+P3gkPQzzLCKhcX6J
         gPR/KO3hPFZqAVSCjRPA1gfog4lGgZD3b2YVR4tmgD8gweL0U0DKHUGs97RIvFrp3k/o
         NBow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766052610; x=1766657410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
        b=R9yzVlSuQY6LrT7RLTUsj9JQmx4kmFkeXTBt9Fa2zkrt6Wy9O8SUouHyvQLTy1IL+J
         zjaEHJrI3TWQTD4EXbZC5mtNcu3U3+8/TSYYhBz6boTf7tVcDoQSVmC0GMy3acFxaRbi
         y9blAk8DPPIYS9AuzitOYOMwO33aJJjiP62MINMWB/XCPROXb0IfPRcRxy2S96vpN7LJ
         OOKtiQEPoJS8YScPtXsGi9NDtLHVwNsamg23YBs+I1A2gHnhrU6d8PAGktPEe7ETBGhY
         X7AgNCeFlMIZCiZkXNAVu85C2R1v+v7dcyG13FhwPNqfteGOJG3CSttpkAF8OqOQJmDU
         w3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766052610; x=1766657410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ShMd5RsgoCCs+7pbJSDKC7+gIM3DjjQQXbLBPRzr+LI=;
        b=N+0VX0M0ObRj7CSNElccIp32YfujvSYkJr/j5cVWWe0wRC4o2eitwyC/c46JA8Z9+R
         m4Az3Hofh/PJCW5rzO73C2Ix+a8HM5v2d/arAJ0nabkYA+sGiR72dcTRl+uMiNrPQG5A
         Rab3bgKdFMhDHaN3/1wGx2AFGOKSW8WTCL9nSo+wjzbREMgAPz/o2lWBDVy7kOMT/pUV
         4ss/3Pn3aSyK8yOB6fbz89OD0LFiMY44d2ERYl3hOjZjnVtpcVsDK4nLOXdXc3KIju0Y
         bb+omR6F6ALaqFnehmJi67Ha8vrLTDlx79XVCtlY/r6hmRqx0SdzyLavMJ3LuorzUEUq
         cUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH9BoVN9Qpb0Y2RXOwz/EJL8FgVo+9nYwGK39feJvEIbcfvEZjOMIhFLRy+WyY2gKgTAU50bvD098mF13NxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxivvBLEYvRnEBtC1wkX+dnEbWQWWcbB/U46w8Qqu6/ZEdtA8R1
	k95piKo5zXkmlrfoyRP4ZRTm1jR90pyNaQ3+EdDPtVVQ2Yzy8T8uJMLdB01fJUs8lqfNiPfwcfp
	21lBDdgtwLJzNOMH6O8R6MKUYQ1AlGq0=
X-Gm-Gg: AY/fxX5S/a+T3gAYpOjaemNqSd+9uPKy25OMqGzc/vlRYczkOEWDPZ5y1L27kZj1FKU
	LCUWM2dRiMlo8GrKs9OJ6FG1dYty7eC3LZd9ACBAoYkp3c6Wc5zZaON6SAq7RpSXVmZqpq3AKvP
	0YLVIzi+AGXj3ywV4YdK7dvGG09KNx1kLXfWar3Mb2u7tksjXGOkxsOjaxuzeQn+DtAsyZFJ/lq
	+Cd48HXOF4wXuvtpBnp92NUk8F2HIyJh47AS4ihUlPdubQvFzZeuwbpsDfhrRHziUr4WlD74QUQ
	HNcuOIUx9bdWPEdNHAGFWcWwSYWAk8fFFIbUsW5v7khMo7M5OIZ77uWx12V0tLwmr66uF2nzkXK
	vHeOk5QnYMMxgRw==
X-Google-Smtp-Source: AGHT+IHQbBEe6RbCdFHu1fn1QiVN/swj/9ZD0sCwj+fIRULQ2zfxp07+2Vth/JPcNxD7+ZtAGAtVuxSS0clkJ+Xv/rY=
X-Received: by 2002:a05:7300:dd43:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b050656404mr698153eec.5.1766052609822; Thu, 18 Dec 2025
 02:10:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com> <20251218013910.459045-2-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-2-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Dec 2025 11:09:56 +0100
X-Gm-Features: AQt7F2oLOGrUtKfwwSjj0SjFhxy_KX0J4BetzT_Vf8Xgjs9LtDZc-yngX1nri3c
Message-ID: <CANiq72mEsqgyHZoP0gA-Mev0M=TrgKFruJTACfaGW1DgDG5Lyg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] rust: pci: add PCI device name method
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 2:40=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> +    /// Returns the PCI device name.
> +    ///
> +    /// This returns the device name in the format "DDDD:BB:DD.F" where:
> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)

It probably looks better like (i.e. code spans + ending in period):

    /// This returns the device name in the format `DDDD:BB:DD.F` where:
    /// - `DDDD` is the PCI domain (4 hex digits).
    /// - `BB` is the bus number (2 hex digits).
    /// - `DD` is the device number (2 hex digits).
    /// - `F` is the function number (1 hex digit).

> +            // If init_name is set, use it; otherwise use the kobject na=
me

Similarly:

    // If `init_name` is set, use it; otherwise use the kobject name.

Thanks!

Cheers,
Miguel
