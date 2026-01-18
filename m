Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB833280332
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729038; cv=none; b=rTywbWCqx8lNxskHY+CNv4JDN/2SEjI5RPkeJj4Q+ZfDEL1IQOisvgYOkQHP3sNoptCdJF8LWrIfg0ggz3zWnzTfwGPxmhWstnBk13+g4q0yY9PPO5M4IxD/gP0S2QgIskhnyBPbWAY3GO5qWYgSLMVF6SjtHQ1EZ1ZbA5MUTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729038; c=relaxed/simple;
	bh=dBoxj9nBj23anAoOYNhu8i4sW78L65pVmBQM+bIdaSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WERFSi5ED4BOXmZvlMDtf7p+C5i5iaUhlZNujTM2btX53TfiwXtbfvmezFi/FhfY7qG6VvTA6yoygVSJQaYUZqQe6GKWec11Moeqw0wzDpcFTd2CI0N1kueC3yGQjewWCpQwLMgXex9SCzAb5rUyHsxydgQvBj0H1AgfDc6WxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8Vp0Vuo; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8Vp0Vuo"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so25949495e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 01:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768729034; x=1769333834; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju1+XQC2ZPS3QAfDSxBCfWKu5AS8wPZiPApknbHzui4=;
        b=h8Vp0Vuo9T17Sd5ZEqvGCoMwQrqSjy/T3g2B97wh4xXTgrnz7gPezZcOPiPbQa8ah3
         b8akpGA1fTK7tWHlARYzBdBEsClT6NwkCrhcCBwIcWDFvN6usRms2C2b2GfQHxd4rdq/
         86j6A+lrpvuT2sIjAs9g/c22WbAHeBIjE5ckjJuGbFjhRHsAwhDuRq6PzRh1dmgk6B/a
         GfkM9NfsI6nn6SXky7HWxMyrv6sqYYHnaBdvaXzdv4XwDht94p8zI6C9P570y5Vpk7W7
         f8EdiBq74+MuUQvjVhO3XRoS4MTFfFMZ/PsXsCef36FsgcYI76Rn8zBbIkzrqyrhERWk
         g6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768729034; x=1769333834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju1+XQC2ZPS3QAfDSxBCfWKu5AS8wPZiPApknbHzui4=;
        b=B/4x+ZBHfch4wLn7d2SfKoH0ERdlvEAnrYGB+0irHvVweUzRuWwoxVdXu9EqelH0Id
         7pxJhTZY2epOdnz5g84XkOn75IQcR1lEkEzGOXAWZ/kpH6tq88S3MBiLlrCBUY8+liFA
         NWHfkOsPcy2fNb59XyNFn/YCzcfCJTS61qudCD0kT3Stxe50jmVooQCwJFvplAwOhvrP
         7zHOOsR5jv+hkEai72epNF3aFuEa63/HHW9CZTnDNR7e3BX8CocV3ki3FwDI9NPKYtJl
         DVz5xskAtpGZLcv7FvJv59x2U9s4czOdPibWQAmr/KOq1alYRgqpNcQ2WC0WVz3DwYU7
         fYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTaXtG8ArHu7d52EKPFrBIa5X6sG8AVOKixU0UddqoCAaPbNmCKeSbSnhcH75uDtPY/DxYGt9qnTkEywXycg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1eoAU0pa1zi2JkJ04ohasi370uARQ41gyP+jzz0HGdzFMrcT
	W+p/lvT8XocRBWHSLHDpmdQl4B6PY9Q+VxNsOqjtRThQcaa0nR68WwXlJyRI5C8VgsPLt6lLtJa
	FafRs5/lHedKp1/eJ8g==
X-Received: from wmbgx18.prod.google.com ([2002:a05:600c:8592:b0:477:5a4b:d57f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6388:b0:480:1c10:5633 with SMTP id 5b1f17b1804b1-4801eb10a70mr96487575e9.26.1768729034301;
 Sun, 18 Jan 2026 01:37:14 -0800 (PST)
Date: Sun, 18 Jan 2026 09:37:13 +0000
In-Reply-To: <20260117162242.950194-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260117162242.950194-1-jason.kei.hall@gmail.com>
Message-ID: <aWypyfjbV908Lgsw@google.com>
Subject: Re: [PATCH rust-next] rust: binder: refactor context management to
 use KVVec
From: Alice Ryhl <aliceryhl@google.com>
To: jkhall81 <jason.kei.hall@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Jan 17, 2026 at 09:22:42AM -0700, jkhall81 wrote:
> Replace the intrusive linked list management in context.rs with KVVec.
> This modernization simplifies the ownership model by using standard
> Arc-based tracking and moves away from manual unsafe list removals.
> 
> The refactor improves memory safety by leveraging Rust's contiguous
> collection types while maintaining proper error propagation for
> allocation failures during process registration.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/rust-for-linux/linux/issues/1215
> Signed-off-by: jkhall81 <jason.kei.hall@gmail.com>

This could cc the rust for linux list:
rust-for-linux@vger.kernel.org

Alice
