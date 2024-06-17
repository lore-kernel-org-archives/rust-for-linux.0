Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE801190055
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616188; cv=none; b=LDCcOEdyFRGHj7q4GtVq9E83UoelROT3f0POcppIxrJXbLOAOGTfPs+1OdysOIzC2djtLBKlvPtdZkOC48hMYqws2acoP7oiM8PCYhvDs1ayClZpLw4i4K7VpfygU0gNnwwqzIPCrsT3Fc4O1g9zMkMejqoCYrEwHKS7LfwqL2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616188; c=relaxed/simple;
	bh=PJorj6pZybZCRAmgMBh4ooMcrMxupHMGQPqA/q11VUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=SU8+elQN6R0R7uCRxO83qDY56dlnLruHAa0Uuc4JxSKOM4dwApl2ZTgTbWKAIUSz8xekG7ZCnZiZQL9e2JaxmDCblW6u3WAnIxZUxe3bT7bUHRRPU50AM+mvp9fqweVedpfNRv6ofhoV+AI/eI3f6zLrH2ax6gXt5W/SAW8reeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMmixxYJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMmixxYJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42281d8cd2dso28823055e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 02:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616184; x=1719220984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PJorj6pZybZCRAmgMBh4ooMcrMxupHMGQPqA/q11VUA=;
        b=QMmixxYJV02w5jGsjaYPK8uw8ATgnsghF9FuhA/pR5z6LSPx5Yp0VH+XA7Ectd+eWI
         MYKVqZSeQwyHb9Oi64Tzm/kpOOg4wtky1ErU0NQXazVuquhtDbjgh2H3JqTfrWci6yMM
         xCNYkvY4zV/kROI8cJ9fVSfB5Q08v0NaBPNH/ekl8hrHepZH8VxYw7qNhiOMRQ9MYIqP
         z2VmWnV8bR5t07hU0AGVC13eCgbSD+ZFWmgKzHOcecE1Waw1chVScOiZBsaHxfqE3L/y
         Nhib8sTqPx+K2SODDlpEtqjKO974pznUsspuKiixZLSZICSQWVBMKCG1SsUjt5mYXPVh
         skgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616184; x=1719220984;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJorj6pZybZCRAmgMBh4ooMcrMxupHMGQPqA/q11VUA=;
        b=sAma8i2UD2ieOjJFPUXNAUKZPzfE/tuLQRT87SNypv72f+uHGv9Wyw1KY9mQM2hnkE
         1CQbzWa0qSlbO/ZRAJOaPWp19V1zNoNLChvXEqOPetcvHDEOGQ108ERmsNYKHdYnptSI
         AdApFQSXjRWOHn62G/YHRJmMADRaAkbFDXqvL2GLHNnxWrg5u4ayIT7BqKuOVgYZQXkE
         O2GtR7N8H/M5uhiGuwbAJcTqI0SjVe0XybDBXPU5Hi4KzB/blbO8CEeT8zZ4F0Is3ZEm
         /AsqyMMuXyt2TL/NJOU8DiNHzsDyUyVuCCcE1nkyusUKqOD9ZubdklmgXMR5rTLHunSE
         vtOw==
X-Forwarded-Encrypted: i=1; AJvYcCWvU9PT2ojQLFNXfTGAYOCbvOkdx34C41vOKcZE75nnmuOwg/QDaQUQajxnrhe5rlPSmAEjRnZV6lck9x3+MhQfzbCijBxQMb+s3+4n8I8=
X-Gm-Message-State: AOJu0YxnbW7DtTiF3SBm+8cuGqU2l4kJ50Z+Wc1gstbyh0McHYXwSCaY
	chNbeJQmXcBH3MBnMZmY/4gWfa/PewS/bxTFgyWrvvHAmHFrMptuTILhI8PUHM0=
X-Google-Smtp-Source: AGHT+IFfL3Bs1KrLYPlq1k0cwv3eyK8lsf0inS3DFHb4TVzuMMGvXRsZ3JYsj7XJdNFeaX26ROtE2A==
X-Received: by 2002:a05:600c:1d1b:b0:421:65a4:2936 with SMTP id 5b1f17b1804b1-423048240b6mr85210755e9.12.1718616184294;
        Mon, 17 Jun 2024 02:23:04 -0700 (PDT)
Received: from meli-email.org (adsl-33.109.242.225.tellas.gr. [109.242.225.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422869d4f2esm192148015e9.0.2024.06.17.02.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:23:04 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:02:57 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Bj=?UTF-8?B?w7Y=?= rn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [RFC PATCH V2 3/8] rust: Extend OPP bindings for the configuration options
User-Agent: meli 0.8.6
References: <cover.1717750631.git.viresh.kumar@linaro.org> <37bdd7ee7b74292830dd9977154b08ebcf08a138.1717750631.git.viresh.kumar@linaro.org>
In-Reply-To: <37bdd7ee7b74292830dd9977154b08ebcf08a138.1717750631.git.viresh.kumar@linaro.org>
Message-ID: <f7wqe.d5i9jcj6qgw@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Fri, 07 Jun 2024 12:12, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>This extends OPP bindings with the bindings for the OPP core
>configuration options.
>
>Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>---
> rust/kernel/opp.rs | 305 ++++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 303 insertions(+), 2 deletions(-)
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
