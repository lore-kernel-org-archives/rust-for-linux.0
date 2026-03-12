Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B3305E1F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 06:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295396; cv=pass; b=gWBV1oB5liRDYD1GxgZz2gVxwJs2CmaOdsJZ0ioK/tjGFpXC6HULm+oarfJCOfTxL06TtawNtNt7HCc16C5zlSCkRIpmHTUZn3V7SvGC0y24//sxF/o+xVoKgUgkj99IkonYgssmbYNSclmX09SS9hOdpjnL/0aS4M6pwMbSeS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295396; c=relaxed/simple;
	bh=+oBB7oSL3gu76ZFznOdzZrgvR1lE4r0/R5vjiHzyszc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zd9zu7OTGrQe12DpO7hwys1EQt4ff8iir5c7nWN/yFSHfwoIMpHsmN7qjBPpo9KFLEblJ6P1DDCjx/kxaE6cvS/Sogij0i7chR4EuawJWcmJz4V+T7JQrDwMmd6KqYdlj1xYOBWqxKXvkGygS/nqO5p3QRWIrUBcAN74l9SGieE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GA/WBfiw; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA/WBfiw"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd5658b901so11716eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773295395; cv=none;
        d=google.com; s=arc-20240605;
        b=SgPaCpH8cUq9IhEw1i8AeKiiL2RGQGkXzvcoAPw09xYzNMTMbIblAOZb7Z9TUNzR5j
         GRcdDskpAw+4GSyEqcrEi8ezUKa5fe5g8OyTlDKRFFtOEZ01MTWeOutk59AePDEQHNsh
         dRj0z5smuVVT0UAQjZgZYik0lcTu7WVPTo+611ZTbouJIBSHr/C8ErOJKYRmVku+f5rx
         IJj7rmUZtKcIqx+2m2aovX+GVnE9I9iFkjm0yieWudXwvLYHhr3tu9v7tXJ2QKdTBHNh
         XUU5NK++uAv8T5Y6rEVkAjnGddHTGQtB19MX5VortXR8knzegMXzlQoL5ApJH5Ih7ViJ
         UfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+oBB7oSL3gu76ZFznOdzZrgvR1lE4r0/R5vjiHzyszc=;
        fh=r34qcgYaqtKYEMt5ZQjUnMjc8JsSNoniFWlb4HyAQvg=;
        b=JvAn8MCqUEz0OZJkjfFysBglI14YUCC+NOIYeQ7miFuZerIb14M62JNd52JLyimdX5
         eyVqrsoxTW0onebi/l2zAG2fok+zVexwV7X8IWWGspAzBt3CxJnI8Um2yqsAf1EnbIqQ
         U1o52T57Te/mO19oLccJxfrzi+1WqXtbPIs5AW3wJiQI8XbrlZgHRw03UjtF5G5hJm6I
         z8IIlpoe8nqAHeKx0W1613yWyeQV7l0IInBtEVNGxYW+4FGdEd7qk9LB2Y8D3dfBwsid
         HF3pcCILlDq2fR6Fl6LtSwRX8bjtUtkCRqNHbMCk4hFLzueVYrJjn4jl5FGTNt3dXHQh
         fqlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773295395; x=1773900195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oBB7oSL3gu76ZFznOdzZrgvR1lE4r0/R5vjiHzyszc=;
        b=GA/WBfiw9Mlc/fVaefVKQ5oTphsypv22kwPp9XeUkOTlRJqB/qCRwQVJAmhsHS8Y3W
         Kzwo6HisCZRnqhfpwHiu1TE4lkt6IebV0Q0VmzIHSgRsIfOVk2PxThOIqCoDoco8wEHG
         XE5ezRxKGxiFJpvd/yS2gtyEZjpCif29p4/5k4rPP6vbrZQJDz4DsVkWvXvVTCPuwFIl
         VPEuhCRaHDgZjd5yMXTYi1jQ6WSJAU6OPZHZZdP97tL/f3R8/+irIqikwvD8OX3QSLen
         vEtc7RY4psSMRofCRbCV/IOBnpc0StlEnrRDjhSexlFSjy0Jvi7TxFNEW/ZeSJJRBrYY
         VrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773295395; x=1773900195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+oBB7oSL3gu76ZFznOdzZrgvR1lE4r0/R5vjiHzyszc=;
        b=WFItWNWpRsLIue+PfahHtq44UE3LbtOeIF2swN/JZM6koOekiKGJqZyCm8ulzaLcM0
         JVm6DycLdY07njFw2pmE9mdH+GS0aMzY2ELubjARci8hfeaIfA5RpygsgE7e3XHzENEf
         qjUkMC5YOlpu5yOu5yHJSXLv41bCd1/iYDJbcgJgZpF8wxYR+rYEBbZmICJFqTgcL+ug
         gR1XYgLmnDpeaCVycjgKytAFE+vjPW/Sshf6DklCt3YlapbXcNSgLxxpiV66KuA/mFpb
         VBBfKEyAiRJEuQHsZXrpkLheYdmFPmr1VAaCHKN2OwbO50bLuC+4SqvVrSpBLKPDwvuI
         iH8g==
X-Forwarded-Encrypted: i=1; AJvYcCVcRbqX80GSSLl01hd5KDWtXGbltGivVHDzQhD3SKq8pFhvooLPI1QrZJxxwhsIpn5JHpGqpip9jasE9DG18Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5oGxaLLEJjXycKFJIcokrF/8eqWC49OBu0Mpl0071nslkZeua
	0ksBcoyPr8HLjICDUXhu9p+qI0SpFmHcgdig6uowQ0o7J6Mhuvezi9PtyI2w7UgTEfOmaNitiOa
	ZIKurhHLKeP2E2yP/YiCI5MHq6j+J1dw=
X-Gm-Gg: ATEYQzxOF43qzesMLj5zkillQ6rGbMhTO1DmbbkfpYf5WvMwZ/+KgCZ+as8hQb2jurc
	YJJdZMlt9RYW5hP1uAJ1nzAy/Ok3kbqOWGFN5EReW1aDiOgsBExh8dILzfFmcoGEH62o2xE90PU
	MBZlJWcc28JAgfKTJl87c11qPdUwoRRzXBeuBF1atOXEyY5lC8zR9goUM2ctgcmJIiWXNRw6xla
	yeEYWHqabhXrpV0c6p7XKGxshXgWgMfrhp1o2LoWfDNRN2nGaAqASH4cvDHTIMxiMS/O1vgolMO
	e83bTKIs4nVuThgiS3lmtOmCdQZJ11J+4ZM8U9gVDoGQGa8R5IN0BmkGp+c2DfDgfonGV76bLmP
	iK+YD5QRJq1ckyafE6CuGEI4=
X-Received: by 2002:a05:7300:cb0f:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2be8a5690dfmr1190215eec.5.1773295394675; Wed, 11 Mar 2026
 23:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312041934.362840-1-jhubbard@nvidia.com>
In-Reply-To: <20260312041934.362840-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 07:03:02 +0100
X-Gm-Features: AaiRm525bmoStQ4ctXWsBGXCIjznlgr7HjlOAbhdTiG5pl2QJtyapP-xC8G6bPQ
Message-ID: <CANiq72kYpm5xZ+ppWuSg1O8zFQYgmbuJHBYh4dpgp2c7=zJJiQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] rust: cpufreq: suppress clippy::double_parens in
 Policy doctest
To: John Hubbard <jhubbard@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:19=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> The kernel fmt! proc macro wraps each format argument as &(arg).
> Passing a tuple like (a, b) produces &((a, b)) after expansion,
> which Clippy flags as double_parens. This is a false positive,
> fixed in Clippy 1.92 (rust-lang/rust-clippy#15939), but the
> minimum toolchain (1.78) still triggers it.
>
> Add a local #[allow] with a reason attribute on the affected
> doctest function so it can be removed once the minimum toolchain
> moves past 1.92.

Cc'ing Rafael and Viresh -- do you want me to take this via rust-fixes
to clean the build log? I am planning to send a PR to Linus for this
-rc.

Thanks!

Cheers,
Miguel
