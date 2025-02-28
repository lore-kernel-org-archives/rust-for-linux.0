Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391211C68A6
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740726589; cv=none; b=ur8QYdxfK3Fqxu80yzlu+fKWEG0BWWT0si1zwVXTM7vH+5NtTSqZyESiuwR/lJ0PBN26DEnnuvko6iSqaQiqXeAtA7ZNMkilzdpc3vgT6J5vKtzw2YsvycsQc2Jyr6+ExpIWfPBX28qerTiJShB6PIKtPjAgYdUHbkMKqQIKJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740726589; c=relaxed/simple;
	bh=iLmf7VHKN4mLCBJzNobgXQNWaOG09tK0WB6HgkGt06c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofZ0JoqB6KXXBD1s7uf8CmZ3rnHidOa6XmKYzhlph/7FBs6eSqjzywLW+i8erox5Z6aittNjVqmydyO9gYdqKjtXfY+rcDW7zo3QjPJuezLq9Onbk7NdUykrLd+0Nq0Q1T5QCaZIlwJSO+yJjqfQlC+WXB17GNBmfoC2blVHxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLlLCrUn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLlLCrUn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22128b7d587so34924115ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 23:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740726587; x=1741331387; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uVvdhLNEV5gzmNCw8PklT084LdOXqMPcGarwgbJHaaQ=;
        b=FLlLCrUn/imVVsXkm4DT5pLZoEfQmuESZwK2p6zBiYjftchR4hbIgvJ+bt2nA62PDR
         8hrZqGayJ/it3blPHC1aui5ptCEWup9Rt8uo65MKY+t78aHQ/kjL9UTLrZoH4eRNNmCX
         bSr8guf9zVSxNrQHlUA/S+uU54Z+1J/UeVQh7xXnFT3akfwKVDaLlmUPGLouZY6dq1cr
         14IWQjhbL7SaXXJCR7Qh4oNDRI0Da6huuKeu21eH2Cf5woZIL5cruhELcE6yeW/HfBnw
         6gyA2Bdl0NApMoAGXuDv+GfcAs7kGdlHKweBRzq/l5Apf1OWyodGeLzfaJstPMl42vUn
         KkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740726587; x=1741331387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVvdhLNEV5gzmNCw8PklT084LdOXqMPcGarwgbJHaaQ=;
        b=eTW1gMRRNN+hVA8DqPXi7fK5Zw0Rp3x/T2r9jPl61dhWMW0QicS3z+yvn+7//AX5a5
         O0ieSBPlylT9uVvi4ypVUESuAOSwptQ8RImvHJKbsEU8AtnPFf7ydwYkx/enuEJxTv3A
         9Q3W8augTd0oVa9Ai2iB3NLyRbhOTuVehLCl+9J+WpNZdTtdWKPaMEj+CuzVLf+QBXAu
         +KMeKcbyJ7fR+JRU2R8yQGqTDUuTBz849ez8IGV+0yFivtZQ7Z/Z41Fn79ZCcQHcSgNM
         +YvyiJ74qYWVrmBzvhhThAFRmkHecnh+s57SOFiQnU2ewoCDbko//1f4Lrr7CL57SQiT
         VItA==
X-Forwarded-Encrypted: i=1; AJvYcCWFiGk6PxqOLppOZRp8DNO1urEuKO4WU+Yt2SSoKe8r6GqD472QZLv1wcgE3xRNO73sB45P3ZcGGngeTXXmgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8gNV+s9BQDCuYGN07KpXs+EsYn0Rjg30xPdsmj71CZXybVUl
	3xDykgOlTh7woQKco0rSBiGQWghRSgurJftm936hCAnVumWKsAng5wwMlgJEIRw=
X-Gm-Gg: ASbGncsg9uYIx7cebZ3vUyue+JTXeAMf/+LVJ2QdfJiNxq4uQ7rLRvycGYsTdaB7UtP
	Y7VzvNxXRF/Tt9d+inwFGsraxCrrnQLnxH1iTFBJfINortsYZBOHJqYZ9D3eevaG1lTTcSM4XyB
	xlKowrGjqvuZQjGXPsmqZq56K2zGideF/k3S3joPEkOYbxTNXR2xj58aNOzUJlR1tCu1zD19YW+
	dQgZexSEomwQB2K+tNWvAnw70ULN8usOYlJ80WlIb9YThk5FXoats0/yPssgiypUo/IZbORoR/h
	qRGLmtaVRiwHkrk7qLTeKi4LwPM=
X-Google-Smtp-Source: AGHT+IHtIrr/zv3KmIfmlm1LqRGukhLRc6W/VmLS8Bw3TxcDi6JjmxkxRaJvEgcKpjVZOthALYnDdQ==
X-Received: by 2002:a05:6a20:9f86:b0:1ee:73ee:bcf4 with SMTP id adf61e73a8af0-1f2f4c97a38mr4342310637.2.1740726587503;
        Thu, 27 Feb 2025 23:09:47 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf23b6sm2701998a12.15.2025.02.27.23.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:09:46 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@redhat.com,
	gary@garyguo.net, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	vincent.guittot@linaro.org, yury.norov@gmail.com
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250228070944.an5mbauxvxkfnn6p@vireshk-i7>
References: <CAH5fLggyEXyyaFNnmBCPOSX051TiFyAp0B8GfahbPg=+LrtUWA@mail.gmail.com>
 <20250225180223.763026-1-aliceryhl@google.com>
 <20250227104640.sa6vqdz7j5hwjigs@vireshk-i7>
 <CAH5fLgg8PvCEEks81Dy_3eRBkVG4P0a7usB2cfP2pbcSw495FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgg8PvCEEks81Dy_3eRBkVG4P0a7usB2cfP2pbcSw495FA@mail.gmail.com>

On 27-02-25, 13:19, Alice Ryhl wrote:
> On Thu, Feb 27, 2025 at 11:46 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >  impl Cpumask {
> > -    /// Creates a reference to an existing `struct cpumask` pointer.
> > +    /// Creates a mutable reference to an existing `struct cpumask` pointer.
> >      ///
> >      /// # Safety
> >      ///
> >      /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
> >      /// of the returned reference.
> > -    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
> > +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask_var_t) -> &'a mut Self {
> 
> Why?

cpufreq core has a pointer to cpumask_var_t.

> Perhaps put this on the CpumaskBox and keep the `struct cpumask` one here?

Yeah, that worked. I think we will anyway have both type of users and
its better to have both implemented.

-- 
viresh
