Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07D3A7829
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938938; cv=pass; b=sacIvwvdUhpBA225QXh6X/eKuEXp/wxXMMPVEerPuCHM8oJJ6TTJ24ysucOgAKG6k5QcLxV7FjZtL9jFB2zSs7jlSAqUQZgVGyrx7c2M33ukaPxvORvqGaPxUS77Ju2IjvzuEMG9O9T6Se0UW7TQBk7wT9fYo0WhvlqayzH5/aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938938; c=relaxed/simple;
	bh=cz8lG1+IXiss82S0j77suFZyGFhOFBQYPCGUQ3n8HnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6I2UGWPmuakrOekEdw5i2iUH8wM33HVpcPBcGuXroBHjPndmagh6NgUrrsU3mQ6br7+UtizYXaf8dk3m5pd5vm9CyxAmx+QkBry5m+GSZXD9v9ZxRqjPqd6M7snll+9aYUjNFaLpkhLIMv3TviQYmnBC4S8Baxe/9/1GwdEyzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf4zk8LG; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf4zk8LG"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1244bce2c17so464325c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 11:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768938936; cv=none;
        d=google.com; s=arc-20240605;
        b=RMYUPyCTo17qh1CDeBJNwMDlueH5oLPsxDG6hDYau1pgqYaEB4Vabzdnrh4rNrptm4
         //ta1IaF8dhsZorS72ylFQDiY8ifmIv6RCJKuoHkXxtqAlG7DQYHbP9UGcOmBIYXQhfz
         BtCsQnbC4rNHBoOrjSt6++RAhbW1fBbTBOaUXeQyfqPXZb55a2vCoFBKuiCpqZ2U2Djk
         ULUCX9oYCYr8JJJnLsAzPHgfi0roJf5r+4gtv7/U1ip6KUoGiI3d9Gonfd0kkSpu0+2J
         ygwfxq8M+94qP8mf4RmmfQe7BO/yjDxm4CyHP8CqR5pQk0ZMAGahwHwO6sqNSLnu6p6R
         Nkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bFBg+14denhpla9A6q5Icbqf/DV0L1pwK7WKO8lmnmw=;
        fh=W68lAMp98JdC5Ifcc8ig3wMnp3WtiAeeGbkT1ZM1p3s=;
        b=fYJ37D8QeG3EXmFfmao0pg77A7JlvNARuu4KwklouBmY6mrpLLZJxj5kOMGYyVMe8g
         wU/Iz++hQll4QsSDMnFDZkuT8gbzIaAJXxUyjJQ2spW6dPxIajywkxiRIQhZ0tnQSCWH
         4vdzFypFeJbRaPKmQsFjMRXvX5AQZpadd4tAFmVkrIMlTOAvQsesEqFoSb/YvWigy6pL
         0zLasc7ggXUMYXGPD2WbpwYvc/xsQHvEmstrdnpd+TtUTfcXbeVXp6O9aqIfTUhuJQxJ
         kSP7/BSHbKKbA7bdV30opE7MvrAdKCljC9cPWqO5vhYUFspnC/WEWydNFogzszKC2GXB
         X6lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938936; x=1769543736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFBg+14denhpla9A6q5Icbqf/DV0L1pwK7WKO8lmnmw=;
        b=Yf4zk8LGfyE3qcO7QBFI914qRRwFp/KjVQ8KajA02qBXyAU6fLLdJ/h5E8Y18+6Q36
         GPQ28KOmx38/RaNtRoxX/REP6qV9SAgxiXsDt2K1/yR6+bsrmllVQHOAtKKyatxt8371
         bahcLR9P++lLzJ4nCL6QlF5sBtppnuKwc7+pSIs3aHX4HE1rUnZ4Qxl9gIZCUS+qywCC
         GNyWlcW8dCXbZcMfPzW01vbWN8LHUVmAjNePy2J4uJ0/dAW9lQ+Sl41MPk1DQjG2hfc/
         Q1qGEjVJqaKE29F2iYT265QVYOwrsSFoSHCeFfjfy9SumR4ZM1WxzTVLviZKAXKVITyt
         U/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938936; x=1769543736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFBg+14denhpla9A6q5Icbqf/DV0L1pwK7WKO8lmnmw=;
        b=iYhpyDa95aGrJW7vzWsATVsn6Po27WmzwOf7jcOikUdnZ9as3cX+/EsfmKv2jN5RQa
         A7g+a9xRButaRiGQZARCv03RAanp2jmpAs7eiDvvpkNrHzPymF0w/s4BiwfFdz1x2rwg
         6nNlMucuqi9RdWzTaxHHB0/wum9dK/CumN/ETIWNrLhe96wJgCwcTXPJi86rCbH973/S
         2FqPrvLGUHk0ptIkkMfesXXP7iBRePtjhodOn29L9Fq1UBvOFeu9PM5KT6LwMk6u12px
         JtTZ9ToX04CjFOvIIEgmOYckfQKiMocg/cWyUJBRXwtb9qdLoTxnSJbL626ZttrzmOTB
         epjA==
X-Gm-Message-State: AOJu0YwamJDk18OMxvOAMDyhy4Rea0XkRXqZ5DtbX+3rfKuRwowhc60Y
	5YrZmNEyBoFZtSeQrvRZJo0cEO4io64dZSKQPDwGeqxqZjgBlid2vPM3nOFFDwFKzVIzunh3QFG
	TzUuBjs8A99ljZjzhsrwKVWoF/jO5oAk=
X-Gm-Gg: AZuq6aJb2dkKgBJMHSkJSLsRDQ0yKLNS/bUngs3Ml8QBDoOkjWR1bP+G5j2fD8qcSX5
	C7HDfK/Cfo1C4F7wpkLSjz0Q/NJPzJzwbLl68SzRAV+nZdNwZYr+5vDOnsR9m2OdTbIe5uvoSEm
	WJtAkj27NwOTFOP6Xw96XLCBOYbpVK7oMR7Bm9gipIHOPcHOhIRonKOxOjX5760B7JvUHpMkTQu
	Zs2LmP+diVVC7AN689pPDNpDHTIrejMwWybPd+YufMnLiYkJjqKcanHyNVn0D4ph4kcsIh7WOxu
	wppNSWLy5eb75XOz3umHE5dQTNjSy3Yl0phRCStBR3121i0g8oBHwOxcB01kRBQqYKZbS4WJywo
	cMh7NkgQ+oj0q
X-Received: by 2002:a05:7300:d519:b0:2b4:6ed1:2ece with SMTP id
 5a478bee46e88-2b6f6fb1b14mr1597693eec.3.1768938934373; Tue, 20 Jan 2026
 11:55:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk=Op9baRBH8_T1xZpa79TiteMEBHQJAqEM_E=5KHnsmZD8Mg@mail.gmail.com>
 <CANiq72mxpYYL+q+PGCfu2nEsbD_7BjGMhz+Q7wXjNRgYXqhu2Q@mail.gmail.com>
In-Reply-To: <CANiq72mxpYYL+q+PGCfu2nEsbD_7BjGMhz+Q7wXjNRgYXqhu2Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 20:55:21 +0100
X-Gm-Features: AZwV_QieeGxSXw5FB3vJRxXbTdNaaSQ8O3tujKyuITjRAqGzxbNyN7BF1OrB0zw
Message-ID: <CANiq72nMpO0o-P0BbTgxPU4RSOttFPc4UQzH9Bs73F7Bnkyxmg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: add if_cfg! macro for config-based conditionals
To: Christopher Erleigh <christopher.erleigh@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:49=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I don't think this reached the mailing list, since it has HTML inside.

By the way, the Suggested-by tag seems strange:

    Suggested-by: Rust-for-Linux Issue #1183
<https://github.com/Rust-for-Linux/linux/issues/1183>

It is meant to mention humans, not the issue itself, i.e. please see:

    https://docs.kernel.org/process/submitting-patches.html#using-reported-=
by-tested-by-reviewed-by-suggested-by-and-fixes

Similarly, the Signed-off-by is meant to be (typically) your real name
(I am assuming it is your nick from GitHub -- apologies if not).

By the way, was this assisted by AI? (I am asking due to the GitHub PR
style etc.) If so, the kernel will likely soon require mention it in
the commit message, please see:

    https://lore.kernel.org/all/20260119200418.89541-1-dave.hansen@linux.in=
tel.com/

I hope that helps -- thanks for the patch and welcome!

Cheers,
Miguel
