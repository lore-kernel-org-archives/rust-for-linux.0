Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C4838F93B
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902256; cv=pass; b=Zv+LAVwcZTc4bvzTIxbN5hhATGwl0VQV8tTZlwjeJ1qlwa55oLiClZr9C5r2jihuSTt40la3A4FOd6+xBEVLF0idz7SOCRvF5JzJaQiZPoTjKVaLlka8fQEUvjkKobWrYFZ9qMzRMt8MtMq/dOPv4uUsjqzhHHS8IgfLBtw57fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902256; c=relaxed/simple;
	bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5BZtoA0yDfZZxn+82OLeSgvpkq8wdDHUsk7dXOhcqmvUKNCNbzEsNehx7LZPkNNy4+NkH0CoCtg9jFE0V9rKwQ5rOZAWlGeUP24To0N5nGVWfhNRqZuAwF+VSQu7G9eyewjcaukDP+9nNJQXtPLbIeZZDVcQBTbc75rNffqRzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StPljPRz; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StPljPRz"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-307b668e1f5so38131eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902254; cv=none;
        d=google.com; s=arc-20240605;
        b=BDLD4B84bUnJkDySVlJvB4yx5wv3/URPb5qIdHTP7J3rffk4nAE1gRzRtKusnAJGqq
         NuwxOPNu3PjsPpdOpCpiCdUkI6l8skkwx9J6ooH6qKbH9dlZEchX9wNrxaXnfx/00bnw
         JiLpmE7WkQE14lJIteMhNlhumySB107KBK16PJT3YfyzvGIkJ5oQp2I1hkSArpyf5sD6
         8GtpI4/BHVNJ7TjHj1Bcs8BON8xqL7aDgSKojVQTcJVJEIMXTT0cy26qsn6rcBsE6kH7
         AH+y8Ol2doE/GJrPODj9SjgWADA9GHsBpaS9G7myq3LTO3vjTgSI3FP2tWBxwJOtkquE
         j9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        fh=/Kw9U/ww9t8sdN800LW+3IxANKDyUFdpXF2GzLihVAI=;
        b=bFyDo7R1E6uhYTgUpv2XlTPCACCIwrHW37BrF0X2kwbs6PVpEHsWA3N6/tDXhR/xe4
         hZFfzYKi/dK2GkRGemRE49wb9cfMVVLG0rmzOB3mqfuFczmetfSNl54QJOPwgeY+Z17L
         kt47RHSXbktfIqX7jXv9j8tdmp3N4vCWsCr41Hw4wim7jA4uzcsEj8FKtzGfkfw+CTle
         ABzQVvWl1yy8ulVYtmu46x1bUq2Uc8rq4wi0Tr+FXIK1E6ggf1m2KSmudBe/8HNw4aS2
         DJ16aJp78xHx49mI9Ep1WAmCcVX6gq1eZqRxTFjKwZoHcOav08H4NmVzkjrH3rK/62/V
         BJZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902254; x=1781507054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        b=StPljPRzyriQ6ljrCi232UNhcq1V3Wcmqkp/oL8cuDcgTOBmSHsK+4j9fRTDTWPfJj
         8ukgjBQXg204HZgDLgxfi8JG1Oqf64puKlXFJNPMZ9vdQqK6SRC/xk84JJ6ieUZ9jLUO
         NGvrTxumlJalIuKlE5WQ7hpg7pZtMdQiw7tW9z3vm2+j+oL1flljq2TZkaiWbAvw0zjf
         x3MZVEoFT2LiYatCnFg3ARwEO3RPiT0U5S0NNC9NNn0LYZVTPj0Jdf2DO1pfWNq3hGfF
         I01WmYeaoI8y1qnb87C8lUomtZFLYjbgoLlJOc/XR657cPkGKZmfnnhjxuUjJaBW02NI
         Nxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902254; x=1781507054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        b=W8Q40i6JVbmU/zxZFlSsjW8U2PWVwuHioQ2mFc6lwvMRtT5epHh5+hp1PXOh5rdytz
         a4JXxU9H4SmM664/8UdVYCRR7CpymMq2QHKurDRRSt6WSbyGrN/zrY9bXWPZkCRvPDUd
         HwMZVVnPeoHYcgBIWWKCaavAeogdyckyCgJW9ssJfBV0IAHkRfPEUhc0vqCWRzoGeMcC
         6jNxd8/kXivgiYVSydC9jV5gbuM+PtiluvuiHsJTJ96B8/2YV3ti8/fY1rqB+WQd1+P7
         XItAgA0kZwVr9aSYwqFEq0a2OWBaYYWxaZYsGQvy3Az0MrgUK6P4nTAQZSoWxD1Vgp4g
         uzMA==
X-Forwarded-Encrypted: i=1; AFNElJ+uwY2VzCDv41w4UxrQy9ucLkPwOJjmwbIyFmR33YLgA6NjzTJYfytNgQhzrD6ChGO92FJCrXhvxEWwh5oP+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhb4Ndjm8xbw+542/ioeU8q24V2ueOC9BZjfhTttb+EEKdqiKx
	ReHjLFFBKLe0ySENyRcPs4M9f3XLiGPS7Snr1Zqd8cgSkTi2yM+LdZkllbCRFuw4v2fdEMghQEk
	yRikSjb8g7+EdPcXOQeX/Vrn+Bkqfh7U=
X-Gm-Gg: Acq92OFWdDOXeWYcpEPKxME7RRLxR+BG733RkQdILr0HGlKxfwpzsCODoXUlx4C3aKh
	bLfvkO4cJjXXVOVCO9dRId7aQXwd9BwOMmsDff2FtM5TSH5lE+GhnCN+M7FyJt3sQeBQW+bcWm3
	BpbTRZuYQDkgQlHRgtbVdCWqpyqc2AJIc1BlykADwV1eFp7XKTQlCQEkPAP4n8s7CQTNdkyvlTg
	A5ILj6RTG/LY3ARdgSRbA+s6wnh+3PVZR5C1bzMwyc7NMOA4DquDRPatUfqzkSEWjwVmmrOURWN
	jetZUV5L+AqHS0DBIa+aGqCuy1RR7UhTVd3t2DawvsFisgV6ZddkTPqYxSThzb8PZdfdVUYoumE
	A2e+9I4iepdnJnkWsrJPh24miJ4U0VJPLAA==
X-Received: by 2002:a05:7300:fb91:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-3077b437db7mr3385783eec.7.1780902253819; Mon, 08 Jun 2026
 00:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417031531.315281-1-ynorov@nvidia.com> <20260417031531.315281-3-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-3-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:03:59 +0200
X-Gm-Features: AVVi8CfkctqwQ1afnp5vGSX4F85MzXwCNBMwN2jWnjjuq3Ql_RpXAPCbCeRJJMk
Message-ID: <CANiq72msu_mByr9DjW8kU9DWQg-0q5XqrboxRK1gOTwKs6QTjg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: testing: add Kconfig for KUnit test
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 5:15=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> There are 6 individual Rust KUnit tests. All the tests are compiled

I think here you mean "test suite", i.e. there are many more
individual KUnit tests than that -- hundreds at the moment (mostly
doctests).

> unconditionally now, which adds ~200 kB to the kernel image for me
> on x86_64. As Rust matures, this bloating will inevitably grow.

Yeah, options for major/relevant sets sound good, even after we split
the crate. Not sure about granularity, i.e. whether we will want a
Kconfig for every single test suite, though... Especially because we
can end up with a ton of Kconfig symbols; but I see there are a bunch
of those already in the tree in the C side, so I guess this is
expected/fine, especially given David's review.

(By the way, KUnit is not intended for production kernels, so I am not
sure it really counts as bloat in that sense.)

Thanks!

Cheers,
Miguel
