Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D83C3C16
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596607; cv=pass; b=amoJGP45+VQsTsGOuJaNbHU5j1rh6RSTontMFT2Mm7KW+srfX3uSZsD+U7676WHvckyrLcbrTkh1xsVdlGZY6/GjkesmxwamaNxdFPJAo8kFKXsi7SKVRSkwZSMfWIDZHIBeoQAXMIBl1Dbwjc/fBGGXWMgmUqXj03ryeb/l+e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596607; c=relaxed/simple;
	bh=pFAsc46R0JoLDh7te/Ta1pVpV5Swe1QIgUNxO41164w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiWWPhTDTj+aKkqMF7YlpyRAHiUD9ZCBfoOt9uIr9l2DJed8RPnHyuxtseOgF0ejNapyeF4f5Xh/UbuxVCskS076DPTg/MB40qfq3EtwJQDzGTdh0YSdjZ9Zk1+isiyMN/FXSi3T+C4sebJetJfgXWlxQR2xWVuf3bItNOaxYWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLHiSKhK; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLHiSKhK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bda3b4318dso167818eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 00:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774596595; cv=none;
        d=google.com; s=arc-20240605;
        b=jzJnOlcMD02bAJ4xiA4LWr1ORsR3q/9AwqWZtKGhrv2LwaAi2QZbW1zRiDmvPbgOfm
         iAwocUgywgcG2ZOZmkOvppj76jgx+6pRSinOpwI8nQcQHTcA/zaEPUC3slCJJtlwsEDV
         aMNClV+f+ITG8QErpx3vymVQVfMPByUZg/SeURzeAvN5AneU+/pV+cUeF2i8vEjzRWYc
         PTwLFOOXv7Pauq64xCif1a08JNKiQtGwrV8fy+YXtAxcsaN0wtVma6qcp01XCMVo7SnR
         Fq6SgLt3JSQh7NLIEZ7ku54qnAO1kbY0Gno3HTJrQ+zTFpHUMtYRPB+GyVlOHzDZyCKa
         myww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFAsc46R0JoLDh7te/Ta1pVpV5Swe1QIgUNxO41164w=;
        fh=b35ueqZrl339dL/skvha+RtoRjsHdpofXuIbx1Tlui0=;
        b=PLgzhDAg16vUTkvwLJF2w8aonovaFK29lrk1/cQ533YLLIVJ+RgHOZGTFOmZl39ozE
         R6Trgm0m8RWxTqj7IXzYolKF8/061kpCVzZbAq5uyvu3X4K0uvXe5aRRpBB/jh2SrF8f
         DoQgMymByxrlh9oHV0NV/i+aWhX/ZbOgVWROHPuK9TVtlcJdSjZX7yZgGAERVx4PEK09
         HOzOGDWWfJCl0wRCNHAtgbeIfkIhq8s1X7ZrJqj7PTiClz55eGR4tCFXbrqS7uY5hJsh
         X+lXP35ZFrZr/eIGBy2oH85wfbXEXcWGtPX94Y6SJ9rY3cQzY+2R21k07FmvNfj7H0SY
         R50Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774596595; x=1775201395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFAsc46R0JoLDh7te/Ta1pVpV5Swe1QIgUNxO41164w=;
        b=PLHiSKhKHHosRYZ/e0wlAn0k1vE6kKsBkW3+iKC0W+xmIGAISaqydoXCjKC2OxLnkk
         nD8is+FHztxuEQ+VJKM8TLk+qdVSxfxQZMvhNBXnL+78thL72WLiv20NTVDa4FRh/lhR
         CFCImzohxs5CF/Wucvr9YXVlqTeDsAWr7s7IKJyV2NNDKJvdOwWtJbHQkx3DJvHi7Fln
         gDMBGZ7rrmuk8DcKdcMXkwOQve26n9z/V87I75UyaEeQwKz+0RiHGBE7O7r8Lztv5I3a
         r7eDmVl/O3J37sTG5FfsUovK76ji5lj+3L8WvFypfaQ5LKZtV9Gof9ozza9y0pqTa6bQ
         lF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774596595; x=1775201395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFAsc46R0JoLDh7te/Ta1pVpV5Swe1QIgUNxO41164w=;
        b=R8RGHeKcZQRfxHGrODGTR0N3VlvCcb/XQnIiu7+7jzN9cxviAdqK6yb5hGR1d+3s3q
         cPkNzozaKlR9EYzHlT9xlFSdExIyA6j6+bgcf+lPFJHsJ52bArE6xsvZ17dxyD5nqW3r
         LAiP6Wr1NfK10FPit8W9vpK/X9AVE9BC/uVg1vPWSxpWnxGlC8wSxbUZTUXMWPanLr2j
         MQ6JqmTvPHb12RQUTsKRJ2IiLsMbBYQI5Z6qwGggIG+GmKyxhYXt5wAkeryGoYG5EBU3
         zDm6ehYqvpLClPA4zphBJOuo6FUt+x9EE6c2xoLmEfXzsJODrIPrsZjaXPRYAr1twr+R
         sgEg==
X-Forwarded-Encrypted: i=1; AJvYcCWCv6+AOkqsszt22aLOXZ0TFF1dutwnL/A5CZPFqZYTF76oqCBMs/SnhSgGMaQ99bkR32lnqX5cbPVEVhittw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVp+EmHISNWeOcgFxCT7JvNGh1JNoY/csl/XY2K7tNme53KTJd
	UHLEh9AXQzTPLls3Q0idT+H41hGm7V66OhtbJ5eo9ifCOS2VOCuvwx8iBG2h9oAdP4lOuaUwW4S
	5Hpm4/iz93PyLZPbFsmkUqRBvgHyl+Hk=
X-Gm-Gg: ATEYQzy69yRYdfSQGChjbFPxK7uaff9EIjd8BW4QgPxMI0hoSbaa+TU85Dl8gyiquM2
	wxV1qT5Rk/AFd2uRKxvkJJIpCWDpU6ueTXj0Evi7LaiH3YQ9xIUzJ7iVKSqGFpit/yhM9FEDOuh
	jLlLN2ZneqB2kcUXg7zlsuSLqSug0EC1YnN6O4ByKoYk1/JQ04BVsvGtPPIdzovpM5stoUX8vAa
	P+Ss3saAT9u+HJEaW5WfMbGutEi30gtAGWKuoS63QRMHmYFof7f6ZziqVp/T0JDXYH/kTJO0gXq
	hP1TKJDLHv2RdwLVxUPjEb0n1TTMElwOuvQS3uQMCWaW69VqsMhD+2IjZ+w1RGN1fhnYuBtIAE5
	yrLHYQEWmZvfEcnV3Q5UULBw=
X-Received: by 2002:a05:7022:618c:b0:128:d359:92bb with SMTP id
 a92af1059eb24-12ab284aa0cmr350895c88.1.1774596594912; Fri, 27 Mar 2026
 00:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322044340.129985-1-albabhasan276@gmail.com>
In-Reply-To: <20260322044340.129985-1-albabhasan276@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 08:29:42 +0100
X-Gm-Features: AQROBzAeItep2n8ZX34PCafi1GrnT3wX_s9UW7P_UqCR1StWrA3YqONUq7WnTJs
Message-ID: <CANiq72kTaU3xtzFLRdAGMrrSC+oqJip3VsFjg4P0yH6w=5tvtw@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: add SAFETY comments for Pin<KBox<T>>
 impl blocks
To: Albab Hasan <albabhasan276@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2026 at 5:44=E2=80=AFAM Albab Hasan <albabhasan276@gmail.co=
m> wrote:
>
> Replace the placeholder // SAFETY: TODO. comments with proper safety
> descriptions for the two unsafe impl blocks WorkItemPointer and
> RawWorkItem for Pin<KBox<T>>.

Thanks! Cc'ing workqueue.

Cheers,
Miguel
