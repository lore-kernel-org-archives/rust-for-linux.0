Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2915B13CABC
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723621716; cv=none; b=jxhN1yx8lOOCyfUl6hi4WlorOsgVQDhvBtJvJH4mFuUo+qDS+PD/D3GgrFIycKqmgdLmZlSRI8/aCX/afyudF6wUzQeEJBa5hWvBw/ptgshX4JnaYlTYu2RbsaJBuNkPeNGjTrvMGKsXwjtYf8IDHo5xz3ocRxdDuxftxpNEZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723621716; c=relaxed/simple;
	bh=P7D+VZW1XS1Gzk5chH+qiZmPvALantpIIOGu3WIMPsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GpMzduY/YJ91hwVkctIt/n2uNyWinPT6sbRqQM0y8fJV80SCESVEh+FTX4HjdYvMCswvJVo12Lm0Aqmp0F9ZiwOBsGtEZ+auL6smLNfDDRgZyiYOPrgisgdwRv/mPhPaMJ67atunizfjNubrBDMIgK1nMgf23xW7PhmIkhnrxMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jOjVb8DM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jOjVb8DM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso3805097f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723621712; x=1724226512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRLxSfggsbxe3d7cfCO7JzeyIYzJnFmhVfUunHaRPJs=;
        b=jOjVb8DMA/+t5Yi7Vcg+nUWzTTTYTpi2cHbOB7hWR0Y6lR5iEy/wRmAx6Ym20g9cca
         5UW68ERolMqNN1o5wsLUTlpmiQZe//HLjcKkqCOg4mWFonlaFrBTXUV4SJWSmCiKvuit
         5UvEdZaDKS3Gln0gnEH+Ab0c84fqOcCN+BfrQBA4jjZYlQlMaWG3dw4v9NDia8tyXGTA
         3SNxXIHZNm6Mq5aYJCfTTOH8X85JXYOhneWWY2X/krCMSXdQ/msF+B++VzeJAQP/tsjn
         Jhd48abq4Hg+OWr4qeCDiYEC1MURbHgjWDj/riFf8kX//W1AZAWzyjDlUkggxc1R/S/f
         39iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723621712; x=1724226512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRLxSfggsbxe3d7cfCO7JzeyIYzJnFmhVfUunHaRPJs=;
        b=crS1UVh2li8WL3XRoZoZJV/pQZtCjMJAShgoKwNMXeHNyo+Gsyb0IrO2T0SLnti+P7
         KqCy7t/e8Y8I4PYUi8traUwaYnwcpqtO+PnfAobwrJBfHt6HKB+NZBQSaOs6KoCLz1Vh
         fdPKizg4TdFYcU3ZXrW8NyeJnQ2xz+EKXfmeTFjEpGQWGb38k8OYuCaVoaq3aaDGmpcJ
         lETy4Uue3MVJUbh3BA6v2AqaUCMUwD+E96XJJVvWW8MJ0KiXG2gnv4d79TFO7MGShYGf
         wr/KTOArgVL72eN3Fi6PBmZXh16JU8Ihb1AWA0HCXnGLxqalf/NDfx/znC0fDqZ0MZ6K
         KQJg==
X-Forwarded-Encrypted: i=1; AJvYcCXr6XuhgDh4JRS0PloRAdiM9KkLWc0XA52AOId9Zwk2PRyRVBLTIiI/+LMFEilM1w/dGXa0NBSypePZPqt45i2cCbDYWWrwL24W2T/8IDc=
X-Gm-Message-State: AOJu0YxICOEWmbX+R79FJB8zAUVZsBYcnGZ08vpTwZAxgXc1RsgQxdK/
	fZNr2+9T/ymVBrTMuXCUAdrANfJGPU90FwbNjqBEiu+qP13SPMdO+jM2q2CnOlBBvUIV9pxuV/m
	K3f0skSHLSNK0OfBIgPrDg5jTQKJlhgYdru2c
X-Google-Smtp-Source: AGHT+IFszK04DfhyjnHB8HAsiUvfKiYaTBLS5Cci2eet/nobda0BRm8km1MdiKanezp8dm7Kg4wNR4OK+iD9anVVD1g=
X-Received: by 2002:adf:f5cc:0:b0:366:e9f3:c242 with SMTP id
 ffacd0b85a97d-37177756be4mr1218451f8f.12.1723621712012; Wed, 14 Aug 2024
 00:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-9-dakr@kernel.org>
In-Reply-To: <20240812182355.11641-9-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 14 Aug 2024 09:48:19 +0200
Message-ID: <CAH5fLggyf=MAKvryzU5vEWFs9RSzjNOiPcz-V-MvCx8WKNiAQg@mail.gmail.com>
Subject: Re: [PATCH v5 08/26] rust: alloc: add __GFP_NOWARN to `Flags`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 8:24=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Some test cases in subsequent patches provoke allocation failures. Add
> `__GFP_NOWARN` to enable test cases to silence unpleasant warnings.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/bindings/bindings_helper.h | 1 +
>  rust/kernel/alloc.rs            | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index b940a5777330..7f781256fda9 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -31,4 +31,5 @@ const gfp_t RUST_CONST_HELPER_GFP_KERNEL_ACCOUNT =3D GF=
P_KERNEL_ACCOUNT;
>  const gfp_t RUST_CONST_HELPER_GFP_NOWAIT =3D GFP_NOWAIT;
>  const gfp_t RUST_CONST_HELPER___GFP_ZERO =3D __GFP_ZERO;
>  const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM =3D ___GFP_HIGHMEM;
> +const gfp_t RUST_CONST_HELPER___GFP_NOWARN =3D ___GFP_NOWARN;
>  const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D BLK_FEAT_=
ROTATIONAL;
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index f0c80ab78602..295107777a12 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -91,6 +91,11 @@ pub mod flags {
>      /// use any filesystem callback.  It is very likely to fail to alloc=
ate memory, even for very
>      /// small allocations.
>      pub const GFP_NOWAIT: Flags =3D Flags(bindings::GFP_NOWAIT);
> +
> +    /// Suppresses allocation failure reports.
> +    ///
> +    /// This is normally or'd with other flags.
> +    pub const __GFP_NOWARN: Flags =3D Flags(bindings::__GFP_NOWARN);
>  }
>
>  /// The kernel's [`Allocator`] trait.
> --
> 2.45.2
>
