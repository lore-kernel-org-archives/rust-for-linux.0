Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888EE23A58B
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972801; cv=none; b=RDHXcjTKhGFNEHGO6n8fYhRhN5AFGTN4EHdazhc2JYzFIiBPZTPzBny/tB4iZ/Lv1uW2QRq1ZRZBLin0SyZTP+oxcjowtffZ+y8H90pVOMXUSB9fTchlhaM8xvUzd5ljNcZ0uYGTd3zLTa+fk7qrRit3Oc+bjVDewVTcjqaMLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972801; c=relaxed/simple;
	bh=kMa+cTp7cVtK7Jj4wowRZ8VBCMhE7dbUzz+E3JS3cDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZACUvRmczlftZGtlDU4BSZ+A5qSmYAc3gDhXl+TjjWdQ1eYs3NaB28DoNVBMeeV/C7NNPg4y25h/ZiQz081nTwxjmDPcj4e5IhyMG+CON0mJF9JWzEmQgJplpilIyJvN1Lvz0RXRCJe+S2SQmptivMy+fks+IThON6MIU6+Zh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yi9/90Er; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yi9/90Er"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-638135d9f65so1346394eaf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 08:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760972798; x=1761577598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cvsTdM8sR9r6i/ag+L/0S0SgN8lzV9ZSbMcaKYBLhg=;
        b=Yi9/90ErmWeO6r0Hx9UPFZFIyQxPZn0kHfpTrcPb/A+ieq0sLo3slBIqFxzcq+4J7R
         3i6xw6SA/4xj3gVGBaIDP5zAlUGwenrKyB81GKFSMi5U00+vGs2pLyMtSaTs85eKRYSQ
         g49oSdb2/NOPzsVPWHDCZ+8LvkEBCiefjxu7k3akhRUeBFH8ok6lv7eGowAcz/6cVdf4
         AIJ2o+m+1t5PDJ4g8ul1cvC8PuJtHg6k0O/IEuBwmUrt8lvyncLC7K5uS8sBt5lzgtMx
         kMUKLLCCAI0UdnjMvpHsGbvtSIr5cIT46KJFabw0/e/QVsj2dRiiHcOhhnlr2nOyQ48c
         wg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972798; x=1761577598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cvsTdM8sR9r6i/ag+L/0S0SgN8lzV9ZSbMcaKYBLhg=;
        b=qobKhA5L6QuCtUPrjeqy5tfpuGmnf1xN/0RTmR5i38SUH4wJcfuMY0uzVhVuS92nWx
         H6jqw9k+4XUkAsDmEHEnlflWatzXjytZQ4FLbeheZCqTxdSoUVWXt823P5K1neB+3bIs
         dfzo8maqEW9iddsWr0uTc/f7oMc+dktvS8171O+neY808KtAcgoP5YeQa9+OQc2Qk2F6
         tKmdyGedz2egbUkpulWu3K4ZAQ83lLkRaIvQ9foIWO03N3U1sGdj4ia1T+IPPotvyLY1
         crI60gJPDCCoV8TXNglIW8Ed0nXAsErOBg6nXjQNwdo3mZMRU7+Bx54+Z29JC3188dla
         CMnw==
X-Forwarded-Encrypted: i=1; AJvYcCWEHJTZKaEYwx2R7qetPFzapDcvyhznH8n2nUdbWaLfUZqLfdkIR965izxmfz/N8pbzi8vyloy41RkTohlSvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/W4ddiwaMPBEvvIc2hw1C4u3gkKHasFYZnIJdF52rX6Vu4yS
	emWag8pHmnMCDT9Yn0p4MegZLJ5swamvGe7SfvZU0p60eQUqwi7tRpC147KBbBCSctK4ws1muWt
	E5IuQOQ7nV69zZmBlPDoUdcBl0SbN1YAbc9Yc4TWL
X-Gm-Gg: ASbGncvrCVQInJSuzbZwKLpAfg5g+/E+YqoexVANG/o5D9lckSy/8yybWJDTrnKEv2h
	sTonjCKg2rbW4/e4D1ddCaTHiL0cGUjzXRSNbSL53/Qdz2EEwBLiaq42CSMPVqRdR1lDEL0tBq+
	jSg0PHcn8h/tc13lxaFuN3adLEfJkioDbA5tcVHxKjkWfVxbOkpf1SB81MNnSCMxWXi96E5FTyr
	WTOVE3v4DxMBB6ZSGUvl5bFnYpYXDR5CdBZHL8+gbDdQtPuD09Va34App6YcCXrK29k8pdvKEIv
	2jJ2cO35Ysz+0G8=
X-Google-Smtp-Source: AGHT+IGLApVWeMQeO2fByoBO6Pij9zwwqsFyMyfj5mInanMo2LWamObX/M8HcZHeuRe16SDET/aQfPPnuwGDKLSGDRg=
X-Received: by 2002:a05:6870:d915:b0:3c9:b8a0:943f with SMTP id
 586e51a60fabf-3c9b8a0ef0bmr5166842fac.12.1760972798212; Mon, 20 Oct 2025
 08:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-binder-bitmap-v1-0-879bec9cddc1@google.com> <20251020-binder-bitmap-v1-2-879bec9cddc1@google.com>
In-Reply-To: <20251020-binder-bitmap-v1-2-879bec9cddc1@google.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 20 Oct 2025 17:06:26 +0200
X-Gm-Features: AS18NWDhszgBSdCYYXPR0bNQToESj1alhjrfmUHCoV3_XLimQiINBLGNymMG2fU
Message-ID: <CACQBu=VLPGq0nx6PJSnw3YBhMe4QKHiiFG0k9_Kwayj9w6nfLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: use bitmap for allocation of handles
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> To find an unused Binder handle, Rust Binder currently iterates the
> red/black tree from the beginning until it finds a gap in the keys. This
> is extremely slow.
>
> To improve the performance, add a bitmap that keeps track of which
> indices are actually in use. This allows us to quickly find an unused
> key in the red/black tree.
>
> This logic matches the approach used by C Binder. It was chosen
> partially because it's the most memory efficient solution.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 110 +++++++++++++++++++++++++++++++-=
------
>  1 file changed, 90 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index f13a747e784c84a0fb09cbf47442712106eba07c..357ba1b577c73ad3f2b525a85=
73424420577e92d 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -16,6 +16,7 @@
>
>  use kernel::{
>      bindings,
> +    bitmap::BitmapVec,
>      cred::Credential,
>      error::Error,
>      fs::file::{self, File},
> @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInfo {
>  struct ProcessNodeRefs {
>      /// Used to look up nodes using the 32-bit id that this process know=
s it by.
>      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIST_PROC=
 }>>,
> +    /// Used to quickly find unused ids in `by_handle`.
> +    handle_present: BitmapVec,

Are you going to delete rust/kernel/id_pool.rs, too?

I have no opinion on whether having an abstraction vs inlining the
functionality is worth it. I mean just in order to avoid id_pool.rs
hanging around as dead code.

Cheers,
Burak
