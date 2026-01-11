Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92511400C
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 01:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768094531; cv=none; b=YroM/f+M4KKaAiHzG+4vbK6CKHp2uNIpzuKNyhp4k3zUtk9iU01BYb5PSyzk6a4oV9z63remtf9pDbUd20l7Dk4x2MToO1AfWgmi1hC+wXVXTW03xF8Oaaqyh8q+bCb9GRsw2/4ZWk5GhMkXwg9xFIBwtI+YZJQyRC2wQVtVVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768094531; c=relaxed/simple;
	bh=vgJN/I4+nnH7rp9YvZdzc2AS2LRJT+XAq1qWwofrNwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjhmGzelouwU1zpP1ntyYbIMaQdGdlFC+Lt2PuYrX1cY70hIhddVAWB32lHfVPh6Gde9by3/U0qgDDnXsFwD9FHxMUowQEX1cU8K43+84zafgboFe7v93lKq4qrSutRBH3TNK8K9grurEa6Okkk/THGd/YFFUWbGOnna++WKBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo3/0Klq; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo3/0Klq"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c75fc222c3so2796378a34.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 17:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768094529; x=1768699329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0IWwbmJbtVYi4wfoU0dX+VtxBJShxSWKiQNOWIxmDo=;
        b=jo3/0KlqMmdOLA0/dO8DKoh1FNcRI7KpI7uY7cMpq+toCK9gPEdLy8OdmYDv/HMe4S
         rD/uC2JuNPtpc8rKeZi1U1XTWvuZ0/XVKCA1QU0i0AXa1cnH3v1GK55XjkS8DW5zvz5i
         oYj+dF+dlWOvjfTgOST8zaplY5ZlCM5FoJlR4FGJDTMA9FGDtBc9j+CMaYORLHmeGOHj
         dy4P4AAg8+gVcttRx/vXFjwgwfCzWXK9UrHb7IhW0z9qJkdgoQp0XIMWKVYgQ/5meSAJ
         g53vW/E4Ddlw6nNfVMNzvcqnmwf2C9YNfYktDGkgC+lB+0PxdQN9ZgqKnDLT040zFg8J
         rRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768094529; x=1768699329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0IWwbmJbtVYi4wfoU0dX+VtxBJShxSWKiQNOWIxmDo=;
        b=jRXwJkD7uJq2xGmRcf27QRjPThL3xffh/bnFqr93ao7gAZPgJKPIIJvjpsfe6AL4K9
         y4EWZIwyoImisfMFXFUW0LQMf2GLvFAIoq2ZDEW0SWnyKQQtplY6Vi1NPlZktu6iIN9N
         4Dzj9EhCQHte2B01z6xswaExxUiAyLesLDLVCwk7yCMV2Fftjb2cGDalL8l0KeDba1Wy
         3EQEQis3GiKqnGBDpyS8Z7G2FgFWcsgDvds4MjXvisykoEv9fB8b6uEbd9Z4lIzftTQr
         72PTFbnt3A8TOh/bYaS/NpjXNPIxOY5EVqkmn1K0OV4g0XEbqQNOEJKwD6yYaa90pkOJ
         HPlg==
X-Forwarded-Encrypted: i=1; AJvYcCWhlz4NNwwe49ogu9XyNI8ejqL2Cjs4fLwCQNEuSM81SWQ24rlxFrX4nCL7itJYOCeDUr0HQ6NrrVogiR3h2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UA5Xq1BCFLSKmaKKchPeqwuYgzbxa+Nw1YOf3wtg5l6jM43B
	mdTm8sVZVbIPhWWfkU3SIozi+rNnqzRjciI2yxSdCTwd2a99AyjI+l3weqRFT7UdWrnl/lL8EMx
	QEpqTfNgxJ0DbOU+DzYPd82WtndCrvdU=
X-Gm-Gg: AY/fxX5oArRmc7iWAktIHXF9z1gnDXzVvT8kZGt5wChtbP/lP7TNazl7YI3BI2KktCR
	DfvO5IF93wTVCRdxQltfWbwrUf2ed+GfeRfTED0Mew6KJcoIS8Irpa1m8lhpINTlSt0HIUrF2wA
	+mS4YZpW0WVe9bcLgkvporfVZfAzNFyRQgWR1OzwwZRGIdwMD231fArebP4cLXBfzGqE3827Cz5
	FX6LZr0d9rwuQraTWwdNfnadnfvCet329l8pxFg9Xlt4FHCWhpgSAge43hi234YmkMWEa8=
X-Google-Smtp-Source: AGHT+IEWhOnBw7rcCRrE/VK7N/dtx6jKsqw3GEdNQPgALZ073RLO7GfpJvPo6znwHkJTFsnQbEXcjhg0nVNG6yAQLqA=
X-Received: by 2002:a05:6820:2285:b0:65c:f9c1:cba0 with SMTP id
 006d021491bc7-65f54f038efmr6769109eaf.37.1768094528681; Sat, 10 Jan 2026
 17:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
 <20260109-ra-fix-primitive-v2-1-249852a4145a@gmail.com> <CAJ-ks9kj-RGbWh8uPxayQnpZU4E5WSY_X_SA7f3fKzZKC=ARVg@mail.gmail.com>
In-Reply-To: <CAJ-ks9kj-RGbWh8uPxayQnpZU4E5WSY_X_SA7f3fKzZKC=ARVg@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sun, 11 Jan 2026 10:21:57 +0900
X-Gm-Features: AZwV_QirKL62N8MZPze8X26U-OJRBFhA2KARTpHsJTS3PY9-XeSC_3W_HjkJ0EU
Message-ID: <CA+tqQ4+HA=XsPuuU+-orr+sMOzHWtjPxaXZFF6FPUY+Q+jzQdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] scripts: generate_rust_analyzer: add versioning infrastructure
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 8:08=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> I think we can get all the information we need about the compiler
> without shelling out to RA here. In KConfig we already have options
> like
>
> config RUSTC_HAS_COERCE_POINTEE
>   def_bool RUSTC_VERSION >=3D 108400
>
> and those configs all flow through scripts/generate_rust_analyzer.py.
> Could we add one to indicate the new version of RA, and then drive the
> logic from it?

This could be an option, but I'm hesitant to use Kconfig soley for
tooling enhancements which don't affect the kernel binary. I'd like to
get a bit more input on whether this approach aligns with how we want
to use Kconfig.

Best regards,
Jesung
