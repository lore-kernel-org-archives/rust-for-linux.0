Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA1E179BC
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Jan 2025 04:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738213099; cv=none; b=OyTXq+CqrYmKAlxhcMUfFLassx1wUdZ+3KIn6IeaipzARpZmm9AP/jksJNkTBhxY7BiMAKFGbK21vJ/L35Kzg7oq6d6JOVFOHOQ+Nk+OPTPxMdEeRqXSjh/LPQ0xjAp1IgMZjcpqfslQMgvKG3uBAu7qPQ6l2VuSUTPmWL8mJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738213099; c=relaxed/simple;
	bh=MKUSs+HYsIDDz0bOcM/JRSk4kuQYkVAn0CJXFl2q5xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d76kGgFl7Bp9zwhV4VCe3CHdrfDxGXuHCjPJzIrODk2rx5FfQo3C4ZLfuiPDamsyCazcf9WbIOyrwYIdbV/QYi8I3a2dcntNaVfR15pIxIV1un1GadKO49hg3uSJJDW27i1fnxIbcf5esWG/K4ZNw/ebs0BXCtpjUCU1farspWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZ3ptfxc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZ3ptfxc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216426b0865so5804815ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Jan 2025 20:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738213098; x=1738817898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeFAClo/GRnpnoHmOXhQ8WOtII3WuA8AKf+fEiZpfXQ=;
        b=VZ3ptfxcjw/XLwZKVIw4Fvrf+4kv0NvyZeT/jc3W798tSPXya71/DluFWmZBiYvom+
         OQH7+i8SIy6v5pMm+/0E8vC0MDTsb52Y/9t5E5LwSb+4BXCtyaiJLtdiS7r1Bh/d4aPT
         UQ4syvs1pI8R0Z8H7QBopEq5UU6BsjATA+/eXe8jFcHGSntUj7/smrNWi6gvq2wdbpfU
         aqgFLm2NnBA0hUknOZm3OqOvMb+TLHmNhMi8u2hlR6WfZZpXPl/eN+HMktCcyIiSTsBr
         MSGRJfHwiHw5wiAi+gqe8ywTKIgsa0pXj/i+YgammTYrqCeavjKDSA4la9oWq3UwPmix
         oIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738213098; x=1738817898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeFAClo/GRnpnoHmOXhQ8WOtII3WuA8AKf+fEiZpfXQ=;
        b=lMlzxNQlxPw8sWFEXmtBEdkIDru18O55kCdE3F0b+5YPEr+LeT8j+WRN9iadwmh0mq
         yG+WgpPEDZ0TVVAagvPobkAGtAeq0Z4xL9ORb8VzlkSXCh7Egh6c8peSDCUKk+kcKWw5
         kSzVGZrby/9+Sxn3I1dQyhyK7jE559YDToJns7f1JeWsn5ZyMIf78IvBdMvhSXsaA3y3
         WZdYNr79uD65dNgIgbhHcQa9O0zC5f/JuN3UPAJASP3Yg3e+SnAazGSwl7LwdAVCZVM8
         IijcFjenustYHy9rWd6UZWuOUC2lLK/Wqf6cezWxpaGtb4VMaUCBwJ60FP5z97STpIRB
         ZFqA==
X-Forwarded-Encrypted: i=1; AJvYcCVh61lDGzi6eEoSQBELVJiJkHZJJ/3yUpr9HyqJNRGQXt1FxhmIIVuCFat8+QOYz5IPS09iDwn6VoZDVNRiMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqWl1ybtAjk9OzTkemq7IKSmW0X8XXVkEw6FgZ5L7cNFAT/Xv
	Q0mki5r6hYpBuBfPW7lXwJw3smM38UKdLO9EdVqpkrvQk4bsEhAayV+SSIeGXzI=
X-Gm-Gg: ASbGncvgkfzXXRMqfndzcXr1WDrNH035we+baGJ38/jXoU8syqencAL22G8+o8OeWEb
	RnWN1W4CdqzN4xgKuYkISSgrRWPeNC1HPykhrTJwIEeEevGAW8w/ywCZ8nYF+ZzEhOxIGsY1IcR
	0fxUx6j9Hmx+mTtLoB1yNpKG2nnz+4Xjsm3j5phYVV5NJtT7CuEioLIsOYiO0DPdPJ9UwidGCin
	/lF4UhDZHoUSOTiWw3ysCrDbJykX6P0jN9xEinAfmXCkG9NNSMMUB4ZWZxZbxoRSFG/TAcYKFaP
	Hlt3rb7ycKyVjhGt8g==
X-Google-Smtp-Source: AGHT+IFc+mkM3u7DrCjTmTvkjYFQF/552EVImTVoRgjOM4B63d3mf/fH/ik7UoquQ9a318LnCDssxQ==
X-Received: by 2002:a05:6300:44:b0:1ed:7540:45e1 with SMTP id adf61e73a8af0-1ed7a5d54c1mr9431995637.33.1738213097717;
        Wed, 29 Jan 2025 20:58:17 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794bcsm414717a12.51.2025.01.29.20.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 20:58:17 -0800 (PST)
Date: Thu, 30 Jan 2025 10:28:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anisse Astier <anisse@astier.eu>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: macros: enable use of hyphens in module names
Message-ID: <20250130045814.ve2jsdi3wmzdlhbw@vireshk-i7>
References: <20250122131812.466080-1-anisse@astier.eu>
 <20250122133952.501055-1-anisse@astier.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122133952.501055-1-anisse@astier.eu>

On 22-01-25, 14:39, Anisse Astier wrote:
> +    /* Rust does not allow hyphens in identifiers, use underscore instead */
> +    let name_identifier = info.name.replace("-", "_");

With CLIPPY=1 W=1, this gives:

warning: single-character string constant used as pattern
   --> /mnt/ssd/all/work/repos/kernel/linux/rust/macros/module.rs:186:45
    |
186 |     let name_identifier = info.name.replace("-", "_");
    |                                             ^^^ help: consider using a `char`: `'-'`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#single_char_pattern
    = note: `-W clippy::single-char-pattern` implied by `-W clippy::all`
    = help: to override `-W clippy::all` add `#[allow(clippy::single_char_pattern)]`

warning: 1 warning emitted

This fixes it:

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 1eff30d2ca6a..2e740bbdb598 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -183,7 +183,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     let info = ModuleInfo::parse(&mut it);

     /* Rust does not allow hyphens in identifiers, use underscore instead */
-    let name_identifier = info.name.replace("-", "_");
+    let name_identifier = info.name.replace('-', "_");
     let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);


Will include it in my V8 now, unless you have any objections to it.
Thanks.

-- 
viresh
