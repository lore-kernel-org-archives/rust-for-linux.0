Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626C194C86
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 04:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755662936; cv=none; b=GVTKWLeF1uJ1u1FFoTALQLlYJvTZacenSaXnPGlrK8re6GuLVY4ulbAeNwXWmEEFMifqwa3yJwp5kN7WRxuzb9UKijLUEKqn7+l3fD3dr/xqRkHk3WJcW52IWRIhOtQ8rXZHmFPV9atsnkXGguiJb/JFjJlFDhS5ODlApey1Ros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755662936; c=relaxed/simple;
	bh=cZveZFpGt+kr4tv2eYJJ27WLY1j1jY8DTi+7Kle+qvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFTZH4Hp8jGpMfDPrZs4nRcl0xsNSnE09lr7/wQbh0shHLkc2OP4lQkWztkGLTYkG21xxCg1B340EPZm+Dlw6brSB2FRIrhtJV6Z4E2VebtINouaBdkO8CeV3uM5pOQzAj4h52nJqfWs5Qs8jzxTCSqgbGfLKoQ48jX0qXqB5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJ/cKPFg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJ/cKPFg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e43ee62b8so3143808b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 21:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755662934; x=1756267734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPsQnvqMxASRCLEED9v2AlwRctOJ3ys4veuU6QCCD08=;
        b=qJ/cKPFgpAXS9ZiWLtrN8INgphQIH1VdvCzxui+0j0qRopuKCQf0gD4ZLRUNjm5CK3
         vfnOKvdn1YA90LV6pvFOmlukMkTxL30aFW1AR1nlS7NQ6+MQp6TC0kiJdKjO8NL3PfTd
         wDFCuqhLZTHeMQsJ0DUMjte9QC0CbCR7id0nmy7xNxQGYmUCdbcfE/N+fcptAswBy1qO
         NDK6BlyTS7BQdSoUA2eEXgAd4ruL18R4eQX8/DPHxopJWjJbIlq/40z5BcWuiWYyC3UA
         wZBInK8ovPjghbp2rrlBgWmtULMjD2uTBVgRffjd/5erKnLcLobXQftI5mtcrknICdPZ
         sypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755662934; x=1756267734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPsQnvqMxASRCLEED9v2AlwRctOJ3ys4veuU6QCCD08=;
        b=fzNgCScKVlGErwaLRq8I/pwlM0nk23cscP5Cpc3XCGL6N4+FqYmz8B8HWay41+2Hbv
         7+NTZydiqXETAQ90PhrOBh3Z09HfIbCEvbJooSpeM9ekvRIVVP337qSOAftIq9Tg2hlM
         IW3cC6IF58bsR8eGOqRqY0yk6m9Vx6yQpMvRgdPro2qc2eFw6o+3YctH2pP07FFo5y8h
         ZDUrSvUS4kDvfMsqERIHyo55j4rOxQEmaNomgUyu0Ot/PmUdoQBL7TrwihQLJm5J+HG+
         +jzHWdNoLgnLYm78wKcL5bavQ/nqOY2qKTI5IM+JbJZDXC++32bYZELuNuJjHBzPJQq4
         eDAw==
X-Forwarded-Encrypted: i=1; AJvYcCXjNQ8E5vdZ4b89iE9wya6xg56pzgaOtGZTHXT6z0p4qeDcQV7n0gyHDZBcYhR0TzGXvfR6fHrFe7fICKc1Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOVcewZKPtBaCC0PDWuYeBD6ELlMKqxsn9SNLuG2w+ToKiIrIe
	6ODLSoUEm00s/fwvIPX/z/E03S6LeQzlV39oypXIYrnm93YHJY21BDBvIEcZRLIliEM=
X-Gm-Gg: ASbGncsHEBajShOYUTR+vnpGTXSpZst9ssczVNaV82f2xEecQoyY4opBx+YI1FYmDKO
	R6Y6SNE9XutPWAJLEMSYT1kis7nDaDTxJocAMm8rpVnoJ6a+TTNoQd4g/6IcsLC1H26UbwIP7Cx
	n65K4usyFRpsImMXlJ8WfRyMG3uY2R318QLmbXQ+mLuuJXJd2hKqrJ3WYHhpUgnWKDfaky1ZFR6
	eup/MNeVr529Xce1RFIrbZ5wio6IAGFlHnN98M6TocZ4/iI3qJI80JDzj1oSZmsk4gYW4vpftnL
	6xxQivG1xTTSr4H/+QzLDmqm9FkgQq4nbMjKpvF1HpiEUQjzXJ/U4hqd9sulg5qw7OfZApCR0Rx
	O5TvrnnUue/bBINbsTeZhmzG1
X-Google-Smtp-Source: AGHT+IFu5A5bISXV8FB/K461gR7zbA9roHVXBQ8EWpE6xiSbYT5Vb03ik3iZvJ80WNqy9YA5A69QJg==
X-Received: by 2002:a05:6a00:3e0f:b0:76b:ef0e:4912 with SMTP id d2e1a72fcca58-76e8dd0a9b6mr1753204b3a.20.1755662933893;
        Tue, 19 Aug 2025 21:08:53 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e82d18cecsm3264977b3a.95.2025.08.19.21.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 21:08:53 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:38:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: opp: update ARef and AlwaysRefCounted imports
 from sync::aref
Message-ID: <20250820040851.nn3ysfyurc4ukqg3@vireshk-i7>
References: <20250815174521.1413560-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815174521.1413560-1-shankari.ak0208@gmail.com>

On 15-08-25, 23:15, Shankari Anand wrote:
> Update call sites in `opp.rs` to import ARef and
> AlwaysRefCounted from sync::aref instead of types.
> 
> This aligns with the ongoing effort to move ARef and
> AlwaysRefCounted to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Applied. Thanks.

-- 
viresh
