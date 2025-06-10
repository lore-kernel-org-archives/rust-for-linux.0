Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3028BA8E
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550789; cv=none; b=gb7kUFRaRt76sf0iBL618+ripCQvL6OTqllUpxLM2l0jj6j5elY3GU/aeUhHvliMnH785QBnkTPEFKynKxl7Fsls2ryRTi2NPYRDq9lXLawENSE3m8fnUb1//iIiEsYT9iZ2De2p0al8z1W8arm+sUy3+XjzBLKKPT3gNqL4uXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550789; c=relaxed/simple;
	bh=tvBkx1V6Rwddtyf/QRq84X1JFd2INDmjGqS3FddKsIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNuHhiVkipgTveFvjUvPJL4NU63SvrBhP7kc1iKjQ6sDj3yeNpTYe7aVbf2wtOth32+8D/eCt2ciCFL+p15wrSD0NV/sZE1ClbSwnnp+2K72DS6HidS4XxupUBzIV0/a0PyrDeC5TdAn8cCnRiNw5i6ll7CqQrqDUI4jbDc5PE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmqI1ImO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmqI1ImO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4089766b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749550787; x=1750155587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UJPz0XWD6WvOykovhg+gFiPtmKizLqjMm2B20R5G94Y=;
        b=PmqI1ImOUHq9znuvWtsrlU/ooQm21k+BNiDmPvSmYMZ2EZAaw4caHyqmvu2ZSQ28fn
         S4waCRNCgz8Zc0Ee0y4UvxVuTS+3/+JOSYTLIdr56UHNH4XGiC8aXRArcVaT1URlV3zC
         h20OasudUiDMQLgs2pp81tGJj0iCMc4ETHwxy9u5H9rxX+rGDdDY0AxLGvwZ8mSW701I
         UOzwj8bZWGNx4V5RHKKWXMnTPLeIyg8533B7GmvCNzH+THJXzVZTrCXZr3Cl4/qAx5Dr
         prBM+uWZ0OQyUzscgxkwLWJqaMJQUjDthaeh+MwbnUHP92x7xUIDIse/XdzCqjGbvSNC
         ONIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550787; x=1750155587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJPz0XWD6WvOykovhg+gFiPtmKizLqjMm2B20R5G94Y=;
        b=K0YjDuALjmSnI9v0eUAM6V18wVxSwXYOS67ly6Svv+PE7l7kq3Tr1vxJmTAotg2za5
         lSgtC+vkQ9VjEIMyGxtQrW0jn//2iVwL1kf8Vq1ltLKHOKcgaifUPPFVZ1Ox5mLuXsc2
         BmsZ0ofESovp78x0Z3MQeRDrtix8t+FN3MJ32bK48K4kJtG52vjquSt73jScgO7l5+/P
         ZG/icd/kLbBLEWQ29CP4qt/0DiG8ZpS2MSkCwFeku/4MSCmH/mIg2SlfsnLpnQVoClOa
         rO7K+YzGJYF3/L174gnX72XN48yvP96fjGeDWw2PWTbsBMbwH9EuA+UgrR5kz6KhmYKh
         ytBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmE3/ftTBiKnwqrMyYrlFu+L75x2ojGowJJFu8FRvxoNT9IMBGS1sxVsoe78X66uLIOJdraIusn+4ZJiJx/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YziFgaAF9v+eU+IFKMc82nbrTcJGJiGN26lvGVbxKIA2fQQ3ZGY
	3EPPz9Y42pjGi0GnMNEFitkX70EgWB+ot6Mma028C96aSIbshsrSnsB8WvSpjAgP4JM=
X-Gm-Gg: ASbGncuFs0dHcBRz4qcHPDWx5BODRwTn0Dq2cVxiRGra3DnMlJ7v4YqfyvRiGoHoXxP
	kDwXt2NQuYV+DhMAIUEW22Vr8nbw1CaqAVtnAYg7HwG+0/KzOMC8pwwQBUveDEqV2HQ1uok+A6O
	ZzGNMekWSGK2SKfUso8AtHBo71wkGLZqqA8EuCYZCjZefTs2v9MxFXAi9u4AtZQFd8cAPcBkIIv
	rPU+EUBLmMw5+R5RAGMw8jsAGzJqXHpSvZM4LPF5CWjzpzds01pSGyhtRWlr5k67WV19wXkrPzf
	6C9M9u5Q8OriaudlQ5+2IRNVPJCQnX3DskPZIl3ghgVxjwpf5sxN5lORmdXpG/keh2UblZgJGA=
	=
X-Google-Smtp-Source: AGHT+IFYOlILg9UO5nqmvH5/PpF3H8JRFgMp8pZmn2v6F5sjYFCIkxw/7rfloitzttQafgfaZNLyAg==
X-Received: by 2002:a05:6a20:7287:b0:21c:f3cf:6911 with SMTP id adf61e73a8af0-21f78c753c7mr4162006637.36.1749550787043;
        Tue, 10 Jun 2025 03:19:47 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0edb54sm7365444b3a.173.2025.06.10.03.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:19:46 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:49:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610101944.lqy6lberyy2aom2r@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>

On 09-06-25, 14:01, Miguel Ojeda wrote:
> I can open one for the C FFI types if you think it should be
> changed.

Yes please (And I won't try to solve it this time :) ). Thanks.

-- 
viresh
