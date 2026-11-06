Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961949;
	b=MutS0bb83w3uWz59ELpkwSnv8O7Ikr46VrqGSwIcsALSD9F7Hmm8o8wN/RJ59qwJwZZC
	 yMEX0D6UK1Z8shZLGnBr4q+Te/NUus6ym+9aF0WvUAkNU1m6W3HKdLi5Pm5BeHnihgkJX
	 VQwniw2/MBiXbdkdg79CUC2EsEllLiOAofUAxpoDhp66Vx9pwt50QG8oDcWVQssAndnbV
	 EwnxNA9mZXCRq3tVBqBqotB8BP85+Sw8Ha8blJc8OJmz/vh7RD2Xp6q6rQKS1KUByqppu
	 sf8pQUJ52HV6PlA5guaQ7yDoCeVbs9HGlJXJ1tXzq37HkbYhklaB2bQA9WLZDJJeYhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rGdvxnA0iFsROgXGKz2Xx6QFRzdA7CWUAIqJ0/cbrs8=;
	b=YzkTHN+ZwA7iukGPANNa+4JGMMYN+cVEQxikLmek6w0KV//g1eYvxa04TMpeSjy55nZI
	 m9HV148rXUtfy2t2s6IkW/VBAbktT5uQTQiOgvd/w1SKF2PZGBSogenv2V8q7iEvYXS7e
	 cs9bc0nBf0LiiGDqHgKXSeRXvgCEv40Oxo+dRdEza2u2bHM6kRouzRCIkblI9zD0zZCNA
	 uHbRC3e5W/iKZZUS81Sr/pWxk2XxAyuc7xCvu/0BuziA0Lp9CzR3ilanI0s7yObOJYARF
	 r/GP+MsMeytNdIC7eRU64rZze4GhjAwFws5s7VXahkHxUidPj+vbkosOemv/B7deW4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PjaQxyg8;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A774606A32E
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 10:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A774606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PjaQxyg8
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso520075a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 02:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793961947; x=1794566747; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGdvxnA0iFsROgXGKz2Xx6QFRzdA7CWUAIqJ0/cbrs8=;
        b=PjaQxyg8hJI56eL6sgdX1VPw8JniIaFdSqGvBImoWdJt1WDpTVxm9y5bTh+IvBnynU
         VsCFsiSR1S2QmtZNZdLY6RytOurChJJdIzm9wf5qkcS3nQdAwdu3f1i0onDhytvKK3vY
         Y3s/4sfYxe2fHWAhcnm9EuSDaPwvJjfoas85YWn/pS5qcODIk6WOiwaLnBCcF93ZbqOm
         1hZkli7HLsS+F0MjeG8b0m26JQcdJKKcCAgX9Ag66C/fO0Lv6fUWIj37jcNlP3z/yncV
         ts643gPRQRaWTJEf4ObzatVxQO492Ry6pZAziXoGe3aJajkS3tCr7KgK6RfU/9hnBMOu
         j52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961947; x=1794566747;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGdvxnA0iFsROgXGKz2Xx6QFRzdA7CWUAIqJ0/cbrs8=;
        b=cTN69kleCpDMyn6cTj5/h1f+zumBggwHtdBfh6NWVhFFPL+qyaiJA7R/+gto/q/deg
         hCPqNdEyNEoNkwXQeCxd95E2NX7hTbqEzzSB3m2CfROEvVCmQ8HqX/rgLo8PAQ/5LaJP
         Iw2UTdkQqACq9uUveb7JBoaixmKTL/cw+lFPIpocmu/MqnGyTjRejoyAaQ3Hwn6kwZGf
         hkKf+O/t5GZfk5JU2ByX+WvcUZBGAqcSRuxdaJX/wFfBF92I70EOOmxV+oRymqDacq1r
         wBnrA73t+3WLwXoGh115l/jVZ9ZgktLH59vKFUxW1/w3a0zJGfegSYeY5ZxFNN5XbXXb
         Lt4A==
X-Forwarded-Encrypted: i=1; AKwUvByAYNO90nNpbJOfdCgfeCen5ABJJKUvAo5s5T3YipVIaevjylAPpj5afdQtXgxOdoCALmFzsIsRxUW1g2fvsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TeP+KONPNa+RCtKwVUz5Z3Tphj3Jk7dvXwCOmlktGKoh4lvbx
	Wt4A0HWtKnHg4UvQqsbtQ+wmp11i0MuZp7yoHUglyYfWmkywdSLPQGBmVQbKUsA8cjNlHanUKbH
	EshDr0eZR4Tv3TSpceA==
X-Received: from edr23.prod.google.com ([2002:a05:6402:44d7:b0:6b4:363a:88ea])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1ecd:b0:6b4:21f6:ff48 with SMTP id 4fb4d7f45d1cf-6b597524b81mr1549991a12.3.1793961947235;
 Fri, 06 Nov 2026 02:45:47 -0800 (PST)
Date: Fri,  6 Nov 2026 10:45:46 +0000
In-Reply-To: <20261106073528.93371-1-ojeda@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106073528.93371-1-ojeda@kernel.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261106104546.2297584-1-aliceryhl@google.com>
Subject: Re: [PATCH] kbuild: rust: support stabilized flag `-Cprofile-sample-use`
 for Rust >= 1.100
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 06, 2026 at 08:35:28AM +0100, Miguel Ojeda wrote:
> Starting with Rust 1.100.0 (expected 2026-11-12), the
> `-Zprofile-sample-use` flag has been stabilized as
> `-Cprofile-sample-use` and the former is not available anymore [1].
> 
> Without this change, when building with `CLANG_AUTOFDO_PROFILE` set, one
> gets in the latest betas and nightlies:
> 
>     error: unknown unstable option: `profile-sample-use`
> 
> Thus pass the right name.
> 
> Cc: stable@vger.kernel.org # Needed in 7.3.y.
> Link: https://github.com/rust-lang/rust/pull/155942 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> I can take it via `rust-fixes` to get it in for the release, but please
> let me know if you prefer to do something else. Thanks!
> 
>  scripts/Makefile.autofdo | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..32c18df237f1 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,7 +13,7 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
> -  RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
> +  RUSTFLAGS_AUTOFDO_CLANG += $(if $(call rustc-min-version,110000),-Cprofile-sample-use,-Zprofile-sample-use)=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
>    RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
>  endif

Could we check for `-Cprofile-sample-use` directly using `rustc-option`
instead of checking the rustc version (e.g. testing
`-Cprofile-sample-use=/dev/null` or using `$(call rustc-option,...)`)?
That way toolchains that cherry-pick the stabilization (or older 1.100
nightlies from before the flag was stabilized) are also handled
properly.

Either way:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
