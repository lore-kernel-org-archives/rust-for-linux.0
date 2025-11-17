Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04453385A2
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763392377; cv=none; b=pudsHDacYAjH0k54jZVHCq8PeGPSOWBfHZiI1zMaOWdvszaDau74RvR/B/7tnhUtwKVRN4EyCpc6DymCkS/kFEE9MykzC+l8EC0VbaAL3BifXsHWPYr55XmTY/EfoyccZICkncgHQiOSxVHI9Tch4GBdNJKAHCRIgJREkIjMQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763392377; c=relaxed/simple;
	bh=Vc3a8dCM9meSYBV4eHdarauRC6uqyrDwClHqr4NMmxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi6LatHPHzW/+0F8/nOOnSoDvZVD5b3WkabQEWlekkqchm7Q31D4abEIKz8TAtKXgQi5ZB2DxaftpNnja5b1jldjNZUGUG6g/JSgcg0vOtnLeeS7p16fYKYdDs++ysalNecbU4HDXi8kS2hClWIaEYftTk8zM3YHIpV/I0/cSG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2QrXikv; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2QrXikv"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63e393c4a8aso3293980d50.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763392374; x=1763997174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HiyGTgtBuNLV7sg/zwwd1w+d8HSgdy6fnNeXVh5h6T4=;
        b=f2QrXikvqrnf4bkDIc0joEXa800NDE5vHDhVIAbowN6aaA4+oqtabZFleOw4MR4LmP
         0IsCLzIy/w+smRfwX14QdA8t7Ud3IXyz0HiJMPP8UeGdmpKeS5jpF3AeEbu7jmENHJOc
         knVR5u1oJkGfitEO7wZcpu57b+UgQeKqJlVdwTsxBpqYiqGNURg/y0fsRXXK2gubHEC8
         zIs2rrSGYaZkfTRkHis8abxzauIkcLl3D9qjA5CElrvzpj0kBJqkTjjh7aeAuf812pkb
         sARzIzKP20jQ4jE8SLSjx2oQnieQCt0kJMzjrdzvUic6jG1n1+NsLaMB7p2cWSj4C/EN
         5nEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763392374; x=1763997174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiyGTgtBuNLV7sg/zwwd1w+d8HSgdy6fnNeXVh5h6T4=;
        b=HaSFdCS3OL0ogJVomMoGutB6s0aedSWM1uFUQeLg4gufPvPsK9XNgQH0AHzlHa7ran
         nI5bmLinFXYPkL23nz5QMM2+etc9QsL79lBkcNSMYkvEJFB32FtYqVNZ15OU9CJcEAfO
         Px0Y+GcpMtpGIYuAfu3hXJGjpd8xRIC4pFWHSa+GCCnTUIU4pt3t1Z/20xt6fbZyg+aK
         2U519EzPGd13a+CejeqpYzlaS4vacEAXFooxUoURIwq8v1UYYA7FjFd0mZcJlzxd2pcq
         PlheVT+ixUWKfFsmbQ5cSLutkZ+BqWsmPX4J2iQguvwpNx5BHWERUtZGFH8pRXpfmDuS
         PCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgbesg24QfnYOYNN+27nuRphdslQ7F/PtJQSz3XQYpzg1i0VFsWJt4RBzcBE3gmHQ4t3ZFxYt6YXNLBopdbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHRQh00UcXPg59A1Tx5XWVCU1h9mNL6eDv+FwGeVNeuzDg1X1
	fS7gv4NbkHxQ0d1Ua1lM3lB1R9ePGR1E1Hbe9fA+jE8yKT1sRMcGUwsu
X-Gm-Gg: ASbGncu8B/UTB2sfKt2/y1eb1/MApc5Bp3J18Uo4xS6s5reQa+n+tKyC261xL1UEhly
	UXv3R3q3AAqkxN16wAoiqO/yFvMUyBQRbsiDGV56cbThAFSpjfSCpiO1bFg5he0bFrSeMiNblLV
	0wC+vi7QlkRmcAMUiSWbDYPAlPn0CFAf8sA1Yqzg9pKd6IQaNTmP7PpraPPunjavZgyu1iY5m/F
	NQmeTox/oX+eUgPnUsQeMLAbxsU/IkrfF01fVuMZ+L0bt0AGlPgQb8lLn6Z1YX6s4DbQUw4h2uY
	fD5vOmsOlDP+nOaU0utFl9Shvnc1QafT6lnIAWPEvi4r0J+DGBGtPO6ezqyuqU5gsRPaQi1NPP0
	5h6JDoXNNaXCM9lIk435PlorIMmFydv0uUXfgKhuPkXI/z4hrptdrfL7noteFCzaknF4/VYWtI5
	RF2BLjAMhrHvQmSPuVR5NJjAByZvC2N6mBS42PaRO3ZhhDz2HtMqlfxQ==
X-Google-Smtp-Source: AGHT+IGlWc1ZKR5tiBRARD5izfXGDEDyIt9+mnDCg37HJYts5CgpBmUp0CvhqwR4G6TiRq37u4/d/A==
X-Received: by 2002:a53:acd3:0:10b0:63f:a48d:b7ce with SMTP id 956f58d0204a3-641e74f5b82mr8502009d50.27.1763392374573;
        Mon, 17 Nov 2025 07:12:54 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6410ea034e2sm4823994d50.11.2025.11.17.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:12:53 -0800 (PST)
Date: Mon, 17 Nov 2025 10:12:52 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 3/4] MAINTAINERS: add entry for the Rust `num` module
Message-ID: <aRs7dP6u8JRuq4sL@yury>
References: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com>
 <20251108-bounded_ints-v4-3-c9342ac7ebd1@nvidia.com>
 <CANiq72nThC8VPzuXAR3yTgxtsmHGF9grFy_eukUQYGv2r23GUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nThC8VPzuXAR3yTgxtsmHGF9grFy_eukUQYGv2r23GUQ@mail.gmail.com>

On Mon, Nov 17, 2025 at 08:11:27AM +0100, Miguel Ojeda wrote:
> On Sat, Nov 8, 2025 at 3:24 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >
> > +R:     Yury Norov <yury.norov@gmail.com>
> 
> Yury didn't Ack'd this, but I will assume it is OK since he mentioned so in v1.

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
