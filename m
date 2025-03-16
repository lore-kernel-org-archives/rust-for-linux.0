Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F1151991
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151293; cv=none; b=XXBRVSNIh4eLdAIHkrgKdoR/G3VGgWclKtnvKhJCpTvOaSV8wQtpto4FjbZ0nH5PQ6y7Y6z8hcyZ9583GNj7b8USk5zCw7VYTWngJnTjQF1TSrEu411zBxJbR8uxY29nKkzb6I3fXNa9J8ujiHDbZesgQA1IS6N/OHx7ZlR+e3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151293; c=relaxed/simple;
	bh=zRRGLszJcI9Ww+80z26LGiQuD4y3P7H/6FdpcWOHEnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsFWm/ICJL5o9XDl2/eFzZdXf6zMm6VyaK2agBEcGgRpKbkm5slQ5x2h+iPJSerxwbm0VwtcoS65zP3CicWkh3o9i5J0TEpRbXn9M285LjMgUapS/VsJIUDJrwyoA07ylerwakZbi39l99unpGbiRdScxUz2ZqRf7dfFjPEL7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=xZtnF9D7; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="xZtnF9D7"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6febbd3b75cso31489417b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742151291; x=1742756091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvdWb8P4BT1PgWG2fQCxo90ztiExxOPg6h8PgNmmvms=;
        b=xZtnF9D7c2bDn8Z5NbVpxJYmLAwQ2p3Pl9X1SkxcUPS3CTwg3K4sxgyXA7+o3P31MK
         iLM8S7BaXfoMb74BAqUd88Dd3hVB9EHklEW8Oa+U6eiOhMuM1jyICMAEA/7vnn0NZn0q
         GP842rAeRoUOyzKegKW5GzCqjNSIR8isIhe6PdZnXzbPMhgz2bbdw0K7yPDBHC3D8mX5
         a/yOCoNK6mZiSaRuuq8mFp1NRQslqdbETXkOAwTtDSX7GXmYRmRrYcPTuI+CVgUr5G1F
         jHqQeUKYnjkGOvZJrX1NUE2rz5S/UvMhrZ67OHQT5XP9bEoPCr+9YjF7F/CVJqDw67r+
         iJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151291; x=1742756091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvdWb8P4BT1PgWG2fQCxo90ztiExxOPg6h8PgNmmvms=;
        b=KMOVCvjbjA+Tn+KnNsTsjjp+ydZBUNETrndqfi5zfDmdxmURqYjTHzQl+qAJPr2Ed1
         p2H5RZZpPJzeb434PZPtpa2gvZf0SqhVvEADbwbEMV6QiHRjzZ1bfnhesE5uoogcPanB
         P9FdApS1Wa6DZlAGykW6xsVSCHJ3GnWhhKnMAmicVyGPuWzA39ebZNpzldu4kcSrECwn
         0JXc+jbhzx2CytjxRhaAkp0lfXQZbNB9CVw2dX6t/RBN1nq/Y2CUkijdVmDbLnO1qlQ+
         txyq7iDFcyuGr7z9vkdqEWGWzOJ6ad1dtccvT1feGJziq1S8iYwz23a2eMLzCTNOLkBK
         3l6g==
X-Forwarded-Encrypted: i=1; AJvYcCXynIJG92aX43a8edlP2LofF5v5Gn4uPNAUGnWSj9h2F0J8JRFXqoxi+tKSjtTKCRdgCqjbJrigQvx1xP6PSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1+d+Dc/Ola1xieYVcnAs/3fZ5ARXCjyeio1/QTFBqz5PR8M+
	VMShpkEktIZfDrvNbq55bzQSjGtRqcnwb8X74N7QRJ+AlmvN4HHRzzfMpXhiomo=
X-Gm-Gg: ASbGnctyskdgRr7oOZGlj/wF5KMhuqaV8HNbw/UdUdbQwdh+Sfcqozk+gyz0KlXn0T8
	nvcVkpvhqwf/YioXJ23hte9nwvdAtFXY8HTKKelsoXkNaSknwG2vg6swuDjkWL02PpRKJY/HESu
	2vzB1AxOlWQmYEZy9ZhM6D7XYw6spfyPoW1PkscJRO4hcumGqcRz6i3QQZBNCBrf9FoGBQXSwin
	jsBMr7GvuyBFqHRb868j9wOm+mh0wD7eGU1WLnINV6QPCrf/xIuut9U5MkIe1pi11nh6vtESa7F
	3P46TF9h099QKywH3Iq1/R7Nu8CiPMsC4FWdyztR62/DynWCdD9dthCl8Ke+a8zpLUlscBzUrxI
	3NT+t+7RkJPh7l8R15/Jx1Gib6JYYtJf0QIxNu7nQ
X-Google-Smtp-Source: AGHT+IEf61ITWXTQ0xB0/jw/y4GF9A+lDmm2UolrQcX9mgJQdmkAnFnfFmrsyIE1fbiYnjOGpVmumg==
X-Received: by 2002:a05:690c:4c0a:b0:6fb:91a9:94d9 with SMTP id 00721157ae682-6ff45e3cc5dmr134299007b3.2.1742151290797;
        Sun, 16 Mar 2025 11:54:50 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32d0036esm18493657b3.124.2025.03.16.11.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:54:50 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: benno.lossin@proton.me
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] rust: uaccess: mark UserSliceWriter method inline
Date: Sun, 16 Mar 2025 14:54:39 -0400
Message-ID: <20250316185439.913013-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D8HVNR3Q3UL8.1007IZIZTQ0XB@proton.me>
References: <D8HVNR3Q3UL8.1007IZIZTQ0XB@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Mar 16, 2025 at 05:47:40PM +0000, Benno Lossin wrote:
> On Thu Mar 13, 2025 at 3:57 AM CET, Antonio Hickey wrote:
> > When you build the kernel using the llvm-19.1.4-rust-1.83.0-x86_64
> > toolchain provided by kernel.org with ARCH=x86_64, the following symbol
> > is generated:
> >
> > $nm vmlinux | grep ' _R' | rustfilt | rg UserSliceWriter
> > ffffffff817c3390 T <kernel::uaccess::UserSliceWriter>::write_slice
> >
> > However, this Rust symbol is a trivial wrapper around the function
> > copy_to_user. It doesn't make sense to go through a trivial wrapper
> > for this function, so mark it inline.
> >
> > After applying this patch, the above command will produce no output.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1145
> > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> 
> What about the other methods (like `write` and `read`?) in this file?

Hey Benno,

The other methods in this file were handled with the patch
linked below. This was one of my first patches, so I was
unaware of patch sets and did 2 seperate patches.

Link to other patch: https://lore.kernel.org/all/010001958798b97c-4da7647e-d0bc-4f81-9132-ad24353139cb-000000@email.amazonses.com/

Do you think it would be best to send these as new patch which
includes both of these patches? also if so would it be ok to
start that new patch set at v1 ?

Sorry for the confusion I'm new to kernel dev and patches,
but starting to get the hang of it now.

Thanks,
Antonio

> 
> ---
> Cheers,
> Benno
>
