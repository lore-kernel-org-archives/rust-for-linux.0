Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1B2FF678
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759143759; cv=none; b=tfAuGetNWLRHiunOY7N0kjY8ErH9Wtarb1cb7bokUVGz7b7e3eH4ZJ3TwhOUainCMO7B6IKhHqAqLt4pxBwcAREH47xhLd27E2VSHsRXvEY1yuBuWpifQG5gfhVrTh9Qqvn8kaRLKzOLcGCpYAi5f+SK0fnPevdiT5xNNsycVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759143759; c=relaxed/simple;
	bh=GCP8LuYtl1jmZq2NZKQmVEw9gQOGAcyHtezJJOCLTAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smdODoCCcv1DM92v/s3VS8eHR7PaSxTcl6ECM5IRESDEMn3xbcCThGR2DKTpFyYbeKcA+0demczCNGKwGrFLf+73d23bCQ3YF50y9s0bvx4Z1MxsemNjGyr2b/FeBbcGNzw5oFgW7bAoVxRFlI3jVhSMwVEIZedModXCBllmXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTA98byZ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTA98byZ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b54a74f9150so3895624a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759143757; x=1759748557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ArXlIKa0bCAPRpe0CickijlhXS7XHZf7jcmbVv++sWo=;
        b=hTA98byZ22UWb35+btzTO/cP7WX2yWJUQJdqVXOaWI4yfwh3itcySFQZORmWu5BZEE
         mIxzN4NcF2TJHkFs+aXwMBacELqodzwOXFW0UnPLbwl8PFOgZ5RZL9AgUXYh5hEHNPK4
         wY59vZxyerFGgBN9zDbFitnnK0t4Z55jo+9Ou0nIOpr5JeFMa0mvlNFsewyqC8gN6Aht
         xPKlL+u/pkGOtNm4v56I5dYtJkgBxFemFBrR22bJzFF1m0aJ0MqPGZV+g/DKCpdVQGZB
         p7oNzAfJEFMXYzNEy5uoipsB8cjB+0rJIUBtDASZLEHeByK1kGoD3ct6HqwpfH0GQhDa
         gaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759143757; x=1759748557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArXlIKa0bCAPRpe0CickijlhXS7XHZf7jcmbVv++sWo=;
        b=WHKo9MSN6hIH7Jt/6Gs+/qJaul3hFnTz4Kjm3wciDANZFTGcHriVBEmwGRT2hpenGe
         seG+8TSbCCQiq6r7jHO1d7a/wJBgbP/Yrb+BtxrMNRDKL061TX21QX77EzLkJqmiH3KS
         Hs7MS+SA5Vh1ANuU90h7drKs2kF0XyepL08hYaKthvAhw0ECMGYEoiVG4xzR5hjWUmI6
         oxkfXjwr8fSzcuoXlcdxMRMVe2kfuyDIti4uwMH2T98aXJY9TtWmU4FJvVEHT9W4WQ9L
         CR6c30YhX43Zba5S3kBA1FF/4ivBbme2cS4KqUAbXBUsPqnAEZIj+1bFloJFsgRLdxzv
         8wtA==
X-Forwarded-Encrypted: i=1; AJvYcCUKbv/+JKljRIF//z5UiGoxffhzeCjdzdEx1TxkmhclbJ0exD3YQTT7nCJVWVTHaR3dazSQUX5eqv9JBmrwGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ8sFl4X93MmNn/W/xFU6cEF4yFLEFOPOgaxmWlYsb3AA4Y+RU
	E+gEoR8KLx4ceFJjJ5P2e7i1vJV1fOeL0dCTnzlBoKYTX3ws36OZj7DyWvqBXKq3zOA=
X-Gm-Gg: ASbGncuF/4ABuJgD/x90uLGzSIEOUishHNuCN1NndOUet+beLUI8m7B1UoRv1kPXA7C
	ySbJzzFAMYSIUQX3+U1bNMYi+NYWJE+cjyqShXFUHFuTGP/BWjt0kp3m9K9Pa4hNmXmtuBdzaEE
	6M0E8Rg6KFHwmPxfisgkguotPD5dh1GnKmPrYr3+NB4vJz1gw/DqqwGOUqal5YlAjqCvgiRS3+V
	GVZoMniaRyub7ueeZlO+VrGzXjMBSjMnwrjrXPXb92dwLAhfs4f0IU/ZH5236XQP4h/b8va3QJC
	1u13E6q+bx+r7O7ZC0pggeT0J1FD/lI5PGdav+Vlz2tfzbcJxX/ILqF2EsvrPLOrfvC3Uy1wns7
	/thDi4bErIpDv8VYIk6wVjm7K
X-Google-Smtp-Source: AGHT+IFJ8tBd5DbfKm01y+6YhQUicmi46JD7jPOYKxXSxgRsT1oHLX0ubEnEv3SeXFYfJc1oZPUmzA==
X-Received: by 2002:a17:902:c409:b0:269:96db:939 with SMTP id d9443c01a7336-27ed4af3882mr193698795ad.58.1759143757073;
        Mon, 29 Sep 2025 04:02:37 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac274csm124914185ad.134.2025.09.29.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:02:36 -0700 (PDT)
Date: Mon, 29 Sep 2025 16:32:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: cpufreq: streamline find_supply_names
Message-ID: <20250929110234.ukgwsnxyrvsimhst@vireshk-i7>
References: <20250915135954.2329723-2-thorsten.blum@linux.dev>
 <CAH5fLgg0_NBtfVMNBwXOe4BpyUKz_S=v0CiDxyKNYZcS9j7WHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgg0_NBtfVMNBwXOe4BpyUKz_S=v0CiDxyKNYZcS9j7WHw@mail.gmail.com>

On 29-09-25, 11:38, Alice Ryhl wrote:
> This is a pre-existing issue, but ... this treats allocation failure
> and non-existence the same way. That sounds wrong.

What about this over the current patch:

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 224d063c7cec..e509b46b64c7 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -26,13 +26,17 @@ fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
 }

 /// Finds supply name for the CPU from DT.
-fn find_supply_names(dev: &Device, cpu: cpu::CpuId) -> Option<KVec<CString>> {
+fn find_supply_names(dev: &Device, cpu: cpu::CpuId) -> Result<Option<KVec<CString>>> {
     // Try "cpu0" for older DTs, fallback to "cpu".
-    (cpu.as_u32() == 0)
+    let name = (cpu.as_u32() == 0)
         .then(|| find_supply_name_exact(dev, "cpu0"))
         .flatten()
-        .or_else(|| find_supply_name_exact(dev, "cpu"))
-        .and_then(|name| kernel::kvec![name].ok())
+        .or_else(|| find_supply_name_exact(dev, "cpu"));
+
+    Ok(match name {
+        None => None,
+        Some(n) => Some(kernel::kvec![n]?),
+    })
 }

 /// Represents the cpufreq dt device.
@@ -68,7 +72,7 @@ fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {

         mask.set(cpu);

-        let token = find_supply_names(dev, cpu)
+        let token = find_supply_names(dev, cpu)?
             .map(|names| {
                 opp::Config::<Self>::new()
                     .set_regulator_names(names)?

-- 
viresh
