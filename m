Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483973;
	b=ae94BkgTOO44VOdOlhbzcOf0+wRy7mGF5UqmtF19cespDH8UDe4w3OIfVHuCPT2mXijD
	 BuHmQaYR2NvtmZawVWdKcnVXDavqc9RxfyRgxvIV97Flsv39rAoOl/iIrQxT+pZWQW9/6
	 3hDdOsa9v5s1TJ6wkES3sKKVNQ6vnTBs0soq9Tnf22WZNjhA4nVY//q5Pki5+3qmwlppL
	 VcN/racmnZwxf/A5lXoNR8wRfaixu8DjFC80ImbQzaOnlXwuisRlSgYxeHGrcTfel1MOd
	 44HozhWQsji7I6JwG4UjN8nZYS/Xn5Wh5y8Kgd45yHbjGkeJuPrQwK1eK6LtQthOi4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
	b=vKPpdgcJfNXLn0fIuUCyaEKvZVVQCkQtUGon4USBHc/LfQ/PVMCeDhWA2WR82XFp20ik
	 FUSzymXr0Xtv7DZKdPrkCbux1tHH+YLOh17T54M4UdjCCUwJEWJ8wd+O5Yqdt4KWfz1gS
	 7eexAc6AGcAgEy4VWZTnpkL43YfLvP11oB9WQE2qtAwRxL7G0UOB8WkkSoAJPKm2Z+Mfj
	 dGs10eFmF66au4zFINzrPqeoHo4AlRNyW5EV1wcxniQAAX18ItvdXdtTH5Ul97SOOw8fg
	 Iv0/3gZc69oG41qmuUR4CRda4vvuZkRCVknnOrPNO3hHwwYgVs/sRAlGvBsZZSjyn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=a40gpPl6;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46585606A31D
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 08:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46585606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=a40gpPl6
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aff6a8ee69so2966507a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483972; x=1793088772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
        b=a40gpPl6nb84gRGaHDyLyseH1rKf9XvqazhUQr308l6gpVfX7u0oAJ6sTcYOWvrYvM
         1vmjZ+zVpGPik/gHWAaKncXiplB0NsVN2jIpDVg4FvwsuCw/neMrE5KFiATFg5Qvwa0p
         I0AOVCGnZ9LQrtLPmfP4fPB+cYZHYR/bGnlsqGSkXO/6v+tBcu8pkwSSPD+LLybkDC4A
         yixFr35nnUPDBdQDDSNiZNrtQmQYPzHShpY+UMxGz1+dQcs8XO5PEj2GP9vbKR0K0Ltn
         8xaXVX59MIpqKyqzpk54LfT0ls+xf4gVORO/OK9fZen9czPIBHfGZFskF7s07fRj5D9i
         kwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483972; x=1793088772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f63bQLBXHYlw5Kr7m+qCxUpgsrgXJgF6I45Lwx8IJPk=;
        b=WCjng4FqF7ZC7OOYC4QfrRdqtXOLgA7aJgmO8zWwDRYx8jj4wjMwvlccTXQ0HzFmfi
         ZHUqZNGl2et8BWuVX6Z0oB4e1W0UYXHs81JxE13fcxEl7na+XbAW1Mj7doVwcbde/Um/
         jQ/gJZlwQMGL+wQwafaWRSJX+TStfjiZ4QmYoSHvK5vxryGRmaB8pQz0pWMWrD7xUUm/
         dULWCnhAPrroehiFFaTp5u3l9yDOvj2sdBgd7GfAynCJXxp1hl7CFWnDmnHMblLyLSUT
         k8zOBWHZnpaZcJMPs/41eWGFHSy6fSf4TTmV2M1r7y5PXCy1OR47MJhyDJUExDt8tsJN
         qXoA==
X-Forwarded-Encrypted: i=1; AKwUvByuz1j8TR5bIxzlIvS65Z7nR528d+r35WJbYeFDAFDI4jjSLEX62Sa/NCp8i2opUPZdEMjwv+7KAl30xLqRiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4EbFqJQHZRekA8RINQrfBJO0kruAdMqTb4m9nIdCH6shTCeUm
	RDUNyH7XH0f0rJSvCVq8CA0CjrFW7dE/HrXYEFnCmfQvGBJAGSf4RPoaL8ct4OtCCyjseiVD0xe
	K+7S1rjGmz3nJpQikmg==
X-Received: from edwg15.prod.google.com ([2002:a05:6402:114f:b0:6ac:c84f:3304])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51d4:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b3a816fac9mr6710522a12.16.1792483971098;
 Tue, 20 Oct 2026 01:12:51 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:12:47 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081248.1761160-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:38PM +0000, Sami Tolvanen wrote:
> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
> 
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Missing

	Cc: stable@vger.kernel.org

otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
