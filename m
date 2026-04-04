Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700614EC73
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775270002; cv=pass; b=THgxFk2uB4inSuw9q6Ueby7YAVcmlAYLl3xEf43ryKESJ4CJpSZwvvmQ2Qi875TyUGiH34GiacuTh+BM8qWB8DBbHx+iYCxhSznIbHVBPEqovOIpiSyqwT9ZIZJvFV9K8pelyDNNK3Z0xN6ZxLqi91rC48ZAlTQNtDjwmhjaeu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775270002; c=relaxed/simple;
	bh=pvwoQ/FJfV6FI3wp/7YC8EhU97vGmrlwquaExWwwlS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNqFhqq5mK6qcg32Y5gCSW39td8kPa+unpP6UOYi87BnyyKXBbEGoaKjxBprbOJTJaf558tUPAIbNTvOosA3kkrdXv1YVSVTYy6hvYxb5JJwleG0bP9rP6+nfEVHgDhPNvBWttgbjUudBA5WRjBH8QUocmspvHnk85+Q5MMW47o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7W6fheV; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7W6fheV"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bda3b4318dso175192eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 19:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775269999; cv=none;
        d=google.com; s=arc-20240605;
        b=UuhRW4MExu1TzMQ6MB3Io1xfmgtnG0sSF+3f4ymnr8BuVkhWQw0t/wiKl/zdej+ZG0
         e0XNnocA5reFqnPZEXpgEUMjUEq/GGW6j71UjQoUq3MslxmcJyG/fAOeQ/UAKMqtc9me
         Eg2d/C/+Lq0KC9Hozg1xhpK9MQya5ZjvW3Zr6VFtpj9V2hQL8qBuk+fCYvXmMV200Z0J
         3xSrLb74WG3qcaz13491tzjAufw/sKrcIsqIpAEy4gxg4uvc8ooBY/X2ma5VnoGq3E/K
         cIW1G6zIpQuwmdcA+JBHlbhFvafgn0ByKwLLQcM00eI1o9au/SzTSwH9vPtwaKWnWyvo
         UKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pvwoQ/FJfV6FI3wp/7YC8EhU97vGmrlwquaExWwwlS0=;
        fh=FWRq5+3Wb9ddqYYrYlVy2dlU4ap3zZ9y6CWL5g8TOxw=;
        b=Jc46zFijHGOgQ4VaZEHpt9yQ3QFhrhm9D9T4nSiV1M1V1fTnlxTDzL98foHPOa1TTG
         3L5AXkqZ3Wnzsd5Vhw4FywY1ocRYq9AB2/Bnf3r5wBBozMBMU4G3wJBO7BF9PryI6ELl
         igqWpHFyjANS5FzPT4KqKsCHFl5Jwva9z+A1cco6RxeGohTpkm/SByDshSZC/FoDEUx4
         +YrkuonZkiF6siZybNw2JJzwCQ6SpVktcroGP8emFc2PtlhoryWsh9od+uJ3vdmdoFwG
         dQcRLdEzTQRWJk293ViFAVTJCORCVVO5vlmifwp45otMkKJDglDYIpW6aO+9IcTxhBS4
         xuxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775269999; x=1775874799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvwoQ/FJfV6FI3wp/7YC8EhU97vGmrlwquaExWwwlS0=;
        b=D7W6fheVC/ulDD1v27gHeCYDjYATPVmtVFW7YBJfZpTphpcD/nqhckaparHr3bNp5S
         j19Z/XQfYNTa9W+DHzvS2kZwFqgrddR0nTVFjbbkO04i35uGw6APVmK87tRADkWH8tme
         CtRUQv+Ew4DmOp5ty8UFwCyH+Qlsdi7PRkyRwAEkiPQsyKyilj/qUkNWRAv5zbXE8Ail
         3wRFZvdQ7XRMqSFIq+x+6pnvc/Use+bNeodT+m4n9cUwVFIGSR6Jo9IeMf5pYhnoTeVF
         DZKyEdw3phFTncu5rTqTQhxVsjYmSZFyfJ6RSfZ0ef/+QgYi0ECUPMevrONgvlNujpIp
         AfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775269999; x=1775874799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvwoQ/FJfV6FI3wp/7YC8EhU97vGmrlwquaExWwwlS0=;
        b=HS3AhUb4vIhZi+bVwZ1bam51aPq7o1iK90fyQq3tAU/B0bSzyezNXPAhRCwYtEQrTh
         PrAdAejSnp8U1OHSRGrqqUtS+L0X/C7VXPfYE68nmINWLbLOPgi2Pl38koYLtXbLUS2D
         aD+Qr/FPo7BteJRl6X6242o1aTE0tEzxrLPDIIoVmfmOUxlgE0hmblAUcOUiTBOexbke
         VEXFFdJZjXm8OUCDi/jjU183oJesGhnWqGNBOYwE41BedKvW8Ty/DcQLYHRgXgIBGG7b
         Xg87exg0CTHVDnjVC1g0Uz9qGU15HeJ8+KKcffjBygBwum3QLJYlYlexUSlafPGOgZn1
         uFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3Kh+fSG7brczkF1uTUxK+N2PgCCP09q39laApg+LxMiPYYa+5pK7cPpOzgQYFyO8YjcmOGWUdufkHRWwWbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylw4eUTtb/kWpv2DfPkld/p2vOhYBO9VOtMbXedPFZBo2EVJR5
	l5Y28zA8nD1C0ZQrURFc88EjAytEhjUASqGsdDrIOVFjGW/n9FYQV6aYTR7Oj3p3W/6bljIciSa
	P5s6wwCxH78eTaSnYrDgR+XCJ61UUu6w=
X-Gm-Gg: AeBDies/+PgyHIFzCQhgaoiv16ZskF4UwFAL1JhkvZeqYG+QBVqjGXQ6a7Vca/idb/m
	apf13lOC+b6xm2yvTx+6j6dJo5p7nQSG78NWm8wSy+KgitlKyf1x7EZIbCpqnLGs078IAkiHApT
	TofTvm4aJtxQlOiTWmmrSOQXOCeKSvXM7glZLzFBDreQ7yFtlNbHkGkE6j3hxAW4qtFZT73LitT
	PL4bjEh5OnKz2nD93foRi2i+7I5P1VFdmnlg7MNOFORvN/XX1TjvDnreaWJP0wGAjGAYObLF5f6
	RbGN7V2LPQl6wDi1g/+G/CAhhzMeWzaJfNRJtiGMXFocCXtyWVKbiQsQqnXapyTQArhtP0TOIs9
	Smeru0VCFepsjITvJFw2Cf8c=
X-Received: by 2002:a05:693c:3005:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2cbf9409302mr1230475eec.1.1775269998606; Fri, 03 Apr 2026
 19:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404021204.339779-1-jhubbard@nvidia.com> <20260404021204.339779-2-jhubbard@nvidia.com>
In-Reply-To: <20260404021204.339779-2-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 04:33:05 +0200
X-Gm-Features: AQROBzB_id9LTxHmw71QOo3cPqzvD9tYvosOVAQ6HD-N6PlRQuDN1-Zp5cJC9UM
Message-ID: <CANiq72mEdq_n-8pdiNiKdyBYH2yuAHaLBCQ9hfETupnGmyyi9g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] rust: sizes: add SizeConstants trait for device
 address space constants
To: John Hubbard <jhubbard@nvidia.com>
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

On Sat, Apr 4, 2026 at 4:12=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> The SZ_* constants are usize, matching the CPU pointer width. But
> device address spaces have their own widths (32-bit MMIO windows,
> 64-bit GPU framebuffers, etc.), so drivers end up casting these
> constants with SZ_1M as u64 or helper functions. This adds
> boilerplate with no safety benefit.
>
> Add a SizeConstants trait with associated SZ_* constants, implemented
> for u32, u64, and usize. With the trait in scope, callers write
> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
> native width. All SZ_* values fit in a u32, so every implementation
> is lossless. Each impl has a const assert to catch any future
> constant that would overflow.
>
> A define_sizes! macro generates everything from a single internal
> list of names. The macro takes the target types as arguments, so
> adding a new target type requires changing only the call site.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

If there are no concerns, then I will pick this one up.

Thanks!

Cheers,
Miguel
