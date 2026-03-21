Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3F175A76
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774135335; cv=none; b=gvCaelKUGZEZwY479SNUtRkMDIFfRCv0RW6jolsmftycqtWeikJ5OTxqFkj4dglevjA77tmx+zQYAy1zsA3JIxjmGLLCowAptuZwiauOxYbh9lXbewIsYRJ+NS8EIeG/1yN19sgeLVvvlXIC5rBAqRsuTGPgmdc58zbfKdrkJJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774135335; c=relaxed/simple;
	bh=qNeJkCdabtlCm7cDTMYLL0emh9Mqvxu3XdKIuu1nM1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OdeXN6Sz+Esd4whRKrJo+fVKSTnGECCjeEqAyXLpjw1xDwPha9F9NwwuYaa8Y7bzFMmFTmlvZ02HXoHQM4nrcaHb6vmL6HWxWnos2httdEWl166nTut39yWkxA2Lr/wtPN4h6OTdMbmSmM7hyarJnXOBQxIwZHI+JucVE9980xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQYIDMGN; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQYIDMGN"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2096390eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774135334; x=1774740134; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
        b=RQYIDMGNQYRLzKO63eDzWfTNup9KYswZxYOa5I0CDoynJc8Mdrc+GrE2q8fdJDV6LE
         DJsgwupddZfGlVDIqmrirpFWa/1Nt1y7t4gwijOSAvBlW31YIAel5g3FvmrTPsWwuNLq
         kgzlgLb5bhF81V3Fs0/+wsDfmUXfe7BwpyNVBMamk+dzDeHneTmCIr0+096TOsK1qdP6
         HW46kULwAYw0qHleDWxf+EgRuFne9j9gpiNHvKtPUVVu4sqe2mEOO5dK/KwPB/pmBkly
         XJmgJb1kchnAE85+R8A68dAoJpE8wmKAfBtYjZNmRNKplU+cW7ZJehOwiKJthC35wxfq
         izVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774135334; x=1774740134;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
        b=imQDd/0SUouL/ESV8whmVnaehoX5/dSKN45vx1Dq9MFjbZRRTBUNcQIO6NLU9bZ1fS
         e+aZgZH0iSUDf9upi+9p8dqXZ14rx89P+4gVpu7vEBAncU/fv0k1zwqS6Q+2zggqmpS9
         OP9R3XZGLYMaEXwEsFSFoAghGfHH8PKxwrxIi4qLy+S22OLxbT0LOW2lZL2K4wPi5GBt
         nvFNKS9GRay8xpXHRgabsq6jPZkbeTGdfyv0604rNf7qTSA1AAxjT2q4DDNtsdWdvTYn
         OcxnUMhJX4pQ7vaSGnU7uP0YWvSWUHBI+u48gKzT9YhZd1s4eWni/4QHGATIkD2O2wBO
         vMUw==
X-Forwarded-Encrypted: i=1; AJvYcCX1eOe70kAXVHtkZC+t50g26ORM/cI++ybIC48+OSI1blZUKxTjFkFGAmCmW4vmD/bhv45NDf4fgiMPZb/0+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXK6hTCxBcxQfL/LmWtd5ORkC9IBhdLFAtLk1FO8l0gqoTTNr5
	2ochtslkgezUPYqn/3sqtM6pMwSA7jSBj3Q1+JMe/u59qUMkNy3TTrgP
X-Gm-Gg: ATEYQzzzxSaFCDTgPMNA+sYdcan+djnWbfI7/doh+GxPz17bSESeoHwDtFsC4m/MN6D
	Hu4QmLeDe5OQojBHS53ZI/I+DYti7B5eFzZc0z4lcG503yZzLwTeda+5lPHUUbLil/nvM/d8ytv
	y1DUnoBJCpCGgVvuDzXf1bb0gsCzf469ygGjPhFZLogw8iaS4sgI8cppDwyYm5QBFan+jRPcCtq
	ADOjeNxIuW/ev4A9eOV9dkyD6Sk764RgayWkbnw3+4/TosV3c+lforSRE/58GPpDZPtWtXP9T6G
	2fPYHc+g3A2csn7REc4l/t9BaFlVsP85hUPxQcYgZFlHKdDAHm6f7fcUHJdCfLMKOWNFHGGR8zu
	I1M3U1Nqfn1hNF1hq/kCE7ba9IiQlMSIRNdIO3Lc4OOB39ZfByvkwyO6EPZON22yan+pOZo8Gda
	fYJ9LU8vvS0244320OVUQzd+eG+36ZiME+k796dgPAWoEo
X-Received: by 2002:a05:7300:3c05:b0:2be:140c:bc4a with SMTP id 5a478bee46e88-2c1095d7855mr4154948eec.3.1774135333601;
        Sat, 21 Mar 2026 16:22:13 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm10927970eec.4.2026.03.21.16.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 16:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 16:22:09 -0700
Message-Id: <DH8UHISTLOA4.934370PUTLB4@gmail.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-3-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-3-dakr@kernel.org>

On Fri Mar 20, 2026 at 12:45 PM PDT, Danilo Krummrich wrote:
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 2eea7e2f8f04..ff3e147f1a23 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> +impl<T> Coherent<[T]> {
>      /// Returns the number of elements `T` in this allocation.
>      ///
>      /// Note that this is not the size of the allocation in bytes, which=
 is provided by
>      /// [`Self::size`].
> -    pub fn count(&self) -> usize {
> -        self.count
There is still a mention of `self.count` in the safety comments; perhaps th=
at should be changed to `self.len()` ?
For example, see the safety comments in the following functions: `as_slice`=
, `as_slice_mut`, and `write` in same file.
