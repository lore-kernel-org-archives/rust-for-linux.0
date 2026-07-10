Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3483FB7C7
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702815; cv=pass; b=djDfwQwh9yezRWKG37Xw54E3wORGJe9IDDnwq+7BbAnHzaWYGm5SZifnsympDFS/1n6l6qiOsOTWEYnbhwSETgtmrntrhSb8MqerAC6JTLBINju+ZlRj3uJsqN4ezLqt4nAymBygEfW80E0tQm6XJ2oTNtIJBTo+1OAY8UUSS1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702815; c=relaxed/simple;
	bh=jYDyQC5noxejHXMcaXIqnvEa/ZDQ8QvkOkZRRR3SPwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTHSdoTvo7M3TXijzk2Qa+l3IZs5bHSLpR/9bxJ9h+as6qA7pEZ8kbuG2GwOYi+699juylr7g6JDLQgkcDiYPAMevU9dYgV+lEdFsdxau76aG/pjjZg+6FBXlbBmO2Dw4UxWHzHJJrcTXBtcoqDUDvxyfZ7yRCtmCUT17+wsCtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kug4WfUC; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kug4WfUC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c988e16bb3so3380255ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 10:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783702814; cv=none;
        d=google.com; s=arc-20260327;
        b=o+F1HtcDhpWmqEAGZg0YmfodDMPkmK6kYMA9Ui4syQmARwPSVQ5sPBwOylIxxjKdrj
         ShPkNrj15Vw76Us1pNtmB2+/odT83qJGZJ/AbYpORGpzr/wxk8sCnbEi9Ndw2YmUrSRw
         OpJZIi2htaP+c9j+NBxsZrmm1y16h1BXEUxoYKeZeUvjqrA8cH+WIvaricChri2fRm+0
         7FalTvV4W7jlFXRBBqEiKIHbxpSSnYLtS/dOKcdWRFglUKSjoXEtrivU8OB4ev2g+1i5
         VAO0z41jpHEjrUY06Uvmuq9WDEOOzEcNOdaij8crgGLAPGYEpdjf/afa0z8JkXZxka+g
         PU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYDyQC5noxejHXMcaXIqnvEa/ZDQ8QvkOkZRRR3SPwE=;
        fh=c5m/n+yRhazBJzEmS8s4KwoztPbIIBU+G1LESA2AO84=;
        b=TD2WZXwUZLNGTjK1CAunHIGOCBIln25CtRMHMxY+TOPfn6uNYD3wB+WzXfeyCLeI4b
         YA/P7988ul4/cLIVAjfw4sAUFj6nR+RjkFc/+sQtRqNdcu6MSY32h8jCVahqTl5V2oC1
         P3jDDQkaGSA5TmfZX2VNfRsd6JTv2mYIxFI9vaHwzS6rnJ811cF5g71FOqCcrlVeMXqS
         ZJv+FsJ1er/uLjdo5d/h4j90vbyCNWCywIN/IoKicx+br8vGQalx7BI2L6WX1+yP26Us
         2TvuB16aoavVpsVTEkokkOzw1VRVoYuvquzjvYLuxyyuVXAVqSYRHX5058RDV1tETPoN
         B+Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702814; x=1784307614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jYDyQC5noxejHXMcaXIqnvEa/ZDQ8QvkOkZRRR3SPwE=;
        b=Kug4WfUC8S9j1KqP70ew0x97rg3wc6lN1bGxVT+0VAPYHXTzU1OAPEKp6TUMB3xjWR
         yIvccfaucyfE9X7dbAelNXHEnMioXdtfRx6NL91Q8eaeTITq6zlwMyufS7weyapUm1E6
         EMAXcq0P4ps0xyrxE58CYCiBqEIjPD82JOpBSc1BMNQ+5HR012IfGy8YPPvVdPX6/ixr
         OaWq1jp0yA0+M9lIvBDegMtjjyFSqPYA55vTqsulq0tTk1N+DSThlQzsfBqRJqeNgFez
         KOrmgEmcaXxvUZOMhNcH1C6wcqDyOuXFmhqo29sGLn8GnEwJ6sqhqYRCoBTDcBOVfE7R
         jgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702814; x=1784307614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYDyQC5noxejHXMcaXIqnvEa/ZDQ8QvkOkZRRR3SPwE=;
        b=JnqBDzXe9oHVEiQt+KzDDh3wYTo3fFdZ05IcItz9k+ZeYGXIG3NzzxFE2N7kOOd4Qf
         J9kWIWNBS6LVNWQeJ8KGSTbG9blf8NJExSoVJenZjQrfKFAZh0/c4caMc2FAIWoNVnbl
         74KoymbH9dstdaFJKBmfX//pQdtF51ojWKDIudw27VoIK1CkuJ7YggnYhhqZvr+c8sVg
         OKaFOLuTY1msggphjnfhHTwvO3bS9vfoNEYmyFdvaKo69wxXebUXZyujSdDUkpdkx8ec
         IgJxwrHb/krF5E5DFA2/n3epRFuFbTw8G0LyvRQ7JeSfHQZsc103GbYg1L/xWChewSPS
         N47A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0/JHf6O5RLoXYWn9dP+v8U5YnyQc4U7AdoS+S2MzWToky2lRfQ+bVo7zj4d7T5kJPsPO2/q+h+l8cawr3eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/fpQAqV0S+AQn0FFhFLBhvXMi+O9iJOHOtLwj+y1dg1XNlo4y
	VCtUySnM8isolxlnxOIopy5PD4g4c5sStpAwXQ1IJNlJuoSmGrOguBp8Cy44B3JaWG0Z2aW68ev
	p8nXXNsybmSeY4ilDogjeXkQcRQxYsRc=
X-Gm-Gg: AfdE7cnW4MoyMMfmLMsLQ9IT9jIRXlofjozqlKpC/9Wct2ftBt1hTm6xVQKYkX2FUQh
	w6KpjHCt4sTwllsupPaVpUKOZ//0bevKRwijdcU6FxrLMTJjkyBHcVQ+ghYhmX4z+g8L92U0P7U
	c5RcUxeBuSRDFf4elMEpmwcECS5gwSCEqOJ8TN3PCybNv6aFXaP0GAswzm5rraoAwQIcd1uOjQ3
	uxZKEH7yn6RWzZ96JMLl9v8oKH2slLIKtI+kosDkWJFRwOYUG9KmOcJYw8wgb8dSPwjgAxSIdhe
	aKJ5s6p1ySxfg5NxDMYzV2BDb5MFPMVJRAAM7In/azAgBc3tzfH//llvhRN/GUrOd32c6qVPv04
	KyW2rt0zzhTRB
X-Received: by 2002:a17:90a:bf17:b0:38d:90c1:2485 with SMTP id
 98e67ed59e1d1-38d90c136bamr1755634a91.5.1783702813717; Fri, 10 Jul 2026
 10:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
 <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com> <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
 <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com> <alEBInX9gD1M5NAr@google.com> <bd1f78bc-51b4-44b7-8e3c-7accc9e173f2@suse.com>
In-Reply-To: <bd1f78bc-51b4-44b7-8e3c-7accc9e173f2@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 19:00:01 +0200
X-Gm-Features: AUfX_myPaEXP4g2vFy2sJpxBrkO4WPpmW7nI-fz77EOc6odI1iQhqhWqVntgnb0
Message-ID: <CANiq72nxK=nCf7C-GQ8JCtaTnOaDGwGDFKoQEVb4fqNonkKn3w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 5:58=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I can't immediately reproduce this issue. I tried with linux-next
> (next-20260710), rustc 1.99.0-nightly (af3d95584 2026-07-09) and
> x86_64_defconfig with Rust enabled. What am I missing? Could you send me
> your config and the produced rust/kernel.o off-list?

I can reproduce it independently of this patch.

It looks like `panic_null_reference_constructed`, added the other day
-- I will send the patch.

Cheers,
Miguel
