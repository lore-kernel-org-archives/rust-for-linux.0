Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D939598C0C
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176133; cv=pass; b=XTXN7ZsgFJHGScncTww9ezuJ1ByCypvBl814XxPXIqR7eNTzIBLafiQ6PcBvp943g+0V3hwuw6XYbs8XI3K7Qx+ZiM51y5M/ST9JY7LuKGLRG178fzHisgioFPAGabq1a+nHwjGd0nc2eg+yZX+lvqnUgjQPVZVEGfU7nK044uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176133; c=relaxed/simple;
	bh=8WAq20nES+irUK6h+NF9accpMV+Mzb8hTpIGlLHHYII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsEATkSuXmdb/dM0U0mXc2pUBFxlrpL6uZyLYmBbvQFoHpOcExjsIWTpNp3Lyg1/4+OptAxNZ71IyyrY2nRRJRdq3nDLNOm7M8GcZtUF+/6c5UUTaOU/w0lzQThpugi1HnAflkTCboMmUBX3o0UoUYWhVQGjL3+Bf7CnoGeKePw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxpb4r7s; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxpb4r7s"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018493d57so9245e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 11:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176128; cv=none;
        d=google.com; s=arc-20260327;
        b=fcXKSpibElr3MDDoxPs8nKeoGY7g+ZhYF/lRzCWJMnGKeYgE9WK+wQcOp/FAtYqdlW
         615faFKbl9WWfSBQWR+J6wfMFMPlJAFkNGtBJrBet7YSsU2cKpWe9MoBVpgXq+nE2EVg
         7Ah0DRcatK9DLU6xmuMXlBOrZ5j7HRxW7dPd51oUTaMlIWzmvIHRX4uvhanAP9iZ1UT0
         HLskNCKjhd0//QX49Qtzlo0a4GKV9A/5u7nAz7hX48SnsadZFeitnC7yRaz9xsLAaWyu
         ReUNqjz3oB1Hg0/ilwaUfa8Evk31tDAmrdiU6k2qMVt5KSGnyORfbdoH7+WVe93VvRGB
         Imvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1xjoNmScVM7o+Z3W17w/ZXE10zFAZ2XykabI7Wb19Q=;
        fh=E+0fNu3BzKD0dyHBMImSL9AybCk4PlQXfx1s6yfOue4=;
        b=bCfgfMpX3Lg28QG3lbiVbDaQLzPU4xAJXGssAfTR+TyliMVfau5qi2h3+qKmDw0xeS
         zoPDHOPv2TZ6rHIU/Q65oPGyay2a9D31up8CLHk84uHMKDW+7f1yDEHKXtxDvqntNfeS
         2B2u2xFPzb1kfwio32rfrPvHEpNgCastZtlTQ+s/KDZLBwYBDaOfKNVA3AseEaZ1M+2z
         Zdr/kcII3IQYZIeCIT4xFzkMYLtW1BKi7r9+/35DThOlsTyAgtCCjNTyM9gCL7bC1VWL
         NEw921K9dUKzoTA0q8qo0Xj0i5OvzzsShkmgSOxzuQE/pjZYW/0SmnFJnALWzgkKwJjj
         dJIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792176128; x=1792780928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1xjoNmScVM7o+Z3W17w/ZXE10zFAZ2XykabI7Wb19Q=;
        b=gxpb4r7sRqcArhtpZPQtJssR0AbzKDjQQfPDbOQSP7Rlb6c1asjH54VuLsDMD6Nz0I
         512j5hJfcioKrDIQm0L9zhGJ33ytImSeajcMkwoUSSIbuuWy2ETqdtCBssTuEnGrhFNK
         1LEWV3kZDMBduXpaJsQjbO/bWOHo0bphg+UD4XdCEbt98EgGpIf/De0+Wt3B7dxJ7DUZ
         riPICmv7T16NRjtdePd7maumr5iXpKpeCwJk70ggINPKqa3+wgEupvfKV0euURT4q8A/
         Z59LJ1FiwKTTqDXCh49Yg35Jyq+zfe8TdwXofESdWmv1qoIDi+R42IO9dX2qPsEzNytK
         5Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176128; x=1792780928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1xjoNmScVM7o+Z3W17w/ZXE10zFAZ2XykabI7Wb19Q=;
        b=vgzHtJmOLG+gy0FsuF3Chd4je2/JVfEXnbFLZkokCBB/IlERZY/pNE80u8pEmRpQf9
         fHde0mdFyRSo/LzQAUBBWyUazd+4LKAHOPj93yAkuhKioeMjwjiGaz9Jyn3XGaOKSI7z
         NXYQ1rtBP5eXuz3OeoU/2k64XeZhVRjpql1p11H3lN2iGpaPomzYDy5NNknmKfHYASN4
         DAfZrkcevMs6Bq7mAECf9J63Ot3ShzA3RdnN8ELiUk7pHszgjDM0v3izIItFtqP3QuBm
         7Wilvtouw/G5L3l+LrMrEFUzLxXT2A0VEXJSIEZd2FsIDNUWtvgQyw88ZhzlB9jegqn3
         NYnw==
X-Forwarded-Encrypted: i=1; AKwUvBxWSTqU7PPbiWO+YgrlMDYTDRFYc50i7FMqtUVHhdjSTcSJqv3HKydr/vLtPcrBhQ7lVLll6mIOUH+NDwBPyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhaMUJ/tX9HhIrktumplq7Gs/yEzqwoflWaZcSGO3PXjDNoxHv
	ce4QdEKl1K8vAigGSehyPl8mec9hXdN8uiyfuCSApJRRhkkS4mqcwu38+XOa+pqABybiXKd/Lvx
	/0XHEw2WWTa4ixnX1y1Xn91iGXgKRoMyn8+AcAM1X
X-Gm-Gg: AYBFou2Hregq1kaC/n0+Z5JKm9GhqOACuEK05avp/QjSH/ZZ2Qqv3F5rh23C/tIyono
	wQu+kfEDv6Wz+74rin9ogUeWvuaL2pNMij/rtSO2SD4Qh/uw19r+Vl8UDqtTRe5a9aqTjylzHQO
	e3ukayw3pEDdTLvI8nibFeXigUNNN3M9Gn7TkBloxGSvozlq/eX8dStYqpiafVABhiVsy+vzMqP
	yX5usDmi0mvSQNGNmU96wJ9W47CzWfaO5ACgyVkx2AHtASzcYf4ENodZdDmwQqL4P/mv2ia41C/
	EnG4uJp3D9pCuO+qmwqTmGh9gq+n4XktB8Vsgv9sO3SD3o/NycU9MmcNX1JniDcM4mgyJ4pRwIj
	/1SSxxVPnDgUCcJyfcqxRrgkzPbdMrjQLzWQT39p8MLHB6R/u/U3p2qqbCC0VbuuPPMgcFu6Vbl
	V8c3eudtS681pKPmphJq+tpreep3X2tpsX7qipZxT8XU4r
X-Received: by 2002:a05:600c:5249:b0:49e:b733:7277 with SMTP id
 5b1f17b1804b1-4a1d8942d80mr134455e9.2.1792176127813; Fri, 16 Oct 2026
 11:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com> <20261016-binder-memcg-v1-2-d659b8ae088b@google.com>
In-Reply-To: <20261016-binder-memcg-v1-2-d659b8ae088b@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Oct 2026 11:41:55 -0700
X-Gm-Features: AclHuK88AWrWkzvJx0KAHsGzJXLD0z9tLNjEcqb2uVEbpJmeuWX5FgW7WUISGzs
Message-ID: <CABdmKX1fLKvC_TnO3g_DkPjcfoXiU2rM-Fa+ZjriYctVQPkFTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: charge allocated pages to memcg
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Pages allocated for a binder VMA are currently not charged to any memory
> cgroup. Thus, use `Page::alloc_page_memcg()` to charge them to the
> owning process's `mm_struct`.
>
> Suggested-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/page_range.rs | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binde=
r/page_range.rs
> index 52ffbf3504e7..57da47243967 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -27,7 +27,7 @@
>      ffi::{c_ulong, c_void},
>      mm::{virt, Mm, MmWithUser},
>      new_mutex, new_spinlock,
> -    page::{Page, PAGE_SHIFT, PAGE_SIZE},
> +    page::{MemcgAllocError, Page, PAGE_SHIFT, PAGE_SIZE},
>      prelude::*,
>      str::CStr,
>      sync::{aref::ARef, Mutex, SpinLock},
> @@ -399,7 +399,16 @@ pub(crate) fn use_range(&self, start: usize, end: us=
ize) -> Result<()> {
>      /// Assumes that `i` is in bounds.
>      #[cold]
>      unsafe fn use_page_slow(&self, i: usize) -> Result<()> {
> -        let new_page =3D Page::alloc_page(GFP_KERNEL | __GFP_HIGHMEM | _=
_GFP_ZERO)?;
> +        let new_page =3D Page::alloc_page_memcg(GFP_KERNEL | __GFP_HIGHM=
EM | __GFP_ZERO, &self.mm)

Not related to this change, but I think it might be better to ditch
GFP_KERNEL | __GFP_HIGHMEM and use GFP_HIGHUSER. We're already mapping
this into userspace (and now charging the memcg for it).

Is current the sender here? If memory.high is exceeded, current gets
blamed for it in try_charge_memcg()'s done_restock section. So if it's
the sender, that's not exactly what we want since the sender would be
throttled for it. So I think this depends on
https://lore.kernel.org/all/20261010210957.1350874-4-shakeel.butt@linux.dev=
/.



> +            .inspect_err(|err| {
> +                if *err =3D=3D MemcgAllocError::Memcg {
> +                    binder_debug!(
> +                        FailedTransaction,
> +                        "page allocation for message to {} was blocked b=
y memory cgroup limits",
> +                        self.pid,
> +                    );
> +                }
> +            })?;
>
>          let mm_mutex =3D self.mm_lock.lock();
>          let inner =3D self.lock.lock();
>
> --
> 2.56.0.212.g129ede20d9-goog
>
