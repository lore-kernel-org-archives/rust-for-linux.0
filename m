Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90182E54BD
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329100; cv=pass; b=BWqrtzQtK5hvQ2ZrpILO6KC9SnuCKcz/SDnI/yb8WzvNLQdThws9U2W1DGCVreJGLCAi80pKE1yWLRwHsLCw++L0p2h2NrApEHWzKVowGCJlDm5eqbwet2ky0gC8C8M6pDpWuMnKRTq6VAyRvlBDwddRg1TO6+XfKxBpC1BJxGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329100; c=relaxed/simple;
	bh=5XvyIIlPirRo36R/Lz61JRLf7RUXiQTiydyFoUGj0DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apzZHqp/OGbESMyPWYSo0trNv97SzSuF7IR9e7CzZGgSY6+ZkK+R9tIp++k9xiB+/x78VuMY/M77FPtgC1M/gvk8PZItrwBT5vEVuUpPyENN/86Nv6Y8WkVAYt4bmD1OpT5SM7e6CozKXU2G1cW/+y4yb/gow375DRHEvuvAx18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOzi5Xce; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOzi5Xce"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ae60d8a05dso208811eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 10:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768329099; cv=none;
        d=google.com; s=arc-20240605;
        b=e4kJw9BuuxLy4p8j1g/f6R8AEg5JV+5LXKFySNeok1U3dPht1xEHRAevownDiPeYBF
         TW+m8PtLfiWMl67DlY/WTqsoo/V613Fpc1M9DGMaCdPNWAFtjJN3zKUDYgZJTX/CFMoi
         G1lysSBCQ/lynHRrMt+tNrTwZGdCLppIVKX52U2VNmOPXgZMBojOGv2ZBx4NeYsYSvm2
         fxsRQd6mwKwOgLOHTKWilF+nIUaq3xkXjzFlEfeAUkGjo7taKyitwPyQpB66MEjxT0dY
         80xReQMKoMfRju4FhkiuLxzdP9BtTeOEz8IMk+qrKEZYoRlASxWRquLwwr9/fekG/+Xl
         1HlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5XvyIIlPirRo36R/Lz61JRLf7RUXiQTiydyFoUGj0DY=;
        fh=e1FMHTOmJX9o8gA72hQVGHTpHFhLSnlUX0JT98BvMw4=;
        b=e03u1kQ5xqFwQoHyL2ROiQHddZyEyXsU3xJTJC6CBICwLyON9OL8q9XzWn3qBjqCdY
         3XHLu6onAQvCEH+XE/xR3Hte4En4rgI85fOcgQnnElMUOCGBpbFUVfotrRxYG1i+w0YI
         Mc7I3Jy4Jdd1nqYowzpT2kc5UAf9frTZxotjpSYgN4NZ+KOF1vygdl6QTH53Mw44f0xo
         kPwLLbsohjEz08cxqfGJlVidf/6hdKBheMzkSwXA36kB12/o54rTXDqVRhEP0EBUM4qD
         Y2u+aH/E7BJd89INRzhfRigur3ZbF8T3B84qC3euiL4IuVvuo2hQW9qN+nM/iHmJuL+q
         frSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768329099; x=1768933899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XvyIIlPirRo36R/Lz61JRLf7RUXiQTiydyFoUGj0DY=;
        b=nOzi5XcekkINttxpkB5MHu308L3NdyGvSu4eq8NES2BcLgPajpYrIFNe7BWyyCPD+A
         RcNcQQn8aOUyEDxiYgol4fNa0pftNik1LUK1RM8XStNKqpx/d2kfuKJcWdUrggWc1W7K
         a7wpXUTxO4ndND7DPRtEtVwhJCXySfpovON9B0VBWpej/hBwl2UIipuRZL0Q/R6cAN+C
         /q1eTkoeIqGCy4UuQTRlnQ1s+lYCHHs10tonrk9n9zC9zeb/M0kiBGwvr5K5YjnSQTdQ
         9cZvAWDMorutcokRUmJxBkllz3J3PnNA6c3bDyOi0DTDqhfstnBsofDRr9CJ0L3QvWdu
         8HZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768329099; x=1768933899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5XvyIIlPirRo36R/Lz61JRLf7RUXiQTiydyFoUGj0DY=;
        b=wUhEIBWfiGTqzQwREBm9qQRVLzYedD//jktx1D6JMz3BMkyl/fSIRyTYBO/rBM4Q2V
         1/e0xxw67bgwhg/J7QT4KcUGSoF5O8UVr2Y1ytXZELMdVskS0M4hqz2lt5fghqX5RNvt
         qEubT5HKYLBdUvATRCo5SjVEUrMAgbq13LyvJGeZpsH6Q3RSRF/aTxuy4oKfHDL4RiDL
         1jo2vrAAQK9whul8b2WUG49olrNSX6FHIc5ZttvvzsZXbQychHcAxE9D/4u8fSq/hqQT
         5L00QTtbv6u+JRkEaSg0eK55U5GUSOg7+cCHyxWoZHeY4DEJyuYh2cigslpUdI2+mi7W
         YK8A==
X-Forwarded-Encrypted: i=1; AJvYcCUcbZQiALOZrWU8L+dBEmGfO6kk+299D50p6xhaRzD8Ge99M5s91oDYMuPCq57RK7UY9mDtYE0J6huV64gs5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJzXGR3SL/UXhljHVeazKtN+YpCWUzjShl97xlNv0Tlo5UYYY
	5k8bVwDV8I70GDdX+Tk7ARJQUAz7WPBZMGyJSYMXhqF/T+a7/14LlsDn2hVka4lMAOjVU5qOg5i
	WbTnFXI8PSb0lzoiVaI5Cjq6GbT9LxyM=
X-Gm-Gg: AY/fxX4lJwyS8l/ilb0/g0aPCLW5PQVK1+jImOtc037zIHoi8QTByYFCCNOUf8NjyVq
	4FK5EfqWVOSSb/76FElOXk4VW9TxYddo9mg2/UY7+DNkECGrG0ScdAv9cCf8lKCGgiFQTjX955Q
	ZTR7JTT6+UMKQh7kb9D4DU+XA1U8O+oUWsYpWx+zgEjbF0/BCO2dP7GjaPqemkb7HRJ1xPrag71
	CRgB4wCZBXfXoew5/9QYSp+pm5xcEaIAh7hY/YtU0eq8N+YhSWop7tiwkz+Qy8lUM3YosO2OGbI
	jAFRS4+JbuouQ/BQlG2by8Bnqdsd0nE9Z/jm3OSk/nqXqtrhiRq+kot+GkK5+FFR/XUWdm5O+s3
	vwgMTP/zAMPme
X-Google-Smtp-Source: AGHT+IFFs6+HqG/sBSPrZfwQajQ1yjr5lTIigPmS8S68rA98KJ5jdKsBSMjSYPyb1bpBEwp0v6zMh7O19utQmLQceGI=
X-Received: by 2002:a05:7300:2154:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b17d34ee36mr13080187eec.8.1768329098568; Tue, 13 Jan 2026
 10:31:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>
 <DFEDG6TK5AY9.1Y9EPEYQLMCMX@kernel.org> <CAJ-ks9krE2+K0mVkG-Ao9VAuyDqdAoPbWAK7fHyoVZD6ww=zyg@mail.gmail.com>
 <DFEV6M7ZUBED.D22RP35TL64G@kernel.org> <CAJ-ks9ma8oWMGtELdOgj0_R01nH86FM-4AOOZ8bWjGUH-bTk_w@mail.gmail.com>
In-Reply-To: <CAJ-ks9ma8oWMGtELdOgj0_R01nH86FM-4AOOZ8bWjGUH-bTk_w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jan 2026 19:31:26 +0100
X-Gm-Features: AZwV_QjWQSoREtqbYFr9wJ3c5MeVGx9XNaUHllpoCqcfm8kTKOEi44o6NIyGEds
Message-ID: <CANiq72=fnDuf1La=EG6XBLghd6cb=XU8xFzUPTchO_pcacXTLQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match rust/Makefile
To: Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 4:20=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Ack, thanks.
>
> @Miguel could you please take this through rust-next? Assuming that is
> OK with Benno, which is my interpretation of his earlier replies.

Sounds good to me, of course.

Cc'ing Jesung, in case he didn't see this one and wants to give it a look/t=
est.

Cheers,
Miguel
