Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE233DF003
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796004; cv=pass; b=jGxPZQwVuFGO/jjQv9RB5lPRRHFRRqxSgJH5XhiLAkZIpZUj7LSTyOOcEDgTep+GBR46qj5eUgStlAqW0IyjuF5E4l61nlhoTns4OALMa79IpVfLfffOemlp1THl5T3qI0Fczp50GZfZc6r4rZ6rnZ7D6AeO6amV7zyOpeMUr+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796004; c=relaxed/simple;
	bh=u3I8VLQKpLTnG3MI3XGVx296ElrZ03Ck3HXpcLq/lvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQ4I4OYxpsNWGqlW0Tt9PnWeH74uean6cunK3bwtMxS75YgsQMqC2lYNMOeR9P7UEp70icRN0cg0ATbBqOEDGJKgHC8N6oKLn9MmbY8BhoGH0Sw3WuZX6eVEfi2rIMUUQUvgpxADR3zB/PM7vbfQHPLR+ZSIaJonWhgvqo+UN50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1BSzLaC; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O1BSzLaC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso9147154f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 04:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779795997; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNyghgN+bL9ID2Jo9T3Ui1z9B+JqAipVN4af3wpvP8UqEfuwnGv2YEQoDZVevggVbh
         z76BZwtxxAj0uJlXEx+ZXVLR5Dg1M2Xt3Hcu3BoRfSInXcDtUEFrTJ3p1OL7Hfx+QIv0
         YJrlroc+WcbQsGHNvpbV+kyvx+ZKv1UZaFIjoAN0PIcpaQO9gRzHxt2T5XLEUU4TawCt
         T3MmMVp/OR564wTdbUTu5r6SfVI64o2b1P1f+5jgVPAUC0lcSIjMBLOnl5AIIeGF0bRK
         7Ndq0Hm/DZKpEZ3/g32ugBPDqoeFBnu3CJXi+f1QjCgptdIu6q0IZ4yHaE56mX44//Or
         Fjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C59uDkbTg0KNC15LrU3yiuPY7rPNolevRZyFrFkt4ZY=;
        fh=McXSCKYciwgNbhpGtMVlWutu/5fM8YxWr3T8bztoNlI=;
        b=O3qPi9ghyac8DGx3A0Br5Ggc7pheHHOZXHSoBWfIm2qCNMTXDGyoTQp7VCRtpOeZSb
         4zqVjwxNBoFDWeZEYjvdjkd6Q3NI2RuwBmRmjuepBehGc2CPN2abUSAZNK+tzWG+R3m3
         9ddnzFK73MlzSPxlgTqshesE0kPxBHPI/HbeW3BJgO3wEQgxNmpqFwXLuiq+xG7KXHRj
         cahgQvAzgEtetJP/H5huANb+pxRQ+Ab+eAMcAWgAhRjO8TQtvcZ3Sjr/LzwSXnq8SI5N
         +UGXHW8P/azZDu+g9FM/2yfFbearrXPcn1tDMPE+LekYtyO6HGj2n14u3BIdWCCYNvrz
         Pkvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779795997; x=1780400797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C59uDkbTg0KNC15LrU3yiuPY7rPNolevRZyFrFkt4ZY=;
        b=O1BSzLaCXmffG5fC5H0WXnhfadHZa7YkXuJCHXaXmptUfxtmBGDtR6kmTu5a6NI8YH
         nw42elfx5rNieJ3sUgsNSjnVA3GK4bQ/jbP9x7EBajRGvKYTolZ9mwZXSUFOofO8uiJZ
         crYV7WSLEbi62nhbQwDW+k4EZY1L6JzPNRY8TlLSMnrI4O7AN1FujHikdMHwOORy/ps/
         48CvkVamNP/Wkuttl2/E/MQ58gHDsOfpyOfGpUywlWeUJUh1PLAiMRLefu9d2TmNsbkm
         eMyZy48qWgxiDAyH/BqIwGQBAwXg0aywJQc2TpWe3EL9knCEF17fXWmi5GLByyBXH+sy
         Qpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795997; x=1780400797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C59uDkbTg0KNC15LrU3yiuPY7rPNolevRZyFrFkt4ZY=;
        b=mBV+qZ4TX3htwUvqo2zXF/234EH5++w7CY3tqyblwWbip1fnsSQZ9OT2JtnEl8M0jL
         c8n9gBTztV4Si6wHKJ94VKx9y3DfoEwcudUay7pEXucmw0S5gNIuuwjB0QhEn0XzTVbV
         YOsO6kr/j8sc94hb2Xw5uaB6Va+5dYX/HGZZtVuRYZnXHfZQ3+6WbFe85BDj5225brV5
         tiWpP5p7nlcPhAYK38luSWUvzp4dF0ggvEgAtZ3F8FUt0JiPHqmp35FcShNkGijRXptS
         89mBT0MgSdATvCv/J3cOIG3FU2m28xPu8USlacb5LoY8nmcmNHXTYSVZ2XrThE1EvLl/
         czNA==
X-Forwarded-Encrypted: i=1; AFNElJ/qPiKPon3PdRsDrLmud6UNnM/zcAghP6ah7XcFLG63Yru9YDPIr7N0OqKqGFFLghRwL9QkPXYNnE9JBAzeEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybfDleMkxDKpV5KntX2jZ0inoGFpRc+6ntZN3AQxx0JwAIYclg
	9Hj3hXrTYoEdHgq5MwcaH0AZUgrdEUlaaFGLlcAGJNCRMuBQvML1GfDwey6PjLC2lfO8x1PeR7s
	HeGsp+oWOhHci7EnQRVd5f1dsdd1RnnPqQDO6XiVR
X-Gm-Gg: Acq92OEXCgInJoIyLuKFWmHo71P5Tr9SAdykDICjwykPz5NsK0GmYHgCD3ACymP1hsz
	NPbLL082fKtwuCtvyq8PcBtzvE0vOdGUsd062rYSghk114isJZw7DjJ4qhd9fjZ1aKEoSX8q4wJ
	5PkBDu0KQdkgpKb8BnCyXoQzo7Yu06cOxL5Gcz2ECwRIRkJ+0GmLR0FhGMmlAySyoWQz29Bc4fJ
	9xRn3xriVKvDucEiliEjU+bwuYGG2xomt5STJYHY/Cyz6sl5EcCCm03/o74MB/zgwFYTn4c5t+V
	JGf0DnJ7uirGIVd0HDPnNAArYxhWzLOOqtNmROH6o4lxru0R
X-Received: by 2002:a05:6000:1883:b0:45d:402f:d514 with SMTP id
 ffacd0b85a97d-45eb38ca4bcmr31353208f8f.39.1779795996548; Tue, 26 May 2026
 04:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
In-Reply-To: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 26 May 2026 13:46:24 +0200
X-Gm-Features: AVHnY4Kf_hTx4XDH9Bn9vT18eth8yn3_-RcWr0U8HvLXiREDm7KpJdcUodSrrw8
Message-ID: <CAH5fLggFY8LTYSE9wJ71+FWZF5B+xWDk6YfhUMuBHAOPM6U0Xg@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: add is_vmalloc_addr wrapper for NOMMU builds
To: shivamkalra98@zohomail.in
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 8:54=E2=80=AFPM Shivam Kalra via B4 Relay
<devnull+shivamkalra98.zohomail.in@kernel.org> wrote:
>
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> Commit 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> introduced a call to bindings::is_vmalloc_addr(). However, this
> fails to compile on architectures where CONFIG_MMU is disabled,
> resulting in the following build error:
>
>     error[E0425]: cannot find function is_vmalloc_addr in crate bindings
>
> When CONFIG_MMU is not set, is_vmalloc_addr() is defined as a
> static inline function in <linux/mm.h> that unconditionally
> returns false. Because bindgen skips static inline functions
> when generating bindings, the symbol is completely missing from
> the Rust bindings crate.
>
> Fix this by providing a C helper wrapper, rust_helper_is_vmalloc_addr(),
> in rust/helpers/vmalloc.c. This ensures the function is reliably
> exposed to Rust regardless of the MMU configuration. On NOMMU builds,
> this allows KVVec::shrink_to() to successfully compile and correctly
> route all allocations through the kmalloc realloc path.
>
> Fixes: 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605220811.LRplxeBR-lkp@i=
ntel.com/
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
