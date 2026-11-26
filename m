Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702239;
	b=Xd0t7WFUAeqxt7009ho9C4K1AFB2tYCa17+7Qh/wAe9vfJQxZRW36GSpcqdY6eF2kS8J
	 Bj/E4/Ku/vIN4q7J2OQrZ+ScaA1fIyBcBkwIhzWdua7SmH3uSaYezNK3AW4GlBnaTtbw2
	 Mul+Jmp/LfCWI4sZUj/a+XnBDEy7X6LE/2VcEA7jz2pBKEbRpbPYz3DIO/PB7goyl+0Ji
	 k38iNXxdS2bsdjH9gXX9FeZYBl5P0haZ1lL4wbtUHTMvzy2fGMmRSI0/KiekfbEJ8WoUt
	 ED3g9o+rtl9wjaHNgJdXo0i9STsI/FP0XF1mhCXSS/RiWRdp97e+senNHaItFEKWl2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=pZCrJxjGpKeIxaWqujE/cqP8aBauwoXvz6QYa0WHP4s=;
	b=DNYf9xzzYdvEApr0IfGLdPDIWQ4Yv8IUfKyfM7FdwsGCkUdZJbvPpeFzWMcqvL779p0e
	 usT5J3sBlKEhRKi22wu5/v87f/zZBMWZ2JHvnow1dr0c9hR0WbZFOR0cf1a+nEQSQ2ciR
	 r+t52KpkDykXKbX5us8DmF7NLYqYJvC/19akfHGs41oAygb7Jjhv4LdQbreTF31B4jtdP
	 59JoTM91flZ/zpLKt9exnLMJgbGxRyffeMuVCqRdZ36Q2IdWb9IE5LL4rfVWbiFR8KPLO
	 r/algZcrP7gfTy3QpwTWGwLvSw/CjAE6oJ/ZWTpjB0l52mbjPE4ax3R8Vyw/jX1RZSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBkgKjAa;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9FE606A32C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 14:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBkgKjAa
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ee3e658c70so2199485e0c.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702237; x=1796307037; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pZCrJxjGpKeIxaWqujE/cqP8aBauwoXvz6QYa0WHP4s=;
        b=wBkgKjAaod/g3XH9xwmjFOVzz2fQNBZjovvaikdGVy09duuPt7C5mqx97kItSCHcbF
         F4rbYRXADtsCf4BkbLs/NMS70E4TEdEJb99D7F7wKxupM4aWdJmA1tKL+P2i12atfTXb
         QSEZm+o7YFlOR0r+IGFCC+1W6i2TWj3aKv44I003JCGjo8Vvzvpr4ru6+2/dhfP6PCyr
         7GhYhrFHTRiFfEliC+ohX4mxPGSWG/2wXsNqctxG/ru1UwywecNjhNGVgpYd7kBjl92M
         03EEjWTH//zd00CFV65pTO+W8dE1BKY7Sbk0+xUAucE6F3Lj7ZPD4sdx0Zxuj7fn4aN7
         ug5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702237; x=1796307037;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZCrJxjGpKeIxaWqujE/cqP8aBauwoXvz6QYa0WHP4s=;
        b=ZA7RvRLtEmU7ry9BdTage4SFtszxjlYn7NM953mCvJiKg3IVSg7NH1wD2cc0tB8C1Y
         nUrkrF3nKWMBw2O9DUv7TTC9elUEPiyRtNpGwC0cNPLorzFRH0KZdktebC698u962m+b
         +wzyF0WWcHiUNSOcRwDQvhxhyiVqgcgoQgvhAgxdGPma8oOpWNhHsZUaAxe940/dEXLd
         Ia1mUR/9lLUt+nYsX73WgLuLc1dPgulpyoCq3WDa50j2muMvCO4GF0n8mFj76t7LJt/A
         BsMOrvacaJQqSJfkVnAhiEfu91KEqpJqa2qCJLTuS0tWtC9uch7t8CiKTL+R1uOc+Bnh
         oiZA==
X-Forwarded-Encrypted: i=1; AL+hErGeN6IsUyYhNzeOAmjVXF7IqtNODhZDyjsR4Pvfyg58DX5ad5UBzjW9x1/tG6YuIYLQqw9HFBWji4vreLZIhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hvbf3kt3Mw+Hqk3xpayVWum0nY/F7N/9422po8iRX0+cAozgw
	ugEDPE0Pp1lX/M50XhjdawPW6Gb9XLmYldMMzju8Stg8AB63FpjJbrc=
X-Gm-Gg: AZFdTZdlkcsDDdB5etzsJmRzBq4yYydrjhT/3wPbjPdcjchsjQlMP8TtjsxGbvePVG/
	fsLuwXWqc+v3Gk+MzTP0/ai0clbCHoHQ2OOM58PYyT7X390FZyaZuH1I+RIPuqM436sS2fQbPbJ
	V9Z5l2Rs+vw4QDg2DSrsBwbrh6rZMn9NsaB71Sgj/D49piw6jt3qhm3Z/ljZGJ2lbKUBIxG00sI
	2lNzuckpwriMrrXV5bQikQ9b+LhDdPThrEUmtkintjpgbQuaB3toCNYUvtLqIXLGdDhrZT5EXGj
	drx/nPwy7RoHR37M4QegBM7gy+0k9jy9Fe3aEsK73pISavRPTOPkqzWfoLrrui2WP9soqpoTwVT
	uwCvWYQFGWedKCfOXqdS4Q2XTWtITKIkXsAVjjPgNFgcwxPMvM4sPA3maK+oYeQj602TN5vNpkH
	v87Wu0BDsYl4x3DTs/KoP3PuU1fdgCR+z5wAXatY0CWxPzYyX/hLuEiG6xErzNdD/jrkMhiiDSt
	QEiHfMihZ7znxS4/jjcqnON1hfN1TrmtwgJej1tGNRrds04bps3horXeTy03fUemo9sODhAkOMO
	RbrUuPS5CQk/f2p4HbcNNXY1F4E6F0u+U9VGnLOpaV3ONYbXor40oG9sgZORQOhQ
X-Received: by 2002:a05:6122:3b84:b0:5ea:e324:7c0c with SMTP id 71dfb90a1353d-5ee8af8d6fdmr11736966e0c.22.1795702237493;
        Thu, 26 Nov 2026 06:10:37 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm19471567e0c.13.2026.11.26.06.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:10:37 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 11:10:29 -0300
Message-Id: <DN57BC2XOPSJ.2UE7DI9RNQUBD@gmail.com>
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Ivan Tverdokhleb" <mbkchelofficialdev@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-mm@kvack.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2] rust: mm: warn once on invalid VMA range
X-Mailer: aerc 0.20.0
References: <20261124132609.101657-1-mbkchelofficialdev@gmail.com>
 <20261124153228.134723-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261124153228.134723-1-mbkchelofficialdev@gmail.com>

Hello,
On Tue Nov 24, 2026 at 12:32 PM -03, Ivan Tverdokhleb wrote:
> Use `debug_assert!()` and `pr_warn_once!()` in
> `Vma::zap_vma_range()` to report invalid ranges.
>
> Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
> ---
> Changes in v2:
> - Drop the `warn_once!()` macro and its KUnit test.
> - Use `debug_assert!()` and `pr_warn_once!()` in `Vma::zap_vma_range()` a=
s suggested by Miguel.
>
>  rust/kernel/mm/virt.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> index 63eb730b0..1a3a990c9 100644
> --- a/rust/kernel/mm/virt.rs
> +++ b/rust/kernel/mm/virt.rs
> @@ -115,8 +115,9 @@ pub fn end(&self) -> usize {
>      #[inline]
>      pub fn zap_vma_range(&self, address: usize, size: usize) {
>          let (end, did_overflow) =3D address.overflowing_add(size);
> +        debug_assert!(!did_overflow && address >=3D self.start() && self=
.end() >=3D end);
>          if did_overflow || address < self.start() || self.end() < end {
> -            // TODO: call WARN_ONCE once Rust version of it is added
> +            crate::pr_warn_once!("Attempt to zap invalid VMA range\n");

I believe by the comment of Fujita [1], the `pr_warn_once!` should be
guarded by `#[cfg(CONFIG_DEBUG_VM)]`.

Regards,
Nicol=C3=A1s

[1] https://lore.kernel.org/rust-for-linux/20261124.225103.2152350984946270=
550.tomo@flapping.org/

