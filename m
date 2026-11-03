Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704687;
	b=FS3zxhqzuliA2emdPlWRtByyrQPhVfr459sGR1lCln+aVj/ou2LdjyjByAcwCN6/kAUa
	 jMyq9y4vgXi4VMgYhHcjgb9kWMKFs8AAE/6DKR1aXATVQ1laXHopQzDrH7Dr+XuomBvjy
	 6zicpZsKLuZ6PDQS3NT1iXNz6UVeSBKSxdFXlKm9qdq2VWUy8F0JEFlaxaG6EWqU3pX92
	 8FZ6H8ysbd00CizDzUk4CDrx7+6KpUKL9hOpyM2oZbffvd+WJCcsn7diD3F1PL5jwX36K
	 fHAggjIr3mW06EX1ccDqpOkgP4uZcdzLaaXJ1nk2b7GJ9uwura3RNEQzgsMdJDN2Kzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FZiQbDgkssvkTjVg29WwKazZ1h/nhMsybbtxxLOalzo=;
	b=H7O84XGWdlznMujfo+LevMvriCUvDnGJEVGrAZd9c6i4WNzSMj1dSIIUZWudUNViJGLe
	 37TZZZk9xFDJDa32yogSPWfttQEfiV5P0PwnwQZXxlBMIz9ozTa2zlTk1k/bx3k+HUYQG
	 CgiZSvkIcUvcTZSAmqzjuqtuctGYnv1RvHGQnrARFJYvP6gjV0fpGtrUVMASNvII1UAX+
	 rL0rbUg1Y1/utksH6FPOw8dEGxkW4fgQpjRVQxtj0r4hpEHxOZ5S7w0cFHJCvcjCmN0F4
	 ovZtBqbv5/0L/jduxHTU+nqMlwk8k6I8xh/Zd+tC+8DtPjhPDhpgnKoOperjoyQ3rRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPWWH+BY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C3606C5A8
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5C3606C5A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPWWH+BY
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bb5afa736so537700eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704686; cv=none;
        d=google.com; s=arc-20260327;
        b=ZfFv7K4/SotyLFCfUFVM0IafJ2gj8og98fcqxEYPgV7fGh0+AL/AQRNwzB8vx/1VcB
         DYJqfJyCBK4xH6thHai/BKg3KseEQQOd+PJi1fiBrf1fUzBJrd72M9B2FwsQishuuUdF
         bqTX4WlhHNjm9KknP25y5G9Vaiuz5aVlDl5KVcZkyN2uKsKMQfIwOkCOpS0D31nXuiHq
         0b7Lp98F5j8ktWekeAMiHO7LcVp3BJSu0DV6QnCntscSOU+vBpd1l+hJ0FXb8EWz5N/j
         U7QLGh8c8ml3lqxaEIgYuLFIKOksFHtKvs4aWLhvOQC8ZkYo/8vhcxenEwqRsLn8r7ht
         Iz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FZiQbDgkssvkTjVg29WwKazZ1h/nhMsybbtxxLOalzo=;
        fh=P0L4a/6yBKo5Cy9YdJ1/dCzsoxPIy/yyfqBEQFcnAOY=;
        b=Gf2ssp8CVZFmogbq3ZjxPi33pklNqOPBGBo92E4AIsRSegLdmbqI1CmDHyVTAuVh95
         mOnxy6PWdLfFUQ1dCTCPj/89V8Qel28/Y3PJUSgGj6onzOcAU6hdVbkSVd+dUEhG1n7z
         x7Yo0VoJW9ra/qlXj5EdhdnyxwzZeazhhtNSKFsXwICPLqr5WDuGrhZqwE60Y00vp4wc
         z11G92lVu0wd+Jz3dpXq0anF4CLTDLlggEJcaBsRpp8Uw556VSY8xH/M6ckwnzQs1hg6
         kzu5QBmi6rSKIB0iO9SoaLt/3CisMZ3wZRe1/ISj1cIJ5rSeFTWG1pqdQcAcwEPEnGNd
         U4tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704686; x=1794309486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZiQbDgkssvkTjVg29WwKazZ1h/nhMsybbtxxLOalzo=;
        b=VPWWH+BY72313LmmXvmcDysfBV5Cmkde8ggtxhnzXLYj9G8E+BUTkpyj0k3FU8FXRv
         go3PFm866QU/uA2eWpv+AjpJsIpNSaftch4fTC0Bb1r2E3YBc1lTQqAmQEkp/ToiYS3h
         bh3+VR23qD3VZJRYwwRXDRkpijgLis7U7yoodhwAuEdJGiWMd3iWKb382desAb+b0Pw2
         jMcYwqnV6URjWShlor8H1PTS1wPdrhzB8fBSulvB5cxu2Ufd+1OoiqqWEoCjOsDX/dnh
         sybdBN0jnt8cwG+iqd0WLQmjMXwPsd23oxz1DPfoW04/bkuBuyxK/7W/DRhbqP0Lh1MB
         qpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704686; x=1794309486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZiQbDgkssvkTjVg29WwKazZ1h/nhMsybbtxxLOalzo=;
        b=vm0+oHbk6PRtZySvDpzqGNrlDnyugxUMSOcNjKrdPWkxlbwd5BA+9zvAd+mojPZkEX
         Ptsq5Z/yf747g0RCazURzUz+bdm+HlQfveWLMQ33mSDfKwqX8tlnOlGhyL2GuWGcePMB
         XdnA2nLzvqKgnhs0ADf2HRRCDsZbQci2phwUpOg/fDlO5JEOU6YbU/j9nmU59NveXLLs
         hegJBmTsrFW+c4sE/v8gMNLAH6sIScbOlV+EAWNliIo4E/AU5ZqePhhuFeH3XFzguZQ8
         mviznfBDzlIssYuu3eQlRcpW0Ykq3y5aK1dqPQWZNXIUwGW4m8DBDQ0Iyc0VY8l2CCfe
         Ry3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyOnmsR6VnI18V04vX/Bcm/DNNtxVM61oBpgodmSnGgKHA7lnH7ZF/TME0GPOH1nWP9N8He/mGNj9Z6FLPSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z970cFx8lQAqOHdKTRPHLWZ/J5iXn8iMZAVf0BLR066yz8wNt3X
	bPgETSTwsIIHZTN8AAHBsHC0OkVKAEuPsz3QSSnnIMQ5Ac7Rshscw/87Vp3GY0TEY38nspPrEqo
	15/kkkbE32JHKzZhXaP1bfCsjY5SMGTk=
X-Gm-Gg: AYBFou0cyLH03InMLEES2XWsLNIzsiFT1OnrU4JtvtciKLjMIRWwVUGfVPSiFYBKem6
	anaWqAIiUXgZcKafELjxi2mLQejrbDQKe1kWRalwd13zatBgF2bkRCUvRhYbO1XTra9RFDgkLQu
	5QNdJMjSkeGPVqHpXQSd7pjKSHpLL4i3VSC28qDcprzcE/IOL0tkeo+QczA7VWcXad8LdgWdKvM
	mNP5QJdXUXY1vaxPtq2htkCOldlW8Bmry9E8rg5Oq1iTXRrOyIBJJgMct/QkHhHn4zPadxLeq18
	0zRvZ81pPWQ37GC14fRjhkTJrZTiM25s9NCFac3+JBpJ9uWjTJsOROzSMgDxinVQOQXe6pQhvAq
	0hlp63WHa7oIyVEXM4BLXBFbEa9P3v3Qrx147CWR7Rbw8N6lqMlu2meMHDKb37WhzDVKXEoBXj3
	YHdBr95DSRZaHpBzMgt3Oks7/eMOXeITatqA4qBySP9ZELROjxfUzvdaAIzTRZPwqqcDJKY71Yz
	HHOYxj1N5rQaaiuvrDcwETOzLqpxZE18+MF
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a4239cc86mr29066118eec.2.1793704686381; Tue, 03 Nov 2026
 03:18:06 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009224626.1331914-1-tomo@flapping.org> <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
In-Reply-To: <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:17:52 +0100
X-Gm-Features: AclHuK8LCMZ-wSLeipZkHvK5dYa9YBA5HLIWF6d7H_9lhs_ojywfbJ5uWdBbZ94
Message-ID: <CANiq72=EXLcnO2M5HhQf25-Lz0FyfBLSCkM=kPiYGKYuYpgaCA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
To: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:54=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I mention it because the compiler's behavior is quite surprising, to
> be honest (even if it is only within this very special crate), and I
> see in the compiler PR that others were surprised too. In addition,

There is now an issue for it:

  https://github.com/rust-lang/rust/issues/165399

I linked it from our usual `rustc` list.

Cheers,
Miguel
