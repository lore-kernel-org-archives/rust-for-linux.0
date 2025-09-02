Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8E327466D
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804860; cv=none; b=PheKKADCl/Ex3qTrKqpOHfow++Erm6Y7q3kirCpHi2D1wswApSivqrQgTIDJIEc6NhCWpHB3jikvTVfnmK2OqAKptZONEhs2wEVkhdDyjKc+sdYqEClJDX2uwzfE+rxzoc/h22SG59knYBypKJHFfm7UR6+0GJivgXSr1FossuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804860; c=relaxed/simple;
	bh=PP8f5cfdzO4t+x3skUqCI9ymFSb6YayBlL4v808HjqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G31yZ2i/JLUCc/1U3JIYMPbmpSzgXres2+4jtlF1p0S2Lp2aiHZrtCc3Cya1rHs+iaXJfVLgz+Dz0pMo1G2K9SxmRXTgPscf37Py5dhsjq/Cg5H9TBMHJsNidW3caI6G7EkCkCdbeDSwHKzM4W2UvaAk9/pLzzLIidTOerF/0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTYlTtuq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTYlTtuq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244582738b5so44868835ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756804858; x=1757409658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss37VwGHGwfNGHoAukVoV+///HkHISBBHsFOezrTjro=;
        b=fTYlTtuqaiMRfGOdygvfHNG5T1rmXwFveiAXWXM1PHQ0EY0j0UFku4MxYqWkbog3lT
         M4gr6U9o+2YK41Z0fKSv3cRy4+DoXJ0hQHxWWJdnFPo0aFNA0zFLe0DQN11p+Ew4RLFM
         ASrs5RG0vaOFayMHm4Aw2Z2XpFSXFlcH4IBVuiBSRuve9u46k2DJ7n/9t5ds8jReMfr/
         PxeEZJTiF0FXjzUGe63brI95106L+Mrj8iJb8DWoV2PP6+EGtUowmLCwlZVbI+gDhVwF
         hOsNu1A6Cx8NPcxctorVE1NTzOvYwpFxZirA6b5T5xppDiOIY3M0kNgAwqxqRy7NBWKx
         pnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804858; x=1757409658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss37VwGHGwfNGHoAukVoV+///HkHISBBHsFOezrTjro=;
        b=YhCyLz8oMT8f9FUtBY95aFvqIDXZnJlPa5AiL4DSsamSPFpsl3/tRttoPgOuX8cLIT
         fmar3ZeqClh9jXxUMDlXEP4nQHJtXzLQoUz0QhpNT4m8oOzDQAxBghPmcveNakLfQx3u
         6IirtR1/pQ+bSCDtX4/l4ixbNXm7zzL9NFqDIBzQDapKkoWCj76S2ML0gNLV8p6maQlB
         r/8E4e/gxhEsqCZhexl40RZiC53ZQGl4MvuR8v3+5dZad8Ur2fU5etiSDKQGM8s3N06b
         GXrOeEhJnUZZCUClAp5l7VE6L1w1P6IwmUnKY6ap9Jh/rlTay046+3AAPM+uZxP6kxzd
         l7BA==
X-Forwarded-Encrypted: i=1; AJvYcCXtPZEKz4a5z5wVCIjEZhvHq/KDp7rOTRXavS3rqCKTRVyteqfGk5RkxGStieGnveRPUDdiqSpZdRK2QdOcjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiloT4ogcjxLwsOjAART4Vvjow2oUm1Cw/MYEVcCByOcpl7vCg
	Q8t9p+z1AWp/ICiLqxKaTGd92pGK/dYJVtprSEQI1NEjW8QBp5xwe/GfncFCIWwXt+8=
X-Gm-Gg: ASbGnctnsQvDHHDI44gMP/NkxUq4vO2fHpnIOTdd3u3kw3QahylPZUPoDji4uF6XbSg
	Lr22HKK9cAEL9r5shG93hq8dsIngW+BY/gitJBARG4+e5LiUBDvX+tIrsRj1cur0ytrjmst8wkF
	h2+2AWzy7CZ6Q1YOZOGQX9yloCWq0XE0IzSqvE//N82aTio2g5+IoaQZdFJHoeqHcUtYCXpm8RR
	oY/pJo6CQPVV8WpMIYubBUui1zwGDrMcMHn1ss50wb3bdm9h7j5wwjgsom0toWE4ac9SfxAe2+N
	CprF/wXs/yqu4ZzMb6Hy0Tg/ao12CQEY8AfmnwX/U8NWulacjBQZB4737/dBTKwqPG4hKmPNHA3
	97eTzhP4dOOGQb+RM2l6VXKva
X-Google-Smtp-Source: AGHT+IHpW84hA9S7YWGsA0vad0zfTfIVlEMmeXC8MeN+yuFKuiIJc+AQgWuVakBpFr/lDGmitqbPGg==
X-Received: by 2002:a17:902:d2cb:b0:246:eb4d:80c8 with SMTP id d9443c01a7336-24944aa2cbamr144340565ad.34.1756804858064;
        Tue, 02 Sep 2025 02:20:58 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da1b35sm127434255ad.84.2025.09.02.02.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:20:57 -0700 (PDT)
Date: Tue, 2 Sep 2025 14:50:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Trevor Chan <trev@trevrosa.dev>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, airlied@gmail.com,
	simona@ffwll.ch, aliceryhl@google.com, vireshk@kernel.org,
	nm@ti.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	bhelgaas@google.com, kwilczynski@kernel.org, jack@suse.cz
Subject: Re: [PATCH v2] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <20250902092055.jlgcjc32xcysev4c@vireshk-i7>
References: <20250902090638.785-1-trev@trevrosa.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902090638.785-1-trev@trevrosa.dev>

On 02-09-25, 17:06, Trevor Chan wrote:
> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index 08126035d2c6..e0b8802f3c5f 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -1043,9 +1043,9 @@ unsafe impl Sync for OPP {}
>  
>  /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
>  unsafe impl AlwaysRefCounted for OPP {
> -    fn inc_ref(&self) {
> +    fn inc_ref(obj: &Self) {
>          // SAFETY: The existence of a shared reference means that the refcount is nonzero.
> -        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
> +        unsafe { bindings::dev_pm_opp_get(obj.0.get()) };
>      }
>  
>      unsafe fn dec_ref(obj: ptr::NonNull<Self>) {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
