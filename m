Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2690E30BB9E
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 04:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760673904; cv=none; b=Eoa1eWWNisXfDwAyV2t56w1coNDm9BJf/KHCbGq3QiRHJDm/r38W0CE9AMYn2aMKSUvCL0kspY5Gr8lpq9IRT5UAS9GsMhim2aSy6zBi2glC5AzlnJpSkv7KnLT5YuVrZ1+pQv0lQmOeEaDgOwWNSv/Ln8vrkgJ86bs644raOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760673904; c=relaxed/simple;
	bh=if0Z65l0iVhtqX7EJ2LAVIPGjJ2azbvYwOOzwnLay28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OF8ZdHzIRoJZuqRcCJN+JzAtP9w5DK3gXIxDmmZX8um+T4c/gm6zrZZ7LVNofF/Zen0wpt9HpZKAFzvd4m1UniJ+nH60UNyX4rQ5SAfTFYjg3xj7YMt4mJNUhFoCQsI8I/ZNb/ROXa80YBwuLbPWU8ErgwrQvp1DX+p3snMIjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yH3HiPNV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yH3HiPNV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so19144145ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 21:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760673901; x=1761278701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yTr8XYfVKTbUORpK+gdA/VSO6LmqQtreJ6mNFyN7AA=;
        b=yH3HiPNVqT7TeMPYZQ8eVgmKeW2i6SOA55ddHBELyM89fNjkyuP4hqXPVItkNThNJh
         mZ3bcpFim9K1Bsygvbqg1wm83Y5WQYhG/yy1vlNtNwGa3cFI/l6RL7Gtt2mdd0V1wBI4
         GAbSqmHJPSzGW12Vgl9gW3dIRMBgUA3Jvm80k1QPpBvQ6EJczV+Zn1/gkobOs3L0rc3K
         6QzbnsOLVYOnyjWUzOLg2XppJzD4C65eCBPgL1ncrPdWmY+a2NepMMlG7b6KCYMetZV9
         4OfQgGd45kS2wkxO9Ga6GcoY8+5bgvJ1hkXudq3XcKwKpgOCJVzNOxuXFhcPYpvsqJ/h
         TCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760673901; x=1761278701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yTr8XYfVKTbUORpK+gdA/VSO6LmqQtreJ6mNFyN7AA=;
        b=kYKuHVG96hewbccQhLEzCyaUvSzUop/dgMA5qmi1Os3St9BKd7Uj2v/rrXbKOxX2L1
         y6Dd0xlxDmPaGLiftne8nSc7KqJpVGrty/1Z0HfMOKt3DNB0Hygs6M0WmWUibqKQ34kO
         kO/wITY6T5rp5bN6a3xg8t3cBbIF7uV0w/qyW1xnRzLji8ju8MegUgXc2X6svExtP4ab
         1IDWglj1w4FjkLDwH226XyCIsImFHFQ9Nrms1MlaT2ffdyxbtCfEPtCZ7alDxKDtsHaj
         6PjYAPiFZMebZarmX4LJuKV5WCkUuxVUMBGBBX7cabR3RTfUe1oauLHNP2qNjewNsLPG
         3peg==
X-Forwarded-Encrypted: i=1; AJvYcCURd1QBAkIjpM2M4wJm8VpG1j42wDCw2kwpnz1YWslZLVC2ApvjchmFj0HuzWxchBJKjr/nQEys6Z3PY3qbPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNu0TTpslX+mA8W3KY/e3hQ5GVJa3Ox0MAc1AJW3/pde4tn2CV
	P5zcOWvMmXgMQB3VM2LVMau/Vsb930VxU8YBJ6NhetZpOWd63CX49A5xK/wrE+OLDQg=
X-Gm-Gg: ASbGncsillnjJFTfZfg57mLK6L3Cg+ha5Pp/H2OeQhyYf25794DNH8xFR+ODcaTn2qV
	lxvaSjSjQOdb9IzIj8Debsynd2JJ5ceLG1jJUnUU2FTjW96uII/cuhX03DbHYa0Y7ul9VVkLV3R
	cwH+Gd39Kt0JGqPJtlXj87CFr4REo8q+52Mu9yhHKDQD2/RlmuoqaM5/xWNWqD7aNGGdNGgib5c
	H2NE972tQY0Xe7qr0glIYMGu8rh2WjrGCwzT7Hx5D9+bqUrm039SGeeQx7UjZsSxATbtlQ7/b7T
	g/GvQPgInnr+qcpEDuEQ/3Olnao6YR6CnNcPqI7Vqa3JYf0urU1azyJzixih7+4MGA4K2S4qd71
	OWxP00DiIDVGbkdspuALfOntgDm4wnMGsoV9ABjiiNjKRnpvwu+VksXGiWoO4lBYEiXLx7mpKkO
	oEyg==
X-Google-Smtp-Source: AGHT+IGPSjlNzo0y0i/+GbYPAiFlc7JbgHfBpNrj/C4bxPOi+I7rIKsQiv4+wobJzyD79esO6O++kw==
X-Received: by 2002:a17:903:1746:b0:28e:7ea4:2023 with SMTP id d9443c01a7336-290cb07d430mr27595565ad.46.1760673901015;
        Thu, 16 Oct 2025 21:05:01 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290cd93f570sm13832535ad.25.2025.10.16.21.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:05:00 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:34:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	ira.weiny@intel.com, leon@kernel.org, daniel.almeida@collabora.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self,
 Error>
Message-ID: <co76tfqycdxhrigoxv5expmozqzgq2rjzxvfkfwqzyvlplrfih@gsi5yarmilut>
References: <20251016125544.15559-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>

On 16-10-25, 14:55, Danilo Krummrich wrote:
>  drivers/cpufreq/rcpufreq_dt.rs        |  4 +-
>  rust/kernel/cpufreq.rs                |  4 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
