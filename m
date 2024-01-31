Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011339AC4
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 21:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706736880; cv=none; b=gI8kHxyiN1eSEc1ERyldUojrloM6udjo4XQvua87tDbUOcHa8mk4nd0X5aopOn142EfWyc4jl0ncdUQcrA+hFw5eHy4PkjO6AhcPN76Fy47xApcLeDe9HBt0u4TT9OHnT1dXx8Pef9eWWN/MWpU76xcClHB8EGPYNb7aThsSSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706736880; c=relaxed/simple;
	bh=G6YieH+BboPSXhcnd7QjTO2YlYfZjLUCk3XUw51gh/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/W0zfxA0gNaK5prx9Ap7BVoFwtlioBBTTNKr6ZMwyMlcSzvwLgbp5RL9xyfVzrg43uPTTSOCrxLGxj8NHpaaN/Wb7ooDv+V0G3C35QqLZzeOQhHqd0Mx7+MvUAflvNxARtfXPaudZ5oJdfheVWaS7teplqwvNVMHMp6ckwler4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=aRfu0yQ2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="aRfu0yQ2"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ff7a8b5e61so2485257b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 13:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706736876; x=1707341676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6YieH+BboPSXhcnd7QjTO2YlYfZjLUCk3XUw51gh/o=;
        b=aRfu0yQ2rDk0WDSxtXks2A+IgRZpnhuFKtodQ/d3FzOnyWmbPO/Ptgzr1+ralNHLP5
         NOfQdMurUXkKKahg+rPt+CKCeAIvTedLti2wzU6r9RnlKk0ZDd/aVLY96M+I12U1zDp5
         osW1+lp5Ljale8l/CI7lpONsu4aDSMI+FqLFaBEt9r3xHXeCsu0DQRcORlOiAfYWQs1y
         gFXqypmet4nW5gG6VV2EHySYSbGEJ0EUCJMPe2I+P8HKdd0pHrSZIfa9OILuW2az4Hxs
         isXeAZE1m3lP5ewKpdcXfI13nqIRNey23JG5RldAeFaII+B6cEVyEXVb9t8klmkBEh8Z
         M1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706736876; x=1707341676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6YieH+BboPSXhcnd7QjTO2YlYfZjLUCk3XUw51gh/o=;
        b=vn8vKzazK2Pw+PG8TN9RukIpT9NSuv+jxjOfikqS2Itp6dClsBW2cFZDhLaYc6AcW4
         cvWO39y+8MhxwqV3KQZEoZlxM13AjR9wzfZrFO56qxYvVJpAh1icVGNjVc+joWj5NZQf
         Qmaf0CFqHHkFSOPPDxct217Q4BMDiOYl8eAfYkUuRsZbPfX2ht53bDZ9g8ruXnlipzNM
         RGP/choW4qL5M93Dn6BopolGe6ZeUZhuu7vpGjG0hx71tERcWPYrMPexnMs084A0UX4J
         CDZv4Ivw/voo8UkrSM3tGx3NW0x/z1jwQRp/lXXG8sV6XhTEhAKag3XUxt2haaPg3Uf1
         IyCw==
X-Gm-Message-State: AOJu0YyWv8yKRa77awuPTCiQroMehWK3fe0xwMwGX1fkISklBRBx6JSc
	p2FnsOSVwq0erqGfy0oi6CrP8kjMBfErWsNFMbns//7vm8FcIIG1mm8cYGeUKstZ0hrp4N1gCQN
	0OVxdmqAwpDp5WfyZAyFFfcKlYnfrZMxZrfbOpA==
X-Google-Smtp-Source: AGHT+IFkHZjOjI7WTEzLHEE+Q+CgIDqW/TH13e3Ku0jj4ZL6r1dnLZlaDys64PYkjoTCbE3y3p58qu0XFMFAIsPqHNU=
X-Received: by 2002:a81:8350:0:b0:5ff:63ae:4f56 with SMTP id
 t77-20020a818350000000b005ff63ae4f56mr378170ywf.17.1706736876735; Wed, 31 Jan
 2024 13:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <241c57af61dc03c6f2f6bd90856908fcf84bb71a.camel@redhat.com>
In-Reply-To: <241c57af61dc03c6f2f6bd90856908fcf84bb71a.camel@redhat.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 31 Jan 2024 16:34:26 -0500
Message-ID: <CALNs47uUgLXPdBtqYP7nb1Ggg+K8Ug_kAvRn-5p845tAGCmEkw@mail.gmail.com>
Subject: Re: Intended folder structure for subsystem bindings
To: Philipp Stanner <pstanner@redhat.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>
Cc: rust-for-linux@vger.kernel.org, dakr@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 4:20=E2=80=AFAM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> Hi,
>
> I'm having a look into potentially creating bindings for the PCI
> subsystem.

Not sure what exactly you are looking for but as a starting point,
Tomo has a basic abstraction at [1]. Based on the discussion at that
thread, it sounds like Andreas might be using it for the NVMe driver.

Do you have any specific project in mind? We can probably point you in
the right direction if you need any other abstractions.

- Trevor

[1]: https://github.com/Rust-for-Linux/linux/pull/856

> I was wondering what the Rust infrastructure people had in mind here.
> Should there be one folder per subsystem in rust/bindings?
>
> Thanks,
> P.
>
>
