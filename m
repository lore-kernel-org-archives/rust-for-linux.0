Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536952FE05B
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351443; cv=none; b=QCypPMlHHN0sjc48p82SN7XHHSsOHzMcGRj4kcvLV+bzgSjICAQD4j3skPHWn9UNMXz21FcN7VYEtP7kAgvrOdtRl9pXXd/DMITNyVhri1RB7fbDT/MMvI/tY59easYqals9AHasH+0A7Q6IKHdwTkX2E3c6LzPzZnlwQ53hvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351443; c=relaxed/simple;
	bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXraWyhSUc/XGpubWhd7Z6ZI4BS/LiPaJFnHFN5PXqmpu1T8M8ReldL3YDXsjoRmJjkK8XXsJX/QktKGXrc5pVOycsAWXH1SogvA1A6OpYB/dIJ0/XNjYTmu8FTfbTVx7A0vHULTzieM5sHkvqbS0qntyZ0qwoCBHdrBn5UiJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI3Y+wNq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI3Y+wNq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b63117fb83dso143856a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760351441; x=1760956241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
        b=jI3Y+wNqOfXqZkNirPIqMZYHa+OmAAWQsYhgvZlJScZ9FppHiMAO8uMcZ9717WT+xb
         ksqxuO6gkeSir3rTHYr7nEH2J0CTFzwK+2KDMAHjLSuwuOT4Uob+8Vh18imgit1tQUv9
         8Z9PQlJUpTGFbrfcaB60TppZw2994o5Q6qh+vYEZKYAVSabZzaiWNLONFDLhoAZK4of8
         wMgjGFk7ltREgkjq3YAvg/Fdo48Co77ASnp9/JrmkypzsUcmuRa2oeESd/uyfgvPWCi8
         CKoWM0/I0pT+6uSd096Bn0GqduRk+pcSJtmPKh0rdtuPMnhn2/w4BAy7HNBNmRsSMMuV
         LzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351441; x=1760956241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
        b=VWRRButeBGh79qz9290bxGsSHNlwArRD5JDLvUXHH3Aoctb96YIYI9hq2yccpNQC5/
         MW9aHeZo+8uUSDwTCbFWt5mC61ESEdtRLRLUuqLpnTSl7T7201sqcq7wztWWnUj+LN2P
         RrJ2bO4FEKRh3DlEIaN4Gf2hTPp6WRvXdoRxg8jN1xKzO8bDZGsOSy1hBSkBkfyVeBBW
         4LO5a2aDlDLWwXCz+Wp7x2UcsUuBAWPmnxcRdBQKPswcglzN9ZUJFQH3x2ya9WX+V9u2
         qMMJcNE6tFerAXjwS2uG3aw3bZGe2MscWxVXGDU0ioHZvp+dcWaPlEG5WtmSdPNicJ+I
         EOKg==
X-Forwarded-Encrypted: i=1; AJvYcCXSOdXdw7FBf678swNpI2av4CyJ7RrClsp21NF0AE+W3bk9Yo4t2IR0irANK+elJqwBOuiJy288i/vwe7NTIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlk8eVgvvaiFBSuYG6z4RIaC/gSS8R6nrp2wT369FvtJ9BNfU
	jX1NoRvosJXstCpxNuUdNlOZq3HOsT0NKPwYAvgYfuRKmlEYT3fiL9Dv
X-Gm-Gg: ASbGncsi0L51vmw+hsMsiCzWp69PX6FnIp+GJckD7cCEuW8Y65NqFWb+wOdMJwG+DGz
	PmaSpNuFpK077M2+JPeQk1Ce3s+8GJdueqopwW0Zw5M+R9bzE2afoEsjP1qssCsg5emrZRIvV+v
	rVqSD07TWEvsLLQnixRXfrNKm0FR3fYVHCRbAAqSo8NzNXpAyAcugqvoneS1CFC/461zg9PURxp
	Ox4JUx0L8ONZn0AY9+r8xae56ymX0Jtj1Ovi5B9oDWsWeZIZw+/oYHCx0gtEQuf333ooLtA8/b0
	pvmZP1Ra+fALQjavNd5S+1hoIRzh6dg7eaaM8MxbDxxgwE5fbBIHzK9jCoLXc7pvWSch2XO24Co
	46aueI+h+UGZl/p1HEr1kkb3WyHuz6Mt5GwVsMw==
X-Google-Smtp-Source: AGHT+IGzKbSk+xpeuhcRPxXprhrHKgWgl+TgyFJOpJO1QcWS3vLYIUxy1cm46/h9evTFKRIrqkRaaw==
X-Received: by 2002:a05:6a20:9383:b0:2b0:ff55:f838 with SMTP id adf61e73a8af0-32da83782b4mr14502989637.3.1760351441359;
        Mon, 13 Oct 2025 03:30:41 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d284bsm11467729a91.18.2025.10.13.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:30:40 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	benx.guo@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	si.yanteng@linux.dev,
	tmgross@umich.edu
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
Date: Mon, 13 Oct 2025 10:30:31 +0000
Message-ID: <20251013103037.44979-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
References: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Oct 2025 11:45:39 +0200 Alice Ryhl <aliceryhl@google.com> wrote:
>When posting a new version, you should start a new thread.

>Alice

Thanks, Alice, for the reminder.
I’ll post v3 as a new thread.

Thanks,
Ben Guo
