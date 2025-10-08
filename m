Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADFF2EBB9E
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942792; cv=none; b=ekYhR1uRD9oUGcqe8WcCRVkJrQVtXO6gpBJOOaAX3lwrlVb+roOErzuYeqbtMh51rLrBq9sIF6gx8mCXAuIo1L9Zumu0EDp6fFqISPzjIXIHMuKAD6k/tcuTazFuR2E9nKaojCwxFfjf3GGjylMe6kYL2zVIpVVdguOClvQwGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942792; c=relaxed/simple;
	bh=U6T66WCwAVe2p4J0jyxKKXb5H7i7GwEg7i80OTReVgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4PG4Q+CcFNFadejR3jqRTqiLJpDttK2pJBfdbjLuAd26JBIzKO+OR9gxPEcLnE/rgC+v69IWtuKzIasF+O0oRdv0lfF5uQ1+krIrBhQ95Gprjknsjbw6so3L+JpuasVHNPHlABKijZ86Ot9cS3E4fEldmPkd3VY/V41LvOcaJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9Lpz4ZJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9Lpz4ZJ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3737d09d123so74796881fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942789; x=1760547589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbyHQEVZUWM5+b8hXROM9euWoMjNsVjY1q+gc+HNpdk=;
        b=i9Lpz4ZJj6FKCaKoPdaH6Dt3SKPGXD6VuF9P8ZjiEdc8U0Dggs8yav0uSzlw3JPEYB
         1WFSd2V3sRgWMbdqOX8hHU53pNAZKNBt4piO1wY2Z5EoO6GSLCeMrWChf6rtv+wOo5WZ
         5QHjq4V5Z5UCH/n2yfZjjs6L/AFc3UVhC87gP2/gC88WC8pJtg/QCbHCby+ibMyDthjJ
         NlimmlOmlpThIL8inrrJ98gqaZbSJoVoGRX4rpG76bFr5dItIE/C/YLRG+o3x/8nk/SI
         iklWxA3Hn3w3N0jUbPjyohs+e+/9TpL42fFetfT8+HBwmUTFVsyFtKCHIg+LRxi2UcsL
         KSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942789; x=1760547589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbyHQEVZUWM5+b8hXROM9euWoMjNsVjY1q+gc+HNpdk=;
        b=iH2AnikwLpDLvcgj4Lt1yvaXslNZOkLuqH4PBJe1q10JPQ/SRMnuNcMcLrabwHrGS7
         ht+peurnSDRyIuavKEJ3PmBaPaMCKmnK3lmkAJnuEzvSb++zJLD09CPTr5RMlI2FsSiU
         N0zS/0dIhwtx1SfFUwWMhqvE70Q59oVwVZnGiCfJXqnDOfU9fA2St2UmD8GJbk3sFPtK
         +6kdaw/KDM1uOsDxpQg+h6VDljdPPhxFWbPc4n8Pm/E9aHpO5OqlcXxHD7jpn9kIuK9a
         ccQOeVsHE6fyFL5OcwJ2hm6oZsH8z+bzb4fvG5SC2usbwhi/jy53Tqn/d9an2AEPn9QE
         Xm6g==
X-Gm-Message-State: AOJu0YwgehpbaDeo69d7Co11+xdHfCqFTNp2FhYSbJ5GO3dZ1K1XWCIJ
	FBVRPBpe6Aq/TNh0yr5sU9y34DF7JFdYN5Wd9wYS8wZ1rCNG5/R2vZxqvEyr6uztAiKRpBikfjM
	oW3hOZd8uv+ncb9/+OQkv2ts7HdKGcZ4=
X-Gm-Gg: ASbGncuwtfoQlKL7HQBxM+wS7QSjnNF0IEkU7uoWOzaq9hhXHmWsjck+zgr9zb4SJpD
	of0r9B4vJdYxhkB9woy6SUtIOlzBgQRYfYGiWTk7X07f39zdmxXKTWpbL7Umk+JMZ2z4N51gH7v
	h3BhN1HFoTKwbGZiCsuDIxM8kvO8A0662ycdfq1PuFpA8pvvDKMIgwBESyM8HsCQvIj07mMGZiQ
	P9hIxuSDz4guQbcBkI3h0Tb6msQ6Syf4sxYZtmYqUahnqtYgoQveQQtsLoIgrUHajGvulKOrwMk
	5MrNjlUSIJiiGQD/JOTugK0FZYa43780qdmmj8ATccGPLVW8pXA/bRM=
X-Google-Smtp-Source: AGHT+IGwE31TEki+9bgtGRuJBI0XpflFmiVXP2InI4RexshP1L9r4vs0K8grtJNFkGtKKh4judP6Mucbj50jbGgWQT0=
X-Received: by 2002:a05:651c:12c3:b0:336:6c93:9726 with SMTP id
 38308e7fff4ca-37609cc1c50mr12805851fa.4.1759942788553; Wed, 08 Oct 2025
 09:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
In-Reply-To: <20251008124619.3160-3-work@onurozkan.dev>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 8 Oct 2025 09:59:12 -0700
X-Gm-Features: AS18NWB_7cIMONd68nAMOTgSvZDlnnuuRjeTROznbec4OLsuftEiYVOVmU_FLrg
Message-ID: <CAJ-ks9mtfVmP+SwZvBVuQSwViiqo2ZngSGQuU5Y7A-Q_JSwjKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: xarray: abstract `xa_alloc`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 6:05=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> Implements `alloc` function to `XArray<T>` that wraps
> `xa_alloc` safely, which will be used to generate the
> auxiliary device IDs.
>
> Resolves a task from the nova/core task list under the "XArray
> bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> file.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/xarray.rs | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 90e27cd5197e..0711ccf99fb4 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -10,7 +10,7 @@
>      ffi::c_void,
>      types::{ForeignOwnable, NotThreadSafe, Opaque},
>  };
> -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> +use core::{iter, marker::PhantomData, ops::Range, pin::Pin, ptr::NonNull=
};
>  use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
>
>  /// An array which efficiently maps sparse integer indices to owned obje=
cts.
> @@ -268,6 +268,45 @@ pub fn store(
>              Ok(unsafe { T::try_from_foreign(old) })
>          }
>      }
> +
> +    /// Allocates an empty slot within the given `limit` and stores `val=
ue` there.
> +    ///
> +    /// May drop the lock if needed to allocate memory, and then reacqui=
re it afterwards.
> +    ///
> +    /// On success, returns the allocated index.

Returning the index is not a very good abstraction. Would the
reservation API meet your needs?

https://lore.kernel.org/all/20250713-xarray-insert-reserve-v2-3-b939645808a=
2@gmail.com/

If yes, I would appreciate your tags there.
