Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792576699;
	b=pJEoV9k0vR22uj+AMnAmQiWI4LnmBVsUOpvwCTwprFmP56cqGrJ3Rhmfj6DF5ph2L/yy
	 9/yqdAGEK8IhINchrXLAcbMmC6gSuRR2S1SC4zO8fRj+Ji/98TOBG+V7AUm2hMZYSrwvx
	 6K7hqRUE+/t6I64O4yjGwi2BvdTZ733N9dP9eHP4ZVAwVveq+hv/syieunarAsNTNkpPM
	 6Ulo8WRdVWbd34atxVI9nRAzRNpHz0ayOrMiLtTrXYMbWePBPWWlNHEUhB8rCAnD+3yj5
	 tDIjGtX0Rx1dSm3+ny4XJzucPMm+Nnthzblyvnd4gQOwC0oQLHS38BWQh9WcSRtQjQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
	b=V5GFCttaXayji/E0C9xXtXTa/lgi0qEcoDPfO5tb8Oruw04uirUWt5NRAijmTgltqL+x
	 GhfdLlA6yc4xThAn77/4Az8ymQPZ8gdO3nMV2oUr+RzSwlzIcAa+g9Cfsal4a0oVQ0AYX
	 0ehtQA5S7GDrY16zxKHim5jsfX4teHguIHG6zrl3jo4dJ3P2QpgQ7ieTymP75/KjkjP14
	 2T+NhFDt4cLa/VIZC3l2zKrwWjSrctCyaeWMC+DlCRtcVAgPasq7lC2VlINWdXEcmUfj0
	 aLsVn1trr4G3/hhBModCI/rTd0/9rl+uuSJgVPn4J9ELZCzrMlvSgyuhJQC/8n4SX5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sU8kgkoB;
	arc=fail smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF350606A319
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF350606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sU8kgkoB
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso344289f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792576697; cv=none;
        d=google.com; s=arc-20260327;
        b=kf2/1IYbjwVb3AJAh7m5aWibMiGzWdiBLGAVn4k50TC9XdB/geeStehwnxw/IgoWm7
         eGk63qSvHUDK4dafIYg+gKf9FWkfIit2oLjZy2q5Ioi2soihMH38hLKOkWVqN3eXCpQ3
         eCuvsvKveF/ktJ3nOCgG2BzCWbMIuro50ihI4yQwuGeFa/TlAHRESFAUa4yLiKig5mxw
         nQ+yFa7DQbAfm6MVqBRBweUGrh9zKVUpETyFTbtI8XmpZNcOgrB78Cm9WKR0MJ+jJm6h
         4hzSg5OHLIL186mSMq3M6iqDk6wG/DEfjwUH+ed0CWwZHTlP9fa6Z57S0O4i0wWA+J7c
         ivHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
        fh=FS7HlY0qJOUW3yuNUDCXaasSOJF8j8pEbbd2uN4rRJw=;
        b=YUR473/U5GAFpyemdyz9px/yoIZ0BpXb9gLKGnGa/1gsFAORZrIdadyUcCIZ60LphY
         Sc+FKKbvMqcz3XBijSj1R1PA9jsBUMqRhXzT61dYzr6ezpoHvizm6eLlDlw+tm8W/TtL
         3DxJsafhT1Q9BzKvVhI4rGvKbg1lRdMUjzXCoL7rCkHUC1lJ9KG9U7xl4McBgNEoGIrc
         w9TEoa0OvHB77CLMdGC30pHiQQZjDnIME9O5h+mf+TtQeaXgEnb7sx2I9YyM8IWwjU7Y
         fZolo5b9Ldw8znjBqZehiFaIKHfjKIdXb1jTokOc/+o6YGhJ7RoAhCAV0O8uavLYTcns
         cCkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792576697; x=1793181497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
        b=sU8kgkoB9ynNNnJaWAUyj5p0ZC36yApSyKpwXoLYv432THGCufRhJ2eLAxXiLTzjCn
         QwAN3yZ4nfhA/U8ab9UwntdeH96EyjElbkPMUc+ieNBaPRXoi5Ovtu0b2UKcq1cB/xkt
         dY6aE4t9dt91hW9h6pUFfRJmQAr0y592rMAfV1WuxKVqKq6E9WNv3QDlM/sX3plRVIFi
         DJTBHbSzk/h+8ZTT6wagwxtSViwsiTJ9L5ld86MdUhmU07hutHot4rsfIiRpblGd3a2Z
         SIM4FkaE9m3elucNPhbJjYKhMaevyJxL6nDvwS0rrfXI/At/SbCdb+iAKaunwkxxhLCO
         EweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576697; x=1793181497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8u5x/k7uhu0io8bcLigXaRCmRBBkRV/Jd+DLl2yKI0=;
        b=s72g+46kezc/YwJJvbFqT/3+jMcod9QkT3uo0XkP6GC1zCQVeWxgqAnmYpeESd3nFs
         ZjhCgVZ/JfX/luX0eHl0VQ4SzZmQcIRJx7ers0tjQJ7ScehVq7J4FdibYg9oX0i5Alaa
         H02MWyUPEswWVsvuLmFy/QnYxnCbd9p2SHCxNGPHIt2tRF20X/0vIGeuaw0Jr+5u8ZXF
         bU/92jZGN7bAdzwbn84Vn+331xu6W+JHwMFNIi1RrIRQxxnmX+pBMfh7M/RdNrJDJztE
         tZ3seWjjanCVVHmug4vXRhbGeJ89fpxYR7ifqU7lalJQ0LY8AeE1A5qfCBbjqXGyPxeX
         BEtg==
X-Forwarded-Encrypted: i=1; AKwUvBwqPM293SOsGP5JYd4RIS/BsvjUcFhuXOpzBfGd/4mk2hkG3pk6sw7Pu3aodhXbzPAFaV7R6NBWTcQ0tRdS9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPXE8PwXQmvLDkOotJBKlJ5JUtAH/1aD0oyLDSL2ozeWGP/b2Q
	jSSLfMQog+Omq6JigN+/wjy3djVzXpcBzVTPErQtRczeIjOc2r5a5dS+NnLT6wXX5Q0P0F/eoj9
	K9L/65gtH+kC/mdGwWq1HHt7bVR1tWCRSdpYNzICf
X-Gm-Gg: AYBFou21QUyOdDpmAlacoUMnjsRoYjRgCQAkbVmCc513JUu9nJ2cJ50CEWCPmAdng+W
	Ca7HIq9AZ0I0ahCXHS5Imn5lmulUFmS30sBXz43l+L5UULTEh+/JmApbBZQA95MXl1e/hM+gCsJ
	Xkw0hCu47R0AtjIDDc9lY1hUoxdKpxKuPX8+E+ygPFE/Q5B2I+KA4rJDhNTt9gxluV2hjboAwHw
	jAfL7DRAcDE/Tn2q/sbF2QK8I09RSt/xqtijIpNM7SrNAOf1RcnAkNvPLRq/1zpxQrh9FrsSOsZ
	lJ3LLmMLg7Et2HnEC3CkhOJpKT4wKbFY7w8o7prKihb+jI8D0UJAwJBm9Lxp1Famn8dIPs9FrOW
	gf8sx/skhF/WfATbpp1ByNRzhfrv5cz5ELpq2qhLL7VMxUoIbP9fujmGvaysA6/pbuJWClUH0VR
	XqPJe8Cu6D+dKK1iukgPheIBTiQdBeuasuKRw06SXFa932
X-Received: by 2002:a05:6000:2408:b0:48d:fbf4:895e with SMTP id
 ffacd0b85a97d-48e264a2f90mr3189902f8f.11.1792576696607; Wed, 21 Oct 2026
 02:58:16 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
 <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
 <atiKAh5e4BjYgHSu@google.com> <CANiq72=rN04D4EEL=cR_BvZpeTh3SGEdQ4YpFQLF8+u3rvyzjw@mail.gmail.com>
In-Reply-To: <CANiq72=rN04D4EEL=cR_BvZpeTh3SGEdQ4YpFQLF8+u3rvyzjw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Oct 2026 11:58:03 +0200
X-Gm-Features: AclHuK-LiJpS1IrS1VEnRgOcXIRnC-bThS0_zTbTA57_6N7DRMBinWmsvVfdUzo
Message-ID: <CAH5fLgiVaZLAuih0uRMfY_9UpQ3ARC2Oj77JEgnKYG1N0gnZCQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:49=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 21, 2026 at 11:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > The version that open codes it is probably what we will cherry-pick to
> > Android's kernel branches for now, but we can definitely look into how
> > to best support non-0x prefixes in a better way.
>
> I meant later to clean this up, not here, i.e. no need to delay this of c=
ourse.

If you're ok with landing this as-is and fixing it in a follow-up,
then let's do that.
