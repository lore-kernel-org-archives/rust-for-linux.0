Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BAE383
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495184; cv=none; b=E5GGxyDLarV77vgLo9LB0poijV+wxRk7aj9a6H5K3ksdS2j0XgqFpNktf/0VlGmdRb4bwVR7o5sqsI1r9sTFjY9QYlUQPMthi8XXMJbOZoWvoFnmCQe0cLoTKZxdxKCLkwCCCYUtihqkbWdX/jKw77h33g1WPR0gLC1YXWJAI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495184; c=relaxed/simple;
	bh=tKqVlHmpfXGvqxbTPuKG2EQSAwPdMyT6wVMimvYvW9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hdJJeB1Al5yyqABsl0piW3vsrcLqfwiC3JOh0kgvS3qB0HSAp9pLTOFvB2l6N5gaab7K34vXD9lRnSIvmUkppePV+s4guETnj2klCLtIYuRARUP/2st0JuYCjzE12wht0ZPbUJEyTYXnk/Ms63zzDNLgo2FOBtfKhHU7kbyF+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NFm07lVN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NFm07lVN"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so415973f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495181; x=1746099981; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pv3qTtqvksyrvZvDhY9gIkkVdBN4Bt/kZWJLa3Dx0M0=;
        b=NFm07lVNYCgUCR/72s02TO+ipBS7gcN03UCQ45Q3vqTq92+0gUdMq7c4rUO890Mmbr
         L2PDa2ZTUoFR3fQQgKRKOWaGSL7lBaGxlVSvVcfU0WsFOYjpEQp2QPZmLn682iQAFgu2
         LopYiQYbII9yKl4DnAkzH7h5AIkeeOecrj9yYq8obV9NF6z2o/TH7uKEAThcmsYtKiy/
         Puu534c8CK22SILDL+JDtUa3JUomqcr5Vl8awELShKFOLlrKSTT0Pb15KuZueUd+Fro2
         EdcoHcjT5Fiw2fUqvucql2G7KIZSnTl5BGvv0QfWV2uWaSynCIgqeWB7eLhgBb+VZL4i
         RrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495181; x=1746099981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pv3qTtqvksyrvZvDhY9gIkkVdBN4Bt/kZWJLa3Dx0M0=;
        b=CMDYpTXkj8B7eF+RjjvR81KA/yvqRQv5UxA0xEgjiA6X8ZTVJR/LNV6Ndnlv5Ce/Ic
         J2ok+Ppvcotc1WwZCfXOct7MlzRe6BCKPwTtgpwzae/UAuEvpwdsBfVpJkbhJeXUTu2j
         cTW+T52+6VQA0i5chIs6xK4ZJuW5ryStCOmIG1wFJS100ogIaKAkRvYfYLuN8/DfLuK/
         YOpH93G0vBB4lKPPVhHTeumLdNUGrAK844ord71h5ZxHkyZ0DXuGmOOYY629ncQUDi6C
         adpXstZYw+/v4MlrV/Jxf8BvLoIsryUGzm83g7y+7SejLF4+ls9nHXY6UjB2KIJMr0bw
         hnZw==
X-Forwarded-Encrypted: i=1; AJvYcCXDILa/9tSxTKq7fSBI/L+waf0Y5erdvDDx4G9Pk7Dlf81XBgzw3wNJ/FYqhGcaZBRMd0HuzXGuQS+Hs/127A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrPyHj2OWGJN5i6MMOjZw/aN+bTyHIo4sQltjdrR0qKKaWYFD
	CO8G50U1oYKWZOBTJ5si4AdLXuAE+FHNnpR7oDtB5iuDyjKi1QbNAeDaGJG5LZ0VPDoaZ3R3Bz2
	GhMwqlqYagi5jxw==
X-Google-Smtp-Source: AGHT+IEYYz0+FRELarcqfnvIPpsiCWUeTdBrsBlupLd2xdONltEuQe0B3Z6DNSOQsFEQyXE6MMBDv4/Sy6DgyNo=
X-Received: from wrbfu20.prod.google.com ([2002:a05:6000:25f4:b0:38f:40d1:831b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47ab:0:b0:39c:1257:ccae with SMTP id ffacd0b85a97d-3a06cfabb6dmr2040072f8f.57.1745495181128;
 Thu, 24 Apr 2025 04:46:21 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:46:19 +0000
In-Reply-To: <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-5-deff5eea568a@google.com> <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
Message-ID: <aAokixHVo5YjazmL@google.com>
Subject: Re: [PATCH v3 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 02:14:11PM +0200, Danilo Krummrich wrote:
> On 4/22/25 11:52 AM, Alice Ryhl wrote:
> > Unfortunately this can't be a kunit test because it uses the upstream
> > Rust implementation of Vec::retain as a comparison, which we can't call
> > from a kunit test.
> 
> Would it work from the rusttest target? We can use our kernel Vec type from
> there, but I don't remember if we still can use std Vec from there.

My guess is no, but I don't know for sure.

Alice
