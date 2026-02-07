Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3D1F0991
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770489977; cv=pass; b=gu4yepyllZHjbYoTOcV0Uibg34oHSU4ldLbV/McHTluQGc5xGMnWo1wUc+KLcZSsK40c1l6LcY0Id8U1ueiVcDwCvPIHsyoZb9YVAfNmjFXLCloKePpKo0jImj+b2m55El0KfVHiCp7EprjgJARzTL2mguRYfdR7YeTGgN1OKbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770489977; c=relaxed/simple;
	bh=Sf3wuUstPZz0sJcQ0+CdDrmfqKmGnrPRDBzks3Y81lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwqpjSFBJtQ5896YCbcDHlfiDFRb4KJNQzaTA/k/71lPJ+UHQ720T9Q6QzrhAP19cbZkpXe/prMQCAxJGKYmrqf6G86fLmPVRxb13ZrdpdbY/lGB+DIb6aXZKZ5WCcKZaSkwsfYVxUn15gg7ujeitzwC9tmdO2ZECRDjSQZKFcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw0EBgQZ; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw0EBgQZ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b836208f23so93832eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 10:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770489976; cv=none;
        d=google.com; s=arc-20240605;
        b=AA3rOpjtwmL87Mq/GDbBWH6CMR8SaC9quUDvwgZq+RKQxEJYPPhzxUW70QnmovL+qI
         5m5eHQuD07eUJDaXewJtZPyJNVGPaW03cguI3CIxKix4vmlTP7DrZISRlV35MqZTrkhO
         lwVNYfx5rDo51hQcXPW0swnQrXXvG9/fKvW48gM/7FRBtcyme7OAvtAZ/BHnF6s1Wmmp
         f6LS9zUBc8A3B9whFBcqdndMW/FAL3Cmjm+6z/oDzfiF8DUPhxXIcQWBaZ9mKNJxA6z7
         58e5D0J7ySZfF6FjVtBWnfF+ubs32X4nqeN1TeMITxE4kTlj6KjM40BqsX8xRYch/64R
         W+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sf3wuUstPZz0sJcQ0+CdDrmfqKmGnrPRDBzks3Y81lI=;
        fh=Vhy/iGPd0wpVNtrtZ25pcDD4R2ynBtjEEXQuVE6+YHc=;
        b=HP/Ox2m1Tddw/qgcPytY/eN+WeamggEpbJshT64R+VFZzPkDdtxNgPnKFp/1qx6grO
         FQYzoFrGjWstrn88l1F/IYEWdmJtEjKzWCe1VMfkm/M0b/CzGCBR5OrOmjlQiGQIPCIT
         NChvdF2bkvbpolBZiXqcNNFt/FHwHk67vTObleyVRU6wLQLbChlLkePc2IJPKVkZFr87
         ZEnRx5pBnwJ0SjSlOs7XasJ2En+h+pJH+WGHwL2WlECqvyZzzGFnNmJfIClCI7kDTNEe
         OzylUO3Bd3KiW8S/BGF2DzWKepM05rTdukYUgI7ObwVD5vFUMPf/J3bl4OBcNldOtFBi
         tkOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770489976; x=1771094776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf3wuUstPZz0sJcQ0+CdDrmfqKmGnrPRDBzks3Y81lI=;
        b=Bw0EBgQZ8cYfP7zLHifIkc7HDRAq45ORIzez2tTSAHypro5FGuUrTw8kN32jWgzzzW
         fh9AfMuJryvoaKnoOIcmvF7xUOCEA6GnMKWsY1hVYhgxaaXpjhf7kT1NjKZGyPmRK4Pk
         zaYORQT3Rs3mOsqDLRRSlCzmdn6zfzZ/A7qIBTXr42ONRVgScOLcMBkwYrCyOqW0ccBu
         BwKmm/thyHlwUH9rlx8P08UNFdIjevQOTWSgK+gMRhEBHoXkrZxF63i2z/NJ7i2Ee2mN
         AgpDQaUlWOjo1bUvH0WmngzRvqfHZHo7yz9P6Ke6fwb5TSF0wwzmoFre08E4b3LXDffX
         tzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770489976; x=1771094776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sf3wuUstPZz0sJcQ0+CdDrmfqKmGnrPRDBzks3Y81lI=;
        b=jW2m/K/E2RttKT09FrlBfUDRhf1gye1NH9OMOBxkrMQdy4RHcTzU1zfHyWz/3t7VfO
         WN4KiDSZmwJcJWY36wHuL+IO03CFHlDPTZV+g5/V03pC+m+l95gVeYVJirMPt3lZaGla
         n1cu3Z7Rs7av+RreB3BOw3Ov0m97DB/MOYN4xIyPpTMHbwMhqM4JzF31kLJt5AagO9Oq
         D0RIc2Fcl2IlvfG7Hm2vorgn23Yv6CypaJEQeCAcIKFufPMn2JYNHzMUT4FYobzwnpkI
         7LeNuLgFMFvpvdSQ93ULIVVaClnugzUWGR1zh/08/P8WcgJkyrsUuEPuAGyx6xb54oCX
         lvMA==
X-Forwarded-Encrypted: i=1; AJvYcCUTtnryvrlsFpzTGn1b75QBEIQ92qStnBoEEXZZkSXl295bW2pA40CSoSenfdT2KakbDSI9BYD9ipnBztomxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHf5cHwTU+XwOKoG2Hxd0Tm/aRlXWbT+IrjTGiDonR6C6BBFsi
	a4cwuEAD9gh22UCeQj3FxqejHA6JGZCKn6PgcM1u3/iEbdt+/4WMjHFwsYepWGvaHVysK4Zo/E8
	wiyu/q/X2hVTxmFDfyJzVBrB0wtstwBk=
X-Gm-Gg: AZuq6aIjgEsdlY1TnFleTX/3Js+cmRHIHSc9QiSz2ZP0dFpRBk/fkVO3VNvcvtiAR1d
	GQvhZW3AHUDsEcWQFi6HicFgJQ+nmRBO+wm9lRTIywcyMgoGMMhP0XcQxCno/lFw96+zolww0X7
	2d0ZUDV5c6P91VnT0Rw73Y9WdyM9RHxnhQZPI2eG3xow5SW44XlhP5sNT55twVtSqqHyGC506LP
	78z1i6ZYplUqERqYwc/o4w7aiupL869tYxV56HZgWRWvQ+YUMKXBExRrCj9dX3dcR2IHYshniQB
	ymvJRmM0kV33N3YnZyf5JMkKc+p1KQXB1KPQW1TzkJaVyRokq2bA9dqBBXA8udxH0OoDAkDkK3n
	Qj5TxjBq/dZeB
X-Received: by 2002:a05:693c:3117:b0:2b7:2f29:64a7 with SMTP id
 5a478bee46e88-2b856400b99mr1561623eec.2.1770489975852; Sat, 07 Feb 2026
 10:46:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72n+C1xU43ZjiAE35rx-NHWAOZyNHK0_kuYAGCpo4BkU_g@mail.gmail.com>
 <20260207165305.129822-1-jason.kei.hall@gmail.com>
In-Reply-To: <20260207165305.129822-1-jason.kei.hall@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Feb 2026 19:46:03 +0100
X-Gm-Features: AZwV_QhoOcrF6Ugjjl3IIhndtEGN6nb50aX_1Pt_9cs91HDJF4Vv9C9D4pCJaPE
Message-ID: <CANiq72kXaFkL34g0V3isOp39VqfN5Oaj9O_A0o1ipERFWhWi2w@mail.gmail.com>
Subject: Re: [PATCH v7] scripts: checkpatch: move Rust-specific lints to
 separate file
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: Joe Perches <joe@perches.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 5:53=E2=80=AFPM Jason Hall <jason.kei.hall@gmail.com=
> wrote:
>
> Create scripts/rust_checkpatch.pl for Rust-specific linting logic.
> Add a conditional loading hook in scripts/checkpatch.pl to call it.
> This will allow Rust linting logic to be maintained independently.
>
> Add a new entry to the MAINTAINERS file to track this new file.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

This is better, and perhaps the maintainers decide to take it on its
own, but what I meant by splitting in 2 patches before was that this
should be a series of 2 patches. The first would be this one, and the
second would add the lint. Otherwise, the first one doesn't really do
much, since there would be no lint yet.

https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch=
-format
explain a bit how patch series work.

In addition, you are still not Cc'ing all the maintainers and
reviewers. Please do so by Cc'ing them -- the addresses are in
`MAINTAINERS` file, and you should look at the "RUST" and "CHECKPATCH"
entries.

Thanks!

Cheers,
Miguel
