Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76534B691
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227378; cv=pass; b=fEHowzdHir9t0i5V8yNG8ZcMyOisIACbKMmerUx2OiL6eLZWAxA3UcNgnzS+6Qe0QjiZqX7YYjBVcWNrXh69sE79rQ8yvYA8SQ6tJ9KdkoEX0G8eAFq5Y2CZxjtCytOGxa0x8SEAXT2Gd3GerIkSF6XzqWjtb5U474gNjCKTSYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227378; c=relaxed/simple;
	bh=G7HK52tHCK3S/WidEejsVHPNzDjtD9ztNr/RbDRczws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKNQLkU2BpMIqWFfXCFhhh6KP4LWKUwxFjsq8WGiNveyNEEY3zkqjdT1jDRyu04wN+7Tn9ureMB+fdBjvVV0euD2qcx6Z3KsCbFD91eZZ54S5C6/aUhiSJrMk+/vUXckzVjHgHviCPypdGRSYHe1NX6EpP6BK9oNt7QUHzIhlxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY7znkoO; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY7znkoO"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233bc11279so8450c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 09:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770227377; cv=none;
        d=google.com; s=arc-20240605;
        b=AnTdwEJaT6PiOW4UIP0tRd1kC6y4fn2AiT56UyRiTZ9Efe296cCHLN99O3f+Vp9mi9
         VLnvakG/womIodIfuyGVNGa2lweYEVK6HVq6HrveL1MuaiVmNc9hvfaLa0c9BGCxaRUt
         azIXAcuOQkZlyj7XGryA2GB0Lg5I44rSDS25bnZ4x+o8LIomotDfA7WS6Ee0saFr7EZe
         dlUf95h4NS0pgHtUAy82Tv0/HP1pkMDpBi138+5DGrzReSAyAqmN92cBxWKCBL3j1Ddn
         0bsEXUgacSJn3JcUzv/47uITBT0OhDU7cXi7IHI1r3UwErogUPrtblks79XeXxivP4a3
         krdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xDefLCRgV/TQ3JHNjcWIRVQ67vN0JwqCI2ji4ZmQrkk=;
        fh=UUeZHDxu4LDikqkWC0mPPB4yG/4qZLfKxocqt51ZTA0=;
        b=I5sdGjjOjkHjvN1yfoRqhtnmCcdWrqjj47qTySQFZqgVB3WYxRD+SqgCoqcqPdzXSV
         UjYlOps2dPY6Ax67zS1lDEBD1o+HXRYNzCRlRhtgCEuqj7zY91lvL2ppyR8t2ANHOdHs
         Wuyx0ZUZM9myuE6CT74OzEhsYogkrBcmVpNRFgiM6MHgbwCXYRztg7PwJI6Q3BdCxnFs
         5sTyLS5rQxaexK4dgCiM/hhqmv6wg2q1oYpF46VkisP1DnUlK+fCl+K5nKIYArU+/ZVZ
         5gZXih06q6on66deSGynHmpSOceJpbklXTLXu7RL6Btf3YNpnxPTsQOrjLGCKjF1sDed
         eoNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227377; x=1770832177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDefLCRgV/TQ3JHNjcWIRVQ67vN0JwqCI2ji4ZmQrkk=;
        b=XY7znkoOTUiANfjw1QeACCGgwEzlZpfqdOGaEMtLskfEJ0GXvNOtvmTYDRmAE1d4dL
         xgUwEnsnR7G283/SluEsa3rOLtmJr9WrcpTidghyvjYcS8q2FGTG6tccITPM/kYvmO9t
         eCJ9tdbSrl2F2IrUyz2b9vr27oDTg2KQPLYI9cmCyqECKx38ErAvPRDO0UAQxfwp9UGa
         hp+VAJTuKOzEUqpiRobFzy9VBdMjnaprvIJomSp3T1pckc3zVa/WIVUoVEtts8Jfkko1
         2wK04NGPLfqCn0Jy5NCSaR/KTWNeIm2n86NHehZL+6jy97VrtXnLPWMrQiPJsGzQzsNy
         x3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227377; x=1770832177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xDefLCRgV/TQ3JHNjcWIRVQ67vN0JwqCI2ji4ZmQrkk=;
        b=ftSeBQSVlFF4gp7ETmuAvdquqqp7r6bPmsHUMPZv9nNhviAQ331xWk8Q0OsxqvXvfj
         iBifoGjNhPpX1BAKUUIpEMUX5GVqOoqmQNvLlRrLH66joULMZXTrUkx7twEeNef2cI64
         fKRLBkAqfn/mcw7lc7yGKmqiqEvjL8vni3x/StvVyne4qJe/Q7MVsxRTZ2+3eyRen3r0
         kRVdcxBhzG69G/icLi7FU9ACubsOleKFkrMaAxosZIYYTWzySXmRceAfseRHVE28mDKb
         bFRYuv7T8dkIoIXVDa/fc36RkdwOX/kL9d4LkmDZVEq5gQzeXN8LMAXY55sUYQjCruYh
         i9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUNC6NYc/5A+bJsuH7Vr5sl4TEFDvzhTTXHXyXCvrlVsL6vM7d8eRNtxcgTOxwlTWYa+SgMB7v7w8L8iGQ2Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdRSC+XoWPtt8xMriFHK50rMFto0jjdk3IdCot86qA1F5r++M
	do/oKzo4/QYJDb3fytgvU3gtcDdtj4q5ruXw3EwC7YZKobbv7AHvPfennAFbGX3kHPekoO9W2N+
	TdlNNKFwKFGtE8944rfpHQHf2wt8YlpE=
X-Gm-Gg: AZuq6aLsOi9X7CxdJTfbVp8D2qba+7zopjCui3A+NTfupPHW+CrpUSuTZVFrmjclKKN
	JJmCR8PVro8p/5U8TFfohP7ma02vjDZJzkBpQsty9QkORiV1yzkvR/F8EnwtCj8ctUaVsKnBmQK
	jtxtxkmIrfaVe+KuTNj9zKRiWCRciteJY+RYvYF11VLOHbaNgMxEvlEe2Nc8z0i9u5zUUmbr9gF
	hf5xiJTUHIIpwZ+/+4sSkQ0gpj+5y2uzCDwKET2drGd2CCSbXiIu621Vfl2EWxabuDHJ6jLTJlU
	qPSll8mYw6rbiFA09yYF5VbluKhI/jb8tsclcRVHtSJnifHa5LKCin2Bd/GAqVs194UNPGRMcVm
	BUaeS7EvToOxL
X-Received: by 2002:a05:7301:4592:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b8329d7929mr884867eec.7.1770227377226; Wed, 04 Feb 2026
 09:49:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204042417.83903-1-mkchauras@gmail.com>
In-Reply-To: <20260204042417.83903-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 18:49:23 +0100
X-Gm-Features: AZwV_QhpXt59DsIzTmuh2ZPPW6T9uONYBCxBt7FVK2mswJ22l7u_sEZEOBg8s4M
Message-ID: <CANiq72k41tCq7-LccTz2NNpUF-0sOqPvbj-z+Qz0msud3O-3AQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 6:54=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> +    } else if cfg.has("PPC64") {

Can this be done via flags, i.e. avoiding the `target.json`?

We are trying to avoid adding new custom targets, since the idea is to
remove our reliance on `target.json`.

If it is not possible to do it via flags only, then we should talk to
upstream to add the needed flags or perhaps a new built-in target.

Thanks!

(By the way, Michael back in 2021 did the original integration of
ppc64le before Rust was merged into mainline -- he may want to take a
look at this :) I see he is in Cc).

Cheers,
Miguel
