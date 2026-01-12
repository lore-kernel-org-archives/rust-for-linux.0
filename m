Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296A3590A2
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224514; cv=pass; b=dTCklHlrsHOxxdnPBrc+oSf8Y8eVWBSy5nO71y22vb6jH33t1Jf8Wp55xOIuPNUBZIRoqGfXWx4y6qXKA5uzDHZ6KxcRShZsMfRUa48KKQYAynNIE+n+skgtaDng8jNGPij4w2//IPft0TI3G/BB8gsN8Y30LvQqinaJjbVSGNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224514; c=relaxed/simple;
	bh=vsacsFfKgjKz1pewRpgRmo8JCCq2apbBkD7p6FF5JxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZtPrRx8rk7hiOqtSIb4hHsuPeTlDYSzfRzCSHonusq0INMmGKlj/StVYKURYlf6bWzFzbZTrkJ2M9wi2+BKqKrM7B8n4G/6CIgPCOqhcmjv+E2NYr2TC+p5AioTTeHy5ZZMeg0+84ys7+H1ooXW4ctUEfj4IkQp+lLu3Mxg9L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5yc5d0H; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5yc5d0H"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ae60247d30so178010eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 05:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768224512; cv=none;
        d=google.com; s=arc-20240605;
        b=FUPDBznCUPbRbBVwV/nY1z/iqbXYqa69d962m5LTzU5L1ZbxJQcPxyVnjnnHtRI7v1
         ZvX4U7S2nAulXNUXOSkA0DUUTCrNGFRwBFf0w+Mr5tyrtSDGM/lIuiDja6sc2wavkItz
         qym0mPFfS+4lSF3GhCqdWfCoJU0c90pNLncV767O/Y9QP8HN8Pf/Ih7fnWqZsz6D0/cx
         8aB9mNYCpciMvVCu43c1+rZIGDAJWnYVTZJhHyLrswALafwG1czuPQcp/6npkNZFKv50
         C67+F2OV91zPmZ2LH/l2cHIVyVUtABgj1ROqxu3aROUqGDV14eA3+pSQB3ZQcLIS1zIC
         Cf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsacsFfKgjKz1pewRpgRmo8JCCq2apbBkD7p6FF5JxQ=;
        fh=8N/fm2RUa0QSCGe+x0iyXcodft2J+hss7/mGtyxrcbU=;
        b=VDt/X20kjPsO8F+QBpkbfRAnIW0ccs2qkigh06I96FOM+WwnSgHv3ZanfHpUYse+Nd
         oA2xRe1bOdoeNtaNIxnWDPJkFTkuZtE/ghLVBu2wmd6qJQ+Ujzr7K2vbApZKnef934hf
         kyP1PZtNYU49ac3MAxr+nI8U1aPVQyue+9SZQq50qOXGLoN1HsXqaofQwoEKS97w5slK
         9RnpX7ROEilpTIqlsnMHe4bhIpfB2sAFtmN/RHTHYbenwPHPdkShGrRhLUgj2w2dp08E
         ExfUkGhW5lmEwJNjigkeupiorXaNO5xHLcjmBexgdbQlDXjC9Qra8W9OcVL4v2zVytzr
         x+0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224512; x=1768829312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsacsFfKgjKz1pewRpgRmo8JCCq2apbBkD7p6FF5JxQ=;
        b=D5yc5d0HWIwHmwQ6WgjLHrUz+Yve6P8QIcWGcZDnL/u6j7s3cgRjMHWtUsShYvOckE
         P8ez7lbkJZdH07mExnReovgnWqDzafo8QSDIgBpd05ZD56ybWp5gGXLt9wjRS10FpPya
         tmR50nF08J5x7mNIZeYTqzwJac2YRcEpmQNXYiGz0KVSPkX2hHU8rVMIeFxi+0Lpb550
         t1rj3cAFa4dbd4jalgb4NvkOi/RaIT3QIiLFIM3BPNuCK/2WOQDrCU4CvEwwQeXHMUcf
         4oNuZpBFjpatOj/peayblxTJuf5gVaR6BZ+oRUmIHZEQBXOaTBSKMtk8UjyzR+jtdzxY
         sIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224512; x=1768829312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vsacsFfKgjKz1pewRpgRmo8JCCq2apbBkD7p6FF5JxQ=;
        b=BLVPK9WW4XTW2hDnr42/eDPykklOadr/9WV09VhXm4WDs06SMfVZJ6h0Zsg/pF/qaI
         8sRIk6ufE5tR+enBoaabdql/4QYplrOEQ9+ZibhGwL7oDSU9Cp4ZHWfmUW5t7K+/D46m
         otBjih1KlckYOev1yvLL1OSr6lH9PZ0pXi/QfCeh6ZGeNxACpzUf8y+4dnfqjyaJcLLz
         NDiiM0z8nPycZlYr2w775i0xtPl12sRm+I9JDgc5NoBQsKivwifleRTrYP1x16Jw2Gi3
         mPWA25ERjVJjI1u0EWZtTC+psE9lIwuadZxIM+7ktrmxedIA0O+7uYWi+NhAPLPF4LDF
         Ulog==
X-Gm-Message-State: AOJu0YxTqNfK9Qqa9eud8TYi1rwOqyioNUUgR5BK/UWYIV9GINQIKfRJ
	dAUqw3azUD/5oOMvijlKtJgwedbalpjRlv+uTrtsj/b439n63a16P+0tiJw/nEH1YVlTHQiCZP8
	uh3/LRgzEWUzkf5SZs1P0Gz2XTfk2los=
X-Gm-Gg: AY/fxX7Bo4enDzp2NLA9sV1agxfC5KkhqM3AWJUkm3YRHRaywu5Aqb7EuSGZ4Ghd+iD
	1firsoWbMQcgm5GrItUbdfj3D17V6i+wXTEG0ToZ3E3JZ6ze3bQ7+LGHvXtpq8u9GJVY71esjZ1
	cL5Otv/b9E6OiBSV7cl3SpajjEuEBGPqyM/C0a/8U8D0PZO2nSygBAuAQEdl4GArQyCpcaE6cxl
	o+on1V7tMCVLjb059bVWPHIKZ0/vRtRovctgvBRjKRuVAY9dkSocOPf9W885vF7orYjYenD0Ezo
	HDRRF9o44CoPUAre4GyEfzBMLhaImr0x2jr79GmBlVYQ+TP7t7zsIT2nNOvojF0+7wiYNhENaeL
	ct74n4zIKvW7A
X-Google-Smtp-Source: AGHT+IEQkeTFMlk+TqJuvR1SwYP5xmgtOoANKi/JdPgCsP+m4Yz82JjbA3+Apt8MCnw1f2slMoyGBRb7u/sNsspQcpI=
X-Received: by 2002:a05:7300:ad08:b0:2ae:593b:2163 with SMTP id
 5a478bee46e88-2b17d2b80d2mr7981795eec.4.1768224512005; Mon, 12 Jan 2026
 05:28:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA7JaUmx4+tqSPSnruQFWAVMd8=b3Gu+v1=wPHJ0JiiN1V84kA@mail.gmail.com>
In-Reply-To: <CAA7JaUmx4+tqSPSnruQFWAVMd8=b3Gu+v1=wPHJ0JiiN1V84kA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Jan 2026 14:28:19 +0100
X-Gm-Features: AZwV_Qg8RgEkDzHlIuiXQem_N3RYHOePYEoSZgAmKK-3fuTY4v345s3im5BBbo4
Message-ID: <CANiq72mxT4HanJvQsSumRuRZiug3EyFmhoa=Wi7JdzhBEQXVuA@mail.gmail.com>
Subject: Re:
To: Wesley B <atticusfinch570@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 10:10=E2=80=AFPM Wesley B <atticusfinch570@gmail.co=
m> wrote:
>
> From 71c099600448cdb639136bb15bdd40767dbfc0fd Mon Sep 17 00:00:00 2001
> From: Wesley Bott <atticusfinch570@gmail.com>
> Date: Sat, 10 Jan 2026 18:26:47 -0700
> Subject: [PATCH] rust: Restore __new INVARIANT comment, updated docs as n=
eeded

These headers should be used to send an email with that subject etc.,
rather than embedding it. I would suggest trying to use `git
send-email` or `b4`.

> Link: https://github.com/Rust-for-Linux/linux/issues/1217
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

The suggestion was to remove a paragraph, not to edit it. Perhaps the
confusion is that the suggestion goes on top of the `rust-fixes`
branch, not mainline.

Thanks!

Cheers,
Miguel
