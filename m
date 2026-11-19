Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795049130;
	b=yr47LnHkg0L3FkCvc7BVvoh3dEK4nQrUhsN8g6f3cjK2U6bESfb01C/Oyy6U7iDVHn71
	 aaYeduKiENECtf3It0IAzg+n5+pf0JGgVJjva0YJQnjONukSkO31/qMFyAjWIjCDVY9pD
	 bzASWfYxrSTV8EgyN+RsVhbNiS41UwzAmT20OYDssgPIGMi807YsD8rI/JxofTIjnpZGE
	 JUZ+oEjSzEolC3VqcQaT1znmxvsPzZZKHD10trPo/d78u3MR2c71MW5Kkqy62MMfdMC3t
	 Zge9+lEAVkbgHB42EbrCTrIvEIVhbkm5JzvkTSXEtV3NNycGYu0j9uTqVyN1tYbxl6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
	b=jqSucamiDSXp+OsrTRUZOiEn4WJj8r0ye7Ntbjk0Scq9w627+Np+N8Xaa0qQcXwJTKfC
	 Aj2zd3Wud84wAW3sJJ82DkKnIZ+z86gm5Ya/VOjyy0g4Rzd4nHz/4viZMiYl7wfACsqwv
	 RnESa1yF4XKANZBrFv6UScGQb/pwkXq0c1+pIIX3UGGwmkkMjAAOB9zsK53YPiQze1b2i
	 CPtBUZINEqIYyLjAUfw+KKv+rgXEgjJCvEyS7jt7LzWPXbAoVPm1UdaGPfiq454V6qhIZ
	 gE4jp/bGe3O4CKQzjCXnEnKMV/q2hRwdvAhhtLDMlWIkphX/Wbpyn1msffkv2MMrg6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dctIdyXN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10E3606A331
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 00:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10E3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dctIdyXN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so12775e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 16:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795049128; cv=none;
        d=google.com; s=arc-20260327;
        b=aRBgZyh1TaZsj0j0XEwsVr2NMRYh9adxo1DZTeD6yxOW3KXemdVTHkTJRzz3xiz8hg
         a4OwlA60eCM5iREL+I7hK0sJbCdpjrr69BSFYExnVxsu97tP1H8/YzIPmmvcRoCS5xjR
         KtpCl8LQMt+9rzFpXFodq3Lba4EtsanFqEqvcjlUqxwmGYlLjKj2Un205Id9Vs2SwnHD
         se6+oplcUdp8TFz1zbF+bmFMl9YWL7BXUWUh/3gvfp/pa+Yc2mUz/hXCqvtBGd2z7vU7
         vKTb3ZXMPKOeViv+aDu90Vmy0JD/gO5sneKYWfPkkOMiq7liuF4PNAgKC6/E4iYfbGma
         vEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        fh=TRGDz37d62c4/JgJeMNyKOd8qtcNdtRzNaN3Db3Fq6Y=;
        b=EHunC7JFIchQPc6vSbbO5YugT02detQl/kfQ8J22rEvP87OJkFJ1NAQegGDZx9NSYD
         MQ6nfMztU33gQGKeAtHKioK200rolEGeO1B6sLgTwqehl5rbmMFEVpPdRj7IHtjTVDlL
         5130zLWmgJtpIiSp8wY3dA8sspMDCpqhVuCNgIoR+6lpUIuT0JJtP2744Ygs3m78+jqU
         KanQVfIGy+6DqfmG6gZFbfYdr7ahOeKAs1nfc1l403UastFp3uJabA0WqbVZh3xdld5A
         DlB+GyC+pHBRn+HlOc4QGU8Cs3DpAA5q5JgeFHcnPBqnCqQhdgrkGumcHNk7aYYsHlyF
         KFgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795049128; x=1795653928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        b=dctIdyXNTFOmu6P0yiuU9EAiTrjaoKS6u0AaJF9HmA281BEX+p/zl88sqijdx+DJq9
         G+zNh/CuWCQpA3z6cdByYHBnHi73s8VrPdRcpMFzr7xvXitN21kWHC5FzKzmkpG59TDx
         FtwXO/GJxAl9BDXtP1kwFFehq0N2jkz6gaXMh8YWVP+KDXMgJdAx6Pit8Qo6+8esR3sK
         hJdI4Mz3Y3QuoMv223DxSF9/bh1THeZMuHLgNcQRNeZjYKjktisXU78Eref678HFwQUQ
         lgC9TQ6Dk8hv0ofuQ4L0NwiX+aeR9CxQKEyygnbsFjq61cg3Pi+fkvrtILQgIQ4oaMAx
         e7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049128; x=1795653928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        b=OhUGJYla20v2X1J4FUwNTTi0uM2ackaWoeO8gHB1EoQcOrnLIIYv//5CC6dCUzwbmP
         oDtOZFrnHoI/omuOY73dxRR0xPoyh399e7fLh0Ah0npU8HNXRH5W5Mp9amSdxGSU0Nrr
         cjn7H6KsSlo6SLobgZwaWqCtX2rYiLaNhhUCf4aqdilmzcQMEYBMQOfiIPhoW/caxfB1
         wNoP+4nrDpaeZ5Ktvz1duU8l/8iDwm4IEmS0M9n34r7Xdj5PbqY3elYZBGtnwMi3shJI
         soKCzflqk75Jadkj9G8FlL1LiaMxnnDxYrWy365VS0DtTekLaDKjL6bxG/EXMODPGFG0
         FPzA==
X-Forwarded-Encrypted: i=1; AL+hErGqO76fwiy12K8seFUZagoViw0phPUiOv2PhnWS/SfcDPYnTAe9la9Xg2xV8Qwt3AW95AitPHUIB185I1WS4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SRIN+fCzsYbTPGK+L4YtgUbyZdWTkKwZiUSwxb1AstC1Top5i
	kZP/qqRRIJHc46GjbjprHmSklIiYU2OfWzVQtxpfiFLLV7nDRukoYC414f+PT89r+G7FWteV6+b
	yvptNJCT3X4cmquOQXFrYhrPodGjHALUJMTzjKxdq
X-Gm-Gg: AYBFou1y7afYFpkCKfHa2KLzqAjnPUO+EY07AsWHzSvrZ7DWaiFNYfpXcZrcVTr+5xn
	ctX036vGNC2GBPnVu/9ouD0Hy7g3oGio5gRRXwLlqbmm3ItQ+//QxmtQnyN/mvdoa9t+cljsWED
	60FNHmH0e1IUQNY/3a9inOslSbXJBzZX+8+UNgV0cNYWnygxfUmsdjjPUVAfnqY1WceQyB8aZ6r
	cY3YYxEdLmlqS9uZl7gW4bc1NUEEe8M6UxELVhs1tAPKUckJRFEcJ62TX/FJsf7nCPPjQxBAVYQ
	IyZg7uyrqABJqs7ngZQzVP9EFPKdHfJwQvZ/Z7ohtFAwtZfY3KnnR01L66obLL6vlbne+7OSbnU
	f8Mjaoo7F9DAyc7u6hkkm9sfkFdfjzCD7Rw==
X-Received: by 2002:a05:600c:5489:b0:4a1:e368:cbf7 with SMTP id
 5b1f17b1804b1-4bb84b99968mr104985e9.0.1795049127672; Wed, 18 Nov 2026
 16:45:27 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-fix-rust-build-error-modversions-v1-1-7c1023764f30@gmail.com>
In-Reply-To: <20261118-fix-rust-build-error-modversions-v1-1-7c1023764f30@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 16:44:50 -0800
X-Gm-Features: Aa3M54rPrnjXnHBMBUtGdNtQCrNUnFqzZgAcYH5tW2jPXgiVWnHrDJiqQAFq-hM
Message-ID: <CABCJKufsw-egbnyqc3_D=+D=AdPQN-Q2bi6-uGi3e6UV_FZkKw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:08=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> CONFIG_RUST_BUILD_ASSERT_ALLOW exports rust_build_error to modules.
> When CONFIG_MODVERSIONS is also enabled, modpost warns that the export
> has no symbol version and records a zero CRC because the build_error.o
> rule skips gendwarfksyms.
>
> Generate the checksum from build_error.o with the existing Rust library
> rule. Make build_error.o depend on rust/Makefile when module versioning
> is enabled so incremental builds pick up the change. Kbuild's saved
> rustc command does not include the gendwarfksyms step.
>
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1201
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
> An incremental x86-64 build with LLVM=3D1 CLIPPY=3D1 clears the modpost
> warning. The kernel export and a Rust module that references it both
> record the same nonzero CRC.
>
> OpenAI Codex assisted with coding and testing.
> ---
>  rust/Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
