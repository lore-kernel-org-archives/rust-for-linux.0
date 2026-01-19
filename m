Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC0242D86
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810859; cv=pass; b=o1kaNtqiYMffk4kFO3gs3B+85+DZ/KdkEjtEwW5h20D1QDUE7uruoE2oABlgYG6VBrKBEpsMIWFHwOi2Dd9xU1Jtw6BqvVxqOojNTEJIFlnycImD+KjDBgS77czk2dn/8cwsjYthCLWAK/02XtAvRTtL0dMAp8bimeCJKjI+lXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810859; c=relaxed/simple;
	bh=5BvaM2zTZp6LRXT2gqEqhSNTny0R7bUn7MjFDG5LA8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPxImDvnjnHpoc13W69b+CnFp0hwt6GdYxBguU6+hQVIQeaocEioJboskpK+SK204YrOz7JP027O8MBdrqqp90gfRJ/cWiTABc3FV38/hge3H5oGRudqfqmdg9+1STfBGQh8DR32K7JsZduPmYIeJqQi4qO6GRGZKt0M4LXnRqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft0PIjKb; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft0PIjKb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2a44d954c24so173752eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:20:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768810857; cv=none;
        d=google.com; s=arc-20240605;
        b=SyCQVn64SuzC1WzuEbWqzEs421/I3pJ8XQhHbmFBhb+vMGXhvDRrlNGJHYT2OJhBXs
         WCXNA8ZML7KKQHFsOtOkLsBphTZFbcgGA8/sqPSiiT02iMtH2BhPhWRtytG96fPlLUlS
         4k7Lo6k7E2Noe5NUDuXYhrRj0sgtupMS6csiJV3K13SURV+PDEANicKtWfi4keIYaRNS
         BJ29LbYHC2GF27WbztUwSnxN4KToE9S+qpl7fFPo/jx1GwTeHX4fRgjenvOgCKk6a73n
         1mBg0pbfPnZSdJcDNs2pw/uABLKztAxcFuCYlwk4U0dwb82gTKYlSoQEtMD5hmwipqrs
         KsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BvaM2zTZp6LRXT2gqEqhSNTny0R7bUn7MjFDG5LA8A=;
        fh=6nDvHaGgQPovm2327UIbfkBMLDa495z3NRh7XYc4FfY=;
        b=ePgOEzuoTdfjFmJ1akH8n695XM+1T6SZldWKW+1PCy6dx5Bs1QAu8VICfJOqCk6Jk+
         nY7Cznz9DP6P5jNoKLrsuw5njK4PCbve5vDghhWtK1vtJW3caTwbQRtHfaGoiESXkzYt
         3BWrM0l9Wb0NiuwzHuH0Jpqsv0rE8qSF45bsaUe7ZW2ljI+fuhLMVKp/TVGqwumMo4Ry
         +hPR4FMB4JOmQ3bEd7Fvt2uFjLXivzjg5G7WCPNTIvlW92T7eA7g9JbS8Yv19zKeye0k
         kAnVgwvzB48weJwx9ObvrcQ0/+VHOpTLyU27/GsumJXaN4KpH/Jos7egfx+7TBBFdegT
         2B6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810857; x=1769415657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BvaM2zTZp6LRXT2gqEqhSNTny0R7bUn7MjFDG5LA8A=;
        b=Ft0PIjKbJX1PovTrwAIWhkE8E56u94Se6jQozD969V9wk82aOvhq5h+ZcVSeTMmATX
         mtxqtlTFYTZLhVg9uiS/ICrDvCK4b/NGdVMxs85zbLC/n0fPy26Fh/Kfk/iSIh5uL1DV
         48IcWffrlS8/Dik8s8PLz6/ZP3TgCycMoSuJqdKgmHjthZncrc3bamE6Q+X6bYUj89p6
         B+dfRHmIZzwI40TaQz/WO+RXFxrDXPMC5QTixmfDAaInIpU7A7BhIZ1uPEQVju/tqtcL
         fo469XZw4gHdSW6he/vTaY/I4MzHwmuID0IRt+Ju+E3SuKnq2CYemqR5zwN0i1vR1zeD
         /JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810857; x=1769415657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5BvaM2zTZp6LRXT2gqEqhSNTny0R7bUn7MjFDG5LA8A=;
        b=TgDrNcwWwaSv5BrZ1fjMPblcmzgza5XWdjTwGEUGnQhIWJgpvCTfBIS1uabze1FVyR
         zkoDQCyn0NIkSSt9agNPwGw+ErfaOyUNUM1Nq4csKbU7OJAoT+UXyoe2mUtFm5mLpmMJ
         CNcxBZLCvd+U/E1yq3MDggBXdGyNqOqbIDFQ+7ijBsKOQrd7yzt32XmdfGex5eisSyNZ
         ECp8j3AFXXATNJR5ZDneaRLNDzG+V1McN9yKbuXD4FbQVz/kVaBgG+otZVfl6JHkDsYp
         wjAqVHfAgYrX8IuUf3M2GutDkyQemPchVCT+CSm57SSPJqnhCkyJ9J5I7/k2x1tjRFvF
         97rA==
X-Forwarded-Encrypted: i=1; AJvYcCXzACS6IDRQ1ZRDPwBQJK4jLkulGbhNYmGpbcShsJJdTS1cFvFeXSUD8sdFCM52pOHOZOitx4xsd7fVkHHTZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWR4ZiA5O5I2+wKuBoq3HpaGw1mbMwXntsOMyaihlvzMbtg4S
	VAw4s9y9uD6DlpQVLvK+A2Bf5de56yQwRJI2eueiuyW2e/DBhlccVSCHc6MU+gIjms7h+HZq7kr
	lmZMDK+xjHyxJpe6s38gnSnLbQw4lMZw=
X-Gm-Gg: AY/fxX4mtdfbyCIhoWUPWY5CG/CXmOQcaaB0O/yQpIJ/FexoeJfukP8f7NazLJgZdcr
	6K4RU2GJq/ahkXoy0h2yBWJEc7EIK65D2dFnZ1SXvEiOY1JsxMFpgj9hefeHAgVkg1+f71vrkRn
	Y924OJ1Jw0Z3q89hnJ5HDYRouqDkBuCiv9AOuQhxKa6v2Rz6WqBN+c5H+4atjAqzakpF6UM3MEW
	2stFqzzHCv92RKaCdGRFPpiSir5ffzF4oL1Wc/05hBRJ9bDovuh1sERbB1VU7gc609vReGzW3NF
	h+LkAfBvEBRMsauG5t5ijwKvoOvZnObNOc7W8itNnwOM+6xViFyXI41nVDaQF7CCKqZetONvvnM
	9hK1hYC+NOhbY
X-Received: by 2002:a05:7300:5712:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b6b3ef8367mr4917736eec.2.1768810857205; Mon, 19 Jan 2026
 00:20:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-kunit-v1-1-39d999672f35@gmail.com>
In-Reply-To: <20251222-cstr-kunit-v1-1-39d999672f35@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:20:42 +0100
X-Gm-Features: AZwV_QhMB7zF8Mr9kifw_DFz2eE2ID4lBxi_wpfWg_BlkA7yDGSUKzHqRGH0rl4
Message-ID: <CANiq72mP-42jWuMJyUsdmFuxyLAuyKzGtg01k6JBFK7c9G6=8g@mail.gmail.com>
Subject: Re: [PATCH] rust: kunit: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 1:28=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
