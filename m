Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E591D5ACE
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645794; cv=none; b=i1jjrWAwRbSMm1naBOMfDU8LQpXCrwiP7TXwFDj5ddBImTaKYwK7n+AxC/TDVb0lDb8ZzBZsrUpJQXI/9dotNNM8smAFzBMAbSHuHiFMcvsJVowezxoc7cUJ05TKvMvUK6kWmsFmJa30a6rRyJJpou3lOEcaZnycfqJavpd+ZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645794; c=relaxed/simple;
	bh=FgXbsPON8BjVPusem9QjMh23k1yZqq1A6IIZikaB0S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Swm3azVtHj0v/Fc7MRQ32fJGhC5xADj97v3woZpANfD6n+fijI4quis5slbfoGFYsh7tnvUILvndK5a0mP58Pzg//WUMEma/2QsPyQoCvTZVQUHHwVkWZ3ZbQuNfdgM5LNpV+LGySDxtWwZirFd39LpyH9O891R36FkvHQxrK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tMin5XGl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tMin5XGl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-618076fd48bso1646a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755645791; x=1756250591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FgXbsPON8BjVPusem9QjMh23k1yZqq1A6IIZikaB0S4=;
        b=tMin5XGlhL3bce/Ermqmj7VllDam3ypeLqlKtip+T1O51UFcplboDAKUiqRm15uIW6
         6n1Wp4Hy8BfPevM/KyWhcNpKLlIqMF2EjCfYNa6hP7rhYuNz9zXWqPPs5uKWx+7dYTfq
         mPBdHKn7ceVw1Pzl/pW+INxVvi3bAvykG7zSDG4bgN1ilCUXDbFCJ4vnyHt2mdMsMqCc
         FW1GWbYCOJY9kmZBdmoB1cOmcE2ZuVs3Utme1Hk6Q/ConSuYc436HRF24xfEd2JCWj8p
         zCi9oZyjboULKQwSGHu3WPprBupT1TNggSJOOJwHZA4wWufr6MF2QUQsiRsj98Yil2cj
         lzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645791; x=1756250591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgXbsPON8BjVPusem9QjMh23k1yZqq1A6IIZikaB0S4=;
        b=eEuGWYN/MHHmSoJXjazgtozHDfnTZI2tj4cBY/MdtN/iBsr0yClZvSMbaCBDeuNuPp
         MPCk2VNiEJKG6Hoozr8tmf6UR+Yi/dmHMkorn2AZJ3chn2C+W6KSBFEmFa+wlhfLXtDr
         XDeO/WFdzGLLJV7bzVHMa3LzOXCFP8PfhQqOfVGkH297lri+6EQ94I7qAs7uTHXEdl7/
         oZY14azlOtKrKYbZq0jCFXmWxvl/nZUM2ES/dDENnk55nLrHmWmZUpBFxwtgfAip05fD
         6BQ1MgNTYARsYumOTGGlnbuc4nxOiSSTcSdy+/FNwlHREC4b1d27qTGNedllUdZCL4/L
         6vJw==
X-Forwarded-Encrypted: i=1; AJvYcCXMl3E8diNfOnq84jNZrH6IpfnWhIWMY8LUi0mKuCnmve+z1ZLctlJKQBnKq3R5cZ1xtRF5XEHccCwzCMFg4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+6h6nbAWd2Lq5aJW9bXe3mqnYdqHmzeVQ2PnUrMxoF74V8Cw
	s8D6N69pTvN/F4g4tZVR+hTD47g2i6GJjHU+F8MW7hXpVCVKbXKfuHiqPTBXiJLJfXMP6QcMim4
	BPRAzJGHwO4I+4/EYOQx5RGjCbOq3BLb36M+79dYJ
X-Gm-Gg: ASbGncuJEAt6+eaAA7Ro39/iQl1ElIeTf/q8hiXWtfKHwlpTxD1fqjHMTgoUWreVX0n
	n1flGFSMBlQSV6jkUn8tNVuzyHAaqlkBGxh4rgJOwDmWAI5GC6BESliort4Dm5iXN9P2HDhCU+V
	8/sauJozHV60bmPHSIMwpbwuWb1Oeyo1HgpeOZ0OcrRczJZUnx2CPFZSv2InGFMamFMQSfeJa0H
	oS7ga0Kts2Z1ef+F2kp73hiQFKA4R7kgEQoSJ5wUuN4
X-Google-Smtp-Source: AGHT+IFSCLPVTfsBiaf24hTwkehzYNAWh1etb+0SGuEqrrfRehL7fLOqvcwLgHZ2cPcFG59kqvBg4cby0Sli6tYfTVc=
X-Received: by 2002:a05:6402:2089:b0:618:a73b:9cfe with SMTP id
 4fb4d7f45d1cf-61a9b2acd4bmr26165a12.3.1755645790860; Tue, 19 Aug 2025
 16:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-debugfs-rust-v9-0-92b9eab5a951@google.com>
 <20250709-debugfs-rust-v9-3-92b9eab5a951@google.com> <2a0f2965-af37-4ffe-8806-3bb469361b1d@de.bosch.com>
 <CAGSQo03meaA2fmoHqxdcVSXrKdE7yTTK0JfWH28mHZ=0kWoTzA@mail.gmail.com> <CANiq72ks-B--6UxO-VsPAvvqpKap7G7rSHxJs5gam0hjWB+vOg@mail.gmail.com>
In-Reply-To: <CANiq72ks-B--6UxO-VsPAvvqpKap7G7rSHxJs5gam0hjWB+vOg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 19 Aug 2025 16:22:58 -0700
X-Gm-Features: Ac12FXyOMFlmQPAe103eecrycpXODR3C_02-CqxCcXGkK8czg1euU5bo8OQ405k
Message-ID: <CAGSQo02NP0bBSuPWUXkhz0gh9y5A=X16UkCQb40DTJ6Qkm8avg@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] rust: debugfs: Support `PinInit` backing for `File`s.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is resolved in V10 [1], just sent.

[1] https://lore.kernel.org/all/CAGSQo03RGzmP2diL-vvLDZHduu=d4oFy8X46Fc8vg0SzE-XfDw@mail.gmail.com/
