Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFAE394462
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803038; cv=none; b=A0+a0mi3mKDmHuo0V7KkZ/H1SifOXyUhSdzFj0Pr7hc8hBuMGZrJzaZRvBlEHMRBdmAvtuX1uTSxGGl54puzNqcRHIpz0OCGxe4OvtKntI1KMQvFdlB8pPtnans8oLE2xw0JLupcPyu5mx6Bq3bNxrpNK2hbP/c501zyLZGgzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803038; c=relaxed/simple;
	bh=vAGJXvUL/9sBoXeg+qEDESAXwURhENFcuhzOaiocJgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JD7IayPEj0lSbAA/HM5xOAzYPHmRVYFrlaWzsHbVLPcLc81X7IA52mTCk/K/R+bjVpPKBW6oOa+A1B2V5F5sGoVJ3/g2plgrQ8noeutM9RZqQ8DPQTxssbtEPI25LKY1rx3R6El8xssCpL/LjYuyOwDJY/C+0euwE60FjMzAn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErVamcpE; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErVamcpE"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4f1899960f0so22728661cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803030; x=1768407830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHVjKAxrVwU1S1gs61EQpxnp4IS2hX0aOMGNWV+STBk=;
        b=ErVamcpEqSGuRIH+wiCqkqd2RHv8khlpHrFbdZtRMtuFQEeWcya4f/reLBP/vAdTDN
         0upW2D+0VrMqkObHZHCnSIbX89TFq+eTgNiyLpqNdabvXZI9Wuv1NQGHdD2wVwFWUGzn
         Z9nDE4hr+ERNbEy1+giRMjawD0F6mgnZ0NUNKU7jD9o+s+ojlWKZR9xoHCWdAhyZB7EB
         T7/RrC/oYi6kTUdIQIK9ZZZkHEQuGgob+7IZZBmzSD/Li/46QYGqw5TFbdF9DseX2cLN
         odcvReU1GCsIT6yPvgQTc85xGlbNAoDo3NOwHfAvtLp/y2uJ/lP8bsW4ZAFdzkYXxScZ
         465A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803030; x=1768407830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHVjKAxrVwU1S1gs61EQpxnp4IS2hX0aOMGNWV+STBk=;
        b=Fcb0QNm4GWNM2trRjq0AYBHV2CYeET+dXgzauYjv9exRaTOfRi+jUz3jenKOJMhpLk
         GzHKWhT7m5DrtlHMTqrUZfsy3WSYaTvz1m+DfjFBJeqF63KzoUA6qMxqCu6KuA+8oDwr
         xFry1E1PRkGPbwpja2IsXJf9pjrocYkCxVZM+YhCHvN69/nB8RvLagw7iDXXikdmuPuT
         SY0Z2l8i1sHJ9BaiYzEpU1AoFgREgbV5nsnd9M6zuob4UOtToZUCdnCd9eDX+Jr3u4Ql
         +PBtW4K33UI/HbG4YoAatqygNpAIhMUmkwH+fN63kf7zTvCBt6cnvw6CBxR3ULa5Sw5W
         s4JA==
X-Forwarded-Encrypted: i=1; AJvYcCWC9Q1IOdwXOuyzT429bV/t/AGyiLEdPlV9QJ5AtK4U3GZgyGvEdDqfnfTbb5ZFP/VtS09Jy3BhxunXBYiBOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLimqSlrYDB6S0sEQA2gpAPQvEVT39n2yhJppzgCAZkbktfTI
	kws7ORBbnpPIaqLDr6Ds4Jn9OdebzAsbSx0Qh9na6Vb1UqzwHcXMy9ROf9dSDg==
X-Gm-Gg: AY/fxX62gcAfo+IPQdM5kSELak31L4bw4Iad0TKeI2Ji3hKW5rgOlIEKvyIS3FK3FLn
	tygqfPkkvReLyTmIOJANjYVkbOkzjQiUHCRuIdTX83Z2ShFgPc5UYV5DHtFfUwab0IO5qDM1qPb
	J3Ef0eUo0QsOXxQUlD/oxBeLJkYEEZ8dSlFNNLDw7ES/WW1fa7t/lTOVJ9XhO50dCb9s7tG5m5U
	BEfB3TvX9EmOzclY23eMufeGRA69X390KsClm+BBK2URuJ1UYCtMdm1GhwkLSuyKWpdUTRUeKQG
	WpNYABz3AOixze7eNG6sX7Jw8charDf6ehuDrEO04dJpqo9/CvmbD3SLV3rvfU13u3CGIXB/HFl
	gtvuD2MkJ/Orioo472oSxsSqN/xXJs72aga7lnjRhOrtsdrcbgLBuUABMWnl0gXwUkSHKEKxPxc
	s7+3RGGzwgjrCh675SfaCaHWOAT75F
X-Google-Smtp-Source: AGHT+IE2bckZCt+YdjbqpJWarz2yxCVqzl493RJ7oTK/AC92gMmpx7Pnudth5AsvF1Rdh9Py4jeLTA==
X-Received: by 2002:a05:6a20:7f84:b0:366:1a00:2dab with SMTP id adf61e73a8af0-3898f8482d7mr2248462637.3.1767797279097;
        Wed, 07 Jan 2026 06:47:59 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:4a:8f9d:b0b5:f6be:9de8:e39b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa195aesm5208971b3a.8.2026.01.07.06.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:47:58 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
Date: Wed,  7 Jan 2026 20:17:39 +0530
Message-Id: <20260107144739.5847-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107143935.5757-1-shankari.ak0208@gmail.com>
References: <20260107143935.5757-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jan 07, 2026 at 08:09:35PM +0530, Shankari Anand wrote:
> 
> 
> Hello Miguel and all,
> 
> > >> error[E0432]: unresolved import `crate::types::ARef`
> >    --> rust/kernel/scatterlist.rs:41:13
> >    |
> >    41 |     types::{ARef, Opaque},
> >    |             ^^^^ no `ARef` in `types`
> >    |
> >    = help: consider importing this struct instead:
> >    crate::sync::aref::ARef
> > --
> 
> This change has already been made in [1]. Probably it has showed up on the linux-next
> recently which has caused the kernel bot to detect the error.
> 
> 
> > >> error[E0405]: cannot find trait `AlwaysRefCounted` in module `crate::types`
> >    --> rust/kernel/device/property.rs:362:27
> >    |
> >    362 | unsafe impl crate::types::AlwaysRefCounted for FwNode {
> >    |                           ^^^^^^^^^^^^^^^^ not found in `crate::types`
> >    |
> >    help: consider importing this trait
> >    |
> >    7   + use crate::sync::aref::AlwaysRefCounted;
> >    |
> >    help: if you import `AlwaysRefCounted`, refer to it directly
> >    |
> >    362 - unsafe impl crate::types::AlwaysRefCounted for FwNode {
> >    362 + unsafe impl AlwaysRefCounted for FwNode {
> >    |
> > 
> > --
> 
> I haven't raised a patch for this file change I suppose. Should I do it in the same patch v3
> or put up a separate patch and reference it there?
>  
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> 
> Please let me know which one would be appropriate and accordingly I'll send the revised patch.
> I'll try to complete this refactoring soon. Sincere apologies that this has been going since quite a while now.
> 
> Thanks a lot!
> 
> Regards,
> Shankari


Apologies, I forgot to link [1]


[1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2da67beda68776842fd0a26f2374e42a5e9b12c8
