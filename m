Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BE43E079
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 06:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391539; cv=none; b=Lsm1NfKLTWHL+A365P9P+QvyWbpkmj3iCJrnR5XpUFakSArk89r3nMM44DWPP6vxGw8lnEYJQaWM4zwDkt7lkR0nC76YVDuJ9aZ+j1cbAGiUFmRWRC4naxIL1DdcpqFmuR0II28PL4tWv0PfqdCIgouBlCM0j9nw0iFAQq98XGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391539; c=relaxed/simple;
	bh=vQoNz0Ce/gNWaOLiqERL5PouKfYgfQvE1YqyorNDXck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ncl3lrkQyv/bjhuJa/OgCXDwWU7KwpF/6yyXwiiF/FsbP2CUG8JIc7JuDyvmIH1yGJI/2JYZ4kZjuQDMme1TA07qsNZ3j/VmKxfk6SvsEBjzN3dR2W/uWFpGQlKLmvQjB1swGYaWDgQPcTgAHv8Di9iRgBZbP6RulFucLNP7I3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fl/4n3hm; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fl/4n3hm"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f036b17easo4548747eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 23:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792391537; x=1792996337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sVTFyt0ehCxNII8C4q4P9AG81KWBVgAKbuXetceis3U=;
        b=fl/4n3hm2aaDWDLeebDGOUahBWukBVI9z6iuWeQkGAUOuPyIKqEk0MCmLV9Rg2PXdS
         WhkIKisl6kjVsA1243EGTeWMSGm8ZeJgFyCQeF/WC88XnV3zxYdBZvhhFMUReX3Gh5Wu
         6jds/NkEKI5XXbL0wDGnSw9W+iQO/bA2OtwaIieLj531x/92EXpDPYBQaYD51KIbO+GI
         iurhITq/YXJl79Zp/MA1yyZJoCdQmKRMCWdc6LQQ0MEfSHvRL+xdsI5IaWpu1twbPo9z
         21mhhzynZ/WQsE1jejjmojGotpSXe0RPPinMFATZEqP1YpfqoFLksJTC7zMPsJ+NBvDs
         3DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391537; x=1792996337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVTFyt0ehCxNII8C4q4P9AG81KWBVgAKbuXetceis3U=;
        b=rT0vaGQrWqHRJb+TnDrWkZIKzdYPg2yvz6+zjU1WMjI5PjYoDxjGqJMJjFhMTU7boR
         Fl4wsKOneVvoyIn53OI2TqZhnOGPByw5m1NBUNn/uVPYW21uaG1S3JfjIhnKGoeeIZdR
         Oa/wkF0eKZhjTPEvtRE71p3aE2rgZHrvWSlgyaLzXfPH5TZgibz+dizzivrCUX/i1xaW
         HmTXWquRTt6PNvpJi9J1AXyi5iucpMBjhKvqKfYuXjfk7hPYuZH7Q0zrIbg2NqOO7wnP
         HpocQoG9TDQKFG1ppJLQUsQsjHqJrA1MLUjGetJzH+NfMlluzzzwJyfn2WVHW11XJ4Mc
         9Cew==
X-Forwarded-Encrypted: i=1; AKwUvBw+ZlVyMvgr45C2sxhz21kQOZLlV6T9//gg2G/xWDn1k2GaS/dmjeoLKU4ktWXp5SKOKkPzKmnv6xRY+PNGcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZpXFEvQWEq2UUUti1cFywNSej0yDb7xZoopsVDWPLBdECg5bT
	e/I9IE+v6ghDbN9rz+223KZcxPIMpAm4lfhaD+VYdk9tE24LY4l9lMS68F8T45brMak=
X-Gm-Gg: AYBFou2/HsKIc5wGHU0Yplpni1S1u9oVEEi73DfIHrSqUjhsOwDg5fCn+u8L4XuzHgE
	O0PX0wMwRaBTgBcYd24KErUt1XbFDH6cijqNmKJvDf5huiAzLYDse/VF3QvsZSARpACVClktB46
	KA6aTbt9o0jwLrlMNBrIEouEIbR6Der9L1VFkJg8wW7pqxq6SRAWI+EWh+fiL+Gb6AjhNVX7QcC
	6WU9U6VNG+vCKqR/VOnbp1nd0Uod9zsKeSnyMc7z4ucmYC55hgLooic1fSNlfFBSZrG8dLqUKMW
	PTwjOnk+wmfc/Fd0lvkXfthNs+YCJDGQsIoXzfFNHtWbLHH/urlKYsyRtVXqI6RitZ6BVPJhZh9
	IqYd7HgL1/E8j0K/h6Y67SbSPXgIaUWoeneqY/aaJFgkJn20fz1jDJE03PWqzZ6qER11e+NP2B3
	MQZznfsCt+Poxw/1hli9VQgrNH9uBubc6Cdu20joieJ5RVYPevYsUe5Dg9dXYsxEHRRhnOGdOhk
	sd9+6DskQ0=
X-Received: by 2002:a05:7300:ec97:b0:361:6dc4:d0b2 with SMTP id 5a478bee46e88-3619e54358cmr10879671eec.2.1792391537064;
        Sun, 18 Oct 2026 23:32:17 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm29408499eec.25.2026.10.18.23.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:32:12 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:02:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: cpufreq: fix `undocumented_unsafe_blocks` in
 `PolicyCpu::from_cpu()`
Message-ID: <atW5adUhMhOhjbyh@vireshk-B250M-D3H>
References: <20261018163719.81691-1-ojeda@kernel.org>
 <4600d9d2-9369-4d9e-afe3-b21aa5f0cb2f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4600d9d2-9369-4d9e-afe3-b21aa5f0cb2f@oss.qualcomm.com>

On 19-10-26, 12:13, Zhongqiu Han wrote:
> On 10/19/2026 12:37 AM, Miguel Ojeda wrote:
> > For Rust <= 1.86, Clippy triggers after commit 02c5d7bfa872 ("rust:
> > cpufreq: reject NULL from cpufreq_cpu_get()"):
> > 
> >      warning: unsafe block missing a safety comment
> >         --> rust/kernel/cpufreq.rs:700:26
> >          |
> >      700 |             NonNull::new(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) }).ok_or(ENODEV)?;
> >          |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >          |
> >          = help: consider adding a safety comment on the preceding line
> >          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
> >          = note: requested on the command line with `-W clippy::undocumented-unsafe-blocks`
> > 
> > Thus clean it up.
> > 
> > Fixes: 02c5d7bfa872 ("rust: cpufreq: reject NULL from cpufreq_cpu_get()")
> > Assisted-by: LLM
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> 
> FWIW, splitting it into two statements as you mentioned would read better to
> me.

I agree.

-- 
viresh
