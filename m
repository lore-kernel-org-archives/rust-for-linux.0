Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2A3A1E8C
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766846957; cv=none; b=eu4oX/lG7fYL4uT/OcRBVS3jdWLkeTMQ6MkaZst/Rh5vWdIu8KHp5LKicd58rEyKs8thN72keQ//62Zh6/ailmwr/P71CTJgowuxxwD89x9IgNEfvLSA6SYP+8eCtaCRXJaP/6xfFk2vZu0TP6wTGTLyZF3i/fJBffYscEBxLBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766846957; c=relaxed/simple;
	bh=LcWn2bbE8A83wNHZy4T7Wl+vywTQm8uIzHG6lDBDkCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/jo+Cl+6Dwe8CxhOq/7KsmGJouPQkO3xnlZBIzlpFZD/wy6wprP///Z9zgLGzKD1WmAbp6gC55vmsFETYAS72OWMjZKTSjPKEo2n472rhiQYx8d7Dpaxz/c39/e0I7XDk9aLbmvCpB/kzsNOgUrHcK+hD4/W8AV58G/FmRvi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTMaEUhb; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTMaEUhb"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c7533dbd87so5872198a34.2
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766846954; x=1767451754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBlnkuaKKX2VPdavalFvtGi9Qmh1rena/K6JRP1mYOY=;
        b=MTMaEUhbO9+ldLnZ0+/CPChQANFO8ZnX+IKusVS7KnWzz9bZZwdUkYFuADjxpuBhwM
         wF6kKtUyvy7I+UrOKYIMUVvCHNPamEjAqC5g9Q1TLrb/TKL7mtcVnPYqUnLB5Mz/feXD
         MKBw06jIWFb8oxLpN1VHEhUpxV7w6pVP3QKUR8nqYwihp5iv25mUwPm5BGzCvEFbG/SY
         IDccZ1S5o22alc9HycKNxAC+/2fmklwqDsmBCgagJQrZhbvRIJgFWGCh9U+WKEDe9hPS
         6YAD/OXiM3PMfH52H3qX0GBZKOHACUb7+NAvsA4gFHhTZGf3rfG4PRmWqL8oUkIiZsZk
         zV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766846954; x=1767451754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBlnkuaKKX2VPdavalFvtGi9Qmh1rena/K6JRP1mYOY=;
        b=is8unUI5GKSB//u8U2oMre1ZXOKJPNOMwi5USzjdiw5BLICuTJAb+oFPFcmXgLd2nd
         iBZMrgwhXbQNBlvyngnCWO/v//H9hv2xfyZZcC/c096tzPja6BkYLL2KK0yfM6w95G2J
         Y2aFfQeHqrwU4UIfH++UmmIP7QBda+NalRs1ZRe55mk6lO9yMaf0xVTOrv1EBW0JooSk
         RvTPLlHyQuWZ6k0bevSwQMwDCDC+k4wZifvWAOZIrnHRvH7+rbrT2bP1GqjLsPYVmy0e
         OPjVcvWJOLoRbt4dnWNS7DaaaBQlwvCVAH8ahtEoLas7mVa66XQTa9+qB+KbGtaOV+85
         ebYw==
X-Forwarded-Encrypted: i=1; AJvYcCUuuArODQsVFnONDQdqmO4g3TC958LPW3Sg2TnhQlEDCo+xadu4MKFRCUYlt2/qbHHD5osm7L8WaBXe7ie3/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ/RgHD2mG68cedhpcIcUTAk8fUmjGZBsu48/BqycXpnlHCObg
	tbvWT2BaH+4a/Lq6ckBu/6o273GVuWQ3QgcuBRGvOyzsTua35uk77Nfn7Nwq9FaL
X-Gm-Gg: AY/fxX4H5Dvlo9FHjMwpoFO5q0XS9+6AFcIsmkpe+EDyTN+/scgjX9azswzSjB11Wf3
	TTz0kvg5zNCsDFQjJN9UyGvua/AZ5/F0a1VdF/LVx8uuGlGoBxf6vdI7UKvQLjg1DeDDSvZ1XeJ
	jYRVbhXR2nGNFD6ETByd5DfCFmljFn9DFweumz8IHFINci9dq5ygStYW5B5VH0PqD9d5HnhnAY5
	tiCys52Lfu0LRl3Czgg90PVsMw6Idb/sPUxaayS6t6y85QMKT1YHuQiT+q+Q/PeQeh88JWKWrP7
	LeGFkSulWKwKLlLcj/8s/5nomDMFrCo4XiWQvgqRESq+C1W6h//GU4OrWhMHCZ7Z3JxnmTMivQC
	+mVLeqOf5UMV4ohCzrxP3bijSDQVMWE6nm+OZz3ID5py2oE+tmgSqiU4BhPV6/Z7PP/Kv/B8O0n
	7n6K39pyO3zYTsmUWO5P+9tYQmjv0iRfawx3aXjy4iNo1JwY2R4VjjYKpF
X-Google-Smtp-Source: AGHT+IF/bul/A1rkquUeTn1spN7LmI9rau8Afi9yGw+Tz6foKTeZICXMfJdGUj7f2EJeLEyjRfdF6w==
X-Received: by 2002:a05:6830:2692:b0:7c7:6479:38ce with SMTP id 46e09a7af769-7cc66a1a490mr13440618a34.18.1766846954526;
        Sat, 27 Dec 2025 06:49:14 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66645494sm17300176a34.0.2025.12.27.06.49.14
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 06:49:14 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6cc44ff62so5894803a34.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 06:49:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWj+cOCJY427x+S0nb1IddbO76JkU03EPCQ4jZzCHmPsfeLMquZpAl3/H9jqNklWqfGXBiNHYqE2OAUpGx6bQ==@vger.kernel.org
X-Received: by 2002:a05:6820:2d8e:20b0:65c:f660:57be with SMTP id
 006d021491bc7-65d0eaa43abmr9144763eaf.37.1766846953804; Sat, 27 Dec 2025
 06:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_58EDE157C8C700CFF88DA204B7492A113508@qq.com>
In-Reply-To: <tencent_58EDE157C8C700CFF88DA204B7492A113508@qq.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 27 Dec 2025 16:49:03 +0200
X-Gmail-Original-Message-ID: <CAKBF=psYA77D4BbXch7=h3R5jbkpG0FgHH9XHC0DCg=n70480Q@mail.gmail.com>
X-Gm-Features: AQt7F2pTytpFDQcXCszw3nvLYvsC9Z4O6SLcTcyoz3Ac2FgrfzYhnIA9nqqYTZw
Message-ID: <CAKBF=psYA77D4BbXch7=h3R5jbkpG0FgHH9XHC0DCg=n70480Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: cpumask: rename methods of Cpumask for clarity
 and consistency
To: Yilin Chen <1479826151@qq.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Dec 2025 at 18:08, Yilin Chen <1479826151@qq.com> wrote:
>
> Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
> align with the established naming convention for constructing types
> from raw pointers in the kernel's Rust codebase.
>
> Signed-off-by: Yilin <1479826151@qq.com>

Alice already pointed out this in v1 of the patch [1]. You need real name here.
So this probably needs be "Yilin Chen <...>". This also needs to be fixed in
other patches you have sent to the list.

[1]: https://lore.kernel.org/rust-for-linux/aUMUA_JWalyGQdAx@google.com/#t

> ---

This patch V2. Here after "---" you need to have changelog and usually it is
good idea to have link to old patch too. For new developers I personally suggest
to check b4 tool. That will make it easier to do new versions of patches.

Overall nice work and welcome to kernel Rust development.

    Argillander
